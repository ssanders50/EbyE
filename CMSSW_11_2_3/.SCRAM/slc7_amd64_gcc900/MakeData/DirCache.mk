ifeq ($(strip $(HeavyIonsAnalysis/JetAnalysis)),)
ALL_COMMONRULES += src_HeavyIonsAnalysis_JetAnalysis_src
src_HeavyIonsAnalysis_JetAnalysis_src_parent := HeavyIonsAnalysis/JetAnalysis
src_HeavyIonsAnalysis_JetAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_JetAnalysis_src,src/HeavyIonsAnalysis/JetAnalysis/src,LIBRARY))
HeavyIonsAnalysisJetAnalysis := self/HeavyIonsAnalysis/JetAnalysis
HeavyIonsAnalysis/JetAnalysis := HeavyIonsAnalysisJetAnalysis
HeavyIonsAnalysisJetAnalysis_files := $(patsubst src/HeavyIonsAnalysis/JetAnalysis/src/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/JetAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HeavyIonsAnalysisJetAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/HeavyIonsAnalysis/JetAnalysis/BuildFile
HeavyIonsAnalysisJetAnalysis_LOC_USE := self  root hepmc fastjet fastjet-contrib FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Framework CommonTools/UtilAlgos Geometry/Records DataFormats/HepMCCandidate DataFormats/PatCandidates RecoJets/JetProducers RecoHI/HiJetAlgos DataFormats/HeavyIonEvent CondFormats/JetMETObjects
HeavyIonsAnalysisJetAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HeavyIonsAnalysisJetAnalysis,HeavyIonsAnalysisJetAnalysis,$(SCRAMSTORENAME_LIB),src/HeavyIonsAnalysis/JetAnalysis/src))
HeavyIonsAnalysisJetAnalysis_PACKAGE := self/src/HeavyIonsAnalysis/JetAnalysis/src
ALL_PRODS += HeavyIonsAnalysisJetAnalysis
HeavyIonsAnalysisJetAnalysis_CLASS := LIBRARY
HeavyIonsAnalysis/JetAnalysis_forbigobj+=HeavyIonsAnalysisJetAnalysis
HeavyIonsAnalysisJetAnalysis_INIT_FUNC        += $$(eval $$(call Library,HeavyIonsAnalysisJetAnalysis,src/HeavyIonsAnalysis/JetAnalysis/src,src_HeavyIonsAnalysis_JetAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
endif
ifeq ($(strip $(HeavyIonsAnalysis/VNAnalysis)),)
ALL_COMMONRULES += src_HeavyIonsAnalysis_VNAnalysis_src
src_HeavyIonsAnalysis_VNAnalysis_src_parent := HeavyIonsAnalysis/VNAnalysis
src_HeavyIonsAnalysis_VNAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_VNAnalysis_src,src/HeavyIonsAnalysis/VNAnalysis/src,LIBRARY))
HeavyIonsAnalysisVNAnalysis := self/HeavyIonsAnalysis/VNAnalysis
HeavyIonsAnalysis/VNAnalysis := HeavyIonsAnalysisVNAnalysis
HeavyIonsAnalysisVNAnalysis_files := $(patsubst src/HeavyIonsAnalysis/VNAnalysis/src/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/VNAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HeavyIonsAnalysisVNAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/HeavyIonsAnalysis/VNAnalysis/BuildFile
HeavyIonsAnalysisVNAnalysis_LOC_USE := self  root rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities PhysicsTools/UtilAlgos DataFormats/Candidate DataFormats/HcalRecHit DataFormats/WrappedStdDictionaries Geometry/Records DataFormats/HepMCCandidate DataFormats/TrackReco DataFormats/VertexReco DataFormats/Common DataFormats/HeavyIonEvent DataFormats/CaloTowers DataFormats/Provenance CondCore/DBOutputService CondFormats/DataRecord CondFormats/HIObjects clhep
HeavyIonsAnalysisVNAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HeavyIonsAnalysisVNAnalysis,HeavyIonsAnalysisVNAnalysis,$(SCRAMSTORENAME_LIB),src/HeavyIonsAnalysis/VNAnalysis/src))
HeavyIonsAnalysisVNAnalysis_PACKAGE := self/src/HeavyIonsAnalysis/VNAnalysis/src
ALL_PRODS += HeavyIonsAnalysisVNAnalysis
HeavyIonsAnalysisVNAnalysis_CLASS := LIBRARY
HeavyIonsAnalysis/VNAnalysis_forbigobj+=HeavyIonsAnalysisVNAnalysis
HeavyIonsAnalysisVNAnalysis_INIT_FUNC        += $$(eval $$(call Library,HeavyIonsAnalysisVNAnalysis,src/HeavyIonsAnalysis/VNAnalysis/src,src_HeavyIonsAnalysis_VNAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
endif
ifeq ($(strip $(HeavyIonsAnalysisEventAnalysisAuto)),)
HeavyIonsAnalysisEventAnalysisAuto := self/src/HeavyIonsAnalysis/EventAnalysis/plugins
PLUGINS:=yes
HeavyIonsAnalysisEventAnalysisAuto_files := $(patsubst src/HeavyIonsAnalysis/EventAnalysis/plugins/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/EventAnalysis/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HeavyIonsAnalysisEventAnalysisAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/HeavyIonsAnalysis/EventAnalysis/plugins/BuildFile
HeavyIonsAnalysisEventAnalysisAuto_LOC_USE := self  CommonTools/UtilAlgos DataFormats/L1GlobalTrigger DataFormats/L1TGlobal DataFormats/ParticleFlowCandidate DataFormats/PatCandidates FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/ServiceRegistry HLTrigger/HLTcore RecoHI/HiCentralityAlgos DataFormats/HeavyIonEvent rootcore
HeavyIonsAnalysisEventAnalysisAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HeavyIonsAnalysisEventAnalysisAuto,HeavyIonsAnalysisEventAnalysisAuto,$(SCRAMSTORENAME_LIB),src/HeavyIonsAnalysis/EventAnalysis/plugins))
HeavyIonsAnalysisEventAnalysisAuto_PACKAGE := self/src/HeavyIonsAnalysis/EventAnalysis/plugins
ALL_PRODS += HeavyIonsAnalysisEventAnalysisAuto
HeavyIonsAnalysis/EventAnalysis_forbigobj+=HeavyIonsAnalysisEventAnalysisAuto
HeavyIonsAnalysisEventAnalysisAuto_INIT_FUNC        += $$(eval $$(call Library,HeavyIonsAnalysisEventAnalysisAuto,src/HeavyIonsAnalysis/EventAnalysis/plugins,src_HeavyIonsAnalysis_EventAnalysis_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
HeavyIonsAnalysisEventAnalysisAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,HeavyIonsAnalysisEventAnalysisAuto,src/HeavyIonsAnalysis/EventAnalysis/plugins))
endif
ALL_COMMONRULES += src_HeavyIonsAnalysis_EventAnalysis_plugins
src_HeavyIonsAnalysis_EventAnalysis_plugins_parent := HeavyIonsAnalysis/EventAnalysis
src_HeavyIonsAnalysis_EventAnalysis_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_EventAnalysis_plugins,src/HeavyIonsAnalysis/EventAnalysis/plugins,PLUGINS))
ifeq ($(strip $(HeavyIonsAnalysis/HiEvtPlaneCalib)),)
ALL_COMMONRULES += src_HeavyIonsAnalysis_HiEvtPlaneCalib_src
src_HeavyIonsAnalysis_HiEvtPlaneCalib_src_parent := HeavyIonsAnalysis/HiEvtPlaneCalib
src_HeavyIonsAnalysis_HiEvtPlaneCalib_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_HiEvtPlaneCalib_src,src/HeavyIonsAnalysis/HiEvtPlaneCalib/src,LIBRARY))
HeavyIonsAnalysisHiEvtPlaneCalib := self/HeavyIonsAnalysis/HiEvtPlaneCalib
HeavyIonsAnalysis/HiEvtPlaneCalib := HeavyIonsAnalysisHiEvtPlaneCalib
HeavyIonsAnalysisHiEvtPlaneCalib_files := $(patsubst src/HeavyIonsAnalysis/HiEvtPlaneCalib/src/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/HiEvtPlaneCalib/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HeavyIonsAnalysisHiEvtPlaneCalib_BuildFile    := $(WORKINGDIR)/cache/bf/src/HeavyIonsAnalysis/HiEvtPlaneCalib/BuildFile
HeavyIonsAnalysisHiEvtPlaneCalib_LOC_USE := self  root rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities PhysicsTools/UtilAlgos DataFormats/Candidate DataFormats/HcalRecHit DataFormats/WrappedStdDictionaries Geometry/Records DataFormats/HepMCCandidate DataFormats/TrackReco DataFormats/VertexReco DataFormats/Common DataFormats/HeavyIonEvent DataFormats/CaloTowers DataFormats/Provenance CondCore/DBOutputService CondFormats/DataRecord CondFormats/HIObjects clhep
HeavyIonsAnalysisHiEvtPlaneCalib_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HeavyIonsAnalysisHiEvtPlaneCalib,HeavyIonsAnalysisHiEvtPlaneCalib,$(SCRAMSTORENAME_LIB),src/HeavyIonsAnalysis/HiEvtPlaneCalib/src))
HeavyIonsAnalysisHiEvtPlaneCalib_PACKAGE := self/src/HeavyIonsAnalysis/HiEvtPlaneCalib/src
ALL_PRODS += HeavyIonsAnalysisHiEvtPlaneCalib
HeavyIonsAnalysisHiEvtPlaneCalib_CLASS := LIBRARY
HeavyIonsAnalysis/HiEvtPlaneCalib_forbigobj+=HeavyIonsAnalysisHiEvtPlaneCalib
HeavyIonsAnalysisHiEvtPlaneCalib_INIT_FUNC        += $$(eval $$(call Library,HeavyIonsAnalysisHiEvtPlaneCalib,src/HeavyIonsAnalysis/HiEvtPlaneCalib/src,src_HeavyIonsAnalysis_HiEvtPlaneCalib_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
endif
ifeq ($(strip $(HeavyIonsAnalysis/EGMAnalysis)),)
ALL_COMMONRULES += src_HeavyIonsAnalysis_EGMAnalysis_src
src_HeavyIonsAnalysis_EGMAnalysis_src_parent := HeavyIonsAnalysis/EGMAnalysis
src_HeavyIonsAnalysis_EGMAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_EGMAnalysis_src,src/HeavyIonsAnalysis/EGMAnalysis/src,LIBRARY))
HeavyIonsAnalysisEGMAnalysis := self/HeavyIonsAnalysis/EGMAnalysis
HeavyIonsAnalysis/EGMAnalysis := HeavyIonsAnalysisEGMAnalysis
HeavyIonsAnalysisEGMAnalysis_files := $(patsubst src/HeavyIonsAnalysis/EGMAnalysis/src/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/EGMAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HeavyIonsAnalysisEGMAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/HeavyIonsAnalysis/EGMAnalysis/BuildFile
HeavyIonsAnalysisEGMAnalysis_LOC_USE := self  DataFormats/EgammaReco DataFormats/EgammaCandidates RecoEgamma/EgammaTools TrackingTools/TransientTrack TrackingTools/Records
HeavyIonsAnalysisEGMAnalysis_EX_LIB   := HeavyIonsAnalysisEGMAnalysis
HeavyIonsAnalysisEGMAnalysis_EX_USE   := $(foreach d,$(HeavyIonsAnalysisEGMAnalysis_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
HeavyIonsAnalysisEGMAnalysis_PACKAGE := self/src/HeavyIonsAnalysis/EGMAnalysis/src
ALL_PRODS += HeavyIonsAnalysisEGMAnalysis
HeavyIonsAnalysisEGMAnalysis_CLASS := LIBRARY
HeavyIonsAnalysis/EGMAnalysis_forbigobj+=HeavyIonsAnalysisEGMAnalysis
HeavyIonsAnalysisEGMAnalysis_INIT_FUNC        += $$(eval $$(call Library,HeavyIonsAnalysisEGMAnalysis,src/HeavyIonsAnalysis/EGMAnalysis/src,src_HeavyIonsAnalysis_EGMAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
ifeq ($(strip $(HeavyIonsAnalysisEGMAnalysisAuto)),)
HeavyIonsAnalysisEGMAnalysisAuto := self/src/HeavyIonsAnalysis/EGMAnalysis/plugins
PLUGINS:=yes
HeavyIonsAnalysisEGMAnalysisAuto_files := $(patsubst src/HeavyIonsAnalysis/EGMAnalysis/plugins/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/EGMAnalysis/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HeavyIonsAnalysisEGMAnalysisAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/HeavyIonsAnalysis/EGMAnalysis/plugins/BuildFile
HeavyIonsAnalysisEGMAnalysisAuto_LOC_USE := self  CommonTools/UtilAlgos DataFormats/PatCandidates Geometry/CaloGeometry Geometry/Records HeavyIonsAnalysis/EGMAnalysis RecoEgamma/EgammaTools TrackingTools/IPTools rootcore
HeavyIonsAnalysisEGMAnalysisAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HeavyIonsAnalysisEGMAnalysisAuto,HeavyIonsAnalysisEGMAnalysisAuto,$(SCRAMSTORENAME_LIB),src/HeavyIonsAnalysis/EGMAnalysis/plugins))
HeavyIonsAnalysisEGMAnalysisAuto_PACKAGE := self/src/HeavyIonsAnalysis/EGMAnalysis/plugins
ALL_PRODS += HeavyIonsAnalysisEGMAnalysisAuto
HeavyIonsAnalysis/EGMAnalysis_forbigobj+=HeavyIonsAnalysisEGMAnalysisAuto
HeavyIonsAnalysisEGMAnalysisAuto_INIT_FUNC        += $$(eval $$(call Library,HeavyIonsAnalysisEGMAnalysisAuto,src/HeavyIonsAnalysis/EGMAnalysis/plugins,src_HeavyIonsAnalysis_EGMAnalysis_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
HeavyIonsAnalysisEGMAnalysisAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,HeavyIonsAnalysisEGMAnalysisAuto,src/HeavyIonsAnalysis/EGMAnalysis/plugins))
endif
ALL_COMMONRULES += src_HeavyIonsAnalysis_EGMAnalysis_plugins
src_HeavyIonsAnalysis_EGMAnalysis_plugins_parent := HeavyIonsAnalysis/EGMAnalysis
src_HeavyIonsAnalysis_EGMAnalysis_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_EGMAnalysis_plugins,src/HeavyIonsAnalysis/EGMAnalysis/plugins,PLUGINS))
ifeq ($(strip $(HeavyIonsAnalysis/TrackAnalysis)),)
ALL_COMMONRULES += src_HeavyIonsAnalysis_TrackAnalysis_src
src_HeavyIonsAnalysis_TrackAnalysis_src_parent := HeavyIonsAnalysis/TrackAnalysis
src_HeavyIonsAnalysis_TrackAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_TrackAnalysis_src,src/HeavyIonsAnalysis/TrackAnalysis/src,LIBRARY))
HeavyIonsAnalysisTrackAnalysis := self/HeavyIonsAnalysis/TrackAnalysis
HeavyIonsAnalysis/TrackAnalysis := HeavyIonsAnalysisTrackAnalysis
HeavyIonsAnalysisTrackAnalysis_files := $(patsubst src/HeavyIonsAnalysis/TrackAnalysis/src/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/TrackAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HeavyIonsAnalysisTrackAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/HeavyIonsAnalysis/TrackAnalysis/BuildFile
HeavyIonsAnalysisTrackAnalysis_LOC_USE := self  hepmc root heppdt DataFormats/Common DataFormats/DetId DataFormats/EcalRecHit DataFormats/GeometryVector DataFormats/HeavyIonEvent DataFormats/SiPixelDigi DataFormats/TrackingRecHit DataFormats/VertexReco DataFormats/HepMCCandidate RecoBTag/SecondaryVertex FWCore/Framework FWCore/ServiceRegistry FWCore/PluginManager FWCore/ParameterSet PhysicsTools/UtilAlgos SimDataFormats/Vertex SimDataFormats/GeneratorProducts SimDataFormats/TrackingAnalysis SimGeneral/HepPDTRecord SimTracker/TrackerHitAssociation SimTracker/TrackAssociation SimTracker/Records Geometry/CaloGeometry Geometry/CommonDetUnit Geometry/TrackerGeometryBuilder Geometry/Records RecoTracker/Record HLTrigger/HLTcore
HeavyIonsAnalysisTrackAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HeavyIonsAnalysisTrackAnalysis,HeavyIonsAnalysisTrackAnalysis,$(SCRAMSTORENAME_LIB),src/HeavyIonsAnalysis/TrackAnalysis/src))
HeavyIonsAnalysisTrackAnalysis_PACKAGE := self/src/HeavyIonsAnalysis/TrackAnalysis/src
ALL_PRODS += HeavyIonsAnalysisTrackAnalysis
HeavyIonsAnalysisTrackAnalysis_CLASS := LIBRARY
HeavyIonsAnalysis/TrackAnalysis_forbigobj+=HeavyIonsAnalysisTrackAnalysis
HeavyIonsAnalysisTrackAnalysis_INIT_FUNC        += $$(eval $$(call Library,HeavyIonsAnalysisTrackAnalysis,src/HeavyIonsAnalysis/TrackAnalysis/src,src_HeavyIonsAnalysis_TrackAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
endif
