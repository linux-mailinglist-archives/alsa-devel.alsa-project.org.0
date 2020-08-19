Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A0024A04E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 15:45:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88E07184F;
	Wed, 19 Aug 2020 15:44:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88E07184F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597844720;
	bh=UKOsAU7318PQeQwZY4X9Zb0Q5Bq7liS2apxQwU2SFQQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S5p5zRhi3NpsCCB42EPthFXwnvLO/5Su/Pc38SsE2VuI+jAAm7svD3aDR6nP5zb7+
	 fkaOL9nR8zkuXMAnE+heLB3qtA94/k+rrmilbIk/T63WVngTDE+rVlX+ezVAerUL53
	 9FPnLREU3906HdBpOAKBR/ifuoTNfX1Jl06BZ2Gg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D6EF80255;
	Wed, 19 Aug 2020 15:43:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 087BFF80218; Wed, 19 Aug 2020 15:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7950AF80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 15:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7950AF80114
IronPort-SDR: BJgMHANVUb+Jv31i+JeY9OkmauYiRrJOPlb83zSmb0/rM4BZXJlcgohtrG2RX2DB6iwDLb6yOw
 0h3PihSTuyPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="134624517"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="134624517"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 06:43:29 -0700
IronPort-SDR: t65+S/eAM4LWUHp+2g4KW02Mxh7w+7xH3KUOABjrKBiR8ctZSbncDS1jgbyoYJ3VwGXzNoZhtP
 SodI+VqOwD7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="327092240"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 19 Aug 2020 06:43:25 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1k8ON9-009svR-8i; Wed, 19 Aug 2020 16:43:23 +0300
Date: Wed, 19 Aug 2020 16:43:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 01/13] ASoC: Intel: Add catpt device
Message-ID: <20200819134323.GM1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-2-cezary.rojewski@intel.com>
 <20200813182908.GA1891694@smile.fi.intel.com>
 <3280b1a6-81f3-9f3f-d496-2bbf570c82d1@intel.com>
 <20200818100743.GH1891694@smile.fi.intel.com>
 <7cd5fa73-797e-17c3-4b7c-7635a18c59af@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cd5fa73-797e-17c3-4b7c-7635a18c59af@intel.com>
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

On Wed, Aug 19, 2020 at 03:26:04PM +0200, Cezary Rojewski wrote:
> On 2020-08-18 12:07 PM, Andy Shevchenko wrote:
> > On Mon, Aug 17, 2020 at 12:02:39PM +0200, Cezary Rojewski wrote:
> > > On 2020-08-13 8:29 PM, Andy Shevchenko wrote:
> > > > On Wed, Aug 12, 2020 at 10:57:41PM +0200, Cezary Rojewski wrote:

...

> And this is a very good approach. Thought device_get_match_data is 'heavier'
> than the devm_kzalloc.

Memory allocation in 90% cases are heavier then the rest (because of page fault
exceptions).

...

> I did some testing today and indeed very simple approach suffices:
> - devm_platform_get_and_ioremap_resource for DSP bar
> - devm_platform_ioremap_resource for PCI bar
> - instead of doing devm_ioremap_resource() separately for dmac in
> catpt_dmac_probe(), just do:
> 
> dmac->regs = cdev->lpe_ba + cdev->spec->host_dma_offset[<engine id>]

Yes, something like this. Basically what you have is particular case of MFD
(see drivers/mfd for other uses).

...

> > > > > +#define CATPT_SSP_SSC0		0x0
> > > > > +#define CATPT_SSP_SSC1		0x4
> > > > > +#define CATPT_SSP_SSS		0x8
> > > > > +#define CATPT_SSP_SSIT		0xC
> > > > > +#define CATPT_SSP_SSD		0x10 and
> > > > > +#define CATPT_SSP_SSTO		0x28
> > > > > +#define CATPT_SSP_SSPSP		0x2C
> > > > > +#define CATPT_SSP_SSTSA		0x30
> > > > > +#define CATPT_SSP_SSRSA		0x34
> > > > > +#define CATPT_SSP_SSTSS		0x38
> > > > > +#define CATPT_SSP_SSC2		0x40
> > > > > +#define CATPT_SSP_SSPSP2	0x44
> > > > 
> > > > Isn't it PXA2xx register set? Can you use their definitions?
> > > 
> > > Could you be more specific? Wasn't able to find anything useful in /include.
> > 
> > include/linux/pxa2xx_ssp.h
> 
> Did some reconnaissance and it while this registers are shared, LPT/WPT are
> equipped with a newer version of said ssp device with some old
> functionalities have been removed too. So the question comes down to: do I
> re-use PXA2XX registers due to historical background (inheritance) -or-
> leave it explicit as is. Honestly, I don't really mind either of these. Got
> surprised by short register names in mentioned header though.

Short names are for historical reasons, but you may change them over the
kernel, if you wish (I think you won't spend time on this).

My vision is to extend that header to cover changes and use it in your code.
It might, though, require some cleanups to be done against pxa2xx_ssp.h.

-- 
With Best Regards,
Andy Shevchenko


