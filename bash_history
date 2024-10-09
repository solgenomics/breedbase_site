perl db/run_all_patches.pl run_all_patches.pl -u ${PGUSER} -p ${PGPASSWORD} -h ${PGHOST} -d ${PGDATABASE} -e admin -s 100
/etc/init.d/sgn stop
/etc/init.d/sgn start
psql -h bb_db -U postgres breedbase



less /entrypoint.sh 
git add bash_history
exit
