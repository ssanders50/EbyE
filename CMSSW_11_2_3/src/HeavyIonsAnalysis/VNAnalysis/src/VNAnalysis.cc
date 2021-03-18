// system include files
#include <memory>

// user include files
#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/EDAnalyzer.h"

#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/EventSetup.h"
#include "FWCore/Framework/interface/MakerMacros.h"

#include "FWCore/ParameterSet/interface/ParameterSet.h"
#include "Math/Vector3D.h"

#include "DataFormats/Common/interface/Handle.h"
#include "FWCore/Framework/interface/ESHandle.h"
#include "DataFormats/CaloTowers/interface/CaloTowerCollection.h"
#include "DataFormats/CastorReco/interface/CastorTower.h"

#include "DataFormats/HeavyIonEvent/interface/Centrality.h"
#include "DataFormats/TrackReco/interface/TrackFwd.h"
#include "DataFormats/TrackReco/interface/Track.h"
#include "DataFormats/HeavyIonEvent/interface/EvtPlane.h"
#include "DataFormats/VertexReco/interface/Vertex.h"
#include "DataFormats/VertexReco/interface/VertexFwd.h"

#include "FWCore/ServiceRegistry/interface/Service.h"
#include "CommonTools/UtilAlgos/interface/TFileService.h"
#include "CondFormats/DataRecord/interface/HeavyIonRPRcd.h"
#include "CondFormats/DataRecord/interface/HeavyIonRcd.h"
#include "CondFormats/HIObjects/interface/CentralityTable.h"
#include "CondFormats/HIObjects/interface/RPFlatParams.h"
#include "DataFormats/RecoCandidate/interface/RecoChargedCandidate.h"
#include "DataFormats/RecoCandidate/interface/RecoChargedCandidateFwd.h"
#include "DataFormats/Math/interface/Point3D.h"
#include "DataFormats/Common/interface/RefProd.h"
#include "DataFormats/Common/interface/Ref.h"
#include "DataFormats/Common/interface/RefVector.h"
#include "FWCore/Framework/interface/ESWatcher.h"

#include "TF1.h"
#include "TFile.h"
#include "TH1.h"
#include "TH1I.h"
#include "TH2D.h"
#include "TH2F.h"
#include "TMath.h"
#include "TROOT.h"
#include "TRandom.h"
#include "TTree.h"
#include <cstdlib>
#include <ctime>

#include <vector>
using std::rand;
using std::vector;
using namespace std;
#include "RecoHI/HiEvtPlaneAlgos/interface/HiEvtPlaneFlatten.h"
#include "RecoHI/HiEvtPlaneAlgos/interface/HiEvtPlaneList.h"
#include "RecoHI/HiEvtPlaneAlgos/interface/LoadEPDB.h"
#include "HeavyIonsAnalysis/VNAnalysis/interface/TrackEfficiency.h"
using namespace hi;
using namespace reco;
using namespace edm;

static const int netabins = 8;
static const double etabins[]={ -1.6, -1.2, -0.8, -0.4, 0, 0.4,  0.8, 1.2, 1.6};
static const int ncentbins = 14;
static const  double centbins[]={0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 60, 70, 80, 100};

static const int nptbins = 15;
static const double ptbins[]={0.3, 0.4, 0.5, 0.6, 0.8, 1.0, 1.25, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 5.0, 6.0, 12.0};
static const double ptbinsMin[]={0.3, 0.4, 0.5, 0.6, 0.8, 1.0, 1.25, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 5.0, 0.3};
static const double ptbinsMax[]={0.4, 0.5, 0.6, 0.8, 1.0,1.25, 1.50, 2.0, 2.5, 3.0, 3.5, 4.0, 5.0, 6.0, 3.0};     
//
// class declaration
//

class VNAnalysis : public edm::EDAnalyzer {
public:
  explicit VNAnalysis(const edm::ParameterSet&);
  ~VNAnalysis() override;

private:
  void beginJob() override;
  void analyze(const edm::Event&, const edm::EventSetup&) override;
  void endJob() override;
  // ----------member data ---------------------------
  TrackEfficiency *teff;
  int eporder_;

  unsigned int runno_;
  edm::InputTag inputPlanesTag_;
  std::string centralityVariable_;
  edm::InputTag centralityBinTag_;
  edm::InputTag vertexTag_;
  edm::InputTag trackTag_;
  std::string effTable_;
  double minvtx_;
  double maxvtx_;
  int flatnvtxbins_;
  double flatminvtx_;
  double flatdelvtx_;
  int FlatOrder_;
  int NumFlatBins_;
  int CentBinCompression_;
  double caloCentRef_;
  double caloCentRefWidth_;
  std::string centralityMC_;

  int bin;
  int cbin;
  double flatmaxvtx_;
  edm::Service<TFileService> fs;
  edm::ESWatcher<HeavyIonRcd> hiWatcher;
  edm::ESWatcher<HeavyIonRPRcd> hirpWatcher;

  edm::EDGetTokenT<int> centralityBinToken;

  std::string centralityLabel_;
  edm::InputTag centralityTag_;
  edm::EDGetTokenT<reco::Centrality> centralityToken;
  edm::Handle<reco::Centrality> centrality_;

  edm::Handle<int> cbin_;

  edm::EDGetTokenT<std::vector<reco::Vertex>> vertexToken;
  edm::Handle<VertexCollection> vertexCollection_;
  edm::Handle<std::vector<reco::Vertex>> vertex_;

  edm::EDGetTokenT<std::vector<reco::Track>> trackToken;
  edm::Handle<reco::TrackCollection> trackCollection_;

  edm::EDGetTokenT<reco::EvtPlaneCollection> inputPlanesToken;
  edm::Handle<reco::EvtPlaneCollection> inputPlanes_;

  int nCentBins_;
  //TFile *  frecenter;
  int vs_sell;  // vertex collection size
  float vzr_sell;
  float vzErr_sell;
  TH1D* centCuts;
  TH1D* ptCuts;
  TH1D* hcent;
  TH1D* hcentbins;
  TH1D* hvtx;
  TH1D* hvtx20;
  TH2D* hv2obs[ncentbins];
  TH1D* hv2res;
  TH1D* hv2resCnt;
  TH2D* hv2obsCnt[ncentbins];
  TH2D* hv2obsWgt[ncentbins];
  TH2D* hPhiEta[ncentbins];
  TH2D * angeffcorr[ncentbins]={0};
  TH1D* hpt[ncentbins];
  TH1D* hptw[ncentbins];
  double centval;
  double vertex;
  double angran;  
  int noff;
  int caloCentRefMinBin_;
  int caloCentRefMaxBin_;
  Double_t epang[NumEPNames];
  Double_t epsin[NumEPNames];
  Double_t epcos[NumEPNames];

  Double_t epang_orig[NumEPNames];
  Double_t epsin_orig[NumEPNames];
  Double_t epcos_orig[NumEPNames];

  Double_t epang_RecenterOnly[NumEPNames];
  Double_t epsin_RecenterOnly[NumEPNames];
  Double_t epcos_RecenterOnly[NumEPNames];

  Double_t epang_NoWgt[NumEPNames];
  Double_t epsin_NoWgt[NumEPNames];
  Double_t epcos_NoWgt[NumEPNames];

  Double_t sumw[NumEPNames];
  Double_t sumw2[NumEPNames];

  Double_t qx[NumEPNames];
  Double_t qy[NumEPNames];
  Double_t q[NumEPNames];
  Double_t vn[NumEPNames];
  Double_t epmult[NumEPNames];

  Double_t rescor[NumEPNames];

  string rpnames[NumEPNames];
  TH1D* PsiRaw[NumEPNames];
  TH1D* Psi[NumEPNames];
  TH2D* FlatVsRaw[NumEPNames];
  TH2D * hsumx;
  TH2D * hsumy;
  TH2D * hsumc;
  TH2D * hsumw;
  TH2D * hpheta;
  TTree* tree;
  TRandom * ran;
  HiEvtPlaneFlatten* flat[NumEPNames];
  bool loadDB_;
  bool FirstEvent_;

};

//
// constructors and destructor
//
VNAnalysis::VNAnalysis(const edm::ParameterSet& iConfig)
    : runno_(0),
      inputPlanesTag_(iConfig.getParameter<edm::InputTag>("inputPlanesTag")),
      centralityVariable_(iConfig.getParameter<std::string>("centralityVariable")),
      centralityBinTag_(iConfig.getParameter<edm::InputTag>("centralityBinTag")),
      vertexTag_(iConfig.getParameter<edm::InputTag>("vertexTag")),
      trackTag_(iConfig.getParameter<edm::InputTag>("trackTag")),
      effTable_(iConfig.getParameter<std::string>("effTable")),
      minvtx_(iConfig.getParameter<double>("minvtx")),
      maxvtx_(iConfig.getParameter<double>("maxvtx")),
      flatnvtxbins_(iConfig.getParameter<int>("flatnvtxbins")),
      flatminvtx_(iConfig.getParameter<double>("flatminvtx")),
      flatdelvtx_(iConfig.getParameter<double>("flatdelvtx")),
      FlatOrder_(iConfig.getParameter<int>("FlatOrder")),
      NumFlatBins_(iConfig.getParameter<int>("NumFlatBins")),
      CentBinCompression_(iConfig.getParameter<int>("CentBinCompression")),
      caloCentRef_(iConfig.getParameter<double>("caloCentRef")),
      caloCentRefWidth_(iConfig.getParameter<double>("caloCentRefWidth"))

{
  loadDB_ = kTRUE;
  FirstEvent_ = kTRUE;
  ran = new TRandom();
  inputPlanesToken = consumes<reco::EvtPlaneCollection>(inputPlanesTag_);
  if (iConfig.exists("nonDefaultGlauberModel")) {
    centralityMC_ = iConfig.getParameter<std::string>("nonDefaultGlauberModel");
  }
  std::cout<<"effTable: "<<effTable_.data()<<std::endl;
  teff = 0;
  if(effTable_!="NULL") teff = new TrackEfficiency(effTable_.data());

  centCuts = new TH1D("centCuts","centCuts",ncentbins,centbins);
  ptCuts = new TH1D("ptCuts","ptCuts",nptbins,ptbins);
  hv2res = fs->make<TH1D>("v2res","v2res",ncentbins,centbins);
  hv2resCnt = fs->make<TH1D>("v2resCnt","v2resCnt",ncentbins,centbins);
  TFile * fangeff = new TFile("angeffcorr.root","read");
  for(int i = 0; i<ncentbins; i++) {
	  TFileDirectory centsub = fs->mkdir(Form("%d_%d",(int)centbins[i],(int)centbins[i+1]));
	  hv2obs[i] = centsub.make<TH2D>(Form("v2obs_%d_%d",(int)centbins[i],(int)centbins[i+1]),Form("v2obs_%d_%d",(int)centbins[i],(int)centbins[i+1]),nptbins,ptbins,netabins,etabins);
	  hv2obsCnt[i] = centsub.make<TH2D>(Form("v2obsCnt_%d_%d",(int)centbins[i],(int)centbins[i+1]),Form("v2obsCnt_%d_%d",(int)centbins[i],(int)centbins[i+1]),nptbins,ptbins,netabins,etabins);
	  hv2obsWgt[i] = centsub.make<TH2D>(Form("v2obsWgt_%d_%d",(int)centbins[i],(int)centbins[i+1]),Form("v2obsWgt_%d_%d",(int)centbins[i],(int)centbins[i+1]),nptbins,ptbins,netabins,etabins);
	  hPhiEta[i] =   centsub.make<TH2D>(Form("PhiEta_%d_%d",  (int)centbins[i],(int)centbins[i+1]),Form("PhiEta_%d_%d",(int)centbins[i],(int)centbins[i+1]),74,-3.2289,3.2289,12,-2.4,2.4);
          hpt[i] = centsub.make<TH1D>(Form("pt_%d_%d",(int)centbins[i],(int)centbins[i+1]),Form("pt_%d_%d",(int)centbins[i],(int)centbins[i+1]),60,0,12);
	  hpt[i]->Sumw2();
          hptw[i] = centsub.make<TH1D>(Form("ptw_%d_%d",(int)centbins[i],(int)centbins[i+1]),Form("ptw_%d_%d",(int)centbins[i],(int)centbins[i+1]),60,0,12);
	  hptw[i]->Sumw2();
	  hv2obs[i]->SetOption("colz");
	  hv2obs[i]->Sumw2();
	  hv2obsWgt[i]->SetOption("colz");
	  hv2obsWgt[i]->Sumw2();
	  angeffcorr[i] = (TH2D *)((TH2D *) fangeff->Get(Form("angeff_%d_%d",(int)centbins[i],(int)centbins[i+1])))->Clone(Form("ang%d",i));
	  angeffcorr[i]->SetDirectory(0);
  }
  fangeff->Close();
  centralityLabel_ = centralityVariable_ + centralityMC_;
  centralityBinToken = consumes<int>(centralityBinTag_);
  vertexToken = consumes<std::vector<reco::Vertex>>(vertexTag_);
  trackToken = consumes<std::vector<reco::Track>>(trackTag_);

  hcent = fs->make<TH1D>("cent", "cent", 100, 0, 100);
  hcent->SetXTitle("Centrality Bin");
  hcent->SetYTitle("Counts");

  hvtx = fs->make<TH1D>("vtx", "vtx", 200, -20, 20);
  hvtx->SetXTitle("Vertex (cm)");
  hvtx->SetYTitle("Counts");

  hcentbins = fs->make<TH1D>("centbins", "centbins", 200, 0, 200);
  hcentbins->SetXTitle("Centrality Bin");
  hcentbins->SetYTitle("Counts");

  TString epnames = EPNames[0].data();
  epnames = epnames + "/D";
  for (int i = 0; i < NumEPNames; i++) {
    if (i > 0)
      epnames = epnames + ":" + EPNames[i].data() + "/D";
    TFileDirectory subdir = fs->mkdir(Form("%s", EPNames[i].data()));
    Double_t psirange = 4;
    if (EPOrder[i] == 2)
      psirange = 2;
    if (EPOrder[i] == 3)
      psirange = 1.5;
    if (EPOrder[i] == 4)
      psirange = 1;
    if (EPOrder[i] == 5)
      psirange = 0.8;
    if (EPOrder[i] == 6)
      psirange = 0.6;
    if (EPOrder[i] == 7)
      psirange = 0.5;

    PsiRaw[i] = subdir.make<TH1D>(
        Form("PsiRaw_%s", EPNames[i].data()), Form("PsiRaw_%s", EPNames[i].data()), 800, -psirange, psirange);
    Psi[i] = subdir.make<TH1D>(
        Form("Psi_%s", EPNames[i].data()), Form("Psi_%s", EPNames[i].data()), 800, -psirange, psirange);
    FlatVsRaw[i] = subdir.make<TH2D>(Form("FlatVsRaw_%s", EPNames[i].data()),
                                     Form("FlatVsRaw_%s", EPNames[i].data()),
                                     200,
                                     -psirange,
                                     psirange,
                                     200,
                                     -psirange,
                                     psirange);
    FlatVsRaw[i]->SetOption("colz");
    FlatVsRaw[i]->SetXTitle("#Psi_{raw}");
    FlatVsRaw[i]->SetYTitle("#Psi_{flat}");

    flat[i] = new HiEvtPlaneFlatten();
    flat[i]->init(FlatOrder_, NumFlatBins_, flatnvtxbins_, flatminvtx_, flatdelvtx_, EPNames[i], EPOrder[i]);
  }

  hsumx = new TH2D("hsumx","hsumx",nptbins,ptbins,netabins,etabins);
  hsumy = new TH2D("hsumy","hsumy",nptbins,ptbins,netabins,etabins);
  hsumc = new TH2D("hsumc","hsumc",nptbins,ptbins,netabins,etabins);
  hsumw = new TH2D("hsumw","hsumw",nptbins,ptbins,netabins,etabins);
  hpheta = new TH2D("hpheta","hpheta",74,-3.2289,3.2289,8,-1.6,1.6);
  tree = fs->make<TTree>("tree", "EP tree");
  tree->Branch("Cent", &centval, "cent/D");
  tree->Branch("Vtx",     &vertex,     "vtx/D");
  tree->Branch("angran", &angran, "angran/D");
  tree->Branch("Run",     &runno_,  "run/i");
  tree->Branch("sumx",  "TH2D",  & hsumx, 128000, 0);
  tree->Branch("sumy",  "TH2D",  & hsumy, 128000, 0);
  tree->Branch("sumc",  "TH2D",  & hsumc, 128000, 0);
  tree->Branch("sumw",  "TH2D",  & hsumw, 128000, 0);
  tree->Branch("phieta", "TH2D", & hpheta, 12800,0);

}

VNAnalysis::~VNAnalysis() {
  // do anything here that needs to be done at desctruction time
  // (e.g. close files, deallocate resources etc.)
}

//
// member functions
//

// ------------ method called to for each event  ------------
void VNAnalysis::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup) {
  using namespace edm;
  using namespace std;
  using namespace reco;

  runno_ = iEvent.id().run();

  if (hiWatcher.check(iSetup)) {
    //
    //Get Size of Centrality Table
    //
    //edm::ESHandle<CentralityTable> centDB_;
    //iSetup.get<HeavyIonRcd>().get(centralityLabel_, centDB_);
    //nCentBins_ = (int)centDB_->m_table.size();
    nCentBins_ = 200;
    for (int i = 0; i < NumEPNames; i++) {
      flat[i]->setCaloCentRefBins(-1, -1);
    }
  }
  if (hirpWatcher.check(iSetup)) {
    //
    //Get flattening parameter file.
    //
    edm::ESHandle<RPFlatParams> flatparmsDB_;
    iSetup.get<HeavyIonRPRcd>().get(flatparmsDB_);
    LoadEPDB* db = new LoadEPDB(flatparmsDB_, flat);
    if (!db->IsSuccess()) {
      std::cout << "Flattening db inconsistancy, will continue without: " << std::endl;
      loadDB_ = kFALSE;
    }
  }

  //
  //Get Centrality
  //
  bin = -1;
  cbin = -1;
  edm::Handle<int> cbin_;
  iEvent.getByToken(centralityBinToken, cbin_);
  cbin = *cbin_;
  centval = cbin / 2.;
  bin = cbin / CentBinCompression_;
  int icentCut = centCuts->FindBin(centval)-1;
  //
  //Get Vertex
  //
  edm::Handle<reco::VertexCollection> vertices;
  iEvent.getByToken(vertexToken, vertices);

  //best vertex
  double bestvz = -999.9, bestvx = -999.9, bestvy = -999.9;
  const reco::Vertex& vtx = (*vertices)[0];
  bestvz = vtx.z();
  bestvx = vtx.x();
  bestvy = vtx.y();
  math::XYZPoint bestvtx(bestvx, bestvy, bestvz);

  flatmaxvtx_ = flatminvtx_ + flatnvtxbins_ * flatdelvtx_;
  if (bestvz < minvtx_ || bestvz > maxvtx_)
    return;
  vertex = bestvz;
  hcent->Fill(centval);
  hcentbins->Fill(cbin);
  hvtx->Fill(bestvz);
  //Get Event Planes
  //
  iEvent.getByToken(inputPlanesToken, inputPlanes_);

  if (!inputPlanes_.isValid()) {
    cout << "Error! Can't get hiEvtPlaneFlat product!" << endl;
    return;
  }
  Int_t indx = 0;
  for (EvtPlaneCollection::const_iterator rp = inputPlanes_->begin(); rp != inputPlanes_->end(); rp++) {
    if (indx != rp->indx()) {
      cout << "EP inconsistency found. Abort." << endl;
      return;
    }
    epang[indx] = rp->angle(2);
    epsin[indx] = rp->sumSin(2);
    epcos[indx] = rp->sumCos(2);

    epang_orig[indx] = rp->angle(0);
    epsin_orig[indx] = rp->sumSin(0);
    epcos_orig[indx] = rp->sumCos(0);

    rescor[indx] = flat[indx]->getCentRes1((int)centval);
   
    epang_RecenterOnly[indx] = rp->angle(1);
    epsin_RecenterOnly[indx] = rp->sumSin(1);
    epcos_RecenterOnly[indx] = rp->sumCos(1);

    epang_NoWgt[indx] = rp->angle(3);
    epsin_NoWgt[indx] = rp->sumSin(3);
    epcos_NoWgt[indx] = rp->sumCos(3);

    qx[indx] = rp->qx();
    qy[indx] = rp->qy();
    q[indx] = rp->q();
    vn[indx] = rp->vn(0);
    sumw[indx] = rp->sumw();
    sumw2[indx] = rp->sumw2();
    epmult[indx] = (double)rp->mult();
    if (centval <= 80 && rp->angle() > -5) {
      Psi[indx]->Fill(rp->angle());
      PsiRaw[indx]->Fill(rp->angle(0));
      FlatVsRaw[indx]->Fill(rp->angle(0), rp->angle());
    }
    ++indx;
  }
  edm::Handle<reco::TrackCollection> tracks;
  iEvent.getByToken(trackToken,tracks);
  hsumx->Reset();
  hsumy->Reset();
  hsumc->Reset();
  hsumw->Reset();
  hpheta->Reset();
  angran = ran->Uniform(-TMath::Pi(), TMath::Pi());
  for(TrackCollection::const_iterator itTrack = tracks->begin(); itTrack != tracks->end(); ++itTrack) { 
  	double eta = itTrack->eta();
      	double pt = itTrack->pt();
      	double philab = itTrack->phi();
	double phi=philab + angran;
	if(phi<-TMath::Pi()) phi+=2*TMath::Pi();
	if(phi> TMath::Pi()) phi-=2*TMath::Pi(); 
	double angeff = 1;
	if(angeffcorr[icentCut]!=NULL ) {
		angeff = angeffcorr[icentCut]->GetBinContent(angeffcorr[icentCut]->FindBin(philab,eta));
	}
	if(pt<3) hPhiEta[icentCut]->Fill(philab,eta);
	double w = 1;
	if(teff != NULL ) {
		w = teff->getEfficiency(centval,pt,eta);
		if(w <=0 ) {
			w = 1;
			if(pt<10 && fabs(eta)<2.4) {
			std::cout<<"Bad weight with cent, pt, eta: "<<centval<<"\t"<<pt<<"\t"<<eta<<std::endl;
			}
		}
		w = 1/w;
		w *= angeff;
	}
	if( pt > ptbinsMin[0] && pt < ptbinsMax[nptbins-2]) {
		ptCuts->Fill(pt);
		hpt[icentCut]->Fill(pt);
		hptw[icentCut]->Fill(pt,w);
		if(eta<0) {
			hv2obs[icentCut]->Fill(pt,eta,w*TMath::Cos(2*(philab-epang[HFp2])));
			hv2res->Fill(centval,rescor[HFp2]);
		} else {
			hv2obs[icentCut]->Fill(pt,eta,w*TMath::Cos(2*(philab-epang[HFm2])));
			hv2res->Fill(centval,rescor[HFm2]);
		}
		hv2obsCnt[icentCut]->Fill(pt,eta);
		hv2obsWgt[icentCut]->Fill(pt,eta,w);
		hv2resCnt->Fill(centval);
        	hsumx->Fill(pt,eta,w*TMath::Cos(2*phi));
        	hsumy->Fill(pt,eta,w*TMath::Sin(2*phi));
		hsumc->Fill(pt,eta);
		hsumw->Fill(pt,eta,w);
		hpheta->Fill(phi,eta,w);
	} 
	if (pt > ptbinsMin[nptbins-1] && pt < ptbinsMax[nptbins-1] ){
		pt = 9;
		if(eta<0) {
			hv2obs[icentCut]->Fill(pt,eta,w*TMath::Cos(2*(philab-epang[HFp2])));
		} else {
			hv2obs[icentCut]->Fill(pt,eta,w*TMath::Cos(2*(philab-epang[HFm2])));
		}
		hv2obsCnt[icentCut]->Fill(pt,eta);
		hv2obsWgt[icentCut]->Fill(pt,eta,w);
        	hsumx->Fill(pt,eta,w*TMath::Cos(2*phi));
        	hsumy->Fill(pt,eta,w*TMath::Sin(2*phi));
		hsumc->Fill(pt,eta);
		hsumw->Fill(pt,eta,w);
		hpheta->Fill(phi,eta,w);
	}	
    }
  tree->Fill();
}

// ------------ method called once each job just before starting event loop  ------------
void VNAnalysis::beginJob() {}

// ------------ method called once each job just after ending the event loop  ------------
void VNAnalysis::endJob() {}

//define this as a plug-in
DEFINE_FWK_MODULE(VNAnalysis);
