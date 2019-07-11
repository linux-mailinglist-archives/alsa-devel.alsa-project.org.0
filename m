Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE28657C1
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 15:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF30515E2;
	Thu, 11 Jul 2019 15:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF30515E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562850868;
	bh=Xv5PjUeXKrOym/rXuKhoK9wtWl6+5+Raxn0wS1G68SE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OgQq9uYOsKW7zwvffY+1e+eWjzQ4u0JqbdywKN9NAk+nBtcpWTEcWItvUn/bCWppY
	 UoB8Svqbcl0fzPLmTeLEqIi9kZGZxYW8uU1jxiCGncaKGdxcXJYfo24cnsg2bEXVZW
	 /1NA1ewOGm/XcjKG6HYTtpHs414VBeaq1YDvsat8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07487F802FB;
	Thu, 11 Jul 2019 15:12:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8630BF802FB; Thu, 11 Jul 2019 15:12:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9516FF801A4
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 15:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9516FF801A4
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2019 06:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,478,1557212400"; d="scan'208";a="186375427"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2019 06:12:33 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hlYsC-0006Wg-5J; Thu, 11 Jul 2019 16:12:32 +0300
Date: Thu, 11 Jul 2019 16:12:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Curtis Malainey <cujomalainey@google.com>
Message-ID: <20190711131232.GS9224@smile.fi.intel.com>
References: <CAOReqxhxHiJ-4UYC-j4Quuuy5YP9ywohe_JwiLpCxqCvP-7ypg@mail.gmail.com>
 <20190709131401.GA9224@smile.fi.intel.com>
 <20190709132943.GB9224@smile.fi.intel.com>
 <20190709133448.GC9224@smile.fi.intel.com>
 <20190709133847.GD9224@smile.fi.intel.com>
 <CAOReqxgnbDJsEcv7vdX3w44rzB=B69sHj95E8yBZ8DnZq0=63Q@mail.gmail.com>
 <20190710164346.GP9224@smile.fi.intel.com>
 <CAOReqxgnUp2tTp__YCjF_QH4166FAA1CE8Yq_VdE9jLW6Q4s3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOReqxgnUp2tTp__YCjF_QH4166FAA1CE8Yq_VdE9jLW6Q4s3A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Ross Zwisler <zwisler@google.com>, Fletcher Woodruff <fletcherw@google.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>, dmaengine@vger.kernel.org,
 Pierre-louis Bossart <pierre-louis.bossart@intel.com>
Subject: Re: [alsa-devel] DW-DMA: Probe failures on broadwell
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jul 10, 2019 at 02:24:48PM -0700, Curtis Malainey wrote:
> On Wed, Jul 10, 2019 at 9:43 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Jul 09, 2019 at 12:27:49PM -0700, Curtis Malainey wrote:

> > > Thanks for the information, we are running a 4.14 kernel so we don't
> > > have the idma32 driver, I will see if I can backport it and report
> > > back if the fix works.
> >
> > Driver is supporting iDMA 32-bit in v4.14 AFAICS.
> > The missed stuff is a split and some fixes here and there.
> > Here is the list of patches I have in a range v4.14..v5.2
> > (I deliberately dropped the insignificant ones)
> >
> > 934891b0a16c dmaengine: dw: Don't pollute CTL_LO on iDMA 32-bit
> > 91f0ff883e9a dmaengine: dw: Reset DRAIN bit when resume the channel
> > 69da8be90d5e dmaengine: dw: Split DW and iDMA 32-bit operations
> > 87fe9ae84d7b dmaengine: dw: Add missed multi-block support for iDMA 32-bit
> > ffe843b18211 dmaengine: dw: Fix FIFO size for Intel Merrifield
> > 7b0c03ecc42f dmaengine: dw-dmac: implement dma protection control setting
> >
> > For me sounds like fairly easy to backport.
> >
> I got the code integrated, and ran some tests. The test device
> regularly hits a BUG_ON in the dw/core.c, debug is turned on in dw
> core

I see. We need ASoC guys to shed a light here. I don't know that part at all.

Only last suggestion I have is to try remove multi-block setting from the
platform data (it will be emulated in software if needed). But I don't believe
the DMA for audio has no such feature enabled.

> We have only been able to consistently reproduce the DMA boot issue on
> our original code consistently on 1 device and sporadically on another
> handful of devices.
> When the device did finally booted after 2-3 device crashes the device
> failed to load the DSP.

Yeah, it has something to do with this firmware loader code...

> [    3.709573] sst-acpi INT3438:00: DesignWare DMA Controller, 8 channels
> [    3.959027] haswell-pcm-audio haswell-pcm-audio: error: audio DSP
> boot timeout IPCD 0x0 IPCX 0x0
> [    3.970336] bdw-rt5677 bdw-rt5677: ASoC: failed to init link System PCM

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
