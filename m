Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF18D1939E8
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 08:57:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AA9E1671;
	Thu, 26 Mar 2020 08:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AA9E1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585209426;
	bh=LsMkhfhxPWjB9VLAURaLN48c8TT/lXIOWUvd50cfSd0=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jSgYBdOVFwztU7jsm6PeLHdjJhGp/Wp3wALLH962sgnV1pX9JnhX9PgINAEivvQmX
	 ZpceZB8AEII+Nz74LKDmav6EVjtV2YnmVLPnhTYucqWC1NZWIQNOr4DkQVQ2CMlwy2
	 STib5E3XOlK3N4deGIRh5xMRwPv21Oee3K0LM+Kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A2C3F80273;
	Thu, 26 Mar 2020 08:54:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07215F801F9; Tue, 24 Mar 2020 07:02:03 +0100 (CET)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2D9FF800B9
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 07:01:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2D9FF800B9
IronPort-SDR: H+9+f7KmDEAhqRlDMlb3UyvygGguBeZpkvCOJKAg2utd8OSAfnXCfIq9Ek96EFhNE8gxSJH7U1
 bf75Go3PiFrA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 23:01:54 -0700
IronPort-SDR: gnNywNp6wP0VGzESQLTAryWmtNoxbB9ZKaIvNDd72aT6J6VvaAHWwOr7+bZgJizkx+PoGUs50Z
 PM7lFLxA/6iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,299,1580803200"; 
 d="yaml'?scan'208";a="393170772"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.3])
 by orsmga004.jf.intel.com with ESMTP; 23 Mar 2020 23:01:42 -0700
Date: Tue, 24 Mar 2020 14:01:24 +0800
From: kernel test robot <rong.a.chen@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [cpufreq] 06c4d00466: will-it-scale.per_process_ops -53.4% regression
Message-ID: <20200324060124.GC11705@shao2-debian>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="POjlveFHrWq2ZO+N"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200320131509.564059710@linutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Thu, 26 Mar 2020 08:54:37 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>, x86@kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Mark Gross <mgross@linux.intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
 Zhang Rui <rui.zhang@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 linux-pm@vger.kernel.org, linux-mmc@vger.kernel.org, lkp@lists.01.org,
 Bjorn Helgaas <bhelgaas@google.com>, Takashi Iwai <tiwai@suse.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--POjlveFHrWq2ZO+N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Greeting,

FYI, we noticed a -53.4% regression of will-it-scale.per_process_ops due to commit:


commit: 06c4d00466eb374841bc84c39af19b3161ff6917 ("[patch 09/22] cpufreq: Convert to new X86 CPU match macros")
url: https://github.com/0day-ci/linux/commits/Thomas-Gleixner/x86-devicetable-Move-x86-specific-macro-out-of-generic-code/20200321-031729
base: https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git linux-next

in testcase: will-it-scale
on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8G memory
with following parameters:

	nr_task: 16
	mode: process
	test: read2
	cpufreq_governor: performance
	ucode: 0x21

test-description: Will It Scale takes a testcase and runs it from 1 through to n parallel copies to see if the testcase will scale. It builds both a process and threads based test in order to see any differences between the two.
test-url: https://github.com/antonblanchard/will-it-scale

In addition to that, the commit also has significant impact on the following tests:

+------------------+------------------------------------------------------------------------+
| testcase: change | hackbench: hackbench.throughput -50.9% regression                      |
| test machine     | 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G memory       |
| test parameters  | cpufreq_governor=performance                                           |
|                  | ipc=socket                                                             |
|                  | mode=process                                                           |
|                  | nr_threads=100%                                                        |
|                  | ucode=0x21                                                             |
+------------------+------------------------------------------------------------------------+
| testcase: change | fio-basic: fio.write_bw_MBps -15.4% regression                         |
| test machine     | 160 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz with 256G memory |
| test parameters  | bs=4k                                                                  |
|                  | cpufreq_governor=performance                                           |
|                  | disk=1SSD                                                              |
|                  | fs2=nfsv4                                                              |
|                  | fs=ext4                                                                |
|                  | ioengine=sync                                                          |
|                  | nr_task=100%                                                           |
|                  | runtime=300s                                                           |
|                  | rw=write                                                               |
|                  | test_size=128G                                                         |
|                  | ucode=0xb000038                                                        |
+------------------+------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops -53.4% regression         |
| test machine     | 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8G memory       |
| test parameters  | cpufreq_governor=performance                                           |
|                  | mode=process                                                           |
|                  | nr_task=16                                                             |
|                  | test=malloc2                                                           |
|                  | ucode=0x21                                                             |
+------------------+------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops -57.9% regression         |
| test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz with 128G memory  |
| test parameters  | cpufreq_governor=performance                                           |
|                  | mode=process                                                           |
|                  | nr_task=16                                                             |
|                  | test=pthread_mutex1                                                    |
|                  | ucode=0xb000038                                                        |
+------------------+------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_thread_ops -53.5% regression          |
| test machine     | 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8G memory       |
| test parameters  | cpufreq_governor=performance                                           |
|                  | mode=thread                                                            |
|                  | nr_task=16                                                             |
|                  | test=pipe1                                                             |
|                  | ucode=0x21                                                             |
+------------------+------------------------------------------------------------------------+
| testcase: change | lmbench3: lmbench3.MMAP.read.bandwidth.MB/sec -36.3% regression        |
| test machine     | 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz with 48G memory       |
| test parameters  | cpufreq_governor=performance                                           |
|                  | mode=development                                                       |
|                  | nr_threads=50%                                                         |
|                  | test=MMAP                                                              |
|                  | test_memory_size=50%                                                   |
|                  | ucode=0x7000019                                                        |
+------------------+------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_thread_ops -58.4% regression          |
| test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz with 128G memory  |
| test parameters  | cpufreq_governor=performance                                           |
|                  | mode=thread                                                            |
|                  | nr_task=16                                                             |
|                  | test=signal1                                                           |
|                  | ucode=0xb000038                                                        |
+------------------+------------------------------------------------------------------------+
| testcase: change | reaim: reaim.jobs_per_min -51.7% regression                            |
| test machine     | 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G memory       |
| test parameters  | cpufreq_governor=performance                                           |
|                  | nr_task=100%                                                           |
|                  | runtime=300s                                                           |
|                  | test=shared                                                            |
|                  | ucode=0x21                                                             |
+------------------+------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops -58.3% regression         |
| test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz with 128G memory  |
| test parameters  | cpufreq_governor=performance                                           |
|                  | mode=process                                                           |
|                  | nr_task=16                                                             |
|                  | test=pread2                                                            |
|                  | ucode=0xb000038                                                        |
+------------------+------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops -52.9% regression         |
| test machine     | 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G memory       |
| test parameters  | cpufreq_governor=performance                                           |
|                  | test=pthread_mutex1                                                    |
|                  | ucode=0x21                                                             |
+------------------+------------------------------------------------------------------------+
| testcase: change | unixbench: unixbench.score -56.4% regression                           |
| test machine     | 160 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz with 256G memory |
| test parameters  | cpufreq_governor=performance                                           |
|                  | nr_task=1                                                              |
|                  | runtime=300s                                                           |
|                  | test=fstime                                                            |
|                  | ucode=0xb000038                                                        |
+------------------+------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops -56.6% regression         |
| test machine     | 160 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz with 256G memory |
| test parameters  | cpufreq_governor=performance                                           |
|                  | test=pread3                                                            |
|                  | ucode=0xb000038                                                        |
+------------------+------------------------------------------------------------------------+


If you fix the issue, kindly add following tag
Reported-by: kernel test robot <rong.a.chen@intel.com>


Details are as below:
-------------------------------------------------------------------------------------------------->


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/process/16/debian-x86_64-20191114.cgz/lkp-ivb-d02/read2/will-it-scale/0x21

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4           50%           2:4     dmesg.RIP:__do_softirq
           :4          100%           4:4     dmesg.RIP:cpuidle_enter_state
           :4           25%           1:4     dmesg.RIP:load_balance
          1:4          -25%            :4     dmesg.WARNING:at_ip__fsnotify_parent/0x
         %stddev     %change         %stddev
             \          |                \  
    200508           -53.4%      93351        will-it-scale.per_process_ops
   3208147           -53.4%    1493629        will-it-scale.workload
     18743 ±  2%      -9.3%      17000 ±  2%  meminfo.Shmem
      1906 ±  2%     -10.5%       1705 ±  2%  slabinfo.filp.num_objs
     52213 ±  4%     +11.5%      58205 ±  3%  softirqs.CPU0.RCU
     15301           +17.3%      17947 ±  2%  softirqs.SCHED
    561369 ±  3%     -19.7%     450502 ±  5%  cpuidle.C1E.time
      9353 ±  4%     -18.5%       7621 ±  6%  cpuidle.C1E.usage
     75.00 ± 41%     -84.0%      12.00 ± 55%  cpuidle.POLL.usage
     75.00            -3.0%      72.75        vmstat.cpu.sy
     24.00            +8.3%      26.00        vmstat.cpu.us
      7333            -9.6%       6627        vmstat.system.cs
     10892            -3.5%      10507        vmstat.system.in
     65590            -4.6%      62541        proc-vmstat.nr_active_anon
     63949            -4.1%      61328        proc-vmstat.nr_anon_pages
      4685 ±  2%      -9.3%       4251 ±  2%  proc-vmstat.nr_shmem
     65565            -4.6%      62523        proc-vmstat.nr_zone_active_anon
      1619 ± 12%     -38.8%     990.75 ± 14%  proc-vmstat.pgactivate
    347948            -1.0%     344441        proc-vmstat.pgfree
      9529 ± 32%     -59.2%       3888 ± 33%  interrupts.CPU0.NMI:Non-maskable_interrupts
      9529 ± 32%     -59.2%       3888 ± 33%  interrupts.CPU0.PMI:Performance_monitoring_interrupts
      8786 ± 30%     -56.2%       3851 ± 34%  interrupts.CPU1.NMI:Non-maskable_interrupts
      8786 ± 30%     -56.2%       3851 ± 34%  interrupts.CPU1.PMI:Performance_monitoring_interrupts
    612263           +61.8%     990932 ± 33%  interrupts.CPU2.LOC:Local_timer_interrupts
      9495 ± 32%     -57.1%       4074 ± 29%  interrupts.CPU2.NMI:Non-maskable_interrupts
      9495 ± 32%     -57.1%       4074 ± 29%  interrupts.CPU2.PMI:Performance_monitoring_interrupts
      9584 ± 33%     -59.9%       3840 ± 34%  interrupts.CPU3.NMI:Non-maskable_interrupts
      9584 ± 33%     -59.9%       3840 ± 34%  interrupts.CPU3.PMI:Performance_monitoring_interrupts
      2763 ± 26%     +61.8%       4472 ± 39%  interrupts.CPU3.RES:Rescheduling_interrupts
     37394 ± 19%     -58.1%      15654 ± 33%  interrupts.NMI:Non-maskable_interrupts
     37394 ± 19%     -58.1%      15654 ± 33%  interrupts.PMI:Performance_monitoring_interrupts
      8.09 ±  6%     +95.0%      15.78 ±  6%  sched_debug.cfs_rq:/.nr_spread_over.avg
      2.80 ± 22%     +76.7%       4.95 ± 11%  sched_debug.cpu.clock.stddev
      2.80 ± 22%     +76.7%       4.95 ± 11%  sched_debug.cpu.clock_task.stddev
    438229           -10.4%     392443        sched_debug.cpu.nr_switches.avg
   1517352           -21.2%    1195573 ± 21%  sched_debug.cpu.nr_switches.max
    623414           -24.4%     471096 ± 28%  sched_debug.cpu.nr_switches.stddev
     14.88 ± 24%     -37.5%       9.29 ± 27%  sched_debug.cpu.nr_uninterruptible.max
     12.00 ± 17%     -36.2%       7.65 ± 31%  sched_debug.cpu.nr_uninterruptible.stddev
    427216           -10.8%     381061        sched_debug.cpu.sched_count.avg
   1504714           -21.4%    1183009 ± 21%  sched_debug.cpu.sched_count.max
    622334           -24.4%     470248 ± 28%  sched_debug.cpu.sched_count.stddev
      2092 ±  5%     -17.1%       1733 ±  8%  sched_debug.cpu.sched_goidle.avg
      7392 ±  2%     -22.0%       5765 ±  8%  sched_debug.cpu.sched_goidle.max
      3068 ±  2%     -23.3%       2353 ±  8%  sched_debug.cpu.sched_goidle.stddev
    201296           -11.7%     177691        sched_debug.cpu.ttwu_count.avg
    745070           -21.8%     582561 ± 21%  sched_debug.cpu.ttwu_count.max
    314071           -24.4%     237534 ± 28%  sched_debug.cpu.ttwu_count.stddev
    199498           -11.9%     175832        sched_debug.cpu.ttwu_local.avg
    742719           -21.8%     580797 ± 22%  sched_debug.cpu.ttwu_local.max
    313751           -24.3%     237514 ± 28%  sched_debug.cpu.ttwu_local.stddev
      9.32 ±  2%      +4.2%       9.71        perf-stat.i.MPKI
 1.086e+09           -50.2%  5.413e+08        perf-stat.i.branch-instructions
      1.15            +0.4        1.54        perf-stat.i.branch-miss-rate%
  12695088           -33.1%    8486745        perf-stat.i.branch-misses
      0.54 ±  3%      +0.6        1.13 ±  8%  perf-stat.i.cache-miss-rate%
    246256 ±  2%     +19.2%     293546 ±  6%  perf-stat.i.cache-misses
  52411761 ±  2%     -48.3%   27076758        perf-stat.i.cache-references
      7390            -9.7%       6670        perf-stat.i.context-switches
      2.33            -2.6%       2.27        perf-stat.i.cpi
 1.307e+10           -51.8%  6.306e+09        perf-stat.i.cpu-cycles
  34220176 ± 18%     -57.3%   14615385        perf-stat.i.dTLB-load-misses
 2.468e+09           -52.0%  1.184e+09        perf-stat.i.dTLB-loads
   7490630 ± 22%     -58.6%    3104328 ±  2%  perf-stat.i.dTLB-store-misses
 1.986e+09           -52.7%  9.391e+08        perf-stat.i.dTLB-stores
   3025273 ± 12%     -54.1%    1388723 ±  8%  perf-stat.i.iTLB-load-misses
   2588287 ± 15%     -52.3%    1233650 ± 10%  perf-stat.i.iTLB-loads
 5.623e+09           -50.4%  2.788e+09        perf-stat.i.instructions
      0.43            +2.7%       0.44        perf-stat.i.ipc
      9.32 ±  2%      +4.2%       9.71        perf-stat.overall.MPKI
      1.17            +0.4        1.57        perf-stat.overall.branch-miss-rate%
      0.47 ±  4%      +0.6        1.09 ±  7%  perf-stat.overall.cache-miss-rate%
      2.33            -2.7%       2.26        perf-stat.overall.cpi
     53132 ±  2%     -59.5%      21545 ±  5%  perf-stat.overall.cycles-between-cache-misses
      0.43            +2.8%       0.44        perf-stat.overall.ipc
    527736            +6.7%     563118        perf-stat.overall.path-length
 1.082e+09           -50.2%  5.395e+08        perf-stat.ps.branch-instructions
  12653139           -33.1%    8460228        perf-stat.ps.branch-misses
    245442 ±  2%     +19.3%     292736 ±  6%  perf-stat.ps.cache-misses
  52238268 ±  2%     -48.3%   26985343        perf-stat.ps.cache-references
      7365            -9.8%       6644        perf-stat.ps.context-switches
 1.303e+10           -51.8%  6.285e+09        perf-stat.ps.cpu-cycles
  34106851 ± 18%     -57.3%   14566371        perf-stat.ps.dTLB-load-misses
 2.459e+09           -52.0%   1.18e+09        perf-stat.ps.dTLB-loads
   7465822 ± 22%     -58.6%    3094548 ±  2%  perf-stat.ps.dTLB-store-misses
 1.979e+09           -52.7%   9.36e+08        perf-stat.ps.dTLB-stores
   3015254 ± 12%     -54.1%    1384053 ±  8%  perf-stat.ps.iTLB-load-misses
   2579716 ± 15%     -52.3%    1229518 ± 10%  perf-stat.ps.iTLB-loads
 5.604e+09           -50.4%  2.779e+09        perf-stat.ps.instructions
 1.693e+12           -50.3%  8.411e+11        perf-stat.total.instructions
     46.68            -1.2       45.47        perf-profile.calltrace.cycles-pp.new_sync_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     62.98            -1.0       61.99        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     43.51            -0.9       42.59        perf-profile.calltrace.cycles-pp.shmem_file_read_iter.new_sync_read.vfs_read.ksys_read.do_syscall_64
     79.65            -0.8       78.83        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     80.71            -0.8       79.91        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
     14.02 ±  4%      -0.8       13.27 ±  2%  perf-profile.calltrace.cycles-pp.shmem_getpage_gfp.shmem_file_read_iter.new_sync_read.vfs_read.ksys_read
     99.08            -0.7       98.38        perf-profile.calltrace.cycles-pp.read
      0.14 ±173%      +0.4        0.56 ±  4%  perf-profile.calltrace.cycles-pp.timestamp_truncate.current_time.atime_needs_update.touch_atime.shmem_file_read_iter
     46.81            -1.2       45.59        perf-profile.children.cycles-pp.new_sync_read
     63.05            -1.0       62.07        perf-profile.children.cycles-pp.ksys_read
     43.70            -0.9       42.76        perf-profile.children.cycles-pp.shmem_file_read_iter
     14.12 ±  4%      -0.8       13.36 ±  2%  perf-profile.children.cycles-pp.shmem_getpage_gfp
     80.09            -0.5       79.54        perf-profile.children.cycles-pp.do_syscall_64
     99.44            -0.5       98.90        perf-profile.children.cycles-pp.read
     81.11            -0.5       80.58        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.03 ±100%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.01 ±173%      +0.1        0.07 ± 15%  perf-profile.children.cycles-pp.prepare_exit_to_usermode
      0.03 ±100%      +0.1        0.10 ± 24%  perf-profile.children.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      0.04 ± 58%      +0.1        0.11 ± 23%  perf-profile.children.cycles-pp.handle_pte_fault
      0.06 ± 11%      +0.1        0.14 ± 34%  perf-profile.children.cycles-pp.__sched_text_start
      0.00            +0.1        0.08 ± 27%  perf-profile.children.cycles-pp.exit_to_usermode_loop
      0.04 ± 58%      +0.1        0.12 ± 25%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.03 ±100%      +0.1        0.10 ± 25%  perf-profile.children.cycles-pp.schedule
      0.03 ±102%      +0.1        0.11 ± 19%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.1        0.08 ± 17%  perf-profile.children.cycles-pp.search_binary_handler
      0.00            +0.1        0.08 ± 17%  perf-profile.children.cycles-pp.load_elf_binary
      0.04 ± 58%      +0.1        0.12 ± 23%  perf-profile.children.cycles-pp.handle_mm_fault
      0.03 ±100%      +0.1        0.12 ± 24%  perf-profile.children.cycles-pp.__do_execve_file
      0.03 ±100%      +0.1        0.12 ± 21%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.07 ± 17%      +0.1        0.16 ± 19%  perf-profile.children.cycles-pp.page_fault
      0.03 ±100%      +0.1        0.12 ± 22%  perf-profile.children.cycles-pp.execve
      0.05 ± 58%      +0.1        0.14 ± 19%  perf-profile.children.cycles-pp.do_page_fault
      0.00            +0.1        0.10 ± 22%  perf-profile.children.cycles-pp.write
      0.47 ± 24%      +0.1        0.58 ±  3%  perf-profile.children.cycles-pp.timestamp_truncate
      0.09 ±  7%      +0.1        0.20 ±  5%  perf-profile.children.cycles-pp.task_tick_fair
      0.11 ±  4%      +0.1        0.22 ±  6%  perf-profile.children.cycles-pp.scheduler_tick
      0.04 ± 60%      +0.2        0.22 ± 28%  perf-profile.children.cycles-pp.irq_work_run
      0.04 ± 60%      +0.2        0.22 ± 28%  perf-profile.children.cycles-pp.printk
      0.04 ± 60%      +0.2        0.22 ± 28%  perf-profile.children.cycles-pp.vprintk_emit
      0.04 ± 60%      +0.2        0.23 ± 26%  perf-profile.children.cycles-pp.irq_work_interrupt
      0.04 ± 60%      +0.2        0.23 ± 26%  perf-profile.children.cycles-pp.smp_irq_work_interrupt
      0.04 ± 59%      +0.2        0.24 ± 26%  perf-profile.children.cycles-pp.drm_fb_helper_cfb_imageblit
      0.04 ± 58%      +0.2        0.24 ± 26%  perf-profile.children.cycles-pp.cfb_imageblit
      0.06 ± 13%      +0.2        0.26 ± 26%  perf-profile.children.cycles-pp.fbcon_putcs
      0.07 ± 13%      +0.2        0.27 ± 28%  perf-profile.children.cycles-pp.lf
      0.07 ± 13%      +0.2        0.27 ± 28%  perf-profile.children.cycles-pp.con_scroll
      0.07 ± 13%      +0.2        0.27 ± 28%  perf-profile.children.cycles-pp.fbcon_scroll
      0.07 ± 13%      +0.2        0.27 ± 28%  perf-profile.children.cycles-pp.fbcon_redraw
      0.15 ±  9%      +0.2        0.36 ± 16%  perf-profile.children.cycles-pp.update_process_times
      0.07 ± 13%      +0.2        0.27 ± 29%  perf-profile.children.cycles-pp.vt_console_print
      0.07 ± 13%      +0.2        0.28 ± 30%  perf-profile.children.cycles-pp.console_unlock
      0.15 ±  9%      +0.2        0.36 ± 18%  perf-profile.children.cycles-pp.tick_sched_handle
      0.05 ± 58%      +0.2        0.26 ± 26%  perf-profile.children.cycles-pp.bit_putcs
      0.07 ± 17%      +0.2        0.29 ± 27%  perf-profile.children.cycles-pp.irq_work_run_list
      0.18 ± 10%      +0.2        0.42 ± 17%  perf-profile.children.cycles-pp.tick_sched_timer
      2.16 ±  6%      +0.3        2.44 ±  7%  perf-profile.children.cycles-pp.__fsnotify_parent
      0.27 ± 12%      +0.3        0.59 ± 16%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.38 ± 10%      +0.4        0.73 ± 12%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.48 ± 17%      +0.4        0.89 ± 12%  perf-profile.children.cycles-pp.smp_apic_timer_interrupt
      0.53 ± 15%      +0.5        0.98 ± 10%  perf-profile.children.cycles-pp.apic_timer_interrupt
      0.58 ± 11%      -0.1        0.46 ±  2%  perf-profile.self.cycles-pp.touch_atime
      0.57 ±  6%      -0.1        0.48 ±  9%  perf-profile.self.cycles-pp.aa_file_perm
      0.42 ± 22%      +0.1        0.53 ±  4%  perf-profile.self.cycles-pp.timestamp_truncate
      1.02 ± 11%      +0.1        1.17 ±  5%  perf-profile.self.cycles-pp.security_file_permission
      0.04 ± 58%      +0.2        0.24 ± 26%  perf-profile.self.cycles-pp.cfb_imageblit


                                                                                
                            will-it-scale.per_process_ops                       
                                                                                
  220000 +------------------------------------------------------------------+   
         |                                                                  |   
  200000 |.+.+..+.+.+.+..+.+.+.+..+.+.+.+..+.+.+.+.+..+.+.+.+..+.+.+.+..+.+.|   
         |                                                                  |   
  180000 |-+                                                                |   
         |                                                                  |   
  160000 |-+                                                                |   
         |                                                                  |   
  140000 |-+                                                                |   
         |                                                                  |   
  120000 |-+                                                                |   
         |                                                                  |   
  100000 |-+                                                                |   
         |          O O  O O O O  O O O O  O O O O O  O O O O  O O O O  O   |   
   80000 +------------------------------------------------------------------+   
                                                                                
                                                                                                                                                                
                                will-it-scale.workload                          
                                                                                
  3.4e+06 +-----------------------------------------------------------------+   
  3.2e+06 |.+.+..+.+.+.+.+..+.+.+.+.+..+.+.+.+.+..+.+.+.+.+..+.+.+.+.+..+.+.|   
          |                                                                 |   
    3e+06 |-+                                                               |   
  2.8e+06 |-+                                                               |   
  2.6e+06 |-+                                                               |   
  2.4e+06 |-+                                                               |   
          |                                                                 |   
  2.2e+06 |-+                                                               |   
    2e+06 |-+                                                               |   
  1.8e+06 |-+                                                               |   
  1.6e+06 |-+                                                               |   
          |          O O O  O O O O O  O O O O O  O O O O O  O O O O O  O   |   
  1.4e+06 |-O O  O O                                                        |   
  1.2e+06 +-----------------------------------------------------------------+   
                                                                                
                                                                                
[*] bisect-good sample
[O] bisect-bad  sample

***************************************************************************************************
lkp-ivb-d04: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G memory
=========================================================================================
compiler/cpufreq_governor/ipc/kconfig/mode/nr_threads/rootfs/tbox_group/testcase/ucode:
  gcc-7/performance/socket/x86_64-rhel-7.6/process/100%/debian-x86_64-20191114.cgz/lkp-ivb-d04/hackbench/0x21

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4           25%           1:4     dmesg.RIP:__bitmap_and
           :4           50%           2:4     dmesg.RIP:__do_softirq
           :4          100%           4:4     dmesg.RIP:cpuidle_enter_state
           :4           25%           1:4     dmesg.RIP:rebalance_domains
           :4           25%           1:4     dmesg.RIP:update_group_capacity
          1:4          -25%            :4     dmesg.WARNING:at#for_ip_interrupt_entry/0x
           :4           25%           1:4     dmesg.WARNING:at_ip__slab_free/0x
         %stddev     %change         %stddev
             \          |                \  
     10652           -50.9%       5226        hackbench.throughput
    616.45            +1.9%     628.27        hackbench.time.elapsed_time
    616.45            +1.9%     628.27        hackbench.time.elapsed_time.max
  26183210           -52.6%   12416370        hackbench.time.involuntary_context_switches
    133947           -49.6%      67461        hackbench.time.minor_page_faults
    462.13            +2.6%     473.97        hackbench.time.user_time
  82356140           -47.7%   43050586        hackbench.time.voluntary_context_switches
  67200000           -50.0%   33600000        hackbench.workload
     29592 ±  3%      -8.4%      27109        meminfo.Shmem
      1.45 ±  8%      -0.6        0.87 ± 13%  mpstat.cpu.all.idle%
     28.95 ±  2%     +18.3%      34.23 ±  4%  boot-time.boot
     10.58 ±  3%     +22.1%      12.93 ± 13%  boot-time.dhcp
     78.27           +12.4%      88.00 ±  5%  boot-time.idle
     19.00            +5.3%      20.00        vmstat.cpu.us
     58.00           +18.5%      68.75        vmstat.procs.r
    180350           -49.3%      91464        vmstat.system.cs
     42160           -42.9%      24058        vmstat.system.in
     19833 ±  6%     -30.1%      13870 ± 13%  softirqs.CPU0.SCHED
     19573 ±  5%     -34.8%      12762 ± 16%  softirqs.CPU1.SCHED
     20252 ±  8%     -30.6%      14056 ± 11%  softirqs.CPU2.SCHED
     18589 ±  2%     -28.1%      13361 ± 10%  softirqs.CPU3.SCHED
     78249           -30.9%      54050 ±  2%  softirqs.SCHED
  15428247           -41.1%    9093566        cpuidle.C1.time
    741881           -46.2%     399347 ±  2%  cpuidle.C1.usage
   9236605 ±  7%     -48.0%    4805448 ± 16%  cpuidle.C1E.time
    206514 ±  3%     -67.0%      68057 ± 13%  cpuidle.C1E.usage
   4812772 ± 24%     -54.1%    2207098 ±  6%  cpuidle.C3.time
     66794 ± 10%     -80.2%      13243 ± 16%  cpuidle.C3.usage
    440850 ±  2%     -85.1%      65487        cpuidle.POLL.time
    346018 ±  3%     -93.2%      23631        cpuidle.POLL.usage
     66449            -5.4%      62844        proc-vmstat.nr_active_anon
     64201            -4.7%      61203        proc-vmstat.nr_anon_pages
      7397 ±  3%      -8.3%       6781        proc-vmstat.nr_shmem
      8621            -2.4%       8411        proc-vmstat.nr_slab_unreclaimable
     66456            -5.4%      62852        proc-vmstat.nr_zone_active_anon
   4483913           -46.2%    2411000        proc-vmstat.numa_hit
   4483913           -46.2%    2411000        proc-vmstat.numa_local
      1889 ± 18%     -36.0%       1209 ± 12%  proc-vmstat.pgactivate
   5162998 ±  3%     -54.1%    2367999        proc-vmstat.pgalloc_dma32
   1233551 ± 13%     -20.8%     977411 ±  2%  proc-vmstat.pgalloc_normal
    848575           -13.5%     733782        proc-vmstat.pgfault
   6375521           -47.8%    3325722        proc-vmstat.pgfree
      1061 ±  2%     -11.7%     936.75 ±  4%  slabinfo.cred_jar.num_objs
    639.00 ±  4%     -13.5%     552.50        slabinfo.files_cache.num_objs
      2357 ±  4%     -25.7%       1751        slabinfo.filp.num_objs
      5718 ±  2%      -8.9%       5207        slabinfo.kmalloc-64.active_objs
      5718 ±  2%      -8.9%       5207        slabinfo.kmalloc-64.num_objs
    504.00 ±  8%     -25.0%     378.00 ± 13%  slabinfo.kmalloc-rcl-96.active_objs
    504.00 ±  8%     -25.0%     378.00 ± 13%  slabinfo.kmalloc-rcl-96.num_objs
    999.50 ±  3%     -15.0%     849.25 ±  2%  slabinfo.pid.active_objs
      1005 ±  3%     -15.5%     849.25 ±  2%  slabinfo.pid.num_objs
      1005 ±  2%     -22.7%     776.75 ±  6%  slabinfo.task_delay_info.active_objs
      1005 ±  2%     -22.7%     776.75 ±  6%  slabinfo.task_delay_info.num_objs
      4627           -28.4%       3312        slabinfo.vmap_area.active_objs
      4627           -28.4%       3312        slabinfo.vmap_area.num_objs
    105.25 ± 18%     -47.7%      55.00 ±  6%  interrupts.CPU0.CAL:Function_call_interrupts
   5147603           -52.0%    2471968        interrupts.CPU0.RES:Rescheduling_interrupts
      8503 ± 26%     -53.6%       3942 ± 32%  interrupts.CPU1.NMI:Non-maskable_interrupts
      8503 ± 26%     -53.6%       3942 ± 32%  interrupts.CPU1.PMI:Performance_monitoring_interrupts
   5150886           -52.1%    2469304 ±  2%  interrupts.CPU1.RES:Rescheduling_interrupts
      8809 ± 30%     -65.1%       3073        interrupts.CPU2.NMI:Non-maskable_interrupts
      8809 ± 30%     -65.1%       3073        interrupts.CPU2.PMI:Performance_monitoring_interrupts
   5323969           -52.9%    2509857 ±  2%  interrupts.CPU2.RES:Rescheduling_interrupts
      9425 ± 32%     -43.6%       5312 ± 24%  interrupts.CPU3.NMI:Non-maskable_interrupts
      9425 ± 32%     -43.6%       5312 ± 24%  interrupts.CPU3.PMI:Performance_monitoring_interrupts
   5218416           -52.1%    2502172 ±  2%  interrupts.CPU3.RES:Rescheduling_interrupts
     34610 ± 19%     -49.4%      17508 ± 17%  interrupts.NMI:Non-maskable_interrupts
     34610 ± 19%     -49.4%      17508 ± 17%  interrupts.PMI:Performance_monitoring_interrupts
  20840876           -52.2%    9953302        interrupts.RES:Rescheduling_interrupts
    138.00 ± 10%     -76.8%      32.00 ± 21%  interrupts.TLB:TLB_shootdowns
    221.11 ±  5%      -9.6%     199.95 ±  3%  sched_debug.cfs_rq:/.load_avg.min
     17205 ± 13%     +39.0%      23921 ± 14%  sched_debug.cfs_rq:/.min_vruntime.stddev
     88.73 ±  4%     +15.8%     102.75 ±  6%  sched_debug.cfs_rq:/.runnable_load_avg.stddev
     11838 ± 74%     +97.7%      23405 ±  9%  sched_debug.cfs_rq:/.spread0.avg
     36932 ± 29%     +60.6%      59303 ± 10%  sched_debug.cfs_rq:/.spread0.max
     17191 ± 13%     +39.0%      23899 ± 14%  sched_debug.cfs_rq:/.spread0.stddev
    312.17 ± 17%     +47.3%     459.76 ± 17%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    599.45 ± 11%     +49.6%     896.68 ± 15%  sched_debug.cfs_rq:/.util_est_enqueued.max
    207.23 ± 10%     +47.4%     305.45 ± 11%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    192714 ±  5%     +35.9%     261993 ± 19%  sched_debug.cpu.avg_idle.max
     62207 ±  7%     +41.7%      88152 ± 18%  sched_debug.cpu.avg_idle.stddev
      8.93 ± 23%    +156.3%      22.88 ± 41%  sched_debug.cpu.clock.stddev
      8.93 ± 23%    +156.3%      22.88 ± 41%  sched_debug.cpu.clock_task.stddev
      5421 ±  4%     -20.3%       4320 ±  3%  sched_debug.cpu.curr->pid.avg
      6032           -17.4%       4985        sched_debug.cpu.curr->pid.max
      4386 ± 13%     -21.2%       3455 ± 16%  sched_debug.cpu.curr->pid.min
      0.00 ±  5%     +32.5%       0.00 ± 21%  sched_debug.cpu.next_balance.stddev
  13635331           -49.5%    6886404        sched_debug.cpu.nr_switches.avg
  13949714           -48.8%    7142472        sched_debug.cpu.nr_switches.max
  13214558           -49.6%    6655528        sched_debug.cpu.nr_switches.min
      8.74            +6.1%       9.27        perf-stat.i.MPKI
 1.157e+09           -49.3%  5.864e+08        perf-stat.i.branch-instructions
      2.25            +0.1        2.40        perf-stat.i.branch-miss-rate%
  26103488           -45.9%   14110500        perf-stat.i.branch-misses
     20.51            -1.1       19.42        perf-stat.i.cache-miss-rate%
  10183776           -49.0%    5191242        perf-stat.i.cache-misses
  52006330           -46.4%   27886153        perf-stat.i.cache-references
    180002           -49.2%      91520        perf-stat.i.context-switches
      2.17            -4.2%       2.08        perf-stat.i.cpi
 1.292e+10           -51.5%  6.268e+09        perf-stat.i.cpu-cycles
      1278           -33.4%     851.81 ± 17%  perf-stat.i.cpu-migrations
      1459 ±  3%      -6.0%       1371        perf-stat.i.cycles-between-cache-misses
      3.19 ±  4%      -0.3        2.87 ±  7%  perf-stat.i.dTLB-load-miss-rate%
  57028288 ±  4%     -55.1%   25620015 ±  7%  perf-stat.i.dTLB-load-misses
  1.73e+09           -49.8%   8.68e+08        perf-stat.i.dTLB-loads
      0.57            -0.0        0.56        perf-stat.i.dTLB-store-miss-rate%
   7290773           -51.5%    3539051        perf-stat.i.dTLB-store-misses
 1.269e+09           -50.1%  6.333e+08        perf-stat.i.dTLB-stores
   4136276           -50.5%    2047504        perf-stat.i.iTLB-load-misses
    159476 ±  4%     -47.5%      83773 ±  4%  perf-stat.i.iTLB-loads
 5.963e+09           -49.3%  3.021e+09        perf-stat.i.instructions
      1509            +2.2%       1542        perf-stat.i.instructions-per-iTLB-miss
      0.46            +4.4%       0.48        perf-stat.i.ipc
      1338           -15.5%       1131        perf-stat.i.minor-faults
      1338           -15.5%       1131        perf-stat.i.page-faults
      8.72            +5.8%       9.23        perf-stat.overall.MPKI
      2.26            +0.1        2.41        perf-stat.overall.branch-miss-rate%
     19.58            -1.0       18.62        perf-stat.overall.cache-miss-rate%
      2.17            -4.3%       2.08        perf-stat.overall.cpi
      1269            -4.9%       1207        perf-stat.overall.cycles-between-cache-misses
      3.19 ±  4%      -0.3        2.87 ±  7%  perf-stat.overall.dTLB-load-miss-rate%
      0.57            -0.0        0.56        perf-stat.overall.dTLB-store-miss-rate%
      1441            +2.4%       1475        perf-stat.overall.instructions-per-iTLB-miss
      0.46            +4.4%       0.48        perf-stat.overall.ipc
     54691            +3.3%      56503        perf-stat.overall.path-length
 1.155e+09           -49.3%  5.855e+08        perf-stat.ps.branch-instructions
  26062433           -45.9%   14088880        perf-stat.ps.branch-misses
  10167610           -49.0%    5183840        perf-stat.ps.cache-misses
  51918727           -46.4%   27836233        perf-stat.ps.cache-references
    179688           -49.2%      91329        perf-stat.ps.context-switches
  1.29e+10           -51.5%  6.258e+09        perf-stat.ps.cpu-cycles
      1276           -33.4%     849.56 ± 17%  perf-stat.ps.cpu-migrations
  56934513 ±  4%     -55.1%   25577876 ±  7%  perf-stat.ps.dTLB-load-misses
 1.727e+09           -49.8%  8.667e+08        perf-stat.ps.dTLB-loads
   7278857           -51.5%    3533338        perf-stat.ps.dTLB-store-misses
 1.267e+09           -50.1%  6.323e+08        perf-stat.ps.dTLB-stores
   4129263           -50.5%    2043682        perf-stat.ps.iTLB-load-misses
    159193 ±  4%     -47.5%      83601 ±  4%  perf-stat.ps.iTLB-loads
 5.954e+09           -49.3%  3.016e+09        perf-stat.ps.instructions
      1336           -15.5%       1129        perf-stat.ps.minor-faults
      1336           -15.5%       1129        perf-stat.ps.page-faults
 3.675e+12           -48.3%  1.899e+12        perf-stat.total.instructions
      1.12 ± 11%      -0.7        0.39 ± 57%  perf-profile.calltrace.cycles-pp.secondary_startup_64
      2.75            -0.7        2.06 ±  6%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      2.84            -0.7        2.15 ±  5%  perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      3.82 ±  2%      -0.6        3.18 ±  2%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      9.99            -0.5        9.44        perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.new_sync_write
      1.40 ±  8%      -0.5        0.90 ±  5%  perf-profile.calltrace.cycles-pp.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_read_iter
      1.53 ±  4%      -0.5        1.03 ±  7%  perf-profile.calltrace.cycles-pp.skb_set_owner_w.sock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter
      7.46            -0.5        7.00        perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
      5.44 ±  3%      -0.4        4.99 ±  3%  perf-profile.calltrace.cycles-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_read_iter.new_sync_read
     28.44            -0.4       28.02        perf-profile.calltrace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.70            -0.4        7.28        perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_read_iter.new_sync_read
      7.60            -0.4        7.18        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_read_iter
      1.18 ±  6%      -0.2        1.01 ±  8%  perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.new_sync_write
      1.54            +0.1        1.62 ±  3%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
      1.69            +0.1        1.81 ±  5%  perf-profile.calltrace.cycles-pp.sock_recvmsg.sock_read_iter.new_sync_read.vfs_read.ksys_read
      0.86 ±  5%      +0.1        1.00 ±  7%  perf-profile.calltrace.cycles-pp.fsnotify.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.77 ±  4%      +0.2        1.97 ±  8%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.95 ±  3%      +0.2        4.19 ±  2%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.new_sync_write
      4.12 ±  3%      +0.7        4.84 ±  8%  perf-profile.calltrace.cycles-pp.__sched_text_start.schedule.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg
      2.85            -0.7        2.16 ±  6%  perf-profile.children.cycles-pp.copyout
      3.61 ±  2%      -0.7        2.95 ±  4%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      3.85 ±  2%      -0.7        3.20 ±  2%  perf-profile.children.cycles-pp._copy_to_iter
      1.12 ± 11%      -0.6        0.51 ±  6%  perf-profile.children.cycles-pp.secondary_startup_64
      1.12 ± 11%      -0.6        0.51 ±  6%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.12 ± 11%      -0.6        0.51 ±  6%  perf-profile.children.cycles-pp.do_idle
     10.01            -0.5        9.46        perf-profile.children.cycles-pp.sock_alloc_send_pskb
      0.97 ±  8%      -0.5        0.44 ± 10%  perf-profile.children.cycles-pp.cpuidle_enter
      0.97 ±  8%      -0.5        0.44 ± 10%  perf-profile.children.cycles-pp.cpuidle_enter_state
      1.41 ±  8%      -0.5        0.90 ±  4%  perf-profile.children.cycles-pp.skb_release_data
      0.88 ± 20%      -0.5        0.38 ±  4%  perf-profile.children.cycles-pp.start_secondary
     28.59            -0.5       28.09        perf-profile.children.cycles-pp.new_sync_write
      1.54 ±  4%      -0.5        1.05 ±  8%  perf-profile.children.cycles-pp.skb_set_owner_w
      0.90 ±  4%      -0.5        0.42 ±  9%  perf-profile.children.cycles-pp.intel_idle
      7.48            -0.5        7.03        perf-profile.children.cycles-pp.__skb_datagram_iter
      5.45 ±  3%      -0.4        5.00 ±  3%  perf-profile.children.cycles-pp.consume_skb
      7.72            -0.4        7.30        perf-profile.children.cycles-pp.unix_stream_read_actor
      7.62            -0.4        7.21        perf-profile.children.cycles-pp.skb_copy_datagram_iter
      0.24 ± 22%      -0.1        0.13 ± 14%  perf-profile.children.cycles-pp.start_kernel
      0.10 ±  9%      -0.0        0.06 ± 20%  perf-profile.children.cycles-pp.should_failslab
      0.06 ± 17%      +0.0        0.09 ± 17%  perf-profile.children.cycles-pp.interrupt_entry
      0.08            +0.0        0.12 ± 13%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.11 ± 11%      +0.0        0.16 ±  7%  perf-profile.children.cycles-pp.rw_verify_area
      0.33 ±  7%      +0.0        0.38 ±  8%  perf-profile.children.cycles-pp.ttwu_do_wakeup
      0.04 ± 58%      +0.1        0.09 ± 14%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.04 ± 57%      +0.1        0.10 ± 18%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.04 ± 57%      +0.1        0.10 ± 18%  perf-profile.children.cycles-pp.__do_execve_file
      0.04 ± 58%      +0.1        0.10 ± 13%  perf-profile.children.cycles-pp.handle_mm_fault
      0.04 ± 58%      +0.1        0.10 ± 20%  perf-profile.children.cycles-pp.execve
      0.03 ±100%      +0.1        0.09 ± 21%  perf-profile.children.cycles-pp.handle_pte_fault
      0.01 ±173%      +0.1        0.07 ± 22%  perf-profile.children.cycles-pp.search_binary_handler
      0.01 ±173%      +0.1        0.07 ± 22%  perf-profile.children.cycles-pp.load_elf_binary
      0.01 ±173%      +0.1        0.07 ± 30%  perf-profile.children.cycles-pp.exit_mmap
      0.05 ± 61%      +0.1        0.12 ± 15%  perf-profile.children.cycles-pp.do_page_fault
      0.01 ±173%      +0.1        0.08 ± 27%  perf-profile.children.cycles-pp.mmput
      0.00            +0.1        0.07 ± 28%  perf-profile.children.cycles-pp.clockevents_program_event
      0.28 ± 10%      +0.1        0.35 ±  8%  perf-profile.children.cycles-pp.update_rq_clock
      0.07 ± 21%      +0.1        0.14 ± 18%  perf-profile.children.cycles-pp.task_tick_fair
      0.05 ± 61%      +0.1        0.13 ±  6%  perf-profile.children.cycles-pp.page_fault
      0.00            +0.1        0.08 ± 13%  perf-profile.children.cycles-pp.read
      1.64            +0.1        1.73 ±  4%  perf-profile.children.cycles-pp.activate_task
      1.59            +0.1        1.69 ±  4%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.62 ±  8%      +0.1        0.72 ±  4%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.08 ± 17%      +0.1        0.19 ± 15%  perf-profile.children.cycles-pp.scheduler_tick
      0.18 ± 23%      +0.1        0.30 ± 19%  perf-profile.children.cycles-pp.update_process_times
      0.19 ± 23%      +0.1        0.32 ± 20%  perf-profile.children.cycles-pp.tick_sched_handle
      0.14 ± 27%      +0.2        0.30 ±  7%  perf-profile.children.cycles-pp.prepare_exit_to_usermode
      0.22 ± 17%      +0.2        0.38 ± 10%  perf-profile.children.cycles-pp.tick_sched_timer
      3.24 ±  2%      +0.2        3.42 ±  3%  perf-profile.children.cycles-pp.simple_copy_to_iter
      0.16 ± 24%      +0.2        0.37 ±  7%  perf-profile.children.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      1.29 ±  3%      +0.2        1.52 ±  9%  perf-profile.children.cycles-pp.fsnotify
      4.65 ±  2%      +0.2        4.88        perf-profile.children.cycles-pp.__check_object_size
      3.98 ±  3%      +0.2        4.22 ±  2%  perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      0.30 ± 13%      +0.3        0.56 ± 10%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.34 ± 34%      +0.3        0.62 ± 38%  perf-profile.children.cycles-pp.io_serial_in
      0.51 ± 20%      +0.3        0.80 ± 23%  perf-profile.children.cycles-pp.irq_work_run_list
      0.46 ± 28%      +0.3        0.76 ± 20%  perf-profile.children.cycles-pp.irq_work_interrupt
      0.46 ± 28%      +0.3        0.76 ± 20%  perf-profile.children.cycles-pp.smp_irq_work_interrupt
      0.46 ± 28%      +0.3        0.76 ± 20%  perf-profile.children.cycles-pp.irq_work_run
      0.46 ± 28%      +0.3        0.76 ± 20%  perf-profile.children.cycles-pp.printk
      0.38 ± 11%      +0.3        0.72 ±  6%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.49 ±  3%      +0.4        0.89 ±  4%  perf-profile.children.cycles-pp.smp_apic_timer_interrupt
      0.52 ±  3%      +0.4        0.97 ±  4%  perf-profile.children.cycles-pp.apic_timer_interrupt
      3.58 ±  2%      -0.7        2.89 ±  4%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      3.50 ±  3%      -0.6        2.91        perf-profile.self.cycles-pp.unix_stream_read_generic
      0.90 ±  4%      -0.5        0.42 ±  9%  perf-profile.self.cycles-pp.intel_idle
      1.50 ±  3%      -0.5        1.02 ±  9%  perf-profile.self.cycles-pp.skb_set_owner_w
      1.35 ±  6%      -0.5        0.89 ±  4%  perf-profile.self.cycles-pp.skb_release_data
      0.67 ±  7%      -0.1        0.56 ±  5%  perf-profile.self.cycles-pp.new_sync_write
      0.25 ±  2%      -0.0        0.22 ±  4%  perf-profile.self.cycles-pp.___perf_sw_event
      0.12            +0.0        0.14 ±  9%  perf-profile.self.cycles-pp.pick_next_entity
      0.06 ± 17%      +0.0        0.09 ± 14%  perf-profile.self.cycles-pp.interrupt_entry
      0.13 ±  5%      +0.0        0.16 ±  7%  perf-profile.self.cycles-pp.security_socket_recvmsg
      0.22 ±  5%      +0.0        0.26 ±  6%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.08            +0.0        0.12 ± 13%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.11 ± 11%      +0.0        0.16 ±  7%  perf-profile.self.cycles-pp.rw_verify_area
      0.01 ±173%      +0.1        0.08 ± 11%  perf-profile.self.cycles-pp.prepare_exit_to_usermode
      0.19 ±  6%      +0.1        0.26 ± 11%  perf-profile.self.cycles-pp.update_load_avg
      0.00            +0.1        0.07 ± 11%  perf-profile.self.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      0.53 ±  4%      +0.1        0.61 ±  3%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.84 ±  4%      +0.1        0.96 ±  5%  perf-profile.self.cycles-pp.sock_write_iter



***************************************************************************************************
lkp-bdw-ex2: 160 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz with 256G memory
=========================================================================================
bs/compiler/cpufreq_governor/disk/fs2/fs/ioengine/kconfig/nr_task/rootfs/runtime/rw/tbox_group/test_size/testcase/ucode:
  4k/gcc-7/performance/1SSD/nfsv4/ext4/sync/x86_64-rhel-7.6/100%/debian-x86_64-20191114.cgz/300s/write/lkp-bdw-ex2/128G/fio-basic/0xb000038

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4          100%           4:4     dmesg.RIP:_raw_spin_unlock_irqrestore
           :4          100%           4:4     dmesg.RIP:cpuidle_enter_state
           :4           25%           1:4     dmesg.RIP:find_busiest_group
         %stddev     %change         %stddev
             \          |                \  
      0.01            +0.0        0.03 ± 11%  fio.latency_1000us%
     50.49           -41.2        9.26 ±  8%  fio.latency_100us%
     11.47 ±  2%      +0.8       12.25 ±  2%  fio.latency_10us%
      5.50 ±  7%      +0.6        6.10 ±  5%  fio.latency_20us%
     14.81 ±  6%     +39.7       54.48        fio.latency_250us%
      0.01 ± 15%      +0.0        0.05 ±  3%  fio.latency_2ms%
      0.01            +0.0        0.03 ±  8%  fio.latency_4ms%
      6.11 ±  6%      -6.1        0.00        fio.latency_4us%
      0.22 ±  7%     +14.1       14.32 ±  6%  fio.latency_500us%
      0.26 ±  2%      -0.0        0.22 ±  7%  fio.latency_50ms%
     11.03 ±  9%      -8.2        2.81 ± 21%  fio.latency_50us%
      0.01 ± 10%      +0.3        0.36 ± 35%  fio.latency_750us%
     62.93           +19.0%      74.91        fio.time.elapsed_time
     62.93           +19.0%      74.91        fio.time.elapsed_time.max
     10763 ± 19%     +47.6%      15884 ± 13%  fio.time.involuntary_context_switches
      3480 ±  2%     +93.5%       6735 ±  2%  fio.time.percent_of_cpu_this_job_got
      2071 ±  2%    +128.0%       4723 ±  3%  fio.time.system_time
    118.74 ±  9%    +171.0%     321.75 ±  6%  fio.time.user_time
    118071 ±  2%     -11.8%     104102 ±  6%  fio.time.voluntary_context_switches
      2111           -15.4%       1785        fio.write_bw_MBps
    115712          +156.6%     296960 ±  2%  fio.write_clat_90%_us
    149504 ±  2%    +137.7%     355328 ±  2%  fio.write_clat_95%_us
    218112          +116.4%     472064 ±  3%  fio.write_clat_99%_us
    236227 ±  2%     +26.0%     297561 ±  3%  fio.write_clat_mean_us
   3218913 ±  2%      -6.0%    3025229 ±  3%  fio.write_clat_stddev
    540447           -15.4%     457198        fio.write_iops
     28.64 ± 11%     +15.3%      33.03 ± 10%  boot-time.dhcp
     38.57 ±  4%      -6.3       32.30 ±  2%  mpstat.cpu.all.idle%
     43.75 ±  4%     -11.2       32.52 ±  3%  mpstat.cpu.all.iowait%
     16.67 ±  2%     +16.1       32.74 ±  2%  mpstat.cpu.all.sys%
      1.01 ±  9%      +1.4        2.44 ±  6%  mpstat.cpu.all.usr%
     39.75 ±  4%     -15.1%      33.75 ±  2%  vmstat.cpu.id
     42.00 ±  4%     -25.6%      31.25 ±  4%  vmstat.cpu.wa
    825875           -14.9%     703107        vmstat.io.bo
 1.042e+08           -10.6%   93215832        vmstat.memory.cache
     88.25 ±  3%     -26.9%      64.50 ±  6%  vmstat.procs.b
     32.25 ±  4%    +104.7%      66.00 ±  3%  vmstat.procs.r
      9068           -20.3%       7223 ±  2%  vmstat.system.cs
 1.008e+08           -10.3%   90403887        meminfo.Cached
  75666224            -9.9%   68204627        meminfo.Dirty
  99657811           -10.4%   89290981        meminfo.Inactive
  99231982           -10.4%   88863754        meminfo.Inactive(file)
   2862205           -10.2%    2569201        meminfo.KReclaimable
 1.053e+08           -10.1%   94642730        meminfo.Memused
   2862205           -10.2%    2569201        meminfo.SReclaimable
    137009           -30.5%      95289        meminfo.Writeback
   2187195           -14.8%    1863029        meminfo.max_used_kB
     40.38 ±  4%     -15.8%      34.00 ±  2%  iostat.cpu.idle
     42.44 ±  4%     -25.3%      31.70 ±  3%  iostat.cpu.iowait
     16.19 ±  2%     +97.2%      31.92 ±  2%  iostat.cpu.system
      0.99 ±  9%    +141.7%       2.38 ±  6%  iostat.cpu.user
    890.43           -33.8%     589.25        iostat.nvme0n1.avgqu-sz
    725.23           +48.7%       1078        iostat.nvme0n1.avgrq-sz
    121.86           -32.9%      81.81        iostat.nvme0n1.await
     80.82           -11.9%      71.24        iostat.nvme0n1.util
      6454           -14.7%       5508        iostat.nvme0n1.w/s
    121.96           -32.9%      81.87        iostat.nvme0n1.w_await
    862871           -10.2%     775064        iostat.nvme0n1.wkB/s
     87.47 ±  4%     -16.5%      73.08 ±  6%  iostat.nvme0n1.wrqm/s
      0.26 ± 21%    +629.3%       1.89 ± 47%  sched_debug.cfs_rq:/.exec_clock.avg
     10.52 ± 19%    +190.0%      30.50 ± 13%  sched_debug.cfs_rq:/.exec_clock.max
      1.28 ± 10%    +320.4%       5.39 ± 29%  sched_debug.cfs_rq:/.exec_clock.stddev
     38450 ± 21%     +54.7%      59472 ± 15%  sched_debug.cfs_rq:/.min_vruntime.avg
     65419 ± 12%     +45.9%      95454 ± 11%  sched_debug.cfs_rq:/.min_vruntime.max
      5839 ± 10%     +57.4%       9193 ±  9%  sched_debug.cfs_rq:/.min_vruntime.stddev
     19196 ± 32%     +46.5%      28121 ± 19%  sched_debug.cfs_rq:/.spread0.max
      5825 ± 11%     +57.8%       9192 ±  9%  sched_debug.cfs_rq:/.spread0.stddev
      6.80 ± 21%     +85.0%      12.58 ±  5%  sched_debug.cpu.clock.stddev
      6.80 ± 21%     +85.0%      12.58 ±  5%  sched_debug.cpu.clock_task.stddev
      1045 ± 10%     -72.5%     287.75 ± 21%  sched_debug.cpu.nr_switches.min
    -38.75           +34.8%     -52.25        sched_debug.cpu.nr_uninterruptible.min
  18926599            -9.9%   17057835        proc-vmstat.nr_dirty
  25229381           -10.5%   22587355        proc-vmstat.nr_file_pages
  97433647            +2.8%  1.002e+08        proc-vmstat.nr_free_pages
  24843018           -10.6%   22199587        proc-vmstat.nr_inactive_file
     29311            +1.5%      29745        proc-vmstat.nr_kernel_stack
     47.75 ± 63%    +196.9%     141.75 ± 18%  proc-vmstat.nr_mlock
      4409            +4.2%       4592 ±  2%  proc-vmstat.nr_page_table_pages
    716303           -10.4%     642043        proc-vmstat.nr_slab_reclaimable
     34293           -31.3%      23568 ±  2%  proc-vmstat.nr_writeback
  24843018           -10.6%   22199585        proc-vmstat.nr_zone_inactive_file
  18965005            -9.9%   17085522        proc-vmstat.nr_zone_write_pending
     11693 ± 12%     -45.8%       6342 ± 19%  proc-vmstat.numa_hint_faults
     13169 ± 16%     -58.1%       5515 ± 38%  proc-vmstat.numa_pages_migrated
    483092            +6.9%     516333        proc-vmstat.pgfault
     13169 ± 16%     -58.1%       5515 ± 38%  proc-vmstat.pgmigrate_success
  24821824           -10.5%   22205493        slabinfo.buffer_head.active_objs
    636457           -10.5%     569371        slabinfo.buffer_head.active_slabs
  24821835           -10.5%   22205507        slabinfo.buffer_head.num_objs
    636457           -10.5%     569371        slabinfo.buffer_head.num_slabs
    771.50 ± 14%     -67.1%     254.00 ± 37%  slabinfo.ext4_io_end.active_objs
    771.50 ± 14%     -67.1%     254.00 ± 37%  slabinfo.ext4_io_end.num_objs
    992.75 ±  7%     +16.4%       1156 ±  3%  slabinfo.file_lock_cache.active_objs
    992.75 ±  7%     +16.4%       1156 ±  3%  slabinfo.file_lock_cache.num_objs
      3624 ±  4%     -27.3%       2635 ±  3%  slabinfo.fsnotify_mark_connector.active_objs
      3624 ±  4%     -27.3%       2635 ±  3%  slabinfo.fsnotify_mark_connector.num_objs
      1530           +38.2%       2115 ±  6%  slabinfo.jbd2_journal_head.active_objs
      1530           +38.2%       2115 ±  6%  slabinfo.jbd2_journal_head.num_objs
      1215 ±  6%     +12.5%       1368 ±  4%  slabinfo.khugepaged_mm_slot.active_objs
      1215 ±  6%     +12.5%       1368 ±  4%  slabinfo.khugepaged_mm_slot.num_objs
    640.00 ± 18%     +42.5%     912.00 ±  5%  slabinfo.kmalloc-rcl-128.active_objs
    640.00 ± 18%     +42.5%     912.00 ±  5%  slabinfo.kmalloc-rcl-128.num_objs
      1165 ±  5%     +17.1%       1365 ±  7%  slabinfo.kmalloc-rcl-96.active_objs
      1165 ±  5%     +17.1%       1365 ±  7%  slabinfo.kmalloc-rcl-96.num_objs
    416192           -10.0%     374491        slabinfo.radix_tree_node.active_objs
      7432           -10.0%       6687        slabinfo.radix_tree_node.active_slabs
    416205           -10.0%     374510        slabinfo.radix_tree_node.num_objs
      7432           -10.0%       6687        slabinfo.radix_tree_node.num_slabs
      9065 ± 12%     -23.8%       6906 ± 12%  slabinfo.skbuff_ext_cache.active_objs
      9129 ± 12%     -24.2%       6921 ± 12%  slabinfo.skbuff_ext_cache.num_objs
     13150 ± 55%     -98.5%     202.25 ±134%  numa-meminfo.node0.Active(file)
  28557438 ±  6%     -11.3%   25340135 ±  3%  numa-meminfo.node0.FilePages
  28265712 ±  6%     -11.3%   25064013 ±  3%  numa-meminfo.node0.Inactive
  28154197 ±  6%     -11.0%   25054378 ±  3%  numa-meminfo.node0.Inactive(file)
  29724574 ±  6%     -11.0%   26464625 ±  3%  numa-meminfo.node0.MemUsed
     39327 ±  8%     -19.9%      31504 ± 12%  numa-meminfo.node0.Writeback
  24343329 ±  5%     -14.1%   20913850 ±  2%  numa-meminfo.node1.Dirty
     98253 ± 53%     -76.1%      23496 ± 66%  numa-meminfo.node2.Active
     98128 ± 53%     -80.6%      19045 ± 48%  numa-meminfo.node2.Active(anon)
     38395 ± 27%     -86.9%       5025 ±168%  numa-meminfo.node2.AnonHugePages
     97719 ± 54%     -81.0%      18553 ± 48%  numa-meminfo.node2.AnonPages
  20150614 ±  4%     -14.4%   17239545 ±  4%  numa-meminfo.node2.Dirty
  26193001 ±  3%     -13.1%   22756026 ±  3%  numa-meminfo.node2.FilePages
  25918744 ±  3%     -13.3%   22480655 ±  3%  numa-meminfo.node2.Inactive
      4474 ± 81%   +4519.1%     206691 ± 95%  numa-meminfo.node2.Inactive(anon)
  25914269 ±  3%     -14.0%   22273961 ±  4%  numa-meminfo.node2.Inactive(file)
    756380 ±  4%     -15.3%     640377 ±  4%  numa-meminfo.node2.KReclaimable
      7431 ± 23%   +2677.9%     206443 ± 95%  numa-meminfo.node2.Mapped
  27352641 ±  3%     -13.3%   23716734 ±  3%  numa-meminfo.node2.MemUsed
    756380 ±  4%     -15.3%     640377 ±  4%  numa-meminfo.node2.SReclaimable
      4989 ± 68%   +4054.7%     207278 ± 95%  numa-meminfo.node2.Shmem
    820481 ±  3%     -13.5%     709868 ±  3%  numa-meminfo.node2.Slab
     35510 ± 19%     -31.5%      24329 ±  9%  numa-meminfo.node2.Writeback
    108489 ±154%     -96.8%       3454 ±113%  numa-meminfo.node3.Inactive(anon)
    108947 ±153%     -96.4%       3886 ±101%  numa-meminfo.node3.Shmem
    853184 ±  6%     -13.7%     735941 ±  4%  numa-meminfo.node3.Slab
     37242 ± 15%     -64.4%      13262 ± 21%  numa-meminfo.node3.Writeback
      3287 ± 55%     -98.5%      50.50 ±134%  numa-vmstat.node0.nr_active_file
   7156844 ±  6%     -11.1%    6363900 ±  3%  numa-vmstat.node0.nr_file_pages
   7056253 ±  6%     -10.8%    6292548 ±  3%  numa-vmstat.node0.nr_inactive_file
      3287 ± 55%     -98.5%      50.50 ±134%  numa-vmstat.node0.nr_zone_active_file
   7056204 ±  6%     -10.8%    6292474 ±  3%  numa-vmstat.node0.nr_zone_inactive_file
   6099489 ±  5%     -13.8%    5258753 ±  2%  numa-vmstat.node1.nr_dirty
   6108384 ±  5%     -13.8%    5266944 ±  2%  numa-vmstat.node1.nr_zone_write_pending
     24521 ± 53%     -80.6%       4761 ± 48%  numa-vmstat.node2.nr_active_anon
     24415 ± 54%     -81.0%       4636 ± 48%  numa-vmstat.node2.nr_anon_pages
   6492301 ±  3%     -12.8%    5664449 ±  5%  numa-vmstat.node2.nr_dirtied
   5044238 ±  4%     -14.2%    4326756 ±  4%  numa-vmstat.node2.nr_dirty
   6560936 ±  3%     -12.9%    5717787 ±  3%  numa-vmstat.node2.nr_file_pages
      1118 ± 81%   +4579.8%      52343 ± 95%  numa-vmstat.node2.nr_inactive_anon
   6491277 ±  3%     -13.8%    5596555 ±  4%  numa-vmstat.node2.nr_inactive_file
      1890 ± 22%   +2667.7%      52316 ± 95%  numa-vmstat.node2.nr_mapped
      1247 ± 68%   +4108.6%      52492 ± 95%  numa-vmstat.node2.nr_shmem
    189719 ±  4%     -15.2%     160931 ±  4%  numa-vmstat.node2.nr_slab_reclaimable
     24521 ± 53%     -80.6%       4761 ± 48%  numa-vmstat.node2.nr_zone_active_anon
      1118 ± 81%   +4579.8%      52343 ± 95%  numa-vmstat.node2.nr_zone_inactive_anon
   6491249 ±  3%     -13.8%    5596490 ±  4%  numa-vmstat.node2.nr_zone_inactive_file
   5054299 ±  4%     -14.3%    4333422 ±  4%  numa-vmstat.node2.nr_zone_write_pending
   6960453 ±  3%     -10.9%    6204543 ±  2%  numa-vmstat.node2.numa_hit
   6854850 ±  3%     -11.0%    6097739 ±  2%  numa-vmstat.node2.numa_local
     27129 ±154%     -96.8%     863.00 ±113%  numa-vmstat.node3.nr_inactive_anon
     27244 ±153%     -96.4%     971.25 ±101%  numa-vmstat.node3.nr_shmem
      6778 ± 30%     -53.4%       3159 ± 32%  numa-vmstat.node3.nr_writeback
     27128 ±154%     -96.8%     863.00 ±113%  numa-vmstat.node3.nr_zone_inactive_anon
 1.499e+09            -9.9%   1.35e+09        perf-stat.i.branch-instructions
  22610189 ±  9%     -21.1%   17834843 ±  5%  perf-stat.i.cache-misses
      9070           -19.3%       7317 ±  2%  perf-stat.i.context-switches
      6.88           +28.9%       8.87 ±  3%  perf-stat.i.cpi
 9.411e+10           -13.8%  8.115e+10 ±  3%  perf-stat.i.cpu-cycles
    229.46            -3.1%     222.39        perf-stat.i.cpu-migrations
      2522 ±  8%     +27.0%       3204 ±  5%  perf-stat.i.cycles-between-cache-misses
 2.104e+09           -11.1%  1.871e+09        perf-stat.i.dTLB-loads
 1.241e+09 ±  3%     -13.1%  1.079e+09 ±  4%  perf-stat.i.dTLB-stores
 7.319e+09           -10.2%  6.576e+09        perf-stat.i.instructions
      0.28 ±  4%      -7.1%       0.26 ±  6%  perf-stat.i.ipc
      5743            -6.3%       5380        perf-stat.i.minor-faults
   2832251 ± 11%     -10.9%    2522769 ±  4%  perf-stat.i.node-load-misses
    360798 ±  8%      -9.9%     324943        perf-stat.i.node-loads
     56.99            +2.7       59.74        perf-stat.i.node-store-miss-rate%
   1866852           -16.9%    1550725 ±  2%  perf-stat.i.node-stores
      5743            -6.3%       5380        perf-stat.i.page-faults
     59.19            +4.3       63.45        perf-stat.overall.node-store-miss-rate%
     13890            +7.8%      14967 ±  2%  perf-stat.overall.path-length
 1.497e+09            -8.5%   1.37e+09        perf-stat.ps.branch-instructions
  22771549 ±  9%     -19.2%   18399566 ±  4%  perf-stat.ps.cache-misses
      8877           -21.2%       6997 ±  2%  perf-stat.ps.context-switches
 9.549e+10           -10.3%  8.568e+10 ±  2%  perf-stat.ps.cpu-cycles
    225.91            -3.0%     219.18        perf-stat.ps.cpu-migrations
 2.104e+09            -9.6%  1.901e+09        perf-stat.ps.dTLB-loads
 1.239e+09 ±  3%     -11.9%  1.092e+09 ±  4%  perf-stat.ps.dTLB-stores
 7.311e+09            -8.7%  6.677e+09        perf-stat.ps.instructions
      5652            -7.3%       5240        perf-stat.ps.minor-faults
   1882547 ±  2%     -14.3%    1613747 ±  2%  perf-stat.ps.node-stores
      5652            -7.3%       5240        perf-stat.ps.page-faults
 4.661e+11            +7.8%  5.022e+11 ±  2%  perf-stat.total.instructions
     15.70 ± 22%      -9.0        6.67 ± 48%  perf-profile.calltrace.cycles-pp.proc_reg_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.70 ± 22%      -9.0        6.67 ± 48%  perf-profile.calltrace.cycles-pp.seq_read.proc_reg_read.vfs_read.ksys_read.do_syscall_64
      3.70 ±101%      -2.7        0.97 ±173%  perf-profile.calltrace.cycles-pp.mpage_map_and_submit_buffers.ext4_writepages.do_writepages.__writeback_single_inode.writeback_sb_inodes
      3.70 ±101%      -2.7        0.97 ±173%  perf-profile.calltrace.cycles-pp.mpage_submit_page.mpage_map_and_submit_buffers.ext4_writepages.do_writepages.__writeback_single_inode
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.calltrace.cycles-pp.__writeback_inodes_wb.wb_writeback.wb_workfn.process_one_work.worker_thread
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.calltrace.cycles-pp.__writeback_single_inode.writeback_sb_inodes.__writeback_inodes_wb.wb_writeback.wb_workfn
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.calltrace.cycles-pp.wb_workfn.process_one_work.worker_thread.kthread.ret_from_fork
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.calltrace.cycles-pp.wb_writeback.wb_workfn.process_one_work.worker_thread.kthread
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.calltrace.cycles-pp.writeback_sb_inodes.__writeback_inodes_wb.wb_writeback.wb_workfn.process_one_work
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.calltrace.cycles-pp.do_writepages.__writeback_single_inode.writeback_sb_inodes.__writeback_inodes_wb.wb_writeback
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.calltrace.cycles-pp.ext4_writepages.do_writepages.__writeback_single_inode.writeback_sb_inodes.__writeback_inodes_wb
      3.70 ±101%      -1.4        2.27 ±173%  perf-profile.calltrace.cycles-pp.ret_from_fork
      3.70 ±101%      -1.4        2.27 ±173%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork
      3.70 ±101%      -1.4        2.27 ±173%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork
      3.70 ±101%      -1.4        2.27 ±173%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
     33.51 ± 50%     +29.7       63.22 ± 14%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
     35.32 ± 48%     +31.5       66.84 ± 16%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64
     35.32 ± 48%     +31.5       66.84 ± 16%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
     35.32 ± 48%     +31.5       66.84 ± 16%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     33.51 ± 50%     +31.8       65.33 ± 15%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     33.51 ± 50%     +31.8       65.33 ± 15%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary
     35.32 ± 48%     +33.0       68.31 ± 14%  perf-profile.calltrace.cycles-pp.secondary_startup_64
     47.96 ± 14%     -22.3       25.70 ± 37%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     47.96 ± 14%     -22.3       25.70 ± 37%  perf-profile.children.cycles-pp.do_syscall_64
     24.81 ± 30%     -15.1        9.74 ± 24%  perf-profile.children.cycles-pp.do_group_exit
     24.81 ± 30%     -15.1        9.74 ± 24%  perf-profile.children.cycles-pp.do_exit
     16.51 ± 23%      -9.8        6.67 ± 48%  perf-profile.children.cycles-pp.seq_read
     15.70 ± 22%      -9.0        6.67 ± 48%  perf-profile.children.cycles-pp.proc_reg_read
     10.03 ± 46%      -7.0        3.07 ± 69%  perf-profile.children.cycles-pp.vsnprintf
      3.70 ±101%      -2.7        0.97 ±173%  perf-profile.children.cycles-pp.mpage_map_and_submit_buffers
      3.70 ±101%      -2.7        0.97 ±173%  perf-profile.children.cycles-pp.mpage_submit_page
      3.70 ±101%      -2.7        0.97 ±173%  perf-profile.children.cycles-pp.ext4_bio_write_page
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.children.cycles-pp.__writeback_inodes_wb
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.children.cycles-pp.__writeback_single_inode
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.children.cycles-pp.wb_workfn
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.children.cycles-pp.wb_writeback
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.children.cycles-pp.writeback_sb_inodes
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.children.cycles-pp.do_writepages
      3.70 ±101%      -1.7        1.95 ±173%  perf-profile.children.cycles-pp.ext4_writepages
      3.70 ±101%      -1.4        2.27 ±173%  perf-profile.children.cycles-pp.ret_from_fork
      3.70 ±101%      -1.4        2.27 ±173%  perf-profile.children.cycles-pp.kthread
      3.70 ±101%      -1.4        2.27 ±173%  perf-profile.children.cycles-pp.worker_thread
      3.70 ±101%      -1.4        2.27 ±173%  perf-profile.children.cycles-pp.process_one_work
     33.51 ± 50%     +29.7       63.22 ± 14%  perf-profile.children.cycles-pp.intel_idle
     35.32 ± 48%     +31.5       66.84 ± 16%  perf-profile.children.cycles-pp.start_secondary
     35.32 ± 48%     +33.0       68.31 ± 14%  perf-profile.children.cycles-pp.secondary_startup_64
     35.32 ± 48%     +33.0       68.31 ± 14%  perf-profile.children.cycles-pp.cpu_startup_entry
     35.32 ± 48%     +33.0       68.31 ± 14%  perf-profile.children.cycles-pp.do_idle
     33.51 ± 50%     +33.3       66.80 ± 12%  perf-profile.children.cycles-pp.cpuidle_enter
     33.51 ± 50%     +33.3       66.80 ± 12%  perf-profile.children.cycles-pp.cpuidle_enter_state
     33.51 ± 50%     +29.7       63.22 ± 14%  perf-profile.self.cycles-pp.intel_idle
     31.75          +118.1%      69.25 ± 65%  interrupts.108:PCI-MSI.1572921-edge.eth0-TxRx-57
      2.00 ±173%  +7.8e+06%     156028 ±100%  interrupts.233:PCI-MSI.69206027-edge.nvme0q11
     37.50 ± 19%    +119.3%      82.25 ± 66%  interrupts.63:PCI-MSI.1572876-edge.eth0-TxRx-12
     34.25 ±  5%    +797.1%     307.25 ±148%  interrupts.64:PCI-MSI.1572877-edge.eth0-TxRx-13
     31.50           +81.0%      57.00 ± 57%  interrupts.75:PCI-MSI.1572888-edge.eth0-TxRx-24
     31.50           +92.1%      60.50 ± 67%  interrupts.98:PCI-MSI.1572911-edge.eth0-TxRx-47
    128437           +14.6%     147138 ±  7%  interrupts.CPU0.LOC:Local_timer_interrupts
    128402           +16.5%     149524 ±  4%  interrupts.CPU1.LOC:Local_timer_interrupts
    128343           +14.9%     147506 ±  6%  interrupts.CPU103.LOC:Local_timer_interrupts
    128335           +16.3%     149243 ±  4%  interrupts.CPU105.LOC:Local_timer_interrupts
    128367           +16.1%     149069 ±  4%  interrupts.CPU110.LOC:Local_timer_interrupts
    128349           +14.8%     147307 ±  6%  interrupts.CPU113.LOC:Local_timer_interrupts
    128333           +14.9%     147459 ±  6%  interrupts.CPU114.LOC:Local_timer_interrupts
    128351           +15.6%     148435 ±  5%  interrupts.CPU118.LOC:Local_timer_interrupts
    128307           +14.5%     146967 ±  7%  interrupts.CPU119.LOC:Local_timer_interrupts
     37.50 ± 19%    +119.3%      82.25 ± 66%  interrupts.CPU12.63:PCI-MSI.1572876-edge.eth0-TxRx-12
    100.00 ± 48%     -76.0%      24.00 ± 29%  interrupts.CPU12.RES:Rescheduling_interrupts
     77.50 ± 76%    +124.2%     173.75 ± 37%  interrupts.CPU12.TLB:TLB_shootdowns
    128354           +15.0%     147654 ±  6%  interrupts.CPU120.LOC:Local_timer_interrupts
    128358           +16.1%     149045 ±  4%  interrupts.CPU121.LOC:Local_timer_interrupts
    128361           +17.0%     150197 ±  3%  interrupts.CPU122.LOC:Local_timer_interrupts
    128342           +15.9%     148757 ±  5%  interrupts.CPU123.LOC:Local_timer_interrupts
    128345           +16.4%     149380 ±  4%  interrupts.CPU124.LOC:Local_timer_interrupts
    128345           +16.4%     149419 ±  4%  interrupts.CPU125.LOC:Local_timer_interrupts
    100.75 ± 21%     -70.0%      30.25 ± 39%  interrupts.CPU125.RES:Rescheduling_interrupts
    128366           +15.8%     148692 ±  5%  interrupts.CPU126.LOC:Local_timer_interrupts
    128345           +17.3%     150598 ±  2%  interrupts.CPU127.LOC:Local_timer_interrupts
    128367           +16.6%     149700 ±  3%  interrupts.CPU129.LOC:Local_timer_interrupts
     34.25 ±  5%    +797.1%     307.25 ±148%  interrupts.CPU13.64:PCI-MSI.1572877-edge.eth0-TxRx-13
    128399           +16.8%     149910 ±  3%  interrupts.CPU130.LOC:Local_timer_interrupts
    128393           +16.2%     149203 ±  4%  interrupts.CPU131.LOC:Local_timer_interrupts
    128380           +16.4%     149444 ±  4%  interrupts.CPU132.LOC:Local_timer_interrupts
    128376           +16.3%     149240 ±  4%  interrupts.CPU133.LOC:Local_timer_interrupts
    128385           +15.8%     148611 ±  5%  interrupts.CPU134.LOC:Local_timer_interrupts
    128421           +15.6%     148516 ±  5%  interrupts.CPU135.LOC:Local_timer_interrupts
    128337           +16.5%     149464 ±  3%  interrupts.CPU136.LOC:Local_timer_interrupts
    128715           +14.6%     147563 ±  6%  interrupts.CPU138.LOC:Local_timer_interrupts
    128362           +16.3%     149293 ±  4%  interrupts.CPU139.LOC:Local_timer_interrupts
    128370           +16.2%     149105 ±  4%  interrupts.CPU14.LOC:Local_timer_interrupts
    128343           +16.6%     149686 ±  3%  interrupts.CPU140.LOC:Local_timer_interrupts
    128343           +16.5%     149558 ±  4%  interrupts.CPU141.LOC:Local_timer_interrupts
    128337           +16.0%     148913 ±  4%  interrupts.CPU142.LOC:Local_timer_interrupts
    128347           +16.5%     149493 ±  4%  interrupts.CPU143.LOC:Local_timer_interrupts
    128380           +15.9%     148809 ±  4%  interrupts.CPU144.LOC:Local_timer_interrupts
    128353           +16.8%     149916 ±  3%  interrupts.CPU145.LOC:Local_timer_interrupts
    128355           +17.6%     150970 ±  2%  interrupts.CPU146.LOC:Local_timer_interrupts
    128356           +17.8%     151261 ±  2%  interrupts.CPU147.LOC:Local_timer_interrupts
    128352           +17.5%     150782 ±  2%  interrupts.CPU148.LOC:Local_timer_interrupts
    128354           +17.6%     150994 ±  2%  interrupts.CPU149.LOC:Local_timer_interrupts
    128351           +17.6%     150929 ±  2%  interrupts.CPU150.LOC:Local_timer_interrupts
     16.25 ± 12%    +227.7%      53.25 ± 70%  interrupts.CPU150.RES:Rescheduling_interrupts
    128347           +17.5%     150792 ±  2%  interrupts.CPU151.LOC:Local_timer_interrupts
     14.00 ± 10%    +339.3%      61.50 ± 69%  interrupts.CPU151.RES:Rescheduling_interrupts
    128357           +17.6%     150892 ±  2%  interrupts.CPU152.LOC:Local_timer_interrupts
     21.00 ± 37%    +178.6%      58.50 ± 65%  interrupts.CPU152.RES:Rescheduling_interrupts
      2.00 ±173%  +7.8e+06%     156028 ±100%  interrupts.CPU153.233:PCI-MSI.69206027-edge.nvme0q11
    128336           +17.5%     150841 ±  2%  interrupts.CPU153.LOC:Local_timer_interrupts
     22.75 ± 61%    +342.9%     100.75 ± 65%  interrupts.CPU153.RES:Rescheduling_interrupts
    128355           +17.6%     150985 ±  2%  interrupts.CPU154.LOC:Local_timer_interrupts
     16.00 ±  7%    +659.4%     121.50 ± 66%  interrupts.CPU154.RES:Rescheduling_interrupts
    128162           +17.7%     150796 ±  2%  interrupts.CPU155.LOC:Local_timer_interrupts
     28.00 ± 91%    +411.6%     143.25 ± 74%  interrupts.CPU155.RES:Rescheduling_interrupts
    128381           +17.6%     150955 ±  2%  interrupts.CPU156.LOC:Local_timer_interrupts
    128341           +17.3%     150546 ±  2%  interrupts.CPU157.LOC:Local_timer_interrupts
    128343           +17.3%     150524 ±  2%  interrupts.CPU158.LOC:Local_timer_interrupts
    128343           +16.7%     149822 ±  3%  interrupts.CPU159.LOC:Local_timer_interrupts
    128330           +15.9%     148791 ±  4%  interrupts.CPU160.LOC:Local_timer_interrupts
    128328           +17.3%     150592 ±  2%  interrupts.CPU161.LOC:Local_timer_interrupts
    128329           +17.5%     150732 ±  2%  interrupts.CPU162.LOC:Local_timer_interrupts
    128416           +16.7%     149900 ±  3%  interrupts.CPU163.LOC:Local_timer_interrupts
    128357           +17.6%     150888 ±  2%  interrupts.CPU164.LOC:Local_timer_interrupts
    128333           +17.5%     150836 ±  2%  interrupts.CPU165.LOC:Local_timer_interrupts
    128893           +16.5%     150160 ±  3%  interrupts.CPU166.LOC:Local_timer_interrupts
    128327           +17.7%     151011 ±  2%  interrupts.CPU167.LOC:Local_timer_interrupts
    128351           +15.9%     148784 ±  4%  interrupts.CPU168.LOC:Local_timer_interrupts
    128407           +14.8%     147362 ±  6%  interrupts.CPU169.LOC:Local_timer_interrupts
    184.50 ± 61%     -81.2%      34.75 ±105%  interrupts.CPU169.TLB:TLB_shootdowns
    128363           +14.9%     147459 ±  6%  interrupts.CPU17.LOC:Local_timer_interrupts
    128389           +14.4%     146909 ±  7%  interrupts.CPU170.LOC:Local_timer_interrupts
    128396           +15.4%     148212 ±  5%  interrupts.CPU171.LOC:Local_timer_interrupts
    128354           +17.1%     150354 ±  3%  interrupts.CPU172.LOC:Local_timer_interrupts
    128356           +17.0%     150126 ±  3%  interrupts.CPU173.LOC:Local_timer_interrupts
    128342           +14.5%     146903 ±  7%  interrupts.CPU175.LOC:Local_timer_interrupts
    128329           +15.0%     147546 ±  6%  interrupts.CPU176.LOC:Local_timer_interrupts
    128364           +16.9%     150105 ±  3%  interrupts.CPU177.LOC:Local_timer_interrupts
    128329           +15.6%     148403 ±  5%  interrupts.CPU178.LOC:Local_timer_interrupts
    128344           +14.8%     147378 ±  6%  interrupts.CPU179.LOC:Local_timer_interrupts
    128395           +15.0%     147622 ±  6%  interrupts.CPU18.LOC:Local_timer_interrupts
    128317           +16.5%     149453 ±  4%  interrupts.CPU180.LOC:Local_timer_interrupts
    128331           +16.2%     149089 ±  4%  interrupts.CPU181.LOC:Local_timer_interrupts
    128201           +16.0%     148775 ±  4%  interrupts.CPU183.LOC:Local_timer_interrupts
    128401           +16.5%     149592 ±  3%  interrupts.CPU184.LOC:Local_timer_interrupts
    128342           +15.3%     147937 ±  5%  interrupts.CPU185.LOC:Local_timer_interrupts
    128327           +16.5%     149455 ±  4%  interrupts.CPU186.LOC:Local_timer_interrupts
    128328           +15.5%     148280 ±  5%  interrupts.CPU187.LOC:Local_timer_interrupts
    128812           +16.3%     149765 ±  3%  interrupts.CPU188.LOC:Local_timer_interrupts
    128390           +15.1%     147841 ±  5%  interrupts.CPU189.LOC:Local_timer_interrupts
    128419           +15.5%     148352 ±  5%  interrupts.CPU191.LOC:Local_timer_interrupts
    128368           +14.5%     147034 ±  7%  interrupts.CPU2.LOC:Local_timer_interrupts
    128384           +15.7%     148531 ±  5%  interrupts.CPU22.LOC:Local_timer_interrupts
    128333           +14.9%     147514 ±  6%  interrupts.CPU23.LOC:Local_timer_interrupts
     31.50           +81.0%      57.00 ± 57%  interrupts.CPU24.75:PCI-MSI.1572888-edge.eth0-TxRx-24
    128421           +15.0%     147738 ±  6%  interrupts.CPU24.LOC:Local_timer_interrupts
    128381           +16.2%     149205 ±  4%  interrupts.CPU25.LOC:Local_timer_interrupts
    128386           +17.0%     150158 ±  3%  interrupts.CPU26.LOC:Local_timer_interrupts
    128374           +15.9%     148753 ±  5%  interrupts.CPU27.LOC:Local_timer_interrupts
    128393           +16.4%     149441 ±  4%  interrupts.CPU28.LOC:Local_timer_interrupts
    128394           +16.4%     149453 ±  4%  interrupts.CPU29.LOC:Local_timer_interrupts
    128349           +15.2%     147836 ±  6%  interrupts.CPU3.LOC:Local_timer_interrupts
    128394           +15.8%     148677 ±  5%  interrupts.CPU30.LOC:Local_timer_interrupts
    128396           +16.8%     149958 ±  3%  interrupts.CPU31.LOC:Local_timer_interrupts
    128841           +16.2%     149668 ±  3%  interrupts.CPU33.LOC:Local_timer_interrupts
    128345           +16.7%     149761 ±  3%  interrupts.CPU34.LOC:Local_timer_interrupts
    128364           +16.1%     149066 ±  4%  interrupts.CPU35.LOC:Local_timer_interrupts
    128323           +16.5%     149453 ±  4%  interrupts.CPU36.LOC:Local_timer_interrupts
    128684           +16.0%     149316 ±  4%  interrupts.CPU37.LOC:Local_timer_interrupts
    128450           +15.3%     148046 ±  5%  interrupts.CPU38.LOC:Local_timer_interrupts
    128597           +15.3%     148258 ±  5%  interrupts.CPU39.LOC:Local_timer_interrupts
    128451           +16.6%     149755 ±  3%  interrupts.CPU40.LOC:Local_timer_interrupts
    128351           +14.9%     147457 ±  6%  interrupts.CPU42.LOC:Local_timer_interrupts
    128386           +16.3%     149358 ±  4%  interrupts.CPU43.LOC:Local_timer_interrupts
    128384           +16.6%     149738 ±  3%  interrupts.CPU44.LOC:Local_timer_interrupts
    128379           +16.5%     149508 ±  4%  interrupts.CPU45.LOC:Local_timer_interrupts
    128363           +16.0%     148894 ±  4%  interrupts.CPU46.LOC:Local_timer_interrupts
     16.00 ± 22%    +446.9%      87.50 ± 54%  interrupts.CPU46.RES:Rescheduling_interrupts
     31.50           +92.1%      60.50 ± 67%  interrupts.CPU47.98:PCI-MSI.1572911-edge.eth0-TxRx-47
    128351           +16.6%     149638 ±  4%  interrupts.CPU47.LOC:Local_timer_interrupts
     18.00 ± 44%    +250.0%      63.00 ± 52%  interrupts.CPU47.RES:Rescheduling_interrupts
    128356           +15.9%     148823 ±  4%  interrupts.CPU48.LOC:Local_timer_interrupts
    128366           +16.8%     149931 ±  3%  interrupts.CPU49.LOC:Local_timer_interrupts
     24.50 ± 77%    +455.1%     136.00 ± 72%  interrupts.CPU5.RES:Rescheduling_interrupts
    128546           +17.4%     150944 ±  2%  interrupts.CPU50.LOC:Local_timer_interrupts
    128550           +18.0%     151661        interrupts.CPU51.LOC:Local_timer_interrupts
    128377           +17.4%     150768 ±  2%  interrupts.CPU52.LOC:Local_timer_interrupts
    128360           +17.6%     150959 ±  2%  interrupts.CPU53.LOC:Local_timer_interrupts
    128784           +17.2%     150924 ±  2%  interrupts.CPU54.LOC:Local_timer_interrupts
     16.75 ± 11%    +353.7%      76.00 ± 69%  interrupts.CPU54.RES:Rescheduling_interrupts
    128352           +17.6%     150887 ±  2%  interrupts.CPU55.LOC:Local_timer_interrupts
     16.00 ± 22%    +345.3%      71.25 ± 78%  interrupts.CPU55.RES:Rescheduling_interrupts
    128349           +17.6%     150925 ±  2%  interrupts.CPU56.LOC:Local_timer_interrupts
     15.25 ± 12%    +355.7%      69.50 ± 42%  interrupts.CPU56.RES:Rescheduling_interrupts
     31.75          +118.1%      69.25 ± 65%  interrupts.CPU57.108:PCI-MSI.1572921-edge.eth0-TxRx-57
    128639           +17.3%     150885 ±  2%  interrupts.CPU57.LOC:Local_timer_interrupts
    128621           +17.4%     150962 ±  2%  interrupts.CPU58.LOC:Local_timer_interrupts
     16.75 ± 19%    +362.7%      77.50 ± 24%  interrupts.CPU58.RES:Rescheduling_interrupts
    128312           +17.5%     150783 ±  2%  interrupts.CPU59.LOC:Local_timer_interrupts
    128351           +17.6%     150943 ±  2%  interrupts.CPU60.LOC:Local_timer_interrupts
    128372           +17.3%     150622 ±  2%  interrupts.CPU61.LOC:Local_timer_interrupts
    128350           +17.3%     150581 ±  2%  interrupts.CPU62.LOC:Local_timer_interrupts
    128692           +17.2%     150797 ±  4%  interrupts.CPU63.LOC:Local_timer_interrupts
     26.25 ± 66%    +237.1%      88.50 ± 64%  interrupts.CPU63.RES:Rescheduling_interrupts
    128342           +16.0%     148843 ±  4%  interrupts.CPU64.LOC:Local_timer_interrupts
    128634           +17.5%     151193 ±  2%  interrupts.CPU65.LOC:Local_timer_interrupts
    128403           +17.5%     150824 ±  2%  interrupts.CPU66.LOC:Local_timer_interrupts
     15.00 ± 14%    +460.0%      84.00 ± 50%  interrupts.CPU66.RES:Rescheduling_interrupts
    128391           +16.7%     149882 ±  3%  interrupts.CPU67.LOC:Local_timer_interrupts
    128301           +17.6%     150939 ±  2%  interrupts.CPU68.LOC:Local_timer_interrupts
    128343           +17.6%     150869 ±  2%  interrupts.CPU69.LOC:Local_timer_interrupts
     22.50 ± 66%    +164.4%      59.50 ± 69%  interrupts.CPU69.RES:Rescheduling_interrupts
    128311           +14.9%     147423 ±  6%  interrupts.CPU7.LOC:Local_timer_interrupts
    128348           +17.0%     150218 ±  3%  interrupts.CPU70.LOC:Local_timer_interrupts
    128372           +17.5%     150891 ±  2%  interrupts.CPU71.LOC:Local_timer_interrupts
    128331           +16.2%     149151 ±  4%  interrupts.CPU72.LOC:Local_timer_interrupts
    134.50 ±107%     -94.2%       7.75 ± 45%  interrupts.CPU72.TLB:TLB_shootdowns
    128644           +14.6%     147478 ±  6%  interrupts.CPU73.LOC:Local_timer_interrupts
    134.75 ±106%     -99.3%       1.00 ±122%  interrupts.CPU73.TLB:TLB_shootdowns
    144.50 ± 96%     -98.4%       2.25 ±110%  interrupts.CPU74.TLB:TLB_shootdowns
    128367           +15.4%     148194 ±  5%  interrupts.CPU75.LOC:Local_timer_interrupts
    145.50 ± 95%     -93.8%       9.00 ± 86%  interrupts.CPU75.TLB:TLB_shootdowns
    128326           +17.2%     150448 ±  3%  interrupts.CPU76.LOC:Local_timer_interrupts
    128518           +16.9%     150214 ±  3%  interrupts.CPU77.LOC:Local_timer_interrupts
    163.00 ± 68%     -72.5%      44.75 ± 59%  interrupts.CPU78.TLB:TLB_shootdowns
    128325           +14.5%     146943 ±  7%  interrupts.CPU79.LOC:Local_timer_interrupts
    128338           +15.0%     147569 ±  6%  interrupts.CPU80.LOC:Local_timer_interrupts
    182.50 ± 64%     -74.7%      46.25 ± 57%  interrupts.CPU80.TLB:TLB_shootdowns
    128329           +16.9%     150020 ±  3%  interrupts.CPU81.LOC:Local_timer_interrupts
    128325           +15.7%     148446 ±  5%  interrupts.CPU82.LOC:Local_timer_interrupts
     14.25 ± 20%    +321.1%      60.00 ±112%  interrupts.CPU82.RES:Rescheduling_interrupts
    128326           +15.0%     147539 ±  6%  interrupts.CPU83.LOC:Local_timer_interrupts
    128288           +16.5%     149477 ±  4%  interrupts.CPU84.LOC:Local_timer_interrupts
    128318           +16.3%     149250 ±  4%  interrupts.CPU85.LOC:Local_timer_interrupts
    128331           +16.0%     148818 ±  4%  interrupts.CPU87.LOC:Local_timer_interrupts
    128368           +16.7%     149776 ±  3%  interrupts.CPU88.LOC:Local_timer_interrupts
    128339           +15.3%     147957 ±  5%  interrupts.CPU89.LOC:Local_timer_interrupts
    154.50 ± 85%     -78.2%      33.75 ± 95%  interrupts.CPU89.TLB:TLB_shootdowns
    128381           +16.3%     149325 ±  4%  interrupts.CPU9.LOC:Local_timer_interrupts
    128319           +16.5%     149505 ±  4%  interrupts.CPU90.LOC:Local_timer_interrupts
    128337           +15.7%     148429 ±  5%  interrupts.CPU91.LOC:Local_timer_interrupts
    128357           +16.7%     149773 ±  3%  interrupts.CPU92.LOC:Local_timer_interrupts
    128335           +15.3%     148000 ±  5%  interrupts.CPU93.LOC:Local_timer_interrupts
    128340           +15.5%     148276 ±  5%  interrupts.CPU95.LOC:Local_timer_interrupts
    128373           +14.5%     146984 ±  7%  interrupts.CPU96.LOC:Local_timer_interrupts
    128412           +16.5%     149567 ±  4%  interrupts.CPU97.LOC:Local_timer_interrupts
    128358           +14.5%     146911 ±  7%  interrupts.CPU98.LOC:Local_timer_interrupts
    128369           +15.2%     147823 ±  6%  interrupts.CPU99.LOC:Local_timer_interrupts
  24650613           +15.7%   28525718 ±  5%  interrupts.LOC:Local_timer_interrupts
      7862 ±  2%     +59.6%      12551 ± 28%  interrupts.RES:Rescheduling_interrupts
     34585           +18.6%      41032 ±  4%  softirqs.CPU0.RCU
     18735           +26.8%      23764 ±  8%  softirqs.CPU0.SCHED
     33683 ±  3%     +16.1%      39099 ±  7%  softirqs.CPU0.TIMER
     34894 ±  2%     +17.0%      40830        softirqs.CPU1.RCU
     35427 ±  3%     +10.5%      39133 ±  2%  softirqs.CPU10.RCU
      9739 ±  4%     -11.7%       8596 ±  8%  softirqs.CPU10.SCHED
     33353           +14.0%      38008        softirqs.CPU100.RCU
     29815 ±  2%     +20.9%      36042 ±  9%  softirqs.CPU100.TIMER
     33280           +25.9%      41905 ± 15%  softirqs.CPU101.RCU
     32709           +19.5%      39098 ±  4%  softirqs.CPU102.RCU
     32625           +16.9%      38136 ±  4%  softirqs.CPU103.RCU
     30632 ±  4%     +18.6%      36319 ±  8%  softirqs.CPU103.TIMER
     32725           +16.0%      37957        softirqs.CPU104.RCU
     30734 ±  3%     +17.6%      36136 ±  8%  softirqs.CPU104.TIMER
     33442 ±  2%     +14.6%      38321 ±  3%  softirqs.CPU105.RCU
     30813 ±  4%     +14.6%      35302 ±  6%  softirqs.CPU105.TIMER
     32639           +16.6%      38054 ±  2%  softirqs.CPU106.RCU
     33686 ±  4%     +18.9%      40057 ±  9%  softirqs.CPU107.RCU
     33798 ±  2%     +12.8%      38108        softirqs.CPU108.RCU
     34144 ±  3%     +13.7%      38833        softirqs.CPU109.RCU
     33284 ±  8%     +17.1%      38971 ± 14%  softirqs.CPU11.TIMER
     33216           +13.7%      37780 ±  2%  softirqs.CPU110.RCU
     31042 ±  6%     +13.9%      35353 ±  6%  softirqs.CPU110.TIMER
     33225 ±  3%     +17.5%      39053 ±  2%  softirqs.CPU111.RCU
     33849           +12.5%      38084 ±  2%  softirqs.CPU112.RCU
     34077 ±  5%     +11.8%      38093 ±  2%  softirqs.CPU114.RCU
     33901 ±  3%     +10.5%      37461        softirqs.CPU115.RCU
     33275           +13.3%      37695        softirqs.CPU116.RCU
     30612 ±  5%     +15.7%      35404 ±  6%  softirqs.CPU116.TIMER
     33376           +12.7%      37599        softirqs.CPU117.RCU
     30787 ±  4%     +15.7%      35611 ±  9%  softirqs.CPU117.TIMER
     32936           +13.7%      37448        softirqs.CPU118.RCU
     33075           +16.0%      38361 ±  4%  softirqs.CPU119.RCU
     33703 ±  2%     +18.0%      39754 ±  4%  softirqs.CPU12.RCU
     32529 ±  3%     +14.2%      37160 ±  8%  softirqs.CPU12.TIMER
     33538           +13.1%      37917        softirqs.CPU120.RCU
     33563 ±  2%     +14.3%      38377 ±  2%  softirqs.CPU122.RCU
     33079           +29.2%      42731 ± 11%  softirqs.CPU124.RCU
     34025 ±  3%     +13.5%      38629 ±  2%  softirqs.CPU125.RCU
     33151 ±  2%     +15.7%      38341        softirqs.CPU126.RCU
     32951           +19.7%      39430 ±  2%  softirqs.CPU127.RCU
     33478 ±  4%     +15.5%      38670 ±  2%  softirqs.CPU128.RCU
     33476 ±  3%     +16.0%      38830 ±  2%  softirqs.CPU129.RCU
     33721 ±  2%     +15.1%      38814 ±  2%  softirqs.CPU13.RCU
     32281 ±  3%     +15.2%      37184 ±  8%  softirqs.CPU13.TIMER
     32637 ±  2%     +15.7%      37755 ±  2%  softirqs.CPU130.RCU
     32807           +17.6%      38595 ±  2%  softirqs.CPU131.RCU
     31629 ±  6%     +11.0%      35097 ±  4%  softirqs.CPU131.TIMER
     33159 ±  5%     +15.6%      38320 ±  3%  softirqs.CPU132.RCU
     33044 ±  4%     +14.7%      37901        softirqs.CPU134.RCU
     32400           +25.8%      40753 ± 10%  softirqs.CPU135.RCU
     32566           +14.8%      37379        softirqs.CPU136.RCU
     32130 ±  2%     +19.7%      38453 ±  4%  softirqs.CPU137.RCU
     32938 ±  2%     +14.3%      37661 ±  2%  softirqs.CPU138.RCU
     32554           +16.2%      37834 ±  2%  softirqs.CPU139.RCU
     33792 ±  2%     +16.6%      39390        softirqs.CPU14.RCU
     32375 ±  5%     +11.7%      36177 ±  6%  softirqs.CPU14.TIMER
     32463           +19.8%      38876 ±  3%  softirqs.CPU140.RCU
     32374           +15.4%      37368 ±  2%  softirqs.CPU141.RCU
     31981 ±  2%     +17.1%      37463        softirqs.CPU142.RCU
     32245           +18.4%      38187 ±  5%  softirqs.CPU143.RCU
     32707 ±  4%     +14.8%      37545 ±  2%  softirqs.CPU144.RCU
     30647 ±  7%     +11.6%      34195 ±  6%  softirqs.CPU144.TIMER
     32309           +19.4%      38576 ±  2%  softirqs.CPU145.RCU
     30281 ±  6%     +16.3%      35203 ±  6%  softirqs.CPU145.TIMER
     32346 ±  2%     +19.6%      38693 ±  4%  softirqs.CPU146.RCU
     31150 ±  5%     +16.6%      36310 ±  8%  softirqs.CPU146.TIMER
     32289 ±  2%     +18.4%      38218 ±  3%  softirqs.CPU147.RCU
     30829 ±  7%     +14.0%      35145 ±  6%  softirqs.CPU147.TIMER
     32319           +16.6%      37673 ±  2%  softirqs.CPU148.RCU
     30373 ± 10%     +15.4%      35057 ±  6%  softirqs.CPU148.TIMER
     32452           +15.9%      37608        softirqs.CPU149.RCU
     29766 ±  7%     +20.9%      35976 ±  7%  softirqs.CPU149.TIMER
     35249 ±  4%     +10.5%      38934        softirqs.CPU15.RCU
     32379           +14.8%      37174        softirqs.CPU150.RCU
     29970 ±  7%     +15.4%      34580 ±  5%  softirqs.CPU150.TIMER
     32626           +10.8%      36158 ±  4%  softirqs.CPU151.RCU
     30167 ±  7%     +14.4%      34522 ±  6%  softirqs.CPU151.TIMER
     32287           +15.3%      37231        softirqs.CPU152.RCU
     29973 ±  6%     +14.5%      34311 ±  6%  softirqs.CPU152.TIMER
     32465           +15.2%      37390 ±  3%  softirqs.CPU153.RCU
     32237           +15.2%      37150        softirqs.CPU154.RCU
     29739 ±  8%     +17.1%      34828 ±  6%  softirqs.CPU154.TIMER
     32523           +16.5%      37892 ±  3%  softirqs.CPU155.RCU
     30135 ±  6%     +15.3%      34746 ±  6%  softirqs.CPU155.TIMER
     32645           +16.2%      37937 ±  4%  softirqs.CPU156.RCU
     30470 ±  7%     +13.9%      34691 ±  6%  softirqs.CPU156.TIMER
     32398 ±  2%     +15.8%      37531 ±  3%  softirqs.CPU157.RCU
     29815 ±  7%     +16.9%      34864 ±  6%  softirqs.CPU157.TIMER
     32136           +14.0%      36631 ±  3%  softirqs.CPU158.RCU
     30104 ±  9%     +17.1%      35255 ±  5%  softirqs.CPU158.TIMER
     32254           +17.4%      37881 ±  4%  softirqs.CPU159.RCU
     30043 ±  6%     +16.6%      35041 ±  7%  softirqs.CPU159.TIMER
     33752           +15.3%      38912 ±  2%  softirqs.CPU16.RCU
     32409           +16.8%      37856        softirqs.CPU160.RCU
     30520 ±  7%     +13.9%      34755 ±  6%  softirqs.CPU160.TIMER
     32246           +16.8%      37670 ±  3%  softirqs.CPU161.RCU
     29976 ±  7%     +16.2%      34836 ±  6%  softirqs.CPU161.TIMER
     32356           +14.4%      37030 ±  3%  softirqs.CPU162.RCU
     29842 ±  8%     +17.1%      34949 ±  8%  softirqs.CPU162.TIMER
     32279           +16.1%      37481 ±  2%  softirqs.CPU163.RCU
     32420           +15.1%      37323        softirqs.CPU164.RCU
     30463 ±  8%     +13.7%      34645 ±  6%  softirqs.CPU164.TIMER
     32258           +16.0%      37433 ±  3%  softirqs.CPU165.RCU
     30073 ±  6%     +12.9%      33958 ±  6%  softirqs.CPU165.TIMER
     32168           +17.2%      37707 ±  2%  softirqs.CPU166.RCU
     32851 ±  2%     +14.8%      37702        softirqs.CPU167.RCU
     29976 ±  5%     +14.9%      34446 ±  5%  softirqs.CPU167.TIMER
     32181           +15.5%      37173        softirqs.CPU168.RCU
     32095           +15.6%      37099        softirqs.CPU169.RCU
     30465 ±  7%     +12.8%      34372 ±  5%  softirqs.CPU169.TIMER
     33963           +17.7%      39979        softirqs.CPU17.RCU
     32244 ±  3%     +11.5%      35946 ±  5%  softirqs.CPU17.TIMER
     32403           +14.7%      37158        softirqs.CPU170.RCU
     32550           +16.2%      37824 ±  2%  softirqs.CPU171.RCU
     32618           +13.5%      37016 ±  2%  softirqs.CPU172.RCU
     32142           +15.4%      37099 ±  2%  softirqs.CPU173.RCU
     33505 ±  6%     +11.3%      37294 ±  2%  softirqs.CPU174.RCU
     32332           +22.4%      39567 ±  7%  softirqs.CPU175.RCU
     30527 ±  7%     +16.9%      35673 ±  6%  softirqs.CPU175.TIMER
     32160           +15.8%      37242 ±  2%  softirqs.CPU176.RCU
     30544 ±  7%     +10.3%      33682 ±  5%  softirqs.CPU176.TIMER
     32334           +13.7%      36749        softirqs.CPU177.RCU
     32170           +14.9%      36972 ±  2%  softirqs.CPU178.RCU
     30672 ±  6%     +11.9%      34312 ±  6%  softirqs.CPU178.TIMER
     32136           +14.9%      36933        softirqs.CPU179.RCU
     34311 ±  3%     +12.5%      38601        softirqs.CPU18.RCU
     31992           +15.8%      37054 ±  3%  softirqs.CPU180.RCU
     32121           +15.9%      37236 ±  2%  softirqs.CPU181.RCU
     30606 ±  7%     +11.3%      34054 ±  5%  softirqs.CPU181.TIMER
     31643 ±  2%     +17.1%      37064        softirqs.CPU182.RCU
     32981 ±  5%     +11.9%      36902 ±  2%  softirqs.CPU183.RCU
     31994           +14.1%      36516        softirqs.CPU184.RCU
     31634           +16.7%      36904        softirqs.CPU185.RCU
     32098           +15.4%      37036        softirqs.CPU186.RCU
     31769           +16.6%      37048        softirqs.CPU187.RCU
     32705 ±  3%     +12.1%      36647 ±  2%  softirqs.CPU188.RCU
     31754           +16.4%      36974 ±  2%  softirqs.CPU189.RCU
     34033           +18.2%      40221 ±  2%  softirqs.CPU19.RCU
     33030 ±  2%     +12.5%      37160 ±  7%  softirqs.CPU19.TIMER
     32064 ±  2%     +13.9%      36535 ±  3%  softirqs.CPU190.RCU
     32045           +17.3%      37576        softirqs.CPU191.RCU
     35215 ±  6%     +14.6%      40339 ±  2%  softirqs.CPU2.RCU
     33585           +17.4%      39429        softirqs.CPU20.RCU
     33328           +16.9%      38956 ±  2%  softirqs.CPU21.RCU
     33990           +15.4%      39225 ±  3%  softirqs.CPU22.RCU
     33451           +18.9%      39761 ±  2%  softirqs.CPU23.RCU
     31835 ±  3%     +17.0%      37247 ± 11%  softirqs.CPU23.TIMER
     32980           +19.5%      39417 ±  2%  softirqs.CPU25.RCU
     33251           +17.3%      39019 ±  3%  softirqs.CPU26.RCU
     33548           +16.8%      39198        softirqs.CPU27.RCU
     34308 ±  2%     +15.4%      39580 ±  2%  softirqs.CPU28.RCU
     33528           +18.1%      39601        softirqs.CPU29.RCU
     33729           +20.7%      40723        softirqs.CPU3.RCU
     32908 ±  3%     +17.5%      38659 ± 13%  softirqs.CPU3.TIMER
     33439           +29.8%      43419 ± 13%  softirqs.CPU30.RCU
     34440 ±  3%     +13.7%      39162 ±  3%  softirqs.CPU31.RCU
     33497           +15.8%      38781        softirqs.CPU32.RCU
     33966           +15.6%      39276 ±  2%  softirqs.CPU33.RCU
     33181           +25.4%      41625 ±  7%  softirqs.CPU34.RCU
     33241           +19.2%      39631 ±  3%  softirqs.CPU35.RCU
     34119           +23.7%      42213 ± 11%  softirqs.CPU37.RCU
     33433           +16.9%      39072 ±  2%  softirqs.CPU38.RCU
     32750           +19.4%      39110 ±  2%  softirqs.CPU39.RCU
     34476 ±  2%     +16.4%      40130        softirqs.CPU4.RCU
     31499           +20.5%      37951 ±  8%  softirqs.CPU4.TIMER
     33021 ±  3%     +18.3%      39054        softirqs.CPU40.RCU
     32900 ±  2%     +18.3%      38922        softirqs.CPU41.RCU
     32829           +19.2%      39146 ±  3%  softirqs.CPU42.RCU
     33370           +16.8%      38976 ±  2%  softirqs.CPU44.RCU
     33122 ±  2%     +18.2%      39140 ±  2%  softirqs.CPU45.RCU
     34188 ±  3%     +14.2%      39046 ±  3%  softirqs.CPU46.RCU
     34547 ±  2%     +13.4%      39184 ±  2%  softirqs.CPU47.RCU
     32740           +16.8%      38227 ±  2%  softirqs.CPU48.RCU
     34122 ±  5%     +12.6%      38416 ±  2%  softirqs.CPU49.RCU
     34080           +20.6%      41108 ±  4%  softirqs.CPU5.RCU
     35160 ± 11%     +21.3%      42666 ± 13%  softirqs.CPU5.TIMER
     33941           +14.0%      38697 ±  2%  softirqs.CPU50.RCU
     33587           +16.5%      39128        softirqs.CPU51.RCU
     32221 ±  5%     +11.6%      35944 ±  6%  softirqs.CPU51.TIMER
     33469           +16.2%      38892 ±  2%  softirqs.CPU52.RCU
     33618 ±  2%     +15.6%      38876 ±  3%  softirqs.CPU53.RCU
     31383 ±  5%     +15.7%      36311 ±  9%  softirqs.CPU53.TIMER
     33411           +17.7%      39318        softirqs.CPU54.RCU
     31353 ±  5%     +13.2%      35486 ±  6%  softirqs.CPU54.TIMER
     33561           +15.7%      38835 ±  2%  softirqs.CPU55.RCU
     31449 ±  6%     +13.4%      35664 ±  7%  softirqs.CPU55.TIMER
     33416           +16.4%      38891 ±  3%  softirqs.CPU56.RCU
     31445 ±  4%     +12.1%      35235 ±  6%  softirqs.CPU56.TIMER
     33129           +17.3%      38861 ±  3%  softirqs.CPU58.RCU
     31108 ±  6%     +14.1%      35480 ±  8%  softirqs.CPU58.TIMER
     32752           +17.5%      38490 ±  2%  softirqs.CPU59.RCU
     31169 ±  5%     +12.2%      34986 ±  6%  softirqs.CPU59.TIMER
     34754 ±  4%     +16.5%      40494 ±  7%  softirqs.CPU6.RCU
     33211 ±  6%     +15.2%      38251 ±  3%  softirqs.CPU6.TIMER
     33270           +24.9%      41539 ±  6%  softirqs.CPU60.RCU
     31569 ±  6%     +21.9%      38492 ±  5%  softirqs.CPU60.TIMER
     32989           +20.9%      39889 ±  3%  softirqs.CPU61.RCU
     31121 ±  5%     +15.9%      36066 ±  7%  softirqs.CPU61.TIMER
     33195 ±  2%     +18.9%      39482        softirqs.CPU62.RCU
     31337 ±  7%     +14.9%      35991 ±  8%  softirqs.CPU62.TIMER
     33021           +17.8%      38898        softirqs.CPU63.RCU
     31234 ±  5%     +13.9%      35567 ±  8%  softirqs.CPU63.TIMER
     32825           +17.6%      38598        softirqs.CPU64.RCU
     31704 ±  6%     +12.9%      35792 ± 10%  softirqs.CPU64.TIMER
     33240           +18.9%      39508        softirqs.CPU65.RCU
     31475 ±  5%     +12.9%      35526 ±  9%  softirqs.CPU65.TIMER
     33190           +20.8%      40106 ±  2%  softirqs.CPU66.RCU
      8443           +23.9%      10460 ±  4%  softirqs.CPU66.SCHED
     31182 ±  7%     +14.7%      35751 ±  8%  softirqs.CPU66.TIMER
     32969           +16.8%      38498        softirqs.CPU67.RCU
     33177           +17.0%      38810        softirqs.CPU68.RCU
     32799           +19.4%      39160        softirqs.CPU69.RCU
     31264 ±  5%     +14.9%      35937 ±  8%  softirqs.CPU69.TIMER
     34352           +15.1%      39536 ±  2%  softirqs.CPU7.RCU
     32372 ±  3%     +14.0%      36918 ±  8%  softirqs.CPU7.TIMER
     34202 ±  5%     +14.1%      39029        softirqs.CPU70.RCU
     33334 ±  2%     +16.1%      38699 ±  2%  softirqs.CPU71.RCU
     33710           +19.0%      40129 ±  4%  softirqs.CPU72.RCU
     33730 ±  2%     +16.2%      39208 ±  2%  softirqs.CPU73.RCU
     31947 ±  5%     +12.6%      35970 ±  8%  softirqs.CPU73.TIMER
     33347           +17.4%      39134 ±  4%  softirqs.CPU74.RCU
     31666 ±  6%     +11.6%      35343 ±  4%  softirqs.CPU74.TIMER
     33119           +17.0%      38735 ±  3%  softirqs.CPU75.RCU
     33034           +18.0%      38972 ±  3%  softirqs.CPU76.RCU
     33209           +16.8%      38791 ±  2%  softirqs.CPU77.RCU
     33699 ±  5%     +14.2%      38497        softirqs.CPU79.RCU
     35226 ±  4%     +14.0%      40145 ±  3%  softirqs.CPU8.RCU
     32834 ±  2%     +17.2%      38477 ±  2%  softirqs.CPU80.RCU
     32216           +18.8%      38272 ±  3%  softirqs.CPU81.RCU
     32402           +18.0%      38242 ±  2%  softirqs.CPU82.RCU
     31305 ±  6%     +10.9%      34731 ±  7%  softirqs.CPU82.TIMER
     32612           +17.9%      38440 ±  2%  softirqs.CPU83.RCU
     31518 ±  6%     +12.8%      35541 ±  8%  softirqs.CPU83.TIMER
     32748           +16.7%      38226 ±  2%  softirqs.CPU84.RCU
     32645           +17.4%      38321 ±  2%  softirqs.CPU85.RCU
     31595 ±  5%     +11.8%      35339 ±  7%  softirqs.CPU85.TIMER
     32665           +17.2%      38277 ±  3%  softirqs.CPU86.RCU
     31558 ±  7%     +13.2%      35720 ±  8%  softirqs.CPU86.TIMER
     32257           +17.2%      37808 ±  2%  softirqs.CPU87.RCU
     32385           +18.4%      38335 ±  3%  softirqs.CPU88.RCU
     32527           +16.2%      37786 ±  2%  softirqs.CPU89.RCU
     34344 ±  3%     +15.4%      39639        softirqs.CPU9.RCU
     32369 ±  2%     +11.8%      36174 ±  6%  softirqs.CPU9.TIMER
     32811           +17.8%      38662 ±  2%  softirqs.CPU90.RCU
     32532           +18.3%      38498        softirqs.CPU91.RCU
     32965 ±  2%     +15.3%      38002        softirqs.CPU92.RCU
     32434           +22.1%      39591 ±  7%  softirqs.CPU93.RCU
     32546           +37.7%      44801 ± 19%  softirqs.CPU94.RCU
     31420 ±  8%     +37.8%      43298 ± 31%  softirqs.CPU94.TIMER
     33220           +14.6%      38084        softirqs.CPU95.RCU
     33531 ±  2%     +12.8%      37823 ±  3%  softirqs.CPU96.RCU
     33545           +14.3%      38337        softirqs.CPU97.RCU
     32966           +14.7%      37811 ±  2%  softirqs.CPU98.RCU
     33429           +15.9%      38750 ±  4%  softirqs.CPU99.RCU
   6367566           +16.4%    7409345        softirqs.RCU
   6082875 ±  4%     +12.4%    6839301 ±  6%  softirqs.TIMER



***************************************************************************************************
lkp-ivb-d02: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/process/16/debian-x86_64-20191114.cgz/lkp-ivb-d02/malloc2/will-it-scale/0x21

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4           25%           1:4     dmesg.RIP:_raw_spin_unlock_irqrestore
           :4           50%           2:4     dmesg.RIP:cpuidle_enter_state
           :4           25%           1:4     dmesg.RIP:rebalance_domains
         %stddev     %change         %stddev
             \          |                \  
   3690543           -53.4%    1719663        will-it-scale.per_process_ops
  59048698           -53.4%   27514625        will-it-scale.workload
     20.79 ±  4%     +14.9%      23.90 ±  3%  boot-time.boot
    115892 ±  2%      -8.8%     105652 ±  4%  meminfo.DirectMap4k
     14913 ±  3%     +14.0%      16994        softirqs.SCHED
      1955 ±  2%     -12.8%       1704 ±  2%  slabinfo.filp.num_objs
    992.00 ±  4%      -7.9%     914.00 ±  6%  slabinfo.kmalloc-512.num_objs
      7533 ±  2%      -7.3%       6983        vmstat.system.cs
     11027            -3.6%      10634        vmstat.system.in
     65202            -4.5%      62286        proc-vmstat.nr_active_anon
     64136            -4.2%      61459        proc-vmstat.nr_anon_pages
      4090            -5.6%       3861        proc-vmstat.nr_shmem
     65178            -4.5%      62264        proc-vmstat.nr_zone_active_anon
    856.75 ± 10%     -40.3%     511.25        proc-vmstat.pgactivate
    366730            -1.2%     362179        proc-vmstat.pgalloc_normal
    351608            -2.1%     344374        proc-vmstat.pgfree
      9641 ± 23%     -67.8%       3105        interrupts.CPU0.NMI:Non-maskable_interrupts
      9641 ± 23%     -67.8%       3105        interrupts.CPU0.PMI:Performance_monitoring_interrupts
      6642 ±  3%     -52.8%       3137        interrupts.CPU1.NMI:Non-maskable_interrupts
      6642 ±  3%     -52.8%       3137        interrupts.CPU1.PMI:Performance_monitoring_interrupts
      8051 ± 34%     -61.1%       3133 ±  2%  interrupts.CPU2.NMI:Non-maskable_interrupts
      8051 ± 34%     -61.1%       3133 ±  2%  interrupts.CPU2.PMI:Performance_monitoring_interrupts
      6442           -51.4%       3128        interrupts.CPU3.NMI:Non-maskable_interrupts
      6442           -51.4%       3128        interrupts.CPU3.PMI:Performance_monitoring_interrupts
     30777 ± 15%     -59.4%      12505        interrupts.NMI:Non-maskable_interrupts
     30777 ± 15%     -59.4%      12505        interrupts.PMI:Performance_monitoring_interrupts
    326.55 ±  3%     -12.3%     286.33 ±  3%  sched_debug.cfs_rq:/.load_avg.avg
    449.04           -16.4%     375.50 ± 10%  sched_debug.cfs_rq:/.load_avg.max
     94.96 ± 11%     -28.9%      67.52 ± 22%  sched_debug.cfs_rq:/.load_avg.stddev
      7.35 ±  8%     +95.8%      14.40 ±  7%  sched_debug.cfs_rq:/.nr_spread_over.avg
     21.79 ± 25%     +69.8%      37.00 ±  7%  sched_debug.cfs_rq:/.nr_spread_over.max
      8.69 ± 37%     +72.2%      14.97 ±  7%  sched_debug.cfs_rq:/.nr_spread_over.stddev
      0.00 ± 21%     +28.5%       0.00 ± 12%  sched_debug.cpu.next_balance.stddev
    451321 ±  2%      -8.0%     415116        sched_debug.cpu.nr_switches.avg
   1591992 ±  2%     -21.1%    1256038 ± 15%  sched_debug.cpu.nr_switches.max
    658789 ±  2%     -23.6%     503350 ± 17%  sched_debug.cpu.nr_switches.stddev
    440664 ±  2%      -8.3%     403980        sched_debug.cpu.sched_count.avg
   1579963 ±  2%     -21.3%    1244093 ± 15%  sched_debug.cpu.sched_count.max
    657859 ±  2%     -23.6%     502322 ± 18%  sched_debug.cpu.sched_count.stddev
      2015 ±  2%     -12.8%       1757 ±  8%  sched_debug.cpu.sched_goidle.avg
    207749 ±  2%      -9.0%     189052        sched_debug.cpu.ttwu_count.avg
    781543 ±  2%     -21.6%     612453 ± 15%  sched_debug.cpu.ttwu_count.max
    331321 ±  2%     -23.6%     253093 ± 18%  sched_debug.cpu.ttwu_count.stddev
    205962 ±  2%      -9.2%     187022        sched_debug.cpu.ttwu_local.avg
    779755 ±  2%     -21.7%     610374 ± 15%  sched_debug.cpu.ttwu_local.max
    331320 ±  2%     -23.6%     253084 ± 18%  sched_debug.cpu.ttwu_local.stddev
      0.05 ±  3%    +137.2%       0.12        perf-stat.i.MPKI
 4.412e+09           -52.6%   2.09e+09        perf-stat.i.branch-instructions
      0.08 ±  2%      +0.1        0.19 ±  4%  perf-stat.i.branch-miss-rate%
   2868917 ±  3%     +30.3%    3737973 ±  5%  perf-stat.i.branch-misses
     14.41            +2.5       16.94 ±  3%  perf-stat.i.cache-miss-rate%
    150515 ±  3%     +24.2%     186901 ±  5%  perf-stat.i.cache-misses
    882639 ±  3%     +14.1%    1007246 ±  2%  perf-stat.i.cache-references
      7594 ±  2%      -7.4%       7029        perf-stat.i.context-switches
      0.71            +1.6%       0.72        perf-stat.i.cpi
 1.308e+10           -51.8%  6.311e+09        perf-stat.i.cpu-cycles
    164133 ±  4%     -62.3%      61839 ±  4%  perf-stat.i.cycles-between-cache-misses
      0.01 ±  5%      +0.0        0.02        perf-stat.i.dTLB-load-miss-rate%
 3.901e+09           -52.6%  1.851e+09        perf-stat.i.dTLB-loads
      0.00 ±  2%      +0.0        0.01 ± 14%  perf-stat.i.dTLB-store-miss-rate%
 2.585e+09           -52.8%   1.22e+09        perf-stat.i.dTLB-stores
    118190            -7.2%     109655        perf-stat.i.iTLB-load-misses
 1.849e+10           -52.5%  8.782e+09        perf-stat.i.instructions
    430278           -53.9%     198290        perf-stat.i.instructions-per-iTLB-miss
      1.41            -1.6%       1.39        perf-stat.i.ipc
      0.05 ±  3%    +140.3%       0.11 ±  2%  perf-stat.overall.MPKI
      0.07 ±  4%      +0.1        0.18 ±  5%  perf-stat.overall.branch-miss-rate%
     17.06 ±  2%      +1.5       18.55 ±  3%  perf-stat.overall.cache-miss-rate%
      0.71            +1.6%       0.72        perf-stat.overall.cpi
     87002 ±  3%     -61.1%      33845 ±  5%  perf-stat.overall.cycles-between-cache-misses
      0.01 ±  4%      +0.0        0.02        perf-stat.overall.dTLB-load-miss-rate%
      0.00 ±  2%      +0.0        0.01 ± 15%  perf-stat.overall.dTLB-store-miss-rate%
    156501           -48.8%      80123        perf-stat.overall.instructions-per-iTLB-miss
      1.41            -1.6%       1.39        perf-stat.overall.ipc
     94374            +2.0%      96228        perf-stat.overall.path-length
 4.398e+09           -52.6%  2.083e+09        perf-stat.ps.branch-instructions
   2860015 ±  3%     +30.3%    3726736 ±  5%  perf-stat.ps.branch-misses
    150037 ±  3%     +24.2%     186360 ±  5%  perf-stat.ps.cache-misses
    879772 ±  3%     +14.1%    1004104 ±  2%  perf-stat.ps.cache-references
      7569 ±  2%      -7.5%       7005        perf-stat.ps.context-switches
 1.304e+10           -51.8%   6.29e+09        perf-stat.ps.cpu-cycles
 3.889e+09           -52.6%  1.845e+09        perf-stat.ps.dTLB-loads
 2.577e+09           -52.8%  1.216e+09        perf-stat.ps.dTLB-stores
    117801            -7.2%     109283        perf-stat.ps.iTLB-load-misses
 1.843e+10           -52.5%  8.753e+09        perf-stat.ps.instructions
 5.573e+12           -52.5%  2.648e+12        perf-stat.total.instructions
     74.64            -3.8       70.80        perf-profile.calltrace.cycles-pp.malloc
      0.00            +0.5        0.54 ±  5%  perf-profile.calltrace.cycles-pp.apic_timer_interrupt.malloc
      0.00            +0.7        0.67 ± 18%  perf-profile.calltrace.cycles-pp.prepare_exit_to_usermode.swapgs_restore_regs_and_return_to_usermode
      0.00            +0.8        0.75 ± 17%  perf-profile.calltrace.cycles-pp.lf.vt_console_print.console_unlock.vprintk_emit.printk
      0.00            +0.8        0.76 ± 16%  perf-profile.calltrace.cycles-pp.console_unlock.vprintk_emit.printk.irq_work_run_list.irq_work_run
      0.00            +0.8        0.76 ± 16%  perf-profile.calltrace.cycles-pp.irq_work_run_list.irq_work_run.smp_irq_work_interrupt.irq_work_interrupt
      0.00            +0.8        0.76 ± 16%  perf-profile.calltrace.cycles-pp.vt_console_print.console_unlock.vprintk_emit.printk.irq_work_run_list
      0.00            +0.8        0.76 ± 16%  perf-profile.calltrace.cycles-pp.vprintk_emit.printk.irq_work_run_list.irq_work_run.smp_irq_work_interrupt
      0.00            +0.8        0.76 ± 16%  perf-profile.calltrace.cycles-pp.irq_work_run.smp_irq_work_interrupt.irq_work_interrupt
      0.00            +0.8        0.76 ± 16%  perf-profile.calltrace.cycles-pp.printk.irq_work_run_list.irq_work_run.smp_irq_work_interrupt.irq_work_interrupt
      0.00            +0.8        0.77 ± 17%  perf-profile.calltrace.cycles-pp.irq_work_interrupt
      0.00            +0.8        0.77 ± 17%  perf-profile.calltrace.cycles-pp.smp_irq_work_interrupt.irq_work_interrupt
      0.00            +0.9        0.92 ± 24%  perf-profile.calltrace.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      0.00            +1.0        1.01 ±  5%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interrupt
      0.00            +1.0        1.01 ±  5%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
      0.00            +1.1        1.05 ± 53%  perf-profile.calltrace.cycles-pp.drm_fb_helper_cfb_imageblit.bit_putcs.fbcon_putcs.fbcon_redraw.fbcon_scroll
      0.00            +1.1        1.05 ± 53%  perf-profile.calltrace.cycles-pp.cfb_imageblit.drm_fb_helper_cfb_imageblit.bit_putcs.fbcon_putcs.fbcon_redraw
      0.00            +1.1        1.10 ± 53%  perf-profile.calltrace.cycles-pp.bit_putcs.fbcon_putcs.fbcon_redraw.fbcon_scroll.con_scroll
      0.00            +1.1        1.11 ± 52%  perf-profile.calltrace.cycles-pp.fbcon_putcs.fbcon_redraw.fbcon_scroll.con_scroll.lf
      0.00            +1.1        1.12 ±  8%  perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt
      0.00            +1.1        1.13 ± 52%  perf-profile.calltrace.cycles-pp.con_scroll.lf.vt_console_print.console_unlock.vprintk_emit
      0.00            +1.1        1.13 ± 52%  perf-profile.calltrace.cycles-pp.fbcon_scroll.con_scroll.lf.vt_console_print.console_unlock
      0.00            +1.1        1.13 ± 52%  perf-profile.calltrace.cycles-pp.fbcon_redraw.fbcon_scroll.con_scroll.lf.vt_console_print
      0.18 ±173%      +1.4        1.55 ± 11%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt
      0.55 ± 64%      +1.6        2.17 ±  9%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt
      0.68 ± 63%      +1.9        2.59 ±  7%  perf-profile.calltrace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt
      0.74 ± 62%      +2.1        2.87 ±  7%  perf-profile.calltrace.cycles-pp.apic_timer_interrupt
     77.30            -4.3       73.01        perf-profile.children.cycles-pp.malloc
     19.81            -1.2       18.64 ±  4%  perf-profile.children.cycles-pp.free
      0.06 ±  9%      +0.1        0.11 ± 26%  perf-profile.children.cycles-pp.filemap_map_pages
      0.06 ± 26%      +0.1        0.12 ± 43%  perf-profile.children.cycles-pp.__x64_sys_clone
      0.06 ± 26%      +0.1        0.12 ± 43%  perf-profile.children.cycles-pp._do_fork
      0.03 ±100%      +0.1        0.09 ± 20%  perf-profile.children.cycles-pp.set_next_entity
      0.08 ± 26%      +0.1        0.17 ± 27%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.04 ±107%      +0.1        0.14 ± 29%  perf-profile.children.cycles-pp.flush_old_exec
      0.01 ±173%      +0.1        0.12 ± 35%  perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.1        0.10 ± 42%  perf-profile.children.cycles-pp.reweight_entity
      0.14 ± 25%      +0.1        0.25 ± 24%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.14 ± 25%      +0.1        0.25 ± 24%  perf-profile.children.cycles-pp.do_group_exit
      0.14 ± 25%      +0.1        0.25 ± 24%  perf-profile.children.cycles-pp.do_exit
      0.03 ±100%      +0.1        0.15 ± 36%  perf-profile.children.cycles-pp.rcu_core
      0.03 ±100%      +0.1        0.17 ± 19%  perf-profile.children.cycles-pp.pipe_read
      0.15 ± 34%      +0.2        0.31 ±  7%  perf-profile.children.cycles-pp.exit_mmap
      0.00            +0.2        0.15 ± 48%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.04 ± 60%      +0.2        0.20 ± 18%  perf-profile.children.cycles-pp.new_sync_read
      0.11 ± 58%      +0.2        0.27 ± 30%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.15 ± 34%      +0.2        0.32 ± 11%  perf-profile.children.cycles-pp.mmput
      0.20 ±  9%      +0.2        0.37 ± 15%  perf-profile.children.cycles-pp.do_page_fault
      0.16 ± 18%      +0.2        0.32 ± 18%  perf-profile.children.cycles-pp.handle_mm_fault
      0.13 ± 24%      +0.2        0.31 ± 24%  perf-profile.children.cycles-pp.handle_pte_fault
      0.04 ±107%      +0.2        0.21 ± 49%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.11 ± 30%      +0.2        0.30 ± 17%  perf-profile.children.cycles-pp.search_binary_handler
      0.11 ± 30%      +0.2        0.30 ± 17%  perf-profile.children.cycles-pp.load_elf_binary
      0.03 ±102%      +0.2        0.21 ± 16%  perf-profile.children.cycles-pp.update_curr
      0.14 ± 26%      +0.2        0.32 ± 18%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.21 ± 12%      +0.2        0.41 ±  9%  perf-profile.children.cycles-pp.page_fault
      0.09 ± 20%      +0.2        0.29 ± 28%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.12 ± 19%      +0.2        0.32 ± 36%  perf-profile.children.cycles-pp.native_write_msr
      0.12 ± 18%      +0.2        0.33 ± 34%  perf-profile.children.cycles-pp.ksys_read
      0.14 ± 23%      +0.2        0.35 ± 32%  perf-profile.children.cycles-pp.read
      0.12 ± 18%      +0.2        0.35 ± 33%  perf-profile.children.cycles-pp.vfs_read
      0.12 ± 28%      +0.2        0.35 ± 22%  perf-profile.children.cycles-pp.clockevents_program_event
      0.04 ±101%      +0.2        0.28 ± 12%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.10 ± 36%      +0.2        0.34 ± 39%  perf-profile.children.cycles-pp.update_load_avg
      0.10 ± 35%      +0.3        0.35 ± 20%  perf-profile.children.cycles-pp.interrupt_entry
      0.16 ± 17%      +0.3        0.44 ± 22%  perf-profile.children.cycles-pp.execve
      0.16 ± 17%      +0.3        0.44 ± 22%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.16 ± 17%      +0.3        0.44 ± 22%  perf-profile.children.cycles-pp.__do_execve_file
      0.10 ± 65%      +0.3        0.40 ± 16%  perf-profile.children.cycles-pp.__softirqentry_text_start
      0.12 ± 64%      +0.3        0.43 ± 19%  perf-profile.children.cycles-pp.irq_exit
      0.18 ± 42%      +0.5        0.65 ± 34%  perf-profile.children.cycles-pp.task_tick_fair
      0.12 ± 75%      +0.5        0.62 ± 20%  perf-profile.children.cycles-pp.exit_to_usermode_loop
      0.22 ± 45%      +0.5        0.73 ± 27%  perf-profile.children.cycles-pp.scheduler_tick
      0.16 ± 26%      +0.5        0.69 ±103%  perf-profile.children.cycles-pp.write
      0.16 ± 46%      +0.6        0.74 ± 24%  perf-profile.children.cycles-pp.schedule
      0.15 ± 51%      +0.6        0.75 ± 25%  perf-profile.children.cycles-pp.__sched_text_start
      0.29 ± 51%      +0.6        0.91 ± 18%  perf-profile.children.cycles-pp.prepare_exit_to_usermode
      0.18 ± 14%      +0.7        0.91 ± 14%  perf-profile.children.cycles-pp.irq_work_run
      0.18 ± 14%      +0.7        0.91 ± 14%  perf-profile.children.cycles-pp.printk
      0.18 ± 14%      +0.7        0.91 ± 15%  perf-profile.children.cycles-pp.irq_work_interrupt
      0.18 ± 14%      +0.7        0.91 ± 15%  perf-profile.children.cycles-pp.smp_irq_work_interrupt
      0.35 ± 26%      +0.8        1.19 ±  7%  perf-profile.children.cycles-pp.tick_sched_handle
      0.35 ± 26%      +0.8        1.19 ±  7%  perf-profile.children.cycles-pp.update_process_times
      0.39 ± 44%      +0.9        1.24 ± 22%  perf-profile.children.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      0.41 ± 23%      +0.9        1.35 ± 11%  perf-profile.children.cycles-pp.tick_sched_timer
      0.24 ± 23%      +1.0        1.22 ± 19%  perf-profile.children.cycles-pp.irq_work_run_list
      0.18 ± 14%      +1.2        1.34 ± 43%  perf-profile.children.cycles-pp.vprintk_emit
      0.21 ± 16%      +1.2        1.40 ± 40%  perf-profile.children.cycles-pp.drm_fb_helper_cfb_imageblit
      0.21 ± 16%      +1.2        1.40 ± 40%  perf-profile.children.cycles-pp.cfb_imageblit
      0.23 ± 14%      +1.3        1.50 ± 40%  perf-profile.children.cycles-pp.bit_putcs
      0.64 ± 26%      +1.3        1.92 ± 10%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.23 ± 16%      +1.3        1.52 ± 39%  perf-profile.children.cycles-pp.fbcon_putcs
      0.24 ± 19%      +1.3        1.55 ± 40%  perf-profile.children.cycles-pp.fbcon_redraw
      0.24 ± 20%      +1.3        1.56 ± 40%  perf-profile.children.cycles-pp.lf
      0.24 ± 20%      +1.3        1.56 ± 40%  perf-profile.children.cycles-pp.con_scroll
      0.24 ± 20%      +1.3        1.56 ± 40%  perf-profile.children.cycles-pp.fbcon_scroll
      0.24 ± 20%      +1.3        1.57 ± 39%  perf-profile.children.cycles-pp.vt_console_print
      0.99 ±  8%      +1.4        2.36 ± 27%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.98 ±  7%      +1.4        2.36 ± 27%  perf-profile.children.cycles-pp.do_syscall_64
      0.24 ± 23%      +1.4        1.63 ± 40%  perf-profile.children.cycles-pp.console_unlock
      0.91 ± 21%      +1.8        2.68 ±  6%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.08 ± 23%      +2.1        3.21 ±  7%  perf-profile.children.cycles-pp.smp_apic_timer_interrupt
      1.18 ± 24%      +2.4        3.56 ±  6%  perf-profile.children.cycles-pp.apic_timer_interrupt
     73.53            -4.7       68.82        perf-profile.self.cycles-pp.malloc
     15.91 ±  2%      -0.9       15.05 ±  4%  perf-profile.self.cycles-pp.free
      0.01 ±173%      +0.1        0.11 ± 26%  perf-profile.self.cycles-pp.__calc_delta
      0.02 ±173%      +0.1        0.14 ± 42%  perf-profile.self.cycles-pp.unmap_page_range
      0.12 ± 19%      +0.2        0.32 ± 36%  perf-profile.self.cycles-pp.native_write_msr
      0.10 ± 40%      +0.2        0.34 ± 33%  perf-profile.self.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      0.10 ± 35%      +0.3        0.35 ± 20%  perf-profile.self.cycles-pp.interrupt_entry
      0.21 ± 16%      +1.2        1.40 ± 40%  perf-profile.self.cycles-pp.cfb_imageblit



***************************************************************************************************
lkp-bdw-ep6: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz with 128G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/process/16/debian-x86_64-20191114.cgz/lkp-bdw-ep6/pthread_mutex1/will-it-scale/0xb000038

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4           25%           1:4     dmesg.RIP:__do_softirq
           :4           25%           1:4     dmesg.RIP:__usb_hcd_giveback_urb
           :4           25%           1:4     dmesg.RIP:_raw_spin_unlock_irqrestore
           :4          100%           4:4     dmesg.RIP:cpuidle_enter_state
           :4           25%           1:4     dmesg.RIP:rebalance_domains
           :4           25%           1:4     dmesg.RIP:tick_nohz_idle_exit
         %stddev     %change         %stddev
             \          |                \  
 2.505e+08           -57.9%  1.055e+08        will-it-scale.per_process_ops
 4.008e+09           -57.9%  1.689e+09        will-it-scale.workload
     31547 ±  5%     -12.9%      27481        meminfo.Shmem
      0.03 ±  4%      +0.0        0.06        mpstat.cpu.all.sys%
     14785 ± 18%     -17.9%      12143 ± 17%  numa-meminfo.node0.Mapped
    713810 ±  2%      +8.2%     772630 ±  7%  numa-vmstat.node1.numa_hit
      1410            +6.8%       1506        vmstat.system.cs
    428161 ±127%     -89.3%      45998 ±  2%  cpuidle.POLL.time
     59373 ± 53%     -82.2%      10569 ±  5%  cpuidle.POLL.usage
     70394            -2.1%      68899        proc-vmstat.nr_active_anon
     67334            -0.8%      66815        proc-vmstat.nr_anon_pages
      7887 ±  5%     -12.9%       6866        proc-vmstat.nr_shmem
     70394            -2.1%      68899        proc-vmstat.nr_zone_active_anon
      4138 ± 15%     -35.2%       2681 ±  3%  proc-vmstat.pgactivate
     28675 ± 40%     +66.5%      47730 ±  3%  softirqs.CPU0.SCHED
     77182 ±  5%     +11.3%      85908 ±  4%  softirqs.CPU14.RCU
    155252 ± 11%     -22.8%     119871 ± 22%  softirqs.CPU22.TIMER
     23136 ± 48%     -78.4%       5002 ± 16%  softirqs.CPU44.SCHED
    115092 ±  6%      +7.6%     123849 ±  4%  softirqs.CPU45.RCU
    145244 ± 20%     -25.6%     108094 ± 29%  softirqs.CPU54.TIMER
 3.615e+10           -57.5%  1.535e+10        perf-stat.i.branch-instructions
      0.04 ± 30%      +0.1        0.09 ± 23%  perf-stat.i.branch-miss-rate%
      1384            +6.6%       1476        perf-stat.i.context-switches
 4.814e+10 ±  2%     -53.8%  2.224e+10 ±  4%  perf-stat.i.cpu-cycles
 2.831e+10           -57.7%  1.198e+10        perf-stat.i.dTLB-loads
  1.22e+10           -56.8%   5.27e+09        perf-stat.i.dTLB-stores
 7.282e+10           -57.1%  3.126e+10        perf-stat.i.instructions
      0.03 ± 33%      +0.0        0.08 ± 27%  perf-stat.overall.branch-miss-rate%
    191503 ± 31%     -57.5%      81299 ± 49%  perf-stat.overall.cycles-between-cache-misses
      5463            +2.0%       5571        perf-stat.overall.path-length
 3.603e+10           -57.5%   1.53e+10        perf-stat.ps.branch-instructions
      1379            +6.6%       1471        perf-stat.ps.context-switches
 4.798e+10 ±  2%     -53.8%  2.216e+10 ±  4%  perf-stat.ps.cpu-cycles
 2.822e+10           -57.7%  1.194e+10        perf-stat.ps.dTLB-loads
 1.215e+10           -56.8%  5.253e+09        perf-stat.ps.dTLB-stores
 7.257e+10           -57.1%  3.115e+10        perf-stat.ps.instructions
  2.19e+13           -57.0%  9.407e+12        perf-stat.total.instructions
     47232 ±  8%     +29.0%      60937 ±  4%  sched_debug.cfs_rq:/.exec_clock.avg
      7.97 ± 16%    +268.2%      29.34 ± 36%  sched_debug.cfs_rq:/.exec_clock.min
    797768 ±  8%     +30.8%    1043808 ±  4%  sched_debug.cfs_rq:/.min_vruntime.avg
      8594 ± 14%     +36.3%      11717 ± 19%  sched_debug.cfs_rq:/.min_vruntime.min
      0.28 ± 27%     +58.9%       0.44 ± 17%  sched_debug.cfs_rq:/.nr_spread_over.stddev
     23.87 ±  2%     +16.0%      27.69 ± 11%  sched_debug.cfs_rq:/.runnable_load_avg.stddev
    -85357         -1249.7%     981342 ±  9%  sched_debug.cfs_rq:/.spread0.avg
   1493225 ± 52%     +65.4%    2469981 ±  3%  sched_debug.cfs_rq:/.spread0.max
      2.21 ± 12%     +91.5%       4.23 ±  7%  sched_debug.cpu.clock.stddev
      2.21 ± 12%     +91.5%       4.23 ±  7%  sched_debug.cpu.clock_task.stddev
      5104 ±  7%     +20.8%       6165 ±  5%  sched_debug.cpu.nr_switches.stddev
      4617 ±  8%     +22.4%       5653 ±  6%  sched_debug.cpu.sched_count.stddev
      1029 ±  7%     +15.4%       1188        sched_debug.cpu.sched_goidle.avg
      2318 ±  7%     +22.4%       2838 ±  6%  sched_debug.cpu.sched_goidle.stddev
      1028 ±  7%     +15.0%       1183        sched_debug.cpu.ttwu_count.avg
      2242 ± 13%     +19.7%       2685 ± 10%  sched_debug.cpu.ttwu_count.stddev
      6631 ± 42%    +101.3%      13349 ±  8%  sched_debug.cpu.ttwu_local.max
    960.52 ± 24%     +66.7%       1601 ±  9%  sched_debug.cpu.ttwu_local.stddev
      0.36 ±100%      +0.5        0.91 ± 11%  perf-profile.calltrace.cycles-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.94 ±101%      +2.8        3.75 ±  5%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_kernel.secondary_startup_64
      0.94 ±101%      +2.8        3.75 ±  5%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_kernel.secondary_startup_64
      0.94 ±101%      +2.8        3.75 ±  5%  perf-profile.calltrace.cycles-pp.start_kernel.secondary_startup_64
      0.93 ±101%      +2.8        3.75 ±  5%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_kernel.secondary_startup_64
      0.93 ±101%      +2.8        3.75 ±  5%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_kernel
     17.82 ± 27%      -4.5       13.32 ±  3%  perf-profile.children.cycles-pp.pthread_mutex_lock
      8.70 ± 27%      -2.3        6.44 ±  2%  perf-profile.children.cycles-pp.pthread_mutex_lock@plt
      8.75 ± 28%      -2.2        6.52 ±  4%  perf-profile.children.cycles-pp.pthread_mutex_unlock@plt
      0.05 ± 60%      +0.0        0.08 ± 13%  perf-profile.children.cycles-pp.note_gp_changes
      0.10 ± 11%      +0.0        0.14 ±  6%  perf-profile.children.cycles-pp.console_unlock
      0.10 ± 12%      +0.0        0.14 ± 10%  perf-profile.children.cycles-pp.irq_work_run_list
      0.06 ± 60%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.interrupt_entry
      0.11 ± 21%      +0.1        0.17 ± 10%  perf-profile.children.cycles-pp.read_tsc
      0.09 ± 26%      +0.1        0.15 ± 15%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.20 ± 21%      +0.1        0.29 ± 30%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.18 ± 33%      +0.1        0.28 ± 13%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.28 ± 28%      +0.1        0.42 ± 10%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.32 ± 23%      +0.2        0.51 ±  6%  perf-profile.children.cycles-pp.rcu_core
      0.64 ± 25%      +0.3        0.93 ± 13%  perf-profile.children.cycles-pp.__softirqentry_text_start
      0.78 ± 21%      +0.4        1.20 ±  8%  perf-profile.children.cycles-pp.irq_exit
      0.94 ±101%      +2.8        3.75 ±  5%  perf-profile.children.cycles-pp.start_kernel
      9.09 ± 27%      -2.3        6.82 ±  4%  perf-profile.self.cycles-pp.pthread_mutex_lock
      8.58 ± 27%      -2.3        6.31 ±  3%  perf-profile.self.cycles-pp.pthread_mutex_lock@plt
      8.67 ± 28%      -2.2        6.43 ±  4%  perf-profile.self.cycles-pp.pthread_mutex_unlock@plt
      0.03 ±100%      +0.0        0.07 ± 17%  perf-profile.self.cycles-pp._raw_spin_lock
      0.06 ± 63%      +0.0        0.10 ±  7%  perf-profile.self.cycles-pp.interrupt_entry
      0.11 ± 20%      +0.0        0.16 ± 11%  perf-profile.self.cycles-pp.read_tsc
      0.09 ± 26%      +0.1        0.15 ± 15%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.18 ± 33%      +0.1        0.28 ± 13%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
    300.75 ± 54%     +75.6%     528.25 ± 23%  interrupts.37:IR-PCI-MSI.1572868-edge.eth0-TxRx-3
    464.50 ± 33%     -57.5%     197.50 ± 19%  interrupts.40:IR-PCI-MSI.1572871-edge.eth0-TxRx-6
    412.50 ±  7%     -14.2%     354.00        interrupts.9:IR-IO-APIC.9-fasteoi.acpi
    412.50 ±  7%     -14.2%     354.00        interrupts.CPU1.9:IR-IO-APIC.9-fasteoi.acpi
      4557 ± 26%     -37.1%       2865        interrupts.CPU10.NMI:Non-maskable_interrupts
      4557 ± 26%     -37.1%       2865        interrupts.CPU10.PMI:Performance_monitoring_interrupts
      4336 ± 33%     -42.4%       2499 ± 24%  interrupts.CPU15.NMI:Non-maskable_interrupts
      4336 ± 33%     -42.4%       2499 ± 24%  interrupts.CPU15.PMI:Performance_monitoring_interrupts
    300.75 ± 54%     +75.6%     528.25 ± 23%  interrupts.CPU16.37:IR-PCI-MSI.1572868-edge.eth0-TxRx-3
    464.50 ± 33%     -57.5%     197.50 ± 19%  interrupts.CPU19.40:IR-PCI-MSI.1572871-edge.eth0-TxRx-6
      4285 ± 33%     -33.4%       2856        interrupts.CPU2.NMI:Non-maskable_interrupts
      4285 ± 33%     -33.4%       2856        interrupts.CPU2.PMI:Performance_monitoring_interrupts
     12.75 ± 50%    +294.1%      50.25 ± 83%  interrupts.CPU27.RES:Rescheduling_interrupts
      7890           -57.4%       3358        interrupts.CPU45.NMI:Non-maskable_interrupts
      7890           -57.4%       3358        interrupts.CPU45.PMI:Performance_monitoring_interrupts
      7890           -57.4%       3357        interrupts.CPU46.NMI:Non-maskable_interrupts
      7890           -57.4%       3357        interrupts.CPU46.PMI:Performance_monitoring_interrupts
      6903 ± 24%     -51.3%       3358        interrupts.CPU47.NMI:Non-maskable_interrupts
      6903 ± 24%     -51.3%       3358        interrupts.CPU47.PMI:Performance_monitoring_interrupts
      6904 ± 24%     -51.3%       3360        interrupts.CPU48.NMI:Non-maskable_interrupts
      6904 ± 24%     -51.3%       3360        interrupts.CPU48.PMI:Performance_monitoring_interrupts
      5917 ± 33%     -43.2%       3358        interrupts.CPU49.NMI:Non-maskable_interrupts
      5917 ± 33%     -43.2%       3358        interrupts.CPU49.PMI:Performance_monitoring_interrupts
      4287 ± 33%     -33.4%       2856        interrupts.CPU5.NMI:Non-maskable_interrupts
      4287 ± 33%     -33.4%       2856        interrupts.CPU5.PMI:Performance_monitoring_interrupts
      4930 ± 34%     -34.4%       3233 ±  6%  interrupts.CPU50.NMI:Non-maskable_interrupts
      4930 ± 34%     -34.4%       3233 ±  6%  interrupts.CPU50.PMI:Performance_monitoring_interrupts
      4940 ± 34%     -34.3%       3245 ±  5%  interrupts.CPU52.NMI:Non-maskable_interrupts
      4940 ± 34%     -34.3%       3245 ±  5%  interrupts.CPU52.PMI:Performance_monitoring_interrupts
      5907 ± 33%     -43.2%       3357        interrupts.CPU53.NMI:Non-maskable_interrupts
      5907 ± 33%     -43.2%       3357        interrupts.CPU53.PMI:Performance_monitoring_interrupts
      5913 ± 33%     -43.2%       3357        interrupts.CPU55.NMI:Non-maskable_interrupts
      5913 ± 33%     -43.2%       3357        interrupts.CPU55.PMI:Performance_monitoring_interrupts
      6905 ± 24%     -51.3%       3361        interrupts.CPU56.NMI:Non-maskable_interrupts
      6905 ± 24%     -51.3%       3361        interrupts.CPU56.PMI:Performance_monitoring_interrupts
      6904 ± 24%     -57.5%       2937 ± 24%  interrupts.CPU57.NMI:Non-maskable_interrupts
      6904 ± 24%     -57.5%       2937 ± 24%  interrupts.CPU57.PMI:Performance_monitoring_interrupts
      6904 ± 24%     -57.5%       2937 ± 24%  interrupts.CPU58.NMI:Non-maskable_interrupts
      6904 ± 24%     -57.5%       2937 ± 24%  interrupts.CPU58.PMI:Performance_monitoring_interrupts
      6858 ± 24%     -57.2%       2937 ± 24%  interrupts.CPU59.NMI:Non-maskable_interrupts
      6858 ± 24%     -57.2%       2937 ± 24%  interrupts.CPU59.PMI:Performance_monitoring_interrupts
    175277 ± 13%     -40.2%     104738 ±  2%  interrupts.NMI:Non-maskable_interrupts
    175277 ± 13%     -40.2%     104738 ±  2%  interrupts.PMI:Performance_monitoring_interrupts



***************************************************************************************************
lkp-ivb-d02: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/thread/16/debian-x86_64-20191114.cgz/lkp-ivb-d02/pipe1/will-it-scale/0x21

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4           50%           2:4     dmesg.RIP:_raw_spin_unlock_irqrestore
           :4           75%           3:4     dmesg.RIP:cpuidle_enter_state
           :4           25%           1:4     dmesg.RIP:find_busiest_group
         %stddev     %change         %stddev
             \          |                \  
    127138           -53.5%      59094        will-it-scale.per_thread_ops
   1099984           -16.2%     922278 ±  2%  will-it-scale.time.involuntary_context_switches
    391.00            -3.5%     377.25        will-it-scale.time.percent_of_cpu_this_job_got
    791.53            -3.9%     761.03        will-it-scale.time.system_time
    387.84            -2.8%     376.84 ±  2%  will-it-scale.time.user_time
   2034223           -53.5%     945514        will-it-scale.workload
     21.92 ±  3%     +10.7%      24.26 ±  5%  boot-time.boot
     80.50 ± 42%     -88.8%       9.00 ± 26%  cpuidle.POLL.usage
     17343            -8.6%      15858        meminfo.Shmem
    139.50           +68.1%     234.50 ± 22%  slabinfo.fsnotify_mark_connector.active_objs
     46750 ±  6%     +13.7%      53160 ±  3%  softirqs.CPU2.RCU
    194293 ±  6%     +11.6%     216921 ±  4%  softirqs.RCU
     15629 ±  3%     +12.7%      17621        softirqs.SCHED
     65.50            -3.8%      63.00        vmstat.cpu.sy
     33.00            +7.6%      35.50 ±  2%  vmstat.cpu.us
      7308            -4.7%       6968        vmstat.system.cs
     10952            -4.1%      10502        vmstat.system.in
     65863            -4.9%      62633        proc-vmstat.nr_active_anon
     64543            -4.4%      61687        proc-vmstat.nr_anon_pages
      4336            -8.6%       3965        proc-vmstat.nr_shmem
     65838            -4.9%      62614        proc-vmstat.nr_zone_active_anon
      1233 ± 10%     -44.0%     690.25 ± 11%  proc-vmstat.pgactivate
    351470            -1.9%     344919        proc-vmstat.pgfree
     10854 ± 13%     -71.6%       3083        interrupts.CPU0.NMI:Non-maskable_interrupts
     10854 ± 13%     -71.6%       3083        interrupts.CPU0.PMI:Performance_monitoring_interrupts
      7952 ± 33%     -61.3%       3075        interrupts.CPU2.NMI:Non-maskable_interrupts
      7952 ± 33%     -61.3%       3075        interrupts.CPU2.PMI:Performance_monitoring_interrupts
      7999 ± 34%     -51.8%       3857 ± 34%  interrupts.CPU3.NMI:Non-maskable_interrupts
      7999 ± 34%     -51.8%       3857 ± 34%  interrupts.CPU3.PMI:Performance_monitoring_interrupts
     33765 ± 11%     -56.6%      14652 ± 17%  interrupts.NMI:Non-maskable_interrupts
     33765 ± 11%     -56.6%      14652 ± 17%  interrupts.PMI:Performance_monitoring_interrupts
     10614 ± 11%     +14.7%      12169 ±  5%  interrupts.RES:Rescheduling_interrupts
      5992 ± 32%     +90.7%      11431 ± 26%  sched_debug.cfs_rq:/.min_vruntime.stddev
      7.66 ±  5%    +103.5%      15.58 ± 12%  sched_debug.cfs_rq:/.nr_spread_over.avg
     22.46 ± 10%     +60.7%      36.08 ± 17%  sched_debug.cfs_rq:/.nr_spread_over.max
      1237 ±365%   -1083.4%     -12166        sched_debug.cfs_rq:/.spread0.avg
     -7514          +237.4%     -25357        sched_debug.cfs_rq:/.spread0.min
      5990 ± 32%     +91.1%      11445 ± 26%  sched_debug.cfs_rq:/.spread0.stddev
     31.19 ± 30%     +88.5%      58.80 ± 24%  sched_debug.cfs_rq:/.util_avg.stddev
      3.16 ± 10%     +88.7%       5.96 ± 16%  sched_debug.cpu.clock.stddev
      3.16 ± 10%     +88.7%       5.96 ± 16%  sched_debug.cpu.clock_task.stddev
      2065 ±  2%     -19.8%       1656 ±  8%  sched_debug.cpu.sched_goidle.avg
      1.46 ±173%   +1800.0%      27.71 ± 73%  sched_debug.cpu.sched_goidle.min
      0.19 ±  9%    +113.6%       0.40        perf-stat.i.MPKI
 1.207e+09           -50.5%  5.976e+08        perf-stat.i.branch-instructions
      1.58            +0.3        1.93        perf-stat.i.branch-miss-rate%
  19250623           -39.4%   11672275        perf-stat.i.branch-misses
     12.39 ±  4%      +2.7       15.10        perf-stat.i.cache-miss-rate%
    144627 ±  2%     +29.9%     187812        perf-stat.i.cache-misses
   1080010 ±  2%     +12.8%    1218216        perf-stat.i.cache-references
      7371            -4.7%       7022        perf-stat.i.context-switches
      2.14            -2.0%       2.10        perf-stat.i.cpi
 1.307e+10           -51.7%   6.31e+09        perf-stat.i.cpu-cycles
     37.68 ±  8%      +8.9%      41.02 ±  7%  perf-stat.i.cpu-migrations
    156713 ±  2%     -62.9%      58110 ± 11%  perf-stat.i.cycles-between-cache-misses
  38767199 ± 12%     -54.5%   17640059 ± 14%  perf-stat.i.dTLB-load-misses
 1.856e+09           -51.6%  8.987e+08        perf-stat.i.dTLB-loads
   9750289 ±  3%     -55.6%    4330192 ±  4%  perf-stat.i.dTLB-store-misses
 1.354e+09           -52.3%   6.46e+08        perf-stat.i.dTLB-stores
   1949136 ±  9%     -47.8%    1016639 ± 16%  perf-stat.i.iTLB-load-misses
      5860 ± 14%     +81.5%      10639 ± 14%  perf-stat.i.iTLB-loads
 6.112e+09           -50.7%  3.015e+09        perf-stat.i.instructions
      0.47            +2.0%       0.48        perf-stat.i.ipc
      0.18 ±  2%    +128.9%       0.40        perf-stat.overall.MPKI
      1.59            +0.4        1.95        perf-stat.overall.branch-miss-rate%
     13.40 ±  3%      +2.0       15.43        perf-stat.overall.cache-miss-rate%
      2.14            -2.1%       2.09        perf-stat.overall.cpi
     90397 ±  2%     -62.9%      33558        perf-stat.overall.cycles-between-cache-misses
      0.47            +2.2%       0.48        perf-stat.overall.ipc
    906994            +6.0%     961269        perf-stat.overall.path-length
 1.203e+09           -50.5%  5.957e+08        perf-stat.ps.branch-instructions
  19187059           -39.4%   11636390        perf-stat.ps.branch-misses
    144150 ±  2%     +30.0%     187452        perf-stat.ps.cache-misses
   1076446 ±  2%     +12.9%    1215149        perf-stat.ps.cache-references
      7346            -4.8%       6995        perf-stat.ps.context-switches
 1.302e+10           -51.7%  6.289e+09        perf-stat.ps.cpu-cycles
     37.55 ±  8%      +8.8%      40.87 ±  7%  perf-stat.ps.cpu-migrations
  38639130 ± 12%     -54.5%   17580860 ± 14%  perf-stat.ps.dTLB-load-misses
 1.849e+09           -51.6%  8.957e+08        perf-stat.ps.dTLB-loads
   9718082 ±  3%     -55.6%    4315591 ±  4%  perf-stat.ps.dTLB-store-misses
  1.35e+09           -52.3%  6.438e+08        perf-stat.ps.dTLB-stores
   1942698 ±  9%     -47.8%    1013144 ± 16%  perf-stat.ps.iTLB-load-misses
      5841 ± 14%     +81.7%      10612 ± 14%  perf-stat.ps.iTLB-loads
 6.092e+09           -50.7%  3.006e+09        perf-stat.ps.instructions
 1.845e+12           -50.7%  9.089e+11        perf-stat.total.instructions
     50.03            -1.1       48.94        perf-profile.calltrace.cycles-pp.__GI___libc_read
     34.45            -0.8       33.67        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__GI___libc_read
     35.23            -0.7       34.49        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__GI___libc_read
      0.55 ±  4%      -0.3        0.26 ±100%  perf-profile.calltrace.cycles-pp.__sb_start_write.pipe_write.new_sync_write.vfs_write.ksys_write
      0.86 ± 22%      -0.2        0.67 ± 18%  perf-profile.calltrace.cycles-pp.fsnotify.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     50.15            -1.1       49.10        perf-profile.children.cycles-pp.__GI___libc_read
      0.07 ± 24%      +0.0        0.12 ± 21%  perf-profile.children.cycles-pp.do_page_fault
      0.07 ± 21%      +0.0        0.12 ± 19%  perf-profile.children.cycles-pp.handle_mm_fault
      0.01 ±173%      +0.1        0.06 ± 26%  perf-profile.children.cycles-pp.clockevents_program_event
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.do_sys_open
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.do_sys_openat2
      0.05 ± 60%      +0.1        0.10 ± 17%  perf-profile.children.cycles-pp.handle_pte_fault
      0.01 ±173%      +0.1        0.07 ± 31%  perf-profile.children.cycles-pp.native_write_msr
      0.01 ±173%      +0.1        0.07 ± 21%  perf-profile.children.cycles-pp.search_binary_handler
      0.01 ±173%      +0.1        0.07 ± 21%  perf-profile.children.cycles-pp.load_elf_binary
      0.08 ± 19%      +0.1        0.14 ± 16%  perf-profile.children.cycles-pp.page_fault
      0.06 ± 60%      +0.1        0.12 ± 19%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.12 ± 26%      +0.1        0.18 ± 15%  perf-profile.children.cycles-pp.__vfs_read
      0.00            +0.1        0.07 ± 13%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.00            +0.1        0.07 ± 12%  perf-profile.children.cycles-pp.activate_task
      0.00            +0.1        0.07 ± 12%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.01 ±173%      +0.1        0.08 ± 10%  perf-profile.children.cycles-pp.try_to_wake_up
      0.03 ±100%      +0.1        0.10 ± 25%  perf-profile.children.cycles-pp.execve
      0.03 ±100%      +0.1        0.10 ± 25%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.03 ±100%      +0.1        0.10 ± 25%  perf-profile.children.cycles-pp.__do_execve_file
      0.03 ±100%      +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.read
      0.04 ± 57%      +0.1        0.12 ± 17%  perf-profile.children.cycles-pp.__sched_text_start
      0.03 ±100%      +0.1        0.11 ± 28%  perf-profile.children.cycles-pp.__softirqentry_text_start
      0.03 ±100%      +0.1        0.11 ± 35%  perf-profile.children.cycles-pp.irq_exit
      0.02 ±173%      +0.1        0.11 ± 20%  perf-profile.children.cycles-pp.write
      0.01 ±173%      +0.1        0.10 ± 45%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.1        0.10 ± 18%  perf-profile.children.cycles-pp.schedule
      0.84 ±  3%      +0.1        0.96 ±  4%  perf-profile.children.cycles-pp.fput_many
      0.05 ± 59%      +0.1        0.20 ± 43%  perf-profile.children.cycles-pp.task_tick_fair
      0.06 ± 60%      +0.1        0.21 ± 10%  perf-profile.children.cycles-pp.cfb_imageblit
      0.06 ± 60%      +0.2        0.21 ± 12%  perf-profile.children.cycles-pp.drm_fb_helper_cfb_imageblit
      0.08 ± 26%      +0.2        0.24 ±  6%  perf-profile.children.cycles-pp.console_unlock
      0.08 ± 24%      +0.2        0.24 ±  5%  perf-profile.children.cycles-pp.fbcon_redraw
      0.07 ± 60%      +0.2        0.23 ± 42%  perf-profile.children.cycles-pp.scheduler_tick
      0.08 ± 26%      +0.2        0.25 ±  7%  perf-profile.children.cycles-pp.irq_work_run_list
      0.08 ± 24%      +0.2        0.24 ±  6%  perf-profile.children.cycles-pp.vt_console_print
      0.08 ± 24%      +0.2        0.24 ±  6%  perf-profile.children.cycles-pp.lf
      0.08 ± 24%      +0.2        0.24 ±  6%  perf-profile.children.cycles-pp.con_scroll
      0.08 ± 24%      +0.2        0.24 ±  6%  perf-profile.children.cycles-pp.fbcon_scroll
      0.06 ± 14%      +0.2        0.23 ±  7%  perf-profile.children.cycles-pp.irq_work_interrupt
      0.06 ± 14%      +0.2        0.23 ±  7%  perf-profile.children.cycles-pp.smp_irq_work_interrupt
      0.06 ± 14%      +0.2        0.23 ±  7%  perf-profile.children.cycles-pp.irq_work_run
      0.06 ± 14%      +0.2        0.23 ±  7%  perf-profile.children.cycles-pp.printk
      0.06 ± 14%      +0.2        0.23 ±  7%  perf-profile.children.cycles-pp.vprintk_emit
      0.07 ± 60%      +0.2        0.24 ± 10%  perf-profile.children.cycles-pp.fbcon_putcs
      0.06 ± 58%      +0.2        0.23 ±  8%  perf-profile.children.cycles-pp.bit_putcs
      0.13 ± 22%      +0.2        0.31 ± 31%  perf-profile.children.cycles-pp.update_process_times
      0.13 ± 24%      +0.2        0.32 ± 32%  perf-profile.children.cycles-pp.tick_sched_handle
      0.15 ± 26%      +0.2        0.36 ± 29%  perf-profile.children.cycles-pp.tick_sched_timer
      0.21 ± 18%      +0.3        0.48 ± 25%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.29 ± 18%      +0.3        0.62 ± 23%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.34 ± 18%      +0.4        0.76 ± 25%  perf-profile.children.cycles-pp.smp_apic_timer_interrupt
      0.39 ± 17%      +0.4        0.83 ± 24%  perf-profile.children.cycles-pp.apic_timer_interrupt
      1.67 ±  7%      -0.2        1.45 ±  8%  perf-profile.self.cycles-pp.__fsnotify_parent
      0.01 ±173%      +0.1        0.07 ± 31%  perf-profile.self.cycles-pp.native_write_msr
      0.10 ± 29%      +0.1        0.16 ± 14%  perf-profile.self.cycles-pp.__vfs_read
      0.82 ±  3%      +0.1        0.93 ±  4%  perf-profile.self.cycles-pp.fput_many
      0.06 ± 60%      +0.1        0.21 ± 10%  perf-profile.self.cycles-pp.cfb_imageblit



***************************************************************************************************
lkp-bdw-de1: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz with 48G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_threads/rootfs/tbox_group/test/test_memory_size/testcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/development/50%/debian-x86_64-20191114.cgz/lkp-bdw-de1/MMAP/50%/lmbench3/0x7000019

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4           50%           2:4     dmesg.RIP:_raw_spin_unlock_irqrestore
           :4           75%           3:4     dmesg.RIP:cpuidle_enter_state
           :4           25%           1:4     dmesg.RIP:find_busiest_group
          2:4           16%           2:4     perf-profile.calltrace.cycles-pp.sync_regs.error_entry
         11:4           72%          14:4     perf-profile.calltrace.cycles-pp.error_entry
          0:4            1%           0:4     perf-profile.children.cycles-pp.error_exit
         12:4           78%          15:4     perf-profile.children.cycles-pp.error_entry
          9:4           63%          12:4     perf-profile.self.cycles-pp.error_entry
         %stddev     %change         %stddev
             \          |                \  
     59796           -36.3%      38109 ±  5%  lmbench3.MMAP.read.bandwidth.MB/sec
     34823           -53.4%      16211 ±  2%  lmbench3.MMAP.read_open2close.bandwidth.MB/sec
 9.874e+08 ±  9%     -69.3%  3.027e+08        lmbench3.time.minor_page_faults
      2771 ±  8%     -11.2%       2461        lmbench3.time.system_time
   5509144 ±  7%     -67.8%    1775030 ±  4%  lmbench3.time.voluntary_context_switches
      0.00 ±125%      +0.0        0.00 ± 54%  mpstat.cpu.all.iowait%
     12325 ± 23%     -56.2%       5404 ±  3%  vmstat.system.cs
    172684 ±  8%     +20.6%     208196 ±  4%  meminfo.Mapped
     30615 ±  3%     -19.1%      24758        meminfo.Shmem
     39.60 ± 10%     +24.2%      49.18 ± 11%  boot-time.boot
     21.16 ± 17%     +18.3%      25.04 ± 22%  boot-time.dhcp
    576.19 ± 10%     +21.1%     697.49 ± 11%  boot-time.idle
   3634135 ± 11%    +276.1%   13669368 ±  3%  cpuidle.C1.time
    902893 ±  9%     +70.4%    1538961 ±  4%  cpuidle.C1.usage
 5.698e+09 ± 56%     -46.4%  3.053e+09 ± 18%  cpuidle.C1E.time
  13219284 ±  7%     -68.1%    4210732 ±  4%  cpuidle.POLL.time
   5423686 ±  7%     -88.0%     651438 ±  4%  cpuidle.POLL.usage
     42733 ± 10%     +23.0%      52572 ±  4%  proc-vmstat.nr_mapped
      7653 ±  3%     -19.1%       6189        proc-vmstat.nr_shmem
     12908            -2.7%      12561        proc-vmstat.nr_slab_unreclaimable
  58993011 ±  9%     -60.9%   23090737        proc-vmstat.numa_hit
  58993011 ±  9%     -60.9%   23090737        proc-vmstat.numa_local
      2582 ± 27%     -46.4%       1383 ±  5%  proc-vmstat.pgactivate
  70058749 ±  8%     -53.9%   32317690        proc-vmstat.pgalloc_normal
 1.652e+09 ±  9%     -69.5%  5.031e+08        proc-vmstat.pgfault
  70019497 ±  8%     -54.0%   32182265        proc-vmstat.pgfree
    839.50 ± 13%     -19.6%     675.25 ±  4%  slabinfo.Acpi-Parse.active_objs
    839.50 ± 13%     -19.6%     675.25 ±  4%  slabinfo.Acpi-Parse.num_objs
      1550 ±  3%      -9.3%       1406 ±  4%  slabinfo.cred_jar.active_objs
      1550 ±  3%      -9.3%       1406 ±  4%  slabinfo.cred_jar.num_objs
     10240 ± 11%     -30.3%       7141        slabinfo.filp.active_objs
    343.50 ±  9%     -31.4%     235.50 ±  2%  slabinfo.filp.active_slabs
     11007 ±  9%     -31.4%       7551        slabinfo.filp.num_objs
    343.50 ±  9%     -31.4%     235.50 ±  2%  slabinfo.filp.num_slabs
    176.00 ± 27%     +54.5%     272.00 ±  5%  slabinfo.kmalloc-rcl-128.active_objs
    176.00 ± 27%     +54.5%     272.00 ±  5%  slabinfo.kmalloc-rcl-128.num_objs
    913.50 ±  8%     +23.0%       1123 ±  4%  slabinfo.kmalloc-rcl-96.active_objs
    913.50 ±  8%     +23.0%       1123 ±  4%  slabinfo.kmalloc-rcl-96.num_objs
      2559 ± 16%     -38.8%       1565 ± 38%  interrupts.34:IR-PCI-MSI.2621441-edge.eth0-TxRx-0
      5158 ± 10%     -40.9%       3046 ± 12%  interrupts.CPU0.RES:Rescheduling_interrupts
      4410 ± 14%     -35.4%       2850 ± 21%  interrupts.CPU1.RES:Rescheduling_interrupts
      5504 ± 23%     -62.0%       2091 ±  3%  interrupts.CPU10.NMI:Non-maskable_interrupts
      5504 ± 23%     -62.0%       2091 ±  3%  interrupts.CPU10.PMI:Performance_monitoring_interrupts
    881.25 ± 58%    +165.9%       2343 ± 39%  interrupts.CPU11.TLB:TLB_shootdowns
      4947 ±  6%     -13.7%       4271 ±  7%  interrupts.CPU14.RES:Rescheduling_interrupts
      5151 ± 13%     -23.5%       3939 ±  7%  interrupts.CPU15.RES:Rescheduling_interrupts
      4386 ± 18%     -37.7%       2730 ± 10%  interrupts.CPU2.RES:Rescheduling_interrupts
      4661 ± 11%     -43.4%       2636 ± 19%  interrupts.CPU3.RES:Rescheduling_interrupts
      4812 ± 20%     -50.4%       2387 ±  8%  interrupts.CPU4.RES:Rescheduling_interrupts
      4870 ± 18%     -45.3%       2662 ± 22%  interrupts.CPU5.RES:Rescheduling_interrupts
      3833 ± 13%     -23.5%       2933 ± 11%  interrupts.CPU6.RES:Rescheduling_interrupts
      2559 ± 16%     -38.8%       1565 ± 38%  interrupts.CPU8.34:IR-PCI-MSI.2621441-edge.eth0-TxRx-0
    124.00 ±  3%     +17.1%     145.25 ±  7%  interrupts.CPU9.CAL:Function_call_interrupts
     70339 ±  7%     -22.9%      54227 ±  4%  interrupts.RES:Rescheduling_interrupts
    134057 ± 41%     -45.1%      73618 ±  3%  softirqs.CPU0.SCHED
    135884 ± 40%     -43.5%      76725 ± 15%  softirqs.CPU1.SCHED
    411979 ± 30%     -29.0%     292317        softirqs.CPU1.TIMER
    125329 ± 40%     -37.5%      78295 ±  5%  softirqs.CPU10.SCHED
    122051 ± 48%     -43.5%      68923 ±  6%  softirqs.CPU11.SCHED
    445933 ± 43%     -36.5%     283341 ±  2%  softirqs.CPU11.TIMER
    131655 ± 41%     -46.6%      70340 ± 10%  softirqs.CPU12.SCHED
    123508 ± 46%     -43.7%      69575 ±  3%  softirqs.CPU13.SCHED
    118137 ± 33%     -40.6%      70141 ±  7%  softirqs.CPU14.SCHED
    121362 ± 49%     -40.4%      72283 ±  5%  softirqs.CPU15.SCHED
    128887 ± 46%     -47.0%      68259 ±  7%  softirqs.CPU2.SCHED
    132599 ± 42%     -38.7%      81270 ±  6%  softirqs.CPU3.SCHED
    122011 ± 48%     -37.8%      75843 ± 10%  softirqs.CPU4.SCHED
    133060 ± 45%     -44.3%      74126 ±  3%  softirqs.CPU5.SCHED
    125294 ± 43%     -36.8%      79130 ±  4%  softirqs.CPU6.SCHED
    133132 ± 44%     -44.0%      74489 ±  5%  softirqs.CPU7.SCHED
   2008609 ± 42%     -40.9%    1186473        softirqs.SCHED
    194419 ±  6%     -10.6%     173824 ±  3%  sched_debug.cfs_rq:/.exec_clock.avg
     93.69 ± 18%     -20.5%      74.48 ± 10%  sched_debug.cfs_rq:/.load_avg.stddev
      0.65 ±  8%    +193.0%       1.91 ±  3%  sched_debug.cpu.clock.stddev
      0.65 ±  8%    +193.2%       1.91 ±  3%  sched_debug.cpu.clock_task.stddev
      0.00 ±  2%     +24.7%       0.00 ± 20%  sched_debug.cpu.next_balance.stddev
    531879 ±  4%     -57.9%     224113 ±  3%  sched_debug.cpu.nr_switches.avg
    705887 ±  4%     -53.5%     328229 ±  3%  sched_debug.cpu.nr_switches.max
    361512 ± 11%     -64.7%     127482 ± 11%  sched_debug.cpu.nr_switches.min
    105347 ± 24%     -38.8%      64436 ± 13%  sched_debug.cpu.nr_switches.stddev
    527125 ±  4%     -58.5%     218856 ±  3%  sched_debug.cpu.sched_count.avg
    700713 ±  4%     -53.8%     323889 ±  2%  sched_debug.cpu.sched_count.max
    358284 ± 12%     -65.7%     122786 ± 10%  sched_debug.cpu.sched_count.min
    105218 ± 24%     -39.0%      64228 ± 14%  sched_debug.cpu.sched_count.stddev
    262228 ±  4%     -58.8%     108039 ±  3%  sched_debug.cpu.sched_goidle.avg
    349142 ±  4%     -54.0%     160597 ±  2%  sched_debug.cpu.sched_goidle.max
    177904 ± 12%     -66.4%      59745 ± 10%  sched_debug.cpu.sched_goidle.min
     52610 ± 24%     -38.8%      32185 ± 14%  sched_debug.cpu.sched_goidle.stddev
    264288 ±  4%     -58.6%     109405 ±  3%  sched_debug.cpu.ttwu_count.avg
    347196 ±  3%     -53.4%     161753 ±  4%  sched_debug.cpu.ttwu_count.max
    189839 ± 11%     -67.9%      60917 ± 10%  sched_debug.cpu.ttwu_count.min
     48965 ± 25%     -36.7%      30988 ± 14%  sched_debug.cpu.ttwu_count.stddev
     54.70           -10.8%      48.80        perf-stat.i.MPKI
 1.512e+09 ± 21%     -59.4%   6.14e+08        perf-stat.i.branch-instructions
  11536320 ± 17%     -46.3%    6194760        perf-stat.i.branch-misses
 6.136e+08 ± 21%     -56.2%  2.687e+08        perf-stat.i.cache-misses
 6.136e+08 ± 21%     -56.2%  2.687e+08        perf-stat.i.cache-references
     12357 ± 23%     -56.4%       5383 ±  3%  perf-stat.i.context-switches
      1.58 ± 13%     -26.7%       1.16        perf-stat.i.cpi
 1.734e+10 ± 20%     -64.7%  6.122e+09        perf-stat.i.cpu-cycles
     21.44 ±  4%      +6.7%      22.87        perf-stat.i.cpu-migrations
      1154 ± 22%     -60.3%     458.09        perf-stat.i.cycles-between-cache-misses
   7118274 ± 21%     -59.5%    2880366        perf-stat.i.dTLB-load-misses
 8.658e+09 ± 21%     -59.1%  3.545e+09        perf-stat.i.dTLB-loads
      0.28            -0.0        0.26        perf-stat.i.dTLB-store-miss-rate%
   4937319 ± 20%     -63.8%    1787428        perf-stat.i.dTLB-store-misses
 1.041e+09 ± 20%     -60.3%  4.138e+08        perf-stat.i.dTLB-stores
     49.61 ±  2%      -5.1       44.49        perf-stat.i.iTLB-load-miss-rate%
   3035551 ± 20%     -63.2%    1116287        perf-stat.i.iTLB-load-misses
   2880611 ± 20%     -57.0%    1239559        perf-stat.i.iTLB-loads
 1.379e+10 ± 20%     -59.1%  5.643e+09        perf-stat.i.instructions
    140716 ± 23%     -59.8%      56595 ± 13%  perf-stat.i.instructions-per-iTLB-miss
      0.79 ±  2%     +17.2%       0.92        perf-stat.i.ipc
   1006871 ± 21%     -63.6%     366463        perf-stat.i.minor-faults
   1006871 ± 21%     -63.6%     366463        perf-stat.i.page-faults
     44.44            +7.1%      47.60        perf-stat.overall.MPKI
      0.77 ±  5%      +0.2        1.01        perf-stat.overall.branch-miss-rate%
      1.26           -13.9%       1.08        perf-stat.overall.cpi
     28.36           -19.6%      22.79        perf-stat.overall.cycles-between-cache-misses
      0.47            -0.0        0.43        perf-stat.overall.dTLB-store-miss-rate%
     51.35            -4.0       47.38        perf-stat.overall.iTLB-load-miss-rate%
      4531           +11.5%       5054        perf-stat.overall.instructions-per-iTLB-miss
      0.79           +16.1%       0.92        perf-stat.overall.ipc
  1.51e+09 ± 21%     -59.4%  6.134e+08        perf-stat.ps.branch-instructions
  11535806 ± 17%     -46.4%    6188412        perf-stat.ps.branch-misses
 6.128e+08 ± 21%     -56.2%  2.683e+08        perf-stat.ps.cache-misses
 6.128e+08 ± 21%     -56.2%  2.683e+08        perf-stat.ps.cache-references
     12339 ± 23%     -56.2%       5405 ±  3%  perf-stat.ps.context-switches
 1.732e+10 ± 20%     -64.7%  6.115e+09        perf-stat.ps.cpu-cycles
     21.42 ±  4%      +6.7%      22.86        perf-stat.ps.cpu-migrations
   7109912 ± 21%     -59.5%    2876638        perf-stat.ps.dTLB-load-misses
 8.646e+09 ± 21%     -59.1%   3.54e+09        perf-stat.ps.dTLB-loads
   4931362 ± 20%     -63.8%    1785501        perf-stat.ps.dTLB-store-misses
  1.04e+09 ± 20%     -60.3%  4.134e+08        perf-stat.ps.dTLB-stores
   3031899 ± 20%     -63.2%    1115046        perf-stat.ps.iTLB-load-misses
   2876515 ± 20%     -56.9%    1238672        perf-stat.ps.iTLB-loads
 1.377e+10 ± 20%     -59.1%  5.636e+09        perf-stat.ps.instructions
   1005643 ± 21%     -63.6%     366083        perf-stat.ps.minor-faults
   1005643 ± 21%     -63.6%     366083        perf-stat.ps.page-faults
 1.358e+13 ± 10%     -65.6%  4.675e+12        perf-stat.total.instructions
      4.89 ± 29%      -2.7        2.15 ± 66%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_kernel.secondary_startup_64
      4.89 ± 29%      -2.7        2.15 ± 66%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_kernel.secondary_startup_64
      4.89 ± 29%      -2.7        2.15 ± 66%  perf-profile.calltrace.cycles-pp.start_kernel.secondary_startup_64
      4.81 ± 32%      -2.7        2.15 ± 66%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_kernel.secondary_startup_64
      4.80 ± 33%      -2.7        2.15 ± 66%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_kernel
      0.00            +0.6        0.60 ± 10%  perf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.4        1.39 ±  9%  perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.munmap
      0.00            +1.4        1.39 ±  9%  perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.munmap
      0.00            +1.4        1.42 ±  9%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.munmap
      0.00            +1.4        1.42 ±  9%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.munmap
      0.00            +1.4        1.45 ±  9%  perf-profile.calltrace.cycles-pp.munmap
      4.89 ± 29%      -2.7        2.15 ± 66%  perf-profile.children.cycles-pp.start_kernel
      0.01 ±173%      +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.sys_imageblit
      0.01 ±173%      +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.drm_fb_helper_sys_imageblit
      0.01 ±173%      +0.1        0.08 ± 38%  perf-profile.children.cycles-pp.clear_page_erms
      0.01 ±173%      +0.1        0.08 ± 13%  perf-profile.children.cycles-pp.fbcon_redraw
      0.01 ±173%      +0.1        0.08 ± 13%  perf-profile.children.cycles-pp.con_scroll
      0.01 ±173%      +0.1        0.08 ± 13%  perf-profile.children.cycles-pp.fbcon_scroll
      0.01 ±173%      +0.1        0.08 ± 13%  perf-profile.children.cycles-pp.lf
      0.02 ±173%      +0.1        0.09 ± 20%  perf-profile.children.cycles-pp.unlink_file_vma
      0.04 ±100%      +0.1        0.11 ± 15%  perf-profile.children.cycles-pp.native_flush_tlb
      0.00            +0.1        0.07 ± 17%  perf-profile.children.cycles-pp.vma_interval_tree_insert
      0.01 ±173%      +0.1        0.09 ±  9%  perf-profile.children.cycles-pp.vt_console_print
      0.01 ±173%      +0.1        0.08 ± 10%  perf-profile.children.cycles-pp.fbcon_putcs
      0.01 ±173%      +0.1        0.08 ± 10%  perf-profile.children.cycles-pp.bit_putcs
      0.00            +0.1        0.07 ± 11%  perf-profile.children.cycles-pp.security_mmap_file
      0.00            +0.1        0.07 ± 19%  perf-profile.children.cycles-pp.get_unmapped_area
      0.01 ±173%      +0.1        0.09 ± 35%  perf-profile.children.cycles-pp.prep_new_page
      0.02 ±173%      +0.1        0.10 ± 21%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.1        0.08 ± 34%  perf-profile.children.cycles-pp.enqueue_entity
      0.07 ± 31%      +0.1        0.15 ± 13%  perf-profile.children.cycles-pp.task_tick_fair
      0.00            +0.1        0.09 ± 37%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.00            +0.1        0.09 ± 37%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.00            +0.1        0.09 ± 24%  perf-profile.children.cycles-pp.free_unref_page_list
      0.00            +0.1        0.09 ± 40%  perf-profile.children.cycles-pp.activate_task
      0.03 ±173%      +0.1        0.12 ± 17%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.05 ± 70%      +0.1        0.14 ± 21%  perf-profile.children.cycles-pp.free_pgtables
      0.06 ± 59%      +0.1        0.16 ± 22%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.02 ±173%      +0.1        0.12 ± 23%  perf-profile.children.cycles-pp.up_write
      0.00            +0.1        0.10 ± 24%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.05 ± 62%      +0.1        0.16 ± 14%  perf-profile.children.cycles-pp.perf_event_mmap
      0.16 ± 59%      +0.1        0.28 ± 10%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.07 ± 58%      +0.1        0.20 ± 26%  perf-profile.children.cycles-pp.pte_alloc_one
      0.08 ± 58%      +0.1        0.21 ± 22%  perf-profile.children.cycles-pp.__alloc_pages_nodemask
      0.01 ±173%      +0.1        0.15 ± 34%  perf-profile.children.cycles-pp.__wake_up_common
      0.02 ±173%      +0.1        0.15 ±  9%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.01 ±173%      +0.1        0.15 ± 16%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.00            +0.1        0.14 ± 35%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.00            +0.1        0.15 ± 32%  perf-profile.children.cycles-pp.try_to_wake_up
      0.07 ± 62%      +0.2        0.23 ± 13%  perf-profile.children.cycles-pp.vma_link
      0.01 ±173%      +0.2        0.20 ± 28%  perf-profile.children.cycles-pp.wake_up_page_bit
      0.00            +0.2        0.19 ± 11%  perf-profile.children.cycles-pp.mmap64
      0.13 ± 59%      +0.3        0.40 ± 26%  perf-profile.children.cycles-pp.tlb_finish_mmu
      0.14 ± 62%      +0.3        0.48 ± 13%  perf-profile.children.cycles-pp.mmap_region
      0.17 ± 60%      +0.4        0.58 ± 11%  perf-profile.children.cycles-pp.do_mmap
      0.19 ± 61%      +0.5        0.67 ± 10%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.20 ± 61%      +0.5        0.73 ±  7%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
      0.81 ± 60%      +0.6        1.40 ± 14%  perf-profile.children.cycles-pp.tlb_flush_mmu
      0.00            +1.5        1.45 ±  9%  perf-profile.children.cycles-pp.munmap
      4.49 ± 52%      +3.1        7.63 ± 20%  perf-profile.children.cycles-pp.do_syscall_64
      4.49 ± 52%      +3.2        7.64 ± 20%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.01 ±173%      +0.1        0.07 ± 10%  perf-profile.self.cycles-pp.sys_imageblit
      0.01 ±173%      +0.1        0.08 ± 38%  perf-profile.self.cycles-pp.clear_page_erms
      0.04 ±100%      +0.1        0.11 ± 15%  perf-profile.self.cycles-pp.native_flush_tlb
      0.00            +0.1        0.07 ± 17%  perf-profile.self.cycles-pp.vma_interval_tree_insert
      0.07 ± 64%      +0.1        0.16 ± 24%  perf-profile.self.cycles-pp.find_vma
      0.02 ±173%      +0.1        0.11 ± 21%  perf-profile.self.cycles-pp.up_write
      0.00            +0.1        0.10 ± 24%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.15 ± 59%      +0.1        0.25 ± 11%  perf-profile.self.cycles-pp.free_pages_and_swap_cache
      0.02 ±173%      +0.1        0.15 ±  9%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.01 ±173%      +0.1        0.15 ± 16%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.10 ±  7%      +0.2        0.34 ± 12%  perf-profile.self.cycles-pp.do_syscall_64



***************************************************************************************************
lkp-bdw-ep6: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz with 128G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/thread/16/debian-x86_64-20191114.cgz/lkp-bdw-ep6/signal1/will-it-scale/0xb000038

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4           25%           1:4     dmesg.RIP:__bitmap_and
           :4           25%           1:4     dmesg.RIP:__do_softirq
           :4           25%           1:4     dmesg.RIP:_raw_spin_unlock_irqrestore
           :4           25%           1:4     dmesg.RIP:acpi_ns_check_argument_count
           :4          100%           4:4     dmesg.RIP:cpuidle_enter_state
           :4           25%           1:4     dmesg.RIP:idle_cpu
         %stddev     %change         %stddev
             \          |                \  
     47711 ±  2%     -58.4%      19844        will-it-scale.per_thread_ops
    763394 ±  2%     -58.4%     317519        will-it-scale.workload
     34375           -18.3%      28086 ±  3%  meminfo.Shmem
      1396            +5.2%       1468        vmstat.system.cs
      3825 ±  6%     +16.0%       4437 ±  7%  slabinfo.kmalloc-rcl-64.active_objs
      3825 ±  6%     +16.0%       4437 ±  7%  slabinfo.kmalloc-rcl-64.num_objs
     45.64 ±  6%     +13.0%      51.57 ±  6%  boot-time.boot
     29.57 ± 10%     +13.1%      33.45 ±  9%  boot-time.dhcp
      3550 ±  6%     +13.1%       4016 ±  7%  boot-time.idle
      0.86 ± 11%     +13.6%       0.98 ± 10%  boot-time.smp_boot
 1.623e+08 ± 75%     -89.9%   16446802 ±160%  cpuidle.C1.time
   3143747 ± 46%     -84.7%     480305 ±147%  cpuidle.C1.usage
    491507 ± 77%     -90.4%      47421 ± 16%  cpuidle.POLL.time
     74327 ± 37%     -86.0%      10418 ± 16%  cpuidle.POLL.usage
      1.95 ±  7%     +21.8%       2.37 ±  9%  sched_debug.cfs_rq:/.nr_spread_over.max
      0.34 ± 17%     +28.7%       0.44 ±  6%  sched_debug.cfs_rq:/.nr_spread_over.stddev
      2.06 ± 13%     +95.8%       4.03 ±  2%  sched_debug.cpu.clock.stddev
      2.06 ± 13%     +95.8%       4.03 ±  2%  sched_debug.cpu.clock_task.stddev
     40521 ± 29%     -55.8%      17928 ± 72%  numa-vmstat.node0.nr_anon_pages
    276.75 ± 62%    +718.2%       2264 ± 18%  numa-vmstat.node0.nr_inactive_anon
    593.25 ± 39%    +330.1%       2551 ± 11%  numa-vmstat.node0.nr_shmem
    276.75 ± 62%    +718.2%       2264 ± 18%  numa-vmstat.node0.nr_zone_inactive_anon
      4190 ±  4%     -48.7%       2149 ± 18%  numa-vmstat.node1.nr_inactive_anon
      8014 ±  2%     -44.2%       4471 ±  4%  numa-vmstat.node1.nr_shmem
      4190 ±  4%     -48.7%       2149 ± 18%  numa-vmstat.node1.nr_zone_inactive_anon
     71940            -3.2%      69667        proc-vmstat.nr_active_anon
     68165            -1.1%      67445        proc-vmstat.nr_anon_pages
      4467            -1.2%       4414        proc-vmstat.nr_inactive_anon
      8594           -18.3%       7017 ±  3%  proc-vmstat.nr_shmem
     71940            -3.2%      69667        proc-vmstat.nr_zone_active_anon
      4467            -1.2%       4414        proc-vmstat.nr_zone_inactive_anon
      5238 ±  3%     -44.2%       2925 ± 11%  proc-vmstat.pgactivate
    162117 ± 29%     -55.8%      71716 ± 72%  numa-meminfo.node0.AnonPages
      1276 ± 47%    +619.7%       9183 ± 17%  numa-meminfo.node0.Inactive
      1108 ± 62%    +717.5%       9059 ± 18%  numa-meminfo.node0.Inactive(anon)
      2374 ± 39%    +329.9%      10207 ± 11%  numa-meminfo.node0.Shmem
     59639 ± 55%    +133.9%     139472 ± 25%  numa-meminfo.node1.AnonHugePages
     16936 ±  3%     -47.9%       8820 ± 17%  numa-meminfo.node1.Inactive
     16763 ±  4%     -48.7%       8598 ± 18%  numa-meminfo.node1.Inactive(anon)
     32004 ±  2%     -44.2%      17860 ±  4%  numa-meminfo.node1.Shmem
     22493 ± 53%     +85.1%      41635 ±  8%  softirqs.CPU1.SCHED
     42680           -19.6%      34297 ± 19%  softirqs.CPU16.SCHED
    159963 ±  2%     -26.1%     118198 ± 22%  softirqs.CPU16.TIMER
     42567            -9.1%      38707 ±  6%  softirqs.CPU17.SCHED
    161430 ±  2%     -27.1%     117758 ± 22%  softirqs.CPU17.TIMER
    160939 ±  2%     -26.6%     118078 ± 23%  softirqs.CPU18.TIMER
     42706            -8.9%      38901 ±  7%  softirqs.CPU19.SCHED
    160507 ±  2%     -26.4%     118152 ± 22%  softirqs.CPU19.TIMER
     43221 ±  3%     -21.6%      33872 ± 17%  softirqs.CPU20.SCHED
    160921 ±  2%     -26.8%     117724 ± 23%  softirqs.CPU20.TIMER
     42774           -11.2%      37999 ±  5%  softirqs.CPU21.SCHED
    160484 ±  2%     -26.5%     117982 ± 22%  softirqs.CPU21.TIMER
    141094 ± 16%     -24.0%     107201 ±  9%  softirqs.CPU27.TIMER
     42202 ±  6%     -37.5%      26377 ± 45%  softirqs.CPU3.SCHED
    138383 ± 18%     -23.8%     105459 ± 10%  softirqs.CPU30.TIMER
    137520 ± 19%     -24.8%     103399 ± 10%  softirqs.CPU31.TIMER
    145639 ± 13%     -21.4%     114410 ±  8%  softirqs.CPU38.TIMER
     25505 ± 49%     -79.9%       5121 ±  2%  softirqs.CPU45.SCHED
     84530 ±  4%     +14.3%      96657 ±  7%  softirqs.CPU47.RCU
     12628 ± 52%     -40.1%       7564 ± 55%  softirqs.CPU57.SCHED
    159912 ±  3%     -26.7%     117282 ± 23%  softirqs.CPU60.TIMER
    159928 ±  2%     -26.6%     117311 ± 23%  softirqs.CPU62.TIMER
     42825            -9.8%      38633 ±  6%  softirqs.CPU63.SCHED
    160854 ±  3%     -27.0%     117487 ± 23%  softirqs.CPU63.TIMER
    159851 ±  2%     -26.6%     117322 ± 23%  softirqs.CPU64.TIMER
    109692 ±  5%     -18.3%      89589 ± 10%  softirqs.CPU65.RCU
    137028 ± 19%     -25.6%     101960 ± 11%  softirqs.CPU73.TIMER
    137335 ± 19%     -23.6%     104924 ±  9%  softirqs.CPU74.TIMER
    136142 ± 20%     -23.3%     104416 ± 12%  softirqs.CPU75.TIMER
 3.037e+09           -53.8%  1.403e+09        perf-stat.i.branch-instructions
      0.88 ±  3%      +0.4        1.24 ± 17%  perf-stat.i.branch-miss-rate%
  26824742 ±  4%     -33.2%   17913990 ± 16%  perf-stat.i.branch-misses
      0.11 ± 10%      +0.3        0.41 ± 41%  perf-stat.i.cache-miss-rate%
    167168 ±  8%     +77.5%     296716 ± 23%  perf-stat.i.cache-misses
 1.546e+08 ±  4%     -48.7%   79313595 ± 18%  perf-stat.i.cache-references
      1366            +5.0%       1435        perf-stat.i.context-switches
 4.927e+10           -54.7%  2.231e+10 ±  4%  perf-stat.i.cpu-cycles
    357788 ±  9%     -68.2%     113911 ± 40%  perf-stat.i.cycles-between-cache-misses
   7000456           -52.6%    3316794 ± 20%  perf-stat.i.dTLB-load-misses
 3.551e+09           -53.7%  1.644e+09        perf-stat.i.dTLB-loads
      0.39            -0.0        0.34        perf-stat.i.dTLB-store-miss-rate%
   5077831           -56.1%    2227001 ± 10%  perf-stat.i.dTLB-store-misses
 1.295e+09 ±  2%     -49.8%  6.496e+08 ± 12%  perf-stat.i.dTLB-stores
     90.35           -16.1       74.21 ±  9%  perf-stat.i.iTLB-load-miss-rate%
   9008271 ±  5%     -57.6%    3823025 ±  5%  perf-stat.i.iTLB-load-misses
 1.309e+10           -53.4%  6.105e+09        perf-stat.i.instructions
      1476 ±  4%     +10.1%       1625 ±  6%  perf-stat.i.instructions-per-iTLB-miss
      4304 ±  8%     +49.6%       6440 ± 26%  perf-stat.i.node-loads
      0.88 ±  3%      +0.4        1.28 ± 17%  perf-stat.overall.branch-miss-rate%
      0.11 ± 11%      +0.3        0.40 ± 39%  perf-stat.overall.cache-miss-rate%
    296735 ±  7%     -72.9%      80540 ± 28%  perf-stat.overall.cycles-between-cache-misses
      0.39            -0.0        0.34        perf-stat.overall.dTLB-store-miss-rate%
     90.45           -16.1       74.35 ±  9%  perf-stat.overall.iTLB-load-miss-rate%
      1457 ±  4%      +9.9%       1602 ±  6%  perf-stat.overall.instructions-per-iTLB-miss
   5168695           +12.0%    5791187 ±  3%  perf-stat.overall.path-length
 3.027e+09           -53.8%  1.398e+09        perf-stat.ps.branch-instructions
  26726787 ±  4%     -33.2%   17858622 ± 16%  perf-stat.ps.branch-misses
    166554 ±  8%     +77.6%     295791 ± 23%  perf-stat.ps.cache-misses
 1.541e+08 ±  4%     -48.7%   79046152 ± 18%  perf-stat.ps.cache-references
      1362            +5.1%       1431        perf-stat.ps.context-switches
  4.91e+10           -54.7%  2.224e+10 ±  4%  perf-stat.ps.cpu-cycles
   6976948           -52.6%    3305572 ± 20%  perf-stat.ps.dTLB-load-misses
 3.539e+09           -53.7%  1.639e+09        perf-stat.ps.dTLB-loads
   5060797           -56.1%    2219476 ± 10%  perf-stat.ps.dTLB-store-misses
 1.291e+09 ±  2%     -49.8%  6.474e+08 ± 12%  perf-stat.ps.dTLB-stores
   8978095 ±  5%     -57.6%    3810130 ±  5%  perf-stat.ps.iTLB-load-misses
 1.305e+10           -53.4%  6.085e+09        perf-stat.ps.instructions
      4287 ±  8%     +49.9%       6425 ± 26%  perf-stat.ps.node-loads
 3.944e+12           -53.4%  1.838e+12        perf-stat.total.instructions
      4385 ± 47%     -42.9%       2502 ± 24%  interrupts.CPU0.NMI:Non-maskable_interrupts
      4385 ± 47%     -42.9%       2502 ± 24%  interrupts.CPU0.PMI:Performance_monitoring_interrupts
    705.25 ± 28%     -45.0%     388.00        interrupts.CPU1.CAL:Function_call_interrupts
    336.00 ± 78%     -94.3%      19.25 ± 28%  interrupts.CPU1.RES:Rescheduling_interrupts
    321.75 ± 61%     -99.8%       0.50 ±173%  interrupts.CPU1.TLB:TLB_shootdowns
    207.75 ± 33%     -33.6%     138.00 ± 32%  interrupts.CPU24.NMI:Non-maskable_interrupts
    207.75 ± 33%     -33.6%     138.00 ± 32%  interrupts.CPU24.PMI:Performance_monitoring_interrupts
    383232 ± 33%     +39.0%     532699 ± 23%  interrupts.CPU29.LOC:Local_timer_interrupts
    382392 ± 33%     +39.2%     532244 ± 23%  interrupts.CPU37.LOC:Local_timer_interrupts
    265.25 ±  9%     -35.7%     170.50 ± 35%  interrupts.CPU40.NMI:Non-maskable_interrupts
    265.25 ±  9%     -35.7%     170.50 ± 35%  interrupts.CPU40.PMI:Performance_monitoring_interrupts
    265.00 ±  9%     -40.0%     159.00 ± 41%  interrupts.CPU41.NMI:Non-maskable_interrupts
    265.00 ±  9%     -40.0%     159.00 ± 41%  interrupts.CPU41.PMI:Performance_monitoring_interrupts
    688.75 ± 25%     +43.6%     989.25 ±  3%  interrupts.CPU45.CAL:Function_call_interrupts
    329.00 ± 58%     +86.0%     612.00 ±  3%  interrupts.CPU45.TLB:TLB_shootdowns
      5913 ± 33%     -50.4%       2934 ± 24%  interrupts.CPU46.NMI:Non-maskable_interrupts
      5913 ± 33%     -50.4%       2934 ± 24%  interrupts.CPU46.PMI:Performance_monitoring_interrupts
      5913 ± 33%     -52.5%       2810 ± 24%  interrupts.CPU47.NMI:Non-maskable_interrupts
      5913 ± 33%     -52.5%       2810 ± 24%  interrupts.CPU47.PMI:Performance_monitoring_interrupts
    650.75 ±  2%     -26.4%     479.25 ± 28%  interrupts.CPU47.TLB:TLB_shootdowns
      5914 ± 33%     -50.4%       2935 ± 24%  interrupts.CPU48.NMI:Non-maskable_interrupts
      5914 ± 33%     -50.4%       2935 ± 24%  interrupts.CPU48.PMI:Performance_monitoring_interrupts
      6900 ± 24%     -63.5%       2515 ± 33%  interrupts.CPU49.NMI:Non-maskable_interrupts
      6900 ± 24%     -63.5%       2515 ± 33%  interrupts.CPU49.PMI:Performance_monitoring_interrupts
      6901 ± 24%     -63.6%       2515 ± 33%  interrupts.CPU50.NMI:Non-maskable_interrupts
      6901 ± 24%     -63.6%       2515 ± 33%  interrupts.CPU50.PMI:Performance_monitoring_interrupts
      7889           -69.6%       2396 ± 30%  interrupts.CPU52.NMI:Non-maskable_interrupts
      7889           -69.6%       2396 ± 30%  interrupts.CPU52.PMI:Performance_monitoring_interrupts
      7887           -73.4%       2095 ± 34%  interrupts.CPU53.NMI:Non-maskable_interrupts
      7887           -73.4%       2095 ± 34%  interrupts.CPU53.PMI:Performance_monitoring_interrupts
      7888           -68.1%       2515 ± 33%  interrupts.CPU54.NMI:Non-maskable_interrupts
      7888           -68.1%       2515 ± 33%  interrupts.CPU54.PMI:Performance_monitoring_interrupts
      7888           -62.8%       2937 ± 24%  interrupts.CPU55.NMI:Non-maskable_interrupts
      7888           -62.8%       2937 ± 24%  interrupts.CPU55.PMI:Performance_monitoring_interrupts
      7887           -62.6%       2953 ± 24%  interrupts.CPU56.NMI:Non-maskable_interrupts
      7887           -62.6%       2953 ± 24%  interrupts.CPU56.PMI:Performance_monitoring_interrupts
      6899 ± 24%     -51.4%       3355        interrupts.CPU59.NMI:Non-maskable_interrupts
      6899 ± 24%     -51.4%       3355        interrupts.CPU59.PMI:Performance_monitoring_interrupts
    177.75 ±  7%     -40.2%     106.25 ± 37%  interrupts.CPU62.NMI:Non-maskable_interrupts
    177.75 ±  7%     -40.2%     106.25 ± 37%  interrupts.CPU62.PMI:Performance_monitoring_interrupts
    175.50 ±  7%     -40.9%     103.75 ± 33%  interrupts.CPU63.NMI:Non-maskable_interrupts
    175.50 ±  7%     -40.9%     103.75 ± 33%  interrupts.CPU63.PMI:Performance_monitoring_interrupts
    182.25 ±  9%     -32.1%     123.75 ± 45%  interrupts.CPU64.NMI:Non-maskable_interrupts
    182.25 ±  9%     -32.1%     123.75 ± 45%  interrupts.CPU64.PMI:Performance_monitoring_interrupts
    262.00 ± 10%     -49.4%     132.50 ± 25%  interrupts.CPU66.NMI:Non-maskable_interrupts
    262.00 ± 10%     -49.4%     132.50 ± 25%  interrupts.CPU66.PMI:Performance_monitoring_interrupts
    289.00 ± 13%     -44.6%     160.00 ± 13%  interrupts.CPU67.NMI:Non-maskable_interrupts
    289.00 ± 13%     -44.6%     160.00 ± 13%  interrupts.CPU67.PMI:Performance_monitoring_interrupts
    261.50 ±  6%     -48.4%     135.00 ± 30%  interrupts.CPU68.NMI:Non-maskable_interrupts
    261.50 ±  6%     -48.4%     135.00 ± 30%  interrupts.CPU68.PMI:Performance_monitoring_interrupts
    253.00 ±  6%     -45.1%     139.00 ± 24%  interrupts.CPU69.NMI:Non-maskable_interrupts
    253.00 ±  6%     -45.1%     139.00 ± 24%  interrupts.CPU69.PMI:Performance_monitoring_interrupts
      5359 ± 46%     -60.0%       2142 ± 33%  interrupts.CPU7.NMI:Non-maskable_interrupts
      5359 ± 46%     -60.0%       2142 ± 33%  interrupts.CPU7.PMI:Performance_monitoring_interrupts
    260.75 ±  7%     -50.1%     130.00 ± 28%  interrupts.CPU70.NMI:Non-maskable_interrupts
    260.75 ±  7%     -50.1%     130.00 ± 28%  interrupts.CPU70.PMI:Performance_monitoring_interrupts
    259.50 ±  7%     -50.7%     128.00 ± 31%  interrupts.CPU71.NMI:Non-maskable_interrupts
    259.50 ±  7%     -50.7%     128.00 ± 31%  interrupts.CPU71.PMI:Performance_monitoring_interrupts
    383322 ± 33%     +39.0%     532707 ± 23%  interrupts.CPU73.LOC:Local_timer_interrupts
    266.25 ±  7%     -49.7%     134.00 ± 54%  interrupts.CPU73.NMI:Non-maskable_interrupts
    266.25 ±  7%     -49.7%     134.00 ± 54%  interrupts.CPU73.PMI:Performance_monitoring_interrupts
      6.25 ±154%    +1e+06%      64704 ±121%  interrupts.CPU78.RES:Rescheduling_interrupts
    261.50 ±  8%     -38.1%     161.75 ± 40%  interrupts.CPU79.NMI:Non-maskable_interrupts
    261.50 ±  8%     -38.1%     161.75 ± 40%  interrupts.CPU79.PMI:Performance_monitoring_interrupts
    263.25 ±  8%     -59.5%     106.50 ± 16%  interrupts.CPU80.NMI:Non-maskable_interrupts
    263.25 ±  8%     -59.5%     106.50 ± 16%  interrupts.CPU80.PMI:Performance_monitoring_interrupts
    382307 ± 33%     +39.3%     532463 ± 23%  interrupts.CPU81.LOC:Local_timer_interrupts
    274.25 ±  9%     -40.8%     162.25 ± 42%  interrupts.CPU81.NMI:Non-maskable_interrupts
    274.25 ±  9%     -40.8%     162.25 ± 42%  interrupts.CPU81.PMI:Performance_monitoring_interrupts
    267.00 ±  9%     -39.2%     162.25 ± 41%  interrupts.CPU82.NMI:Non-maskable_interrupts
    267.00 ±  9%     -39.2%     162.25 ± 41%  interrupts.CPU82.PMI:Performance_monitoring_interrupts
    264.50 ±  7%     -40.4%     157.75 ± 40%  interrupts.CPU85.NMI:Non-maskable_interrupts
    264.50 ±  7%     -40.4%     157.75 ± 40%  interrupts.CPU85.PMI:Performance_monitoring_interrupts
    167706 ±  4%     -45.3%      91742 ± 12%  interrupts.NMI:Non-maskable_interrupts
    167706 ±  4%     -45.3%      91742 ± 12%  interrupts.PMI:Performance_monitoring_interrupts
    223207 ±  8%     -25.5%     166211 ± 34%  interrupts.RES:Rescheduling_interrupts
     46.58 ±  6%     -13.7       32.86 ±  6%  perf-profile.calltrace.cycles-pp.raise
     43.73 ±  6%     -12.8       30.95 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.raise
     43.58 ±  6%     -12.7       30.84 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
     18.90 ±  6%      -5.5       13.41 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
     18.53 ±  6%      -5.4       13.17 ±  6%  perf-profile.calltrace.cycles-pp.sigprocmask.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
     18.49 ±  6%      -5.4       13.13 ±  6%  perf-profile.calltrace.cycles-pp.__set_current_blocked.sigprocmask.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hwframe
     17.74 ±  6%      -5.2       12.56 ±  7%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.__set_current_blocked.sigprocmask.__x64_sys_rt_sigprocmask.do_syscall_64
     17.27 ±  6%      -5.0       12.23 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_current_blocked.sigprocmask.__x64_sys_rt_sigprocmask
     10.11 ±  6%      -3.0        7.14 ±  7%  perf-profile.calltrace.cycles-pp.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
     10.10 ±  6%      -3.0        7.13 ±  7%  perf-profile.calltrace.cycles-pp.do_signal.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
     10.29 ±  6%      -2.9        7.39 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     10.29 ±  6%      -2.9        7.38 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.45 ±  5%      -2.8        6.62 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__restore_rt
      9.47 ±  5%      -2.8        6.64 ±  6%  perf-profile.calltrace.cycles-pp.__restore_rt
      9.95 ±  6%      -2.8        7.12 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
      9.43 ±  5%      -2.8        6.61 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__restore_rt
      9.42 ±  5%      -2.8        6.60 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.__restore_rt
      9.91 ±  6%      -2.8        7.10 ±  6%  perf-profile.calltrace.cycles-pp.do_tkill.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
      9.79 ±  6%      -2.8        7.02 ±  6%  perf-profile.calltrace.cycles-pp.do_send_specific.do_tkill.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.39 ±  6%      -2.8        6.63 ±  7%  perf-profile.calltrace.cycles-pp.get_signal.do_signal.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.18 ±  5%      -2.8        6.42 ±  6%  perf-profile.calltrace.cycles-pp.__set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.__restore_rt
      9.49 ±  6%      -2.7        6.82 ±  6%  perf-profile.calltrace.cycles-pp.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.48 ±  6%      -2.7        6.81 ±  6%  perf-profile.calltrace.cycles-pp.do_signal.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.81 ±  5%      -2.7        6.14 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.__set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.39 ±  6%      -2.7        6.73 ±  6%  perf-profile.calltrace.cycles-pp.do_send_sig_info.do_send_specific.do_tkill.__x64_sys_tgkill.do_syscall_64
      8.90 ±  6%      -2.6        6.26 ±  7%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.get_signal.do_signal.exit_to_usermode_loop.do_syscall_64
      8.74 ±  6%      -2.6        6.13 ±  8%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.get_signal.do_signal.exit_to_usermode_loop
      9.26 ±  6%      -2.6        6.66 ±  6%  perf-profile.calltrace.cycles-pp.signal_setup_done.do_signal.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.24 ±  6%      -2.6        6.64 ±  6%  perf-profile.calltrace.cycles-pp.__set_current_blocked.signal_setup_done.do_signal.exit_to_usermode_loop.do_syscall_64
      8.57 ±  5%      -2.6        5.97 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64
      8.89 ±  6%      -2.6        6.34 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.__set_current_blocked.signal_setup_done.do_signal.exit_to_usermode_loop
      8.84 ±  6%      -2.5        6.30 ±  6%  perf-profile.calltrace.cycles-pp.__lock_task_sighand.do_send_sig_info.do_send_specific.do_tkill.__x64_sys_tgkill
      8.84 ±  6%      -2.5        6.29 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__lock_task_sighand.do_send_sig_info.do_send_specific.do_tkill
      8.66 ±  6%      -2.5        6.18 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_current_blocked.signal_setup_done.do_signal
      8.59 ±  6%      -2.5        6.13 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__lock_task_sighand.do_send_sig_info.do_send_specific
      1.50 ±  6%      -0.5        1.00 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.raise
      1.24 ±  7%      -0.4        0.82 ±  7%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.raise
      0.83 ±  6%      +0.4        1.28 ± 11%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.17 ±173%      +0.6        0.75 ± 13%  perf-profile.calltrace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
      0.00            +0.7        0.72 ± 24%  perf-profile.calltrace.cycles-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      1.45 ±  8%      +0.9        2.32 ±  3%  perf-profile.calltrace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle
      1.56 ±  9%      +1.0        2.52 ±  4%  perf-profile.calltrace.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
     30.69 ± 10%     +17.4       48.13 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary
     30.79 ± 10%     +17.5       48.31 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     31.44 ± 10%     +17.9       49.32 ±  7%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     31.45 ± 10%     +17.9       49.33 ±  7%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
     31.45 ± 10%     +17.9       49.33 ±  7%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64
     29.94 ± 13%     +18.3       48.27 ±  6%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
     32.33 ± 13%     +19.8       52.10 ±  6%  perf-profile.calltrace.cycles-pp.secondary_startup_64
     63.53 ±  6%     -18.5       45.04 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     63.37 ±  6%     -18.4       44.92 ±  6%  perf-profile.children.cycles-pp.do_syscall_64
     51.85 ±  6%     -15.1       36.77 ±  6%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     46.79 ±  6%     -13.8       33.00 ±  6%  perf-profile.children.cycles-pp.raise
     44.37 ±  6%     -13.0       31.34 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock_irq
     36.94 ±  6%     -10.7       26.23 ±  6%  perf-profile.children.cycles-pp.__set_current_blocked
     19.60 ±  6%      -5.6       13.96 ±  6%  perf-profile.children.cycles-pp.exit_to_usermode_loop
     19.59 ±  6%      -5.6       13.96 ±  6%  perf-profile.children.cycles-pp.do_signal
     18.90 ±  6%      -5.5       13.41 ±  6%  perf-profile.children.cycles-pp.__x64_sys_rt_sigprocmask
     18.53 ±  6%      -5.4       13.17 ±  6%  perf-profile.children.cycles-pp.sigprocmask
      9.99 ±  5%      -3.0        7.01 ±  6%  perf-profile.children.cycles-pp.__x64_sys_rt_sigreturn
      9.52 ±  5%      -2.8        6.67 ±  6%  perf-profile.children.cycles-pp.__restore_rt
      9.95 ±  6%      -2.8        7.12 ±  6%  perf-profile.children.cycles-pp.__x64_sys_tgkill
      9.92 ±  6%      -2.8        7.10 ±  6%  perf-profile.children.cycles-pp.do_tkill
      9.79 ±  6%      -2.8        7.02 ±  6%  perf-profile.children.cycles-pp.do_send_specific
      9.39 ±  6%      -2.8        6.64 ±  7%  perf-profile.children.cycles-pp.get_signal
      9.39 ±  6%      -2.7        6.73 ±  6%  perf-profile.children.cycles-pp.do_send_sig_info
      9.26 ±  6%      -2.6        6.66 ±  6%  perf-profile.children.cycles-pp.signal_setup_done
      8.84 ±  6%      -2.5        6.30 ±  6%  perf-profile.children.cycles-pp.__lock_task_sighand
      8.91 ±  6%      -2.4        6.53 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.82 ±  6%      -0.6        1.20 ±  5%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      1.43 ±  6%      -0.5        0.95 ±  7%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      1.25 ±  7%      -0.4        0.86 ±  3%  perf-profile.children.cycles-pp.__set_task_blocked
      1.25 ±  6%      -0.4        0.87 ±  4%  perf-profile.children.cycles-pp.recalc_sigpending
      0.46 ±  5%      -0.1        0.32 ±  6%  perf-profile.children.cycles-pp.copy_fpstate_to_sigframe
      0.42 ±  6%      -0.1        0.31 ±  3%  perf-profile.children.cycles-pp.__fpu__restore_sig
      0.44 ±  8%      -0.1        0.33 ±  7%  perf-profile.children.cycles-pp.__send_signal
      0.38 ±  5%      -0.1        0.28 ±  9%  perf-profile.children.cycles-pp.dequeue_signal
      0.34 ±  6%      -0.1        0.24 ±  9%  perf-profile.children.cycles-pp.__dequeue_signal
      0.32 ±  6%      -0.1        0.22 ±  4%  perf-profile.children.cycles-pp.recalc_sigpending_tsk
      0.25 ±  6%      -0.1        0.16 ±  7%  perf-profile.children.cycles-pp._copy_from_user
      0.27 ±  7%      -0.1        0.18 ±  4%  perf-profile.children.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      0.21 ±  7%      -0.1        0.13 ±  6%  perf-profile.children.cycles-pp.__might_fault
      0.29 ±  6%      -0.1        0.21 ± 13%  perf-profile.children.cycles-pp.__sigqueue_free
      0.28 ±  5%      -0.1        0.19 ± 13%  perf-profile.children.cycles-pp.security_task_kill
      0.27 ±  7%      -0.1        0.19 ± 12%  perf-profile.children.cycles-pp.apparmor_task_kill
      0.21 ±  7%      -0.1        0.14 ± 15%  perf-profile.children.cycles-pp.__task_pid_nr_ns
      0.22 ±  5%      -0.1        0.15 ± 16%  perf-profile.children.cycles-pp.copy_user_generic_unrolled
      0.19 ±  9%      -0.1        0.12        perf-profile.children.cycles-pp.__sigqueue_alloc
      0.22 ±  3%      -0.1        0.16 ± 11%  perf-profile.children.cycles-pp.fpu__clear
      0.11 ± 12%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.restore_altstack
      0.07 ± 14%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp._copy_to_user
      0.09 ±  4%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.__x64_sys_gettid
      0.10 ±  8%      -0.0        0.07 ± 13%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      0.09 ± 11%      -0.0        0.06 ± 13%  perf-profile.children.cycles-pp.___might_sleep
      0.07 ± 15%      -0.0        0.05        perf-profile.children.cycles-pp.find_task_by_vpid
      0.07 ± 10%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      0.10 ±  7%      +0.0        0.12 ±  8%  perf-profile.children.cycles-pp.irq_work_run_list
      0.08 ±  6%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.load_balance
      0.07 ±  7%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.irq_work_interrupt
      0.07 ±  7%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.smp_irq_work_interrupt
      0.07 ±  7%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.irq_work_run
      0.07 ±  7%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.printk
      0.07 ±  7%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.vprintk_emit
      0.10 ±  7%      +0.0        0.14 ±  7%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.10 ± 10%      +0.0        0.15 ± 14%  perf-profile.children.cycles-pp.rebalance_domains
      0.06 ± 17%      +0.1        0.11 ± 19%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.01 ±173%      +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.01 ±173%      +0.1        0.06 ± 17%  perf-profile.children.cycles-pp.find_busiest_group
      0.13 ±  5%      +0.1        0.18 ±  8%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.1        0.05 ±  9%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.00            +0.1        0.05 ±  9%  perf-profile.children.cycles-pp._raw_spin_lock
      0.07 ± 19%      +0.1        0.13 ± 19%  perf-profile.children.cycles-pp.read_tsc
      0.01 ±173%      +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.04 ±102%      +0.1        0.10 ± 14%  perf-profile.children.cycles-pp._find_next_bit
      0.01 ±173%      +0.1        0.08 ± 23%  perf-profile.children.cycles-pp.native_apic_msr_eoi_write
      0.00            +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.sched_clock
      0.00            +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.native_sched_clock
      0.09 ± 35%      +0.1        0.16 ± 14%  perf-profile.children.cycles-pp.__next_timer_interrupt
      0.08 ± 14%      +0.1        0.15 ± 10%  perf-profile.children.cycles-pp.native_write_msr
      0.13 ± 28%      +0.1        0.23 ± 15%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.18 ± 22%      +0.1        0.33 ± 14%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.45 ±  7%      +0.2        0.62 ± 23%  perf-profile.children.cycles-pp.tick_sched_timer
      0.10 ±  8%      +0.2        0.27 ± 46%  perf-profile.children.cycles-pp.rcu_core
      0.22 ± 24%      +0.2        0.41 ± 13%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.16 ± 17%      +0.2        0.40 ± 47%  perf-profile.children.cycles-pp.ktime_get
      0.36 ±  6%      +0.3        0.63 ± 24%  perf-profile.children.cycles-pp.__softirqentry_text_start
      0.46 ± 26%      +0.3        0.75 ± 13%  perf-profile.children.cycles-pp.menu_select
      0.43 ±  6%      +0.4        0.79 ± 23%  perf-profile.children.cycles-pp.irq_exit
      1.05 ±  4%      +0.5        1.57 ±  7%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.72 ±  6%      +1.0        2.70 ±  3%  perf-profile.children.cycles-pp.smp_apic_timer_interrupt
      1.86 ±  7%      +1.1        2.95 ±  4%  perf-profile.children.cycles-pp.apic_timer_interrupt
     31.45 ± 10%     +17.9       49.33 ±  7%  perf-profile.children.cycles-pp.start_secondary
     29.94 ± 13%     +18.3       48.27 ±  6%  perf-profile.children.cycles-pp.intel_idle
     31.67 ± 12%     +19.4       51.08 ±  6%  perf-profile.children.cycles-pp.cpuidle_enter_state
     31.67 ± 12%     +19.4       51.08 ±  6%  perf-profile.children.cycles-pp.cpuidle_enter
     32.33 ± 13%     +19.8       52.10 ±  6%  perf-profile.children.cycles-pp.secondary_startup_64
     32.33 ± 13%     +19.8       52.10 ±  6%  perf-profile.children.cycles-pp.cpu_startup_entry
     32.33 ± 13%     +19.8       52.11 ±  6%  perf-profile.children.cycles-pp.do_idle
     51.85 ±  6%     -15.1       36.77 ±  6%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      4.62 ±  6%      -1.5        3.17 ±  7%  perf-profile.self.cycles-pp.do_syscall_64
      1.57 ±  6%      -0.5        1.04 ±  5%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.43 ±  7%      -0.5        0.95 ±  7%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      1.12 ±  8%      -0.3        0.81 ±  8%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.93 ±  6%      -0.3        0.64 ±  3%  perf-profile.self.cycles-pp.recalc_sigpending
      0.32 ±  7%      -0.1        0.22 ±  4%  perf-profile.self.cycles-pp.copy_fpstate_to_sigframe
      0.32 ±  6%      -0.1        0.22 ±  4%  perf-profile.self.cycles-pp.recalc_sigpending_tsk
      0.26 ±  7%      -0.1        0.17 ±  4%  perf-profile.self.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      0.27 ±  7%      -0.1        0.19 ±  9%  perf-profile.self.cycles-pp.raise
      0.29 ±  6%      -0.1        0.21 ± 13%  perf-profile.self.cycles-pp.__sigqueue_free
      0.28 ±  8%      -0.1        0.20 ±  9%  perf-profile.self.cycles-pp.__fpu__restore_sig
      0.21 ±  7%      -0.1        0.14 ± 15%  perf-profile.self.cycles-pp.__task_pid_nr_ns
      0.24 ±  5%      -0.1        0.18 ±  8%  perf-profile.self.cycles-pp.__x64_sys_rt_sigreturn
      0.21 ±  4%      -0.1        0.15 ± 14%  perf-profile.self.cycles-pp.copy_user_generic_unrolled
      0.17 ±  8%      -0.1        0.11 ±  4%  perf-profile.self.cycles-pp.__sigqueue_alloc
      0.16 ± 12%      -0.1        0.11 ± 13%  perf-profile.self.cycles-pp.do_signal
      0.08 ±  6%      -0.1        0.03 ±100%  perf-profile.self.cycles-pp.__might_fault
      0.13 ±  6%      -0.0        0.08 ± 17%  perf-profile.self.cycles-pp.apparmor_task_kill
      0.23 ± 11%      -0.0        0.19 ± 10%  perf-profile.self.cycles-pp.__send_signal
      0.17 ± 10%      -0.0        0.12 ± 11%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.12 ±  8%      -0.0        0.08 ±  8%  perf-profile.self.cycles-pp.__x64_sys_rt_sigprocmask
      0.13 ±  5%      -0.0        0.09 ±  8%  perf-profile.self.cycles-pp.fpu__clear
      0.09 ± 11%      -0.0        0.06 ± 13%  perf-profile.self.cycles-pp.___might_sleep
      0.10 ±  5%      -0.0        0.07 ± 13%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      0.01 ±173%      +0.0        0.05 ±  9%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.00            +0.1        0.05 ±  9%  perf-profile.self.cycles-pp._raw_spin_lock
      0.06 ± 13%      +0.1        0.12 ± 18%  perf-profile.self.cycles-pp.read_tsc
      0.00            +0.1        0.06 ± 17%  perf-profile.self.cycles-pp.native_sched_clock
      0.01 ±173%      +0.1        0.08 ± 23%  perf-profile.self.cycles-pp.native_apic_msr_eoi_write
      0.04 ±102%      +0.1        0.10 ± 14%  perf-profile.self.cycles-pp._find_next_bit
      0.08 ± 14%      +0.1        0.15 ± 10%  perf-profile.self.cycles-pp.native_write_msr
      0.18 ± 33%      +0.1        0.28 ± 22%  perf-profile.self.cycles-pp.menu_select
      0.15 ± 22%      +0.1        0.26 ±  8%  perf-profile.self.cycles-pp.cpuidle_enter_state
     29.93 ± 13%     +18.3       48.26 ±  6%  perf-profile.self.cycles-pp.intel_idle



***************************************************************************************************
lkp-ivb-d04: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/100%/debian-x86_64-20191114.cgz/300s/lkp-ivb-d04/shared/reaim/0x21

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4           25%           1:4     dmesg.RIP:_raw_spin_unlock_irqrestore
           :4           75%           3:4     dmesg.RIP:cpuidle_enter_state
           :4           25%           1:4     dmesg.RIP:load_balance
           :4           25%           1:4     dmesg.RIP:rebalance_domains
          3:4          -31%           1:4     perf-profile.children.cycles-pp.error_entry
           :4            6%           0:4     perf-profile.children.cycles-pp.error_exit
          2:4          -17%           1:4     perf-profile.self.cycles-pp.error_entry
           :4            3%           0:4     perf-profile.self.cycles-pp.error_exit
         %stddev     %change         %stddev
             \          |                \  
      0.37          +143.3%       0.91        reaim.child_systime
      2.67          +104.0%       5.45        reaim.child_utime
     27775           -51.7%      13403        reaim.jobs_per_min
      6943           -51.7%       3350        reaim.jobs_per_min_child
     29562           -51.6%      14304        reaim.max_jobs_per_min
      0.85          +108.9%       1.77        reaim.parent_time
      2.08 ±  2%     -16.8%       1.73 ±  2%  reaim.std_dev_percent
      0.02 ±  2%     +82.4%       0.03 ±  2%  reaim.std_dev_time
    210104 ±  2%     +72.2%     361763        reaim.time.involuntary_context_switches
   6902175           -24.0%    5246698        reaim.time.minor_page_faults
    106.25           +58.1%     168.00        reaim.time.percent_of_cpu_this_job_got
     40.40           +84.8%      74.68        reaim.time.system_time
    281.47           +54.8%     435.59        reaim.time.user_time
    222993           -24.4%     168674        reaim.time.voluntary_context_switches
     42000           -24.0%      31900        reaim.workload
     30.04 ±  7%     +16.6%      35.01 ±  4%  boot-time.boot
     81.42 ±  7%     +13.1%      92.09 ±  5%  boot-time.idle
     71.02           -17.9       53.14        mpstat.cpu.all.idle%
      0.02 ± 18%      +0.0        0.02 ±  6%  mpstat.cpu.all.soft%
      4.90            +2.7        7.64        mpstat.cpu.all.sys%
     24.03           +15.2       39.19        mpstat.cpu.all.usr%
   2468957 ± 92%     -72.2%     686655 ± 19%  cpuidle.C1.time
    132628 ± 71%     -70.9%      38606 ± 24%  cpuidle.C1.usage
   1100907 ± 31%     -36.7%     697198 ± 38%  cpuidle.C1E.usage
     21384 ± 56%     -72.3%       5925 ±  9%  cpuidle.POLL.time
     10178 ±  5%     -91.7%     844.75 ± 14%  cpuidle.POLL.usage
     70.75           -25.1%      53.00        vmstat.cpu.id
     23.50 ±  2%     +62.8%      38.25        vmstat.cpu.us
      1.00          +100.0%       2.00        vmstat.procs.r
      7792            -7.3%       7219        vmstat.system.cs
     10621            -1.6%      10448        vmstat.system.in
    811.50 ±  4%     -23.4%     621.75 ±  6%  slabinfo.pid.active_objs
    811.50 ±  4%     -23.4%     621.75 ±  6%  slabinfo.pid.num_objs
    614.50 ±  3%     -16.5%     513.25 ±  6%  slabinfo.signal_cache.active_objs
    643.25 ±  2%     -16.3%     538.25 ±  7%  slabinfo.signal_cache.num_objs
    797.00 ±  6%     -28.1%     573.00 ±  9%  slabinfo.task_delay_info.active_objs
    797.00 ±  6%     -28.1%     573.00 ±  9%  slabinfo.task_delay_info.num_objs
     13672 ±  6%     -26.9%       9990 ±  3%  softirqs.CPU0.NET_RX
     36751           -16.6%      30656 ±  4%  softirqs.CPU0.SCHED
     15253           -18.8%      12381 ±  4%  softirqs.CPU1.NET_RX
     36663 ±  2%     -16.8%      30514        softirqs.CPU1.SCHED
     13659           -29.4%       9649 ±  4%  softirqs.CPU2.NET_RX
     37153 ±  4%     -20.7%      29478 ±  3%  softirqs.CPU2.SCHED
     13524 ±  3%     -21.3%      10638 ±  3%  softirqs.CPU3.NET_RX
     38397 ±  4%     -21.0%      30329 ±  4%  softirqs.CPU3.SCHED
     56110           -24.0%      42659        softirqs.NET_RX
    148966           -18.8%     120979        softirqs.SCHED
     64646            -1.1%      63909        proc-vmstat.nr_active_anon
     63486            -0.9%      62925        proc-vmstat.nr_anon_pages
      6324            +1.1%       6392        proc-vmstat.nr_mapped
      1072            +1.2%       1085        proc-vmstat.nr_page_table_pages
      6202            -1.9%       6084        proc-vmstat.nr_shmem
     64646            -1.1%      63911        proc-vmstat.nr_zone_active_anon
   6928819           -22.7%    5353998        proc-vmstat.numa_hit
   6928819           -22.7%    5353998        proc-vmstat.numa_local
     29899           -24.1%      22705        proc-vmstat.pgactivate
   6729517 ±  3%     -24.4%    5085433 ±  5%  proc-vmstat.pgalloc_normal
   7304364           -22.7%    5647853        proc-vmstat.pgfault
   7127563           -23.0%    5490714        proc-vmstat.pgfree
      3803 ± 16%     -26.3%       2803 ±  8%  interrupts.28:PCI-MSI.2621440-edge.eth0
      2471 ± 27%     -47.0%       1309        interrupts.CPU0.NMI:Non-maskable_interrupts
      2471 ± 27%     -47.0%       1309        interrupts.CPU0.PMI:Performance_monitoring_interrupts
      6391 ±  8%     +32.1%       8442 ±  5%  interrupts.CPU0.RES:Rescheduling_interrupts
      3803 ± 16%     -26.3%       2803 ±  8%  interrupts.CPU1.28:PCI-MSI.2621440-edge.eth0
      2741 ± 27%     -38.6%       1682 ± 29%  interrupts.CPU1.NMI:Non-maskable_interrupts
      2741 ± 27%     -38.6%       1682 ± 29%  interrupts.CPU1.PMI:Performance_monitoring_interrupts
      6454 ±  9%     +55.4%      10028 ± 13%  interrupts.CPU1.RES:Rescheduling_interrupts
      2561 ± 27%     -39.0%       1562 ± 24%  interrupts.CPU2.NMI:Non-maskable_interrupts
      2561 ± 27%     -39.0%       1562 ± 24%  interrupts.CPU2.PMI:Performance_monitoring_interrupts
      6573 ± 11%     +47.2%       9674 ±  5%  interrupts.CPU2.RES:Rescheduling_interrupts
      6161 ±  2%     +61.4%       9943 ±  8%  interrupts.CPU3.RES:Rescheduling_interrupts
     10041 ±  5%     -38.1%       6213 ± 16%  interrupts.NMI:Non-maskable_interrupts
     10041 ±  5%     -38.1%       6213 ± 16%  interrupts.PMI:Performance_monitoring_interrupts
     25581 ±  3%     +48.9%      38088 ±  4%  interrupts.RES:Rescheduling_interrupts
     82.25 ± 32%     -38.3%      50.75 ± 31%  interrupts.TLB:TLB_shootdowns
 4.269e+08           -22.0%   3.33e+08        perf-stat.i.branch-instructions
   1664503 ±  9%     -23.1%    1279479 ±  8%  perf-stat.i.cache-misses
  19051292           -22.7%   14721557        perf-stat.i.cache-references
      7870            -7.6%       7274        perf-stat.i.context-switches
      1.45 ±  3%      -9.7%       1.31 ±  2%  perf-stat.i.cpi
 4.213e+09           -25.6%  3.136e+09        perf-stat.i.cpu-cycles
    175.56           -16.8%     146.10        perf-stat.i.cpu-migrations
   1779889 ±  9%     -21.3%    1400983 ±  3%  perf-stat.i.dTLB-load-misses
 7.964e+08           -21.8%  6.225e+08        perf-stat.i.dTLB-loads
    351028 ±  2%     -22.6%     271606        perf-stat.i.dTLB-store-misses
 4.558e+08 ±  2%     -22.2%  3.546e+08        perf-stat.i.dTLB-stores
    442564           -21.8%     346125        perf-stat.i.iTLB-load-misses
     95765 ±  2%     -20.3%      76368 ±  2%  perf-stat.i.iTLB-loads
 3.324e+09           -24.4%  2.514e+09        perf-stat.i.instructions
      0.72 ±  2%      +8.5%       0.78 ±  2%  perf-stat.i.ipc
     23876           -23.2%      18334        perf-stat.i.minor-faults
     23876           -23.2%      18334        perf-stat.i.page-faults
      5.73            +2.2%       5.86        perf-stat.overall.MPKI
      1.67 ±  6%      +0.4        2.03 ±  3%  perf-stat.overall.branch-miss-rate%
      1.27            -1.6%       1.25        perf-stat.overall.cpi
 4.255e+08           -22.0%  3.319e+08        perf-stat.ps.branch-instructions
   1658868 ±  9%     -23.1%    1275223 ±  8%  perf-stat.ps.cache-misses
  18985675           -22.7%   14670825        perf-stat.ps.cache-references
      7844            -7.5%       7253        perf-stat.ps.context-switches
 4.199e+09           -25.6%  3.126e+09        perf-stat.ps.cpu-cycles
    174.96           -16.8%     145.60        perf-stat.ps.cpu-migrations
   1773792 ±  9%     -21.3%    1396196 ±  3%  perf-stat.ps.dTLB-load-misses
 7.937e+08           -21.8%  6.204e+08        perf-stat.ps.dTLB-loads
    349822 ±  2%     -22.6%     270680        perf-stat.ps.dTLB-store-misses
 4.543e+08 ±  2%     -22.2%  3.534e+08        perf-stat.ps.dTLB-stores
    441052           -21.8%     344957        perf-stat.ps.iTLB-load-misses
     95442 ±  2%     -20.2%      76129 ±  2%  perf-stat.ps.iTLB-loads
 3.313e+09           -24.4%  2.506e+09        perf-stat.ps.instructions
     23793           -23.2%      18271        perf-stat.ps.minor-faults
     23793           -23.2%      18271        perf-stat.ps.page-faults
 9.988e+11           -23.7%  7.621e+11        perf-stat.total.instructions
     45998           +60.9%      74001        sched_debug.cfs_rq:/.exec_clock.avg
     47498           +58.8%      75421        sched_debug.cfs_rq:/.exec_clock.max
     44646           +62.4%      72516        sched_debug.cfs_rq:/.exec_clock.min
    796333 ±  9%     -20.8%     630761        sched_debug.cfs_rq:/.load.max
     21451 ± 58%    +255.5%      76262 ± 11%  sched_debug.cfs_rq:/.load.min
    324417 ±  8%     -29.7%     227954 ±  3%  sched_debug.cfs_rq:/.load.stddev
    923.62 ± 10%     -16.1%     775.25 ±  4%  sched_debug.cfs_rq:/.load_avg.max
     30.88 ± 82%    +156.4%      79.17 ± 17%  sched_debug.cfs_rq:/.load_avg.min
    377.35 ± 13%     -23.9%     287.11 ±  6%  sched_debug.cfs_rq:/.load_avg.stddev
    189460           +64.2%     311059        sched_debug.cfs_rq:/.min_vruntime.avg
    201580 ±  2%     +61.4%     325343        sched_debug.cfs_rq:/.min_vruntime.max
    179517           +65.3%     296725        sched_debug.cfs_rq:/.min_vruntime.min
      0.56 ± 12%     +33.3%       0.75        sched_debug.cfs_rq:/.nr_running.avg
      0.21 ± 34%    +140.0%       0.50        sched_debug.cfs_rq:/.nr_running.min
      0.38 ±  8%     -35.5%       0.24 ±  3%  sched_debug.cfs_rq:/.nr_running.stddev
     10.60 ± 21%    +123.8%      23.73 ±  5%  sched_debug.cfs_rq:/.nr_spread_over.avg
     23.08 ± 14%     +42.4%      32.88 ±  9%  sched_debug.cfs_rq:/.nr_spread_over.max
      2.25 ± 87%    +583.3%      15.38 ± 10%  sched_debug.cfs_rq:/.nr_spread_over.min
    708.58 ±  7%     -19.9%     567.92 ±  6%  sched_debug.cfs_rq:/.runnable_load_avg.max
     13.38 ± 80%    +371.0%      63.00 ± 15%  sched_debug.cfs_rq:/.runnable_load_avg.min
    298.60 ±  8%     -28.3%     214.23 ±  7%  sched_debug.cfs_rq:/.runnable_load_avg.stddev
    723964 ±  7%     -21.5%     568235 ±  6%  sched_debug.cfs_rq:/.runnable_weight.max
     14679 ± 86%    +363.3%      68009 ± 12%  sched_debug.cfs_rq:/.runnable_weight.min
    299951 ±  6%     -29.5%     211457 ±  7%  sched_debug.cfs_rq:/.runnable_weight.stddev
    334.42 ± 14%     +73.8%     581.19 ±  6%  sched_debug.cfs_rq:/.util_avg.avg
    642.29 ±  3%     +26.0%     809.42 ±  7%  sched_debug.cfs_rq:/.util_avg.max
    190.79 ± 31%    +120.1%     419.96 ±  5%  sched_debug.cfs_rq:/.util_avg.min
     35.25 ±116%    +507.4%     214.10 ± 14%  sched_debug.cfs_rq:/.util_est_enqueued.avg
     75.00 ± 73%    +414.4%     385.83 ± 13%  sched_debug.cfs_rq:/.util_est_enqueued.max
      0.29 ± 47%   +7600.0%      22.46 ±168%  sched_debug.cfs_rq:/.util_est_enqueued.min
     30.74 ± 69%    +378.4%     147.03 ± 20%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
      0.36 ± 17%    +209.4%       1.11 ± 43%  sched_debug.cpu.clock.stddev
      0.36 ± 17%    +209.4%       1.11 ± 43%  sched_debug.cpu.clock_task.stddev
      4944 ± 32%     +58.6%       7841        sched_debug.cpu.curr->pid.avg
      1352 ±157%    +303.3%       5453        sched_debug.cpu.curr->pid.min
      5847 ± 15%     -33.4%       3892        sched_debug.cpu.curr->pid.stddev
      0.95 ± 16%     +29.7%       1.23 ±  6%  sched_debug.cpu.nr_running.avg
     69299 ± 14%     -27.4%      50339 ± 19%  sched_debug.cpu.sched_count.stddev
    169317           -28.4%     121307        sched_debug.cpu.sched_goidle.avg
    209603 ±  2%     -31.5%     143623 ±  2%  sched_debug.cpu.sched_goidle.max
     32708 ± 15%     -51.2%      15951 ± 22%  sched_debug.cpu.sched_goidle.stddev
      8.30 ± 10%      -3.1        5.21 ±  7%  perf-profile.calltrace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.37 ± 13%      -2.9        5.43 ±  8%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      6.22 ± 20%      -2.8        3.46 ± 17%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write._fini
      6.22 ± 20%      -2.8        3.46 ± 17%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write._fini
      6.22 ± 20%      -2.8        3.46 ± 17%  perf-profile.calltrace.cycles-pp.vprintk_emit.devkmsg_emit.devkmsg_write.new_sync_write.vfs_write
      6.22 ± 20%      -2.8        3.46 ± 17%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write._fini
      6.22 ± 20%      -2.8        3.46 ± 17%  perf-profile.calltrace.cycles-pp.devkmsg_write.new_sync_write.vfs_write.ksys_write.do_syscall_64
      6.22 ± 20%      -2.8        3.46 ± 17%  perf-profile.calltrace.cycles-pp.devkmsg_emit.devkmsg_write.new_sync_write.vfs_write.ksys_write
      6.22 ± 20%      -2.8        3.47 ± 17%  perf-profile.calltrace.cycles-pp.write._fini
      6.22 ± 20%      -2.8        3.47 ± 17%  perf-profile.calltrace.cycles-pp._fini
      5.49 ± 15%      -2.5        2.99 ± 30%  perf-profile.calltrace.cycles-pp.console_unlock.vprintk_emit.devkmsg_emit.devkmsg_write.new_sync_write
      4.38 ± 13%      -2.4        2.02 ± 36%  perf-profile.calltrace.cycles-pp.serial8250_console_write.console_unlock.vprintk_emit.devkmsg_emit.devkmsg_write
      4.26 ± 13%      -2.3        1.93 ± 37%  perf-profile.calltrace.cycles-pp.uart_console_write.serial8250_console_write.console_unlock.vprintk_emit.devkmsg_emit
      0.92 ± 19%      -0.5        0.44 ± 58%  perf-profile.calltrace.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.88 ± 24%      +0.4        1.25 ± 11%  perf-profile.calltrace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
      1.44 ± 15%      +0.5        1.90 ± 10%  perf-profile.calltrace.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      0.85 ± 22%      +0.6        1.43 ± 21%  perf-profile.calltrace.cycles-pp.prepare_exit_to_usermode.swapgs_restore_regs_and_return_to_usermode
      0.00            +0.6        0.64 ± 16%  perf-profile.calltrace.cycles-pp.alloc_set_pte.filemap_map_pages.handle_pte_fault.__handle_mm_fault.handle_mm_fault
      2.87 ± 32%      +1.9        4.72 ± 11%  perf-profile.calltrace.cycles-pp.uart_console_write.serial8250_console_write.console_unlock.vprintk_emit.printk
      2.90 ± 32%      +1.9        4.76 ± 11%  perf-profile.calltrace.cycles-pp.serial8250_console_write.console_unlock.vprintk_emit.printk.irq_work_run_list
      0.98 ± 72%      +2.2        3.21 ± 12%  perf-profile.calltrace.cycles-pp.irq_work_interrupt
      0.98 ± 72%      +2.2        3.21 ± 12%  perf-profile.calltrace.cycles-pp.smp_irq_work_interrupt.irq_work_interrupt
      0.98 ± 72%      +2.2        3.21 ± 12%  perf-profile.calltrace.cycles-pp.irq_work_run.smp_irq_work_interrupt.irq_work_interrupt
      0.98 ± 72%      +2.2        3.21 ± 12%  perf-profile.calltrace.cycles-pp.irq_work_run_list.irq_work_run.smp_irq_work_interrupt.irq_work_interrupt
      3.29 ± 22%      +2.7        5.95 ± 15%  perf-profile.calltrace.cycles-pp.vprintk_emit.printk.irq_work_run_list.irq_work_run.smp_irq_work_interrupt
      3.29 ± 22%      +2.7        5.95 ± 15%  perf-profile.calltrace.cycles-pp.printk.irq_work_run_list.irq_work_run.smp_irq_work_interrupt.irq_work_interrupt
      3.06 ± 34%      +2.9        5.95 ± 15%  perf-profile.calltrace.cycles-pp.console_unlock.vprintk_emit.printk.irq_work_run_list.irq_work_run
      8.62 ± 10%      -3.1        5.54 ±  8%  perf-profile.children.cycles-pp.vfs_write
      8.69 ± 10%      -3.1        5.63 ±  8%  perf-profile.children.cycles-pp.ksys_write
      8.36 ± 11%      -3.0        5.31 ±  7%  perf-profile.children.cycles-pp.new_sync_write
      9.35 ± 13%      -2.9        6.47 ± 10%  perf-profile.children.cycles-pp.write
      6.62 ± 18%      -2.8        3.85 ± 15%  perf-profile.children.cycles-pp._fini
      6.22 ± 20%      -2.8        3.46 ± 17%  perf-profile.children.cycles-pp.devkmsg_write
      6.22 ± 20%      -2.8        3.46 ± 17%  perf-profile.children.cycles-pp.devkmsg_emit
      1.60 ±  6%      -0.4        1.19 ± 10%  perf-profile.children.cycles-pp.mmap_region
      0.78 ± 51%      -0.3        0.48 ±  9%  perf-profile.children.cycles-pp.shmem_write_begin
      0.31 ±  5%      -0.2        0.11 ± 22%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.54 ± 13%      -0.2        0.35 ± 27%  perf-profile.children.cycles-pp.rcu_do_batch
      0.33 ± 13%      -0.2        0.18 ± 36%  perf-profile.children.cycles-pp.remove_vma
      0.23 ± 20%      -0.1        0.08 ± 40%  perf-profile.children.cycles-pp.sync_regs
      0.32 ±  9%      -0.1        0.18 ± 41%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.34 ± 10%      -0.1        0.22 ± 34%  perf-profile.children.cycles-pp.malloc
      0.32 ± 12%      -0.1        0.21 ± 37%  perf-profile.children.cycles-pp.__check_object_size
      0.20 ± 30%      -0.1        0.11 ± 38%  perf-profile.children.cycles-pp.fsnotify
      0.16 ± 34%      -0.1        0.09 ± 59%  perf-profile.children.cycles-pp.prepend_path
      0.12 ± 21%      -0.1        0.05 ± 62%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.16 ± 19%      -0.1        0.09 ± 38%  perf-profile.children.cycles-pp.__pud_alloc
      0.14 ± 19%      -0.1        0.08 ± 19%  perf-profile.children.cycles-pp.__x64_sys_rt_sigaction
      0.09 ± 21%      -0.1        0.03 ±102%  perf-profile.children.cycles-pp.expand_downwards
      0.07 ± 41%      +0.1        0.13 ± 34%  perf-profile.children.cycles-pp.memset_erms
      0.12 ± 37%      +0.1        0.18 ± 14%  perf-profile.children.cycles-pp.security_mmap_addr
      0.01 ±173%      +0.1        0.07 ± 30%  perf-profile.children.cycles-pp.free_unref_page_prepare
      0.01 ±173%      +0.1        0.07 ± 30%  perf-profile.children.cycles-pp.getopt_long
      0.07 ± 64%      +0.1        0.14 ± 19%  perf-profile.children.cycles-pp.__ctype_init
      0.01 ±173%      +0.1        0.09 ± 35%  perf-profile.children.cycles-pp.__note_gp_changes
      0.01 ±173%      +0.1        0.09 ± 28%  perf-profile.children.cycles-pp.select_idle_sibling
      0.07 ± 66%      +0.1        0.14 ± 30%  perf-profile.children.cycles-pp.security_file_open
      0.02 ±173%      +0.1        0.10 ± 43%  perf-profile.children.cycles-pp.note_gp_changes
      0.06 ± 64%      +0.1        0.14 ± 37%  perf-profile.children.cycles-pp.mutex_lock
      0.15 ±  2%      +0.1        0.23 ± 20%  perf-profile.children.cycles-pp.shmem_truncate_range
      0.15 ±  2%      +0.1        0.23 ± 20%  perf-profile.children.cycles-pp.shmem_undo_range
      0.00            +0.1        0.09 ± 49%  perf-profile.children.cycles-pp.stack_trace_consume_entry_nosched
      0.11 ± 50%      +0.1        0.21 ± 13%  perf-profile.children.cycles-pp.__ctype_toupper_loc
      0.12 ± 27%      +0.1        0.24 ± 25%  perf-profile.children.cycles-pp.touch_atime
      0.11 ± 60%      +0.1        0.26 ± 26%  perf-profile.children.cycles-pp.call_rcu
      0.29 ± 15%      +0.1        0.44 ± 17%  perf-profile.children.cycles-pp.page_add_file_rmap
      0.19 ± 44%      +0.2        0.35 ± 32%  perf-profile.children.cycles-pp.task_tick_fair
      0.56 ±  6%      +0.2        0.75 ± 12%  perf-profile.children.cycles-pp.schedule
      0.80 ± 15%      +0.3        1.06 ± 14%  perf-profile.children.cycles-pp.alloc_set_pte
      1.67 ± 15%      +0.5        2.15 ± 12%  perf-profile.children.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      1.00 ± 16%      +0.6        1.59 ± 17%  perf-profile.children.cycles-pp.prepare_exit_to_usermode
      0.93 ± 20%      +0.6        1.54 ± 13%  perf-profile.children.cycles-pp.exit_to_usermode_loop
      4.25 ± 26%      +2.1        6.38 ± 13%  perf-profile.children.cycles-pp.irq_work_run_list
      3.46 ± 22%      +2.5        5.96 ± 15%  perf-profile.children.cycles-pp.irq_work_interrupt
      3.46 ± 22%      +2.5        5.96 ± 15%  perf-profile.children.cycles-pp.smp_irq_work_interrupt
      3.46 ± 22%      +2.5        5.96 ± 15%  perf-profile.children.cycles-pp.irq_work_run
      3.46 ± 22%      +2.5        5.96 ± 15%  perf-profile.children.cycles-pp.printk
      0.41 ± 21%      -0.2        0.26 ± 32%  perf-profile.self.cycles-pp.kmem_cache_free
      0.24 ± 27%      -0.2        0.08 ±110%  perf-profile.self.cycles-pp.__vma_link_rb
      0.21 ± 24%      -0.1        0.07 ± 17%  perf-profile.self.cycles-pp.sync_regs
      0.34 ± 10%      -0.1        0.19 ± 59%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      0.24 ± 30%      -0.1        0.13 ± 42%  perf-profile.self.cycles-pp.arch_get_unmapped_area_topdown
      0.14 ± 40%      -0.1        0.04 ±108%  perf-profile.self.cycles-pp.cap_vm_enough_memory
      0.19 ± 33%      -0.1        0.10 ± 30%  perf-profile.self.cycles-pp.fsnotify
      0.27 ± 12%      -0.1        0.19 ± 13%  perf-profile.self.cycles-pp.up_write
      0.12 ± 21%      -0.1        0.05 ± 62%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.12 ± 18%      -0.1        0.06 ± 71%  perf-profile.self.cycles-pp.__softirqentry_text_start
      0.15 ± 16%      -0.1        0.09 ± 21%  perf-profile.self.cycles-pp.xas_load
      0.11 ± 23%      -0.1        0.05 ± 59%  perf-profile.self.cycles-pp.__alloc_file
      0.01 ±173%      +0.1        0.07 ± 17%  perf-profile.self.cycles-pp.do_mmap
      0.01 ±173%      +0.1        0.07 ± 30%  perf-profile.self.cycles-pp.free_unref_page_prepare
      0.09 ± 25%      +0.1        0.15 ± 27%  perf-profile.self.cycles-pp.timerqueue_add
      0.04 ± 58%      +0.1        0.11 ± 54%  perf-profile.self.cycles-pp.__fsnotify_parent
      0.05 ± 77%      +0.1        0.13 ± 34%  perf-profile.self.cycles-pp.memset_erms
      0.06 ±106%      +0.1        0.15 ± 19%  perf-profile.self.cycles-pp.lockref_put_or_lock
      0.07 ± 22%      +0.1        0.17 ± 20%  perf-profile.self.cycles-pp.__ctype_toupper_loc
      0.05 ± 62%      +0.1        0.17 ± 25%  perf-profile.self.cycles-pp.bit_putcs



***************************************************************************************************
lkp-bdw-ep6: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz with 128G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/process/16/debian-x86_64-20191114.cgz/lkp-bdw-ep6/pread2/will-it-scale/0xb000038

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4           25%           1:4     dmesg.RIP:__msecs_to_jiffies
           :4          100%           4:4     dmesg.RIP:cpuidle_enter_state
           :4           50%           2:4     dmesg.RIP:find_next_and_bit
           :4           25%           1:4     dmesg.RIP:idle_cpu
         %stddev     %change         %stddev
             \          |                \  
     47516           -58.3%      19828        will-it-scale.per_process_ops
    760272           -58.3%     317258        will-it-scale.workload
     32356           -20.9%      25597        meminfo.Shmem
    581162           -57.6%     246617        vmstat.system.cs
      3906 ± 10%     -18.4%       3186 ±  5%  slabinfo.eventpoll_pwq.active_objs
      3906 ± 10%     -18.4%       3186 ±  5%  slabinfo.eventpoll_pwq.num_objs
     44.30           +18.2%      52.34 ±  6%  boot-time.boot
     28.05           +19.3%      33.45 ±  9%  boot-time.dhcp
      3459           +17.2%       4053 ±  6%  boot-time.idle
      0.21 ±  5%      +0.3        0.49 ± 11%  mpstat.cpu.all.iowait%
      0.04 ± 55%      -0.0        0.00 ± 42%  mpstat.cpu.all.soft%
      0.40 ±  9%      +0.1        0.52 ±  6%  mpstat.cpu.all.usr%
     49949 ± 16%     -37.4%      31252 ± 41%  numa-vmstat.node1.nr_active_anon
     46901 ± 16%     -36.0%      30006 ± 43%  numa-vmstat.node1.nr_anon_pages
      5608 ± 15%     -34.0%       3702 ± 24%  numa-vmstat.node1.nr_shmem
     49949 ± 16%     -37.4%      31252 ± 41%  numa-vmstat.node1.nr_zone_active_anon
 7.102e+08 ± 29%    +155.2%  1.813e+09        cpuidle.C1.time
  27256121 ±  7%     +27.5%   34760814        cpuidle.C1.usage
  72244044 ± 20%     -48.8%   36979854 ±  7%  cpuidle.C1E.usage
 3.303e+08           -89.0%   36363726 ±  4%  cpuidle.POLL.time
 1.016e+08           -94.2%    5891366 ±  5%  cpuidle.POLL.usage
    199835 ± 16%     -37.4%     125098 ± 41%  numa-meminfo.node1.Active
    199787 ± 16%     -37.4%     125025 ± 41%  numa-meminfo.node1.Active(anon)
    135807 ± 14%     -49.2%      68980 ± 59%  numa-meminfo.node1.AnonHugePages
    187633 ± 16%     -36.0%     120058 ± 43%  numa-meminfo.node1.AnonPages
   1027770 ±  3%      -9.1%     934292 ±  3%  numa-meminfo.node1.MemUsed
     22417 ± 15%     -34.0%      14796 ± 24%  numa-meminfo.node1.Shmem
     70655            -3.3%      68347        proc-vmstat.nr_active_anon
     67337            -1.1%      66618        proc-vmstat.nr_anon_pages
      4468            -1.4%       4407        proc-vmstat.nr_inactive_anon
      8093           -21.0%       6396        proc-vmstat.nr_shmem
     70655            -3.3%      68347        proc-vmstat.nr_zone_active_anon
      4468            -1.4%       4407        proc-vmstat.nr_zone_inactive_anon
      4016 ±  2%     -52.8%       1897 ±  3%  proc-vmstat.pgactivate
    763194            -1.5%     751801        proc-vmstat.pgfree
     30.38 ±  9%     -19.4%      24.48 ±  7%  sched_debug.cfs_rq:/.load_avg.avg
     66.85 ± 15%     -29.9%      46.86 ±  9%  sched_debug.cfs_rq:/.load_avg.stddev
     11657 ± 20%     +46.4%      17071 ± 17%  sched_debug.cfs_rq:/.min_vruntime.min
      1.46 ±  4%     +54.3%       2.25 ± 22%  sched_debug.cfs_rq:/.nr_spread_over.max
    255.29 ± 33%     -51.8%     123.12 ± 57%  sched_debug.cfs_rq:/.removed.load_avg.max
     11764 ± 33%     -52.1%       5636 ± 57%  sched_debug.cfs_rq:/.removed.runnable_sum.max
      2.31 ± 32%     -68.2%       0.73 ± 86%  sched_debug.cfs_rq:/.removed.util_avg.avg
    108.42 ± 20%     -57.5%      46.04 ± 67%  sched_debug.cfs_rq:/.removed.util_avg.max
     14.41 ± 24%     -61.7%       5.52 ± 73%  sched_debug.cfs_rq:/.removed.util_avg.stddev
      1.95 ±  9%    +103.1%       3.96 ±  7%  sched_debug.cpu.clock.stddev
      1.95 ±  9%    +103.1%       3.95 ±  7%  sched_debug.cpu.clock_task.stddev
      0.00 ± 12%     +30.2%       0.00 ±  7%  sched_debug.cpu.next_balance.stddev
    996142           -57.5%     423123        sched_debug.cpu.nr_switches.avg
   4456353 ±  2%     -58.8%    1837895 ±  3%  sched_debug.cpu.nr_switches.max
   1545085 ±  2%     -58.2%     645308 ±  3%  sched_debug.cpu.nr_switches.stddev
      0.07 ± 11%     -12.2%       0.06 ±  7%  sched_debug.cpu.nr_uninterruptible.avg
    994777           -57.6%     421767        sched_debug.cpu.sched_count.avg
   4454631 ±  2%     -58.8%    1835187 ±  3%  sched_debug.cpu.sched_count.max
   1545434 ±  2%     -58.2%     645403 ±  3%  sched_debug.cpu.sched_count.stddev
    497129           -57.6%     210604        sched_debug.cpu.sched_goidle.avg
   2226464 ±  2%     -58.8%     916688 ±  3%  sched_debug.cpu.sched_goidle.max
    772445 ±  2%     -58.3%     322404 ±  3%  sched_debug.cpu.sched_goidle.stddev
    499374           -57.5%     212027        sched_debug.cpu.ttwu_count.avg
   2253283 ±  2%     -58.5%     935584 ±  2%  sched_debug.cpu.ttwu_count.max
    776205 ±  2%     -58.2%     324737 ±  3%  sched_debug.cpu.ttwu_count.stddev
 2.833e+09           -58.7%   1.17e+09        perf-stat.i.branch-instructions
      1.34 ±  7%      +0.5        1.81 ±  5%  perf-stat.i.branch-miss-rate%
  38071080 ±  7%     -42.7%   21807828 ±  5%  perf-stat.i.branch-misses
      0.13 ± 42%      +0.2        0.34 ± 16%  perf-stat.i.cache-miss-rate%
 1.708e+08 ± 11%     -52.6%   81037761 ±  4%  perf-stat.i.cache-references
    585466           -57.6%     248186        perf-stat.i.context-switches
  3.33e+10 ±  3%     -57.8%  1.405e+10 ±  3%  perf-stat.i.cpu-cycles
    213658 ± 23%     -70.6%      62867 ± 15%  perf-stat.i.cycles-between-cache-misses
 3.214e+09           -57.8%  1.358e+09        perf-stat.i.dTLB-loads
   1239865 ± 16%     -52.7%     585938 ± 12%  perf-stat.i.dTLB-store-misses
 1.309e+09 ±  5%     -52.7%  6.189e+08 ±  4%  perf-stat.i.dTLB-stores
   1960515 ± 16%     -53.9%     903780 ± 11%  perf-stat.i.iTLB-load-misses
   4186486 ± 10%     -30.8%    2895064        perf-stat.i.iTLB-loads
 1.211e+10           -57.6%  5.136e+09        perf-stat.i.instructions
     96.22            +1.1       97.36        perf-stat.i.node-load-miss-rate%
     63995 ± 12%     +40.3%      89787 ±  3%  perf-stat.i.node-load-misses
     26.57 ±  8%     +32.0       58.55 ± 17%  perf-stat.i.node-store-miss-rate%
     10897 ± 17%    +237.4%      36771 ± 19%  perf-stat.i.node-store-misses
      1.34 ±  7%      +0.5        1.86 ±  5%  perf-stat.overall.branch-miss-rate%
      0.12 ± 41%      +0.2        0.33 ± 16%  perf-stat.overall.cache-miss-rate%
    177582 ± 22%     -70.0%      53250 ± 14%  perf-stat.overall.cycles-between-cache-misses
     93.13            +2.5       95.61        perf-stat.overall.node-load-miss-rate%
     27.65 ±  9%     +30.2       57.81 ± 17%  perf-stat.overall.node-store-miss-rate%
 2.824e+09           -58.7%  1.167e+09        perf-stat.ps.branch-instructions
  37948277 ±  7%     -42.7%   21737958 ±  5%  perf-stat.ps.branch-misses
 1.702e+08 ± 11%     -52.6%   80767304 ±  4%  perf-stat.ps.cache-references
    583496           -57.6%     247346        perf-stat.ps.context-switches
 3.319e+10 ±  3%     -57.8%    1.4e+10 ±  3%  perf-stat.ps.cpu-cycles
 3.204e+09           -57.8%  1.353e+09        perf-stat.ps.dTLB-loads
   1235717 ± 16%     -52.7%     583994 ± 12%  perf-stat.ps.dTLB-store-misses
 1.304e+09 ±  5%     -52.7%  6.168e+08 ±  4%  perf-stat.ps.dTLB-stores
   1953938 ± 16%     -53.9%     900759 ± 11%  perf-stat.ps.iTLB-load-misses
   4172435 ± 10%     -30.8%    2885326        perf-stat.ps.iTLB-loads
 1.207e+10           -57.6%  5.119e+09        perf-stat.ps.instructions
     63808 ± 12%     +40.3%      89549 ±  3%  perf-stat.ps.node-load-misses
     10873 ± 17%    +237.2%      36660 ± 19%  perf-stat.ps.node-store-misses
 3.648e+12           -57.7%  1.545e+12        perf-stat.total.instructions
    184.25 ± 11%    +464.6%       1040 ± 75%  interrupts.39:IR-PCI-MSI.1572870-edge.eth0-TxRx-5
      3900 ±  7%     -62.5%       1462 ± 24%  interrupts.CPU0.NMI:Non-maskable_interrupts
      3900 ±  7%     -62.5%       1462 ± 24%  interrupts.CPU0.PMI:Performance_monitoring_interrupts
      4668 ±  7%     -60.8%       1830 ±  4%  interrupts.CPU1.NMI:Non-maskable_interrupts
      4668 ±  7%     -60.8%       1830 ±  4%  interrupts.CPU1.PMI:Performance_monitoring_interrupts
     32508 ±  6%     -15.2%      27551 ±  2%  interrupts.CPU1.RES:Rescheduling_interrupts
      4661 ±  3%     -75.4%       1148 ± 33%  interrupts.CPU10.NMI:Non-maskable_interrupts
      4661 ±  3%     -75.4%       1148 ± 33%  interrupts.CPU10.PMI:Performance_monitoring_interrupts
     31432 ±  5%     -13.5%      27188 ±  2%  interrupts.CPU10.RES:Rescheduling_interrupts
      4202 ± 16%     -72.3%       1162 ± 31%  interrupts.CPU11.NMI:Non-maskable_interrupts
      4202 ± 16%     -72.3%       1162 ± 31%  interrupts.CPU11.PMI:Performance_monitoring_interrupts
      4160 ±  3%     -68.4%       1316 ± 33%  interrupts.CPU12.NMI:Non-maskable_interrupts
      4160 ±  3%     -68.4%       1316 ± 33%  interrupts.CPU12.PMI:Performance_monitoring_interrupts
      4514 ±  3%     -64.5%       1601 ± 26%  interrupts.CPU13.NMI:Non-maskable_interrupts
      4514 ±  3%     -64.5%       1601 ± 26%  interrupts.CPU13.PMI:Performance_monitoring_interrupts
     30049 ±  6%     -10.0%      27039 ±  5%  interrupts.CPU13.RES:Rescheduling_interrupts
      4729 ±  5%     -71.0%       1373 ± 32%  interrupts.CPU14.NMI:Non-maskable_interrupts
      4729 ±  5%     -71.0%       1373 ± 32%  interrupts.CPU14.PMI:Performance_monitoring_interrupts
     34066           -19.4%      27473        interrupts.CPU14.RES:Rescheduling_interrupts
      4714 ±  6%     -65.5%       1626 ± 25%  interrupts.CPU15.NMI:Non-maskable_interrupts
      4714 ±  6%     -65.5%       1626 ± 25%  interrupts.CPU15.PMI:Performance_monitoring_interrupts
     43.50 ± 70%   +1562.1%     723.00 ± 95%  interrupts.CPU17.RES:Rescheduling_interrupts
    184.25 ± 11%    +464.6%       1040 ± 75%  interrupts.CPU18.39:IR-PCI-MSI.1572870-edge.eth0-TxRx-5
      4624 ±  5%     -60.5%       1828 ±  3%  interrupts.CPU2.NMI:Non-maskable_interrupts
      4624 ±  5%     -60.5%       1828 ±  3%  interrupts.CPU2.PMI:Performance_monitoring_interrupts
     32173 ±  6%     -16.2%      26952 ±  2%  interrupts.CPU2.RES:Rescheduling_interrupts
      4891 ±  5%     -62.5%       1836 ±  2%  interrupts.CPU3.NMI:Non-maskable_interrupts
      4891 ±  5%     -62.5%       1836 ±  2%  interrupts.CPU3.PMI:Performance_monitoring_interrupts
     35431 ±  5%     -22.4%      27510 ±  4%  interrupts.CPU3.RES:Rescheduling_interrupts
     51.50 ±151%  +11438.8%       5942 ±169%  interrupts.CPU38.RES:Rescheduling_interrupts
      4527 ±  8%     -59.7%       1825 ±  3%  interrupts.CPU4.NMI:Non-maskable_interrupts
      4527 ±  8%     -59.7%       1825 ±  3%  interrupts.CPU4.PMI:Performance_monitoring_interrupts
     30981 ±  5%     -11.0%      27558        interrupts.CPU4.RES:Rescheduling_interrupts
      3074 ± 32%     -41.3%       1805        interrupts.CPU44.NMI:Non-maskable_interrupts
      3074 ± 32%     -41.3%       1805        interrupts.CPU44.PMI:Performance_monitoring_interrupts
      2854 ± 21%     -43.2%       1622 ±  3%  interrupts.CPU45.NMI:Non-maskable_interrupts
      2854 ± 21%     -43.2%       1622 ±  3%  interrupts.CPU45.PMI:Performance_monitoring_interrupts
      2494 ± 32%     -34.0%       1647 ±  2%  interrupts.CPU46.NMI:Non-maskable_interrupts
      2494 ± 32%     -34.0%       1647 ±  2%  interrupts.CPU46.PMI:Performance_monitoring_interrupts
      3060 ± 28%     -53.5%       1421 ± 26%  interrupts.CPU48.NMI:Non-maskable_interrupts
      3060 ± 28%     -53.5%       1421 ± 26%  interrupts.CPU48.PMI:Performance_monitoring_interrupts
      3138 ± 36%     -56.6%       1363 ± 24%  interrupts.CPU49.NMI:Non-maskable_interrupts
      3138 ± 36%     -56.6%       1363 ± 24%  interrupts.CPU49.PMI:Performance_monitoring_interrupts
      4428 ± 17%     -57.3%       1893        interrupts.CPU5.NMI:Non-maskable_interrupts
      4428 ± 17%     -57.3%       1893        interrupts.CPU5.PMI:Performance_monitoring_interrupts
      3085 ± 27%     -47.6%       1617        interrupts.CPU51.NMI:Non-maskable_interrupts
      3085 ± 27%     -47.6%       1617        interrupts.CPU51.PMI:Performance_monitoring_interrupts
      3074 ± 25%     -47.9%       1603 ±  4%  interrupts.CPU52.NMI:Non-maskable_interrupts
      3074 ± 25%     -47.9%       1603 ±  4%  interrupts.CPU52.PMI:Performance_monitoring_interrupts
     12475 ±  9%     -24.3%       9441 ± 13%  interrupts.CPU52.RES:Rescheduling_interrupts
      3642 ± 10%     -72.9%     985.75 ± 31%  interrupts.CPU53.NMI:Non-maskable_interrupts
      3642 ± 10%     -72.9%     985.75 ± 31%  interrupts.CPU53.PMI:Performance_monitoring_interrupts
      3330 ±  5%     -69.7%       1009 ± 35%  interrupts.CPU54.NMI:Non-maskable_interrupts
      3330 ±  5%     -69.7%       1009 ± 35%  interrupts.CPU54.PMI:Performance_monitoring_interrupts
      3791 ± 19%     -79.4%     782.25 ±  5%  interrupts.CPU55.NMI:Non-maskable_interrupts
      3791 ± 19%     -79.4%     782.25 ±  5%  interrupts.CPU55.PMI:Performance_monitoring_interrupts
      3818 ±  3%     -72.0%       1070 ± 36%  interrupts.CPU56.NMI:Non-maskable_interrupts
      3818 ±  3%     -72.0%       1070 ± 36%  interrupts.CPU56.PMI:Performance_monitoring_interrupts
     16271 ± 20%     -29.5%      11478 ± 11%  interrupts.CPU56.RES:Rescheduling_interrupts
      3451 ±  4%     -70.4%       1023 ± 36%  interrupts.CPU57.NMI:Non-maskable_interrupts
      3451 ±  4%     -70.4%       1023 ± 36%  interrupts.CPU57.PMI:Performance_monitoring_interrupts
      3269 ±  9%     -62.2%       1234 ± 34%  interrupts.CPU58.NMI:Non-maskable_interrupts
      3269 ±  9%     -62.2%       1234 ± 34%  interrupts.CPU58.PMI:Performance_monitoring_interrupts
      2873 ± 27%     -57.1%       1231 ± 35%  interrupts.CPU59.NMI:Non-maskable_interrupts
      2873 ± 27%     -57.1%       1231 ± 35%  interrupts.CPU59.PMI:Performance_monitoring_interrupts
      4622 ±  3%     -60.6%       1821 ±  4%  interrupts.CPU6.NMI:Non-maskable_interrupts
      4622 ±  3%     -60.6%       1821 ±  4%  interrupts.CPU6.PMI:Performance_monitoring_interrupts
     33723 ±  4%     -18.9%      27349 ±  2%  interrupts.CPU6.RES:Rescheduling_interrupts
      4503 ±  3%     -64.1%       1616 ± 24%  interrupts.CPU7.NMI:Non-maskable_interrupts
      4503 ±  3%     -64.1%       1616 ± 24%  interrupts.CPU7.PMI:Performance_monitoring_interrupts
      3897 ± 27%     -59.0%       1599 ± 24%  interrupts.CPU8.NMI:Non-maskable_interrupts
      3897 ± 27%     -59.0%       1599 ± 24%  interrupts.CPU8.PMI:Performance_monitoring_interrupts
     30645 ±  4%      -9.4%      27769 ±  3%  interrupts.CPU8.RES:Rescheduling_interrupts
      4350 ±  8%     -62.8%       1616 ± 24%  interrupts.CPU9.NMI:Non-maskable_interrupts
      4350 ±  8%     -62.8%       1616 ± 24%  interrupts.CPU9.PMI:Performance_monitoring_interrupts
    131956 ±  4%     -58.7%      54514 ±  3%  interrupts.NMI:Non-maskable_interrupts
    131956 ±  4%     -58.7%      54514 ±  3%  interrupts.PMI:Performance_monitoring_interrupts
    714824 ±  4%     -11.4%     633277 ±  3%  interrupts.RES:Rescheduling_interrupts
     44129 ±  5%     +20.3%      53082 ±  5%  softirqs.CPU0.RCU
    161701 ±  4%     -35.7%     104023 ±  3%  softirqs.CPU0.TIMER
     43835 ±  3%     +18.8%      52074 ±  3%  softirqs.CPU1.RCU
    157408 ±  8%     -32.2%     106722 ±  2%  softirqs.CPU1.TIMER
     43239 ±  3%     +20.6%      52153 ±  4%  softirqs.CPU10.RCU
    157623 ±  8%     -32.4%     106606 ±  2%  softirqs.CPU10.TIMER
     43200 ±  2%     +21.2%      52345 ±  4%  softirqs.CPU11.RCU
    157353 ±  8%     -32.0%     106926 ±  2%  softirqs.CPU11.TIMER
     43390 ±  2%     +23.7%      53686        softirqs.CPU12.RCU
    158355 ±  7%     -32.3%     107240 ±  2%  softirqs.CPU12.TIMER
     44002 ±  2%     +19.7%      52691 ±  3%  softirqs.CPU13.RCU
    158735 ±  7%     -32.7%     106903 ±  2%  softirqs.CPU13.TIMER
     42932 ±  3%     +21.0%      51955 ±  3%  softirqs.CPU14.RCU
    157275 ±  7%     -32.1%     106713 ±  2%  softirqs.CPU14.TIMER
     42650 ±  3%     +23.8%      52806 ±  3%  softirqs.CPU15.RCU
    157539 ±  7%     -31.9%     107205 ±  3%  softirqs.CPU15.TIMER
     42682 ±  3%     +22.2%      52147 ±  4%  softirqs.CPU16.RCU
    162790           -40.1%      97521 ±  5%  softirqs.CPU16.TIMER
     43195 ±  3%     +21.4%      52425 ±  4%  softirqs.CPU17.RCU
    163374           -40.2%      97658 ±  5%  softirqs.CPU17.TIMER
     42825 ±  3%     +22.4%      52436 ±  4%  softirqs.CPU18.RCU
    163259           -40.5%      97085 ±  5%  softirqs.CPU18.TIMER
     42723 ±  4%     +21.9%      52085 ±  3%  softirqs.CPU19.RCU
    163199           -40.5%      97043 ±  5%  softirqs.CPU19.TIMER
     43286 ±  3%     +20.9%      52320 ±  3%  softirqs.CPU2.RCU
    157423 ±  7%     -32.1%     106815 ±  2%  softirqs.CPU2.TIMER
     43480 ±  3%     +20.3%      52326 ±  4%  softirqs.CPU20.RCU
    163538           -40.2%      97736 ±  6%  softirqs.CPU20.TIMER
     43785 ±  3%     +20.0%      52531 ±  4%  softirqs.CPU21.RCU
     44229 ±  5%     +17.8%      52114 ±  4%  softirqs.CPU22.RCU
     43412 ±  4%     +20.6%      52369 ±  4%  softirqs.CPU23.RCU
     44282 ±  7%     +20.3%      53262 ±  6%  softirqs.CPU24.RCU
     43548 ±  2%     +31.9%      57440 ±  7%  softirqs.CPU26.RCU
     43200 ±  3%     +21.0%      52284 ±  4%  softirqs.CPU27.RCU
     43083 ±  3%     +20.6%      51950 ±  4%  softirqs.CPU28.RCU
     43346 ±  3%     +20.2%      52111 ±  4%  softirqs.CPU29.RCU
     43176 ±  3%     +21.2%      52327 ±  4%  softirqs.CPU3.RCU
    157164 ±  8%     -32.3%     106399 ±  2%  softirqs.CPU3.TIMER
     43585 ±  5%     +20.1%      52357 ±  4%  softirqs.CPU30.RCU
     43719 ±  4%     +19.4%      52215 ±  3%  softirqs.CPU31.RCU
     44414 ±  5%     +18.2%      52478 ±  3%  softirqs.CPU32.RCU
    131897 ± 16%     -25.8%      97844 ±  6%  softirqs.CPU32.TIMER
     44448 ±  5%     +18.1%      52484 ±  5%  softirqs.CPU33.RCU
     42918           +27.2%      54572 ±  4%  softirqs.CPU34.RCU
     43391 ±  4%     +24.4%      53984 ±  9%  softirqs.CPU35.RCU
     44027           +18.6%      52232 ±  4%  softirqs.CPU36.RCU
     44153 ±  5%     +17.8%      52031 ±  4%  softirqs.CPU37.RCU
     42768 ±  3%     +21.1%      51810 ±  4%  softirqs.CPU38.RCU
     42923 ±  3%     +20.5%      51730 ±  3%  softirqs.CPU39.RCU
     43636 ±  2%     +21.6%      53043 ±  6%  softirqs.CPU4.RCU
    157659 ±  8%     -30.2%     109976 ±  2%  softirqs.CPU4.TIMER
     42469 ±  3%     +21.9%      51764 ±  3%  softirqs.CPU40.RCU
     42791 ±  3%     +20.8%      51694 ±  4%  softirqs.CPU41.RCU
     43485 ±  4%     +20.4%      52375 ±  2%  softirqs.CPU42.RCU
     43029 ±  2%     +21.9%      52464 ±  4%  softirqs.CPU43.RCU
     31500 ± 30%     -44.0%      17635 ± 20%  softirqs.CPU43.SCHED
     42290 ±  3%     +23.6%      52272 ±  4%  softirqs.CPU44.RCU
    158594 ±  5%     -34.3%     104235 ±  3%  softirqs.CPU44.TIMER
     45530 ±  5%     +18.7%      54021 ±  4%  softirqs.CPU45.RCU
    163284 ±  2%     -38.4%     100522 ±  3%  softirqs.CPU45.TIMER
     44379 ±  2%     +19.5%      53012 ±  6%  softirqs.CPU46.RCU
    162108 ±  2%     -38.4%      99925 ±  4%  softirqs.CPU46.TIMER
     44204 ±  3%     +18.7%      52450 ±  4%  softirqs.CPU47.RCU
    162144 ±  2%     -38.7%      99444 ±  4%  softirqs.CPU47.TIMER
     44903 ±  2%     +21.0%      54345 ±  5%  softirqs.CPU48.RCU
     44780 ±  2%     +15.6%      51771 ±  3%  softirqs.CPU49.RCU
    162631 ±  2%     -38.4%     100181 ±  5%  softirqs.CPU49.TIMER
     43012 ±  3%     +26.6%      54472 ±  7%  softirqs.CPU5.RCU
     44607 ±  3%     +17.5%      52402 ±  4%  softirqs.CPU50.RCU
    162101 ±  2%     -38.7%      99441 ±  4%  softirqs.CPU50.TIMER
     44682 ±  2%     +18.9%      53131 ±  3%  softirqs.CPU51.RCU
     49875 ±  2%     -21.1%      39345 ± 22%  softirqs.CPU51.SCHED
    162062 ±  2%     -38.3%     100017 ±  4%  softirqs.CPU51.TIMER
     44699           +18.3%      52877 ±  4%  softirqs.CPU52.RCU
     51309           -18.8%      41684 ± 16%  softirqs.CPU52.SCHED
    162152 ±  3%     -38.5%      99708 ±  4%  softirqs.CPU52.TIMER
     44488 ±  2%     +17.6%      52307 ±  4%  softirqs.CPU53.RCU
     50338 ±  3%     -16.4%      42061 ± 15%  softirqs.CPU53.SCHED
    161963 ±  2%     -38.7%      99280 ±  4%  softirqs.CPU53.TIMER
     43902 ±  2%     +21.4%      53297 ±  3%  softirqs.CPU54.RCU
    161577 ±  2%     -37.9%     100401 ±  3%  softirqs.CPU54.TIMER
     44048 ±  3%     +18.8%      52308 ±  4%  softirqs.CPU55.RCU
    161805 ±  2%     -38.7%      99176 ±  4%  softirqs.CPU55.TIMER
     44051 ±  3%     +19.2%      52521 ±  4%  softirqs.CPU56.RCU
     53419 ±  4%      -9.8%      48203 ±  2%  softirqs.CPU56.SCHED
    160982 ±  3%     -37.7%     100317 ±  4%  softirqs.CPU56.TIMER
     43863 ±  3%     +19.4%      52380 ±  3%  softirqs.CPU57.RCU
    161233 ±  2%     -38.1%      99867 ±  3%  softirqs.CPU57.TIMER
     44561 ±  3%     +19.0%      53006 ±  3%  softirqs.CPU58.RCU
    161767 ±  3%     -38.1%     100130 ±  4%  softirqs.CPU58.TIMER
     44419 ±  4%     +21.0%      53761 ±  8%  softirqs.CPU59.RCU
     50530 ±  3%      -7.9%      46520 ±  3%  softirqs.CPU59.SCHED
    161405 ±  2%     -37.2%     101425 ±  4%  softirqs.CPU59.TIMER
     43821 ±  2%     +19.2%      52250 ±  3%  softirqs.CPU6.RCU
    157996 ±  8%     -32.6%     106478 ±  2%  softirqs.CPU6.TIMER
     43174 ±  4%     +20.6%      52047 ±  4%  softirqs.CPU60.RCU
     42347 ±  3%     -15.5%      35762 ± 18%  softirqs.CPU60.SCHED
    163073           -40.5%      96957 ±  5%  softirqs.CPU60.TIMER
     42766 ±  3%     +21.9%      52126 ±  4%  softirqs.CPU61.RCU
    162835           -40.5%      96850 ±  6%  softirqs.CPU61.TIMER
     42574 ±  3%     +22.2%      52017 ±  4%  softirqs.CPU62.RCU
    162880           -40.6%      96682 ±  5%  softirqs.CPU62.TIMER
     42326 ±  4%     +22.4%      51823 ±  4%  softirqs.CPU63.RCU
    162725           -41.1%      95781 ±  5%  softirqs.CPU63.TIMER
     42386 ±  3%     +24.3%      52687 ±  6%  softirqs.CPU64.RCU
    162419           -40.0%      97492 ±  5%  softirqs.CPU64.TIMER
     42664 ±  3%     +24.1%      52948 ±  6%  softirqs.CPU65.RCU
    162604           -39.3%      98719 ±  5%  softirqs.CPU65.TIMER
     42930 ±  4%     +22.4%      52557 ±  5%  softirqs.CPU66.RCU
     44270 ±  4%     +18.0%      52235 ±  5%  softirqs.CPU67.RCU
    114483 ± 10%     -15.6%      96590 ±  5%  softirqs.CPU67.TIMER
     43515 ±  2%     +25.6%      54655 ±  7%  softirqs.CPU68.RCU
     43366 ±  4%     +19.4%      51774 ±  3%  softirqs.CPU69.RCU
    112432 ±  8%     -14.3%      96409 ±  5%  softirqs.CPU69.TIMER
     43450 ±  2%     +24.7%      54161 ±  7%  softirqs.CPU7.RCU
    157600 ±  8%     -31.4%     108046 ±  4%  softirqs.CPU7.TIMER
     43344 ±  3%     +20.6%      52293 ±  4%  softirqs.CPU70.RCU
     43314 ±  4%     +19.9%      51935 ±  4%  softirqs.CPU71.RCU
     43488 ±  4%     +19.8%      52078 ±  4%  softirqs.CPU72.RCU
     43392 ±  3%     +20.9%      52471 ±  4%  softirqs.CPU73.RCU
     43217 ±  3%     +20.5%      52062 ±  4%  softirqs.CPU74.RCU
     42947 ±  3%     +21.5%      52201 ±  4%  softirqs.CPU75.RCU
     42710 ±  3%     +21.2%      51754 ±  3%  softirqs.CPU76.RCU
     42920 ±  3%     +20.8%      51831 ±  3%  softirqs.CPU77.RCU
     44411 ±  4%     +16.3%      51634 ±  4%  softirqs.CPU78.RCU
     42860 ±  3%     +21.3%      52007 ±  3%  softirqs.CPU79.RCU
     43752 ±  3%     +23.7%      54111 ±  4%  softirqs.CPU8.RCU
    158332 ±  7%     -31.5%     108521 ±  3%  softirqs.CPU8.TIMER
     43727           +18.4%      51771 ±  4%  softirqs.CPU80.RCU
     42622 ±  2%     +22.2%      52098 ±  3%  softirqs.CPU81.RCU
     43347 ±  3%     +18.7%      51452 ±  3%  softirqs.CPU82.RCU
     43487 ±  3%     +18.2%      51421 ±  4%  softirqs.CPU83.RCU
     42839 ±  2%     +20.7%      51717 ±  4%  softirqs.CPU84.RCU
     42598 ±  3%     +21.4%      51721 ±  4%  softirqs.CPU85.RCU
     42523 ±  3%     +23.8%      52631 ±  6%  softirqs.CPU86.RCU
     43166 ±  2%     +18.6%      51178 ±  4%  softirqs.CPU87.RCU
     43892 ±  2%     +18.8%      52158 ±  3%  softirqs.CPU9.RCU
    158354 ±  7%     -32.6%     106771 ±  2%  softirqs.CPU9.TIMER
   3831450 ±  3%     +20.7%    4623682 ±  4%  softirqs.RCU
  12124176 ±  6%     -26.8%    8870348 ±  4%  softirqs.TIMER
      5.74            -5.7        0.00        perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
     49.19 ±  2%      -4.4       44.77 ±  2%  perf-profile.calltrace.cycles-pp.__libc_pread
     48.16 ±  2%      -4.3       43.85 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_pread
     48.08 ±  2%      -4.3       43.78 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pread
     46.68 ±  2%      -4.1       42.53 ±  2%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_pread64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pread
     46.83 ±  2%      -4.1       42.68 ±  2%  perf-profile.calltrace.cycles-pp.ksys_pread64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pread
     46.35 ±  2%      -4.1       42.22 ±  2%  perf-profile.calltrace.cycles-pp.new_sync_read.vfs_read.ksys_pread64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     46.30 ±  2%      -4.1       42.18 ±  2%  perf-profile.calltrace.cycles-pp.shmem_file_read_iter.new_sync_read.vfs_read.ksys_pread64.do_syscall_64
     32.56 ±  2%      -3.2       29.40 ±  2%  perf-profile.calltrace.cycles-pp.wake_up_page_bit.shmem_file_read_iter.new_sync_read.vfs_read.ksys_pread64
     28.11            -3.0       25.09 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.wake_up_page_bit.shmem_file_read_iter.new_sync_read.vfs_read
     27.87            -3.0       24.88 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.wake_up_page_bit.shmem_file_read_iter.new_sync_read
     12.00 ±  2%      -0.9       11.06 ±  3%  perf-profile.calltrace.cycles-pp.shmem_getpage_gfp.shmem_file_read_iter.new_sync_read.vfs_read.ksys_pread64
     11.92 ±  2%      -0.9       10.99 ±  3%  perf-profile.calltrace.cycles-pp.find_lock_entry.shmem_getpage_gfp.shmem_file_read_iter.new_sync_read.vfs_read
     10.55 ±  3%      -0.9        9.69 ±  3%  perf-profile.calltrace.cycles-pp.__lock_page.find_lock_entry.shmem_getpage_gfp.shmem_file_read_iter.new_sync_read
      7.53 ±  4%      -0.8        6.75 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.__lock_page.find_lock_entry.shmem_getpage_gfp.shmem_file_read_iter
      7.35 ±  4%      -0.8        6.58 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__lock_page.find_lock_entry.shmem_getpage_gfp
      3.57 ±  3%      -0.3        3.28 ±  4%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.wake_up_page_bit.shmem_file_read_iter.new_sync_read
      0.59 ±  3%      +0.1        0.71 ±  8%  perf-profile.calltrace.cycles-pp.get_next_timer_interrupt.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.do_idle
      0.76 ±  3%      +0.2        0.99 ±  9%  perf-profile.calltrace.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_entry
      0.94 ±  4%      +0.3        1.21 ±  9%  perf-profile.calltrace.cycles-pp.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_entry.start_secondary
      1.81 ±  5%      +0.5        2.35 ±  7%  perf-profile.calltrace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
      0.00            +0.6        0.64 ±  6%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state
      0.00            +0.7        0.68 ± 16%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interrupt
      0.00            +0.8        0.82 ± 14%  perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt
      0.59 ± 59%      +0.9        1.46 ± 12%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state
      0.00            +1.3        1.25 ±  7%  perf-profile.calltrace.cycles-pp.__softirqentry_text_start.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state
      0.95 ± 28%      +1.5        2.42 ±  9%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +1.6        1.62 ±  5%  perf-profile.calltrace.cycles-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      1.60 ± 22%      +3.0        4.61 ±  7%  perf-profile.calltrace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle
     44.98 ±  2%      +3.2       48.22        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary
      1.73 ± 20%      +3.3        5.02 ±  7%  perf-profile.calltrace.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
     45.11 ±  2%      +3.5       48.60        perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     48.76 ±  2%      +4.1       52.83        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     48.78 ±  2%      +4.1       52.86        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
     48.78 ±  2%      +4.1       52.86        perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64
     50.29 ±  2%      +4.2       54.48 ±  2%  perf-profile.calltrace.cycles-pp.secondary_startup_64
     38.54 ±  2%      +5.6       44.12        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
      5.91            -5.5        0.43 ±  3%  perf-profile.children.cycles-pp.poll_idle
     49.26 ±  2%      -4.4       44.83 ±  2%  perf-profile.children.cycles-pp.__libc_pread
     48.26 ±  2%      -4.2       44.03 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     48.19 ±  2%      -4.2       43.97 ±  2%  perf-profile.children.cycles-pp.do_syscall_64
     46.83 ±  2%      -4.1       42.68 ±  2%  perf-profile.children.cycles-pp.ksys_pread64
     46.69 ±  2%      -4.1       42.56 ±  2%  perf-profile.children.cycles-pp.vfs_read
     46.35 ±  2%      -4.1       42.23 ±  2%  perf-profile.children.cycles-pp.new_sync_read
     46.30 ±  2%      -4.1       42.18 ±  2%  perf-profile.children.cycles-pp.shmem_file_read_iter
     36.19 ±  2%      -3.5       32.70 ±  2%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     32.57 ±  2%      -3.2       29.40 ±  2%  perf-profile.children.cycles-pp.wake_up_page_bit
     29.48            -2.7       26.78 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     12.01 ±  2%      -0.9       11.07 ±  3%  perf-profile.children.cycles-pp.shmem_getpage_gfp
     11.93 ±  2%      -0.9       11.00 ±  3%  perf-profile.children.cycles-pp.find_lock_entry
     10.56 ±  3%      -0.9        9.70 ±  3%  perf-profile.children.cycles-pp.__lock_page
      7.55 ±  4%      -0.7        6.80 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      3.57 ±  3%      -0.3        3.28 ±  4%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.43 ±  3%      -0.1        0.37 ±  5%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.07 ± 17%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.atime_needs_update
      0.18 ±  3%      -0.0        0.14 ± 12%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.08 ± 19%      -0.0        0.04 ± 60%  perf-profile.children.cycles-pp.touch_atime
      0.20 ±  5%      +0.0        0.24 ±  6%  perf-profile.children.cycles-pp.update_rq_clock
      0.08 ± 13%      +0.0        0.13 ±  6%  perf-profile.children.cycles-pp.uart_console_write
      0.08 ± 10%      +0.0        0.13 ±  6%  perf-profile.children.cycles-pp.serial8250_console_putchar
      0.09 ± 12%      +0.0        0.14 ±  6%  perf-profile.children.cycles-pp.serial8250_console_write
      0.08 ± 10%      +0.1        0.13 ±  8%  perf-profile.children.cycles-pp.wait_for_xmitr
      0.08 ± 13%      +0.1        0.14 ±  7%  perf-profile.children.cycles-pp.irq_work_interrupt
      0.08 ± 13%      +0.1        0.14 ±  7%  perf-profile.children.cycles-pp.smp_irq_work_interrupt
      0.08 ± 13%      +0.1        0.14 ±  7%  perf-profile.children.cycles-pp.irq_work_run
      0.08 ± 13%      +0.1        0.14 ±  7%  perf-profile.children.cycles-pp.printk
      0.08 ± 13%      +0.1        0.14 ±  7%  perf-profile.children.cycles-pp.vprintk_emit
      0.09 ±  8%      +0.1        0.15 ± 10%  perf-profile.children.cycles-pp.console_unlock
      0.07 ± 22%      +0.1        0.14 ± 17%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.07 ± 60%      +0.1        0.14 ± 19%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.08 ± 10%      +0.1        0.15 ±  7%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      0.05 ± 62%      +0.1        0.12 ± 15%  perf-profile.children.cycles-pp.run_timer_softirq
      0.00            +0.1        0.07 ± 17%  perf-profile.children.cycles-pp.rcu_irq_enter
      0.23 ±  6%      +0.1        0.30 ± 10%  perf-profile.children.cycles-pp._find_next_bit
      0.09 ±  8%      +0.1        0.17 ±  9%  perf-profile.children.cycles-pp.irq_work_run_list
      0.01 ±173%      +0.1        0.09 ± 16%  perf-profile.children.cycles-pp.interrupt_entry
      0.04 ±113%      +0.1        0.12 ± 50%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.00            +0.1        0.09 ± 20%  perf-profile.children.cycles-pp.calc_global_load_tick
      0.41 ±  5%      +0.1        0.50 ±  7%  perf-profile.children.cycles-pp.__next_timer_interrupt
      0.00            +0.1        0.10 ± 11%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.03 ±100%      +0.1        0.12 ±  6%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.1        0.10 ± 22%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.06 ± 61%      +0.1        0.17 ± 10%  perf-profile.children.cycles-pp.update_blocked_averages
      0.06 ± 60%      +0.1        0.17 ± 23%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.04 ± 58%      +0.1        0.15 ±  8%  perf-profile.children.cycles-pp.native_apic_msr_eoi_write
      0.06 ± 60%      +0.1        0.18 ± 11%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.03 ±100%      +0.1        0.15 ± 17%  perf-profile.children.cycles-pp.find_busiest_group
      0.00            +0.1        0.11 ± 21%  perf-profile.children.cycles-pp.note_gp_changes
      0.60 ±  3%      +0.1        0.72 ±  7%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.07 ± 61%      +0.1        0.21 ± 18%  perf-profile.children.cycles-pp.load_balance
      0.07 ± 14%      +0.1        0.22 ±  8%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.37 ±  9%      +0.1        0.51 ± 11%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.06 ± 16%      +0.1        0.21 ±  8%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.20 ±  4%      +0.2        0.36 ±  4%  perf-profile.children.cycles-pp.read_tsc
      0.20 ± 37%      +0.2        0.37 ± 15%  perf-profile.children.cycles-pp.irq_enter
      0.07 ± 85%      +0.2        0.24 ±  7%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.16 ± 26%      +0.2        0.35 ± 10%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.16 ±  7%      +0.2        0.35 ±  6%  perf-profile.children.cycles-pp.native_write_msr
      0.11 ± 26%      +0.2        0.32 ± 12%  perf-profile.children.cycles-pp.rebalance_domains
      0.78 ±  2%      +0.2        1.00 ±  9%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.14 ± 29%      +0.2        0.37 ± 11%  perf-profile.children.cycles-pp.scheduler_tick
      0.96 ±  4%      +0.3        1.23 ±  9%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.29 ± 33%      +0.4        0.72 ± 15%  perf-profile.children.cycles-pp.update_process_times
      0.32 ± 34%      +0.4        0.77 ± 16%  perf-profile.children.cycles-pp.tick_sched_handle
      0.42 ± 34%      +0.5        0.93 ± 13%  perf-profile.children.cycles-pp.tick_sched_timer
      0.19 ± 14%      +0.5        0.70 ±  5%  perf-profile.children.cycles-pp.clockevents_program_event
      1.85 ±  5%      +0.5        2.38 ±  7%  perf-profile.children.cycles-pp.menu_select
      0.08 ± 26%      +0.5        0.61 ± 18%  perf-profile.children.cycles-pp.rcu_core
      0.44 ± 11%      +0.6        1.01 ±  5%  perf-profile.children.cycles-pp.ktime_get
      0.76 ± 32%      +0.9        1.62 ± 11%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.35 ± 19%      +1.0        1.34 ±  7%  perf-profile.children.cycles-pp.__softirqentry_text_start
      0.47 ± 12%      +1.3        1.73 ±  5%  perf-profile.children.cycles-pp.irq_exit
      1.10 ± 25%      +1.6        2.68 ±  9%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.86 ± 20%      +3.2        5.02 ±  7%  perf-profile.children.cycles-pp.smp_apic_timer_interrupt
      2.03 ± 18%      +3.5        5.49 ±  7%  perf-profile.children.cycles-pp.apic_timer_interrupt
     46.52 ±  2%      +3.6       50.16 ±  2%  perf-profile.children.cycles-pp.cpuidle_enter_state
     46.53 ±  2%      +3.6       50.17 ±  2%  perf-profile.children.cycles-pp.cpuidle_enter
     48.78 ±  2%      +4.1       52.86        perf-profile.children.cycles-pp.start_secondary
     50.29 ±  2%      +4.2       54.48 ±  2%  perf-profile.children.cycles-pp.secondary_startup_64
     50.29 ±  2%      +4.2       54.48 ±  2%  perf-profile.children.cycles-pp.cpu_startup_entry
     50.30 ±  2%      +4.2       54.50 ±  2%  perf-profile.children.cycles-pp.do_idle
     38.55 ±  2%      +5.6       44.12        perf-profile.children.cycles-pp.intel_idle
      5.70            -5.3        0.37 ±  3%  perf-profile.self.cycles-pp.poll_idle
     36.19 ±  2%      -3.5       32.70 ±  2%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      1.16 ±  2%      -0.1        1.03 ±  5%  perf-profile.self.cycles-pp.do_syscall_64
      0.38 ±  3%      -0.1        0.32 ±  6%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.18 ±  3%      -0.0        0.14 ± 13%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.14 ±  6%      -0.0        0.12 ±  5%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.14 ±  6%      +0.0        0.16 ±  2%  perf-profile.self.cycles-pp.update_rq_clock
      0.25            +0.0        0.28 ±  5%  perf-profile.self.cycles-pp.do_idle
      0.16 ±  5%      +0.0        0.20 ±  9%  perf-profile.self.cycles-pp.__next_timer_interrupt
      0.07 ± 17%      +0.1        0.12 ± 19%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.00            +0.1        0.05 ±  9%  perf-profile.self.cycles-pp.update_blocked_averages
      0.04 ± 60%      +0.1        0.10 ± 14%  perf-profile.self.cycles-pp.run_timer_softirq
      0.07 ± 11%      +0.1        0.14 ±  8%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.03 ±100%      +0.1        0.09 ± 16%  perf-profile.self.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.scheduler_tick
      0.03 ±100%      +0.1        0.09 ± 13%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.00            +0.1        0.07 ± 20%  perf-profile.self.cycles-pp.smp_apic_timer_interrupt
      0.23 ±  4%      +0.1        0.30 ±  9%  perf-profile.self.cycles-pp._find_next_bit
      0.01 ±173%      +0.1        0.09 ± 13%  perf-profile.self.cycles-pp.interrupt_entry
      0.00            +0.1        0.07 ± 15%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.1        0.08 ± 27%  perf-profile.self.cycles-pp.note_gp_changes
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.01 ±173%      +0.1        0.10 ± 13%  perf-profile.self.cycles-pp.find_busiest_group
      0.00            +0.1        0.09 ± 26%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.04 ± 59%      +0.1        0.14 ± 23%  perf-profile.self.cycles-pp.rcu_sched_clock_irq
      0.00            +0.1        0.10 ± 23%  perf-profile.self.cycles-pp.__softirqentry_text_start
      0.00            +0.1        0.10 ± 22%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.04 ± 58%      +0.1        0.14 ±  5%  perf-profile.self.cycles-pp.native_apic_msr_eoi_write
      0.06 ± 16%      +0.1        0.21 ±  8%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.19 ±  4%      +0.2        0.34 ±  4%  perf-profile.self.cycles-pp.read_tsc
      0.16 ±  7%      +0.2        0.35 ±  6%  perf-profile.self.cycles-pp.native_write_msr
      0.74 ±  7%      +0.2        0.98 ±  5%  perf-profile.self.cycles-pp.menu_select
      0.23 ±  9%      +0.3        0.51 ± 10%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.26 ± 17%      +0.4        0.69 ±  7%  perf-profile.self.cycles-pp.ktime_get
     38.54 ±  2%      +5.6       44.11        perf-profile.self.cycles-pp.intel_idle



***************************************************************************************************
lkp-ivb-d04: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/debian-x86_64-20191114.cgz/lkp-ivb-d04/pthread_mutex1/will-it-scale/0x21

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4           50%           2:4     dmesg.RIP:cpuidle_enter_state
           :4           50%           2:4     dmesg.RIP:load_balance
          1:4          -25%            :4     dmesg.WARNING:at(____ptrval____)for_ip_swapgs_restore_regs_and_return_to_usermode/0x
         %stddev     %change         %stddev
             \          |                \  
 2.104e+08           -52.9%   99134408        will-it-scale.per_process_ops
  15237207           -52.0%    7319428        will-it-scale.per_thread_ops
      0.78            +6.8%       0.83 ±  5%  will-it-scale.scalability
      3966 ±  6%     +10.6%       4386 ±  3%  will-it-scale.time.involuntary_context_switches
   2226461           -51.0%    1091802 ±  7%  will-it-scale.time.voluntary_context_switches
 2.096e+09           -52.4%  9.982e+08        will-it-scale.workload
      2190 ±  8%     -17.4%       1808 ±  3%  slabinfo.filp.num_objs
     30.11 ±  8%     +15.7%      34.84 ±  4%  boot-time.boot
     81.94 ±  9%     +10.9%      90.88 ±  6%  boot-time.idle
     51203 ±  5%     -16.0%      43013 ± 11%  softirqs.CPU0.SCHED
     27449 ±  7%     +19.2%      32729 ±  8%  softirqs.CPU1.RCU
     36.00            -5.6%      34.00 ±  2%  vmstat.cpu.id
     51.75            +2.9%      53.25        vmstat.cpu.us
     21263           -37.0%      13400 ±  4%  vmstat.system.cs
     11199            -4.4%      10703        vmstat.system.in
     64941            -0.9%      64335        proc-vmstat.nr_active_anon
      3422            -1.1%       3385        proc-vmstat.nr_kernel_stack
     64952            -0.9%      64345        proc-vmstat.nr_zone_active_anon
     68842           -17.5%      56769        proc-vmstat.pgalloc_dma32
    320818            +4.2%     334169        proc-vmstat.pgalloc_normal
   1054791 ± 34%    +315.7%    4384508 ±  4%  cpuidle.C1.time
    151088 ± 16%    +638.1%    1115152 ±  4%  cpuidle.C1.usage
  66411716 ± 23%     -27.2%   48366537        cpuidle.C1E.time
   1049491 ± 14%     -19.0%     849934        cpuidle.C1E.usage
   2178859           -95.8%      91652 ± 22%  cpuidle.POLL.time
   1806832           -98.3%      31263 ± 56%  cpuidle.POLL.usage
     24270 ±  6%     -76.9%       5600 ± 15%  interrupts.CPU0.RES:Rescheduling_interrupts
     24938 ±  8%     -74.6%       6333 ± 11%  interrupts.CPU1.RES:Rescheduling_interrupts
      6707 ± 23%     -44.0%       3759 ± 33%  interrupts.CPU2.NMI:Non-maskable_interrupts
      6707 ± 23%     -44.0%       3759 ± 33%  interrupts.CPU2.PMI:Performance_monitoring_interrupts
     21878 ±  5%     -75.1%       5455 ±  6%  interrupts.CPU2.RES:Rescheduling_interrupts
      6762 ±  7%     -40.9%       3997 ± 15%  interrupts.CPU3.NMI:Non-maskable_interrupts
      6762 ±  7%     -40.9%       3997 ± 15%  interrupts.CPU3.PMI:Performance_monitoring_interrupts
     25423 ± 10%     -79.2%       5293 ± 13%  interrupts.CPU3.RES:Rescheduling_interrupts
     24739 ± 18%     -36.9%      15618 ± 17%  interrupts.NMI:Non-maskable_interrupts
     24739 ± 18%     -36.9%      15618 ± 17%  interrupts.PMI:Performance_monitoring_interrupts
     96510 ±  3%     -76.5%      22681 ±  7%  interrupts.RES:Rescheduling_interrupts
     36354 ± 11%     +23.6%      44924 ± 16%  sched_debug.cfs_rq:/.exec_clock.min
    320.56 ±  3%      -8.2%     294.19        sched_debug.cfs_rq:/.load_avg.avg
    566.12 ±  8%     -13.9%     487.33 ±  3%  sched_debug.cfs_rq:/.load_avg.max
    186.78 ± 10%     -22.7%     144.45 ±  8%  sched_debug.cfs_rq:/.load_avg.stddev
    232654           +12.4%     261512        sched_debug.cfs_rq:/.min_vruntime.avg
    132912 ±  7%     +26.5%     168078 ± 14%  sched_debug.cfs_rq:/.min_vruntime.min
      1.69 ± 26%    +116.0%       3.65 ± 16%  sched_debug.cfs_rq:/.nr_spread_over.avg
      5.88 ± 26%     +70.2%      10.00 ± 28%  sched_debug.cfs_rq:/.nr_spread_over.max
      0.12 ±173%    +433.3%       0.67 ± 39%  sched_debug.cfs_rq:/.nr_spread_over.min
    241.93 ±  4%     -11.0%     215.36 ±  4%  sched_debug.cfs_rq:/.runnable_load_avg.avg
    120048 ± 25%     -66.6%      40077 ±103%  sched_debug.cfs_rq:/.spread0.max
    521.71 ±  6%     +13.7%     593.17        sched_debug.cfs_rq:/.util_avg.min
      0.65 ± 25%     +95.2%       1.26 ± 12%  sched_debug.cpu.clock.stddev
      0.65 ± 25%     +95.2%       1.26 ± 12%  sched_debug.cpu.clock_task.stddev
    607794           -19.4%     489990 ±  2%  sched_debug.cpu.nr_switches.avg
   1037607 ±  7%     -21.4%     815490 ± 10%  sched_debug.cpu.nr_switches.max
    205920 ± 10%     -23.2%     158092 ± 16%  sched_debug.cpu.nr_switches.min
    314902 ± 13%     -23.4%     241089 ± 11%  sched_debug.cpu.nr_switches.stddev
    595725           -19.9%     477280 ±  2%  sched_debug.cpu.sched_count.avg
   1023898 ±  8%     -21.7%     801724 ± 10%  sched_debug.cpu.sched_count.max
    195081 ± 12%     -24.0%     148353 ± 18%  sched_debug.cpu.sched_count.min
    313331 ± 13%     -23.6%     239325 ± 11%  sched_debug.cpu.sched_count.stddev
    293215           -20.7%     232421 ±  2%  sched_debug.cpu.sched_goidle.avg
    503615 ±  8%     -22.0%     392723 ± 10%  sched_debug.cpu.sched_goidle.max
     95451 ± 12%     -25.0%      71592 ± 19%  sched_debug.cpu.sched_goidle.min
    154512 ± 13%     -23.9%     117560 ± 12%  sched_debug.cpu.sched_goidle.stddev
    297672           -19.9%     238580 ±  2%  sched_debug.cpu.ttwu_count.avg
    507445 ±  7%     -21.7%     397386 ± 10%  sched_debug.cpu.ttwu_count.max
    103665 ±  7%     -26.8%      75928 ± 20%  sched_debug.cpu.ttwu_count.min
      5979 ±115%    +285.2%      23028 ± 56%  sched_debug.cpu.ttwu_local.min
    156086 ± 12%     -23.2%     119837 ± 12%  sched_debug.cpu.ttwu_local.stddev
 2.647e+09           -51.6%  1.282e+09        perf-stat.i.branch-instructions
      0.69 ±  2%      +0.2        0.84 ±  2%  perf-stat.i.branch-miss-rate%
   6526139           -19.4%    5261406        perf-stat.i.branch-misses
  10117481 ±  2%     -46.1%    5456549 ±  2%  perf-stat.i.cache-references
     21184           -36.5%      13452 ±  4%  perf-stat.i.context-switches
  8.49e+09           -50.1%  4.239e+09        perf-stat.i.cpu-cycles
     24.57 ±  2%     +13.8%      27.97 ±  5%  perf-stat.i.cpu-migrations
     59536 ±  7%     -49.1%      30319 ±  7%  perf-stat.i.cycles-between-cache-misses
   3870291 ±  9%     -49.6%    1951431 ±  5%  perf-stat.i.dTLB-load-misses
 2.168e+09           -51.2%  1.059e+09        perf-stat.i.dTLB-loads
      0.38            -0.0        0.38        perf-stat.i.dTLB-store-miss-rate%
   2757551           -51.6%    1333439        perf-stat.i.dTLB-store-misses
 1.094e+09           -51.0%  5.366e+08        perf-stat.i.dTLB-stores
     72.64            -2.2       70.41        perf-stat.i.iTLB-load-miss-rate%
   1313363           -44.6%     727435 ±  2%  perf-stat.i.iTLB-load-misses
    310347 ±  8%     -21.6%     243185 ±  8%  perf-stat.i.iTLB-loads
 6.225e+09           -50.1%  3.103e+09        perf-stat.i.instructions
    135864 ±  4%     -53.6%      62988 ±  2%  perf-stat.i.instructions-per-iTLB-miss
      0.78            -2.1%       0.76        perf-stat.i.ipc
      1.63 ±  2%      +8.2%       1.76 ±  2%  perf-stat.overall.MPKI
      0.25            +0.2        0.41        perf-stat.overall.branch-miss-rate%
      2.80 ± 11%      +2.5        5.25 ± 11%  perf-stat.overall.cache-miss-rate%
     30373 ± 10%     -50.7%      14984 ± 11%  perf-stat.overall.cycles-between-cache-misses
     80.91            -5.9       74.96 ±  2%  perf-stat.overall.iTLB-load-miss-rate%
      4739           -10.0%       4267        perf-stat.overall.instructions-per-iTLB-miss
    903.69            +4.8%     947.23        perf-stat.overall.path-length
 2.639e+09           -51.6%  1.277e+09        perf-stat.ps.branch-instructions
   6507381           -19.4%    5245105        perf-stat.ps.branch-misses
  10084181 ±  2%     -46.1%    5438492 ±  2%  perf-stat.ps.cache-references
     21116           -36.5%      13408 ±  4%  perf-stat.ps.context-switches
 8.462e+09           -50.1%  4.225e+09        perf-stat.ps.cpu-cycles
     24.49 ±  2%     +13.8%      27.88 ±  5%  perf-stat.ps.cpu-migrations
   3857538 ±  9%     -49.6%    1944940 ±  5%  perf-stat.ps.dTLB-load-misses
 2.161e+09           -51.2%  1.055e+09        perf-stat.ps.dTLB-loads
   2748462           -51.6%    1328985        perf-stat.ps.dTLB-store-misses
 1.091e+09           -51.0%  5.349e+08        perf-stat.ps.dTLB-stores
   1309035           -44.6%     725011 ±  2%  perf-stat.ps.iTLB-load-misses
    309329 ±  8%     -21.6%     242382 ±  8%  perf-stat.ps.iTLB-loads
 6.205e+09           -50.1%  3.093e+09        perf-stat.ps.instructions
 1.895e+12           -50.1%  9.455e+11        perf-stat.total.instructions
     97.93            -2.3       95.64        perf-profile.calltrace.cycles-pp.secondary_startup_64
      1.90 ± 52%      -1.3        0.63 ±128%  perf-profile.calltrace.cycles-pp.serial8250_console_write.console_unlock.vprintk_emit.printk.irq_work_run_list
      1.85 ± 52%      -1.2        0.61 ±128%  perf-profile.calltrace.cycles-pp.wait_for_xmitr.serial8250_console_putchar.uart_console_write.serial8250_console_write.console_unlock
      1.85 ± 52%      -1.2        0.61 ±129%  perf-profile.calltrace.cycles-pp.serial8250_console_putchar.uart_console_write.serial8250_console_write.console_unlock.vprintk_emit
      1.87 ± 52%      -1.2        0.63 ±128%  perf-profile.calltrace.cycles-pp.uart_console_write.serial8250_console_write.console_unlock.vprintk_emit.printk
      0.52 ± 62%      +0.7        1.19 ± 29%  perf-profile.calltrace.cycles-pp.apic_timer_interrupt
     97.90            -2.3       95.58        perf-profile.children.cycles-pp.cpuidle_enter
     97.90            -2.3       95.58        perf-profile.children.cycles-pp.cpuidle_enter_state
     97.93            -2.3       95.64        perf-profile.children.cycles-pp.secondary_startup_64
     97.93            -2.3       95.64        perf-profile.children.cycles-pp.cpu_startup_entry
     97.93            -2.3       95.64        perf-profile.children.cycles-pp.do_idle
      0.01 ±173%      +0.1        0.07 ± 34%  perf-profile.children.cycles-pp.update_curr
      0.06 ± 65%      +0.1        0.12 ± 23%  perf-profile.children.cycles-pp.do_sys_open
      0.06 ± 65%      +0.1        0.12 ± 23%  perf-profile.children.cycles-pp.do_sys_openat2
      0.01 ±173%      +0.1        0.09 ± 24%  perf-profile.children.cycles-pp.native_write_msr
      0.09 ± 20%      +0.1        0.17 ± 17%  perf-profile.children.cycles-pp.read
      0.07 ± 58%      +0.1        0.15 ± 14%  perf-profile.children.cycles-pp.ksys_read
      0.06 ± 60%      +0.1        0.15 ± 16%  perf-profile.children.cycles-pp.vfs_read
      0.00            +0.1        0.11 ± 13%  perf-profile.children.cycles-pp.interrupt_entry
      0.10 ± 39%      +0.1        0.23 ± 47%  perf-profile.children.cycles-pp.handle_pte_fault
      0.02 ±173%      +0.1        0.15 ± 62%  perf-profile.children.cycles-pp.__softirqentry_text_start
      0.02 ±173%      +0.1        0.17 ± 56%  perf-profile.children.cycles-pp.irq_exit
      0.15 ± 30%      +0.2        0.33 ± 45%  perf-profile.children.cycles-pp.fbcon_putcs
      0.15 ± 30%      +0.2        0.33 ± 45%  perf-profile.children.cycles-pp.bit_putcs
      0.13 ± 33%      +0.2        0.31 ± 50%  perf-profile.children.cycles-pp.cfb_imageblit
      0.13 ± 33%      +0.2        0.31 ± 50%  perf-profile.children.cycles-pp.drm_fb_helper_cfb_imageblit
      0.18 ± 29%      +0.2        0.36 ± 40%  perf-profile.children.cycles-pp.vt_console_print
      0.17 ± 29%      +0.2        0.36 ± 40%  perf-profile.children.cycles-pp.lf
      0.17 ± 29%      +0.2        0.36 ± 40%  perf-profile.children.cycles-pp.con_scroll
      0.17 ± 29%      +0.2        0.36 ± 40%  perf-profile.children.cycles-pp.fbcon_scroll
      0.17 ± 29%      +0.2        0.36 ± 40%  perf-profile.children.cycles-pp.fbcon_redraw
      0.10 ± 36%      +0.3        0.39 ± 67%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.14 ± 36%      +0.3        0.44 ± 58%  perf-profile.children.cycles-pp.page_fault
      0.10 ± 36%      +0.3        0.40 ± 66%  perf-profile.children.cycles-pp.handle_mm_fault
      0.12 ± 29%      +0.3        0.43 ± 58%  perf-profile.children.cycles-pp.do_page_fault
      0.61 ± 37%      +0.5        1.07 ± 14%  perf-profile.children.cycles-pp.do_syscall_64
      0.61 ± 37%      +0.5        1.08 ± 15%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00            +0.5        0.51 ± 21%  perf-profile.children.cycles-pp.exit_to_usermode_loop
      0.06 ±101%      +0.5        0.60 ± 32%  perf-profile.children.cycles-pp.prepare_exit_to_usermode
      0.12 ± 36%      +0.6        0.72 ± 33%  perf-profile.children.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      0.55 ± 44%      +0.6        1.16 ± 34%  perf-profile.children.cycles-pp.smp_apic_timer_interrupt
      0.58 ± 43%      +0.7        1.26 ± 28%  perf-profile.children.cycles-pp.apic_timer_interrupt
      0.01 ±173%      +0.1        0.08 ± 29%  perf-profile.self.cycles-pp.native_write_msr
      0.00            +0.1        0.11 ± 13%  perf-profile.self.cycles-pp.interrupt_entry
      0.13 ± 33%      +0.2        0.31 ± 50%  perf-profile.self.cycles-pp.cfb_imageblit



***************************************************************************************************
lkp-bdw-ex2: 160 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/1/debian-x86_64-20191114.cgz/300s/lkp-bdw-ex2/fstime/unixbench/0xb000038

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4          100%           4:4     dmesg.RIP:_raw_spin_unlock_irqrestore
           :4          100%           4:4     dmesg.RIP:cpuidle_enter_state
           :4           50%           2:4     dmesg.RIP:find_busiest_group
         %stddev     %change         %stddev
             \          |                \  
      1445 ±  4%     -56.4%     630.12        unixbench.score
 2.749e+08 ±  4%     -56.4%  1.198e+08        unixbench.workload
      0.17            +0.0        0.20        mpstat.cpu.all.usr%
      2495 ±136%    +150.6%       6253 ± 88%  proc-vmstat.numa_hint_faults
  12938371 ±169%     -99.1%     120518 ±  8%  cpuidle.POLL.time
    879918 ±150%     -97.2%      24704 ±  4%  cpuidle.POLL.usage
    476955 ± 53%     -74.4%     122050 ±147%  numa-numastat.node3.local_node
    500271 ± 50%     -69.4%     153074 ±117%  numa-numastat.node3.numa_hit
     18344 ± 54%     -73.5%       4868 ±117%  numa-vmstat.node1.nr_active_anon
     18384 ± 54%     -75.7%       4476 ±122%  numa-vmstat.node1.nr_anon_pages
     18344 ± 54%     -73.5%       4868 ±117%  numa-vmstat.node1.nr_zone_active_anon
      7008 ± 92%    +402.1%      35190 ± 53%  numa-vmstat.node3.nr_anon_pages
    453.75 ±  8%     -28.3%     325.25 ±  8%  slabinfo.buffer_head.active_objs
    453.75 ±  8%     -28.3%     325.25 ±  8%  slabinfo.buffer_head.num_objs
      5091 ±  8%     +16.6%       5936 ±  5%  slabinfo.kmalloc-rcl-64.active_objs
      5091 ±  8%     +16.6%       5936 ±  5%  slabinfo.kmalloc-rcl-64.num_objs
     73409 ± 54%     -73.5%      19481 ±117%  numa-meminfo.node1.Active
     73372 ± 54%     -73.5%      19474 ±117%  numa-meminfo.node1.Active(anon)
     73531 ± 54%     -75.6%      17905 ±122%  numa-meminfo.node1.AnonPages
     14527 ±147%    +697.6%     115869 ± 58%  numa-meminfo.node3.AnonHugePages
     28022 ± 92%    +402.2%     140720 ± 53%  numa-meminfo.node3.AnonPages
     14.21 ± 16%    +100.8%      28.54 ±  7%  sched_debug.cfs_rq:/.exec_clock.min
     37067 ±  5%     +32.4%      49069 ± 11%  sched_debug.cfs_rq:/.min_vruntime.avg
     17.55 ± 12%     +22.9%      21.57 ±  7%  sched_debug.cfs_rq:/.runnable_load_avg.avg
    367.53 ±  7%     +25.9%     462.58 ±  9%  sched_debug.cfs_rq:/.runnable_load_avg.max
     73.16 ±  9%     +23.1%      90.05 ±  5%  sched_debug.cfs_rq:/.runnable_load_avg.stddev
      4.60 ±  5%     +99.6%       9.18 ±  2%  sched_debug.cpu.clock.stddev
      4.60 ±  5%     +99.6%       9.18 ±  2%  sched_debug.cpu.clock_task.stddev
      0.00 ±  2%     +50.5%       0.00 ± 27%  sched_debug.cpu.next_balance.stddev
      2059 ± 11%     -36.4%       1309 ± 22%  sched_debug.cpu.nr_switches.min
      2783 ±  6%     -20.4%       2215 ± 11%  sched_debug.cpu.ttwu_local.max
 6.804e+08 ±  2%     -22.5%   5.27e+08 ±  2%  perf-stat.i.branch-instructions
    195.34            -1.6%     192.27        perf-stat.i.cpu-migrations
 1.006e+09 ±  4%     -22.5%  7.793e+08 ±  2%  perf-stat.i.dTLB-loads
 3.301e+09 ±  3%     -23.2%  2.535e+09 ±  2%  perf-stat.i.instructions
      0.26 ± 22%     -36.0%       0.17 ± 25%  perf-stat.i.ipc
     37490 ±  9%     +32.1%      49541 ± 20%  perf-stat.i.node-stores
      0.26 ± 24%     -35.6%       0.17 ± 25%  perf-stat.overall.ipc
      5770 ±  3%     +76.1%      10159        perf-stat.overall.path-length
 6.788e+08 ±  2%     -22.5%   5.26e+08 ±  2%  perf-stat.ps.branch-instructions
    194.95            -1.5%     191.98        perf-stat.ps.cpu-migrations
 1.004e+09 ±  4%     -22.5%  7.777e+08 ±  2%  perf-stat.ps.dTLB-loads
 3.293e+09 ±  3%     -23.2%   2.53e+09 ±  2%  perf-stat.ps.instructions
     37424 ±  9%     +32.2%      49474 ± 20%  perf-stat.ps.node-stores
 1.584e+12 ±  3%     -23.1%  1.217e+12 ±  2%  perf-stat.total.instructions
     71256 ±  3%     +13.5%      80849 ±  4%  softirqs.CPU102.RCU
     72774 ±  5%     +12.3%      81732 ±  4%  softirqs.CPU105.RCU
     72835 ±  4%     +11.6%      81311 ±  4%  softirqs.CPU108.RCU
     73527 ±  3%      +9.8%      80755 ±  4%  softirqs.CPU113.RCU
     72325 ±  5%     +16.2%      84015 ±  8%  softirqs.CPU123.RCU
     72159 ±  5%     +11.5%      80464 ±  4%  softirqs.CPU126.RCU
     72621 ±  5%     +11.1%      80660 ±  4%  softirqs.CPU128.RCU
     71614 ±  6%     +14.0%      81626 ±  4%  softirqs.CPU13.RCU
     71902 ±  4%     +13.0%      81264 ±  4%  softirqs.CPU134.RCU
     72274 ±  4%     +12.3%      81129 ±  4%  softirqs.CPU135.RCU
     72700 ±  3%     +12.0%      81434 ±  4%  softirqs.CPU136.RCU
     72390 ±  4%     +11.5%      80729 ±  4%  softirqs.CPU140.RCU
     72409 ±  4%     +12.2%      81219 ±  5%  softirqs.CPU141.RCU
     72835 ±  4%     +11.2%      81013 ±  4%  softirqs.CPU143.RCU
     72743 ±  4%     +11.6%      81155 ±  5%  softirqs.CPU148.RCU
     73655 ±  4%     +11.2%      81874 ±  5%  softirqs.CPU15.RCU
     73231 ±  5%     +13.3%      82967        softirqs.CPU156.RCU
     72934 ±  5%     +10.2%      80364 ±  4%  softirqs.CPU161.RCU
     72708 ±  4%     +10.3%      80211 ±  4%  softirqs.CPU162.RCU
     72168 ±  4%     +11.1%      80211 ±  4%  softirqs.CPU163.RCU
     72087 ±  4%     +11.4%      80276 ±  4%  softirqs.CPU164.RCU
     72257 ±  4%     +11.2%      80333 ±  4%  softirqs.CPU167.RCU
     71632 ±  4%     +12.3%      80441 ±  4%  softirqs.CPU168.RCU
     72163 ±  4%     +12.4%      81099 ±  5%  softirqs.CPU169.RCU
     72794 ±  4%     +12.3%      81777 ±  5%  softirqs.CPU17.RCU
     71822 ±  4%     +12.2%      80589 ±  4%  softirqs.CPU171.RCU
     69278 ±  9%     +16.2%      80490 ±  5%  softirqs.CPU174.RCU
     71969 ±  4%     +11.3%      80130 ±  5%  softirqs.CPU175.RCU
     72269 ±  4%     +10.8%      80077 ±  4%  softirqs.CPU181.RCU
     73041 ±  3%     +10.3%      80532 ±  4%  softirqs.CPU184.RCU
     72262 ±  4%     +14.2%      82530 ±  7%  softirqs.CPU186.RCU
     72202 ±  3%     +10.8%      79999 ±  4%  softirqs.CPU188.RCU
     73189 ±  3%      +9.9%      80417 ±  4%  softirqs.CPU189.RCU
     72464 ±  4%     +15.3%      83515 ±  6%  softirqs.CPU24.RCU
     73678 ±  7%     +10.7%      81565 ±  4%  softirqs.CPU31.RCU
     73118 ±  4%     +11.9%      81812 ±  4%  softirqs.CPU32.RCU
     73872 ±  5%     +12.7%      83260 ±  4%  softirqs.CPU4.RCU
     73164 ±  4%     +12.5%      82332 ±  4%  softirqs.CPU40.RCU
     73858 ±  4%     +10.5%      81603 ±  4%  softirqs.CPU42.RCU
     73229 ±  4%     +11.9%      81978 ±  4%  softirqs.CPU44.RCU
     73597 ±  5%     +13.0%      83155 ±  3%  softirqs.CPU47.RCU
     73284 ±  4%     +12.1%      82124 ±  4%  softirqs.CPU48.RCU
     73168 ±  3%     +12.2%      82108 ±  4%  softirqs.CPU6.RCU
     72938 ±  4%     +11.3%      81164 ±  4%  softirqs.CPU68.RCU
     73553 ±  4%     +13.0%      83098 ±  5%  softirqs.CPU7.RCU
     72976 ±  4%     +11.1%      81057 ±  4%  softirqs.CPU71.RCU
     73230 ±  4%     +12.2%      82174 ±  5%  softirqs.CPU72.RCU
     73182 ±  4%     +16.0%      84872 ±  4%  softirqs.CPU74.RCU
     72627 ±  4%     +11.8%      81180 ±  4%  softirqs.CPU75.RCU
     72491 ±  4%     +15.7%      83893 ±  9%  softirqs.CPU76.RCU
     72600 ±  4%     +12.5%      81707 ±  4%  softirqs.CPU77.RCU
     72595 ±  4%     +15.2%      83616 ±  7%  softirqs.CPU78.RCU
     72625 ±  4%     +11.7%      81128 ±  4%  softirqs.CPU83.RCU
     73515 ±  4%     +11.0%      81610 ±  4%  softirqs.CPU85.RCU
     73524 ±  3%     +11.0%      81621 ±  4%  softirqs.CPU91.RCU
     72870 ±  4%     +11.2%      81049 ±  4%  softirqs.CPU92.RCU
     38802 ± 33%     -33.8%      25684 ±  4%  softirqs.CPU95.SCHED
     73789 ±  6%      +9.7%      80914 ±  4%  softirqs.CPU98.RCU
     73217 ±  4%     +10.5%      80907 ±  4%  softirqs.CPU99.RCU
      5.46 ± 18%      -3.3        2.17 ± 34%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      5.38 ± 18%      -3.2        2.13 ± 34%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.78 ± 18%      -1.2        0.59 ± 67%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.66 ± 18%      -1.1        0.52 ± 64%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.34 ± 19%      -0.9        0.47 ± 63%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.26 ±  3%      +0.3        1.52 ±  9%  perf-profile.calltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues
      0.74 ± 18%      +0.3        1.05 ± 20%  perf-profile.calltrace.cycles-pp.rcu_sched_clock_irq.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues
      0.27 ±100%      +0.4        0.62 ±  8%  perf-profile.calltrace.cycles-pp.enqueue_hrtimer.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt
      0.34 ±106%      +0.5        0.84 ± 12%  perf-profile.calltrace.cycles-pp.tick_check_oneshot_broadcast_this_cpu.tick_irq_enter.irq_enter.smp_apic_timer_interrupt.apic_timer_interrupt
      2.78 ±  7%      +0.7        3.52 ± 10%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
      3.81 ±  4%      +0.8        4.58 ±  7%  perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt
      3.10 ±  9%      +0.8        3.91 ±  9%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interrupt
      6.77 ±  5%      +1.0        7.80 ±  7%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state
     90.95            +4.5       95.47        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     91.04            +4.6       95.59        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
     91.04            +4.6       95.59        perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64
     91.47            +4.6       96.07        perf-profile.calltrace.cycles-pp.secondary_startup_64
     78.61 ±  3%      +5.7       84.33 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary
      5.83 ± 17%      -3.4        2.44 ± 32%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      5.75 ± 18%      -3.4        2.40 ± 32%  perf-profile.children.cycles-pp.do_syscall_64
      1.82 ± 19%      -1.1        0.71 ± 36%  perf-profile.children.cycles-pp.ksys_write
      1.70 ± 19%      -1.1        0.64 ± 32%  perf-profile.children.cycles-pp.vfs_write
      1.41 ± 20%      -0.9        0.54 ± 36%  perf-profile.children.cycles-pp.new_sync_write
      1.35 ± 20%      -0.8        0.51 ± 36%  perf-profile.children.cycles-pp.generic_file_write_iter
      1.43 ± 18%      -0.8        0.61 ± 38%  perf-profile.children.cycles-pp.ksys_read
      1.29 ± 20%      -0.7        0.54 ± 36%  perf-profile.children.cycles-pp.vfs_read
      1.14 ± 20%      -0.7        0.43 ± 36%  perf-profile.children.cycles-pp.__generic_file_write_iter
      0.92 ± 20%      -0.6        0.36 ± 33%  perf-profile.children.cycles-pp.generic_perform_write
      0.90 ± 19%      -0.5        0.36 ± 39%  perf-profile.children.cycles-pp.new_sync_read
      0.84 ± 19%      -0.5        0.33 ± 37%  perf-profile.children.cycles-pp.generic_file_read_iter
      0.76 ± 16%      -0.5        0.31 ± 37%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.74 ± 14%      -0.4        0.30 ± 41%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.49 ± 12%      -0.3        0.23 ± 17%  perf-profile.children.cycles-pp.serial8250_console_write
      0.48 ± 12%      -0.3        0.22 ± 15%  perf-profile.children.cycles-pp.uart_console_write
      0.47 ± 11%      -0.2        0.22 ± 17%  perf-profile.children.cycles-pp.wait_for_xmitr
      0.51 ± 12%      -0.2        0.26 ± 13%  perf-profile.children.cycles-pp.console_unlock
      0.46 ± 11%      -0.2        0.21 ± 17%  perf-profile.children.cycles-pp.serial8250_console_putchar
      0.41 ± 27%      -0.2        0.17 ± 33%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      0.55 ±  9%      -0.2        0.32 ± 11%  perf-profile.children.cycles-pp.irq_work_run_list
      0.38 ± 18%      -0.2        0.16 ± 39%  perf-profile.children.cycles-pp.pagecache_get_page
      0.33 ± 21%      -0.2        0.11 ± 31%  perf-profile.children.cycles-pp.security_file_permission
      0.36 ± 27%      -0.2        0.15 ± 38%  perf-profile.children.cycles-pp.copy_page_to_iter
      0.42 ±  5%      -0.2        0.22 ±  8%  perf-profile.children.cycles-pp.irq_work_run
      0.42 ±  5%      -0.2        0.22 ±  8%  perf-profile.children.cycles-pp.printk
      0.42 ±  5%      -0.2        0.22 ±  8%  perf-profile.children.cycles-pp.vprintk_emit
      0.42 ±  5%      -0.2        0.23 ±  9%  perf-profile.children.cycles-pp.irq_work_interrupt
      0.42 ±  5%      -0.2        0.23 ±  9%  perf-profile.children.cycles-pp.smp_irq_work_interrupt
      0.35 ± 26%      -0.2        0.16 ± 20%  perf-profile.children.cycles-pp.io_serial_in
      0.26 ± 26%      -0.2        0.08 ± 31%  perf-profile.children.cycles-pp.common_file_perm
      0.26 ± 16%      -0.2        0.09 ± 28%  perf-profile.children.cycles-pp.simple_write_end
      0.28 ± 20%      -0.2        0.12 ± 41%  perf-profile.children.cycles-pp.find_get_entry
      0.25 ± 28%      -0.1        0.10 ± 31%  perf-profile.children.cycles-pp.copyout
      0.24 ± 16%      -0.1        0.10 ± 36%  perf-profile.children.cycles-pp.simple_write_begin
      0.21 ± 19%      -0.1        0.09 ± 29%  perf-profile.children.cycles-pp.grab_cache_page_write_begin
      0.20 ± 20%      -0.1        0.07 ± 62%  perf-profile.children.cycles-pp.iov_iter_copy_from_user_atomic
      0.33 ±  7%      -0.1        0.21 ± 18%  perf-profile.children.cycles-pp.ret_from_fork
      0.33 ±  7%      -0.1        0.21 ± 18%  perf-profile.children.cycles-pp.kthread
      0.24 ± 19%      -0.1        0.13 ± 26%  perf-profile.children.cycles-pp.worker_thread
      0.24 ± 18%      -0.1        0.13 ± 26%  perf-profile.children.cycles-pp.process_one_work
      0.23 ± 19%      -0.1        0.13 ± 26%  perf-profile.children.cycles-pp.drm_fb_helper_dirty_work
      0.17 ± 20%      -0.1        0.06 ± 64%  perf-profile.children.cycles-pp.copyin
      0.23 ± 19%      -0.1        0.13 ± 28%  perf-profile.children.cycles-pp.memcpy_erms
      0.14 ± 18%      -0.1        0.04 ± 58%  perf-profile.children.cycles-pp.xas_load
      0.12 ± 30%      -0.1        0.04 ±107%  perf-profile.children.cycles-pp.___might_sleep
      0.12 ± 17%      -0.1        0.06 ± 58%  perf-profile.children.cycles-pp.delay_tsc
      0.10 ± 12%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.tick_check_broadcast_expired
      0.14 ± 21%      +0.0        0.18 ±  6%  perf-profile.children.cycles-pp.irq_work_needs_cpu
      0.07 ± 60%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.cpuidle_not_available
      0.06 ± 63%      +0.1        0.11 ±  3%  perf-profile.children.cycles-pp.sched_clock_idle_wakeup_event
      0.00            +0.1        0.06 ± 14%  perf-profile.children.cycles-pp.invoke_rcu_core
      0.23 ± 10%      +0.1        0.30 ±  8%  perf-profile.children.cycles-pp.__hrtimer_get_next_event
      0.15 ± 31%      +0.1        0.21 ±  5%  perf-profile.children.cycles-pp.rb_insert_color
      0.19 ± 29%      +0.1        0.30 ± 14%  perf-profile.children.cycles-pp.run_local_timers
      0.45 ± 10%      +0.1        0.57 ±  9%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.38 ± 26%      +0.2        0.56 ±  7%  perf-profile.children.cycles-pp.timerqueue_add
      1.31 ±  5%      +0.3        1.56 ± 10%  perf-profile.children.cycles-pp.scheduler_tick
      0.57 ± 33%      +0.3        0.86 ± 12%  perf-profile.children.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.78 ± 17%      +0.3        1.08 ± 20%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      2.93 ±  9%      +0.7        3.59 ± 10%  perf-profile.children.cycles-pp.update_process_times
      3.95 ±  7%      +0.7        4.64 ±  7%  perf-profile.children.cycles-pp.tick_sched_timer
      3.23 ± 10%      +0.7        3.97 ±  8%  perf-profile.children.cycles-pp.tick_sched_handle
      6.95 ±  6%      +1.0        7.91 ±  7%  perf-profile.children.cycles-pp.__hrtimer_run_queues
     91.04            +4.6       95.59        perf-profile.children.cycles-pp.start_secondary
     91.52            +4.6       96.10        perf-profile.children.cycles-pp.do_idle
     91.47            +4.6       96.07        perf-profile.children.cycles-pp.secondary_startup_64
     91.47            +4.6       96.07        perf-profile.children.cycles-pp.cpu_startup_entry
      2.13 ± 18%      -1.3        0.83 ± 30%  perf-profile.self.cycles-pp.do_syscall_64
      0.75 ± 16%      -0.4        0.31 ± 37%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.73 ± 15%      -0.4        0.30 ± 41%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.73 ± 33%      -0.3        0.41 ± 10%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.40 ± 28%      -0.2        0.17 ± 31%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      0.31 ±  8%      -0.2        0.15 ± 15%  perf-profile.self.cycles-pp.io_serial_in
      0.23 ± 19%      -0.1        0.11 ± 14%  perf-profile.self.cycles-pp.memcpy_erms
      0.18 ± 15%      -0.1        0.06 ± 60%  perf-profile.self.cycles-pp.generic_file_read_iter
      0.19 ± 26%      -0.1        0.07 ± 30%  perf-profile.self.cycles-pp.common_file_perm
      0.14 ± 22%      -0.1        0.06 ± 63%  perf-profile.self.cycles-pp.find_get_entry
      0.13 ±  9%      -0.1        0.06 ± 74%  perf-profile.self.cycles-pp.__fget_light
      0.10 ± 28%      -0.1        0.03 ±105%  perf-profile.self.cycles-pp.___might_sleep
      0.12 ± 17%      -0.1        0.06 ± 58%  perf-profile.self.cycles-pp.delay_tsc
      0.12 ± 12%      +0.0        0.15 ±  4%  perf-profile.self.cycles-pp.irq_exit
      0.12 ± 11%      +0.0        0.17 ±  6%  perf-profile.self.cycles-pp.tick_nohz_tick_stopped
      0.21 ± 11%      +0.0        0.26 ± 13%  perf-profile.self.cycles-pp.update_rq_clock
      0.07 ± 62%      +0.0        0.12 ±  6%  perf-profile.self.cycles-pp.cpuidle_not_available
      0.15 ± 29%      +0.1        0.20 ±  4%  perf-profile.self.cycles-pp.rb_insert_color
      0.04 ±100%      +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.sched_clock_idle_wakeup_event
      0.22 ± 16%      +0.1        0.29 ±  3%  perf-profile.self.cycles-pp.native_apic_mem_write
      0.15 ± 34%      +0.1        0.22 ± 15%  perf-profile.self.cycles-pp.run_local_timers
      0.55 ±  6%      +0.1        0.64 ± 11%  perf-profile.self.cycles-pp.do_idle
      0.23 ± 26%      +0.1        0.35 ± 11%  perf-profile.self.cycles-pp.timerqueue_add
      0.57 ± 34%      +0.3        0.86 ± 12%  perf-profile.self.cycles-pp.tick_check_oneshot_broadcast_this_cpu
    237.75 ±  2%     +12.6%     267.75 ± 11%  interrupts.75:PCI-MSI.1572888-edge.eth0-TxRx-24
    155594           -70.7%      45567 ±139%  interrupts.CAL:Function_call_interrupts
    418.75           -68.5%     132.00 ±124%  interrupts.CPU0.CAL:Function_call_interrupts
    808.25           -71.6%     229.25 ±145%  interrupts.CPU1.CAL:Function_call_interrupts
    809.00           -63.9%     292.00 ±106%  interrupts.CPU100.CAL:Function_call_interrupts
    809.00           -71.1%     233.75 ±141%  interrupts.CPU101.CAL:Function_call_interrupts
    808.50           -71.1%     233.50 ±141%  interrupts.CPU102.CAL:Function_call_interrupts
    868.25 ± 11%     -73.1%     233.50 ±141%  interrupts.CPU103.CAL:Function_call_interrupts
    808.75           -71.1%     233.50 ±141%  interrupts.CPU104.CAL:Function_call_interrupts
    155.00 ± 28%     +57.7%     244.50 ± 21%  interrupts.CPU104.NMI:Non-maskable_interrupts
    155.00 ± 28%     +57.7%     244.50 ± 21%  interrupts.CPU104.PMI:Performance_monitoring_interrupts
    808.50           -71.5%     230.25 ±144%  interrupts.CPU105.CAL:Function_call_interrupts
    809.50           -70.8%     236.25 ±140%  interrupts.CPU106.CAL:Function_call_interrupts
    809.00           -71.1%     233.75 ±141%  interrupts.CPU107.CAL:Function_call_interrupts
    809.25           -71.1%     233.50 ±141%  interrupts.CPU108.CAL:Function_call_interrupts
    809.00           -71.1%     233.75 ±141%  interrupts.CPU109.CAL:Function_call_interrupts
     12.00 ± 61%   +1785.4%     226.25 ± 76%  interrupts.CPU109.RES:Rescheduling_interrupts
    808.00           -71.2%     232.50 ±142%  interrupts.CPU11.CAL:Function_call_interrupts
    809.00           -71.2%     233.25 ±142%  interrupts.CPU110.CAL:Function_call_interrupts
    153.00 ± 28%     +64.1%     251.00 ± 20%  interrupts.CPU110.NMI:Non-maskable_interrupts
    153.00 ± 28%     +64.1%     251.00 ± 20%  interrupts.CPU110.PMI:Performance_monitoring_interrupts
    809.00           -71.1%     233.75 ±141%  interrupts.CPU111.CAL:Function_call_interrupts
      6.50 ± 59%   +1669.2%     115.00 ± 96%  interrupts.CPU111.RES:Rescheduling_interrupts
    809.00           -71.1%     233.50 ±141%  interrupts.CPU112.CAL:Function_call_interrupts
      7.50 ± 65%    +986.7%      81.50 ±114%  interrupts.CPU112.RES:Rescheduling_interrupts
    809.00           -71.2%     232.75 ±142%  interrupts.CPU113.CAL:Function_call_interrupts
    809.00           -71.1%     233.75 ±141%  interrupts.CPU114.CAL:Function_call_interrupts
    154.75 ± 27%     +61.6%     250.00 ± 20%  interrupts.CPU114.NMI:Non-maskable_interrupts
    154.75 ± 27%     +61.6%     250.00 ± 20%  interrupts.CPU114.PMI:Performance_monitoring_interrupts
    808.25           -71.1%     233.75 ±141%  interrupts.CPU115.CAL:Function_call_interrupts
    138.75 ± 38%     +83.8%     255.00 ± 23%  interrupts.CPU115.NMI:Non-maskable_interrupts
    138.75 ± 38%     +83.8%     255.00 ± 23%  interrupts.CPU115.PMI:Performance_monitoring_interrupts
    808.75           -71.1%     233.50 ±141%  interrupts.CPU116.CAL:Function_call_interrupts
    135.75 ± 40%     +85.1%     251.25 ± 22%  interrupts.CPU116.NMI:Non-maskable_interrupts
    135.75 ± 40%     +85.1%     251.25 ± 22%  interrupts.CPU116.PMI:Performance_monitoring_interrupts
    809.00           -71.1%     233.50 ±141%  interrupts.CPU117.CAL:Function_call_interrupts
    137.50 ± 40%    +313.1%     568.00 ± 90%  interrupts.CPU117.NMI:Non-maskable_interrupts
    137.50 ± 40%    +313.1%     568.00 ± 90%  interrupts.CPU117.PMI:Performance_monitoring_interrupts
    809.00           -71.1%     234.00 ±141%  interrupts.CPU118.CAL:Function_call_interrupts
     12.00 ± 63%    +333.3%      52.00 ±101%  interrupts.CPU118.RES:Rescheduling_interrupts
    809.00           -71.1%     233.75 ±141%  interrupts.CPU119.CAL:Function_call_interrupts
    808.00           -71.2%     232.50 ±142%  interrupts.CPU12.CAL:Function_call_interrupts
    809.00           -71.2%     233.00 ±142%  interrupts.CPU120.CAL:Function_call_interrupts
    142.25 ± 40%     +72.6%     245.50 ± 16%  interrupts.CPU120.NMI:Non-maskable_interrupts
    142.25 ± 40%     +72.6%     245.50 ± 16%  interrupts.CPU120.PMI:Performance_monitoring_interrupts
    809.00           -71.2%     233.25 ±142%  interrupts.CPU121.CAL:Function_call_interrupts
    809.00           -71.1%     233.50 ±141%  interrupts.CPU122.CAL:Function_call_interrupts
    135.25 ± 41%     +77.8%     240.50 ± 18%  interrupts.CPU122.NMI:Non-maskable_interrupts
    135.25 ± 41%     +77.8%     240.50 ± 18%  interrupts.CPU122.PMI:Performance_monitoring_interrupts
    809.00           -71.1%     233.50 ±141%  interrupts.CPU123.CAL:Function_call_interrupts
    133.50 ± 42%     +79.2%     239.25 ± 16%  interrupts.CPU123.NMI:Non-maskable_interrupts
    133.50 ± 42%     +79.2%     239.25 ± 16%  interrupts.CPU123.PMI:Performance_monitoring_interrupts
    808.75           -71.1%     233.50 ±141%  interrupts.CPU124.CAL:Function_call_interrupts
    809.50           -71.2%     233.50 ±141%  interrupts.CPU125.CAL:Function_call_interrupts
    809.25           -71.1%     233.50 ±141%  interrupts.CPU126.CAL:Function_call_interrupts
    808.50           -71.1%     233.50 ±141%  interrupts.CPU127.CAL:Function_call_interrupts
    810.00           -71.1%     233.75 ±141%  interrupts.CPU128.CAL:Function_call_interrupts
    809.25           -71.1%     233.50 ±141%  interrupts.CPU129.CAL:Function_call_interrupts
    808.00           -71.2%     232.50 ±142%  interrupts.CPU13.CAL:Function_call_interrupts
    809.00           -71.1%     233.75 ±141%  interrupts.CPU130.CAL:Function_call_interrupts
    809.25           -71.1%     233.50 ±141%  interrupts.CPU131.CAL:Function_call_interrupts
    809.25           -71.1%     233.50 ±141%  interrupts.CPU133.CAL:Function_call_interrupts
    808.50           -71.1%     233.50 ±141%  interrupts.CPU134.CAL:Function_call_interrupts
    809.25           -71.1%     233.50 ±141%  interrupts.CPU135.CAL:Function_call_interrupts
    809.25           -71.1%     233.50 ±141%  interrupts.CPU136.CAL:Function_call_interrupts
    811.25           -71.2%     233.50 ±141%  interrupts.CPU137.CAL:Function_call_interrupts
    809.00           -71.1%     233.50 ±141%  interrupts.CPU138.CAL:Function_call_interrupts
    809.25           -71.1%     233.50 ±141%  interrupts.CPU139.CAL:Function_call_interrupts
    867.00 ± 11%     -73.2%     232.25 ±142%  interrupts.CPU14.CAL:Function_call_interrupts
    809.25           -71.1%     233.50 ±141%  interrupts.CPU140.CAL:Function_call_interrupts
    809.25           -71.1%     233.50 ±141%  interrupts.CPU141.CAL:Function_call_interrupts
    809.25           -71.2%     233.00 ±142%  interrupts.CPU142.CAL:Function_call_interrupts
    809.25           -71.1%     233.50 ±141%  interrupts.CPU143.CAL:Function_call_interrupts
    809.00           -71.1%     233.75 ±141%  interrupts.CPU144.CAL:Function_call_interrupts
    808.50           -71.1%     233.75 ±141%  interrupts.CPU145.CAL:Function_call_interrupts
    809.25           -70.4%     239.50 ±136%  interrupts.CPU146.CAL:Function_call_interrupts
    809.00           -70.4%     239.25 ±137%  interrupts.CPU147.CAL:Function_call_interrupts
    809.25           -70.4%     239.50 ±137%  interrupts.CPU148.CAL:Function_call_interrupts
    809.25           -70.4%     239.25 ±137%  interrupts.CPU149.CAL:Function_call_interrupts
    808.00           -71.2%     233.00 ±142%  interrupts.CPU15.CAL:Function_call_interrupts
    820.75           -70.1%     245.00 ±137%  interrupts.CPU155.CAL:Function_call_interrupts
    823.75           -70.3%     245.00 ±137%  interrupts.CPU156.CAL:Function_call_interrupts
    832.25           -70.6%     245.00 ±137%  interrupts.CPU157.CAL:Function_call_interrupts
    832.00           -70.6%     245.00 ±137%  interrupts.CPU158.CAL:Function_call_interrupts
    832.75           -70.6%     245.00 ±137%  interrupts.CPU159.CAL:Function_call_interrupts
    805.00           -71.1%     232.25 ±142%  interrupts.CPU16.CAL:Function_call_interrupts
    832.25           -70.6%     245.00 ±137%  interrupts.CPU160.CAL:Function_call_interrupts
    832.50           -70.6%     245.00 ±137%  interrupts.CPU161.CAL:Function_call_interrupts
    832.75           -70.6%     244.50 ±138%  interrupts.CPU162.CAL:Function_call_interrupts
    833.50           -70.6%     245.25 ±137%  interrupts.CPU163.CAL:Function_call_interrupts
    832.50           -70.6%     245.00 ±137%  interrupts.CPU164.CAL:Function_call_interrupts
    832.50           -70.6%     244.75 ±138%  interrupts.CPU165.CAL:Function_call_interrupts
    832.25           -70.5%     245.50 ±137%  interrupts.CPU166.CAL:Function_call_interrupts
    832.25           -70.1%     249.00 ±134%  interrupts.CPU167.CAL:Function_call_interrupts
    832.50           -69.3%     255.50 ±129%  interrupts.CPU168.CAL:Function_call_interrupts
    543.50 ± 30%     -70.6%     159.75 ±103%  interrupts.CPU169.CAL:Function_call_interrupts
    810.00           -71.3%     232.75 ±142%  interrupts.CPU17.CAL:Function_call_interrupts
    832.25           -69.1%     256.75 ±128%  interrupts.CPU170.CAL:Function_call_interrupts
    832.25           -69.2%     256.50 ±129%  interrupts.CPU171.CAL:Function_call_interrupts
    832.25           -69.2%     256.50 ±129%  interrupts.CPU172.CAL:Function_call_interrupts
    832.25           -69.2%     256.50 ±129%  interrupts.CPU173.CAL:Function_call_interrupts
    832.75           -69.2%     256.50 ±129%  interrupts.CPU174.CAL:Function_call_interrupts
    832.50           -69.2%     256.50 ±129%  interrupts.CPU175.CAL:Function_call_interrupts
    224.50 ±111%     -92.1%      17.75 ±127%  interrupts.CPU175.RES:Rescheduling_interrupts
    833.00           -69.2%     256.50 ±129%  interrupts.CPU176.CAL:Function_call_interrupts
    832.00           -69.2%     256.50 ±129%  interrupts.CPU177.CAL:Function_call_interrupts
    832.75           -69.2%     256.50 ±129%  interrupts.CPU178.CAL:Function_call_interrupts
    833.00           -69.2%     256.50 ±129%  interrupts.CPU179.CAL:Function_call_interrupts
    808.00           -63.9%     291.50 ±106%  interrupts.CPU18.CAL:Function_call_interrupts
    833.00           -69.2%     256.50 ±129%  interrupts.CPU180.CAL:Function_call_interrupts
    833.00           -69.2%     256.50 ±129%  interrupts.CPU181.CAL:Function_call_interrupts
    833.00           -69.2%     256.50 ±129%  interrupts.CPU182.CAL:Function_call_interrupts
    832.50           -69.2%     256.50 ±129%  interrupts.CPU183.CAL:Function_call_interrupts
    834.25           -69.3%     256.50 ±129%  interrupts.CPU184.CAL:Function_call_interrupts
    833.75           -69.2%     256.75 ±128%  interrupts.CPU186.CAL:Function_call_interrupts
    834.00           -69.2%     256.75 ±129%  interrupts.CPU187.CAL:Function_call_interrupts
    833.75           -69.2%     257.00 ±129%  interrupts.CPU188.CAL:Function_call_interrupts
    834.00           -69.1%     257.50 ±129%  interrupts.CPU189.CAL:Function_call_interrupts
    807.75           -71.2%     232.50 ±142%  interrupts.CPU19.CAL:Function_call_interrupts
    834.00           -69.1%     257.75 ±128%  interrupts.CPU190.CAL:Function_call_interrupts
    828.50           -69.4%     253.25 ±130%  interrupts.CPU191.CAL:Function_call_interrupts
    808.00           -71.6%     229.75 ±144%  interrupts.CPU2.CAL:Function_call_interrupts
    807.75           -71.2%     232.75 ±142%  interrupts.CPU20.CAL:Function_call_interrupts
    808.00           -71.2%     232.50 ±142%  interrupts.CPU21.CAL:Function_call_interrupts
    808.00           -71.2%     232.50 ±142%  interrupts.CPU22.CAL:Function_call_interrupts
    808.00           -71.3%     232.00 ±142%  interrupts.CPU23.CAL:Function_call_interrupts
    237.75 ±  2%     +12.6%     267.75 ± 11%  interrupts.CPU24.75:PCI-MSI.1572888-edge.eth0-TxRx-24
    808.00           -71.2%     232.50 ±142%  interrupts.CPU24.CAL:Function_call_interrupts
    808.25           -71.2%     232.50 ±142%  interrupts.CPU25.CAL:Function_call_interrupts
    808.00           -71.2%     232.50 ±142%  interrupts.CPU26.CAL:Function_call_interrupts
    808.00           -71.2%     232.50 ±142%  interrupts.CPU27.CAL:Function_call_interrupts
    808.00           -71.2%     232.50 ±142%  interrupts.CPU28.CAL:Function_call_interrupts
    808.00           -71.2%     232.50 ±142%  interrupts.CPU29.CAL:Function_call_interrupts
      2938 ±171%     -99.5%      13.75 ± 85%  interrupts.CPU29.RES:Rescheduling_interrupts
    808.00           -71.2%     232.75 ±142%  interrupts.CPU3.CAL:Function_call_interrupts
      6192 ±147%     -99.3%      43.25 ± 67%  interrupts.CPU3.RES:Rescheduling_interrupts
    808.00           -71.2%     232.75 ±142%  interrupts.CPU30.CAL:Function_call_interrupts
    810.00           -71.3%     232.75 ±142%  interrupts.CPU31.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU32.CAL:Function_call_interrupts
    925.50 ± 12%     -74.8%     233.50 ±141%  interrupts.CPU33.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU34.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU35.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU36.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU37.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU38.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU39.CAL:Function_call_interrupts
    805.00           -71.1%     232.50 ±142%  interrupts.CPU4.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU40.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU41.CAL:Function_call_interrupts
    807.75           -71.1%     233.50 ±141%  interrupts.CPU42.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU43.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU44.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU45.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU46.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU47.CAL:Function_call_interrupts
    808.00           -71.2%     232.75 ±142%  interrupts.CPU48.CAL:Function_call_interrupts
    808.00           -71.1%     233.75 ±141%  interrupts.CPU49.CAL:Function_call_interrupts
    807.75           -71.2%     232.50 ±142%  interrupts.CPU5.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU50.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU51.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU52.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU53.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU54.CAL:Function_call_interrupts
    808.25           -71.1%     233.50 ±141%  interrupts.CPU55.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU56.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU57.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU58.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU59.CAL:Function_call_interrupts
    806.25           -71.2%     232.50 ±142%  interrupts.CPU6.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU60.CAL:Function_call_interrupts
    808.00           -71.1%     233.75 ±141%  interrupts.CPU61.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU62.CAL:Function_call_interrupts
    808.00           -71.1%     233.75 ±141%  interrupts.CPU63.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU64.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU65.CAL:Function_call_interrupts
    807.50           -71.1%     233.25 ±142%  interrupts.CPU66.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU67.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU68.CAL:Function_call_interrupts
    808.00           -71.1%     233.25 ±142%  interrupts.CPU69.CAL:Function_call_interrupts
    806.50           -71.2%     232.50 ±142%  interrupts.CPU7.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU70.CAL:Function_call_interrupts
    808.00           -71.1%     233.50 ±141%  interrupts.CPU71.CAL:Function_call_interrupts
    808.25           -71.1%     233.50 ±141%  interrupts.CPU72.CAL:Function_call_interrupts
    808.50           -71.1%     233.50 ±141%  interrupts.CPU74.CAL:Function_call_interrupts
    808.25           -71.1%     233.50 ±141%  interrupts.CPU75.CAL:Function_call_interrupts
    808.75           -70.9%     235.50 ±140%  interrupts.CPU76.CAL:Function_call_interrupts
    808.75           -71.1%     233.50 ±141%  interrupts.CPU77.CAL:Function_call_interrupts
    808.75           -71.1%     233.50 ±141%  interrupts.CPU78.CAL:Function_call_interrupts
    808.50           -71.1%     233.50 ±141%  interrupts.CPU79.CAL:Function_call_interrupts
    807.75           -71.2%     232.50 ±142%  interrupts.CPU8.CAL:Function_call_interrupts
    809.00           -71.1%     233.50 ±141%  interrupts.CPU80.CAL:Function_call_interrupts
    808.75           -71.1%     233.50 ±141%  interrupts.CPU81.CAL:Function_call_interrupts
    808.75           -71.1%     233.50 ±141%  interrupts.CPU82.CAL:Function_call_interrupts
    809.00           -71.1%     233.50 ±141%  interrupts.CPU83.CAL:Function_call_interrupts
    809.00           -71.1%     233.75 ±141%  interrupts.CPU84.CAL:Function_call_interrupts
    809.00           -71.1%     233.50 ±141%  interrupts.CPU85.CAL:Function_call_interrupts
    809.00           -70.9%     235.50 ±140%  interrupts.CPU86.CAL:Function_call_interrupts
    808.75           -71.1%     233.50 ±141%  interrupts.CPU87.CAL:Function_call_interrupts
    808.75           -71.1%     233.50 ±141%  interrupts.CPU88.CAL:Function_call_interrupts
    809.00           -70.9%     235.25 ±140%  interrupts.CPU89.CAL:Function_call_interrupts
    808.00           -71.0%     234.50 ±140%  interrupts.CPU9.CAL:Function_call_interrupts
    809.00           -71.1%     234.00 ±141%  interrupts.CPU90.CAL:Function_call_interrupts
    809.00           -71.1%     233.50 ±141%  interrupts.CPU92.CAL:Function_call_interrupts
    809.00           -71.1%     233.50 ±141%  interrupts.CPU93.CAL:Function_call_interrupts
    809.00           -71.1%     233.50 ±141%  interrupts.CPU94.CAL:Function_call_interrupts
    811.00           -71.2%     233.25 ±142%  interrupts.CPU95.CAL:Function_call_interrupts
    809.25           -71.1%     233.75 ±141%  interrupts.CPU96.CAL:Function_call_interrupts
    809.00           -71.4%     231.00 ±140%  interrupts.CPU97.CAL:Function_call_interrupts
    809.00           -71.2%     233.25 ±142%  interrupts.CPU98.CAL:Function_call_interrupts



***************************************************************************************************
lkp-bdw-ex2: 160 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/debian-x86_64-20191114.cgz/lkp-bdw-ex2/pread3/will-it-scale/0xb000038

commit: 
  da26170b95 ("ACPI: Convert to new X86 CPU match macros")
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")

da26170b95feab87 06c4d00466eb374841bc84c39af 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :4           50%           2:4     dmesg.RIP:_raw_spin_unlock_irqrestore
           :4          100%           4:4     dmesg.RIP:cpuidle_enter_state
           :4           50%           2:4     dmesg.RIP:find_busiest_group
           :4           25%           1:4     dmesg.RIP:idle_cpu
           :4           25%           1:4     dmesg.WARNING:at_ip__fsnotify_parent/0x
         %stddev     %change         %stddev
             \          |                \  
    873611 ±  2%     -56.6%     379265        will-it-scale.per_process_ops
    837152           -56.6%     363605        will-it-scale.per_thread_ops
    315.75            +2.3%     323.03        will-it-scale.time.elapsed_time
    315.75            +2.3%     323.03        will-it-scale.time.elapsed_time.max
     19202            +1.9%      19575        will-it-scale.time.involuntary_context_switches
      3468            +1.4%       3517        will-it-scale.time.percent_of_cpu_this_job_got
      5168            +6.9%       5523        will-it-scale.time.user_time
 6.925e+08           -56.3%  3.028e+08        will-it-scale.workload
     26.54           +16.3%      30.87 ± 12%  boot-time.dhcp
    270525 ±142%     -96.7%       9017 ± 23%  cpuidle.POLL.usage
     64251 ±  8%     -18.1%      52616        meminfo.Shmem
      9631 ± 37%     -35.5%       6216 ± 16%  numa-meminfo.node0.Mapped
     42482 ± 20%     -40.7%      25186 ± 11%  numa-meminfo.node3.Shmem
      2424 ± 36%     -35.9%       1554 ± 16%  numa-vmstat.node0.nr_mapped
     10611 ± 20%     -40.8%       6286 ± 12%  numa-vmstat.node3.nr_shmem
     63853 ±115%    +136.8%     151192 ± 94%  sched_debug.cfs_rq:/.runnable_weight.max
   1307278 ±  8%     -35.3%     846161 ± 21%  sched_debug.cfs_rq:/.spread0.avg
  -2142185           +15.1%   -2465630        sched_debug.cfs_rq:/.spread0.min
    250.38 ±  5%     +12.9%     282.77 ±  2%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    114087 ± 31%    +175.4%     314198 ± 17%  sched_debug.cpu.avg_idle.min
      8.23 ±  8%    +134.3%      19.27 ±  7%  sched_debug.cpu.clock.stddev
      8.23 ±  8%    +134.3%      19.27 ±  7%  sched_debug.cpu.clock_task.stddev
      1824 ±  7%     -41.4%       1068 ± 13%  sched_debug.cpu.nr_switches.min
    156.58 ±  3%     +14.9%     179.88 ±  7%  sched_debug.cpu.nr_uninterruptible.max
      8030 ±  4%     +11.3%       8940 ±  3%  slabinfo.Acpi-State.active_objs
      8030 ±  4%     +11.3%       8940 ±  3%  slabinfo.Acpi-State.num_objs
      1086 ±  6%     +11.8%       1214 ±  2%  slabinfo.kmem_cache_node.active_objs
      1455 ±  5%     -11.2%       1292 ±  2%  slabinfo.skbuff_ext_cache.active_objs
      1455 ±  5%     -11.2%       1292 ±  2%  slabinfo.skbuff_ext_cache.num_objs
    664.25 ±  5%     +44.9%     962.50 ± 11%  slabinfo.skbuff_fclone_cache.active_objs
    664.25 ±  5%     +44.9%     962.50 ± 11%  slabinfo.skbuff_fclone_cache.num_objs
      1075 ± 10%     -21.5%     844.25 ± 18%  slabinfo.task_group.active_objs
      1075 ± 10%     -21.5%     844.25 ± 18%  slabinfo.task_group.num_objs
     88339            -3.5%      85206        proc-vmstat.nr_active_anon
     99.25 ±  2%      -9.8%      89.50 ± 11%  proc-vmstat.nr_anon_transparent_hugepages
      7680            -1.4%       7574        proc-vmstat.nr_inactive_anon
      8852            -1.9%       8686        proc-vmstat.nr_mapped
     16055 ±  8%     -18.1%      13149        proc-vmstat.nr_shmem
     88339            -3.5%      85206        proc-vmstat.nr_zone_active_anon
      7680            -1.4%       7574        proc-vmstat.nr_zone_inactive_anon
   1309566            +2.5%    1341707        proc-vmstat.numa_hit
   1216331            +2.6%    1248497        proc-vmstat.numa_local
    267010 ±  4%     +20.9%     322935 ±  7%  proc-vmstat.numa_pte_updates
     12046 ± 16%     -32.2%       8164        proc-vmstat.pgactivate
   1405309            +1.8%    1430314        proc-vmstat.pgfault
      5.30 ± 26%     +71.0%       9.06        perf-stat.i.MPKI
 1.625e+10           -55.6%  7.211e+09        perf-stat.i.branch-instructions
      1.60 ±  6%      +0.6        2.18        perf-stat.i.branch-miss-rate%
 1.651e+08           -47.4%   86873852        perf-stat.i.branch-misses
      2.26 ±  4%     +20.4%       2.72        perf-stat.i.cpi
  1.81e+11           -51.7%  8.745e+10        perf-stat.i.cpu-cycles
    200.87            -2.3%     196.31        perf-stat.i.cpu-migrations
    115780 ± 18%     -50.4%      57378 ± 10%  perf-stat.i.cycles-between-cache-misses
      0.19 ±  7%      +0.0        0.23        perf-stat.i.dTLB-load-miss-rate%
  50659921           -53.8%   23428189        perf-stat.i.dTLB-load-misses
 3.197e+10           -56.1%  1.405e+10        perf-stat.i.dTLB-loads
  49340777           -55.7%   21880469        perf-stat.i.dTLB-store-misses
 2.418e+10           -55.5%  1.077e+10        perf-stat.i.dTLB-stores
     89.92 ±  3%      -2.9       86.98        perf-stat.i.iTLB-load-miss-rate%
  80847212           -55.7%   35813879        perf-stat.i.iTLB-load-misses
   4729880 ±  8%     -25.0%    3549498        perf-stat.i.iTLB-loads
 8.441e+10           -55.6%  3.744e+10        perf-stat.i.instructions
      0.48 ±  2%     -12.7%       0.41        perf-stat.i.ipc
      1.17 ±  7%    +104.2%       2.38 ± 10%  perf-stat.overall.MPKI
      1.01            +0.2        1.20        perf-stat.overall.branch-miss-rate%
      2.14            +9.2%       2.34        perf-stat.overall.cpi
      0.16            +0.0        0.17        perf-stat.overall.dTLB-load-miss-rate%
     94.47            -3.4       91.03        perf-stat.overall.iTLB-load-miss-rate%
      0.47            -8.5%       0.43        perf-stat.overall.ipc
     38578            +4.9%      40486        perf-stat.overall.path-length
 1.626e+10           -55.2%  7.291e+09        perf-stat.ps.branch-instructions
 1.651e+08           -47.2%   87150525        perf-stat.ps.branch-misses
 1.807e+11           -51.0%  8.848e+10        perf-stat.ps.cpu-cycles
    200.31            -2.5%     195.35        perf-stat.ps.cpu-migrations
  50687770           -53.4%   23631466        perf-stat.ps.dTLB-load-misses
   3.2e+10           -55.6%  1.421e+10        perf-stat.ps.dTLB-loads
  49379002           -55.2%   22117282        perf-stat.ps.dTLB-store-misses
  2.42e+10           -55.0%  1.088e+10        perf-stat.ps.dTLB-stores
  80975693           -55.4%   36144876        perf-stat.ps.iTLB-load-misses
   4739796 ±  8%     -24.8%    3562875        perf-stat.ps.iTLB-loads
 8.447e+10           -55.2%  3.786e+10        perf-stat.ps.instructions
 2.672e+13           -54.1%  1.226e+13        perf-stat.total.instructions
    103313 ±  5%      +8.2%     111756 ±  2%  softirqs.CPU1.RCU
    116695 ±  2%     +14.0%     133013 ±  3%  softirqs.CPU103.RCU
      8241 ±  9%     +18.8%       9792 ±  3%  softirqs.CPU104.SCHED
    116931 ±  2%     +12.5%     131559        softirqs.CPU105.RCU
      8671 ±  5%     +35.3%      11732 ± 21%  softirqs.CPU107.SCHED
    124859 ±  7%     -12.0%     109855 ±  6%  softirqs.CPU11.TIMER
      8146 ± 15%     +25.6%      10235 ±  9%  softirqs.CPU110.SCHED
      8051 ± 17%     +29.3%      10412 ±  7%  softirqs.CPU111.SCHED
     12495 ± 17%     +36.8%      17089 ± 16%  softirqs.CPU117.SCHED
     14717 ±  2%     +11.7%      16433 ±  6%  softirqs.CPU122.SCHED
     14948 ±  5%      +9.9%      16425 ±  6%  softirqs.CPU129.SCHED
    110639           +10.5%     122245        softirqs.CPU136.RCU
    110864           +11.2%     123292        softirqs.CPU137.RCU
    114185 ±  3%      +9.4%     124873        softirqs.CPU139.RCU
    110850 ±  2%     +11.2%     123278        softirqs.CPU142.RCU
    110568 ±  4%     +10.5%     122143 ±  3%  softirqs.CPU144.TIMER
    109121 ±  5%     +11.8%     122033 ±  4%  softirqs.CPU145.TIMER
    111912 ±  4%     +10.2%     123315        softirqs.CPU146.RCU
    108599 ±  5%     +11.9%     121550 ±  4%  softirqs.CPU146.TIMER
    112181 ±  3%     +12.3%     126005        softirqs.CPU147.RCU
    112234 ±  3%     +12.7%     126471        softirqs.CPU148.RCU
    109468 ±  4%     +11.1%     121657 ±  4%  softirqs.CPU148.TIMER
    111220 ±  2%     +10.3%     122669        softirqs.CPU149.RCU
    109018 ±  6%     +12.2%     122271 ±  4%  softirqs.CPU149.TIMER
    109327 ±  5%     +12.1%     122520 ±  4%  softirqs.CPU151.TIMER
    108406 ±  5%     +13.4%     122935 ±  4%  softirqs.CPU152.TIMER
    103893 ±  8%     +17.5%     122032 ±  4%  softirqs.CPU153.TIMER
    108237 ±  5%     +12.7%     121936 ±  4%  softirqs.CPU154.TIMER
    111699 ±  3%     +12.1%     125267 ±  2%  softirqs.CPU155.RCU
    107822 ±  6%     +13.2%     122059 ±  4%  softirqs.CPU155.TIMER
    110230 ±  4%     +10.4%     121735        softirqs.CPU156.RCU
    110996 ±  9%     +18.5%     131541 ±  3%  softirqs.CPU156.TIMER
    111474 ±  9%     +18.3%     131887 ±  3%  softirqs.CPU157.TIMER
    111808 ± 10%     +18.4%     132383 ±  3%  softirqs.CPU158.TIMER
    112410 ±  9%     +19.5%     134371 ±  4%  softirqs.CPU159.TIMER
    112431 ±  9%     +18.2%     132868 ±  3%  softirqs.CPU160.TIMER
    111938 ±  9%     +18.6%     132812 ±  4%  softirqs.CPU162.TIMER
    112639 ±  8%     +19.6%     134695 ±  5%  softirqs.CPU163.TIMER
    111264 ± 10%     +19.3%     132735 ±  4%  softirqs.CPU164.TIMER
    112895 ± 10%     +18.6%     133896 ±  2%  softirqs.CPU165.TIMER
    112142 ±  9%     +19.0%     133462 ±  4%  softirqs.CPU166.TIMER
    112441 ±  8%     +18.5%     133207 ±  4%  softirqs.CPU167.TIMER
    119231 ±  4%     +12.1%     133611 ±  4%  softirqs.CPU168.TIMER
    110256 ±  3%     +14.5%     126229        softirqs.CPU170.RCU
    117944 ±  4%     +12.7%     132897 ±  4%  softirqs.CPU170.TIMER
    110796 ±  3%     +15.5%     127949 ±  2%  softirqs.CPU171.RCU
    118324 ±  4%     +12.2%     132748 ±  4%  softirqs.CPU171.TIMER
    111194 ±  3%     +14.8%     127611        softirqs.CPU172.RCU
    117677 ±  4%     +12.5%     132353 ±  4%  softirqs.CPU172.TIMER
    112702 ±  4%     +11.7%     125929        softirqs.CPU173.RCU
    117521 ±  4%     +13.0%     132777 ±  4%  softirqs.CPU173.TIMER
    111519 ±  5%     +11.5%     124397        softirqs.CPU174.RCU
    117624 ±  4%     +12.8%     132699 ±  4%  softirqs.CPU174.TIMER
    117770 ±  4%     +12.6%     132555 ±  4%  softirqs.CPU175.TIMER
    107011 ±  4%     +14.6%     122628        softirqs.CPU176.RCU
    125052 ±  4%     +14.8%     143534 ±  3%  softirqs.CPU176.TIMER
    124092 ±  4%     +16.4%     144483 ±  4%  softirqs.CPU177.TIMER
    106789 ±  4%     +15.9%     123784        softirqs.CPU178.RCU
    125402 ±  4%     +14.1%     143099 ±  4%  softirqs.CPU178.TIMER
    108238 ±  4%     +16.6%     126156        softirqs.CPU179.RCU
    125614 ±  4%     +13.6%     142717 ±  4%  softirqs.CPU179.TIMER
    105149 ±  2%     +16.1%     122032        softirqs.CPU180.RCU
    126015 ±  4%     +13.6%     143152 ±  4%  softirqs.CPU180.TIMER
    105298 ±  3%     +14.8%     120882        softirqs.CPU181.RCU
    126284 ±  4%     +13.4%     143188 ±  4%  softirqs.CPU181.TIMER
    126504 ±  4%     +13.7%     143880 ±  4%  softirqs.CPU182.TIMER
     97635 ±  4%     +10.2%     107575 ±  2%  softirqs.CPU183.RCU
    126954 ±  4%     +13.2%     143706 ±  3%  softirqs.CPU183.TIMER
     97029 ±  4%     +10.0%     106721 ±  2%  softirqs.CPU184.RCU
    126597 ±  4%     +14.1%     144399 ±  3%  softirqs.CPU184.TIMER
    126291 ±  4%     +14.1%     144041 ±  3%  softirqs.CPU185.TIMER
    106173 ±  3%     +12.6%     119604        softirqs.CPU186.RCU
    126032 ±  4%     +13.7%     143361 ±  4%  softirqs.CPU186.TIMER
    101051 ±  2%     +10.9%     112061        softirqs.CPU187.RCU
    126354 ±  4%     +13.3%     143192 ±  3%  softirqs.CPU187.TIMER
    102818 ±  2%     +12.2%     115332        softirqs.CPU188.RCU
    127619 ±  3%     +12.5%     143581 ±  3%  softirqs.CPU188.TIMER
    126988 ±  3%     +13.1%     143600 ±  3%  softirqs.CPU189.TIMER
    127844 ±  3%     +12.0%     143208 ±  3%  softirqs.CPU190.TIMER
    105194 ±  4%      +8.9%     114593        softirqs.CPU191.RCU
    126131 ±  4%     +12.6%     141984 ±  3%  softirqs.CPU191.TIMER
    126023 ±  8%     -13.7%     108741 ±  5%  softirqs.CPU2.TIMER
    104677           +10.9%     116047        softirqs.CPU26.RCU
    105355           +12.8%     118890 ±  4%  softirqs.CPU29.RCU
    103887 ±  2%     +11.8%     116158 ±  3%  softirqs.CPU37.RCU
    100278            +9.9%     110226        softirqs.CPU41.RCU
     99651           +11.1%     110705        softirqs.CPU47.RCU
    120656 ±  5%      +9.0%     131555 ±  5%  softirqs.CPU49.TIMER
    120260 ±  5%      +8.8%     130798 ±  4%  softirqs.CPU50.TIMER
    121096 ±  5%      +7.7%     130459 ±  4%  softirqs.CPU51.TIMER
    119575 ±  5%      +9.4%     130823 ±  4%  softirqs.CPU53.TIMER
    120678 ±  5%      +8.1%     130443 ±  4%  softirqs.CPU54.TIMER
    100685            +8.5%     109266 ±  2%  softirqs.CPU56.RCU
    119321 ±  5%      +9.6%     130744 ±  4%  softirqs.CPU56.TIMER
    119688 ±  5%      +9.2%     130694 ±  5%  softirqs.CPU58.TIMER
    118367 ±  5%     +10.2%     130390 ±  5%  softirqs.CPU59.TIMER
    125646 ±  7%     -12.5%     109907 ±  6%  softirqs.CPU6.TIMER
    102136 ±  3%     +11.2%     113583        softirqs.CPU60.RCU
    120242 ±  7%     +14.6%     137784 ±  4%  softirqs.CPU60.TIMER
    101539 ±  3%     +10.3%     111989        softirqs.CPU61.RCU
    120829 ±  8%     +14.2%     138016 ±  4%  softirqs.CPU61.TIMER
    121701 ±  7%     +13.9%     138600 ±  4%  softirqs.CPU62.TIMER
    121409 ±  7%     +14.2%     138676 ±  4%  softirqs.CPU63.TIMER
    125328 ±  7%     +13.7%     142548 ±  3%  softirqs.CPU64.TIMER
    123090 ± 10%     +15.9%     142685 ±  4%  softirqs.CPU65.TIMER
    123836 ±  6%     +13.8%     140978 ±  4%  softirqs.CPU66.TIMER
    125334 ±  6%     +13.0%     141581 ±  4%  softirqs.CPU67.TIMER
    123980 ±  7%     +14.3%     141747 ±  4%  softirqs.CPU68.TIMER
    124508 ±  7%     +14.3%     142357 ±  4%  softirqs.CPU69.TIMER
    103525 ±  3%     +11.6%     115534 ±  3%  softirqs.CPU7.RCU
     99522 ±  2%      +9.3%     108745        softirqs.CPU70.RCU
    125138 ±  7%     +13.8%     142351 ±  4%  softirqs.CPU70.TIMER
     97391 ±  4%     +10.6%     107679        softirqs.CPU71.RCU
    125595 ±  6%     +13.9%     143020 ±  4%  softirqs.CPU71.TIMER
     98862           +13.3%     111979        softirqs.CPU72.RCU
    100573 ±  2%     +14.8%     115477 ±  2%  softirqs.CPU74.RCU
    101877 ±  3%     +15.4%     117588 ±  2%  softirqs.CPU75.RCU
    130688 ±  4%      +8.7%     142022 ±  4%  softirqs.CPU75.TIMER
    101667 ±  2%     +17.0%     118990        softirqs.CPU76.RCU
    131462 ±  4%      +8.4%     142483 ±  4%  softirqs.CPU76.TIMER
    131276 ±  4%      +8.9%     142977 ±  4%  softirqs.CPU77.TIMER
    100175 ±  2%     +13.0%     113199        softirqs.CPU78.RCU
    131385 ±  4%      +8.8%     142957 ±  4%  softirqs.CPU78.TIMER
    101826 ±  2%     +11.8%     113877 ±  2%  softirqs.CPU79.RCU
    131559 ±  4%      +8.6%     142893 ±  4%  softirqs.CPU79.TIMER
     97507 ±  4%     +16.3%     113402        softirqs.CPU80.RCU
    134781 ±  3%     +11.6%     150470 ±  4%  softirqs.CPU80.TIMER
    133591 ±  4%     +12.7%     150597 ±  4%  softirqs.CPU81.TIMER
     98641 ±  3%     +14.9%     113360        softirqs.CPU82.RCU
    134594 ±  3%     +11.5%     150134 ±  4%  softirqs.CPU82.TIMER
     99247 ±  5%     +18.1%     117183        softirqs.CPU83.RCU
    135102 ±  4%     +12.1%     151482 ±  5%  softirqs.CPU83.TIMER
     95274 ±  3%     +15.0%     109581        softirqs.CPU84.RCU
    135875 ±  4%     +11.0%     150835 ±  4%  softirqs.CPU84.TIMER
     95594 ±  4%     +12.7%     107706        softirqs.CPU85.RCU
    135392 ±  4%     +11.2%     150530 ±  4%  softirqs.CPU85.TIMER
    135627 ±  4%     +11.1%     150715 ±  4%  softirqs.CPU86.TIMER
    137157 ±  4%     +10.4%     151396 ±  4%  softirqs.CPU87.TIMER
    137165 ±  4%     +10.5%     151523 ±  4%  softirqs.CPU88.TIMER
     88932            +8.0%      96045 ±  2%  softirqs.CPU89.RCU
     94247 ±  4%     +15.9%     109213        softirqs.CPU90.RCU
    135110 ±  3%     +10.9%     149854 ±  3%  softirqs.CPU90.TIMER
     90759 ±  3%     +11.0%     100702 ±  3%  softirqs.CPU91.RCU
    135137 ±  3%     +11.3%     150386 ±  3%  softirqs.CPU91.TIMER
     92801           +12.3%     104179        softirqs.CPU92.RCU
    135193 ±  4%     +11.4%     150619 ±  3%  softirqs.CPU92.TIMER
    136523 ±  3%     +10.8%     151310 ±  3%  softirqs.CPU93.TIMER
    136122 ±  4%     +11.1%     151222 ±  3%  softirqs.CPU94.TIMER
     92008 ±  5%     +11.3%     102360        softirqs.CPU95.RCU
    136673 ±  4%     +10.5%     150992 ±  3%  softirqs.CPU95.TIMER
     51.52 ±  9%     -13.6       37.91 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     50.85 ±  9%     -13.4       37.43 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     21.75 ± 10%      -5.4       16.39 ±  6%  perf-profile.calltrace.cycles-pp.ksys_pread64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.97 ± 11%      -4.9       15.08 ±  6%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_pread64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.70 ± 12%      -3.7       12.00 ±  9%  perf-profile.calltrace.cycles-pp.new_sync_read.vfs_read.ksys_pread64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.06 ± 12%      -3.5       11.54 ±  9%  perf-profile.calltrace.cycles-pp.shmem_file_read_iter.new_sync_read.vfs_read.ksys_pread64.do_syscall_64
      5.70 ±  8%      -1.6        4.11 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64
      5.28 ±  8%      -1.5        3.82 ±  3%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret
      4.08 ±  7%      -1.0        3.11 ±  8%  perf-profile.calltrace.cycles-pp.shmem_getpage_gfp.shmem_file_read_iter.new_sync_read.vfs_read.ksys_pread64
      3.29 ±  7%      -0.7        2.54 ± 10%  perf-profile.calltrace.cycles-pp.find_lock_entry.shmem_getpage_gfp.shmem_file_read_iter.new_sync_read.vfs_read
      2.28 ±  8%      -0.6        1.64 ±  3%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_read.ksys_pread64.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.64 ±  8%      -0.5        1.16 ±  3%  perf-profile.calltrace.cycles-pp.common_file_perm.security_file_permission.vfs_read.ksys_pread64.do_syscall_64
      1.73 ±  7%      -0.4        1.38 ± 15%  perf-profile.calltrace.cycles-pp.find_get_entry.find_lock_entry.shmem_getpage_gfp.shmem_file_read_iter.new_sync_read
      1.33 ±  8%      -0.3        0.98 ±  2%  perf-profile.calltrace.cycles-pp.__fget_light.ksys_pread64.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.97 ±  6%      -0.3        0.69 ±  4%  perf-profile.calltrace.cycles-pp.touch_atime.shmem_file_read_iter.new_sync_read.vfs_read.ksys_pread64
      0.87 ± 10%      -0.2        0.62 ±  4%  perf-profile.calltrace.cycles-pp.fsnotify.vfs_read.ksys_pread64.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.81 ±  6%      -0.2        0.58 ±  3%  perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.shmem_file_read_iter.new_sync_read.vfs_read
      0.65 ± 12%      +0.5        1.11 ±  4%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +0.5        0.54 ±  4%  perf-profile.calltrace.cycles-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.14 ±173%      +0.7        0.82 ±  3%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state
      0.00            +0.7        0.71 ±  5%  perf-profile.calltrace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
      1.15 ± 12%      +0.8        1.97 ±  2%  perf-profile.calltrace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle
      1.24 ± 12%      +0.9        2.15 ±  2%  perf-profile.calltrace.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
     34.25 ± 18%     +15.2       49.42 ±  2%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
     34.70 ± 17%     +16.3       50.98 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary
     34.78 ± 17%     +16.4       51.14 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     36.14 ± 16%     +16.8       52.92        perf-profile.calltrace.cycles-pp.secondary_startup_64
     35.31 ± 16%     +16.8       52.11 ±  2%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
     35.31 ± 16%     +16.8       52.11 ±  2%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64
     35.30 ± 16%     +16.8       52.10 ±  2%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     51.57 ±  9%     -13.6       37.98 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     50.94 ±  9%     -13.4       37.53 ±  2%  perf-profile.children.cycles-pp.do_syscall_64
     21.78 ± 10%      -5.4       16.41 ±  6%  perf-profile.children.cycles-pp.ksys_pread64
     20.02 ± 11%      -4.9       15.12 ±  6%  perf-profile.children.cycles-pp.vfs_read
     15.73 ± 12%      -3.7       12.02 ±  9%  perf-profile.children.cycles-pp.new_sync_read
     15.16 ± 12%      -3.6       11.61 ±  9%  perf-profile.children.cycles-pp.shmem_file_read_iter
      6.11 ±  8%      -1.7        4.41 ±  3%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      5.70 ±  8%      -1.6        4.11 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      4.10 ±  7%      -1.0        3.13 ±  8%  perf-profile.children.cycles-pp.shmem_getpage_gfp
      3.37 ±  7%      -0.8        2.60 ±  9%  perf-profile.children.cycles-pp.find_lock_entry
      2.31 ±  8%      -0.7        1.66 ±  3%  perf-profile.children.cycles-pp.security_file_permission
      1.65 ±  8%      -0.5        1.17 ±  3%  perf-profile.children.cycles-pp.common_file_perm
      1.78 ±  7%      -0.4        1.41 ± 14%  perf-profile.children.cycles-pp.find_get_entry
      1.33 ±  8%      -0.3        0.98 ±  2%  perf-profile.children.cycles-pp.__fget_light
      1.00 ±  7%      -0.3        0.70 ±  4%  perf-profile.children.cycles-pp.touch_atime
      0.91 ±  9%      -0.3        0.66 ±  4%  perf-profile.children.cycles-pp.fsnotify
      0.81 ±  6%      -0.2        0.58 ±  3%  perf-profile.children.cycles-pp.atime_needs_update
      0.63 ±  9%      -0.2        0.46 ±  3%  perf-profile.children.cycles-pp.__x64_sys_pread64
      0.52 ±  8%      -0.2        0.35 ±  6%  perf-profile.children.cycles-pp.current_time
      0.59 ±  9%      -0.2        0.43        perf-profile.children.cycles-pp.unlock_page
      0.60 ±  8%      -0.2        0.45 ±  3%  perf-profile.children.cycles-pp.__fsnotify_parent
      0.54 ± 10%      -0.1        0.40 ±  3%  perf-profile.children.cycles-pp.___might_sleep
      0.44 ±  9%      -0.1        0.32 ±  2%  perf-profile.children.cycles-pp.__might_sleep
      0.40 ±  9%      -0.1        0.28 ±  5%  perf-profile.children.cycles-pp.mark_page_accessed
      0.48 ±  8%      -0.1        0.37 ±  4%  perf-profile.children.cycles-pp.page_mapping
      0.38 ± 10%      -0.1        0.27 ±  3%  perf-profile.children.cycles-pp.__might_fault
      0.29 ±  8%      -0.1        0.20 ±  6%  perf-profile.children.cycles-pp._cond_resched
      0.25 ±  9%      -0.1        0.16 ±  5%  perf-profile.children.cycles-pp.fpregs_assert_state_consistent
      0.19 ±  9%      -0.1        0.13 ±  5%  perf-profile.children.cycles-pp.rw_verify_area
      0.22 ±  9%      -0.1        0.17 ±  4%  perf-profile.children.cycles-pp.aa_file_perm
      0.15 ± 10%      -0.1        0.10 ±  8%  perf-profile.children.cycles-pp.rcu_all_qs
      0.17 ±  7%      -0.0        0.12 ±  3%  perf-profile.children.cycles-pp.timestamp_truncate
      0.07 ± 11%      -0.0        0.04 ± 58%  perf-profile.children.cycles-pp.__vfs_read
      0.09 ± 16%      -0.0        0.06 ± 14%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.07 ± 10%      -0.0        0.05 ±  8%  perf-profile.children.cycles-pp.PageHuge
      0.07 ± 10%      -0.0        0.05 ±  8%  perf-profile.children.cycles-pp.iov_iter_init
      0.06 ± 14%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.07 ± 20%      +0.0        0.12 ±  8%  perf-profile.children.cycles-pp.native_write_msr
      0.06 ± 13%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.read_tsc
      0.09 ± 18%      +0.0        0.14 ±  8%  perf-profile.children.cycles-pp.rebalance_domains
      0.06 ±  7%      +0.1        0.11 ±  7%  perf-profile.children.cycles-pp._find_next_bit
      0.06 ± 11%      +0.1        0.11 ±  7%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.05 ± 58%      +0.1        0.10 ± 10%  perf-profile.children.cycles-pp.load_balance
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock
      0.10 ± 26%      +0.1        0.15 ±  5%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.update_blocked_averages
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.sched_clock
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.native_sched_clock
      0.01 ±173%      +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.timerqueue_add
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.update_ts_time_stats
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.run_rebalance_domains
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.find_busiest_group
      0.01 ±173%      +0.1        0.07 ± 11%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.12 ± 30%      +0.1        0.18 ±  6%  perf-profile.children.cycles-pp.tick_irq_enter
      0.18 ± 13%      +0.1        0.24 ±  7%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.interrupt_entry
      0.01 ±173%      +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.timerqueue_del
      0.01 ±173%      +0.1        0.08        perf-profile.children.cycles-pp.run_timer_softirq
      0.01 ±173%      +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.09 ±  4%      +0.1        0.15 ±  5%  perf-profile.children.cycles-pp.__next_timer_interrupt
      0.01 ±173%      +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.01 ±173%      +0.1        0.10 ±  5%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.21 ± 10%      +0.1        0.30 ± 11%  perf-profile.children.cycles-pp.rcu_core
      0.12 ±  3%      +0.1        0.21 ±  7%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.14 ± 25%      +0.1        0.24 ±  6%  perf-profile.children.cycles-pp.irq_enter
      0.17 ±  5%      +0.1        0.29 ±  3%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.16 ± 14%      +0.1        0.29 ± 13%  perf-profile.children.cycles-pp.scheduler_tick
      0.21 ±  3%      +0.1        0.35 ±  3%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.41 ± 13%      +0.2        0.62 ±  6%  perf-profile.children.cycles-pp.__softirqentry_text_start
      0.36 ± 21%      +0.2        0.57 ± 13%  perf-profile.children.cycles-pp.update_process_times
      0.45 ± 23%      +0.2        0.69 ± 12%  perf-profile.children.cycles-pp.tick_sched_timer
      0.47 ± 12%      +0.3        0.72 ±  6%  perf-profile.children.cycles-pp.irq_exit
      0.37 ± 22%      +0.3        0.62 ± 12%  perf-profile.children.cycles-pp.tick_sched_handle
      0.40 ±  9%      +0.3        0.72 ±  5%  perf-profile.children.cycles-pp.menu_select
      0.66 ± 23%      +0.4        1.09 ±  9%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.98 ± 17%      +0.5        1.51 ±  9%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.62 ± 14%      +0.9        2.54 ±  6%  perf-profile.children.cycles-pp.smp_apic_timer_interrupt
      1.73 ± 14%      +1.0        2.77 ±  6%  perf-profile.children.cycles-pp.apic_timer_interrupt
     34.25 ± 18%     +15.3       49.51 ±  2%  perf-profile.children.cycles-pp.intel_idle
     35.63 ± 17%     +16.3       51.95        perf-profile.children.cycles-pp.cpuidle_enter_state
     35.63 ± 17%     +16.3       51.95        perf-profile.children.cycles-pp.cpuidle_enter
     36.15 ± 16%     +16.8       52.92        perf-profile.children.cycles-pp.do_idle
     36.14 ± 16%     +16.8       52.92        perf-profile.children.cycles-pp.secondary_startup_64
     36.14 ± 16%     +16.8       52.92        perf-profile.children.cycles-pp.cpu_startup_entry
     35.31 ± 16%     +16.8       52.11 ±  2%  perf-profile.children.cycles-pp.start_secondary
     28.19 ± 10%      -7.8       20.37 ±  6%  perf-profile.self.cycles-pp.do_syscall_64
      6.10 ±  8%      -1.7        4.39 ±  3%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      5.70 ±  8%      -1.6        4.11 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.92 ±  6%      -0.5        1.41 ±  3%  perf-profile.self.cycles-pp.shmem_file_read_iter
      1.41 ±  8%      -0.4        0.98 ±  4%  perf-profile.self.cycles-pp.common_file_perm
      1.31 ±  8%      -0.3        0.96 ±  2%  perf-profile.self.cycles-pp.__fget_light
      0.87 ±  9%      -0.3        0.61 ±  4%  perf-profile.self.cycles-pp.fsnotify
      0.72 ±  9%      -0.2        0.52 ±  2%  perf-profile.self.cycles-pp.shmem_getpage_gfp
      0.63 ±  8%      -0.2        0.45 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.64 ±  7%      -0.2        0.46 ±  3%  perf-profile.self.cycles-pp.copy_page_to_iter
      0.63 ±  9%      -0.2        0.47 ±  7%  perf-profile.self.cycles-pp.find_lock_entry
      0.58 ±  9%      -0.2        0.43 ±  2%  perf-profile.self.cycles-pp.unlock_page
      0.54 ±  8%      -0.2        0.39 ±  4%  perf-profile.self.cycles-pp.__x64_sys_pread64
      0.57 ±  8%      -0.1        0.42 ±  3%  perf-profile.self.cycles-pp.__fsnotify_parent
      0.54 ± 10%      -0.1        0.39 ±  3%  perf-profile.self.cycles-pp.___might_sleep
      0.54 ±  9%      -0.1        0.40 ±  4%  perf-profile.self.cycles-pp.vfs_read
      0.47 ±  8%      -0.1        0.34 ±  5%  perf-profile.self.cycles-pp.new_sync_read
      0.43 ±  8%      -0.1        0.32 ±  4%  perf-profile.self.cycles-pp.ksys_pread64
      0.37 ±  9%      -0.1        0.26 ±  6%  perf-profile.self.cycles-pp.mark_page_accessed
      0.45 ±  8%      -0.1        0.35 ±  3%  perf-profile.self.cycles-pp.page_mapping
      0.37 ±  9%      -0.1        0.26 ±  3%  perf-profile.self.cycles-pp.__might_sleep
      0.31 ±  7%      -0.1        0.23 ±  3%  perf-profile.self.cycles-pp.xas_load
      0.25 ±  9%      -0.1        0.16 ±  5%  perf-profile.self.cycles-pp.fpregs_assert_state_consistent
      0.32 ±  9%      -0.1        0.23 ±  2%  perf-profile.self.cycles-pp.security_file_permission
      0.21 ± 13%      -0.1        0.14 ±  7%  perf-profile.self.cycles-pp.touch_atime
      0.19 ±  9%      -0.1        0.13 ±  5%  perf-profile.self.cycles-pp.rw_verify_area
      0.20 ±  7%      -0.1        0.14        perf-profile.self.cycles-pp.current_time
      0.22 ±  8%      -0.1        0.17 ±  4%  perf-profile.self.cycles-pp.aa_file_perm
      0.14 ±  8%      -0.0        0.09 ±  8%  perf-profile.self.cycles-pp._cond_resched
      0.17 ±  6%      -0.0        0.12 ±  5%  perf-profile.self.cycles-pp.timestamp_truncate
      0.07 ± 11%      -0.0        0.04 ± 58%  perf-profile.self.cycles-pp.__vfs_read
      0.10 ± 11%      -0.0        0.07 ± 13%  perf-profile.self.cycles-pp.copyout
      0.10 ±  7%      -0.0        0.07 ±  6%  perf-profile.self.cycles-pp.__might_fault
      0.10 ± 12%      -0.0        0.07 ± 10%  perf-profile.self.cycles-pp.rcu_all_qs
      0.07 ± 10%      -0.0        0.05 ±  8%  perf-profile.self.cycles-pp.iov_iter_init
      0.06 ±  7%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.06 ± 14%      +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.06 ± 13%      +0.0        0.10 ±  8%  perf-profile.self.cycles-pp.read_tsc
      0.07 ± 20%      +0.0        0.12 ±  8%  perf-profile.self.cycles-pp.native_write_msr
      0.06 ±  7%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp._find_next_bit
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.__next_timer_interrupt
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.do_idle
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.interrupt_entry
      0.00            +0.1        0.07 ±  7%  perf-profile.self.cycles-pp.run_timer_softirq
      0.00            +0.1        0.07 ±  7%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.12 ± 10%      +0.1        0.25 ±  2%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.15 ± 25%      +0.1        0.29 ± 11%  perf-profile.self.cycles-pp.menu_select
     34.24 ± 18%     +15.3       49.50 ±  2%  perf-profile.self.cycles-pp.intel_idle
    170.25 ±  8%     +79.0%     304.75 ± 43%  interrupts.57:PCI-MSI.1572870-edge.eth0-TxRx-6
    154.75           +11.1%     172.00 ±  4%  interrupts.78:PCI-MSI.1572891-edge.eth0-TxRx-27
    155.50           +25.1%     194.50 ± 24%  interrupts.80:PCI-MSI.1572893-edge.eth0-TxRx-29
    154.50           +28.0%     197.75 ± 30%  interrupts.89:PCI-MSI.1572902-edge.eth0-TxRx-38
      3780 ± 30%     -30.6%       2624 ± 27%  interrupts.CPU1.NMI:Non-maskable_interrupts
      3780 ± 30%     -30.6%       2624 ± 27%  interrupts.CPU1.PMI:Performance_monitoring_interrupts
      6402 ± 24%     -60.7%       2514 ± 33%  interrupts.CPU100.NMI:Non-maskable_interrupts
      6402 ± 24%     -60.7%       2514 ± 33%  interrupts.CPU100.PMI:Performance_monitoring_interrupts
    121.00 ±  2%     -73.3%      32.25 ±  9%  interrupts.CPU100.RES:Rescheduling_interrupts
      5487 ± 33%     -54.2%       2515 ± 33%  interrupts.CPU101.NMI:Non-maskable_interrupts
      5487 ± 33%     -54.2%       2515 ± 33%  interrupts.CPU101.PMI:Performance_monitoring_interrupts
      6402 ± 24%     -55.8%       2827 ± 24%  interrupts.CPU102.NMI:Non-maskable_interrupts
      6402 ± 24%     -55.8%       2827 ± 24%  interrupts.CPU102.PMI:Performance_monitoring_interrupts
    121.75 ±  2%     -71.7%      34.50 ± 10%  interrupts.CPU102.RES:Rescheduling_interrupts
      7316           -54.2%       3353        interrupts.CPU103.NMI:Non-maskable_interrupts
      7316           -54.2%       3353        interrupts.CPU103.PMI:Performance_monitoring_interrupts
    139.25 ± 23%     -75.8%      33.75 ±  7%  interrupts.CPU103.RES:Rescheduling_interrupts
      7317           -54.2%       3354        interrupts.CPU104.NMI:Non-maskable_interrupts
      7317           -54.2%       3354        interrupts.CPU104.PMI:Performance_monitoring_interrupts
    118.75           -68.8%      37.00 ± 33%  interrupts.CPU104.RES:Rescheduling_interrupts
      6401 ± 24%     -55.9%       2820 ± 24%  interrupts.CPU105.NMI:Non-maskable_interrupts
      6401 ± 24%     -55.9%       2820 ± 24%  interrupts.CPU105.PMI:Performance_monitoring_interrupts
    120.00           -72.7%      32.75 ±  3%  interrupts.CPU105.RES:Rescheduling_interrupts
      5487 ± 33%     -47.5%       2878 ± 24%  interrupts.CPU106.NMI:Non-maskable_interrupts
      5487 ± 33%     -47.5%       2878 ± 24%  interrupts.CPU106.PMI:Performance_monitoring_interrupts
    122.75 ±  2%     -70.7%      36.00 ± 13%  interrupts.CPU106.RES:Rescheduling_interrupts
      6403 ± 24%     -56.1%       2810 ± 24%  interrupts.CPU107.NMI:Non-maskable_interrupts
      6403 ± 24%     -56.1%       2810 ± 24%  interrupts.CPU107.PMI:Performance_monitoring_interrupts
      7320           -55.9%       3229 ±  6%  interrupts.CPU108.NMI:Non-maskable_interrupts
      7320           -55.9%       3229 ±  6%  interrupts.CPU108.PMI:Performance_monitoring_interrupts
    122.25 ±  3%     -74.4%      31.25 ±  8%  interrupts.CPU108.RES:Rescheduling_interrupts
      7319           -54.2%       3353        interrupts.CPU109.NMI:Non-maskable_interrupts
      7319           -54.2%       3353        interrupts.CPU109.PMI:Performance_monitoring_interrupts
    119.50           -73.2%      32.00 ±  4%  interrupts.CPU109.RES:Rescheduling_interrupts
      6924 ±  9%     -57.6%       2934 ± 24%  interrupts.CPU110.NMI:Non-maskable_interrupts
      6924 ±  9%     -57.6%       2934 ± 24%  interrupts.CPU110.PMI:Performance_monitoring_interrupts
    119.00           -70.4%      35.25 ± 23%  interrupts.CPU110.RES:Rescheduling_interrupts
      6924 ±  9%     -63.7%       2515 ± 33%  interrupts.CPU111.NMI:Non-maskable_interrupts
      6924 ±  9%     -63.7%       2515 ± 33%  interrupts.CPU111.PMI:Performance_monitoring_interrupts
    121.25 ±  2%     -74.4%      31.00 ± 13%  interrupts.CPU111.RES:Rescheduling_interrupts
      6930 ±  9%     -63.7%       2514 ± 33%  interrupts.CPU112.NMI:Non-maskable_interrupts
      6930 ±  9%     -63.7%       2514 ± 33%  interrupts.CPU112.PMI:Performance_monitoring_interrupts
    121.50           -58.0%      51.00 ± 64%  interrupts.CPU112.RES:Rescheduling_interrupts
      7318           -59.9%       2934 ± 24%  interrupts.CPU113.NMI:Non-maskable_interrupts
      7318           -59.9%       2934 ± 24%  interrupts.CPU113.PMI:Performance_monitoring_interrupts
    124.00 ±  2%     -74.8%      31.25 ±  3%  interrupts.CPU113.RES:Rescheduling_interrupts
      7318           -59.9%       2933 ± 24%  interrupts.CPU114.NMI:Non-maskable_interrupts
      7318           -59.9%       2933 ± 24%  interrupts.CPU114.PMI:Performance_monitoring_interrupts
    119.25           -69.4%      36.50 ± 20%  interrupts.CPU114.RES:Rescheduling_interrupts
      7319           -59.9%       2934 ± 24%  interrupts.CPU115.NMI:Non-maskable_interrupts
      7319           -59.9%       2934 ± 24%  interrupts.CPU115.PMI:Performance_monitoring_interrupts
    121.00           -69.8%      36.50 ± 12%  interrupts.CPU115.RES:Rescheduling_interrupts
    126.25 ±  7%     -72.3%      35.00 ± 14%  interrupts.CPU116.RES:Rescheduling_interrupts
      7317           -65.6%       2514 ± 33%  interrupts.CPU117.NMI:Non-maskable_interrupts
      7317           -65.6%       2514 ± 33%  interrupts.CPU117.PMI:Performance_monitoring_interrupts
      4259 ±168%     -99.2%      35.50 ± 24%  interrupts.CPU119.RES:Rescheduling_interrupts
      6404 ± 24%     -54.2%       2935 ± 24%  interrupts.CPU121.NMI:Non-maskable_interrupts
      6404 ± 24%     -54.2%       2935 ± 24%  interrupts.CPU121.PMI:Performance_monitoring_interrupts
      6405 ± 24%     -49.6%       3230 ±  6%  interrupts.CPU122.NMI:Non-maskable_interrupts
      6405 ± 24%     -49.6%       3230 ±  6%  interrupts.CPU122.PMI:Performance_monitoring_interrupts
    116.00           -73.5%      30.75 ± 14%  interrupts.CPU122.RES:Rescheduling_interrupts
    115.00 ±  3%     -75.2%      28.50        interrupts.CPU123.RES:Rescheduling_interrupts
      5490 ± 33%     -38.9%       3355        interrupts.CPU124.NMI:Non-maskable_interrupts
      5490 ± 33%     -38.9%       3355        interrupts.CPU124.PMI:Performance_monitoring_interrupts
    115.75 ±  4%     -74.9%      29.00 ± 10%  interrupts.CPU124.RES:Rescheduling_interrupts
      5491 ± 33%     -41.2%       3230 ±  6%  interrupts.CPU125.NMI:Non-maskable_interrupts
      5491 ± 33%     -41.2%       3230 ±  6%  interrupts.CPU125.PMI:Performance_monitoring_interrupts
    113.50           -65.9%      38.75 ±  6%  interrupts.CPU125.RES:Rescheduling_interrupts
      5490 ± 33%     -38.9%       3356        interrupts.CPU126.NMI:Non-maskable_interrupts
      5490 ± 33%     -38.9%       3356        interrupts.CPU126.PMI:Performance_monitoring_interrupts
      6406 ± 24%     -47.6%       3354        interrupts.CPU127.NMI:Non-maskable_interrupts
      6406 ± 24%     -47.6%       3354        interrupts.CPU127.PMI:Performance_monitoring_interrupts
      6406 ± 24%     -47.7%       3353        interrupts.CPU128.NMI:Non-maskable_interrupts
      6406 ± 24%     -47.7%       3353        interrupts.CPU128.PMI:Performance_monitoring_interrupts
    117.75 ±  3%     -69.9%      35.50 ± 15%  interrupts.CPU128.RES:Rescheduling_interrupts
      6406 ± 24%     -47.6%       3354        interrupts.CPU129.NMI:Non-maskable_interrupts
      6406 ± 24%     -47.6%       3354        interrupts.CPU129.PMI:Performance_monitoring_interrupts
    118.75           -73.9%      31.00 ± 15%  interrupts.CPU129.RES:Rescheduling_interrupts
    116.75 ±  3%     -74.7%      29.50 ± 20%  interrupts.CPU130.RES:Rescheduling_interrupts
      7322           -54.2%       3354        interrupts.CPU131.NMI:Non-maskable_interrupts
      7322           -54.2%       3354        interrupts.CPU131.PMI:Performance_monitoring_interrupts
    169.00 ± 54%     -77.5%      38.00 ± 36%  interrupts.CPU131.RES:Rescheduling_interrupts
      6406 ± 24%     -47.6%       3357        interrupts.CPU132.NMI:Non-maskable_interrupts
      6406 ± 24%     -47.6%       3357        interrupts.CPU132.PMI:Performance_monitoring_interrupts
    113.50           -61.5%      43.75 ± 67%  interrupts.CPU132.RES:Rescheduling_interrupts
      6406 ± 24%     -47.6%       3354        interrupts.CPU133.NMI:Non-maskable_interrupts
      6406 ± 24%     -47.6%       3354        interrupts.CPU133.PMI:Performance_monitoring_interrupts
    149.00 ± 36%     -82.6%      26.00 ± 14%  interrupts.CPU133.RES:Rescheduling_interrupts
      6406 ± 24%     -49.4%       3240 ±  6%  interrupts.CPU134.NMI:Non-maskable_interrupts
      6406 ± 24%     -49.4%       3240 ±  6%  interrupts.CPU134.PMI:Performance_monitoring_interrupts
    116.25 ±  3%     -74.0%      30.25 ± 20%  interrupts.CPU134.RES:Rescheduling_interrupts
      6406 ± 24%     -54.2%       2933 ± 24%  interrupts.CPU135.NMI:Non-maskable_interrupts
      6406 ± 24%     -54.2%       2933 ± 24%  interrupts.CPU135.PMI:Performance_monitoring_interrupts
    189.25 ± 68%     -82.6%      33.00 ± 17%  interrupts.CPU135.RES:Rescheduling_interrupts
    119.25 ±  6%     -73.6%      31.50 ± 21%  interrupts.CPU136.RES:Rescheduling_interrupts
    124.50 ± 18%     -82.1%      22.25 ± 24%  interrupts.CPU138.RES:Rescheduling_interrupts
    130.00 ± 34%     +55.2%     201.75 ±  2%  interrupts.CPU139.NMI:Non-maskable_interrupts
    130.00 ± 34%     +55.2%     201.75 ±  2%  interrupts.CPU139.PMI:Performance_monitoring_interrupts
    105.25 ±  3%     -64.1%      37.75 ± 63%  interrupts.CPU140.RES:Rescheduling_interrupts
    105.00           -67.1%      34.50 ± 33%  interrupts.CPU141.RES:Rescheduling_interrupts
    106.00 ±  3%     -74.3%      27.25 ± 30%  interrupts.CPU142.RES:Rescheduling_interrupts
    103.75           -66.0%      35.25 ± 61%  interrupts.CPU143.RES:Rescheduling_interrupts
    108.00 ±  3%     -75.0%      27.00 ± 19%  interrupts.CPU144.RES:Rescheduling_interrupts
      6254 ±146%     -99.4%      34.75 ± 26%  interrupts.CPU145.RES:Rescheduling_interrupts
    145.25 ± 43%     -85.7%      20.75 ±  9%  interrupts.CPU147.RES:Rescheduling_interrupts
     98.75 ±  8%     -80.3%      19.50 ± 17%  interrupts.CPU149.RES:Rescheduling_interrupts
      3969 ± 30%     -28.0%       2856        interrupts.CPU15.NMI:Non-maskable_interrupts
      3969 ± 30%     -28.0%       2856        interrupts.CPU15.PMI:Performance_monitoring_interrupts
    239.75 ±102%     -90.8%      22.00 ± 21%  interrupts.CPU150.RES:Rescheduling_interrupts
    180.00 ± 19%     +38.3%     249.00 ±  4%  interrupts.CPU151.NMI:Non-maskable_interrupts
    180.00 ± 19%     +38.3%     249.00 ±  4%  interrupts.CPU151.PMI:Performance_monitoring_interrupts
    103.00 ±  3%     -68.9%      32.00 ± 75%  interrupts.CPU151.RES:Rescheduling_interrupts
    180.50 ± 17%     +51.5%     273.50 ±  8%  interrupts.CPU152.NMI:Non-maskable_interrupts
    180.50 ± 17%     +51.5%     273.50 ±  8%  interrupts.CPU152.PMI:Performance_monitoring_interrupts
     95.75 ± 10%     -73.6%      25.25 ± 25%  interrupts.CPU152.RES:Rescheduling_interrupts
    171.75 ± 18%     +46.1%     251.00 ±  4%  interrupts.CPU153.NMI:Non-maskable_interrupts
    171.75 ± 18%     +46.1%     251.00 ±  4%  interrupts.CPU153.PMI:Performance_monitoring_interrupts
     93.00 ± 12%     -75.3%      23.00 ± 27%  interrupts.CPU153.RES:Rescheduling_interrupts
     90.00 ± 10%     -70.8%      26.25 ± 13%  interrupts.CPU155.RES:Rescheduling_interrupts
    178.50 ± 17%     +44.4%     257.75        interrupts.CPU156.NMI:Non-maskable_interrupts
    178.50 ± 17%     +44.4%     257.75        interrupts.CPU156.PMI:Performance_monitoring_interrupts
     91.00 ±  9%     -79.9%      18.25 ± 17%  interrupts.CPU156.RES:Rescheduling_interrupts
    175.25 ± 16%     +46.9%     257.50        interrupts.CPU157.NMI:Non-maskable_interrupts
    175.25 ± 16%     +46.9%     257.50        interrupts.CPU157.PMI:Performance_monitoring_interrupts
    175.50 ± 16%     +44.9%     254.25        interrupts.CPU158.NMI:Non-maskable_interrupts
    175.50 ± 16%     +44.9%     254.25        interrupts.CPU158.PMI:Performance_monitoring_interrupts
    174.00 ± 18%     +51.1%     263.00 ±  3%  interrupts.CPU159.NMI:Non-maskable_interrupts
    174.00 ± 18%     +51.1%     263.00 ±  3%  interrupts.CPU159.PMI:Performance_monitoring_interrupts
    186.00 ± 24%     +41.0%     262.25        interrupts.CPU160.NMI:Non-maskable_interrupts
    186.00 ± 24%     +41.0%     262.25        interrupts.CPU160.PMI:Performance_monitoring_interrupts
    177.50 ± 16%     +47.3%     261.50        interrupts.CPU161.NMI:Non-maskable_interrupts
    177.50 ± 16%     +47.3%     261.50        interrupts.CPU161.PMI:Performance_monitoring_interrupts
    172.00 ± 14%     +47.7%     254.00        interrupts.CPU162.NMI:Non-maskable_interrupts
    172.00 ± 14%     +47.7%     254.00        interrupts.CPU162.PMI:Performance_monitoring_interrupts
    129.50 ± 73%     -82.8%      22.25 ± 59%  interrupts.CPU162.RES:Rescheduling_interrupts
     28433 ±172%     -99.9%      18.50 ± 17%  interrupts.CPU165.RES:Rescheduling_interrupts
     32332 ±  4%     -11.9%      28499 ±  7%  interrupts.CPU166.CAL:Function_call_interrupts
      1096 ±164%     -98.4%      17.25 ± 16%  interrupts.CPU166.RES:Rescheduling_interrupts
     31585 ±  4%     -12.0%      27793 ±  7%  interrupts.CPU166.TLB:TLB_shootdowns
     32312 ±  4%     -17.9%      26538 ± 20%  interrupts.CPU168.CAL:Function_call_interrupts
    182.00 ± 22%     +43.4%     261.00 ±  3%  interrupts.CPU168.NMI:Non-maskable_interrupts
    182.00 ± 22%     +43.4%     261.00 ±  3%  interrupts.CPU168.PMI:Performance_monitoring_interrupts
     31583 ±  4%     -18.2%      25847 ± 20%  interrupts.CPU168.TLB:TLB_shootdowns
    260.25 ±136%     -91.7%      21.50 ± 52%  interrupts.CPU169.RES:Rescheduling_interrupts
    175.00 ± 20%     +47.1%     257.50        interrupts.CPU175.NMI:Non-maskable_interrupts
    175.00 ± 20%     +47.1%     257.50        interrupts.CPU175.PMI:Performance_monitoring_interrupts
    175.00 ± 20%     +50.3%     263.00 ±  3%  interrupts.CPU176.NMI:Non-maskable_interrupts
    175.00 ± 20%     +50.3%     263.00 ±  3%  interrupts.CPU176.PMI:Performance_monitoring_interrupts
    175.00 ± 21%     +47.3%     257.75        interrupts.CPU177.NMI:Non-maskable_interrupts
    175.00 ± 21%     +47.3%     257.75        interrupts.CPU177.PMI:Performance_monitoring_interrupts
    179.50 ± 19%     +42.5%     255.75 ±  3%  interrupts.CPU178.NMI:Non-maskable_interrupts
    179.50 ± 19%     +42.5%     255.75 ±  3%  interrupts.CPU178.PMI:Performance_monitoring_interrupts
    157.25 ± 36%     +61.8%     254.50        interrupts.CPU180.NMI:Non-maskable_interrupts
    157.25 ± 36%     +61.8%     254.50        interrupts.CPU180.PMI:Performance_monitoring_interrupts
    177.25 ± 20%     +43.7%     254.75        interrupts.CPU181.NMI:Non-maskable_interrupts
    177.25 ± 20%     +43.7%     254.75        interrupts.CPU181.PMI:Performance_monitoring_interrupts
    180.50 ± 21%     +43.2%     258.50        interrupts.CPU182.NMI:Non-maskable_interrupts
    180.50 ± 21%     +43.2%     258.50        interrupts.CPU182.PMI:Performance_monitoring_interrupts
    175.25 ± 20%     +48.5%     260.25        interrupts.CPU183.NMI:Non-maskable_interrupts
    175.25 ± 20%     +48.5%     260.25        interrupts.CPU183.PMI:Performance_monitoring_interrupts
    177.25 ± 20%     +51.8%     269.00 ±  4%  interrupts.CPU184.NMI:Non-maskable_interrupts
    177.25 ± 20%     +51.8%     269.00 ±  4%  interrupts.CPU184.PMI:Performance_monitoring_interrupts
    178.00 ± 19%     +46.1%     260.00 ±  2%  interrupts.CPU185.NMI:Non-maskable_interrupts
    178.00 ± 19%     +46.1%     260.00 ±  2%  interrupts.CPU185.PMI:Performance_monitoring_interrupts
    176.50 ± 20%     +44.8%     255.50        interrupts.CPU186.NMI:Non-maskable_interrupts
    176.50 ± 20%     +44.8%     255.50        interrupts.CPU186.PMI:Performance_monitoring_interrupts
    177.75 ± 19%     +43.2%     254.50 ±  2%  interrupts.CPU187.NMI:Non-maskable_interrupts
    177.75 ± 19%     +43.2%     254.50 ±  2%  interrupts.CPU187.PMI:Performance_monitoring_interrupts
    180.25 ± 19%     +40.8%     253.75        interrupts.CPU188.NMI:Non-maskable_interrupts
    180.25 ± 19%     +40.8%     253.75        interrupts.CPU188.PMI:Performance_monitoring_interrupts
    177.50 ± 19%     +43.4%     254.50        interrupts.CPU189.NMI:Non-maskable_interrupts
    177.50 ± 19%     +43.4%     254.50        interrupts.CPU189.PMI:Performance_monitoring_interrupts
    159.00 ± 37%     +60.8%     255.75        interrupts.CPU190.NMI:Non-maskable_interrupts
    159.00 ± 37%     +60.8%     255.75        interrupts.CPU190.PMI:Performance_monitoring_interrupts
    174.00 ± 34%     +48.6%     258.50        interrupts.CPU191.NMI:Non-maskable_interrupts
    174.00 ± 34%     +48.6%     258.50        interrupts.CPU191.PMI:Performance_monitoring_interrupts
      4695 ± 40%     -39.2%       2856        interrupts.CPU20.NMI:Non-maskable_interrupts
      4695 ± 40%     -39.2%       2856        interrupts.CPU20.PMI:Performance_monitoring_interrupts
      3766 ± 31%     -24.2%       2856        interrupts.CPU23.NMI:Non-maskable_interrupts
      3766 ± 31%     -24.2%       2856        interrupts.CPU23.PMI:Performance_monitoring_interrupts
    154.75           +11.1%     172.00 ±  4%  interrupts.CPU27.78:PCI-MSI.1572891-edge.eth0-TxRx-27
    155.50           +25.1%     194.50 ± 24%  interrupts.CPU29.80:PCI-MSI.1572893-edge.eth0-TxRx-29
      3765 ± 30%     -24.2%       2856        interrupts.CPU34.NMI:Non-maskable_interrupts
      3765 ± 30%     -24.2%       2856        interrupts.CPU34.PMI:Performance_monitoring_interrupts
    154.50           +28.0%     197.75 ± 30%  interrupts.CPU38.89:PCI-MSI.1572902-edge.eth0-TxRx-38
     98.25 ± 20%     -41.5%      57.50 ± 11%  interrupts.CPU51.RES:Rescheduling_interrupts
    124.00 ± 34%    +108.9%     259.00 ±  2%  interrupts.CPU52.NMI:Non-maskable_interrupts
    124.00 ± 34%    +108.9%     259.00 ±  2%  interrupts.CPU52.PMI:Performance_monitoring_interrupts
    127.50 ± 32%     +98.0%     252.50        interrupts.CPU53.NMI:Non-maskable_interrupts
    127.50 ± 32%     +98.0%     252.50        interrupts.CPU53.PMI:Performance_monitoring_interrupts
     12110           +26.5%      15319 ± 20%  interrupts.CPU54.CAL:Function_call_interrupts
    131.00 ± 33%    +111.6%     277.25 ± 15%  interrupts.CPU54.NMI:Non-maskable_interrupts
    131.00 ± 33%    +111.6%     277.25 ± 15%  interrupts.CPU54.PMI:Performance_monitoring_interrupts
     88.50 ± 35%     -34.7%      57.75 ± 18%  interrupts.CPU54.RES:Rescheduling_interrupts
    128.75 ± 34%     +95.1%     251.25 ±  4%  interrupts.CPU55.NMI:Non-maskable_interrupts
    128.75 ± 34%     +95.1%     251.25 ±  4%  interrupts.CPU55.PMI:Performance_monitoring_interrupts
    131.00 ± 31%    +111.8%     277.50 ± 10%  interrupts.CPU56.NMI:Non-maskable_interrupts
    131.00 ± 31%    +111.8%     277.50 ± 10%  interrupts.CPU56.PMI:Performance_monitoring_interrupts
    125.50 ± 31%    +101.0%     252.25 ±  4%  interrupts.CPU57.NMI:Non-maskable_interrupts
    125.50 ± 31%    +101.0%     252.25 ±  4%  interrupts.CPU57.PMI:Performance_monitoring_interrupts
    170.25 ±  8%     +79.0%     304.75 ± 43%  interrupts.CPU6.57:PCI-MSI.1572870-edge.eth0-TxRx-6
      7715 ±109%     -99.8%      19.00 ±173%  interrupts.CPU65.TLB:TLB_shootdowns
    175.00 ± 17%     +45.9%     255.25        interrupts.CPU69.NMI:Non-maskable_interrupts
    175.00 ± 17%     +45.9%     255.25        interrupts.CPU69.PMI:Performance_monitoring_interrupts
    181.25 ± 15%     +41.9%     257.25 ±  2%  interrupts.CPU70.NMI:Non-maskable_interrupts
    181.25 ± 15%     +41.9%     257.25 ±  2%  interrupts.CPU70.PMI:Performance_monitoring_interrupts
    182.25 ± 14%     +48.1%     270.00 ±  5%  interrupts.CPU71.NMI:Non-maskable_interrupts
    182.25 ± 14%     +48.1%     270.00 ±  5%  interrupts.CPU71.PMI:Performance_monitoring_interrupts
    179.00 ± 20%     +48.0%     265.00 ±  3%  interrupts.CPU72.NMI:Non-maskable_interrupts
    179.00 ± 20%     +48.0%     265.00 ±  3%  interrupts.CPU72.PMI:Performance_monitoring_interrupts
    170.25 ± 18%     +48.6%     253.00 ±  2%  interrupts.CPU73.NMI:Non-maskable_interrupts
    170.25 ± 18%     +48.6%     253.00 ±  2%  interrupts.CPU73.PMI:Performance_monitoring_interrupts
    175.00 ± 21%     +50.9%     264.00 ±  4%  interrupts.CPU74.NMI:Non-maskable_interrupts
    175.00 ± 21%     +50.9%     264.00 ±  4%  interrupts.CPU74.PMI:Performance_monitoring_interrupts
    174.50 ± 21%     +46.3%     255.25        interrupts.CPU75.NMI:Non-maskable_interrupts
    174.50 ± 21%     +46.3%     255.25        interrupts.CPU75.PMI:Performance_monitoring_interrupts
     30.50 ± 58%    +318.9%     127.75 ± 57%  interrupts.CPU75.RES:Rescheduling_interrupts
    174.50 ± 21%     +47.4%     257.25        interrupts.CPU76.NMI:Non-maskable_interrupts
    174.50 ± 21%     +47.4%     257.25        interrupts.CPU76.PMI:Performance_monitoring_interrupts
    175.50 ± 21%     +47.6%     259.00 ±  3%  interrupts.CPU77.NMI:Non-maskable_interrupts
    175.50 ± 21%     +47.6%     259.00 ±  3%  interrupts.CPU77.PMI:Performance_monitoring_interrupts
    177.00 ± 18%     +45.6%     257.75 ±  2%  interrupts.CPU78.NMI:Non-maskable_interrupts
    177.00 ± 18%     +45.6%     257.75 ±  2%  interrupts.CPU78.PMI:Performance_monitoring_interrupts
    171.50 ± 20%     +50.0%     257.25        interrupts.CPU79.NMI:Non-maskable_interrupts
    171.50 ± 20%     +50.0%     257.25        interrupts.CPU79.PMI:Performance_monitoring_interrupts
      3020 ±  2%     -53.1%       1415 ±  4%  interrupts.CPU79.TLB:TLB_shootdowns
    170.00 ± 20%     +53.8%     261.50 ±  2%  interrupts.CPU80.NMI:Non-maskable_interrupts
    170.00 ± 20%     +53.8%     261.50 ±  2%  interrupts.CPU80.PMI:Performance_monitoring_interrupts
    170.25 ± 21%     +50.7%     256.50        interrupts.CPU81.NMI:Non-maskable_interrupts
    170.25 ± 21%     +50.7%     256.50        interrupts.CPU81.PMI:Performance_monitoring_interrupts
      3339 ± 99%    -100.0%       0.00        interrupts.CPU81.TLB:TLB_shootdowns
    176.25 ± 20%     +47.5%     260.00        interrupts.CPU82.NMI:Non-maskable_interrupts
    176.25 ± 20%     +47.5%     260.00        interrupts.CPU82.PMI:Performance_monitoring_interrupts
    203.00 ± 21%     +24.5%     252.75 ±  3%  interrupts.CPU83.NMI:Non-maskable_interrupts
    203.00 ± 21%     +24.5%     252.75 ±  3%  interrupts.CPU83.PMI:Performance_monitoring_interrupts
    175.50 ± 19%     +45.7%     255.75        interrupts.CPU84.NMI:Non-maskable_interrupts
    175.50 ± 19%     +45.7%     255.75        interrupts.CPU84.PMI:Performance_monitoring_interrupts
    175.50 ± 20%     +45.4%     255.25        interrupts.CPU85.NMI:Non-maskable_interrupts
    175.50 ± 20%     +45.4%     255.25        interrupts.CPU85.PMI:Performance_monitoring_interrupts
    175.00 ± 21%     +49.0%     260.75        interrupts.CPU86.NMI:Non-maskable_interrupts
    175.00 ± 21%     +49.0%     260.75        interrupts.CPU86.PMI:Performance_monitoring_interrupts
    172.25 ± 21%     +51.2%     260.50        interrupts.CPU87.NMI:Non-maskable_interrupts
    172.25 ± 21%     +51.2%     260.50        interrupts.CPU87.PMI:Performance_monitoring_interrupts
    175.75 ± 21%     +51.9%     267.00 ±  3%  interrupts.CPU88.NMI:Non-maskable_interrupts
    175.75 ± 21%     +51.9%     267.00 ±  3%  interrupts.CPU88.PMI:Performance_monitoring_interrupts
    176.00 ± 22%     +47.6%     259.75        interrupts.CPU89.NMI:Non-maskable_interrupts
    176.00 ± 22%     +47.6%     259.75        interrupts.CPU89.PMI:Performance_monitoring_interrupts
    173.75 ± 21%     +47.2%     255.75        interrupts.CPU90.NMI:Non-maskable_interrupts
    173.75 ± 21%     +47.2%     255.75        interrupts.CPU90.PMI:Performance_monitoring_interrupts
    177.50 ± 21%     +43.2%     254.25 ±  2%  interrupts.CPU91.NMI:Non-maskable_interrupts
    177.50 ± 21%     +43.2%     254.25 ±  2%  interrupts.CPU91.PMI:Performance_monitoring_interrupts
    176.25 ± 20%     +45.4%     256.25        interrupts.CPU93.NMI:Non-maskable_interrupts
    176.25 ± 20%     +45.4%     256.25        interrupts.CPU93.PMI:Performance_monitoring_interrupts
    177.00 ± 19%     +46.0%     258.50        interrupts.CPU94.NMI:Non-maskable_interrupts
    177.00 ± 19%     +46.0%     258.50        interrupts.CPU94.PMI:Performance_monitoring_interrupts
    193.75 ± 17%     +34.2%     260.00        interrupts.CPU95.NMI:Non-maskable_interrupts
    193.75 ± 17%     +34.2%     260.00        interrupts.CPU95.PMI:Performance_monitoring_interrupts
      7317           -55.3%       3270 ±  4%  interrupts.CPU96.NMI:Non-maskable_interrupts
      7317           -55.3%       3270 ±  4%  interrupts.CPU96.PMI:Performance_monitoring_interrupts
    142.50 ± 20%     -72.6%      39.00 ±  6%  interrupts.CPU96.RES:Rescheduling_interrupts
      7113 ±  4%     -65.5%       2451 ± 36%  interrupts.CPU97.NMI:Non-maskable_interrupts
      7113 ±  4%     -65.5%       2451 ± 36%  interrupts.CPU97.PMI:Performance_monitoring_interrupts
    124.50 ±  2%     -59.4%      50.50 ± 56%  interrupts.CPU97.RES:Rescheduling_interrupts
      6402 ± 24%     -61.7%       2451 ± 36%  interrupts.CPU98.NMI:Non-maskable_interrupts
      6402 ± 24%     -61.7%       2451 ± 36%  interrupts.CPU98.PMI:Performance_monitoring_interrupts
    120.75 ±  2%     -73.5%      32.00 ±  4%  interrupts.CPU98.RES:Rescheduling_interrupts
      6402 ± 24%     -60.7%       2513 ± 33%  interrupts.CPU99.NMI:Non-maskable_interrupts
      6402 ± 24%     -60.7%       2513 ± 33%  interrupts.CPU99.PMI:Performance_monitoring_interrupts
    420164 ± 17%     -39.5%     254084        interrupts.NMI:Non-maskable_interrupts
    420164 ± 17%     -39.5%     254084        interrupts.PMI:Performance_monitoring_interrupts
    115628 ± 22%     -38.8%      70767 ± 16%  interrupts.RES:Rescheduling_interrupts





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


Thanks,
Rong Chen


--POjlveFHrWq2ZO+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-5.6.0-rc6-00109-g06c4d00466eb3"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.6.0-rc6 Kernel Configuration
#

#
# Compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
#
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=70500
CONFIG_CLANG_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_WARN_MAYBE_UNINITIALIZED=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_DATA=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING=y
# CONFIG_CONTEXT_TRACKING_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
# CONFIG_IRQ_TIME_ACCOUNTING is not set
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# end of RCU Subsystem

CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
CONFIG_MEMCG_SWAP_ENABLED=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_BPF_SYSCALL=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_USERFAULTFD=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_MEMCG_SYSFS_ON is not set
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_SLUB_CPU_PARTIAL=y
CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_ARCH_DEFCONFIG="arch/x86/configs/x86_64_defconfig"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ZONE_DMA32=y
CONFIG_AUDIT_ARCH=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DYNAMIC_PHYSICAL_MASK=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_ZONE_DMA=y
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_RETPOLINE=y
CONFIG_X86_CPU_RESCTRL=y
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
CONFIG_X86_AMD_PLATFORM_DEVICE=y
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
CONFIG_PARAVIRT_XXL=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_XEN=y
CONFIG_XEN_PV=y
CONFIG_XEN_PV_SMP=y
# CONFIG_XEN_DOM0 is not set
CONFIG_XEN_PVHVM=y
CONFIG_XEN_PVHVM_SMP=y
CONFIG_XEN_512GB=y
CONFIG_XEN_SAVE_RESTORE=y
# CONFIG_XEN_DEBUG_FS is not set
# CONFIG_XEN_PVH is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_KVM_DEBUG_FS is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
# CONFIG_PROCESSOR_SELECT is not set
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
CONFIG_GART_IOMMU=y
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_AMD=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m
CONFIG_X86_THERMAL_VECTOR=y

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_I8K=m
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_AMD=y
CONFIG_MICROCODE_OLD_INTERFACE=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_AMD_MEM_ENCRYPT=y
# CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
CONFIG_NUMA=y
CONFIG_AMD_NUMA=y
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NODES_SPAN_OTHER_NODES=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_MEMORY_PROBE=y
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_X86_RESERVE_LOW=64
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_UMIP=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_MIXED=y
CONFIG_SECCOMP=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
CONFIG_RANDOMIZE_BASE=y
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_RANDOMIZE_MEMORY=y
CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=0xa
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_EMULATE=y
# CONFIG_LEGACY_VSYSCALL_XONLY is not set
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_DPM_WATCHDOG is not set
CONFIG_PM_TRACE=y
CONFIG_PM_TRACE_RTC=y
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
# CONFIG_ACPI_PROCFS_POWER is not set
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_TAD is not set
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
CONFIG_ACPI_CUSTOM_METHOD=m
CONFIG_ACPI_BGRT=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
CONFIG_ACPI_APEI_ERST_DEBUG=y
# CONFIG_DPTF_POWER is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_PMIC_OPREGION is not set
# CONFIG_ACPI_CONFIGFS is not set
CONFIG_X86_PM_TIMER=y
CONFIG_SFI=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
# CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
CONFIG_X86_PCC_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ_CPB=y
CONFIG_X86_POWERNOW_K8=m
CONFIG_X86_AMD_FREQ_SENSITIVITY=m
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_XEN=y
CONFIG_MMCONF_FAM10H=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# CONFIG_X86_SYSFB is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32 is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
CONFIG_SYSVIPC_COMPAT=y
# end of Binary Emulations

#
# Firmware Drivers
#
CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_ISCSI_IBFT_FIND=y
CONFIG_ISCSI_IBFT=m
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_VARS=y
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_WRAPPERS=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
CONFIG_APPLE_PROPERTIES=y
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y
CONFIG_EFI_DEV_PATH_PARSER=y
CONFIG_EFI_EARLYCON=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
CONFIG_KVM_WERROR=y
CONFIG_KVM_INTEL=m
CONFIG_KVM_AMD=m
CONFIG_KVM_AMD_SEV=y
CONFIG_KVM_MMU_AUDIT=y
CONFIG_VHOST_NET=m
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=m
CONFIG_VHOST=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_OPROFILE=m
CONFIG_OPROFILE_EVENT_MULTIPLEX=y
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP_FILTER=y
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_HAVE_COPY_THREAD_TLS=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_PLUGIN_HOSTCC="g++"
CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_CYC_COMPLEXITY is not set
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
# CONFIG_GCC_PLUGIN_RANDSTRUCT is not set
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
# CONFIG_MODULE_COMPRESS is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
# CONFIG_BLK_CMDLINE_PARSER is not set
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
# CONFIG_BLK_SED_OPAL is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
# CONFIG_ATARI_PARTITION is not set
CONFIG_MAC_PARTITION=y
CONFIG_MSDOS_PARTITION=y
CONFIG_BSD_DISKLABEL=y
CONFIG_MINIX_SUBPARTITION=y
CONFIG_SOLARIS_X86_PARTITION=y
CONFIG_UNIXWARE_DISKLABEL=y
# CONFIG_LDM_PARTITION is not set
CONFIG_SGI_PARTITION=y
# CONFIG_ULTRIX_PARTITION is not set
CONFIG_SUN_PARTITION=y
CONFIG_KARMA_PARTITION=y
CONFIG_EFI_PARTITION=y
# CONFIG_SYSV68_PARTITION is not set
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG_SPARSE=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_BOUNCE=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_THP_SWAP=y
CONFIG_TRANSPARENT_HUGE_PAGECACHE=y
CONFIG_CLEANCACHE=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_AREAS=7
CONFIG_MEM_SOFT_DIRTY=y
CONFIG_ZSWAP=y
CONFIG_ZPOOL=y
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
# CONFIG_PGTABLE_MAPPING is not set
# CONFIG_ZSMALLOC_STAT is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DEVICE=y
CONFIG_DEV_PAGEMAP_OPS=y
# CONFIG_DEVICE_PRIVATE is not set
CONFIG_FRAME_VECTOR=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_BENCHMARK is not set
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_MAPPING_DIRTY_HELPERS=y
# end of Memory Management options

CONFIG_NET=y
CONFIG_COMPAT_NETLINK_MESSAGES=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_UNIX_DIAG=m
# CONFIG_TLS is not set
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
CONFIG_NET_FOU=m
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
# CONFIG_INET_ESP_OFFLOAD is not set
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
# CONFIG_TCP_CONG_NV is not set
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
# CONFIG_TCP_CONG_BBR is not set
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
# CONFIG_INET6_ESP_OFFLOAD is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_FOU=m
CONFIG_IPV6_FOU_TUNNEL=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
CONFIG_IPV6_SEG6_LWTUNNEL=y
# CONFIG_IPV6_SEG6_HMAC is not set
CONFIG_IPV6_SEG6_BPF=y
CONFIG_NETLABEL=y
CONFIG_MPTCP=y
CONFIG_MPTCP_IPV6=y
# CONFIG_MPTCP_HMAC_TEST is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
CONFIG_NETFILTER_NETLINK_ACCT=m
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_COMMON=m
# CONFIG_NF_LOG_NETDEV is not set
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
# CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
# CONFIG_NF_TABLES_SET is not set
# CONFIG_NF_TABLES_INET is not set
# CONFIG_NF_TABLES_NETDEV is not set
# CONFIG_NFT_NUMGEN is not set
CONFIG_NFT_CT=m
CONFIG_NFT_COUNTER=m
# CONFIG_NFT_CONNLIMIT is not set
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
# CONFIG_NFT_TUNNEL is not set
# CONFIG_NFT_OBJREF is not set
CONFIG_NFT_QUEUE=m
# CONFIG_NFT_QUOTA is not set
CONFIG_NFT_REJECT=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
# CONFIG_NFT_XFRM is not set
# CONFIG_NFT_SOCKET is not set
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
CONFIG_NETFILTER_XT_TARGET_LED=m
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
CONFIG_NETFILTER_XT_MATCH_L2TP=m
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
CONFIG_NETFILTER_XT_MATCH_NFACCT=m
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
CONFIG_NETFILTER_XT_MATCH_TIME=m
CONFIG_NETFILTER_XT_MATCH_U32=m
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
CONFIG_IP_SET_HASH_IP=m
CONFIG_IP_SET_HASH_IPMARK=m
CONFIG_IP_SET_HASH_IPPORT=m
CONFIG_IP_SET_HASH_IPPORTIP=m
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
CONFIG_IP_SET_HASH_MAC=m
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
# CONFIG_IP_VS_FO is not set
# CONFIG_IP_VS_OVF is not set
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
# CONFIG_NF_TABLES_IPV4 is not set
# CONFIG_NF_TABLES_ARP is not set
CONFIG_NF_DUP_IPV4=m
# CONFIG_NF_LOG_ARP is not set
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_CLUSTERIP=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
# CONFIG_NF_TABLES_IPV6 is not set
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
CONFIG_IP6_NF_TARGET_HL=m
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
# CONFIG_NF_TABLES_BRIDGE is not set
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=m
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=m
# CONFIG_ATM_MPOA is not set
CONFIG_ATM_BR2684=m
# CONFIG_ATM_BR2684_IPFILTER is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=m
CONFIG_L2TP_ETH=m
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
CONFIG_HAVE_NET_DSA=y
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
# CONFIG_DECNET is not set
CONFIG_LLC=m
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
CONFIG_6LOWPAN_NHC=m
CONFIG_6LOWPAN_NHC_DEST=m
CONFIG_6LOWPAN_NHC_FRAGMENT=m
CONFIG_6LOWPAN_NHC_HOP=m
CONFIG_6LOWPAN_NHC_IPV6=m
CONFIG_6LOWPAN_NHC_MOBILITY=m
CONFIG_6LOWPAN_NHC_ROUTING=m
CONFIG_6LOWPAN_NHC_UDP=m
# CONFIG_6LOWPAN_GHC_EXT_HDR_HOP is not set
# CONFIG_6LOWPAN_GHC_UDP is not set
# CONFIG_6LOWPAN_GHC_ICMPV6 is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_DEST is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE is not set
CONFIG_IEEE802154=m
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
CONFIG_IEEE802154_6LOWPAN=m
CONFIG_MAC802154=m
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_ATM=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=m
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
# CONFIG_NET_SCH_HHF is not set
# CONFIG_NET_SCH_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
# CONFIG_NET_SCH_ETS is not set
# CONFIG_NET_SCH_DEFAULT is not set

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=m
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
# CONFIG_NET_EMATCH_CANID is not set
CONFIG_NET_EMATCH_IPSET=m
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
CONFIG_NET_ACT_IPT=m
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=m
# CONFIG_NET_ACT_BPF is not set
CONFIG_NET_ACT_CONNMARK=m
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=m
# CONFIG_NET_ACT_CT is not set
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_OPENVSWITCH_VXLAN=m
CONFIG_OPENVSWITCH_GENEVE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_HYPERV_VSOCKETS=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=m
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_NET_NCSI is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set

#
# CAN Device Drivers
#
CONFIG_CAN_VCAN=m
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_SLCAN=m
CONFIG_CAN_DEV=m
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_KVASER_PCIEFD is not set
CONFIG_CAN_C_CAN=m
CONFIG_CAN_C_CAN_PLATFORM=m
CONFIG_CAN_C_CAN_PCI=m
CONFIG_CAN_CC770=m
# CONFIG_CAN_CC770_ISA is not set
CONFIG_CAN_CC770_PLATFORM=m
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
CONFIG_CAN_SJA1000=m
CONFIG_CAN_EMS_PCI=m
# CONFIG_CAN_F81601 is not set
CONFIG_CAN_KVASER_PCI=m
CONFIG_CAN_PEAK_PCI=m
CONFIG_CAN_PEAK_PCIEC=y
CONFIG_CAN_PLX_PCI=m
# CONFIG_CAN_SJA1000_ISA is not set
CONFIG_CAN_SJA1000_PLATFORM=m
CONFIG_CAN_SOFTING=m

#
# CAN SPI interfaces
#
# CONFIG_CAN_HI311X is not set
# CONFIG_CAN_MCP251X is not set
# end of CAN SPI interfaces

#
# CAN USB interfaces
#
CONFIG_CAN_8DEV_USB=m
CONFIG_CAN_EMS_USB=m
CONFIG_CAN_ESD_USB2=m
# CONFIG_CAN_GS_USB is not set
CONFIG_CAN_KVASER_USB=m
# CONFIG_CAN_MCBA_USB is not set
CONFIG_CAN_PEAK_USB=m
# CONFIG_CAN_UCAN is not set
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
# end of CAN Device Drivers

CONFIG_BT=m
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=m
CONFIG_BT_RFCOMM_TTY=y
CONFIG_BT_BNEP=m
CONFIG_BT_BNEP_MC_FILTER=y
CONFIG_BT_BNEP_PROTO_FILTER=y
CONFIG_BT_CMTP=m
CONFIG_BT_HIDP=m
CONFIG_BT_HS=y
CONFIG_BT_LE=y
# CONFIG_BT_6LOWPAN is not set
# CONFIG_BT_LEDS is not set
# CONFIG_BT_SELFTEST is not set
CONFIG_BT_DEBUGFS=y

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=m
CONFIG_BT_BCM=m
CONFIG_BT_RTL=m
CONFIG_BT_HCIBTUSB=m
# CONFIG_BT_HCIBTUSB_AUTOSUSPEND is not set
CONFIG_BT_HCIBTUSB_BCM=y
# CONFIG_BT_HCIBTUSB_MTK is not set
CONFIG_BT_HCIBTUSB_RTL=y
CONFIG_BT_HCIBTSDIO=m
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_H4=y
CONFIG_BT_HCIUART_BCSP=y
CONFIG_BT_HCIUART_ATH3K=y
# CONFIG_BT_HCIUART_INTEL is not set
# CONFIG_BT_HCIUART_AG6XX is not set
CONFIG_BT_HCIBCM203X=m
CONFIG_BT_HCIBPA10X=m
CONFIG_BT_HCIBFUSB=m
CONFIG_BT_HCIVHCI=m
CONFIG_BT_MRVL=m
CONFIG_BT_MRVL_SDIO=m
CONFIG_BT_ATH3K=m
# CONFIG_BT_MTKSDIO is not set
# end of Bluetooth device drivers

# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_WIRELESS_EXT=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_WEXT_PRIV=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_LIB80211=m
# CONFIG_LIB80211_DEBUG is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
CONFIG_MAC80211_MESH=y
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_WIMAX is not set
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_XEN is not set
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y
CONFIG_HAVE_EBPF_JIT=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
# CONFIG_PCIE_DPC is not set
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_BW is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
# CONFIG_PCI_PF_STUB is not set
# CONFIG_XEN_PCIDEV_FRONTEND is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
CONFIG_PCI_HYPERV=m
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_VMD=y
CONFIG_PCI_HYPERV_INTERFACE=m

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

CONFIG_PCCARD=y
# CONFIG_PCMCIA is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
CONFIG_YENTA=m
CONFIG_YENTA_O2=y
CONFIG_YENTA_RICOH=y
CONFIG_YENTA_TI=y
CONFIG_YENTA_ENE_TUNE=y
CONFIG_YENTA_TOSHIBA=y
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_SYS_HYPERVISOR=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y
# CONFIG_GNSS is not set
CONFIG_MTD=m
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=m
CONFIG_MTD_BLOCK=m
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set
# CONFIG_RFD_FTL is not set
# CONFIG_SSFDC is not set
# CONFIG_SM_FTL is not set
# CONFIG_MTD_OOPS is not set
# CONFIG_MTD_SWAP is not set
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_INTEL_VR_NOR is not set
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_DATAFLASH is not set
# CONFIG_MTD_MCHP23K256 is not set
# CONFIG_MTD_SST25L is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
# end of Self-contained MTD device drivers

# CONFIG_MTD_ONENAND is not set
# CONFIG_MTD_RAW_NAND is not set
# CONFIG_MTD_SPI_NAND is not set

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_SPI_NOR is not set
CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
# CONFIG_MTD_UBI_GLUEBI is not set
# CONFIG_MTD_UBI_BLOCK is not set
# CONFIG_MTD_HYPERBUS is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
CONFIG_BLK_DEV_FD=m
CONFIG_CDROM=m
# CONFIG_PARIDE is not set
CONFIG_BLK_DEV_PCIESSD_MTIP32XX=m
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_UMEM is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_CRYPTOLOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
# CONFIG_BLK_DEV_SKD is not set
CONFIG_BLK_DEV_SX8=m
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
CONFIG_ATA_OVER_ETH=m
CONFIG_XEN_BLKDEV_FRONTEND=m
CONFIG_VIRTIO_BLK=y
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_RSXX is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=m
CONFIG_NVME_FC=m
# CONFIG_NVME_TCP is not set
CONFIG_NVME_TARGET=m
CONFIG_NVME_TARGET_LOOP=m
CONFIG_NVME_TARGET_FC=m
CONFIG_NVME_TARGET_FCLOOP=m
# CONFIG_NVME_TARGET_TCP is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_SGI_XP=m
CONFIG_HP_ILO=m
CONFIG_SGI_GRU=m
# CONFIG_SGI_GRU_DEBUG is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_VMWARE_BALLOON=m
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_PVPANIC=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=m
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_HDCP is not set
CONFIG_VMWARE_VMCI=m

#
# Intel MIC & related support
#
# CONFIG_INTEL_MIC_BUS is not set
# CONFIG_SCIF_BUS is not set
# CONFIG_VOP_BUS is not set
# end of Intel MIC & related support

# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_HABANA_AI is not set
# end of Misc devices

CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_BLK_DEV_SR_VENDOR=y
CONFIG_CHR_DEV_SG=m
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
CONFIG_ISCSI_TCP=m
CONFIG_ISCSI_BOOT_SYSFS=m
CONFIG_SCSI_CXGB3_ISCSI=m
CONFIG_SCSI_CXGB4_ISCSI=m
CONFIG_SCSI_BNX2_ISCSI=m
CONFIG_SCSI_BNX2X_FCOE=m
CONFIG_BE2ISCSI=m
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
CONFIG_SCSI_HPSA=m
CONFIG_SCSI_3W_9XXX=m
CONFIG_SCSI_3W_SAS=m
# CONFIG_SCSI_ACARD is not set
CONFIG_SCSI_AACRAID=m
# CONFIG_SCSI_AIC7XXX is not set
CONFIG_SCSI_AIC79XX=m
CONFIG_AIC79XX_CMDS_PER_DEVICE=4
CONFIG_AIC79XX_RESET_DELAY_MS=15000
# CONFIG_AIC79XX_DEBUG_ENABLE is not set
CONFIG_AIC79XX_DEBUG_MASK=0
# CONFIG_AIC79XX_REG_PRETTY_PRINT is not set
# CONFIG_SCSI_AIC94XX is not set
CONFIG_SCSI_MVSAS=m
# CONFIG_SCSI_MVSAS_DEBUG is not set
CONFIG_SCSI_MVSAS_TASKLET=y
CONFIG_SCSI_MVUMI=m
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
CONFIG_SCSI_ARCMSR=m
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
CONFIG_MEGARAID_SAS=m
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
CONFIG_SCSI_MPT2SAS=m
# CONFIG_SCSI_SMARTPQI is not set
CONFIG_SCSI_UFSHCD=m
CONFIG_SCSI_UFSHCD_PCI=m
# CONFIG_SCSI_UFS_DWC_TC_PCI is not set
# CONFIG_SCSI_UFSHCD_PLATFORM is not set
# CONFIG_SCSI_UFS_BSG is not set
CONFIG_SCSI_HPTIOP=m
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
CONFIG_VMWARE_PVSCSI=m
# CONFIG_XEN_SCSI_FRONTEND is not set
CONFIG_HYPERV_STORAGE=m
CONFIG_LIBFC=m
CONFIG_LIBFCOE=m
CONFIG_FCOE=m
CONFIG_FCOE_FNIC=m
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
# CONFIG_SCSI_GDTH is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
CONFIG_SCSI_INITIO=m
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
CONFIG_SCSI_STEX=m
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
CONFIG_SCSI_QLA_FC=m
CONFIG_TCM_QLA2XXX=m
# CONFIG_TCM_QLA2XXX_DEBUG is not set
CONFIG_SCSI_QLA_ISCSI=m
# CONFIG_QEDI is not set
# CONFIG_QEDF is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=m
CONFIG_SCSI_PMCRAID=m
CONFIG_SCSI_PM8001=m
# CONFIG_SCSI_BFA_FC is not set
CONFIG_SCSI_VIRTIO=m
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_SATA_INIC162X is not set
CONFIG_SATA_ACARD_AHCI=m
CONFIG_SATA_SIL24=m
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_PDC_ADMA=m
CONFIG_SATA_QSTOR=m
CONFIG_SATA_SX4=m
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
CONFIG_SATA_MV=m
CONFIG_SATA_NV=m
CONFIG_SATA_PROMISE=m
CONFIG_SATA_SIL=m
CONFIG_SATA_SIS=m
CONFIG_SATA_SVW=m
CONFIG_SATA_ULI=m
CONFIG_SATA_VIA=m
CONFIG_SATA_VITESSE=m

#
# PATA SFF controllers with BMDMA
#
CONFIG_PATA_ALI=m
CONFIG_PATA_AMD=m
CONFIG_PATA_ARTOP=m
CONFIG_PATA_ATIIXP=m
CONFIG_PATA_ATP867X=m
CONFIG_PATA_CMD64X=m
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
CONFIG_PATA_HPT366=m
CONFIG_PATA_HPT37X=m
CONFIG_PATA_HPT3X2N=m
CONFIG_PATA_HPT3X3=m
# CONFIG_PATA_HPT3X3_DMA is not set
CONFIG_PATA_IT8213=m
CONFIG_PATA_IT821X=m
CONFIG_PATA_JMICRON=m
CONFIG_PATA_MARVELL=m
CONFIG_PATA_NETCELL=m
CONFIG_PATA_NINJA32=m
# CONFIG_PATA_NS87415 is not set
CONFIG_PATA_OLDPIIX=m
# CONFIG_PATA_OPTIDMA is not set
CONFIG_PATA_PDC2027X=m
CONFIG_PATA_PDC_OLD=m
# CONFIG_PATA_RADISYS is not set
CONFIG_PATA_RDC=m
CONFIG_PATA_SCH=m
CONFIG_PATA_SERVERWORKS=m
CONFIG_PATA_SIL680=m
CONFIG_PATA_SIS=m
CONFIG_PATA_TOSHIBA=m
# CONFIG_PATA_TRIFLEX is not set
CONFIG_PATA_VIA=m
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_PLATFORM is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
CONFIG_PATA_ACPI=m
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
CONFIG_MD_MULTIPATH=m
CONFIG_MD_FAULTY=m
# CONFIG_MD_CLUSTER is not set
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
# CONFIG_DM_WRITECACHE is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
# CONFIG_DM_INTEGRITY is not set
# CONFIG_DM_ZONED is not set
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_TCM_FC=m
CONFIG_ISCSI_TARGET=m
CONFIG_ISCSI_TARGET_CXGB4=m
# CONFIG_SBP_TARGET is not set
CONFIG_FUSION=y
CONFIG_FUSION_SPI=m
# CONFIG_FUSION_FC is not set
CONFIG_FUSION_SAS=m
CONFIG_FUSION_MAX_SGE=128
CONFIG_FUSION_CTL=m
CONFIG_FUSION_LOGGING=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
CONFIG_BONDING=m
CONFIG_DUMMY=m
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
CONFIG_NET_FC=y
CONFIG_IFB=m
CONFIG_NET_TEAM=m
CONFIG_NET_TEAM_MODE_BROADCAST=m
CONFIG_NET_TEAM_MODE_ROUNDROBIN=m
CONFIG_NET_TEAM_MODE_RANDOM=m
CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=m
CONFIG_NET_TEAM_MODE_LOADBALANCE=m
CONFIG_MACVLAN=m
CONFIG_MACVTAP=m
# CONFIG_IPVLAN is not set
CONFIG_VXLAN=m
CONFIG_GENEVE=m
# CONFIG_GTP is not set
CONFIG_MACSEC=y
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_NTB_NETDEV=m
CONFIG_TUN=m
CONFIG_TAP=m
# CONFIG_TUN_VNET_CROSS_LE is not set
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
CONFIG_NLMON=m
CONFIG_NET_VRF=y
CONFIG_VSOCKMON=m
# CONFIG_ARCNET is not set
# CONFIG_ATM_DRIVERS is not set

#
# Distributed Switch Architecture drivers
#
# end of Distributed Switch Architecture drivers

CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_NET_VENDOR_ADAPTEC is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
CONFIG_ENA_ETHERNET=m
CONFIG_NET_VENDOR_AMD=y
CONFIG_AMD8111_ETH=m
CONFIG_PCNET32=m
CONFIG_AMD_XGBE=m
# CONFIG_AMD_XGBE_DCB is not set
CONFIG_AMD_XGBE_HAVE_ECC=y
CONFIG_NET_VENDOR_AQUANTIA=y
CONFIG_AQTION=m
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ATHEROS=y
CONFIG_ATL2=m
CONFIG_ATL1=m
CONFIG_ATL1E=m
CONFIG_ATL1C=m
CONFIG_ALX=m
CONFIG_NET_VENDOR_AURORA=y
# CONFIG_AURORA_NB8800 is not set
CONFIG_NET_VENDOR_BROADCOM=y
CONFIG_B44=m
CONFIG_B44_PCI_AUTOSELECT=y
CONFIG_B44_PCICORE_AUTOSELECT=y
CONFIG_B44_PCI=y
# CONFIG_BCMGENET is not set
CONFIG_BNX2=m
CONFIG_CNIC=m
CONFIG_TIGON3=y
CONFIG_TIGON3_HWMON=y
CONFIG_BNX2X=m
CONFIG_BNX2X_SRIOV=y
# CONFIG_SYSTEMPORT is not set
CONFIG_BNXT=m
CONFIG_BNXT_SRIOV=y
CONFIG_BNXT_FLOWER_OFFLOAD=y
CONFIG_BNXT_DCB=y
CONFIG_BNXT_HWMON=y
CONFIG_NET_VENDOR_BROCADE=y
CONFIG_BNA=m
CONFIG_NET_VENDOR_CADENCE=y
CONFIG_MACB=m
CONFIG_MACB_USE_HWSTAMP=y
# CONFIG_MACB_PCI is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
CONFIG_LIQUIDIO=m
CONFIG_LIQUIDIO_VF=m
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
CONFIG_CHELSIO_T3=m
CONFIG_CHELSIO_T4=m
# CONFIG_CHELSIO_T4_DCB is not set
CONFIG_CHELSIO_T4VF=m
CONFIG_CHELSIO_LIB=m
CONFIG_NET_VENDOR_CISCO=y
CONFIG_ENIC=m
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_CX_ECAT is not set
CONFIG_DNET=m
CONFIG_NET_VENDOR_DEC=y
CONFIG_NET_TULIP=y
CONFIG_DE2104X=m
CONFIG_DE2104X_DSL=0
CONFIG_TULIP=y
# CONFIG_TULIP_MWI is not set
CONFIG_TULIP_MMIO=y
# CONFIG_TULIP_NAPI is not set
CONFIG_DE4X5=m
CONFIG_WINBOND_840=m
CONFIG_DM9102=m
CONFIG_ULI526X=m
CONFIG_PCMCIA_XIRCOM=m
# CONFIG_NET_VENDOR_DLINK is not set
CONFIG_NET_VENDOR_EMULEX=y
CONFIG_BE2NET=m
CONFIG_BE2NET_HWMON=y
CONFIG_BE2NET_BE2=y
CONFIG_BE2NET_BE3=y
CONFIG_BE2NET_LANCER=y
CONFIG_BE2NET_SKYHAWK=y
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
# CONFIG_NET_VENDOR_I825XX is not set
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
CONFIG_IGBVF=m
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
CONFIG_IXGBE_DCB=y
CONFIG_IXGBEVF=m
CONFIG_I40E=y
CONFIG_I40E_DCB=y
CONFIG_IAVF=m
CONFIG_I40EVF=m
# CONFIG_ICE is not set
CONFIG_FM10K=m
# CONFIG_IGC is not set
CONFIG_JME=m
CONFIG_NET_VENDOR_MARVELL=y
CONFIG_MVMDIO=m
CONFIG_SKGE=y
# CONFIG_SKGE_DEBUG is not set
CONFIG_SKGE_GENESIS=y
CONFIG_SKY2=m
# CONFIG_SKY2_DEBUG is not set
CONFIG_NET_VENDOR_MELLANOX=y
CONFIG_MLX4_EN=m
CONFIG_MLX4_EN_DCB=y
CONFIG_MLX4_CORE=m
CONFIG_MLX4_DEBUG=y
CONFIG_MLX4_CORE_GEN2=y
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
# CONFIG_NET_VENDOR_MICREL is not set
# CONFIG_NET_VENDOR_MICROCHIP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
# CONFIG_MSCC_OCELOT_SWITCH is not set
CONFIG_NET_VENDOR_MYRI=y
CONFIG_MYRI10GE=m
CONFIG_MYRI10GE_DCA=y
# CONFIG_FEALNX is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_VXGE is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NFP=m
CONFIG_NFP_APP_FLOWER=y
CONFIG_NFP_APP_ABM_NIC=y
# CONFIG_NFP_DEBUG is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
# CONFIG_NET_VENDOR_NVIDIA is not set
CONFIG_NET_VENDOR_OKI=y
CONFIG_ETHOC=m
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
CONFIG_YELLOWFIN=m
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
CONFIG_QLA3XXX=m
CONFIG_QLCNIC=m
CONFIG_QLCNIC_SRIOV=y
CONFIG_QLCNIC_DCB=y
CONFIG_QLCNIC_HWMON=y
CONFIG_NETXEN_NIC=m
CONFIG_QED=m
CONFIG_QED_SRIOV=y
CONFIG_QEDE=m
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
# CONFIG_NET_VENDOR_RDC is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
CONFIG_8139CP=y
CONFIG_8139TOO=y
# CONFIG_8139TOO_PIO is not set
# CONFIG_8139TOO_TUNE_TWISTER is not set
CONFIG_8139TOO_8129=y
# CONFIG_8139_OLD_RX_RESET is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_ROCKER=m
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
# CONFIG_NET_VENDOR_SEEQ is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
CONFIG_SFC=m
CONFIG_SFC_MTD=y
CONFIG_SFC_MCDI_MON=y
CONFIG_SFC_SRIOV=y
CONFIG_SFC_MCDI_LOGGING=y
CONFIG_SFC_FALCON=m
CONFIG_SFC_FALCON_MTD=y
# CONFIG_NET_VENDOR_SILAN is not set
# CONFIG_NET_VENDOR_SIS is not set
CONFIG_NET_VENDOR_SMSC=y
CONFIG_EPIC100=m
# CONFIG_SMSC911X is not set
CONFIG_SMSC9420=m
CONFIG_NET_VENDOR_SOCIONEXT=y
# CONFIG_NET_VENDOR_STMICRO is not set
# CONFIG_NET_VENDOR_SUN is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
# CONFIG_NET_VENDOR_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
CONFIG_TLAN=m
# CONFIG_NET_VENDOR_VIA is not set
# CONFIG_NET_VENDOR_WIZNET is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
# CONFIG_MDIO_BCM_UNIMAC is not set
CONFIG_MDIO_BITBANG=m
# CONFIG_MDIO_GPIO is not set
# CONFIG_MDIO_MSCC_MIIM is not set
# CONFIG_MDIO_THUNDER is not set
CONFIG_PHYLINK=m
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set

#
# MII PHY device drivers
#
# CONFIG_SFP is not set
# CONFIG_ADIN_PHY is not set
CONFIG_AMD_PHY=m
# CONFIG_AQUANTIA_PHY is not set
# CONFIG_AX88796B_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
CONFIG_BCM87XX_PHY=m
CONFIG_BCM_NET_PHYLIB=m
CONFIG_BROADCOM_PHY=m
# CONFIG_BCM84881_PHY is not set
CONFIG_CICADA_PHY=m
# CONFIG_CORTINA_PHY is not set
CONFIG_DAVICOM_PHY=m
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
CONFIG_FIXED_PHY=y
CONFIG_ICPLUS_PHY=m
# CONFIG_INTEL_XWAY_PHY is not set
CONFIG_LSI_ET1011C_PHY=m
CONFIG_LXT_PHY=m
CONFIG_MARVELL_PHY=m
# CONFIG_MARVELL_10G_PHY is not set
CONFIG_MICREL_PHY=m
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
CONFIG_NATIONAL_PHY=m
# CONFIG_NXP_TJA11XX_PHY is not set
CONFIG_QSEMI_PHY=m
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
CONFIG_SMSC_PHY=m
CONFIG_STE10XP=m
# CONFIG_TERANETICS_PHY is not set
CONFIG_VITESSE_PHY=m
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PLIP is not set
CONFIG_PPP=m
CONFIG_PPP_BSDCOMP=m
CONFIG_PPP_DEFLATE=m
CONFIG_PPP_FILTER=y
CONFIG_PPP_MPPE=m
CONFIG_PPP_MULTILINK=y
CONFIG_PPPOATM=m
CONFIG_PPPOE=m
CONFIG_PPTP=m
CONFIG_PPPOL2TP=m
CONFIG_PPP_ASYNC=m
CONFIG_PPP_SYNC_TTY=m
CONFIG_SLIP=m
CONFIG_SLHC=m
CONFIG_SLIP_COMPRESSED=y
CONFIG_SLIP_SMART=y
# CONFIG_SLIP_MODE_SLIP6 is not set
CONFIG_USB_NET_DRIVERS=y
CONFIG_USB_CATC=y
CONFIG_USB_KAWETH=y
CONFIG_USB_PEGASUS=y
CONFIG_USB_RTL8150=y
CONFIG_USB_RTL8152=m
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=m
CONFIG_USB_NET_CDCETHER=y
CONFIG_USB_NET_CDC_EEM=y
CONFIG_USB_NET_CDC_NCM=m
CONFIG_USB_NET_HUAWEI_CDC_NCM=m
CONFIG_USB_NET_CDC_MBIM=m
CONFIG_USB_NET_DM9601=y
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
CONFIG_USB_NET_SMSC75XX=y
CONFIG_USB_NET_SMSC95XX=y
CONFIG_USB_NET_GL620A=y
CONFIG_USB_NET_NET1080=y
CONFIG_USB_NET_PLUSB=y
CONFIG_USB_NET_MCS7830=y
CONFIG_USB_NET_RNDIS_HOST=y
CONFIG_USB_NET_CDC_SUBSET_ENABLE=y
CONFIG_USB_NET_CDC_SUBSET=y
CONFIG_USB_ALI_M5632=y
CONFIG_USB_AN2720=y
CONFIG_USB_BELKIN=y
CONFIG_USB_ARMLINUX=y
CONFIG_USB_EPSON2888=y
CONFIG_USB_KC2190=y
CONFIG_USB_NET_ZAURUS=y
CONFIG_USB_NET_CX82310_ETH=m
CONFIG_USB_NET_KALMIA=m
CONFIG_USB_NET_QMI_WWAN=m
CONFIG_USB_HSO=m
CONFIG_USB_NET_INT51X1=y
CONFIG_USB_IPHETH=y
CONFIG_USB_SIERRA_NET=y
CONFIG_USB_VL600=m
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
CONFIG_WLAN=y
# CONFIG_WIRELESS_WDS is not set
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_ADM8211 is not set
CONFIG_ATH_COMMON=m
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_ATH9K_HW=m
CONFIG_ATH9K_COMMON=m
CONFIG_ATH9K_BTCOEX_SUPPORT=y
# CONFIG_ATH9K is not set
CONFIG_ATH9K_HTC=m
# CONFIG_ATH9K_HTC_DEBUGFS is not set
# CONFIG_CARL9170 is not set
# CONFIG_ATH6KL is not set
# CONFIG_AR5523 is not set
# CONFIG_WIL6210 is not set
# CONFIG_ATH10K is not set
# CONFIG_WCN36XX is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
# CONFIG_AT76C50X_USB is not set
CONFIG_WLAN_VENDOR_BROADCOM=y
# CONFIG_B43 is not set
# CONFIG_B43LEGACY is not set
# CONFIG_BRCMSMAC is not set
# CONFIG_BRCMFMAC is not set
CONFIG_WLAN_VENDOR_CISCO=y
# CONFIG_AIRO is not set
CONFIG_WLAN_VENDOR_INTEL=y
# CONFIG_IPW2100 is not set
# CONFIG_IPW2200 is not set
CONFIG_IWLEGACY=m
CONFIG_IWL4965=m
CONFIG_IWL3945=m

#
# iwl3945 / iwl4965 Debugging Options
#
CONFIG_IWLEGACY_DEBUG=y
CONFIG_IWLEGACY_DEBUGFS=y
# end of iwl3945 / iwl4965 Debugging Options

CONFIG_IWLWIFI=m
CONFIG_IWLWIFI_LEDS=y
CONFIG_IWLDVM=m
CONFIG_IWLMVM=m
CONFIG_IWLWIFI_OPMODE_MODULAR=y
# CONFIG_IWLWIFI_BCAST_FILTERING is not set

#
# Debugging Options
#
# CONFIG_IWLWIFI_DEBUG is not set
CONFIG_IWLWIFI_DEBUGFS=y
# CONFIG_IWLWIFI_DEVICE_TRACING is not set
# end of Debugging Options

CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
# CONFIG_HERMES is not set
# CONFIG_P54_COMMON is not set
# CONFIG_PRISM54 is not set
CONFIG_WLAN_VENDOR_MARVELL=y
# CONFIG_LIBERTAS is not set
# CONFIG_LIBERTAS_THINFIRM is not set
# CONFIG_MWIFIEX is not set
# CONFIG_MWL8K is not set
CONFIG_WLAN_VENDOR_MEDIATEK=y
# CONFIG_MT7601U is not set
# CONFIG_MT76x0U is not set
# CONFIG_MT76x0E is not set
# CONFIG_MT76x2E is not set
# CONFIG_MT76x2U is not set
# CONFIG_MT7603E is not set
# CONFIG_MT7615E is not set
CONFIG_WLAN_VENDOR_RALINK=y
# CONFIG_RT2X00 is not set
CONFIG_WLAN_VENDOR_REALTEK=y
# CONFIG_RTL8180 is not set
# CONFIG_RTL8187 is not set
# CONFIG_RTL_CARDS is not set
# CONFIG_RTL8XXXU is not set
# CONFIG_RTW88 is not set
CONFIG_WLAN_VENDOR_RSI=y
# CONFIG_RSI_91X is not set
CONFIG_WLAN_VENDOR_ST=y
# CONFIG_CW1200 is not set
CONFIG_WLAN_VENDOR_TI=y
# CONFIG_WL1251 is not set
# CONFIG_WL12XX is not set
# CONFIG_WL18XX is not set
# CONFIG_WLCORE is not set
CONFIG_WLAN_VENDOR_ZYDAS=y
# CONFIG_USB_ZD1201 is not set
# CONFIG_ZD1211RW is not set
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_QTNFMAC_PCIE is not set
CONFIG_MAC80211_HWSIM=m
# CONFIG_USB_NET_RNDIS_WLAN is not set
# CONFIG_VIRT_WIFI is not set

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
CONFIG_WAN=y
# CONFIG_LANMEDIA is not set
CONFIG_HDLC=m
CONFIG_HDLC_RAW=m
# CONFIG_HDLC_RAW_ETH is not set
CONFIG_HDLC_CISCO=m
CONFIG_HDLC_FR=m
CONFIG_HDLC_PPP=m

#
# X.25/LAPB support is disabled
#
# CONFIG_PCI200SYN is not set
# CONFIG_WANXL is not set
# CONFIG_PC300TOO is not set
# CONFIG_FARSYNC is not set
CONFIG_DLCI=m
CONFIG_DLCI_MAX=8
# CONFIG_SBNI is not set
CONFIG_IEEE802154_DRIVERS=m
CONFIG_IEEE802154_FAKELB=m
# CONFIG_IEEE802154_AT86RF230 is not set
# CONFIG_IEEE802154_MRF24J40 is not set
# CONFIG_IEEE802154_CC2520 is not set
# CONFIG_IEEE802154_ATUSB is not set
# CONFIG_IEEE802154_ADF7242 is not set
# CONFIG_IEEE802154_CA8210 is not set
# CONFIG_IEEE802154_MCR20A is not set
# CONFIG_IEEE802154_HWSIM is not set
CONFIG_XEN_NETDEV_FRONTEND=m
CONFIG_VMXNET3=m
CONFIG_FUJITSU_ES=m
CONFIG_HYPERV_NET=m
CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=m
CONFIG_ISDN=y
CONFIG_ISDN_CAPI=y
CONFIG_CAPI_TRACE=y
CONFIG_ISDN_CAPI_MIDDLEWARE=y
CONFIG_MISDN=m
CONFIG_MISDN_DSP=m
CONFIG_MISDN_L1OIP=m

#
# mISDN hardware drivers
#
CONFIG_MISDN_HFCPCI=m
CONFIG_MISDN_HFCMULTI=m
CONFIG_MISDN_HFCUSB=m
CONFIG_MISDN_AVMFRITZ=m
CONFIG_MISDN_SPEEDFAX=m
CONFIG_MISDN_INFINEON=m
CONFIG_MISDN_W6692=m
CONFIG_MISDN_NETJET=m
CONFIG_MISDN_HDLC=m
CONFIG_MISDN_IPAC=m
CONFIG_MISDN_ISAR=m
CONFIG_NVM=y
# CONFIG_NVM_PBLK is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_POLLDEV=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
CONFIG_MOUSE_APPLETOUCH=m
CONFIG_MOUSE_BCM5974=m
CONFIG_MOUSE_CYAPA=m
# CONFIG_MOUSE_ELAN_I2C is not set
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
CONFIG_MOUSE_SYNAPTICS_USB=m
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=m
CONFIG_TABLET_USB_AIPTEK=m
CONFIG_TABLET_USB_GTCO=m
# CONFIG_TABLET_USB_HANWANG is not set
CONFIG_TABLET_USB_KBTAB=m
# CONFIG_TABLET_USB_PEGASUS is not set
# CONFIG_TABLET_SERIAL_WACOM4 is not set
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_PROPERTIES=y
# CONFIG_TOUCHSCREEN_ADS7846 is not set
# CONFIG_TOUCHSCREEN_AD7877 is not set
# CONFIG_TOUCHSCREEN_AD7879 is not set
# CONFIG_TOUCHSCREEN_ADC is not set
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
# CONFIG_TOUCHSCREEN_BU21013 is not set
# CONFIG_TOUCHSCREEN_BU21029 is not set
# CONFIG_TOUCHSCREEN_CHIPONE_ICN8505 is not set
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
# CONFIG_TOUCHSCREEN_EETI is not set
# CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
# CONFIG_TOUCHSCREEN_EXC3000 is not set
# CONFIG_TOUCHSCREEN_FUJITSU is not set
# CONFIG_TOUCHSCREEN_GOODIX is not set
# CONFIG_TOUCHSCREEN_HIDEEP is not set
# CONFIG_TOUCHSCREEN_ILI210X is not set
# CONFIG_TOUCHSCREEN_S6SY761 is not set
# CONFIG_TOUCHSCREEN_GUNZE is not set
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
# CONFIG_TOUCHSCREEN_ELAN is not set
CONFIG_TOUCHSCREEN_ELO=m
CONFIG_TOUCHSCREEN_WACOM_W8001=m
CONFIG_TOUCHSCREEN_WACOM_I2C=m
# CONFIG_TOUCHSCREEN_MAX11801 is not set
# CONFIG_TOUCHSCREEN_MCS5000 is not set
# CONFIG_TOUCHSCREEN_MMS114 is not set
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
# CONFIG_TOUCHSCREEN_MTOUCH is not set
# CONFIG_TOUCHSCREEN_INEXIO is not set
# CONFIG_TOUCHSCREEN_MK712 is not set
# CONFIG_TOUCHSCREEN_PENMOUNT is not set
# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
# CONFIG_TOUCHSCREEN_PIXCIR is not set
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
# CONFIG_TOUCHSCREEN_WM97XX is not set
# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
# CONFIG_TOUCHSCREEN_TSC2004 is not set
# CONFIG_TOUCHSCREEN_TSC2005 is not set
# CONFIG_TOUCHSCREEN_TSC2007 is not set
# CONFIG_TOUCHSCREEN_RM_TS is not set
# CONFIG_TOUCHSCREEN_SILEAD is not set
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
# CONFIG_TOUCHSCREEN_ST1232 is not set
# CONFIG_TOUCHSCREEN_STMFTS is not set
# CONFIG_TOUCHSCREEN_SUR40 is not set
# CONFIG_TOUCHSCREEN_SURFACE3_SPI is not set
# CONFIG_TOUCHSCREEN_SX8654 is not set
# CONFIG_TOUCHSCREEN_TPS6507X is not set
# CONFIG_TOUCHSCREEN_ZET6223 is not set
# CONFIG_TOUCHSCREEN_ZFORCE is not set
# CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
# CONFIG_TOUCHSCREEN_IQS5XX is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_AD714X is not set
# CONFIG_INPUT_BMA150 is not set
# CONFIG_INPUT_E3X0_BUTTON is not set
# CONFIG_INPUT_MSM_VIBRATOR is not set
CONFIG_INPUT_PCSPKR=m
# CONFIG_INPUT_MMA8450 is not set
CONFIG_INPUT_APANEL=m
CONFIG_INPUT_GP2A=m
# CONFIG_INPUT_GPIO_BEEPER is not set
# CONFIG_INPUT_GPIO_DECODER is not set
# CONFIG_INPUT_GPIO_VIBRA is not set
CONFIG_INPUT_ATLAS_BTNS=m
CONFIG_INPUT_ATI_REMOTE2=m
CONFIG_INPUT_KEYSPAN_REMOTE=m
# CONFIG_INPUT_KXTJ9 is not set
CONFIG_INPUT_POWERMATE=m
CONFIG_INPUT_YEALINK=m
CONFIG_INPUT_CM109=m
CONFIG_INPUT_UINPUT=m
# CONFIG_INPUT_PCF8574 is not set
# CONFIG_INPUT_PWM_BEEPER is not set
# CONFIG_INPUT_PWM_VIBRA is not set
CONFIG_INPUT_GPIO_ROTARY_ENCODER=m
# CONFIG_INPUT_ADXL34X is not set
# CONFIG_INPUT_IMS_PCU is not set
# CONFIG_INPUT_CMA3000 is not set
CONFIG_INPUT_XEN_KBDDEV_FRONTEND=m
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
# CONFIG_INPUT_DRV260X_HAPTICS is not set
# CONFIG_INPUT_DRV2665_HAPTICS is not set
# CONFIG_INPUT_DRV2667_HAPTICS is not set
CONFIG_RMI4_CORE=m
# CONFIG_RMI4_I2C is not set
# CONFIG_RMI4_SPI is not set
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F54 is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
CONFIG_HYPERV_KEYBOARD=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_ROCKETPORT is not set
CONFIG_CYCLADES=m
# CONFIG_CYZ_INTR is not set
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK=m
CONFIG_SYNCLINKMP=m
CONFIG_SYNCLINK_GT=m
CONFIG_NOZOMI=m
# CONFIG_ISI is not set
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
# CONFIG_TRACE_SINK is not set
# CONFIG_NULL_TTY is not set
CONFIG_LDISC_AUTOLOAD=y
CONFIG_DEVMEM=y
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=32
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_IFX6X60 is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_HVC_DRIVER=y
CONFIG_HVC_IRQ=y
CONFIG_HVC_XEN=y
CONFIG_HVC_XEN_FRONTEND=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
CONFIG_HW_RANDOM_AMD=m
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_NVRAM=y
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_RAW_DRIVER=y
CONFIG_MAX_RAW_DEVS=8192
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
# CONFIG_TCG_XEN is not set
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
CONFIG_DEVPORT=y
# CONFIG_XILLYBUS is not set
# end of Character devices

# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
CONFIG_I2C_AMD756=m
CONFIG_I2C_AMD756_S4882=m
CONFIG_I2C_AMD8111=m
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=m
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=m
CONFIG_I2C_VIPERBOARD=m

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_OC_TINY is not set
CONFIG_SPI_PXA2XX=m
CONFIG_SPI_PXA2XX_PCI=m
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_DP83640_PHY=m
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
CONFIG_PINCTRL_AMD=m
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_BAYTRAIL=y
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
CONFIG_PINCTRL_INTEL=m
# CONFIG_PINCTRL_BROXTON is not set
CONFIG_PINCTRL_CANNONLAKE=m
# CONFIG_PINCTRL_CEDARFORK is not set
CONFIG_PINCTRL_DENVERTON=m
CONFIG_PINCTRL_GEMINILAKE=m
# CONFIG_PINCTRL_ICELAKE is not set
CONFIG_PINCTRL_LEWISBURG=m
CONFIG_PINCTRL_SUNRISEPOINT=m
# CONFIG_PINCTRL_TIGERLAKE is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_AMDPT=m
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=m
# end of USB GPIO expanders

CONFIG_GPIO_MOCKUP=y
# CONFIG_W1 is not set
# CONFIG_POWER_AVS is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_GENERIC_ADC_BATTERY is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_SMB347=m
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_CHARGER_RT9455 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_K10TEMP=m
CONFIG_SENSORS_FAM15H_POWER=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DELL_SMM=m
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
# CONFIG_SENSORS_IIO_HWMON is not set
# CONFIG_SENSORS_I5500 is not set
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
CONFIG_THERMAL=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_CLOCK_THERMAL is not set
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_PKG_TEMP_THERMAL=m
CONFIG_INTEL_SOC_DTS_IOSF_CORE=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
CONFIG_INT340X_THERMAL=m
CONFIG_ACPI_THERMAL_REL=m
# CONFIG_INT3406_THERMAL is not set
CONFIG_PROC_THERMAL_MMIO_RAPL=y
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
# end of Intel thermal drivers

# CONFIG_GENERIC_ADC_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
CONFIG_F71808E_WDT=m
CONFIG_SP5100_TCO=m
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set
CONFIG_XEN_WDT=m

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=m
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
# CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_EZX_PCAP is not set
CONFIG_MFD_VIPERBOARD=m
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_UCB1400_CORE is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SMSC is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_RC_MAP=m
CONFIG_LIRC=y
CONFIG_RC_DECODERS=y
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_SONY_DECODER=m
CONFIG_IR_SANYO_DECODER=m
CONFIG_IR_SHARP_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_IR_IMON_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_RC_ATI_REMOTE=m
CONFIG_IR_ENE=m
CONFIG_IR_IMON=m
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_MCEUSB=m
CONFIG_IR_ITE_CIR=m
CONFIG_IR_FINTEK=m
CONFIG_IR_NUVOTON=m
CONFIG_IR_REDRAT3=m
CONFIG_IR_STREAMZAP=m
CONFIG_IR_WINBOND_CIR=m
# CONFIG_IR_IGORPLUGUSB is not set
CONFIG_IR_IGUANA=m
CONFIG_IR_TTUSBIR=m
CONFIG_RC_LOOPBACK=m
# CONFIG_IR_SERIAL is not set
# CONFIG_IR_SIR is not set
# CONFIG_RC_XBOX_DVD is not set
CONFIG_MEDIA_SUPPORT=m

#
# Multimedia core support
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
CONFIG_MEDIA_CONTROLLER=y
CONFIG_MEDIA_CONTROLLER_DVB=y
CONFIG_VIDEO_DEV=m
# CONFIG_VIDEO_V4L2_SUBDEV_API is not set
CONFIG_VIDEO_V4L2=m
CONFIG_VIDEO_V4L2_I2C=y
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_VIDEO_TUNER=m
CONFIG_VIDEOBUF_GEN=m
CONFIG_VIDEOBUF_DMA_SG=m
CONFIG_VIDEOBUF_VMALLOC=m
CONFIG_DVB_CORE=m
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_NET=y
CONFIG_TTPCI_EEPROM=m
CONFIG_DVB_MAX_ADAPTERS=8
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set

#
# Media drivers
#
CONFIG_MEDIA_USB_SUPPORT=y

#
# Webcam devices
#
CONFIG_USB_VIDEO_CLASS=m
CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
CONFIG_USB_GSPCA=m
CONFIG_USB_M5602=m
CONFIG_USB_STV06XX=m
CONFIG_USB_GL860=m
CONFIG_USB_GSPCA_BENQ=m
CONFIG_USB_GSPCA_CONEX=m
CONFIG_USB_GSPCA_CPIA1=m
# CONFIG_USB_GSPCA_DTCS033 is not set
CONFIG_USB_GSPCA_ETOMS=m
CONFIG_USB_GSPCA_FINEPIX=m
CONFIG_USB_GSPCA_JEILINJ=m
CONFIG_USB_GSPCA_JL2005BCD=m
# CONFIG_USB_GSPCA_KINECT is not set
CONFIG_USB_GSPCA_KONICA=m
CONFIG_USB_GSPCA_MARS=m
CONFIG_USB_GSPCA_MR97310A=m
CONFIG_USB_GSPCA_NW80X=m
CONFIG_USB_GSPCA_OV519=m
CONFIG_USB_GSPCA_OV534=m
CONFIG_USB_GSPCA_OV534_9=m
CONFIG_USB_GSPCA_PAC207=m
CONFIG_USB_GSPCA_PAC7302=m
CONFIG_USB_GSPCA_PAC7311=m
CONFIG_USB_GSPCA_SE401=m
CONFIG_USB_GSPCA_SN9C2028=m
CONFIG_USB_GSPCA_SN9C20X=m
CONFIG_USB_GSPCA_SONIXB=m
CONFIG_USB_GSPCA_SONIXJ=m
CONFIG_USB_GSPCA_SPCA500=m
CONFIG_USB_GSPCA_SPCA501=m
CONFIG_USB_GSPCA_SPCA505=m
CONFIG_USB_GSPCA_SPCA506=m
CONFIG_USB_GSPCA_SPCA508=m
CONFIG_USB_GSPCA_SPCA561=m
CONFIG_USB_GSPCA_SPCA1528=m
CONFIG_USB_GSPCA_SQ905=m
CONFIG_USB_GSPCA_SQ905C=m
CONFIG_USB_GSPCA_SQ930X=m
CONFIG_USB_GSPCA_STK014=m
# CONFIG_USB_GSPCA_STK1135 is not set
CONFIG_USB_GSPCA_STV0680=m
CONFIG_USB_GSPCA_SUNPLUS=m
CONFIG_USB_GSPCA_T613=m
CONFIG_USB_GSPCA_TOPRO=m
# CONFIG_USB_GSPCA_TOUPTEK is not set
CONFIG_USB_GSPCA_TV8532=m
CONFIG_USB_GSPCA_VC032X=m
CONFIG_USB_GSPCA_VICAM=m
CONFIG_USB_GSPCA_XIRLINK_CIT=m
CONFIG_USB_GSPCA_ZC3XX=m
CONFIG_USB_PWC=m
# CONFIG_USB_PWC_DEBUG is not set
CONFIG_USB_PWC_INPUT_EVDEV=y
# CONFIG_VIDEO_CPIA2 is not set
CONFIG_USB_ZR364XX=m
CONFIG_USB_STKWEBCAM=m
CONFIG_USB_S2255=m
# CONFIG_VIDEO_USBTV is not set

#
# Analog TV USB devices
#
CONFIG_VIDEO_PVRUSB2=m
CONFIG_VIDEO_PVRUSB2_SYSFS=y
CONFIG_VIDEO_PVRUSB2_DVB=y
# CONFIG_VIDEO_PVRUSB2_DEBUGIFC is not set
CONFIG_VIDEO_HDPVR=m
CONFIG_VIDEO_USBVISION=m
# CONFIG_VIDEO_STK1160_COMMON is not set
# CONFIG_VIDEO_GO7007 is not set

#
# Analog/digital TV USB devices
#
CONFIG_VIDEO_AU0828=m
CONFIG_VIDEO_AU0828_V4L2=y
# CONFIG_VIDEO_AU0828_RC is not set
CONFIG_VIDEO_CX231XX=m
CONFIG_VIDEO_CX231XX_RC=y
CONFIG_VIDEO_CX231XX_ALSA=m
CONFIG_VIDEO_CX231XX_DVB=m
CONFIG_VIDEO_TM6000=m
CONFIG_VIDEO_TM6000_ALSA=m
CONFIG_VIDEO_TM6000_DVB=m

#
# Digital TV USB devices
#
CONFIG_DVB_USB=m
# CONFIG_DVB_USB_DEBUG is not set
CONFIG_DVB_USB_DIB3000MC=m
CONFIG_DVB_USB_A800=m
CONFIG_DVB_USB_DIBUSB_MB=m
# CONFIG_DVB_USB_DIBUSB_MB_FAULTY is not set
CONFIG_DVB_USB_DIBUSB_MC=m
CONFIG_DVB_USB_DIB0700=m
CONFIG_DVB_USB_UMT_010=m
CONFIG_DVB_USB_CXUSB=m
# CONFIG_DVB_USB_CXUSB_ANALOG is not set
CONFIG_DVB_USB_M920X=m
CONFIG_DVB_USB_DIGITV=m
CONFIG_DVB_USB_VP7045=m
CONFIG_DVB_USB_VP702X=m
CONFIG_DVB_USB_GP8PSK=m
CONFIG_DVB_USB_NOVA_T_USB2=m
CONFIG_DVB_USB_TTUSB2=m
CONFIG_DVB_USB_DTT200U=m
CONFIG_DVB_USB_OPERA1=m
CONFIG_DVB_USB_AF9005=m
CONFIG_DVB_USB_AF9005_REMOTE=m
CONFIG_DVB_USB_PCTV452E=m
CONFIG_DVB_USB_DW2102=m
CONFIG_DVB_USB_CINERGY_T2=m
CONFIG_DVB_USB_DTV5100=m
CONFIG_DVB_USB_AZ6027=m
CONFIG_DVB_USB_TECHNISAT_USB2=m
CONFIG_DVB_USB_V2=m
CONFIG_DVB_USB_AF9015=m
CONFIG_DVB_USB_AF9035=m
CONFIG_DVB_USB_ANYSEE=m
CONFIG_DVB_USB_AU6610=m
CONFIG_DVB_USB_AZ6007=m
CONFIG_DVB_USB_CE6230=m
CONFIG_DVB_USB_EC168=m
CONFIG_DVB_USB_GL861=m
CONFIG_DVB_USB_LME2510=m
CONFIG_DVB_USB_MXL111SF=m
CONFIG_DVB_USB_RTL28XXU=m
# CONFIG_DVB_USB_DVBSKY is not set
# CONFIG_DVB_USB_ZD1301 is not set
CONFIG_DVB_TTUSB_BUDGET=m
CONFIG_DVB_TTUSB_DEC=m
CONFIG_SMS_USB_DRV=m
CONFIG_DVB_B2C2_FLEXCOP_USB=m
# CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
# CONFIG_DVB_AS102 is not set

#
# Webcam, TV (analog/digital) USB devices
#
CONFIG_VIDEO_EM28XX=m
# CONFIG_VIDEO_EM28XX_V4L2 is not set
CONFIG_VIDEO_EM28XX_ALSA=m
CONFIG_VIDEO_EM28XX_DVB=m
CONFIG_VIDEO_EM28XX_RC=m
CONFIG_MEDIA_PCI_SUPPORT=y

#
# Media capture support
#
# CONFIG_VIDEO_MEYE is not set
# CONFIG_VIDEO_SOLO6X10 is not set
# CONFIG_VIDEO_TW5864 is not set
# CONFIG_VIDEO_TW68 is not set
# CONFIG_VIDEO_TW686X is not set

#
# Media capture/analog TV support
#
CONFIG_VIDEO_IVTV=m
# CONFIG_VIDEO_IVTV_DEPRECATED_IOCTLS is not set
# CONFIG_VIDEO_IVTV_ALSA is not set
CONFIG_VIDEO_FB_IVTV=m
# CONFIG_VIDEO_FB_IVTV_FORCE_PAT is not set
# CONFIG_VIDEO_HEXIUM_GEMINI is not set
# CONFIG_VIDEO_HEXIUM_ORION is not set
# CONFIG_VIDEO_MXB is not set
# CONFIG_VIDEO_DT3155 is not set

#
# Media capture/analog/hybrid TV support
#
CONFIG_VIDEO_CX18=m
CONFIG_VIDEO_CX18_ALSA=m
CONFIG_VIDEO_CX23885=m
CONFIG_MEDIA_ALTERA_CI=m
# CONFIG_VIDEO_CX25821 is not set
CONFIG_VIDEO_CX88=m
CONFIG_VIDEO_CX88_ALSA=m
CONFIG_VIDEO_CX88_BLACKBIRD=m
CONFIG_VIDEO_CX88_DVB=m
CONFIG_VIDEO_CX88_ENABLE_VP3054=y
CONFIG_VIDEO_CX88_VP3054=m
CONFIG_VIDEO_CX88_MPEG=m
CONFIG_VIDEO_BT848=m
CONFIG_DVB_BT8XX=m
CONFIG_VIDEO_SAA7134=m
CONFIG_VIDEO_SAA7134_ALSA=m
CONFIG_VIDEO_SAA7134_RC=y
CONFIG_VIDEO_SAA7134_DVB=m
CONFIG_VIDEO_SAA7164=m

#
# Media digital TV PCI Adapters
#
CONFIG_DVB_AV7110_IR=y
CONFIG_DVB_AV7110=m
CONFIG_DVB_AV7110_OSD=y
CONFIG_DVB_BUDGET_CORE=m
CONFIG_DVB_BUDGET=m
CONFIG_DVB_BUDGET_CI=m
CONFIG_DVB_BUDGET_AV=m
CONFIG_DVB_BUDGET_PATCH=m
CONFIG_DVB_B2C2_FLEXCOP_PCI=m
# CONFIG_DVB_B2C2_FLEXCOP_PCI_DEBUG is not set
CONFIG_DVB_PLUTO2=m
CONFIG_DVB_DM1105=m
CONFIG_DVB_PT1=m
# CONFIG_DVB_PT3 is not set
CONFIG_MANTIS_CORE=m
CONFIG_DVB_MANTIS=m
CONFIG_DVB_HOPPER=m
CONFIG_DVB_NGENE=m
CONFIG_DVB_DDBRIDGE=m
# CONFIG_DVB_DDBRIDGE_MSIENABLE is not set
# CONFIG_DVB_SMIPCIE is not set
# CONFIG_DVB_NETUP_UNIDVB is not set
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set

#
# Supported MMC/SDIO adapters
#
CONFIG_SMS_SDIO_DRV=m
CONFIG_RADIO_ADAPTERS=y
CONFIG_RADIO_TEA575X=m
# CONFIG_RADIO_SI470X is not set
# CONFIG_RADIO_SI4713 is not set
# CONFIG_USB_MR800 is not set
# CONFIG_USB_DSBR is not set
# CONFIG_RADIO_MAXIRADIO is not set
# CONFIG_RADIO_SHARK is not set
# CONFIG_RADIO_SHARK2 is not set
# CONFIG_USB_KEENE is not set
# CONFIG_USB_RAREMONO is not set
# CONFIG_USB_MA901 is not set
# CONFIG_RADIO_TEA5764 is not set
# CONFIG_RADIO_SAA7706H is not set
# CONFIG_RADIO_TEF6862 is not set
# CONFIG_RADIO_WL1273 is not set

#
# Texas Instruments WL128x FM driver (ST based)
#
# end of Texas Instruments WL128x FM driver (ST based)

#
# Supported FireWire (IEEE 1394) Adapters
#
CONFIG_DVB_FIREDTV=m
CONFIG_DVB_FIREDTV_INPUT=y
CONFIG_MEDIA_COMMON_OPTIONS=y

#
# common driver options
#
CONFIG_VIDEO_CX2341X=m
CONFIG_VIDEO_TVEEPROM=m
CONFIG_CYPRESS_FIRMWARE=m
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_VMALLOC=m
CONFIG_VIDEOBUF2_DMA_SG=m
CONFIG_VIDEOBUF2_DVB=m
CONFIG_DVB_B2C2_FLEXCOP=m
CONFIG_VIDEO_SAA7146=m
CONFIG_VIDEO_SAA7146_VV=m
CONFIG_SMS_SIANO_MDTV=m
CONFIG_SMS_SIANO_RC=y
# CONFIG_SMS_SIANO_DEBUGFS is not set

#
# Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
#
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
CONFIG_MEDIA_ATTACH=y
CONFIG_VIDEO_IR_I2C=m

#
# I2C Encoders, decoders, sensors and other helper chips
#

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_TVAUDIO=m
CONFIG_VIDEO_TDA7432=m
# CONFIG_VIDEO_TDA9840 is not set
# CONFIG_VIDEO_TEA6415C is not set
# CONFIG_VIDEO_TEA6420 is not set
CONFIG_VIDEO_MSP3400=m
CONFIG_VIDEO_CS3308=m
CONFIG_VIDEO_CS5345=m
CONFIG_VIDEO_CS53L32A=m
# CONFIG_VIDEO_TLV320AIC23B is not set
# CONFIG_VIDEO_UDA1342 is not set
CONFIG_VIDEO_WM8775=m
CONFIG_VIDEO_WM8739=m
CONFIG_VIDEO_VP27SMPX=m
# CONFIG_VIDEO_SONY_BTF_MPX is not set

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=m

#
# Video decoders
#
# CONFIG_VIDEO_ADV7183 is not set
# CONFIG_VIDEO_BT819 is not set
# CONFIG_VIDEO_BT856 is not set
# CONFIG_VIDEO_BT866 is not set
# CONFIG_VIDEO_KS0127 is not set
# CONFIG_VIDEO_ML86V7667 is not set
# CONFIG_VIDEO_SAA7110 is not set
CONFIG_VIDEO_SAA711X=m
# CONFIG_VIDEO_TVP514X is not set
# CONFIG_VIDEO_TVP5150 is not set
# CONFIG_VIDEO_TVP7002 is not set
# CONFIG_VIDEO_TW2804 is not set
# CONFIG_VIDEO_TW9903 is not set
# CONFIG_VIDEO_TW9906 is not set
# CONFIG_VIDEO_TW9910 is not set
# CONFIG_VIDEO_VPX3220 is not set

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
CONFIG_VIDEO_CX25840=m

#
# Video encoders
#
CONFIG_VIDEO_SAA7127=m
# CONFIG_VIDEO_SAA7185 is not set
# CONFIG_VIDEO_ADV7170 is not set
# CONFIG_VIDEO_ADV7175 is not set
# CONFIG_VIDEO_ADV7343 is not set
# CONFIG_VIDEO_ADV7393 is not set
# CONFIG_VIDEO_AK881X is not set
# CONFIG_VIDEO_THS8200 is not set

#
# Camera sensor devices
#
# CONFIG_VIDEO_OV2640 is not set
# CONFIG_VIDEO_OV2659 is not set
# CONFIG_VIDEO_OV2680 is not set
# CONFIG_VIDEO_OV2685 is not set
# CONFIG_VIDEO_OV6650 is not set
# CONFIG_VIDEO_OV5695 is not set
# CONFIG_VIDEO_OV772X is not set
# CONFIG_VIDEO_OV7640 is not set
# CONFIG_VIDEO_OV7670 is not set
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_OV9640 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_MT9M111 is not set
# CONFIG_VIDEO_MT9T112 is not set
# CONFIG_VIDEO_MT9V011 is not set
# CONFIG_VIDEO_MT9V111 is not set
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_RJ54N1 is not set

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
# CONFIG_VIDEO_LM3560 is not set
# CONFIG_VIDEO_LM3646 is not set

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=m
CONFIG_VIDEO_UPD64083=m

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=m

#
# SDR tuner chips
#

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_THS7303 is not set
CONFIG_VIDEO_M52790=m
# CONFIG_VIDEO_I2C is not set
# end of I2C Encoders, decoders, sensors and other helper chips

#
# SPI helper chips
#
# end of SPI helper chips

#
# Media SPI Adapters
#
# CONFIG_CXD2880_SPI_DRV is not set
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=m
CONFIG_MEDIA_TUNER_TDA18250=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA9887=m
CONFIG_MEDIA_TUNER_TEA5761=m
CONFIG_MEDIA_TUNER_TEA5767=m
# CONFIG_MEDIA_TUNER_MSI001 is not set
CONFIG_MEDIA_TUNER_MT20XX=m
CONFIG_MEDIA_TUNER_MT2060=m
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT2266=m
CONFIG_MEDIA_TUNER_MT2131=m
CONFIG_MEDIA_TUNER_QT1010=m
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC5000=m
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_MXL5005S=m
CONFIG_MEDIA_TUNER_MXL5007T=m
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_TDA18218=m
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=m
CONFIG_MEDIA_TUNER_FC0013=m
CONFIG_MEDIA_TUNER_TDA18212=m
CONFIG_MEDIA_TUNER_E4000=m
CONFIG_MEDIA_TUNER_FC2580=m
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_TUA9001=m
CONFIG_MEDIA_TUNER_SI2157=m
CONFIG_MEDIA_TUNER_IT913X=m
CONFIG_MEDIA_TUNER_R820T=m
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_QM1D1C0042=m
CONFIG_MEDIA_TUNER_QM1D1B0004=m
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_STB0899=m
CONFIG_DVB_STB6100=m
CONFIG_DVB_STV090x=m
CONFIG_DVB_STV0910=m
CONFIG_DVB_STV6110x=m
CONFIG_DVB_STV6111=m
CONFIG_DVB_MXL5XX=m
CONFIG_DVB_M88DS3103=m

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=m
CONFIG_DVB_TDA18271C2DD=m
CONFIG_DVB_SI2165=m
CONFIG_DVB_MN88472=m
CONFIG_DVB_MN88473=m

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=m
CONFIG_DVB_CX24123=m
CONFIG_DVB_MT312=m
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m
CONFIG_DVB_S5H1420=m
CONFIG_DVB_STV0288=m
CONFIG_DVB_STB6000=m
CONFIG_DVB_STV0299=m
CONFIG_DVB_STV6110=m
CONFIG_DVB_STV0900=m
CONFIG_DVB_TDA8083=m
CONFIG_DVB_TDA10086=m
CONFIG_DVB_TDA8261=m
CONFIG_DVB_VES1X93=m
CONFIG_DVB_TUNER_ITD1000=m
CONFIG_DVB_TUNER_CX24113=m
CONFIG_DVB_TDA826X=m
CONFIG_DVB_TUA6100=m
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24117=m
CONFIG_DVB_CX24120=m
CONFIG_DVB_SI21XX=m
CONFIG_DVB_TS2020=m
CONFIG_DVB_DS3000=m
CONFIG_DVB_MB86A16=m
CONFIG_DVB_TDA10071=m

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_SP8870=m
CONFIG_DVB_SP887X=m
CONFIG_DVB_CX22700=m
CONFIG_DVB_CX22702=m
# CONFIG_DVB_S5H1432 is not set
CONFIG_DVB_DRXD=m
CONFIG_DVB_L64781=m
CONFIG_DVB_TDA1004X=m
CONFIG_DVB_NXT6000=m
CONFIG_DVB_MT352=m
CONFIG_DVB_ZL10353=m
CONFIG_DVB_DIB3000MB=m
CONFIG_DVB_DIB3000MC=m
CONFIG_DVB_DIB7000M=m
CONFIG_DVB_DIB7000P=m
# CONFIG_DVB_DIB9000 is not set
CONFIG_DVB_TDA10048=m
CONFIG_DVB_AF9013=m
CONFIG_DVB_EC100=m
CONFIG_DVB_STV0367=m
CONFIG_DVB_CXD2820R=m
CONFIG_DVB_CXD2841ER=m
CONFIG_DVB_RTL2830=m
CONFIG_DVB_RTL2832=m
CONFIG_DVB_SI2168=m
# CONFIG_DVB_ZD1301_DEMOD is not set
CONFIG_DVB_GP8PSK_FE=m
# CONFIG_DVB_CXD2880 is not set

#
# DVB-C (cable) frontends
#
CONFIG_DVB_VES1820=m
CONFIG_DVB_TDA10021=m
CONFIG_DVB_TDA10023=m
CONFIG_DVB_STV0297=m

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_NXT200X=m
CONFIG_DVB_OR51211=m
CONFIG_DVB_OR51132=m
CONFIG_DVB_BCM3510=m
CONFIG_DVB_LGDT330X=m
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LGDT3306A=m
CONFIG_DVB_LG2160=m
CONFIG_DVB_S5H1409=m
CONFIG_DVB_AU8522=m
CONFIG_DVB_AU8522_DTV=m
CONFIG_DVB_AU8522_V4L=m
CONFIG_DVB_S5H1411=m

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_S921=m
CONFIG_DVB_DIB8000=m
CONFIG_DVB_MB86A20S=m

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=m
# CONFIG_DVB_MN88443X is not set

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=m
CONFIG_DVB_TUNER_DIB0070=m
CONFIG_DVB_TUNER_DIB0090=m

#
# SEC control devices for DVB-S
#
CONFIG_DVB_DRX39XYJ=m
CONFIG_DVB_LNBH25=m
# CONFIG_DVB_LNBH29 is not set
CONFIG_DVB_LNBP21=m
CONFIG_DVB_LNBP22=m
CONFIG_DVB_ISL6405=m
CONFIG_DVB_ISL6421=m
CONFIG_DVB_ISL6423=m
CONFIG_DVB_A8293=m
# CONFIG_DVB_LGS8GL5 is not set
CONFIG_DVB_LGS8GXX=m
CONFIG_DVB_ATBM8830=m
CONFIG_DVB_TDA665x=m
CONFIG_DVB_IX2505V=m
CONFIG_DVB_M88RS2000=m
CONFIG_DVB_AF9033=m
# CONFIG_DVB_HORUS3A is not set
# CONFIG_DVB_ASCOT2E is not set
# CONFIG_DVB_HELENE is not set

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m
# CONFIG_DVB_SP2 is not set

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=m
# end of Customise DVB Frontends

#
# Graphics support
#
CONFIG_AGP=y
CONFIG_AGP_AMD64=y
CONFIG_AGP_INTEL=y
CONFIG_AGP_SIS=y
CONFIG_AGP_VIA=y
CONFIG_INTEL_GTT=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_EXPORT_FOR_TESTS=y
CONFIG_DRM_DEBUG_SELFTEST=m
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_KMS_FB_HELPER=y
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_TTM_DMA_PAGE_POOL=y
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set

#
# ACP (Audio CoProcessor) Configuration
#
# end of ACP (Audio CoProcessor) Configuration

# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
# CONFIG_DRM_I915_ALPHA_SUPPORT is not set
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
CONFIG_DRM_I915_GVT=y
CONFIG_DRM_I915_GVT_KVMGT=m

#
# drm/i915 Debugging
#
# CONFIG_DRM_I915_WERROR is not set
# CONFIG_DRM_I915_DEBUG is not set
# CONFIG_DRM_I915_DEBUG_MMIO is not set
# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
# CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
# end of drm/i915 Debugging

#
# drm/i915 Profile Guided Optimisation
#
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_SPIN_REQUEST=5
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# end of drm/i915 Profile Guided Optimisation

CONFIG_DRM_VGEM=m
# CONFIG_DRM_VKMS is not set
CONFIG_DRM_VMWGFX=m
CONFIG_DRM_VMWGFX_FBCON=y
CONFIG_DRM_GMA500=m
CONFIG_DRM_GMA600=y
CONFIG_DRM_GMA3600=y
CONFIG_DRM_UDL=m
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
CONFIG_DRM_CIRRUS_QEMU=m
CONFIG_DRM_QXL=m
CONFIG_DRM_BOCHS=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
# CONFIG_DRM_GM12U320 is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_XEN is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_LIB_RANDOM=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_BOOT_VESA_SUPPORT=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_INTEL is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_XEN_FBDEV_FRONTEND is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_HYPERV=m
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_GENERIC is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_VGACON_SOFT_SCROLLBACK=y
CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=64
# CONFIG_VGACON_SOFT_SCROLLBACK_PERSISTENT_ENABLE_BY_DEFAULT is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

CONFIG_SOUND=m
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_PCM_ELD=y
CONFIG_SND_HWDEP=m
CONFIG_SND_SEQ_DEVICE=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_COMPRESS_OFFLOAD=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
# CONFIG_SND_MIXER_OSS is not set
# CONFIG_SND_PCM_OSS is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_HRTIMER=m
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
# CONFIG_SND_VERBOSE_PRINTK is not set
# CONFIG_SND_DEBUG is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_SEQUENCER=m
CONFIG_SND_SEQ_DUMMY=m
CONFIG_SND_SEQUENCER_OSS=m
CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
CONFIG_SND_SEQ_MIDI_EVENT=m
CONFIG_SND_SEQ_MIDI=m
CONFIG_SND_SEQ_MIDI_EMUL=m
CONFIG_SND_SEQ_VIRMIDI=m
CONFIG_SND_MPU401_UART=m
CONFIG_SND_OPL3_LIB=m
CONFIG_SND_OPL3_LIB_SEQ=m
CONFIG_SND_VX_LIB=m
CONFIG_SND_AC97_CODEC=m
CONFIG_SND_DRIVERS=y
CONFIG_SND_PCSP=m
CONFIG_SND_DUMMY=m
CONFIG_SND_ALOOP=m
CONFIG_SND_VIRMIDI=m
CONFIG_SND_MTPAV=m
# CONFIG_SND_MTS64 is not set
# CONFIG_SND_SERIAL_U16550 is not set
CONFIG_SND_MPU401=m
# CONFIG_SND_PORTMAN2X4 is not set
CONFIG_SND_AC97_POWER_SAVE=y
CONFIG_SND_AC97_POWER_SAVE_DEFAULT=5
CONFIG_SND_PCI=y
CONFIG_SND_AD1889=m
# CONFIG_SND_ALS300 is not set
# CONFIG_SND_ALS4000 is not set
CONFIG_SND_ALI5451=m
CONFIG_SND_ASIHPI=m
CONFIG_SND_ATIIXP=m
CONFIG_SND_ATIIXP_MODEM=m
CONFIG_SND_AU8810=m
CONFIG_SND_AU8820=m
CONFIG_SND_AU8830=m
# CONFIG_SND_AW2 is not set
# CONFIG_SND_AZT3328 is not set
CONFIG_SND_BT87X=m
# CONFIG_SND_BT87X_OVERCLOCK is not set
CONFIG_SND_CA0106=m
CONFIG_SND_CMIPCI=m
CONFIG_SND_OXYGEN_LIB=m
CONFIG_SND_OXYGEN=m
# CONFIG_SND_CS4281 is not set
CONFIG_SND_CS46XX=m
CONFIG_SND_CS46XX_NEW_DSP=y
CONFIG_SND_CTXFI=m
CONFIG_SND_DARLA20=m
CONFIG_SND_GINA20=m
CONFIG_SND_LAYLA20=m
CONFIG_SND_DARLA24=m
CONFIG_SND_GINA24=m
CONFIG_SND_LAYLA24=m
CONFIG_SND_MONA=m
CONFIG_SND_MIA=m
CONFIG_SND_ECHO3G=m
CONFIG_SND_INDIGO=m
CONFIG_SND_INDIGOIO=m
CONFIG_SND_INDIGODJ=m
CONFIG_SND_INDIGOIOX=m
CONFIG_SND_INDIGODJX=m
CONFIG_SND_EMU10K1=m
CONFIG_SND_EMU10K1_SEQ=m
CONFIG_SND_EMU10K1X=m
CONFIG_SND_ENS1370=m
CONFIG_SND_ENS1371=m
# CONFIG_SND_ES1938 is not set
CONFIG_SND_ES1968=m
CONFIG_SND_ES1968_INPUT=y
CONFIG_SND_ES1968_RADIO=y
# CONFIG_SND_FM801 is not set
CONFIG_SND_HDSP=m
CONFIG_SND_HDSPM=m
CONFIG_SND_ICE1712=m
CONFIG_SND_ICE1724=m
CONFIG_SND_INTEL8X0=m
CONFIG_SND_INTEL8X0M=m
CONFIG_SND_KORG1212=m
CONFIG_SND_LOLA=m
CONFIG_SND_LX6464ES=m
CONFIG_SND_MAESTRO3=m
CONFIG_SND_MAESTRO3_INPUT=y
CONFIG_SND_MIXART=m
# CONFIG_SND_NM256 is not set
CONFIG_SND_PCXHR=m
# CONFIG_SND_RIPTIDE is not set
CONFIG_SND_RME32=m
CONFIG_SND_RME96=m
CONFIG_SND_RME9652=m
# CONFIG_SND_SONICVIBES is not set
CONFIG_SND_TRIDENT=m
CONFIG_SND_VIA82XX=m
CONFIG_SND_VIA82XX_MODEM=m
CONFIG_SND_VIRTUOSO=m
CONFIG_SND_VX222=m
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
CONFIG_SND_HDA=m
CONFIG_SND_HDA_INTEL=m
CONFIG_SND_HDA_HWDEP=y
CONFIG_SND_HDA_RECONFIG=y
CONFIG_SND_HDA_INPUT_BEEP=y
CONFIG_SND_HDA_INPUT_BEEP_MODE=0
CONFIG_SND_HDA_PATCH_LOADER=y
CONFIG_SND_HDA_CODEC_REALTEK=m
CONFIG_SND_HDA_CODEC_ANALOG=m
CONFIG_SND_HDA_CODEC_SIGMATEL=m
CONFIG_SND_HDA_CODEC_VIA=m
CONFIG_SND_HDA_CODEC_HDMI=m
CONFIG_SND_HDA_CODEC_CIRRUS=m
CONFIG_SND_HDA_CODEC_CONEXANT=m
CONFIG_SND_HDA_CODEC_CA0110=m
CONFIG_SND_HDA_CODEC_CA0132=m
CONFIG_SND_HDA_CODEC_CA0132_DSP=y
CONFIG_SND_HDA_CODEC_CMEDIA=m
CONFIG_SND_HDA_CODEC_SI3054=m
CONFIG_SND_HDA_GENERIC=m
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
# end of HD-Audio

CONFIG_SND_HDA_CORE=m
CONFIG_SND_HDA_DSP_LOADER=y
CONFIG_SND_HDA_COMPONENT=y
CONFIG_SND_HDA_I915=y
CONFIG_SND_HDA_EXT_CORE=m
CONFIG_SND_HDA_PREALLOC_SIZE=0
CONFIG_SND_INTEL_NHLT=y
CONFIG_SND_INTEL_DSP_CONFIG=m
# CONFIG_SND_SPI is not set
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=m
CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER=y
CONFIG_SND_USB_UA101=m
CONFIG_SND_USB_USX2Y=m
CONFIG_SND_USB_CAIAQ=m
CONFIG_SND_USB_CAIAQ_INPUT=y
CONFIG_SND_USB_US122L=m
CONFIG_SND_USB_6FIRE=m
CONFIG_SND_USB_HIFACE=m
CONFIG_SND_BCD2000=m
CONFIG_SND_USB_LINE6=m
CONFIG_SND_USB_POD=m
CONFIG_SND_USB_PODHD=m
CONFIG_SND_USB_TONEPORT=m
CONFIG_SND_USB_VARIAX=m
CONFIG_SND_FIREWIRE=y
CONFIG_SND_FIREWIRE_LIB=m
# CONFIG_SND_DICE is not set
# CONFIG_SND_OXFW is not set
CONFIG_SND_ISIGHT=m
# CONFIG_SND_FIREWORKS is not set
# CONFIG_SND_BEBOB is not set
# CONFIG_SND_FIREWIRE_DIGI00X is not set
# CONFIG_SND_FIREWIRE_TASCAM is not set
# CONFIG_SND_FIREWIRE_MOTU is not set
# CONFIG_SND_FIREFACE is not set
CONFIG_SND_SOC=m
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_TOPOLOGY=y
CONFIG_SND_SOC_ACPI=m
# CONFIG_SND_SOC_AMD_ACP is not set
# CONFIG_SND_SOC_AMD_ACP3x is not set
# CONFIG_SND_ATMEL_SOC is not set
# CONFIG_SND_DESIGNWARE_I2S is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
# CONFIG_SND_SOC_FSL_ASRC is not set
# CONFIG_SND_SOC_FSL_SAI is not set
# CONFIG_SND_SOC_FSL_AUDMIX is not set
# CONFIG_SND_SOC_FSL_SSI is not set
# CONFIG_SND_SOC_FSL_SPDIF is not set
# CONFIG_SND_SOC_FSL_ESAI is not set
# CONFIG_SND_SOC_FSL_MICFIL is not set
# CONFIG_SND_SOC_IMX_AUDMUX is not set
# end of SoC Audio for Freescale CPUs

# CONFIG_SND_I2S_HI6210_I2S is not set
# CONFIG_SND_SOC_IMG is not set
CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=y
CONFIG_SND_SST_IPC=m
CONFIG_SND_SST_IPC_ACPI=m
CONFIG_SND_SOC_INTEL_SST_ACPI=m
CONFIG_SND_SOC_INTEL_SST=m
CONFIG_SND_SOC_INTEL_SST_FIRMWARE=m
CONFIG_SND_SOC_INTEL_HASWELL=m
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM=m
# CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI is not set
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI=m
CONFIG_SND_SOC_INTEL_SKYLAKE=m
CONFIG_SND_SOC_INTEL_SKL=m
CONFIG_SND_SOC_INTEL_APL=m
CONFIG_SND_SOC_INTEL_KBL=m
CONFIG_SND_SOC_INTEL_GLK=m
CONFIG_SND_SOC_INTEL_CNL=m
CONFIG_SND_SOC_INTEL_CFL=m
# CONFIG_SND_SOC_INTEL_CML_H is not set
# CONFIG_SND_SOC_INTEL_CML_LP is not set
CONFIG_SND_SOC_INTEL_SKYLAKE_FAMILY=m
CONFIG_SND_SOC_INTEL_SKYLAKE_SSP_CLK=m
# CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC is not set
CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON=m
CONFIG_SND_SOC_ACPI_INTEL_MATCH=m
CONFIG_SND_SOC_INTEL_MACH=y
# CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES is not set
CONFIG_SND_SOC_INTEL_HASWELL_MACH=m
# CONFIG_SND_SOC_INTEL_BDW_RT5650_MACH is not set
CONFIG_SND_SOC_INTEL_BDW_RT5677_MACH=m
CONFIG_SND_SOC_INTEL_BROADWELL_MACH=m
CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH=m
CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH=m
CONFIG_SND_SOC_INTEL_CHT_BSW_RT5672_MACH=m
CONFIG_SND_SOC_INTEL_CHT_BSW_RT5645_MACH=m
CONFIG_SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH=m
# CONFIG_SND_SOC_INTEL_CHT_BSW_NAU8824_MACH is not set
# CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH is not set
CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH=m
CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH=m
CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH=m
CONFIG_SND_SOC_INTEL_SKL_RT286_MACH=m
CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH=m
CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH=m
CONFIG_SND_SOC_INTEL_DA7219_MAX98357A_GENERIC=m
CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON=m
CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH=m
CONFIG_SND_SOC_INTEL_BXT_RT298_MACH=m
CONFIG_SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH=m
CONFIG_SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH=m
# CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH is not set
# CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH is not set
# CONFIG_SND_SOC_INTEL_KBL_RT5660_MACH is not set
# CONFIG_SND_SOC_MTK_BTCVSD is not set
# CONFIG_SND_SOC_SOF_TOPLEVEL is not set

#
# STMicroelectronics STM32 SOC audio support
#
# end of STMicroelectronics STM32 SOC audio support

# CONFIG_SND_SOC_XILINX_I2S is not set
# CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER is not set
# CONFIG_SND_SOC_XILINX_SPDIF is not set
# CONFIG_SND_SOC_XTFPGA_I2S is not set
# CONFIG_ZX_TDM is not set
CONFIG_SND_SOC_I2C_AND_SPI=m

#
# CODEC drivers
#
# CONFIG_SND_SOC_AC97_CODEC is not set
# CONFIG_SND_SOC_ADAU1701 is not set
# CONFIG_SND_SOC_ADAU1761_I2C is not set
# CONFIG_SND_SOC_ADAU1761_SPI is not set
# CONFIG_SND_SOC_ADAU7002 is not set
# CONFIG_SND_SOC_ADAU7118_HW is not set
# CONFIG_SND_SOC_ADAU7118_I2C is not set
# CONFIG_SND_SOC_AK4104 is not set
# CONFIG_SND_SOC_AK4118 is not set
# CONFIG_SND_SOC_AK4458 is not set
# CONFIG_SND_SOC_AK4554 is not set
# CONFIG_SND_SOC_AK4613 is not set
# CONFIG_SND_SOC_AK4642 is not set
# CONFIG_SND_SOC_AK5386 is not set
# CONFIG_SND_SOC_AK5558 is not set
# CONFIG_SND_SOC_ALC5623 is not set
# CONFIG_SND_SOC_BD28623 is not set
# CONFIG_SND_SOC_BT_SCO is not set
# CONFIG_SND_SOC_CS35L32 is not set
# CONFIG_SND_SOC_CS35L33 is not set
# CONFIG_SND_SOC_CS35L34 is not set
# CONFIG_SND_SOC_CS35L35 is not set
# CONFIG_SND_SOC_CS35L36 is not set
# CONFIG_SND_SOC_CS42L42 is not set
# CONFIG_SND_SOC_CS42L51_I2C is not set
# CONFIG_SND_SOC_CS42L52 is not set
# CONFIG_SND_SOC_CS42L56 is not set
# CONFIG_SND_SOC_CS42L73 is not set
# CONFIG_SND_SOC_CS4265 is not set
# CONFIG_SND_SOC_CS4270 is not set
# CONFIG_SND_SOC_CS4271_I2C is not set
# CONFIG_SND_SOC_CS4271_SPI is not set
# CONFIG_SND_SOC_CS42XX8_I2C is not set
# CONFIG_SND_SOC_CS43130 is not set
# CONFIG_SND_SOC_CS4341 is not set
# CONFIG_SND_SOC_CS4349 is not set
# CONFIG_SND_SOC_CS53L30 is not set
# CONFIG_SND_SOC_CX2072X is not set
CONFIG_SND_SOC_DA7213=m
CONFIG_SND_SOC_DA7219=m
CONFIG_SND_SOC_DMIC=m
# CONFIG_SND_SOC_ES7134 is not set
# CONFIG_SND_SOC_ES7241 is not set
CONFIG_SND_SOC_ES8316=m
# CONFIG_SND_SOC_ES8328_I2C is not set
# CONFIG_SND_SOC_ES8328_SPI is not set
# CONFIG_SND_SOC_GTM601 is not set
CONFIG_SND_SOC_HDAC_HDMI=m
# CONFIG_SND_SOC_INNO_RK3036 is not set
# CONFIG_SND_SOC_MAX98088 is not set
CONFIG_SND_SOC_MAX98090=m
CONFIG_SND_SOC_MAX98357A=m
# CONFIG_SND_SOC_MAX98504 is not set
# CONFIG_SND_SOC_MAX9867 is not set
CONFIG_SND_SOC_MAX98927=m
# CONFIG_SND_SOC_MAX98373 is not set
# CONFIG_SND_SOC_MAX9860 is not set
# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
# CONFIG_SND_SOC_PCM1681 is not set
# CONFIG_SND_SOC_PCM1789_I2C is not set
# CONFIG_SND_SOC_PCM179X_I2C is not set
# CONFIG_SND_SOC_PCM179X_SPI is not set
# CONFIG_SND_SOC_PCM186X_I2C is not set
# CONFIG_SND_SOC_PCM186X_SPI is not set
# CONFIG_SND_SOC_PCM3060_I2C is not set
# CONFIG_SND_SOC_PCM3060_SPI is not set
# CONFIG_SND_SOC_PCM3168A_I2C is not set
# CONFIG_SND_SOC_PCM3168A_SPI is not set
# CONFIG_SND_SOC_PCM512x_I2C is not set
# CONFIG_SND_SOC_PCM512x_SPI is not set
# CONFIG_SND_SOC_RK3328 is not set
CONFIG_SND_SOC_RL6231=m
CONFIG_SND_SOC_RL6347A=m
CONFIG_SND_SOC_RT286=m
CONFIG_SND_SOC_RT298=m
CONFIG_SND_SOC_RT5514=m
CONFIG_SND_SOC_RT5514_SPI=m
# CONFIG_SND_SOC_RT5616 is not set
# CONFIG_SND_SOC_RT5631 is not set
CONFIG_SND_SOC_RT5640=m
CONFIG_SND_SOC_RT5645=m
CONFIG_SND_SOC_RT5651=m
CONFIG_SND_SOC_RT5663=m
CONFIG_SND_SOC_RT5670=m
CONFIG_SND_SOC_RT5677=m
CONFIG_SND_SOC_RT5677_SPI=m
# CONFIG_SND_SOC_SGTL5000 is not set
# CONFIG_SND_SOC_SIMPLE_AMPLIFIER is not set
# CONFIG_SND_SOC_SIRF_AUDIO_CODEC is not set
# CONFIG_SND_SOC_SPDIF is not set
# CONFIG_SND_SOC_SSM2305 is not set
# CONFIG_SND_SOC_SSM2602_SPI is not set
# CONFIG_SND_SOC_SSM2602_I2C is not set
CONFIG_SND_SOC_SSM4567=m
# CONFIG_SND_SOC_STA32X is not set
# CONFIG_SND_SOC_STA350 is not set
# CONFIG_SND_SOC_STI_SAS is not set
# CONFIG_SND_SOC_TAS2552 is not set
# CONFIG_SND_SOC_TAS2562 is not set
# CONFIG_SND_SOC_TAS2770 is not set
# CONFIG_SND_SOC_TAS5086 is not set
# CONFIG_SND_SOC_TAS571X is not set
# CONFIG_SND_SOC_TAS5720 is not set
# CONFIG_SND_SOC_TAS6424 is not set
# CONFIG_SND_SOC_TDA7419 is not set
# CONFIG_SND_SOC_TFA9879 is not set
# CONFIG_SND_SOC_TLV320AIC23_I2C is not set
# CONFIG_SND_SOC_TLV320AIC23_SPI is not set
# CONFIG_SND_SOC_TLV320AIC31XX is not set
# CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
# CONFIG_SND_SOC_TLV320AIC32X4_SPI is not set
# CONFIG_SND_SOC_TLV320AIC3X is not set
CONFIG_SND_SOC_TS3A227E=m
# CONFIG_SND_SOC_TSCS42XX is not set
# CONFIG_SND_SOC_TSCS454 is not set
# CONFIG_SND_SOC_UDA1334 is not set
# CONFIG_SND_SOC_WM8510 is not set
# CONFIG_SND_SOC_WM8523 is not set
# CONFIG_SND_SOC_WM8524 is not set
# CONFIG_SND_SOC_WM8580 is not set
# CONFIG_SND_SOC_WM8711 is not set
# CONFIG_SND_SOC_WM8728 is not set
# CONFIG_SND_SOC_WM8731 is not set
# CONFIG_SND_SOC_WM8737 is not set
# CONFIG_SND_SOC_WM8741 is not set
# CONFIG_SND_SOC_WM8750 is not set
# CONFIG_SND_SOC_WM8753 is not set
# CONFIG_SND_SOC_WM8770 is not set
# CONFIG_SND_SOC_WM8776 is not set
# CONFIG_SND_SOC_WM8782 is not set
# CONFIG_SND_SOC_WM8804_I2C is not set
# CONFIG_SND_SOC_WM8804_SPI is not set
# CONFIG_SND_SOC_WM8903 is not set
# CONFIG_SND_SOC_WM8904 is not set
# CONFIG_SND_SOC_WM8960 is not set
# CONFIG_SND_SOC_WM8962 is not set
# CONFIG_SND_SOC_WM8974 is not set
# CONFIG_SND_SOC_WM8978 is not set
# CONFIG_SND_SOC_WM8985 is not set
# CONFIG_SND_SOC_ZX_AUD96P22 is not set
# CONFIG_SND_SOC_MAX9759 is not set
# CONFIG_SND_SOC_MT6351 is not set
# CONFIG_SND_SOC_MT6358 is not set
# CONFIG_SND_SOC_MT6660 is not set
# CONFIG_SND_SOC_NAU8540 is not set
# CONFIG_SND_SOC_NAU8810 is not set
# CONFIG_SND_SOC_NAU8822 is not set
CONFIG_SND_SOC_NAU8824=m
CONFIG_SND_SOC_NAU8825=m
# CONFIG_SND_SOC_TPA6130A2 is not set
# end of CODEC drivers

# CONFIG_SND_SIMPLE_CARD is not set
CONFIG_SND_X86=y
CONFIG_HDMI_LPE_AUDIO=m
CONFIG_SND_SYNTH_EMUX=m
# CONFIG_SND_XEN_FRONTEND is not set
CONFIG_AC97_BUS=m

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=y
CONFIG_HID_APPLEIR=m
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=y
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=y
CONFIG_HID_CHICONY=y
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_PRODIKEYS=m
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=y
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
CONFIG_HID_HOLTEK=m
# CONFIG_HOLTEK_FF is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
CONFIG_HID_UCLOGIC=m
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=y
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
# CONFIG_HID_LENOVO is not set
CONFIG_HID_LOGITECH=y
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NTI is not set
CONFIG_HID_NTRIG=y
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
CONFIG_HID_ROCCAT=m
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
CONFIG_HID_SONY=m
# CONFIG_SONY_FF is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_HYPERV_MOUSE=m
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
CONFIG_HID_WACOM=m
CONFIG_HID_WIIMOTE=m
# CONFIG_HID_XINMO is not set
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=m
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
CONFIG_HID_PID=y
CONFIG_USB_HIDDEV=y
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID=m
# end of I2C HID support

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=y
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_WHITELIST is not set
# CONFIG_USB_OTG_BLACKLIST_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=m
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_U132_HCD is not set
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_SSB is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=m
CONFIG_USB_PRINTER=m
CONFIG_USB_WDM=m
CONFIG_USB_TMC=m

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
CONFIG_USB_STORAGE_REALTEK=m
CONFIG_REALTEK_AUTOPM=y
CONFIG_USB_STORAGE_DATAFAB=m
CONFIG_USB_STORAGE_FREECOM=m
CONFIG_USB_STORAGE_ISD200=m
CONFIG_USB_STORAGE_USBAT=m
CONFIG_USB_STORAGE_SDDR09=m
CONFIG_USB_STORAGE_SDDR55=m
CONFIG_USB_STORAGE_JUMPSHOT=m
CONFIG_USB_STORAGE_ALAUDA=m
CONFIG_USB_STORAGE_ONETOUCH=m
CONFIG_USB_STORAGE_KARMA=m
CONFIG_USB_STORAGE_CYPRESS_ATACB=m
CONFIG_USB_STORAGE_ENE_UB6250=m
CONFIG_USB_UAS=m

#
# USB Imaging devices
#
CONFIG_USB_MDC800=m
CONFIG_USB_MICROTEK=m
CONFIG_USBIP_CORE=m
# CONFIG_USBIP_VHCI_HCD is not set
# CONFIG_USBIP_HOST is not set
# CONFIG_USBIP_DEBUG is not set
# CONFIG_USB_CDNS3 is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_USS720=m
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
CONFIG_USB_SERIAL_AIRCABLE=m
CONFIG_USB_SERIAL_ARK3116=m
CONFIG_USB_SERIAL_BELKIN=m
CONFIG_USB_SERIAL_CH341=m
CONFIG_USB_SERIAL_WHITEHEAT=m
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
CONFIG_USB_SERIAL_CP210X=m
CONFIG_USB_SERIAL_CYPRESS_M8=m
CONFIG_USB_SERIAL_EMPEG=m
CONFIG_USB_SERIAL_FTDI_SIO=m
CONFIG_USB_SERIAL_VISOR=m
CONFIG_USB_SERIAL_IPAQ=m
CONFIG_USB_SERIAL_IR=m
CONFIG_USB_SERIAL_EDGEPORT=m
CONFIG_USB_SERIAL_EDGEPORT_TI=m
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
CONFIG_USB_SERIAL_GARMIN=m
CONFIG_USB_SERIAL_IPW=m
CONFIG_USB_SERIAL_IUU=m
CONFIG_USB_SERIAL_KEYSPAN_PDA=m
CONFIG_USB_SERIAL_KEYSPAN=m
CONFIG_USB_SERIAL_KLSI=m
CONFIG_USB_SERIAL_KOBIL_SCT=m
CONFIG_USB_SERIAL_MCT_U232=m
# CONFIG_USB_SERIAL_METRO is not set
CONFIG_USB_SERIAL_MOS7720=m
CONFIG_USB_SERIAL_MOS7715_PARPORT=y
CONFIG_USB_SERIAL_MOS7840=m
# CONFIG_USB_SERIAL_MXUPORT is not set
CONFIG_USB_SERIAL_NAVMAN=m
CONFIG_USB_SERIAL_PL2303=m
CONFIG_USB_SERIAL_OTI6858=m
CONFIG_USB_SERIAL_QCAUX=m
CONFIG_USB_SERIAL_QUALCOMM=m
CONFIG_USB_SERIAL_SPCP8X5=m
CONFIG_USB_SERIAL_SAFE=m
CONFIG_USB_SERIAL_SAFE_PADDED=y
CONFIG_USB_SERIAL_SIERRAWIRELESS=m
CONFIG_USB_SERIAL_SYMBOL=m
# CONFIG_USB_SERIAL_TI is not set
CONFIG_USB_SERIAL_CYBERJACK=m
CONFIG_USB_SERIAL_XIRCOM=m
CONFIG_USB_SERIAL_WWAN=m
CONFIG_USB_SERIAL_OPTION=m
CONFIG_USB_SERIAL_OMNINET=m
CONFIG_USB_SERIAL_OPTICON=m
CONFIG_USB_SERIAL_XSENS_MT=m
# CONFIG_USB_SERIAL_WISHBONE is not set
CONFIG_USB_SERIAL_SSU100=m
CONFIG_USB_SERIAL_QT2=m
# CONFIG_USB_SERIAL_UPD78F0730 is not set
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=m
CONFIG_USB_EMI26=m
CONFIG_USB_ADUTUX=m
CONFIG_USB_SEVSEG=m
CONFIG_USB_LEGOTOWER=m
CONFIG_USB_LCD=m
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=m
CONFIG_USB_FTDI_ELAN=m
CONFIG_USB_APPLEDISPLAY=m
CONFIG_USB_SISUSBVGA=m
CONFIG_USB_SISUSBVGA_CON=y
CONFIG_USB_LD=m
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=m
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=m
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=m
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=m
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set
CONFIG_USB_ATM=m
CONFIG_USB_SPEEDTOUCH=m
CONFIG_USB_CXACRU=m
CONFIG_USB_UEAGLEATM=m
CONFIG_USB_XUSBATM=m

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_TYPEC_TPS6598X is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
CONFIG_MMC_TIFM_SD=m
# CONFIG_MMC_SPI is not set
CONFIG_MMC_CB710=m
CONFIG_MMC_VIA_SDMMC=m
CONFIG_MMC_VUB300=m
CONFIG_MMC_USHC=m
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
CONFIG_MEMSTICK=m
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
CONFIG_MSPRO_BLOCK=m
# CONFIG_MS_BLOCK is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=m
CONFIG_MEMSTICK_JMICRON_38X=m
CONFIG_MEMSTICK_R592=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP55XX_COMMON=m
CONFIG_LEDS_LP5521=m
CONFIG_LEDS_LP5523=m
CONFIG_LEDS_LP5562=m
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_CLEVO_MAIL=m
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
# CONFIG_LEDS_MLXCPLD is not set
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_DECODE_MCE=m
CONFIG_EDAC_GHES=y
CONFIG_EDAC_AMD64=m
# CONFIG_EDAC_AMD64_ERROR_INJECTION is not set
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5000=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RX6110 is not set
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
CONFIG_RTC_DRV_RV3029_HWMON=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m
CONFIG_RTC_DRV_V3020=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
# CONFIG_INTEL_IDMA64 is not set
# CONFIG_INTEL_IDXD is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
# CONFIG_DW_EDMA_PCIE is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
# CONFIG_DMATEST is not set
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# end of DMABUF options

CONFIG_DCA=m
CONFIG_AUXDISPLAY=y
# CONFIG_HD44780 is not set
CONFIG_KS0108=m
CONFIG_KS0108_PORT=0x378
CONFIG_KS0108_DELAY=2
CONFIG_CFAG12864B=m
CONFIG_CFAG12864B_RATE=20
# CONFIG_IMG_ASCII_LCD is not set
# CONFIG_PARPORT_PANEL is not set
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
# CONFIG_PANEL is not set
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_UIO_HV_GENERIC=m
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_VIRQFD=m
CONFIG_VFIO=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_VFIO_MDEV=m
CONFIG_VFIO_MDEV_DEVICE=m
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=m
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m
# end of Microsoft Hyper-V guest support

#
# Xen driver support
#
CONFIG_XEN_BALLOON=y
# CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is not set
CONFIG_XEN_SCRUB_PAGES_DEFAULT=y
CONFIG_XEN_DEV_EVTCHN=m
# CONFIG_XEN_BACKEND is not set
CONFIG_XENFS=m
CONFIG_XEN_COMPAT_XENFS=y
CONFIG_XEN_SYS_HYPERVISOR=y
CONFIG_XEN_XENBUS_FRONTEND=y
# CONFIG_XEN_GNTDEV is not set
# CONFIG_XEN_GRANT_DEV_ALLOC is not set
# CONFIG_XEN_GRANT_DMA_ALLOC is not set
CONFIG_SWIOTLB_XEN=y
# CONFIG_XEN_PVCALLS_FRONTEND is not set
CONFIG_XEN_PRIVCMD=m
CONFIG_XEN_HAVE_PVMMU=y
CONFIG_XEN_EFI=y
CONFIG_XEN_AUTO_XLATE=y
CONFIG_XEN_ACPI=y
CONFIG_XEN_HAVE_VPMU=y
# end of Xen driver support

# CONFIG_GREYBUS is not set
CONFIG_STAGING=y
# CONFIG_PRISM2_USB is not set
# CONFIG_COMEDI is not set
# CONFIG_RTL8192U is not set
CONFIG_RTLLIB=m
CONFIG_RTLLIB_CRYPTO_CCMP=m
CONFIG_RTLLIB_CRYPTO_TKIP=m
CONFIG_RTLLIB_CRYPTO_WEP=m
CONFIG_RTL8192E=m
# CONFIG_RTL8723BS is not set
CONFIG_R8712U=m
# CONFIG_R8188EU is not set
# CONFIG_RTS5208 is not set
# CONFIG_VT6655 is not set
# CONFIG_VT6656 is not set

#
# IIO staging drivers
#

#
# Accelerometers
#
# CONFIG_ADIS16203 is not set
# CONFIG_ADIS16240 is not set
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7816 is not set
# CONFIG_AD7192 is not set
# CONFIG_AD7280 is not set
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
# CONFIG_ADT7316 is not set
# end of Analog digital bi-direction converters

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Direct Digital Synthesis
#
# CONFIG_AD9832 is not set
# CONFIG_AD9834 is not set
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
# CONFIG_AD5933 is not set
# end of Network Analyzer, Impedance Converters

#
# Active energy metering IC
#
# CONFIG_ADE7854 is not set
# end of Active energy metering IC

#
# Resolver to digital converters
#
# CONFIG_AD2S1210 is not set
# end of Resolver to digital converters
# end of IIO staging drivers

# CONFIG_FB_SM750 is not set

#
# Speakup console speech
#
# CONFIG_SPEAKUP is not set
# end of Speakup console speech

# CONFIG_STAGING_MEDIA is not set

#
# Android
#
# CONFIG_ASHMEM is not set
CONFIG_ION=y
CONFIG_ION_SYSTEM_HEAP=y
# CONFIG_ION_CMA_HEAP is not set
# end of Android

# CONFIG_LTE_GDM724X is not set
CONFIG_FIREWIRE_SERIAL=m
CONFIG_FWTTY_MAX_TOTAL_PORTS=64
CONFIG_FWTTY_MAX_CARD_PORTS=32
# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
# CONFIG_FB_TFT is not set
# CONFIG_WILC1000_SDIO is not set
# CONFIG_WILC1000_SPI is not set
# CONFIG_MOST is not set
# CONFIG_KS7010 is not set
# CONFIG_PI433 is not set

#
# Gasket devices
#
# CONFIG_STAGING_GASKET_FRAMEWORK is not set
# end of Gasket devices

# CONFIG_FIELDBUS_DEV is not set
# CONFIG_KPC2000 is not set
CONFIG_USB_WUSB=m
CONFIG_USB_WUSB_CBAF=m
# CONFIG_USB_WUSB_CBAF_DEBUG is not set
# CONFIG_USB_WHCI_HCD is not set
CONFIG_USB_HWA_HCD=m
CONFIG_UWB=m
CONFIG_UWB_HWA=m
CONFIG_UWB_WHCI=m
CONFIG_UWB_I1480U=m
# CONFIG_STAGING_EXFAT_FS is not set
CONFIG_QLGE=m
# CONFIG_NET_VENDOR_HP is not set
# CONFIG_WFX is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACER_WMI=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACERHDF=m
# CONFIG_ALIENWARE_WMI is not set
CONFIG_ASUS_LAPTOP=m
CONFIG_DCDBAS=m
CONFIG_DELL_SMBIOS=m
CONFIG_DELL_SMBIOS_WMI=y
CONFIG_DELL_SMBIOS_SMM=y
CONFIG_DELL_LAPTOP=m
CONFIG_DELL_WMI=m
CONFIG_DELL_WMI_DESCRIPTOR=m
CONFIG_DELL_WMI_AIO=m
# CONFIG_DELL_WMI_LED is not set
CONFIG_DELL_SMO8800=m
CONFIG_DELL_RBTN=m
CONFIG_DELL_RBU=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
CONFIG_AMILO_RFKILL=m
# CONFIG_GPD_POCKET_FAN is not set
CONFIG_HP_ACCEL=m
CONFIG_HP_WIRELESS=m
CONFIG_HP_WMI=m
# CONFIG_LG_LAPTOP is not set
CONFIG_MSI_LAPTOP=m
CONFIG_PANASONIC_LAPTOP=m
CONFIG_COMPAL_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
CONFIG_IDEAPAD_LAPTOP=m
# CONFIG_SURFACE3_WMI is not set
CONFIG_THINKPAD_ACPI=m
CONFIG_THINKPAD_ACPI_ALSA_SUPPORT=y
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
CONFIG_SENSORS_HDAPS=m
# CONFIG_INTEL_MENLOW is not set
CONFIG_EEEPC_LAPTOP=m
CONFIG_ASUS_WMI=m
CONFIG_ASUS_NB_WMI=m
CONFIG_EEEPC_WMI=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
CONFIG_INTEL_WMI_THUNDERBOLT=m
# CONFIG_XIAOMI_WMI is not set
CONFIG_MSI_WMI=m
# CONFIG_PEAQ_WMI is not set
CONFIG_TOPSTAR_LAPTOP=m
CONFIG_ACPI_TOSHIBA=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
CONFIG_INTEL_IPS=m
CONFIG_INTEL_PMC_CORE=m
# CONFIG_IBM_RTL is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_MXM_WMI=m
CONFIG_INTEL_OAKTRAIL=m
CONFIG_SAMSUNG_Q10=m
CONFIG_APPLE_GMUX=m
# CONFIG_INTEL_RST is not set
# CONFIG_INTEL_SMARTCONNECT is not set
# CONFIG_INTEL_PMC_IPC is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
# CONFIG_INTEL_PUNIT_IPC is not set
# CONFIG_MLX_PLATFORM is not set
# CONFIG_INTEL_TURBO_MAX_3 is not set
# CONFIG_I2C_MULTI_INSTANTIATE is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_HUAWEI_WMI is not set
# CONFIG_PCENGINES_APU2 is not set
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

# CONFIG_SYSTEM76_ACPI is not set
CONFIG_PMC_ATOM=y
# CONFIG_MFD_CROS_EC is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Common Clock Framework
#
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# end of Common Clock Framework

# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
CONFIG_AMD_IOMMU=y
CONFIG_AMD_IOMMU_V2=m
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
# CONFIG_INTEL_IOMMU_SVM is not set
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
# CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON is not set
CONFIG_IRQ_REMAP=y
CONFIG_HYPERV_IOMMU=y

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Aspeed SoC drivers
#
# end of Aspeed SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# CONFIG_XILINX_VCU is not set
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=m
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
# CONFIG_DEVFREQ_GOV_USERSPACE is not set
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
# CONFIG_PM_DEVFREQ_EVENT is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
# CONFIG_IIO_BUFFER_HW_CONSUMER is not set
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=m
# CONFIG_IIO_CONFIGFS is not set
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
# CONFIG_IIO_SW_DEVICE is not set
# CONFIG_IIO_SW_TRIGGER is not set

#
# Accelerometers
#
# CONFIG_ADIS16201 is not set
# CONFIG_ADIS16209 is not set
# CONFIG_ADXL345_I2C is not set
# CONFIG_ADXL345_SPI is not set
# CONFIG_ADXL372_SPI is not set
# CONFIG_ADXL372_I2C is not set
# CONFIG_BMA180 is not set
# CONFIG_BMA220 is not set
# CONFIG_BMA400 is not set
# CONFIG_BMC150_ACCEL is not set
# CONFIG_DA280 is not set
# CONFIG_DA311 is not set
# CONFIG_DMARD09 is not set
# CONFIG_DMARD10 is not set
CONFIG_HID_SENSOR_ACCEL_3D=m
# CONFIG_IIO_ST_ACCEL_3AXIS is not set
# CONFIG_KXSD9 is not set
# CONFIG_KXCJK1013 is not set
# CONFIG_MC3230 is not set
# CONFIG_MMA7455_I2C is not set
# CONFIG_MMA7455_SPI is not set
# CONFIG_MMA7660 is not set
# CONFIG_MMA8452 is not set
# CONFIG_MMA9551 is not set
# CONFIG_MMA9553 is not set
# CONFIG_MXC4005 is not set
# CONFIG_MXC6255 is not set
# CONFIG_SCA3000 is not set
# CONFIG_STK8312 is not set
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7091R5 is not set
# CONFIG_AD7124 is not set
# CONFIG_AD7266 is not set
# CONFIG_AD7291 is not set
# CONFIG_AD7292 is not set
# CONFIG_AD7298 is not set
# CONFIG_AD7476 is not set
# CONFIG_AD7606_IFACE_PARALLEL is not set
# CONFIG_AD7606_IFACE_SPI is not set
# CONFIG_AD7766 is not set
# CONFIG_AD7768_1 is not set
# CONFIG_AD7780 is not set
# CONFIG_AD7791 is not set
# CONFIG_AD7793 is not set
# CONFIG_AD7887 is not set
# CONFIG_AD7923 is not set
# CONFIG_AD7949 is not set
# CONFIG_AD799X is not set
# CONFIG_HI8435 is not set
# CONFIG_HX711 is not set
# CONFIG_INA2XX_ADC is not set
# CONFIG_LTC2471 is not set
# CONFIG_LTC2485 is not set
# CONFIG_LTC2496 is not set
# CONFIG_LTC2497 is not set
# CONFIG_MAX1027 is not set
# CONFIG_MAX11100 is not set
# CONFIG_MAX1118 is not set
# CONFIG_MAX1363 is not set
# CONFIG_MAX9611 is not set
# CONFIG_MCP320X is not set
# CONFIG_MCP3422 is not set
# CONFIG_MCP3911 is not set
# CONFIG_NAU7802 is not set
# CONFIG_TI_ADC081C is not set
# CONFIG_TI_ADC0832 is not set
# CONFIG_TI_ADC084S021 is not set
# CONFIG_TI_ADC12138 is not set
# CONFIG_TI_ADC108S102 is not set
# CONFIG_TI_ADC128S052 is not set
# CONFIG_TI_ADC161S626 is not set
# CONFIG_TI_ADS1015 is not set
# CONFIG_TI_ADS7950 is not set
# CONFIG_TI_TLC4541 is not set
# CONFIG_VIPERBOARD_ADC is not set
# CONFIG_XILINX_XADC is not set
# end of Analog to digital converters

#
# Analog Front Ends
#
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_AD8366 is not set
# end of Amplifiers

#
# Chemical Sensors
#
# CONFIG_ATLAS_PH_SENSOR is not set
# CONFIG_BME680 is not set
# CONFIG_CCS811 is not set
# CONFIG_IAQCORE is not set
# CONFIG_SENSIRION_SGP30 is not set
# CONFIG_SPS30 is not set
# CONFIG_VZ89X is not set
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=m
CONFIG_HID_SENSOR_IIO_TRIGGER=m
# end of Hid Sensor IIO Common

#
# SSP Sensor Common
#
# CONFIG_IIO_SSP_SENSORHUB is not set
# end of SSP Sensor Common

#
# Digital to analog converters
#
# CONFIG_AD5064 is not set
# CONFIG_AD5360 is not set
# CONFIG_AD5380 is not set
# CONFIG_AD5421 is not set
# CONFIG_AD5446 is not set
# CONFIG_AD5449 is not set
# CONFIG_AD5592R is not set
# CONFIG_AD5593R is not set
# CONFIG_AD5504 is not set
# CONFIG_AD5624R_SPI is not set
# CONFIG_LTC1660 is not set
# CONFIG_LTC2632 is not set
# CONFIG_AD5686_SPI is not set
# CONFIG_AD5696_I2C is not set
# CONFIG_AD5755 is not set
# CONFIG_AD5758 is not set
# CONFIG_AD5761 is not set
# CONFIG_AD5764 is not set
# CONFIG_AD5791 is not set
# CONFIG_AD7303 is not set
# CONFIG_AD8801 is not set
# CONFIG_DS4424 is not set
# CONFIG_M62332 is not set
# CONFIG_MAX517 is not set
# CONFIG_MCP4725 is not set
# CONFIG_MCP4922 is not set
# CONFIG_TI_DAC082S085 is not set
# CONFIG_TI_DAC5571 is not set
# CONFIG_TI_DAC7311 is not set
# CONFIG_TI_DAC7612 is not set
# end of Digital to analog converters

#
# IIO dummy driver
#
# end of IIO dummy driver

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# CONFIG_AD9523 is not set
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# CONFIG_ADF4350 is not set
# CONFIG_ADF4371 is not set
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16080 is not set
# CONFIG_ADIS16130 is not set
# CONFIG_ADIS16136 is not set
# CONFIG_ADIS16260 is not set
# CONFIG_ADXRS450 is not set
# CONFIG_BMG160 is not set
# CONFIG_FXAS21002C is not set
CONFIG_HID_SENSOR_GYRO_3D=m
# CONFIG_MPU3050_I2C is not set
# CONFIG_IIO_ST_GYRO_3AXIS is not set
# CONFIG_ITG3200 is not set
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
# CONFIG_AFE4403 is not set
# CONFIG_AFE4404 is not set
# CONFIG_MAX30100 is not set
# CONFIG_MAX30102 is not set
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
# CONFIG_DHT11 is not set
# CONFIG_HDC100X is not set
# CONFIG_HID_SENSOR_HUMIDITY is not set
# CONFIG_HTS221 is not set
# CONFIG_HTU21 is not set
# CONFIG_SI7005 is not set
# CONFIG_SI7020 is not set
# end of Humidity sensors

#
# Inertial measurement units
#
# CONFIG_ADIS16400 is not set
# CONFIG_ADIS16460 is not set
# CONFIG_ADIS16480 is not set
# CONFIG_BMI160_I2C is not set
# CONFIG_BMI160_SPI is not set
# CONFIG_FXOS8700_I2C is not set
# CONFIG_FXOS8700_SPI is not set
# CONFIG_KMX61 is not set
# CONFIG_INV_MPU6050_I2C is not set
# CONFIG_INV_MPU6050_SPI is not set
# CONFIG_IIO_ST_LSM6DSX is not set
# end of Inertial measurement units

#
# Light sensors
#
# CONFIG_ACPI_ALS is not set
# CONFIG_ADJD_S311 is not set
# CONFIG_ADUX1020 is not set
# CONFIG_AL3320A is not set
# CONFIG_APDS9300 is not set
# CONFIG_APDS9960 is not set
# CONFIG_BH1750 is not set
# CONFIG_BH1780 is not set
# CONFIG_CM32181 is not set
# CONFIG_CM3232 is not set
# CONFIG_CM3323 is not set
# CONFIG_CM36651 is not set
# CONFIG_GP2AP020A00F is not set
# CONFIG_SENSORS_ISL29018 is not set
# CONFIG_SENSORS_ISL29028 is not set
# CONFIG_ISL29125 is not set
CONFIG_HID_SENSOR_ALS=m
CONFIG_HID_SENSOR_PROX=m
# CONFIG_JSA1212 is not set
# CONFIG_RPR0521 is not set
# CONFIG_LTR501 is not set
# CONFIG_LV0104CS is not set
# CONFIG_MAX44000 is not set
# CONFIG_MAX44009 is not set
# CONFIG_NOA1305 is not set
# CONFIG_OPT3001 is not set
# CONFIG_PA12203001 is not set
# CONFIG_SI1133 is not set
# CONFIG_SI1145 is not set
# CONFIG_STK3310 is not set
# CONFIG_ST_UVIS25 is not set
# CONFIG_TCS3414 is not set
# CONFIG_TCS3472 is not set
# CONFIG_SENSORS_TSL2563 is not set
# CONFIG_TSL2583 is not set
# CONFIG_TSL2772 is not set
# CONFIG_TSL4531 is not set
# CONFIG_US5182D is not set
# CONFIG_VCNL4000 is not set
# CONFIG_VCNL4035 is not set
# CONFIG_VEML6030 is not set
# CONFIG_VEML6070 is not set
# CONFIG_VL6180 is not set
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8975 is not set
# CONFIG_AK09911 is not set
# CONFIG_BMC150_MAGN_I2C is not set
# CONFIG_BMC150_MAGN_SPI is not set
# CONFIG_MAG3110 is not set
CONFIG_HID_SENSOR_MAGNETOMETER_3D=m
# CONFIG_MMC35240 is not set
# CONFIG_IIO_ST_MAGN_3AXIS is not set
# CONFIG_SENSORS_HMC5843_I2C is not set
# CONFIG_SENSORS_HMC5843_SPI is not set
# CONFIG_SENSORS_RM3100_I2C is not set
# CONFIG_SENSORS_RM3100_SPI is not set
# end of Magnetometer sensors

#
# Multiplexers
#
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=m
CONFIG_HID_SENSOR_DEVICE_ROTATION=m
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
# CONFIG_IIO_SYSFS_TRIGGER is not set
# end of Triggers - standalone

#
# Digital potentiometers
#
# CONFIG_AD5272 is not set
# CONFIG_DS1803 is not set
# CONFIG_MAX5432 is not set
# CONFIG_MAX5481 is not set
# CONFIG_MAX5487 is not set
# CONFIG_MCP4018 is not set
# CONFIG_MCP4131 is not set
# CONFIG_MCP4531 is not set
# CONFIG_MCP41010 is not set
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
# CONFIG_BMP280 is not set
# CONFIG_DLHL60D is not set
# CONFIG_DPS310 is not set
CONFIG_HID_SENSOR_PRESS=m
# CONFIG_HP03 is not set
# CONFIG_MPL115_I2C is not set
# CONFIG_MPL115_SPI is not set
# CONFIG_MPL3115 is not set
# CONFIG_MS5611 is not set
# CONFIG_MS5637 is not set
# CONFIG_IIO_ST_PRESS is not set
# CONFIG_T5403 is not set
# CONFIG_HP206C is not set
# CONFIG_ZPA2326 is not set
# end of Pressure sensors

#
# Lightning sensors
#
# CONFIG_AS3935 is not set
# end of Lightning sensors

#
# Proximity and distance sensors
#
# CONFIG_ISL29501 is not set
# CONFIG_LIDAR_LITE_V2 is not set
# CONFIG_MB1232 is not set
# CONFIG_PING is not set
# CONFIG_RFD77402 is not set
# CONFIG_SRF04 is not set
# CONFIG_SX9500 is not set
# CONFIG_SRF08 is not set
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# CONFIG_AD2S90 is not set
# CONFIG_AD2S1200 is not set
# end of Resolver to digital converters

#
# Temperature sensors
#
# CONFIG_LTC2983 is not set
# CONFIG_MAXIM_THERMOCOUPLE is not set
# CONFIG_HID_SENSOR_TEMP is not set
# CONFIG_MLX90614 is not set
# CONFIG_MLX90632 is not set
# CONFIG_TMP006 is not set
# CONFIG_TMP007 is not set
# CONFIG_TSYS01 is not set
# CONFIG_TSYS02D is not set
# CONFIG_MAX31856 is not set
# end of Temperature sensors

CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
CONFIG_NTB_AMD=m
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
CONFIG_NTB_PERF=m
CONFIG_NTB_TRANSPORT=m
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_LPSS_PCI is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_CPCAP_USB is not set
# CONFIG_PHY_INTEL_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
# CONFIG_IDLE_INJECT is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
CONFIG_ANDROID=y
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_BLK=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
CONFIG_DAX_DRIVER=y
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_KMEM=m
CONFIG_DEV_DAX_PMEM_COMPAT=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_TEE is not set
CONFIG_PM_OPP=y
# CONFIG_UNISYS_VISORBUS is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=m
CONFIG_EXT4_USE_FOR_EXT2=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=m
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=m
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=m
CONFIG_GFS2_FS_LOCKING_DLM=y
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_IO_TRACE is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
# CONFIG_ZONEFS_FS is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=m
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_QUOTACTL_COMPAT=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_HISTOGRAM is not set
# CONFIG_FSCACHE_DEBUG is not set
# CONFIG_FSCACHE_OBJECT_LIST is not set
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_HISTOGRAM is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_NTFS_FS is not set
# end of DOS/FAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
# CONFIG_PROC_VMCORE_DEVICE_DUMP is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_JFFS2_FS is not set
# CONFIG_UBIFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
# CONFIG_CRAMFS_MTD is not set
CONFIG_SQUASHFS=m
CONFIG_SQUASHFS_FILE_CACHE=y
# CONFIG_SQUASHFS_FILE_DIRECT is not set
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
CONFIG_MINIX_FS=m
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_PMSG=y
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
CONFIG_NFSD=m
CONFIG_NFSD_V2_ACL=y
CONFIG_NFSD_V3=y
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_CEPH_FS=m
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
# CONFIG_CIFS_STATS2 is not set
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_WEAK_PW_HASH=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_9P_FS=y
CONFIG_9P_FS_POSIX_ACL=y
# CONFIG_9P_FS_SECURITY is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
CONFIG_DLM=m
CONFIG_DLM_DEBUG=y
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_BIG_KEYS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_PAGE_TABLE_ISOLATION=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_LSM_MMAP_MIN_ADDR=65535
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_FALLBACK=y
# CONFIG_HARDENED_USERCOPY_PAGESPAN is not set
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
# CONFIG_SECURITY_SELINUX_DISABLE is not set
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=9
CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=256
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
CONFIG_IMA_MEASURE_PCR_IDX=10
CONFIG_IMA_LSM_RULES=y
# CONFIG_IMA_TEMPLATE is not set
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
CONFIG_IMA_DEFAULT_HASH_SHA1=y
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
CONFIG_IMA_DEFAULT_HASH="sha1"
# CONFIG_IMA_WRITE_POLICY is not set
# CONFIG_IMA_READ_POLICY is not set
CONFIG_IMA_APPRAISE=y
# CONFIG_IMA_ARCH_POLICY is not set
# CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
CONFIG_IMA_APPRAISE_BOOTPARAM=y
# CONFIG_IMA_APPRAISE_MODSIG is not set
CONFIG_IMA_TRUSTED_KEYRING=y
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=y
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
# CONFIG_EVM_ADD_XATTRS is not set
# CONFIG_EVM_LOAD_X509 is not set
CONFIG_DEFAULT_SECURITY_SELINUX=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,apparmor"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL is not set
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=m
CONFIG_CRYPTO_AUTHENC=m
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_SIMD=m
CONFIG_CRYPTO_GLUE_HELPER_X86=m
CONFIG_CRYPTO_ENGINE=m

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# CONFIG_CRYPTO_CURVE25519_X86 is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CFB is not set
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ESSIV=m

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_VMAC=m

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_XXHASH=m
CONFIG_CRYPTO_BLAKE2B=m
# CONFIG_CRYPTO_BLAKE2S is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
CONFIG_CRYPTO_GHASH=y
# CONFIG_CRYPTO_POLY1305 is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD128=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_RMD256=m
CONFIG_CRYPTO_RMD320=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=m
# CONFIG_CRYPTO_SHA3 is not set
# CONFIG_CRYPTO_SM3 is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_TGR192=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_AES_NI_INTEL=m
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
CONFIG_CRYPTO_DES=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SALSA20=m
# CONFIG_CRYPTO_CHACHA20 is not set
# CONFIG_CRYPTO_CHACHA20_X86_64 is not set
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4 is not set
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=m
# CONFIG_CRYPTO_USER_API_AEAD is not set
# CONFIG_CRYPTO_STATS is not set
CONFIG_CRYPTO_HASH_INFO=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
# CONFIG_CRYPTO_LIB_BLAKE2S is not set
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
CONFIG_CRYPTO_DEV_PADLOCK_SHA=m
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_CCP_DD=m
CONFIG_CRYPTO_DEV_SP_CCP=y
CONFIG_CRYPTO_DEV_CCP_CRYPTO=m
CONFIG_CRYPTO_DEV_SP_PSP=y
# CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
CONFIG_CRYPTO_DEV_QAT=m
CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
CONFIG_CRYPTO_DEV_QAT_C3XXX=m
CONFIG_CRYPTO_DEV_QAT_C62X=m
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
# CONFIG_CRYPTO_DEV_NITROX_CNN55XX is not set
CONFIG_CRYPTO_DEV_CHELSIO=m
CONFIG_CRYPTO_DEV_VIRTIO=m
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
# CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
# CONFIG_CRC4 is not set
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=m
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_BTREE=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=200
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_SGL_ALLOC=y
CONFIG_IOMMU_HELPER=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_UACCESS_MCSAFE=y
CONFIG_ARCH_STACKWALK=y
CONFIG_SBITMAP=y
# CONFIG_STRING_SELFTEST is not set
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
# CONFIG_PRINTK_CALLER is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_SPLIT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_BTF is not set
# CONFIG_GDB_SCRIPTS is not set
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_OPTIMIZE_INLINING=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_STACK_VALIDATION=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_DEBUG_FS=y
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_UBSAN_ALIGNMENT=y
# end of Generic Kernel Debugging Instruments

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
CONFIG_DEBUG_RODATA_TEST=y
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
# CONFIG_DEBUG_VM is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=m
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
# CONFIG_KASAN is not set
CONFIG_KASAN_STACK=1
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=1
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
CONFIG_WW_MUTEX_SELFTEST=m
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=m
CONFIG_RCU_PERF_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=60
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
# CONFIG_PREEMPTIRQ_EVENTS is not set
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_PROFILE_ALL_BRANCHES is not set
CONFIG_BLK_DEV_IO_TRACE=y
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
# CONFIG_BPF_KPROBE_OVERRIDE is not set
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_TRACING_MAP=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
# CONFIG_EARLY_PRINTK_USB_XDBC is not set
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_WX is not set
CONFIG_DOUBLEFAULT=y
# CONFIG_DEBUG_TLBFLUSH is not set
# CONFIG_IOMMU_DEBUG is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
CONFIG_X86_DECODER_SELFTEST=y
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# CONFIG_UNWINDER_GUESS is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
# CONFIG_FAIL_MMC_REQUEST is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_SORT is not set
# CONFIG_KPROBES_SANITY_TEST is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
CONFIG_ATOMIC64_SELFTEST=y
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_TEST_STRING_HELPERS is not set
CONFIG_TEST_STRSCPY=m
# CONFIG_TEST_KSTRTOX is not set
CONFIG_TEST_PRINTF=m
CONFIG_TEST_BITMAP=m
# CONFIG_TEST_BITFIELD is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_OVERFLOW is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_HASH is not set
# CONFIG_TEST_IDA is not set
CONFIG_TEST_LKM=m
CONFIG_TEST_VMALLOC=m
CONFIG_TEST_USER_COPY=m
CONFIG_TEST_BPF=m
CONFIG_TEST_BLACKHOLE_DEV=m
# CONFIG_FIND_BIT_BENCHMARK is not set
CONFIG_TEST_FIRMWARE=m
CONFIG_TEST_SYSCTL=m
# CONFIG_TEST_UDELAY is not set
CONFIG_TEST_STATIC_KEYS=m
CONFIG_TEST_KMOD=m
# CONFIG_TEST_MEMCAT_P is not set
CONFIG_TEST_LIVEPATCH=m
# CONFIG_TEST_STACKINIT is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_MEMTEST is not set
# CONFIG_HYPERV_TESTING is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

--POjlveFHrWq2ZO+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=job-script

#!/bin/sh

export_top_env()
{
	export suite='will-it-scale'
	export testcase='will-it-scale'
	export category='benchmark'
	export nr_task=16
	export job_origin='/lkp/lkp/.src-20200320-113654/allot/cyclic:p1:linux-devel:devel-hourly/lkp-ivb-d02/will-it-scale-16.yaml'
	export queue_cmdline_keys='branch
commit
queue_at_least_once'
	export queue='validate'
	export testbox='lkp-ivb-d02'
	export tbox_group='lkp-ivb-d02'
	export submit_id='5e789025d787af6f82a15857'
	export job_file='/lkp/jobs/scheduled/lkp-ivb-d02/will-it-scale-performance-process-16-read2-ucode=0x21-debian-x86_64-20191114.cgz-06c4d00466eb374841bc84c39af19b3161ff6917-20200323-28546-x3bsh1-3.yaml'
	export id='452364ce69f0e7bd7b3c9ee21b4bb0e631b32537'
	export queuer_version='/lkp-src'
	export model='Ivy Bridge'
	export nr_node=1
	export nr_cpu=4
	export memory='8G'
	export nr_hdd_partitions=2
	export hdd_partitions='/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part1 /dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part2'
	export swap_partitions='/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part3'
	export rootfs_partition='/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part4'
	export brand='Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz'
	export commit='06c4d00466eb374841bc84c39af19b3161ff6917'
	export netconsole_port=6673
	export ucode='0x21'
	export need_kconfig_hw='CONFIG_NET_VENDOR_REALTEK=y
CONFIG_R8169=y
CONFIG_SATA_AHCI'
	export kconfig='x86_64-rhel-7.6'
	export compiler='gcc-7'
	export enqueue_time='2020-03-23 18:32:09 +0800'
	export _id='5e78902ad787af6f82a15858'
	export _rt='/result/will-it-scale/performance-process-16-read2-ucode=0x21/lkp-ivb-d02/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-7/06c4d00466eb374841bc84c39af19b3161ff6917'
	export user='lkp'
	export head_commit='2302b693e78b721baf01476568a87bfc59353a62'
	export base_commit='fb33c6510d5595144d585aa194d377cf74d31911'
	export branch='linux-devel/devel-hourly-2020032300'
	export rootfs='debian-x86_64-20191114.cgz'
	export result_root='/result/will-it-scale/performance-process-16-read2-ucode=0x21/lkp-ivb-d02/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-7/06c4d00466eb374841bc84c39af19b3161ff6917/3'
	export scheduler_version='/lkp/lkp/.src-20200323-150728'
	export LKP_SERVER='inn'
	export arch='x86_64'
	export max_uptime=1500
	export initrd='/osimage/debian/debian-x86_64-20191114.cgz'
	export bootloader_append='root=/dev/ram0
user=lkp
job=/lkp/jobs/scheduled/lkp-ivb-d02/will-it-scale-performance-process-16-read2-ucode=0x21-debian-x86_64-20191114.cgz-06c4d00466eb374841bc84c39af19b3161ff6917-20200323-28546-x3bsh1-3.yaml
ARCH=x86_64
kconfig=x86_64-rhel-7.6
branch=linux-devel/devel-hourly-2020032300
commit=06c4d00466eb374841bc84c39af19b3161ff6917
BOOT_IMAGE=/pkg/linux/x86_64-rhel-7.6/gcc-7/06c4d00466eb374841bc84c39af19b3161ff6917/vmlinuz-5.6.0-rc6-00109-g06c4d00466eb3
max_uptime=1500
RESULT_ROOT=/result/will-it-scale/performance-process-16-read2-ucode=0x21/lkp-ivb-d02/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-7/06c4d00466eb374841bc84c39af19b3161ff6917/3
LKP_SERVER=inn
nokaslr
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-rhel-7.6/gcc-7/06c4d00466eb374841bc84c39af19b3161ff6917/modules.cgz'
	export bm_initrd='/osimage/deps/debian-x86_64-20180403.cgz/run-ipconfig_2018-04-03.cgz,/osimage/deps/debian-x86_64-20180403.cgz/lkp_2019-08-05.cgz,/osimage/deps/debian-x86_64-20180403.cgz/rsync-rootfs_2018-04-03.cgz,/osimage/deps/debian-x86_64-20180403.cgz/will-it-scale_2020-01-07.cgz,/osimage/pkg/debian-x86_64-20180403.cgz/will-it-scale-x86_64-1eef89e-1_2020-01-07.cgz,/osimage/deps/debian-x86_64-20180403.cgz/mpstat_2020-01-03.cgz,/osimage/deps/debian-x86_64-20180403.cgz/vmstat_2020-01-07.cgz,/osimage/deps/debian-x86_64-20180403.cgz/perf_2020-01-04.cgz,/osimage/pkg/debian-x86_64-20180403.cgz/perf-x86_64-98d54f81e36b-1_20200302.cgz,/osimage/pkg/debian-x86_64-20180403.cgz/sar-x86_64-e011d97-1_2020-01-03.cgz,/osimage/deps/debian-x86_64-20180403.cgz/hw_2020-01-02.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='4.20.0'
	export repeat_to=4
	export schedule_notify_address=
	export queue_at_least_once=1
	export kernel='/pkg/linux/x86_64-rhel-7.6/gcc-7/06c4d00466eb374841bc84c39af19b3161ff6917/vmlinuz-5.6.0-rc6-00109-g06c4d00466eb3'
	export dequeue_time='2020-03-23 18:45:07 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-ivb-d02/will-it-scale-performance-process-16-read2-ucode=0x21-debian-x86_64-20191114.cgz-06c4d00466eb374841bc84c39af19b3161ff6917-20200323-28546-x3bsh1-3.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_setup $LKP_SRC/setup/cpufreq_governor 'performance'

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper iostat
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper vmstat
	run_monitor $LKP_SRC/monitors/wrapper numa-numastat
	run_monitor $LKP_SRC/monitors/wrapper numa-vmstat
	run_monitor $LKP_SRC/monitors/wrapper numa-meminfo
	run_monitor $LKP_SRC/monitors/wrapper proc-vmstat
	run_monitor $LKP_SRC/monitors/wrapper proc-stat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper slabinfo
	run_monitor $LKP_SRC/monitors/wrapper interrupts
	run_monitor $LKP_SRC/monitors/wrapper lock_stat
	run_monitor $LKP_SRC/monitors/wrapper latency_stats
	run_monitor $LKP_SRC/monitors/wrapper softirqs
	run_monitor $LKP_SRC/monitors/one-shot/wrapper bdi_dev_mapping
	run_monitor $LKP_SRC/monitors/wrapper diskstats
	run_monitor $LKP_SRC/monitors/wrapper nfsstat
	run_monitor $LKP_SRC/monitors/wrapper cpuidle
	run_monitor $LKP_SRC/monitors/wrapper cpufreq-stats
	run_monitor $LKP_SRC/monitors/wrapper sched_debug
	run_monitor $LKP_SRC/monitors/wrapper perf-stat
	run_monitor $LKP_SRC/monitors/wrapper mpstat
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper perf-profile
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test mode='process' test='read2' $LKP_SRC/tests/wrapper will-it-scale
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper will-it-scale
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper iostat
	$LKP_SRC/stats/wrapper vmstat
	$LKP_SRC/stats/wrapper numa-numastat
	$LKP_SRC/stats/wrapper numa-vmstat
	$LKP_SRC/stats/wrapper numa-meminfo
	$LKP_SRC/stats/wrapper proc-vmstat
	$LKP_SRC/stats/wrapper meminfo
	$LKP_SRC/stats/wrapper slabinfo
	$LKP_SRC/stats/wrapper interrupts
	$LKP_SRC/stats/wrapper lock_stat
	$LKP_SRC/stats/wrapper latency_stats
	$LKP_SRC/stats/wrapper softirqs
	$LKP_SRC/stats/wrapper diskstats
	$LKP_SRC/stats/wrapper nfsstat
	$LKP_SRC/stats/wrapper cpuidle
	$LKP_SRC/stats/wrapper sched_debug
	$LKP_SRC/stats/wrapper perf-stat
	$LKP_SRC/stats/wrapper mpstat
	$LKP_SRC/stats/wrapper perf-profile

	$LKP_SRC/stats/wrapper time will-it-scale.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--POjlveFHrWq2ZO+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/will-it-scale-16.yaml
suite: will-it-scale
testcase: will-it-scale
category: benchmark
nr_task: 16
will-it-scale:
  mode: process
  test: read2
job_origin: "/lkp/lkp/.src-20200320-113654/allot/cyclic:p1:linux-devel:devel-hourly/lkp-ivb-d02/will-it-scale-16.yaml"

#! queue options
queue_cmdline_keys:
- branch
- commit
- queue_at_least_once
queue: bisect
testbox: lkp-ivb-d02
tbox_group: lkp-ivb-d02
submit_id: 5e788602d787af6ebb6401b3
job_file: "/lkp/jobs/scheduled/lkp-ivb-d02/will-it-scale-performance-process-16-read2-ucode=0x21-debian-x86_64-20191114.cgz-06c4d00466eb374841bc84c39af19b3161ff6917-20200323-28347-v5rtml-1.yaml"
id: cc0aca5a75d631c738fab99923715181d04d0ed9
queuer_version: "/lkp-src"

#! hosts/lkp-ivb-d02
model: Ivy Bridge
nr_node: 1
nr_cpu: 4
memory: 8G
nr_hdd_partitions: 2
hdd_partitions: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part1 /dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part2"
swap_partitions: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part3"
rootfs_partition: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part4"
brand: Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz

#! include/category/benchmark
kmsg: 
boot-time: 
iostat: 
heartbeat: 
vmstat: 
numa-numastat: 
numa-vmstat: 
numa-meminfo: 
proc-vmstat: 
proc-stat: 
meminfo: 
slabinfo: 
interrupts: 
lock_stat: 
latency_stats: 
softirqs: 
bdi_dev_mapping: 
diskstats: 
nfsstat: 
cpuidle: 
cpufreq-stats: 
sched_debug: 
perf-stat: 
mpstat: 
perf-profile: 

#! include/category/ALL
cpufreq_governor: performance

#! include/queue/cyclic
commit: 06c4d00466eb374841bc84c39af19b3161ff6917

#! include/testbox/lkp-ivb-d02
netconsole_port: 6673
ucode: '0x21'
need_kconfig_hw:
- CONFIG_NET_VENDOR_REALTEK=y
- CONFIG_R8169=y
- CONFIG_SATA_AHCI

#! default params
kconfig: x86_64-rhel-7.6
compiler: gcc-7
enqueue_time: 2020-03-23 17:48:54.681542605 +08:00
_id: 5e788c20d787af6ebb6401b4
_rt: "/result/will-it-scale/performance-process-16-read2-ucode=0x21/lkp-ivb-d02/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-7/06c4d00466eb374841bc84c39af19b3161ff6917"

#! schedule options
user: lkp
head_commit: 2302b693e78b721baf01476568a87bfc59353a62
base_commit: fb33c6510d5595144d585aa194d377cf74d31911
branch: linux-devel/devel-hourly-2020032300
rootfs: debian-x86_64-20191114.cgz
result_root: "/result/will-it-scale/performance-process-16-read2-ucode=0x21/lkp-ivb-d02/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-7/06c4d00466eb374841bc84c39af19b3161ff6917/1"
scheduler_version: "/lkp/lkp/.src-20200323-150728"
LKP_SERVER: inn
arch: x86_64
max_uptime: 1500
initrd: "/osimage/debian/debian-x86_64-20191114.cgz"
bootloader_append:
- root=/dev/ram0
- user=lkp
- job=/lkp/jobs/scheduled/lkp-ivb-d02/will-it-scale-performance-process-16-read2-ucode=0x21-debian-x86_64-20191114.cgz-06c4d00466eb374841bc84c39af19b3161ff6917-20200323-28347-v5rtml-1.yaml
- ARCH=x86_64
- kconfig=x86_64-rhel-7.6
- branch=linux-devel/devel-hourly-2020032300
- commit=06c4d00466eb374841bc84c39af19b3161ff6917
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-7.6/gcc-7/06c4d00466eb374841bc84c39af19b3161ff6917/vmlinuz-5.6.0-rc6-00109-g06c4d00466eb3
- max_uptime=1500
- RESULT_ROOT=/result/will-it-scale/performance-process-16-read2-ucode=0x21/lkp-ivb-d02/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-7/06c4d00466eb374841bc84c39af19b3161ff6917/1
- LKP_SERVER=inn
- nokaslr
- selinux=0
- debug
- apic=debug
- sysrq_always_enabled
- rcupdate.rcu_cpu_stall_timeout=100
- net.ifnames=0
- printk.devkmsg=on
- panic=-1
- softlockup_panic=1
- nmi_watchdog=panic
- oops=panic
- load_ramdisk=2
- prompt_ramdisk=0
- drbd.minor_count=8
- systemd.log_level=err
- ignore_loglevel
- console=tty0
- earlyprintk=ttyS0,115200
- console=ttyS0,115200
- vga=normal
- rw
modules_initrd: "/pkg/linux/x86_64-rhel-7.6/gcc-7/06c4d00466eb374841bc84c39af19b3161ff6917/modules.cgz"
bm_initrd: "/osimage/deps/debian-x86_64-20180403.cgz/run-ipconfig_2018-04-03.cgz,/osimage/deps/debian-x86_64-20180403.cgz/lkp_2019-08-05.cgz,/osimage/deps/debian-x86_64-20180403.cgz/rsync-rootfs_2018-04-03.cgz,/osimage/deps/debian-x86_64-20180403.cgz/will-it-scale_2020-01-07.cgz,/osimage/pkg/debian-x86_64-20180403.cgz/will-it-scale-x86_64-1eef89e-1_2020-01-07.cgz,/osimage/deps/debian-x86_64-20180403.cgz/mpstat_2020-01-03.cgz,/osimage/deps/debian-x86_64-20180403.cgz/vmstat_2020-01-07.cgz,/osimage/deps/debian-x86_64-20180403.cgz/perf_2020-01-04.cgz,/osimage/pkg/debian-x86_64-20180403.cgz/perf-x86_64-98d54f81e36b-1_20200302.cgz,/osimage/pkg/debian-x86_64-20180403.cgz/sar-x86_64-e011d97-1_2020-01-03.cgz,/osimage/deps/debian-x86_64-20180403.cgz/hw_2020-01-02.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn

#! /lkp/lkp/.src-20200320-113654/include/site/inn
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer: 
watchdog: 

#! runtime status
last_kernel: 4.20.0
repeat_to: 2
schedule_notify_address: 

#! user overrides
queue_at_least_once: 0
kernel: "/pkg/linux/x86_64-rhel-7.6/gcc-7/06c4d00466eb374841bc84c39af19b3161ff6917/vmlinuz-5.6.0-rc6-00109-g06c4d00466eb3"
dequeue_time: 2020-03-23 18:22:59.269372205 +08:00

#! /lkp/lkp/.src-20200323-150728/include/site/inn
job_state: finished
loadavg: 13.92 10.41 4.70 1/134 4921
start_time: '1584959024'
end_time: '1584959325'
version: "/lkp/lkp/.src-20200323-150801:f24e4302:c9cd449c9"

--POjlveFHrWq2ZO+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce


for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
do
	online_file="$cpu_dir"/online
	[ -f "$online_file" ] && [ "$(cat "$online_file")" -eq 0 ] && continue

	file="$cpu_dir"/cpufreq/scaling_governor
	[ -f "$file" ] && echo "performance" > "$file"
done

 "python2" "./runtest.py" "read2" "295" "process" "16"

--POjlveFHrWq2ZO+N--
