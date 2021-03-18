ifeq ($(strip $(PyHeavyIonsAnalysisEGMAnalysis)),)
PyHeavyIonsAnalysisEGMAnalysis := self/src/HeavyIonsAnalysis/EGMAnalysis/python
src_HeavyIonsAnalysis_EGMAnalysis_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HeavyIonsAnalysis/EGMAnalysis/python)
PyHeavyIonsAnalysisEGMAnalysis_files := $(patsubst src/HeavyIonsAnalysis/EGMAnalysis/python/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/EGMAnalysis/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyHeavyIonsAnalysisEGMAnalysis_LOC_USE := self  
PyHeavyIonsAnalysisEGMAnalysis_PACKAGE := self/src/HeavyIonsAnalysis/EGMAnalysis/python
ALL_PRODS += PyHeavyIonsAnalysisEGMAnalysis
PyHeavyIonsAnalysisEGMAnalysis_INIT_FUNC        += $$(eval $$(call PythonProduct,PyHeavyIonsAnalysisEGMAnalysis,src/HeavyIonsAnalysis/EGMAnalysis/python,src_HeavyIonsAnalysis_EGMAnalysis_python))
else
$(eval $(call MultipleWarningMsg,PyHeavyIonsAnalysisEGMAnalysis,src/HeavyIonsAnalysis/EGMAnalysis/python))
endif
ALL_COMMONRULES += src_HeavyIonsAnalysis_EGMAnalysis_python
src_HeavyIonsAnalysis_EGMAnalysis_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_EGMAnalysis_python,src/HeavyIonsAnalysis/EGMAnalysis/python,PYTHON))
