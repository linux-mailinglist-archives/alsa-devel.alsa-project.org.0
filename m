Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8152B7FC5
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 15:51:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 364601743;
	Wed, 18 Nov 2020 15:51:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 364601743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605711112;
	bh=t5Yb8GXKBp5Novug9qgpjb6TCuxv3XCBSRaynX4wsBw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VbuOdXpsjVKpdG4FMqCU1IoB71BxjNrty+Wjh2Fdan6IKbzDe+kn6gbWvsKhH5DcL
	 QXIRaQiX9fmYqtQg7uqK7/t1yK/GvUfWdH56cee4RY4ivdqz9hT5VnLRNWKHB7peqF
	 h9ISaIRwuxMA+Ahmil9fImkHWgyv5x2IN8ZmQpYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92768F800EE;
	Wed, 18 Nov 2020 15:50:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9494CF8016C; Wed, 18 Nov 2020 15:50:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65, RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BF7DF800EE
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 15:50:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF7DF800EE
IronPort-SDR: i8qGCnQ5lUuy+kyeDpNHzQlKOzRPvmRw2wHdMs5sR1xW6CKKYuPzVZUyWQSI1BFVrDjlAOcMnO
 lzGCG4UlUMQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="232738392"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="232738392"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 06:49:56 -0800
IronPort-SDR: SD4LQtA8OwebcGCwYTPIB3u3wWS4Dux0HJLhb+YT1P00Hoyfi4yJXPCHMboxXDX4H5EAHGe4bb
 T7vBshafw1YA==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="368356571"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 06:49:53 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1kfOnP-007eko-Eq; Wed, 18 Nov 2020 16:50:55 +0200
Date: Wed, 18 Nov 2020 16:50:55 +0200
From: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
To: "Sia, Jee Heng" <jee.heng.sia@intel.com>
Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Message-ID: <20201118145055.GW4077@smile.fi.intel.com>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
 <20201117155038.GO4077@smile.fi.intel.com>
 <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>
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

On Wed, Nov 18, 2020 at 02:34:22AM +0200, Sia, Jee Heng wrote:
> > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Sent: 17 November 2020 11:51 PM
> > On Tue, Nov 17, 2020 at 04:03:48PM +0800, Michael Sit Wei Hong wrote:
> > > Enabling custom prepare and submit function to overcome DMA limitation.
> > >
> > > In the Intel KeemBay solution, the DW AXI-based DMA has a limitation
> > > on the number of DMA blocks per transfer. In the case of 16 bit audio
> > > ASoC would allocate blocks exceeding the DMA block limitation.
> >
> > I'm still not sure the hardware has such a limitation.
> >
> > The Synopsys IP supports linked list (LLI) transfers and I hardly can imagine the
> > list has any limitation. Even though, one can always emulate LLI in software how
> > it's done in the DesignWare AHB DMA driver.
> >
> > I have briefly read chapter 4.6 "AXI_DMA" of Keem Bay TRM and didn't find any
> > errata or limits like this.
> [>>] Intel KeemBay datasheet can be found at below link:
> https://www.intel.com/content/www/us/en/secure/design/confidential/products-and-solutions/processors-and-chipsets/keem-bay/technical-library.html?grouping=EMT_Content%20Type&sort=title:asc
> Pg783, "Programmable transfer length (block length), max 1024". Sub-list can't exceed 1024 blocks.
> BTW, I think the 16bits audio could be a confusion because it is not about the number of bits, but rather the constraint of the block length. Base on my understanding, Audio needs a period larger than 10ms, regardless of the bit depth.
> The questions here are:
> 1. Should DMAEngine expose a new API to constraint the block_length (instead of size in bytes)?
> 2. Should DMA client re-split the linked-list before passing the linked-list to DMAEngine.
> 3. Should DMA controller driver re-split the linked-list before execution.

Since we have DMA slave capabilities, the consumer may ask for them and prepare
the SG list accordingly.

Above limitation is a block size (value of 1023 is a maximum, meaning 1024
maximum items in the block of given transfer width). So, like DesignWare DMA
(AHB) has up to 4095 (but I saw hardware with 2047) or iDMA 32- and 64-bit have
131071. There is no limitation for amount of blocks of given maximum length in
the LLI!

No hacks are needed, really.

-- 
With Best Regards,
Andy Shevchenko


