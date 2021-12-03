Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618F3467EE8
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 21:43:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09CBF24FF;
	Fri,  3 Dec 2021 21:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09CBF24FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638564187;
	bh=EDjVzYW+DPyngtf5GYYfuuP2k3C2GZ0W13+dLpsz1H8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KZtz123YRE1xPtqjV8Q75a5qUvgAxqhVZHOl9esUIv7k5D60ChYa55SITQg/9nzIs
	 sCM84/h/H9lIXFQTzrsMpZsNwat4WpoHnRXpUQ8DclVACkGDuTOqgB84S0MpJn2uXq
	 N4ppiKst3RuKw2S9ZljLu8JwwKwTs6iomOlk0nS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64039F80249;
	Fri,  3 Dec 2021 21:41:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6F67F80246; Fri,  3 Dec 2021 21:41:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D269F80085
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 21:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D269F80085
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="235786850"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="235786850"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 12:40:30 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="598104041"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 12:40:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mtFL1-001u9Y-Lk; Fri, 03 Dec 2021 22:39:23 +0200
Date: Fri, 3 Dec 2021 22:39:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 fntoth@gmail.com
Subject: Re: [bug report] ASoC: Intel: mrfld - create separate module for pci
 part
Message-ID: <YaqAez/CFZ2OhtdU@smile.fi.intel.com>
References: <20211202151322.GA21325@kili>
 <19647b98-83fd-b493-0fed-3c4e43cbeba8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19647b98-83fd-b493-0fed-3c4e43cbeba8@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Hans de Goede <hdegoede@redhat.com>, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
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

+Cc Ferry (the topic is non-SOF version of sound driver for Intel Merrifield)

On Fri, Dec 03, 2021 at 07:46:04AM -0600, Pierre-Louis Bossart wrote:
> On 12/3/21 4:13 AM, Dan Carpenter wrote:
> > Hello Vinod Koul,
> > 
> > The patch f533a035e4da: "ASoC: Intel: mrfld - create separate module
> > for pci part" from Nov 4, 2014, leads to the following Smatch static
> > checker warning:
> > 
> > 	sound/soc/intel/atom/sst/sst_pci.c:102 sst_platform_get_resources()
> > 	warn: resource freed on success: 'ctx->pci'
> > 
> > sound/soc/intel/atom/sst/sst_pci.c
> >     25 static int sst_platform_get_resources(struct intel_sst_drv *ctx)
> >     26 {
> >     27         int ddr_base, ret = 0;
> >     28         struct pci_dev *pci = ctx->pci;
> >     29 
> >     30         ret = pci_request_regions(pci, SST_DRV_NAME);
> >     31         if (ret)
> >     32                 return ret;
> >     33 
> >     34         /* map registers */
> >     35         /* DDR base */
> >     36         if (ctx->dev_id == SST_MRFLD_PCI_ID) {
> >     37                 ctx->ddr_base = pci_resource_start(pci, 0);
> >     38                 /* check that the relocated IMR base matches with FW Binary */
> >     39                 ddr_base = relocate_imr_addr_mrfld(ctx->ddr_base);
> >     40                 if (!ctx->pdata->lib_info) {
> >     41                         dev_err(ctx->dev, "lib_info pointer NULL\n");
> >     42                         ret = -EINVAL;
> >     43                         goto do_release_regions;
> >     44                 }
> >     45                 if (ddr_base != ctx->pdata->lib_info->mod_base) {
> >     46                         dev_err(ctx->dev,
> >     47                                         "FW LSP DDR BASE does not match with IFWI\n");
> >     48                         ret = -EINVAL;
> >     49                         goto do_release_regions;
> >     50                 }
> >     51                 ctx->ddr_end = pci_resource_end(pci, 0);
> >     52 
> >     53                 ctx->ddr = pcim_iomap(pci, 0,
> >     54                                         pci_resource_len(pci, 0));
> >     55                 if (!ctx->ddr) {
> >     56                         ret = -EINVAL;
> >     57                         goto do_release_regions;
> >     58                 }
> >     59                 dev_dbg(ctx->dev, "sst: DDR Ptr %p\n", ctx->ddr);
> >     60         } else {
> >     61                 ctx->ddr = NULL;
> >     62         }
> >     63         /* SHIM */
> >     64         ctx->shim_phy_add = pci_resource_start(pci, 1);
> >     65         ctx->shim = pcim_iomap(pci, 1, pci_resource_len(pci, 1));
> >     66         if (!ctx->shim) {
> >     67                 ret = -EINVAL;
> >     68                 goto do_release_regions;
> >     69         }
> >     70         dev_dbg(ctx->dev, "SST Shim Ptr %p\n", ctx->shim);
> >     71 
> >     72         /* Shared SRAM */
> >     73         ctx->mailbox_add = pci_resource_start(pci, 2);
> >     74         ctx->mailbox = pcim_iomap(pci, 2, pci_resource_len(pci, 2));
> >     75         if (!ctx->mailbox) {
> >     76                 ret = -EINVAL;
> >     77                 goto do_release_regions;
> >     78         }
> >     79         dev_dbg(ctx->dev, "SRAM Ptr %p\n", ctx->mailbox);
> >     80 
> >     81         /* IRAM */
> >     82         ctx->iram_end = pci_resource_end(pci, 3);
> >     83         ctx->iram_base = pci_resource_start(pci, 3);
> >     84         ctx->iram = pcim_iomap(pci, 3, pci_resource_len(pci, 3));
> >     85         if (!ctx->iram) {
> >     86                 ret = -EINVAL;
> >     87                 goto do_release_regions;
> >     88         }
> >     89         dev_dbg(ctx->dev, "IRAM Ptr %p\n", ctx->iram);
> >     90 
> >     91         /* DRAM */
> >     92         ctx->dram_end = pci_resource_end(pci, 4);
> >     93         ctx->dram_base = pci_resource_start(pci, 4);
> >     94         ctx->dram = pcim_iomap(pci, 4, pci_resource_len(pci, 4));
> >     95         if (!ctx->dram) {
> >     96                 ret = -EINVAL;
> >     97                 goto do_release_regions;
> >     98         }
> >     99         dev_dbg(ctx->dev, "DRAM Ptr %p\n", ctx->dram);
> >     100 do_release_regions:
> >     101         pci_release_regions(pci);
> > --> 102         return ret;
> >     103 }
> > 
> > Surely there should be a "return 0;" before the do_release_regions:
> > label?  How does this code work?
> 
> Thanks for reporting this Dan. Yes this doesn't look good at all.
> 
> This PCI part is only used on Merrifield/Tangier, and I am not sure if
> anyone ever managed to make audio work with the upstream version of this
> driver. It's my understanding that this platform is no longer maintained
> by Intel, and the Edison Yocto code uses the SOF driver.
> 
> The Kconfig updated in 2018 hints at those limitations:
> 
> config SND_SST_ATOM_HIFI2_PLATFORM_PCI
> 	tristate "PCI HiFi2 (Merrifield) Platforms"
> 	depends on X86 && PCI
> 	select SND_SST_ATOM_HIFI2_PLATFORM
> 	help
> 	  If you have a Intel Merrifield/Edison platform, then
> 	  enable this option by saying Y or m. Distros will typically not
> 	  enable this option: while Merrifield/Edison can run a mainline
> 	  kernel with limited functionality it will require a firmware file
> 	  which is not in the standard firmware tree
> 
> I would guess that indeed a return 0; is missing, but maybe it's time to
> remove this PCI code completely. I can't think of any user of the PCI
> parts of this driver.
> 
> Andy, Hans, Mark, Takashi, what do you think?

-- 
With Best Regards,
Andy Shevchenko


