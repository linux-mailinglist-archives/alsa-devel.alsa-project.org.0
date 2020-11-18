Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9822B7570
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 05:41:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4A9617B8;
	Wed, 18 Nov 2020 05:40:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4A9617B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605674505;
	bh=+CHm74BF78uO3HPRN72IvN6rP3YbJ4s28lWpVu7z/yw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hla+h90ruZSpYOod7zLc4mvqtjxOcBZkkqrdDRIdnQLtSw99pX5jfYx/C6NXFhd5u
	 wPZm/SL+JaMBpEZX8CwhMnO3232/DU1Kdnup/CnH18idrZdti1QWtwIDvIJDxNzJ7U
	 /K7AzpK9y+lmKyRqyQ3tLtnwwftIQcBpawKbT23Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69C34F8016C;
	Wed, 18 Nov 2020 05:40:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 300B2F8016C; Wed, 18 Nov 2020 05:40:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94048F8010A
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 05:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94048F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mLooRjZZ"
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00D18221F1;
 Wed, 18 Nov 2020 04:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605674438;
 bh=+CHm74BF78uO3HPRN72IvN6rP3YbJ4s28lWpVu7z/yw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mLooRjZZoQaFBI+KE27TpfowbvE2lhmiUxRtQFkkDzXRHXhGpdzQo5XMfhNxHxXe9
 0mrwWY/LjOf01eBQfZL3pRtfyAIea4cEplSAAzzVjEEIBQwfzg2GkC4WQTERVSin47
 8NszliRjF3H8vmsy7w0Vb3ZCA5EiZM5OGAdLN6ao=
Date: Wed, 18 Nov 2020 10:10:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Sia, Jee Heng" <jee.heng.sia@intel.com>
Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Message-ID: <20201118044033.GK50232@vkoul-mobl>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
 <20201117155038.GO4077@smile.fi.intel.com>
 <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
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

On 18-11-20, 00:34, Sia, Jee Heng wrote:
> 
> 
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Sent: 17 November 2020 11:51 PM
> > To: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>
> > Cc: alsa-devel@alsa-project.org; tiwai@suse.com; broonie@kernel.org; pierre-
> > louis.bossart@linux.intel.com; Rojewski, Cezary <cezary.rojewski@intel.com>;
> > liam.r.girdwood@linux.intel.com; Sia, Jee Heng <jee.heng.sia@intel.com>;
> > vkoul@kernel.org; lars@metafoo.de
> > Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
> > prepare and submit function
> > 
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

** Please wrap your replies to 80 chars ** I have reflown below


> https://www.intel.com/content/www/us/en/secure/design/confidential/products-and-solutions/processors-and-chipsets/keem-bay/technical-library.html?grouping=EMT_Content%20Type&sort=title:asc

And this link is not accessible freely!

> Pg783, "Programmable transfer length (block length), max 1024".

Okay so block length cant be more than 1024, and IIUC that is 1024 items
and not bytes right

> Sub-list can't exceed 1024 blocks.  BTW, I think the 16bits audio
> could be a confusion because it is not about the number of bits, but
> rather the constraint of the block length.
> Base on my understanding,
> Audio needs a period larger than 10ms, regardless of the bit depth.
> The questions here are:
> 1. Should DMAEngine expose a new API to constraint the block_length
> (instead of size in bytes)?
> 2. Should DMA client re-split the linked-list before passing the
> linked-list to DMAEngine.
> 3. Should DMA controller driver re-split the linked-list before
> execution.

I would go with 3, this is not a fwk issue and can be easily handled in
the dma driver. It knows the limitation on block and can split a period
into multiple blocks and set the interrupt on last block. I do not see
why that will not work

-- 
~Vinod
