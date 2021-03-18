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
