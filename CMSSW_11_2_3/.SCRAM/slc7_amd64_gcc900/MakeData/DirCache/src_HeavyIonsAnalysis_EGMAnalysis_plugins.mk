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
