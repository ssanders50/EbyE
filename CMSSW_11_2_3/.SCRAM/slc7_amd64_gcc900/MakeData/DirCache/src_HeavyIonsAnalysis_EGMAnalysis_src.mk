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
