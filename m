Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E88D31939F7
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 08:58:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2A6166E;
	Thu, 26 Mar 2020 08:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2A6166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585209527;
	bh=IZZuUuRaF8ZHMq/warAIOCn58yZaHzWG9RLti36THb0=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JOEXDfYJHh5rUdbSS8VuVoqWbqAjbIDpXYs7wosmprl1ZJArqVYSycZRTvU+zJ3p9
	 5UtqaF3QF9Zjz1jdbZhh7D9eMrtivqqQrduVXkDhFwWxM3FjaYa/yRbEAlJ1jZuns7
	 YFq+U8kGztYyTs33k6raAncD9Mi1wm4k3IQ/1OTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83CFBF8029A;
	Thu, 26 Mar 2020 08:54:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01DB1F800B9; Tue, 24 Mar 2020 16:38:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B4D0F800B9
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 16:38:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B4D0F800B9
IronPort-SDR: bNPMzrrP5747uXU2xpSDlm/4rlEtlQsU+TiuGM/7GQhxCC4eAeBXGAD1mA6XVLFx0Qa6hiWvqv
 etcuintW5JVQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 08:38:48 -0700
IronPort-SDR: OH9LOnbiL4v4JZEOKEB/asPk1R/gzlJCOgYYDD8Y/4+mtRjZPj4rORMZ9Y6HhOwPh9gE+I4cRC
 Soiz8Ghm/JHg==
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; d="scan'208";a="238262386"
Received: from spandruv-mobl.amr.corp.intel.com ([10.134.90.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 08:38:47 -0700
Message-ID: <406e39aa9890d4d518a2259b539858d82f4d6e18.camel@linux.intel.com>
Subject: Re: [cpufreq] 06c4d00466: will-it-scale.per_process_ops -53.4%
 regression
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, kernel test robot
 <rong.a.chen@intel.com>
Date: Tue, 24 Mar 2020 08:38:46 -0700
In-Reply-To: <CAHp75VeeKZLeZ8E3Py7LECN54SPFHaRgkxrMzBYQWXM8x+4JhA@mail.gmail.com>
References: <20200320131509.564059710@linutronix.de>
 <20200324060124.GC11705@shao2-debian>
 <CAHp75VeeKZLeZ8E3Py7LECN54SPFHaRgkxrMzBYQWXM8x+4JhA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 26 Mar 2020 08:54:37 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND
 64-BIT\)" <x86@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Mark Gross <mgross@linux.intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-pci@vger.kernel.org,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Linux PM <linux-pm@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, lkp@lists.01.org,
 Takashi Iwai <tiwai@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>,
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

On Tue, 2020-03-24 at 12:24 +0200, Andy Shevchenko wrote:
> On Tue, Mar 24, 2020 at 8:02 AM kernel test robot <
> rong.a.chen@intel.com> wrote:
> > Greeting,
> > 
> > FYI, we noticed a -53.4% regression of will-it-
> > scale.per_process_ops due to commit:
> > commit: 06c4d00466eb374841bc84c39af19b3161ff6917 ("[patch 09/22]
> > cpufreq: Convert to new X86 CPU match macros")
> > url: 
> > https://github.com/0day-ci/linux/commits/Thomas-Gleixner/x86-devicetable-Move-x86-specific-macro-out-of-generic-code/20200321-031729
> > base: 
> > https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git
> > linux-next
> > 
> > in testcase: will-it-scale
> > on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz
> > with 8G memory
> > with following parameters:
> 
> drivers/cpufreq/speedstep-centrino.c change missed the terminator,
> perhaps it's a culprit, because I don't believe removing dups and
> reordering lines may affect this.
> Can you restore terminator there and re-test?

This is a Ivy Bridge. So if it has to do anything cpufreq then it is
not loading the cpufreq driver (intel_pstate or acpi_cpufreq).
What is
 cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor


> 

