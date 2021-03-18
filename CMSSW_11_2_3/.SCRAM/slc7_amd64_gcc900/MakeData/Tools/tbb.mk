ALL_TOOLS      += tbb
tbb_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc900/external/tbb/2020_U2-ghbfee/include
tbb_EX_LIB := tbb
tbb_EX_USE := root_cxxdefaults
tbb_EX_FLAGS_CPPDEFINES  := -DTBB_USE_GLIBCXX_VERSION=90300 -DTBB_SUPPRESS_DEPRECATED_MESSAGES
tbb_EX_FLAGS_SYSTEM_INCLUDE  := 1

