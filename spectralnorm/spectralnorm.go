/* The Computer Language Benchmarks Game
 * http://benchmarksgame.alioth.debian.org/
 *
 * contributed by chaishushan
 * Based on spectral-norm.go by The Go Authors.
 */

package main

import (
   "time"
   "runtime"
   "flag"
   "fmt"
   "math"
   "strconv"
)

// var n = flag.Int("n", 2000, "count")
var n = 0

func evalA(i, j int) int { return ((i+j)*(i+j+1)/2 + i + 1) }

type Vec []float64

func (v Vec) Times(u Vec) {
   for i := 0; i < len(v); i++ {
      v[i] = 0
      for j := 0; j < len(u); j++ {
         v[i] += u[j] / float64(evalA(i, j))
      }
   }
}

func (v Vec) TimesTransp(u Vec) {
   for i := 0; i < len(v); i++ {
      v[i] = 0
      for j := 0; j < len(u); j++ {
         v[i] += u[j] / float64(evalA(j, i))
      }
   }
}

func (v Vec) ATimesTransp(u Vec) {
   x := make(Vec, len(u))
   x.Times(u)
   v.TimesTransp(x)
}

func main() {
   memstats := new(runtime.MemStats)
   start := time.Now()
   flag.Parse()
   if flag.NArg() > 0 {
      n, _ = strconv.Atoi(flag.Arg(0))
   }

   N := n
   u := make(Vec, N)
   for i := 0; i < N; i++ {
      u[i] = 1
   }
   v := make(Vec, N)
   for i := 0; i < 10; i++ {
      v.ATimesTransp(u)
      u.ATimesTransp(v)
   }
   var vBv, vv float64
   for i := 0; i < N; i++ {
      vBv += u[i] * v[i]
      vv += v[i] * v[i]
   }
//   fmt.Printf("%0.9f\n", math.Sqrt(vBv/vv))
   _ = math.Sqrt(vBv/vv)
   elapsed := time.Since(start)
   fmt.Print("time: ", elapsed)
   printMemStats(memstats)
}

func printMemStats(memstats *runtime.MemStats) {
   runtime.ReadMemStats(memstats)
   fmt.Print(" | TotalAlloc ", memstats.TotalAlloc)
   fmt.Print(" | mallocs ", memstats.Mallocs)
   fmt.Print(" | frees ", memstats.Mallocs - memstats.Frees)
   fmt.Println(" | GC cycles ", memstats.NumGC)
}
