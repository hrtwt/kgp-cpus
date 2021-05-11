readonly repo="/root/kGenProg"
readonly testResultDir="build/test-results/test"
readonly testResult="TEST-jp.kusumotolab.kgenprog.KGenProgMainTest.xml"
readonly outDir="/root/out"

set -eu

cd ${repo}

./gradlew assemble
./gradlew cleanTest test --tests "KGenProgMainTest.testCloseToZero03"

cp ${repo}/${testResultDir}/${testResult} ${outDir}/result-${CPUS}.xml
