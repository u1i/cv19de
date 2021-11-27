while [ 1 ]
do
	p=$(date +%Y)/$(date +%m)/$(date +%d)/$(date +%H)
	mkdir -p $p
	out=$p/$(date +%s).txt
	curl "https://api.corona-zahlen.org/germany/" > $out
	out=$p/history_$(date +%s).txt
	curl "https://api.corona-zahlen.org/germany/history/cases" > $out

	git add -A
	git commit -m "changed $(date +%s)"
	git push
	date
	sleep 3600
	#find . -name "*.txt" -mmin 3 -delete
done
