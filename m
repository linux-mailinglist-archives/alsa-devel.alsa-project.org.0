Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 941F5196BC3
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Mar 2020 09:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C6181678;
	Sun, 29 Mar 2020 09:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C6181678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585468763;
	bh=UMmSUJx88sBu0N9nOKRtBPLcSHg6XROAcLmALvIEO08=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nbdf8uKwXo5jqqDCpuwTsXY2JaSlwyOur0y/jMmw7jwGcHpj46rYZt2X5TPjPCv/k
	 eawQgNhattyER6VEwvA6CKyRuXj4D/jUsp6X1yxbpIb7YtUpsEAYWLMGZOMs6PM1/c
	 oeVaT0RgDW7arMxxIbkOCPwlXzgs7FRWOl+51vjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7708EF802BC;
	Sun, 29 Mar 2020 09:54:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD7D3F80227; Thu, 26 Mar 2020 09:34:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E006F8011E
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 09:34:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E006F8011E
IronPort-SDR: fwQN7fcbcdQ49VcU8gSe72uzM1RppRq5Ut65H3XNh7pd6b8N1p8fM0qClauB6bE3COtAupD2Wl
 shp4JQ63mwqA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 01:34:21 -0700
IronPort-SDR: nly9xD30xpsmGWYFWXpCQfSK56dqJFIPOST3nuhEheHKExNfIQ5XgPc3HXfYowGvGJpdixXyaW
 B8k9bFVtCr9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; d="scan'208";a="446919804"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.3])
 by fmsmga005.fm.intel.com with ESMTP; 26 Mar 2020 01:34:13 -0700
Date: Thu, 26 Mar 2020 16:33:55 +0800
From: kernel test robot <rong.a.chen@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [cpufreq] 06c4d00466: will-it-scale.per_process_ops -53.4%
 regression
Message-ID: <20200326083355.GO11705@shao2-debian>
References: <20200320131509.564059710@linutronix.de>
 <20200324060124.GC11705@shao2-debian>
 <CAHp75VeeKZLeZ8E3Py7LECN54SPFHaRgkxrMzBYQWXM8x+4JhA@mail.gmail.com>
 <43a4189a-7153-18e8-4657-4a4400002c05@intel.com>
 <87zhc4ybbt.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87zhc4ybbt.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 29 Mar 2020 09:54:17 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Mark Gross <mgross@linux.intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-pci@vger.kernel.org,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Linux PM <linux-pm@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, lkp@lists.01.org,
 Bjorn Helgaas <bhelgaas@google.com>, Takashi Iwai <tiwai@suse.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto <linux-crypto@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
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

On Wed, Mar 25, 2020 at 11:32:06AM +0100, Thomas Gleixner wrote:
> Rong Chen <rong.a.chen@intel.com> writes:
> > On 3/24/20 6:24 PM, Andy Shevchenko wrote:
> >> On Tue, Mar 24, 2020 at 8:02 AM kernel test robot <rong.a.chen@intel.com> wrote:
> >>> Greeting,
> >>>
> >>> FYI, we noticed a -53.4% regression of will-it-scale.per_process_ops due to commit:
> >>> commit: 06c4d00466eb374841bc84c39af19b3161ff6917 ("[patch 09/22] cpufreq: Convert to new X86 CPU match macros")
> >>> url: https://github.com/0day-ci/linux/commits/Thomas-Gleixner/x86-devicetable-Move-x86-specific-macro-out-of-generic-code/20200321-031729
> >>> base: https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git linux-next
> >>>
> >>> in testcase: will-it-scale
> >>> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8G memory
> >>> with following parameters:
> >>
> >> drivers/cpufreq/speedstep-centrino.c change missed the terminator,
> >> perhaps it's a culprit, because I don't believe removing dups and
> >> reordering lines may affect this.
> >> Can you restore terminator there and re-test?
> >>
> >
> > I have retested with the change, but it has no effect on the performance.
> 
> Bah. The binary equivalence testing detected this, but I obvioulsy
> missed it. Delta fix below.
> 
> Thanks,
> 
>         tglx
> 
> 8<--------------
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -2727,7 +2727,7 @@ static inline void intel_pstate_request_
>  
>  #define X86_MATCH_HWP(model, hwp_mode)					\
>  	X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 6, INTEL_FAM6_##model, \
> -					   X86_FEATURE_APERFMPERF, hwp_mode)
> +					   X86_FEATURE_HWP, hwp_mode)
>  
>  static const struct x86_cpu_id hwp_support_ids[] __initconst = {
>  	X86_MATCH_HWP(BROADWELL_X,	INTEL_PSTATE_HWP_BROADWELL),

Hi Thomas,

The patch can fix the regression:

commit: 
  06c4d00466 ("cpufreq: Convert to new X86 CPU match macros")
  d369f9be1a ("the fix patch")

06c4d00466eb3748  d369f9be1ad1e22da4e8f03557  testcase/testparams/testbox
----------------  --------------------------  ---------------------------
         %stddev      change         %stddev
             \          |                \  
     93200             114%     199599        will-it-scale/performance-process-16-read2-ucode=0x21/lkp-ivb-d02
     93200             114%     199599        GEO-MEAN will-it-scale.per_process_ops

Best Regards,
Rong Chen
