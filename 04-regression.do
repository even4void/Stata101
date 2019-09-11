/*  File generated by StatWeave  */
display "--- Ou" "tput file from StatWeave, engine = StataEngine ---"

/* ---- Chunk 1: "04-regression-1-Stata" ----- */
set scheme lean2

/* ---- Chunk 2: "04-regression-2-Stata" ----- */
webuse lbw    

/* ---- Chunk 3: "04-regression-3-Stata" ----- */
list in 1/5

/* ---- Chunk 4: "04-regression-4-Stata" ----- */
summarize bwt lwt

/* ---- Chunk 5: "04-regression-5-Stata" ----- */
replace lwt = lwt/2.2

/* ---- Chunk 6: "04-regression-6-Stata" ----- */
scatter bwt lwt || lowess bwt lwt  

/* ---- Chunk 7: "04-regression-7-Stata" ----- */
correlate bwt lwt, means

/* ---- Chunk 8: "04-regression-8-Stata" ----- */
regress bwt lwt

/* ---- Chunk 9: "04-regression-9-Stata" ----- */
scatter bwt lwt || lfit bwt lwt  

/* ---- Chunk 10: "04-regression-10-Stata" ----- */
display _b[lwt]

/* ---- Chunk 11: "04-regression-11-Stata" ----- */
di "Coefficient de détermination = " %3.2f e(r2)*100 " %"  

/* ---- Chunk 12: "04-regression-12-Stata" ----- */
predict double p, xb
list lwt bwt p in 1/5

/* ---- Chunk 13: "04-regression-13-Stata" ----- */
predict sep, stdp
generate lci = p - 1.96*sep
generate uci = p + 1.96*sep
format p lci uci %4.1f
list lwt bwt lci p uci in 1/5

/* ---- Chunk 14: "04-regression-14-Stata" ----- */
scatter bwt lwt, msymbol(+) msize(small) || lfitci bwt lwt  

/* ---- Chunk 15: "04-regression-15-Stata" ----- */
estat ic

/* ---- Chunk 17: "04-regression-17-Stata" ----- */
fitstat

/* ---- Chunk 18: "04-regression-18-Stata" ----- */
predict double r, rstandard
predict double rs, rstudent
format r rs %9.5f
summarize r rs, format

/* ---- Chunk 19: "04-regression-19-Stata" ----- */
kdensity r

/* ---- Chunk 20: "04-regression-20-Stata" ----- */
twoway (scatter r p) (lowess r p), yline(0, lcolor(black) lpattern(dash)) legend(off) ylabel(, format(%5.1f))

/* ---- Chunk 21: "04-regression-21-Stata" ----- */
tabulate race

/* ---- Chunk 22: "04-regression-22-Stata" ----- */
tabulate race, nolabel

/* ---- Chunk 23: "04-regression-23-Stata" ----- */
regress bwt i.race, noheader

/* ---- Chunk 24: "04-regression-24-Stata" ----- */
regress bwt ib3.race, noheader

/* ---- Chunk 25: "04-regression-25-Stata" ----- */
quietly: regress bwt lwt  
estimates store mod1

/* ---- Chunk 26: "04-regression-26-Stata" ----- */
regress bwt lwt i.race, noheader

/* ---- Chunk 27: "04-regression-27-Stata" ----- */
estimates store mod2
estimates table mod1 mod2

/* ---- Chunk 28: "04-regression-28-Stata" ----- */
tabulate ftv

/* ---- Chunk 29: "04-regression-29-Stata" ----- */
recode ftv (0 = 0) (1 = 1) (2/6 = 2), gen(ftvc)  

/* ---- Chunk 30: "04-regression-30-Stata" ----- */
regress bwt lwt i.race i.ftvc, notable   

/* ---- Chunk 31: "04-regression-31-Stata" ----- */
estimates store mod3
estimates stats *

/* ---- Chunk 32: "04-regression-32-Stata" ----- */
lrtest (mod1) (mod2), stats

/* ---- Chunk 33: "04-regression-33-Stata" ----- */
mhodds low smoke

/* ---- Chunk 34: "04-regression-34-Stata" ----- */
xtile age3 = age, nq(3)
table low smoke age3

/* ---- Chunk 35: "04-regression-35-Stata" ----- */
mhodds low smoke, by(age3)

/* ---- Chunk 36: "04-regression-36-Stata" ----- */
logistic low lwt    

/* ---- Chunk 37: "04-regression-37-Stata" ----- */
fitstat

/* ---- Chunk 38: "04-regression-38-Stata" ----- */
logit low ui, nolog  

/* ---- Chunk 39: "04-regression-39-Stata" ----- */
display exp(_b[ui])  

/* ---- Chunk 40: "04-regression-40-Stata" ----- */
estat classification  

/* ---- Chunk 41: "04-regression-41-Stata" ----- */
quietly: logit low lwt
lroc  

/* ---- Chunk 42: "04-regression-42-Stata" ----- */
quietly: logit low lwt
predict pr, p  

/* ---- Chunk 43: "04-regression-43-Stata" ----- */
predict lo, xb
predict lose, stdp
generate lolci = lo - 1.96*lose
generate louci = lo + 1.96*lose  
list low lolci lo louci in 1/5
