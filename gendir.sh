current=`pwd`
rm dir.dat
find $current -name "proc" -type d>dir-only.dat
for i in `find $current -name "proc" -type d`
do
cd $i
mos1=`find . -name "mos1*" |head -n 1|cut -d'-' -f1`
mos1=${mos1/"./"/}
mos2=`find . -name "mos2*" |head -n 1|cut -d'-' -f1`
mos2=${mos2/"./"/}
pn=`find . -name "pn*" |head -n 1|cut -d'-' -f1`
pn=${pn/"./"/}
cd $current
echo $i"/"$mos1 >>$current"/dir.dat"
echo $i"/"$mos2 >>$current"/dir.dat"
echo $i"/"$pn >>$current"/dir.dat"
done
