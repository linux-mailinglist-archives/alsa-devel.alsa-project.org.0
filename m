Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9515A63698
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 15:15:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21FBE1666;
	Tue,  9 Jul 2019 15:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21FBE1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562678158;
	bh=gr7+YMNZeySz6fLntx92P0mjlTZ9R+rPNP3SQ9iOyeU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YqM8P/CieCz4EKQB/i/ZD6iz1RWRuvG2K3vQA+i0Tw294mzpbLHTL5AsrPlipWBkE
	 l8nN/Zh0spoEmHolNdJRxlfkoXhjbgsHD5yqJe8gelWSkk4O0dbpBYS6gQmZc7Xiic
	 9W9SdngGBXUqIP+xjmdf+KbEYPhgY1nyaPvSU49s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37F80F80274;
	Tue,  9 Jul 2019 15:14:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ABDBF80274; Tue,  9 Jul 2019 15:14:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0230F800E0
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 15:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0230F800E0
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 06:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="340748003"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga005.jf.intel.com with ESMTP; 09 Jul 2019 06:14:03 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hkpwX-0003bi-Sy; Tue, 09 Jul 2019 16:14:01 +0300
Date: Tue, 9 Jul 2019 16:14:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Curtis Malainey <cujomalainey@google.com>
Message-ID: <20190709131401.GA9224@smile.fi.intel.com>
References: <CAOReqxhxHiJ-4UYC-j4Quuuy5YP9ywohe_JwiLpCxqCvP-7ypg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOReqxhxHiJ-4UYC-j4Quuuy5YP9ywohe_JwiLpCxqCvP-7ypg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Ross Zwisler <zwisler@google.com>,
 Fletcher Woodruff <fletcherw@google.com>,
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

(I think this is okay to go on public here)
+Cc: Pierre, Liam, DMA Engine ML, ASoC ML

On Mon, Jul 08, 2019 at 01:50:07PM -0700, Curtis Malainey wrote:
> Hello Andy,
> 
> I am reaching out to you as you are the main author for
> drivers/dma/dw/core.c and we are seeing a failure in there on some of
> our samus devices. On certain device we are seeing the following
> failure (debugging enabled in this log.)
> 
> [    3.587515] sst-acpi INT3438:00: DW_PARAMS: 0x00000000

AFAIK, when Synopsys DesignWare DMA IP is in use in Intel, we almost always
(yes, I know couple of exceptions), enable auto configuration block. Thus, the
*private* DMA controllers used in Broadwell are actually Intel iDMA 32-bit.
Nowadays the differences can be seen in drivers/dma/dw/idma32.c.

Note, DMA in the driver is used solely for firmware load, simplest workaround
is to disable DMA. Though, personally, for sake of test coverage, I would like
to see how it works in DMA case.

> [    3.587519] haswell-pcm-audio haswell-pcm-audio: error: DMA device
> register failed
> [    3.587524] haswell-pcm-audio haswell-pcm-audio: sst_dma_new failed -22
> [    3.598010] bdw-rt5677 bdw-rt5677: ASoC: failed to init link System PCM
> 
> I don't have the datasheets for this component but I am wondering if
> you could help us troubleshoot this bug it would be greatly
> appreciated if possible. I am not sure if we are seeing a hardware
> boot failure or a boot race. I was hoping you could shed some light on
> this and if it is a boot race help us recover from it. I know Intel
> relies on no defers typically but it would be nice to see if we can
> fix this. Below is where I have traced the error source to in core.c.

So, the correct fix is to provide a platform data, like it's done in
drivers/dma/dw/pci.c::idma32_pdata, in the sst-firmware.c::dw_probe(), and call
idma32_dma_probe() with idma32_dma_remove() respectively on removal stage.

(It will require latest patches to be applied, which are material for v5.x)

>                  dw_params = dma_readl(dw, DW_PARAMS);
>                  dev_dbg(chip->dev, "DW_PARAMS: 0x%08x\n", dw_params);
> 
>                  autocfg = dw_params >> DW_PARAMS_EN & 1;
>                  if (!autocfg) {
>                          err = -EINVAL;
>                          goto err_pdata;
>                  }
> Let me know if you have any ideas on how to mitigate this, thanks.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
