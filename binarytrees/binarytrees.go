/* The Computer Language Benchmarks Game
 * http://benchmarksgame.alioth.debian.org/
 *
 * contributed by The Go Authors.
 * based on C program by Kevin Carson
 * flag.Arg hack by Isaac Gouy
 * *reset*
 */

package main

import (
   "runtime"
   "time"
   "flag"
   "fmt"
   "strconv"
)

var n = 0

type Node struct {
     left, right   *Node
}

func  bottomUpTree(depth int) *Node {
   if depth <= 0 {
      return &Node{}
   }
   return &Node{ bottomUpTree(depth-1), bottomUpTree(depth-1) }
}

func (n *Node) itemCheck() int {
   if n.left == nil {
      return 1
   }
   return 1 + n.left.itemCheck() + n.right.itemCheck()
}

const minDepth = 4

func main() {
   memstats := new(runtime.MemStats)
   start := time.Now()
   flag.Parse()
   if flag.NArg() > 0 { n,_ = strconv.Atoi( flag.Arg(0) ) }

   maxDepth := n
   if minDepth + 2 > n {
      maxDepth = minDepth + 2
   }
   stretchDepth := maxDepth + 1

   check := bottomUpTree(stretchDepth).itemCheck()
//   fmt.Printf("stretch tree of depth %d\t check: %d\n", stretchDepth, check)

   longLivedTree := bottomUpTree(maxDepth)

   for depth := minDepth; depth <= maxDepth; depth+=2 {
      iterations := 1 << uint(maxDepth - depth + minDepth)
      check = 0

      for i := 1; i <= iterations; i++ {
         check += bottomUpTree(depth).itemCheck()
      }
//      fmt.Printf("%d\t trees of depth %d\t check: %d\n", iterations, depth, check)
   }
   longLivedTree.itemCheck()
//   fmt.Printf("long lived tree of depth %d\t check: %d\n", maxDepth, longLivedTree.itemCheck())
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
