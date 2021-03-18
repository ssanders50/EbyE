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
