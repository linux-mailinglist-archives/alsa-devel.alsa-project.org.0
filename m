Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9D163709
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 15:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAA981677;
	Tue,  9 Jul 2019 15:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAA981677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562679404;
	bh=7y8WVCVgy6DcHphtQB5IkoHxTKJPh2B/TXC17ELBFMA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SeLkECFuidqIDDAunHmbrW3UaAQBbTFlSawJH3valttrQXNdvhRk+oCxczsptbspc
	 IZnuo4ASFAjoCp1iayjqOmKk2ksP23ayAXIKQ6A7xYcdMowCXja4Vzwk1OKj2L6Q6n
	 t5lrN+az9q6CHyCOpKroIz0cPRH1FDsNUDhd5TVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3479CF80275;
	Tue,  9 Jul 2019 15:35:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED286F80274; Tue,  9 Jul 2019 15:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 656B1F800E0
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 15:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 656B1F800E0
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 06:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="173563332"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Jul 2019 06:34:49 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hkqGe-0003qt-PC; Tue, 09 Jul 2019 16:34:48 +0300
Date: Tue, 9 Jul 2019 16:34:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Curtis Malainey <cujomalainey@google.com>
Message-ID: <20190709133448.GC9224@smile.fi.intel.com>
References: <CAOReqxhxHiJ-4UYC-j4Quuuy5YP9ywohe_JwiLpCxqCvP-7ypg@mail.gmail.com>
 <20190709131401.GA9224@smile.fi.intel.com>
 <20190709132943.GB9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709132943.GB9224@smile.fi.intel.com>
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

On Tue, Jul 09, 2019 at 04:29:43PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 09, 2019 at 04:14:01PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 08, 2019 at 01:50:07PM -0700, Curtis Malainey wrote:
> 
> > So, the correct fix is to provide a platform data, like it's done in
> > drivers/dma/dw/pci.c::idma32_pdata, in the sst-firmware.c::dw_probe(), and call
> > idma32_dma_probe() with idma32_dma_remove() respectively on removal stage.
> > 
> > (It will require latest patches to be applied, which are material for v5.x)
> 
> Below completely untested patch to try

Also, it might require to set proper request lines (currently it uses 0 AFAICS).
Something like it's done in drivers/spi/spi-pxa2xx-pci.c for Intel Merrifield.

> 
> --- 8< --- 8< --- 8< ---
> 
>  From 2bd36a75460613f0a14f0763b766cae8ce20c57d Mon Sep 17 00:00:00 2001
>  From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>  Date: Tue, 9 Jul 2019 16:24:35 +0300
>  Subject: [PATCH 1/1] ASoC: Intel: common: Use proper DMA controller type
> 
> It has been reported that Intel Broadwell machines can't use SST
> since DMA driver probe failure. The root cause *maybe* in a wrong type
> of DMA controller in use.
> 
> Use Intel iDMA 32-bit instead of Synopsys DesignWare controller for Intel SST.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  sound/soc/intel/common/sst-firmware.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/common/sst-firmware.c b/sound/soc/intel/common/sst-firmware.c
> index d27947aeb079..5da7fb74c845 100644
> --- a/sound/soc/intel/common/sst-firmware.c
> +++ b/sound/soc/intel/common/sst-firmware.c
> @@ -174,6 +174,16 @@ static int block_list_prepare(struct sst_dsp *dsp,
>  	return ret;
>  }
>  
> +static const struct dw_dma_platform_data idma32_pdata = {
> +	.nr_channels = 8,
> +	.chan_allocation_order = CHAN_ALLOCATION_ASCENDING,
> +	.chan_priority = CHAN_PRIORITY_ASCENDING,
> +	.block_size = 131071,
> +	.nr_masters = 1,
> +	.data_width = {4},
> +	.multi_block = {1, 1, 1, 1, 1, 1, 1, 1},
> +};
> +
>  static struct dw_dma_chip *dw_probe(struct device *dev, struct resource *mem,
>  	int irq)
>  {
> @@ -184,6 +194,7 @@ static struct dw_dma_chip *dw_probe(struct device *dev, struct resource *mem,
>  	if (!chip)
>  		return ERR_PTR(-ENOMEM);
>  
> +	chip->pdata = &idma32_pdata;
>  	chip->irq = irq;
>  	chip->regs = devm_ioremap_resource(dev, mem);
>  	if (IS_ERR(chip->regs))
> @@ -195,7 +206,7 @@ static struct dw_dma_chip *dw_probe(struct device *dev, struct resource *mem,
>  
>  	chip->dev = dev;
>  
> -	err = dw_dma_probe(chip);
> +	err = idma32_dma_probe(chip);
>  	if (err)
>  		return ERR_PTR(err);
>  
> @@ -204,7 +215,7 @@ static struct dw_dma_chip *dw_probe(struct device *dev, struct resource *mem,
>  
>  static void dw_remove(struct dw_dma_chip *chip)
>  {
> -	dw_dma_remove(chip);
> +	idma32_dma_remove(chip);
>  }
>  
>  static bool dma_chan_filter(struct dma_chan *chan, void *param)
> -- 
> 2.20.1
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
