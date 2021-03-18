#include <iostream>
#include "TFile.h"
#include "TString.h"
#include "TH2D.h"
#include "TDirectory.h"

static const int NIOV = 1;

unsigned int runs[] = {1, 200000};


class TrackEfficiency{
  
public:
  TrackEfficiency(TString effTable);
  double getEfficiency(double cent, double pt, double eta);
  int setRunNumber(unsigned int runno_);
  
private:
  TFile * f_eff;
  TH2D * eff[5]; 

  int IOVDir;
  
  
  bool DATA;
  
};

//-----------------------------------------------------------------------------
//                                  METHODS
//-----------------------------------------------------------------------------

TrackEfficiency::TrackEfficiency(TString effTable){
        string effRange[]={"Eff_0_5","Eff_5_10","Eff_10_30","Eff_30_50","Eff_50_100"};
        f_eff = new TFile(effTable.Data());
	for(int i = 0; i<5; i++) {
	  eff[i] = (TH2D *) f_eff->Get(effRange[i].data());
	}
	setRunNumber(runs[0]);    
	f_eff->Close();
 
    
    
}
//-----------------------------------------------------------------------------

int TrackEfficiency::setRunNumber(unsigned int runno_){
    
  IOVDir = -1;
  for(int iIOV = 0; iIOV < NIOV; iIOV++){
    if(runno_ >= runs[iIOV] && runno_ < runs[iIOV+1]) {
      IOVDir = iIOV;
      break;
    }
  }
  //if(IOVDir<0) return 0;
  //for(int i = 0; i<10; i++) {
  //  eff[i] = (TH2D *) f_eff->Get(Form("%d/Eff_%d_%d",runs[IOVDir],10*i,10*i+10));
  //}
  return 1;
}

//-----------------------------------------------------------------------------

double TrackEfficiency::getEfficiency(double cent, double pt, double eta){
    
  if(cent>=0 && cent<5){
    return eff[0]->GetBinContent( eff[0]->GetXaxis()->FindBin(eta),eff[0]->GetYaxis()->FindBin(pt));
  } else if (cent>=5 && cent < 10) {
    return eff[1]->GetBinContent( eff[1]->GetXaxis()->FindBin(eta),eff[1]->GetYaxis()->FindBin(pt));
  } else if (cent>=10 && cent < 30) {
    return eff[2]->GetBinContent( eff[2]->GetXaxis()->FindBin(eta),eff[2]->GetYaxis()->FindBin(pt));
  } else if (cent>=30 && cent < 50) {
    return eff[3]->GetBinContent( eff[3]->GetXaxis()->FindBin(eta),eff[3]->GetYaxis()->FindBin(pt));
  } else if (cent <=100 ) {
    return eff[4]->GetBinContent( eff[4]->GetXaxis()->FindBin(eta),eff[4]->GetYaxis()->FindBin(pt));
  } else {
	return -1;
  }
  
return 1.;
}

//-----------------------------------------------------------------------------





    
