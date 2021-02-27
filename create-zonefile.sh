echo "\$ORIGIN ." >$1
echo "\$TTL 86400      ; 1 day">>$1
echo $1 "IN SOA ns1.example.co.in. vijay.example.co.in. (" >>$1
echo "                                2021022601 ; serial">>$1
echo "                                3600       ; refresh (1 hour)">>$1
echo "                                900        ; retry (15 minutes)">>$1
echo "                                1209600    ; expire (2 weeks)">>$1
echo "                                43200      ; minimum (12 hours)">>$1
echo "                                )">>$1
echo "                        NS      ns1.example.co.in.">>$1
echo "                        NS      ns2.example.co.in.">>$1
echo "\$ORIGIN" $1. >>$1

IFS=. read ip1 ip2 ip3 ip4 <<< $1
echo $ip3
echo $ip2
echo $ip1
for i in {0..255}; do
#echo "$i                       PTR     $i.cust.example.co.in"
echo "$i                       PTR     $ip3.$ip2.$ip1.$i.cust.example.co.in.">>$1
done