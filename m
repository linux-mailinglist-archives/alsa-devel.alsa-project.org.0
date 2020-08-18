Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA5D2482AF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 12:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 088071745;
	Tue, 18 Aug 2020 12:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 088071745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597745646;
	bh=B+weTbEesFDQtkOAA/ucS4rVnDQQsU8gcUL7X2iQLnc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mPs+h623fPiJtVG6VK6tZup4/F6itvdZingNiy58JzRhnXiMb3P0Cn77MvEcdK0t4
	 WxHDSJ0NvO/Q4L0RsY/TnFQneSIoH2TwzqV38X9BCMQS1EOOO/X4oXHz9eP2BqpEZU
	 5SBO+UITTHVRU1TGk+wRv95jRYWqKEwIR+oyScbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27271F80228;
	Tue, 18 Aug 2020 12:12:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E3A8F8023F; Tue, 18 Aug 2020 12:12:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 497EBF80104
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 12:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 497EBF80104
IronPort-SDR: fnHzqXTBZcenj3XkabMFhhMT83jUfjYmg57KF6RP6H8jA2kL7KJyjc0qPrnNZJOgRav4qbSX5m
 XkS/IATo5ihg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="142701866"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="142701866"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 03:12:10 -0700
IronPort-SDR: oPnM1bQcus2gYE03EYpkreiopdISIcYURcHEHmqSULWfFhLN/TiYK6geCw+Q6WBGRSt3aQBuoL
 SXv9rzQOV/Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="326688042"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 18 Aug 2020 03:12:06 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1k7yWt-009cdh-Ez; Tue, 18 Aug 2020 13:07:43 +0300
Date: Tue, 18 Aug 2020 13:07:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 01/13] ASoC: Intel: Add catpt device
Message-ID: <20200818100743.GH1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-2-cezary.rojewski@intel.com>
 <20200813182908.GA1891694@smile.fi.intel.com>
 <3280b1a6-81f3-9f3f-d496-2bbf570c82d1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3280b1a6-81f3-9f3f-d496-2bbf570c82d1@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

On Mon, Aug 17, 2020 at 12:02:39PM +0200, Cezary Rojewski wrote:
> On 2020-08-13 8:29 PM, Andy Shevchenko wrote:
> > On Wed, Aug 12, 2020 at 10:57:41PM +0200, Cezary Rojewski wrote:
> 
> Thanks for good review Andy!

You're welcome!

...

> > JFYI, I have just submitted a series [1] that includes this helper [2]
> > to be available for all.
> > 
> > [1]: https://lore.kernel.org/linux-acpi/20200813175729.15088-1-andriy.shevchenko@linux.intel.com/
> > [2]: https://lore.kernel.org/linux-acpi/20200813175729.15088-4-andriy.shevchenko@linux.intel.com/
> > 
> 
> Well, I'm happy that catpt somewhat impacted resource-API getting more
> flexble, although it would be nice to get --cc'ed as
> _overlapping/_intersecting got moved into general part of kernel without
> changes, basically.
> 
> This raises a dependancy issue, am I right? i.e. until this gets merged,
> catpt will cause compilation errors on Mark's for-next. -or- perhaps you
> want me to leave things as they are for current release while removing said
> function later, once your PR get's merged?

I hope Rafael accepts the v2 soon and thus may provide an immutable branch to
be consumed by others. That's the way how usually we solve cross-subsystem
series.

In any case we still have time for better review of the rest of the series.

...

> > > +struct catpt_dev {
> > > +	struct device *dev;
> > 
> > > +	struct dw_dma_chip *dmac;
> > 
> > Is it possible to use opaque pointer here? It will be better if in the future
> > (I think unlikely, but still) somebody decides to use this with another DMA
> > engine.
> 
> Any opaque structure comes at a cost -> requires higher level of
> understanding from developers maintaining given piece of code (that includes
> architecture knowledge too, to get a grasp of why such decision was even
> made) == higher maintaince cost.
> 
> One could device ADSP architectures into:
> 1) LPT/WPT
> 2) BYT/CHT/BDW
> 3) cAVS (SKL+)
> 4) new (which I won't be elaborating here for obvious reasons)
> 
> To my knowledge, except for 1), none of them makes use of dmaengine.h when
> loading FW or doing any other action for that matter. As such, I don't see
> any reason to convert something explicit into something implicit. Don't
> believe either of options would be reusing struct catpt_dev too. In general,
> to make that happen you'd have to start with conversion of existing HDAudio
> transport (cAVS+) into dmaengine model and then do the same with SoundWire
> (cAVS+) - haven't seen sdw code in a while but still pretty sure it's not
> dmaengine-friendly.


Some documentation says that Audio is using iDMA 32-bit in (some?) BSW/CHT,
some documentation says otherwise (Synopsys DesignWare). Can you somewhere
clarify what the actual state of affairs? I remember even some (android?) ASoC
code used to have different type of DMA engines because of that.

...

> > > +	if (ret < 0)
> > 
> > I'm wondering if all these ' < 0' all over the code make sense? What do you
> > expect out of positive returned values if any?
> > 
> 
> Isn't this more of a preference? Please note I'm basing many of my decisions
> on code that's around me - /sound/core/ and sound/soc/ *.c.
> 
> Except for IPCs, basically all catpt rets retrieved from functions called
> will be returning either 0 (success) or <0 (error). No objections, but I
> don't see much difference either.

In case some will return positive code you may hide the (potential) issue.
I prefer be explicit over implicit, means use ' < 0' only where it makes sense.

> > > +		goto exit;

...

> > > +	ret = devm_add_action(cdev->dev, board_pdev_unregister, board);
> > > +	if (ret < 0) {
> > > +		platform_device_unregister(board);
> > 
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > 
> > return ret;
> > 
> 
> Similarly, to comment~2 regarding preferences, don't mind the change (in
> fact, I'm a fan) but in the past got messaged to leave things explicit -
> leave last 'if' with return ret, while return 0 marking success outside.

Actually you may simplify by calling devm_add_action_or_reset() instead.

...

> > > +	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> > > +	if (!cdev)
> > > +		return -ENOMEM;
> > 
> > 
> > > +	cdev->spec = device_get_match_data(dev);
> > > +	if (!cdev->spec)
> > > +		return -ENODEV;
> > 
> > You may save some cycles if you do this before memory allocations.
> > 
> 
> i.e. define a local for spec, assign and begin the init process only once
> it's found? Isn't that a loss in most cases? Comes down to:
> 
> 	declare local + later cdev->spec = spec assignment
> 	vs
> 	unlikely -ENODEV with memory being unnecessarily allocated
> 
> Perhaps I'm unaware of what's going on with device_get_match_data, but I
> believe .probe() won't get called until one of .acpi_match_table ids matches
> device available on the bus. Existing list of ids won't ever get changed as
> there are only two platforms available for 2011-2013 ADSP architecture.

Up to you but I consider cleaner code if we don't do heavier operation ahead
when lighter ones can fail.

...

> > > +	/* map DSP bar address */
> > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +	if (!res)
> > > +		return -ENODEV;
> > > +	cdev->lpe_ba = devm_ioremap(dev, res->start, resource_size(res));
> > > +	if (!cdev->lpe_ba)
> > > +		return -EIO;
> > > +	cdev->lpe_base = res->start;
> > 
> > Why the region is not get requested?
> > 
> > > +	/* map PCI bar address */
> > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > +	if (!res)
> > > +		return -ENODEV;
> > > +	cdev->pci_ba = devm_ioremap(dev, res->start, resource_size(res));
> > > +	if (!cdev->pci_ba)
> > > +		return -EIO;
> > 
> > Ditto.
> > 
> 
> Comes from catpt_dmac_probe() (dsp.c) making use of devm_ioremap_resource().
> If you _get_ requested resource there, the function called in
> catpt_dmac_probe() will yielrd -EBUSY.
> 
> This is based on existing code:
> /sound/soc/intel/common/sst-acpi.c ::sst_acpi_probe() see mmio assignments.
> /sound/soc/intel/common/sst-firmate.ce ::dw_probe() see chip->regs
> assignment.
> 
> Perhaps you've found even more problems in existing code than I did..

Hmm... But isn't catpt_dmac_probe(), actually what is in the DMA engine driver
beneath, should take care of the requesting *and* remapping resource?

...

> > > +		.acpi_match_table = ACPI_PTR(catpt_ids),
> > 
> > ACPI_PTR() either bogus (when you have depends on ACPI) or mistake that brings
> > you compiler warning (unused variable).
> > 
> > I highly recommend in new code avoid completely ACPI_PTR() and of_match_ptr()
> > macros.
> > 
> 
> That's something new for me. Thanks for a good advice.

Basically of_match_ptr / ACPI_PTR should go together with ugly ifdeffery,
otherwise neither of them should be present. If the driver can be compiled but
won't be functional w/o OF / ACPI dependency, then we do something like

	depends on ACPI || COMPILE_TEST

to give a hint to the user.

...

> > > +#include <linux/iopoll.h>
> > 
> > Missed headers:
> > bits.h (note, the below guarantees to provide this one)
> > bitops.h
> > io.h (writel(), readl(), etc)
> > 
> 
> Removed these as registers.h always gets included with other files which
> already inhering them via nesting.
> Will update in v5 as requested.

The rule of thumb is to include headers which we are direct users of.
This is listed in Submit Patches Checklist document AFAIR.

...

> > > +#define CATPT_SSP_SSC0		0x0
> > > +#define CATPT_SSP_SSC1		0x4
> > > +#define CATPT_SSP_SSS		0x8
> > > +#define CATPT_SSP_SSIT		0xC
> > > +#define CATPT_SSP_SSD		0x10
> > > +#define CATPT_SSP_SSTO		0x28
> > > +#define CATPT_SSP_SSPSP		0x2C
> > > +#define CATPT_SSP_SSTSA		0x30
> > > +#define CATPT_SSP_SSRSA		0x34
> > > +#define CATPT_SSP_SSTSS		0x38
> > > +#define CATPT_SSP_SSC2		0x40
> > > +#define CATPT_SSP_SSPSP2	0x44
> > 
> > Isn't it PXA2xx register set? Can you use their definitions?
> > 
> 
> Could you be more specific? Wasn't able to find anything useful in /include.

include/linux/pxa2xx_ssp.h

...

> > These defaults lack of comments.
> > 
> 
> Because there aren't any available to choose from. While these are part of
> "recommended sequence", the only comment attached is:
>     bring hw to their defaults as hw won't reset itself
> 
> catpt is an effort of sw and fw guys, no hw input is included as I've found
> only one guy still @ intel but he is busy with different projects and
> honestly, even if he would agree, him digging now why was this needed might
> take weeks. That's 2011 ADSP architecture, not some cutting-edge stuff.

I understand, but try your best to leave at least a little trail of these...
Sometimes, btw, so called Production Kernel repository (patches there) may give
a hint. Lately, during AtomISP v2 resurrection, it appears that Intel Aero
platform has support there and a lot of quirks available somewhere.

-- 
With Best Regards,
Andy Shevchenko


