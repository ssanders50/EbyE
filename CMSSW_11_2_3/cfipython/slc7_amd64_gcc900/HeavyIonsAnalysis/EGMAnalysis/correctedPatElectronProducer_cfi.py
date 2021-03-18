import FWCore.ParameterSet.Config as cms

correctedPatElectronProducer = cms.EDProducer('CorrectedPatElectronProducer',
  src = cms.InputTag('gedGsfElectrons'),
  centrality = cms.InputTag('centralityBin'),
  epCombConfig = cms.PSet(
    ecalTrkRegressionConfig = cms.PSet(
      rangeMinLowEt = cms.double(-1),
      rangeMaxLowEt = cms.double(3),
      rangeMinHighEt = cms.double(-1),
      rangeMaxHighEt = cms.double(3),
      lowEtHighEtBoundary = cms.double(50),
      forceHighEnergyTrainingIfSaturated = cms.bool(False),
      ebLowEtForestName = cms.ESInputTag('', 'electron_eb_ECALTRK_lowpt'),
      ebHighEtForestName = cms.ESInputTag('', 'electron_eb_ECALTRK'),
      eeLowEtForestName = cms.ESInputTag('', 'electron_ee_ECALTRK_lowpt'),
      eeHighEtForestName = cms.ESInputTag('', 'electron_ee_ECALTRK')
    ),
    ecalTrkRegressionUncertConfig = cms.PSet(
      rangeMinLowEt = cms.double(-1),
      rangeMaxLowEt = cms.double(3),
      rangeMinHighEt = cms.double(-1),
      rangeMaxHighEt = cms.double(3),
      lowEtHighEtBoundary = cms.double(50),
      forceHighEnergyTrainingIfSaturated = cms.bool(False),
      ebLowEtForestName = cms.ESInputTag('', 'electron_eb_ECALTRK_lowpt'),
      ebHighEtForestName = cms.ESInputTag('', 'electron_eb_ECALTRK'),
      eeLowEtForestName = cms.ESInputTag('', 'electron_ee_ECALTRK_lowpt'),
      eeHighEtForestName = cms.ESInputTag('', 'electron_ee_ECALTRK')
    ),
    maxEcalEnergyForComb = cms.double(200),
    minEOverPForComb = cms.double(0.025),
    maxEPDiffInSigmaForComb = cms.double(15),
    maxRelTrkMomErrForComb = cms.double(10)
  ),
  correctionFile = cms.string(''),
  minPt = cms.double(20),
  semiDeterministic = cms.bool(True),
  mightGet = cms.optional.untracked.vstring
)
