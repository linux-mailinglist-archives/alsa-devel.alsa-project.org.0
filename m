Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A790D25195E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 15:18:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 359391672;
	Tue, 25 Aug 2020 15:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 359391672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598361502;
	bh=uqOSW2pYgZKhcEF00xln8xudIY+dgpL21eO5+syhm84=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G9WwZB1gDMgO8N8am3GdcNcmnsbtwjayTgodE5f93IiSsxzjl8SacP+9eg4nn0X7p
	 02mH/BtKYjCB8qdUrOU2ghbmw8puhJh8ru12mws6oroVJ8emYJdTmKr6+eYBmHGnxt
	 hUz1iDRzJAUwE9wM2BP844MkajkOYDdexggUYYC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63071F800D1;
	Tue, 25 Aug 2020 15:16:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA7D0F8025A; Tue, 25 Aug 2020 15:16:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=PRX_BODY_29,PRX_BODY_30,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1506F800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 15:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1506F800D1
IronPort-SDR: SIyXBUo8t3kaoiXjx1K/lWvw/Ocar/FWRTXViCMSdrMOTzcPpPmQpUDgFWwSzxGJWxuBPfHfYj
 AhkCPDZWhW/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="135649302"
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; d="scan'208";a="135649302"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 06:16:21 -0700
IronPort-SDR: bpju1AcqkVGTABgDfoxk4a4Y8aHrlvdflEIIoLdI4OICC4xRQPEu4WnJTEGggFlRijE7aIq0Eh
 B0qooZwGaNOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; d="scan'208";a="328861076"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 25 Aug 2020 06:16:17 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1kAYoB-00BKYi-Ai; Tue, 25 Aug 2020 16:16:15 +0300
Date: Tue, 25 Aug 2020 16:16:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 02/13] ASoC: Intel: catpt: Define DSP operations
Message-ID: <20200825131615.GG1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-3-cezary.rojewski@intel.com>
 <20200813185129.GB1891694@smile.fi.intel.com>
 <946fdd80-c89d-ee1b-6eef-e752318b55a6@intel.com>
 <237f2343-fd57-8ebf-b8f2-8c2cf5c3c745@intel.com>
 <20200820090055.GT1891694@smile.fi.intel.com>
 <dec6d548-8376-683f-7d07-44f1cfbbf375@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dec6d548-8376-683f-7d07-44f1cfbbf375@intel.com>
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

On Mon, Aug 24, 2020 at 06:33:17PM +0200, Cezary Rojewski wrote:
> On 2020-08-20 11:00 AM, Andy Shevchenko wrote:
> > On Thu, Aug 20, 2020 at 09:30:13AM +0200, Cezary Rojewski wrote:
> > > On 2020-08-17 1:12 PM, Cezary Rojewski wrote:
> > > > On 2020-08-13 8:51 PM, Andy Shevchenko wrote:
> > > > > On Wed, Aug 12, 2020 at 10:57:42PM +0200, Cezary Rojewski wrote:
> 
> > > > > > +#define CATPT_DMA_MAXBURST    0x3
> > > > > 
> > > > > We have DMA engine definitions for that, please avoid magic numbers.
> > > > 
> > > > As with most of the dma stuff, based on existing:
> > > > /sound/soc/intel/common/sst-firmware.c SST_DSP_DMA_MAX_BURST
> > > > 
> > > > Ack.
> > > 
> > > Actually, wasn't able to find anything _MAXBURST related in dmaengine.h.
> > > _BUSWIDTH_ have their constants defined there, true, but I'm already making
> > > use of these and this is dst/src_maxburst we're talking about. From what
> > > I've seen in kernel sources, most usages are direct assignments:
> > > xxx_maxburst = Y;
> > 
> > Okay, and how 0x3 bytes can be a burst? Does DMA engine support this?
> > 
> 
> That's a very good question. Early this morning starting digging.
> 
> I believe this stems from attempt of sst_dsp_dma_get_channel() to serve two
> masters - MID DMAC and DW DMAC - at the same time.
> 
> Intel MID DMAC has been first introduced in version v2.6.36-rc1 and
> subsequently removed in v4.1-rc1 due to lack of any usage throughout its
> whole life. Reference:
> 	https://cateee.net/lkddb/web-lkddb/INTEL_MID_DMAC.html
> 
> files to look for in said kernel versions:
> 	drivers/dma/intel_mid_dma.c
> 	drivers/dma/intel_mid_regs.h
> 
> As MID DMAC is supposed to handle Langwell PCH which is coupled with Atom
> CPUs my guess is that /atom/ was supposed to make use of said DMAC at
> certain point in time which actually never happened. This is backed up by
> the following:
> 
> /haswell/ makes use of DW DMAC but that wasn't always the case - solution,
> which was first introduced in v3.15-rc1 have had the sst_dma_new() and
> friends (wrappers calling dw_dma_probe()) implemented only since v3.19-rc1.
> So, there was a period in time where both solutions were not using any DMAC
> whatsoever. As stated, in v3.19-rc1 /haswell/ moved to recommended flow
> where DW DMAC gets involved in image loading. The same cannot be said about
> /atom/ -or- /baytrail/ for that matter and that is why I believe MID DMAC
> got removed, eventually.

Yes, I have removed it because it's a copy cat of Synopsys DesignWare. At Intel
at that time Vinod, who was developing that driver, had probably no idea that
he is reinventing the wheel. This theory is supported by (internal)
documentation for Medfield which has no words Synopsys, DesignWare in it.

> Now, one can notice the following when viewing older versions of /haswell/
> e.g.:
> 	https://elixir.bootlin.com/linux/v4.0.9/source/sound/soc/intel/sst-firmware.c#L224
> 
> notice the comment mentioning why sst_dsp_dma_get_channel() is somewhat
> ambiguous:
> 	The Intel MID DMA engine driver needs the slave config set but
> 	Synopsis DMA engine driver safely ignores the slave config
> 
> And thus:
> 	dma_cap_set(DMA_SLAVE, mask);
> is flagged only because of MID DMAC while causing no harm to DW. As MID no
> longer exists, so should DMA_SLAVE flagging. This should answer your
> question from:
> 
> On 2020-08-13 8:51 PM, Andy Shevchenko wrote:
> > On Wed, Aug 12, 2020 at 10:57:42PM +0200, Cezary Rojewski wrote:
> >> Implement dsp lifecycle functions such as core RESET and STALL,
> >> SRAM power control and LP clock selection. This also adds functions for
> >> handling transport over DW DMA controller.
> >
> >> +	dma_cap_set(DMA_SLAVE, mask);
> >
> > How this helps with mem2mem channel?
> >
> 
> In regard to maxburst, (SST_DSP_DMA_MAX_BURST 0x3) this is again mixture of
> MID & DW expectations - MID owns no conversion code, value assigned to
> src_/dst_maxburst is taken directly:
> 
> 	https://elixir.bootlin.com/linux/v4.0.9/source/drivers/dma/intel_mid_dma.c#L495
> vs
> 	https://elixir.bootlin.com/linux/v4.0.9/source/drivers/dma/dw/core.c#L965
> notice convert_burst() (/drivers/dma/dw has seen several improvements and
> code isn't identical in newer kernels but functionality remains the same)

Correct.

> combine that knowledge with:
> 	enum dw_dma_msize {
> 		DW_DMA_MSIZE_1,
> 		DW_DMA_MSIZE_4,
> 		DW_DMA_MSIZE_8,
> 		DW_DMA_MSIZE_16,
> 
> from:
> 	https://elixir.bootlin.com/linux/v4.0.9/source/drivers/dma/dw/regs.h#L135
> 
> and one can safely assume maxburst is mistakenly set for DW - direct enum
> constant is used, ignoring the fact that is it DW code which converts
> provided value behind the scenes to appropriate one. Currently we end up
> with:
> fls(0x3) -> 2;
> 2 - 2 = 0 (conversion method) -> DW_DMA_MSIZE_1
> 
> Conclusion: I believe DW_DMA_MSIZE_16 (0x3) is the correct one i.e.:
> 	src_maxburst = 16;
> 	dst_maxburst = 16;
> should be present within catpt_dma_request_config_chan().

Yes!

> > > Similar situation occurred here. What we're dealing with is: instance of
> > > 'struct platform_device' type, found on bus: acpi with PCI set as a parent
> > > device.
> > > 
> > > Scope found in DSDT:
> > > 	\_SB_.PCI0.ADSP
> > > sysfs device path:
> > > 	/sys/devices/pci0000:00/INT3438:00
> > > Within the latter _no_ standard utility files will be available e.g.:
> > > ability to dump PCI config space, bars and such.
> > 
> > I see. Can you dump DSDT somewhere? We are interested in
> > PSx/PRx/PSE/PSW/PSC/PRE/PRW/ON/OFF (x=0..3) methods.
> > 
> > > I haven't found any functionality to extract "pci_companion" from a
> > > platform_device. What can be made use of is: PCI_D3hot and PCI_D0 enum
> > > constants, as pci_set_power_state() does not apply - expects struct pci_dev
> > > *.
> > > 
> > > Perhaps got misled by the function naming? catpt_updatel_xxx helpers: _xxx
> > > denotes specific ADSP device's mmio space. Almost all cases are covered by
> > > _pci and _shim.
> > 
> > If we really need to use these commands directly, utilize at least definitions
> > from PCI core, e.g. PCI_D0, PCI_D3hot, PCI_PM_CTRL.
> > 
> 
> Kudos to you, Andy, for taking time and debugging ACPI tables from our BDW
> machines.
> Unfortunately explicit _updatel_pci for d3hot/d0 will have to remain as
> there is no other way to cause explicit power_state change for the device.

I see, thanks for checking this.

> Another question though: PCI_PM_CTRL. In order for me to make use of this,
> "pm_cap" member would have to be declared for my device. As this is no
> struct pci_dev, catpt has currently no separate member for that purpose. I
> don't believe you want me to add that field into struct's declaration.
> Second option is to define constant for pm_cap offset aka 0x80 within
> registers.h and then do the operations as follows:
> 	catpt_updatel_pci(cdev, CATPT_PM_CAP + PCI_PM_CTRL, ...)

> However, in such case I won't be able to make use of current version of
> _updatel_pci() as definition of that macro allows me to skip prefix and type
> implicitly - PMCS (the rest is appended automatically).
> Maybe let's leave it within registers.h altogether so I can actually keep
> using said macro?

Basically what you do with accessing PCI configuration space via these methods
(catpt_update_pci(), etc) is something repetitive / similar to what xHCI DbC
support code does. I recommend to spend some time to look for similarities here
(catpt) and there (PCI core, xHCI DbC, etc) and, if we were lucky, derive
common helpers for traverse the capability list in more generalized way.

-- 
With Best Regards,
Andy Shevchenko


