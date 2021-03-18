import FWCore.ParameterSet.Config as cms

vnanalysis = cms.EDAnalyzer("VNAnalysis",
                                 inputPlanesTag = cms.InputTag("hiEvtPlaneFlat"),
                                 centralityVariable = cms.string("HFtowers"),
                                 centralityBinTag = cms.InputTag("centralityBin","HFtowers"),
                                 vertexTag=cms.InputTag("offlinePrimaryVertices"),
                                 trackTag=cms.InputTag("generalAndHiPixelTracks"),
                                 effTable = cms.string('NULL'),
                                 minvtx = cms.double(-15.0),
                                 maxvtx = cms.double(15.0),
                                 flatnvtxbins = cms.int32(10),
                                 flatminvtx = cms.double(-15.0),
                                 flatdelvtx = cms.double(3.0),
                                 FlatOrder = cms.int32(9),
                                 NumFlatBins = cms.int32(40),
                                 CentBinCompression = cms.int32(5),
                                 caloCentRef = cms.double(-1),
                                 caloCentRefWidth = cms.double(-1)
                            )  
