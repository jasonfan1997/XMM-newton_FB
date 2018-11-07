for i in `find -name "0*" -maxdepth 1 -type d`
do
cp mostest.sh $i
cp pn-diag.rsp.gz $i
cp mos2-diag.rsp.gz $i
cp mos1-diag.rsp.gz $i
cp savexspec-full.xcm $i
cp rass.pi $i
cp pspcc.rsp $i
cd $i
nohup ./mostest.sh &
cd ..
done
