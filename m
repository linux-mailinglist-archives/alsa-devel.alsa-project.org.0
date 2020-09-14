Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2492A2683F8
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 07:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77C211685;
	Mon, 14 Sep 2020 07:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77C211685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600060228;
	bh=Y9f9oHcyH6DkphYw0zWNlWuzPp02Ukru9FVhh8BRI8g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lGYyMORzvsHWls6l6JdwV4jM8k1nDeo8CnQpgXo+O+O4sMq5L8jPxkYaitnDbIqIH
	 O+Q2lW5b/OV5Jkcz+r2rIfQs5nL1XT+1HbhHdOAkd+FrqX/glYoChk/VtkKJvFEe7x
	 jU9eUDfc3EEa3eKFFmYpO/YjJM819ym/f2n4Xbtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CC90F80105;
	Mon, 14 Sep 2020 07:08:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 119D7F8015A; Mon, 14 Sep 2020 07:08:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_21,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A70F5F800F1
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 07:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A70F5F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e4iDpbBr"
Received: from localhost (unknown [122.171.195.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 485CA214F1;
 Mon, 14 Sep 2020 05:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600060111;
 bh=Y9f9oHcyH6DkphYw0zWNlWuzPp02Ukru9FVhh8BRI8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e4iDpbBrDOwMWPOB0qj348GDQrkjdDWFfoDvq14aAVhHSsk+syIQTbBjoSwqIBans
 OcNVW0eM3711Gjn5+paiV5NL6Dj5kgiMSj4buLQyyxv/kcTVhT/6RKKTm2QvoeHbPk
 nMTIxZ6IA28GtfTdCeufWnvl/vfU08WdVKq+oCnE=
Date: Mon, 14 Sep 2020 10:38:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 2/3] soundwire: SDCA: add helper macro to access
 controls
Message-ID: <20200914050825.GA2968@vkoul-mobl>
References: <20200901162225.33343-1-pierre-louis.bossart@linux.intel.com>
 <20200901162225.33343-3-pierre-louis.bossart@linux.intel.com>
 <20200904050244.GT2639@vkoul-mobl>
 <f35a0ae7-2779-0c69-9ef3-0d0e298888ac@linux.intel.com>
 <20200909075555.GK77521@vkoul-mobl>
 <184867c2-9f0c-bffe-2eb7-e9c5735614b0@linux.intel.com>
 <20200910062223.GQ77521@vkoul-mobl>
 <adf51127-2813-cdf0-e5a6-f5ec3b0d33fa@linux.intel.com>
 <20200911070649.GU77521@vkoul-mobl>
 <21606609-8aaf-c7b2-ffaf-c7d37de1fa3f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21606609-8aaf-c7b2-ffaf-c7d37de1fa3f@linux.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org,
 open list <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Hi Pierre,

On 11-09-20, 09:50, Pierre-Louis Bossart wrote:
> > > > > > > > > + *	25		0 (Reserved)
> > > > > > > > > + *	24:22		Function Number [2:0]
> > > > > > > > > + *	21		Entity[6]
> > > > > > > > > + *	20:19		Control Selector[5:4]
> > > > > > > > > + *	18		0 (Reserved)
> > > > > > > > > + *	17:15		Control Number[5:3]
> > > > > > > > > + *	14		Next
> > > > > > > > > + *	13		MBQ
> > > > > > > > > + *	12:7		Entity[5:0]
> > > > > > > > > + *	6:3		Control Selector[3:0]
> > > > > > > > > + *	2:0		Control Number[2:0]
> 
> [...]
> 
> > > > > 
> > > > > #define SDCA_CONTROL_DEST_MASK1 GENMASK(20, 19)
> > > > > #define SDCA_CONTROL_ORIG_MASK1 GENMASK(5, 4)
> > > > > #define SDCA_CONTROL_DEST_MASK2 GENMASK(6, 3)
> > > > > #define SDCA_CONTROL_ORIG_MASK2 GENMASK(3, 0)
> > 
> > I think I missed ORIG and DEST stuff, what does this mean here?
> 
> If you missed this, it means my explanations are not good enough and I need
> to make it clearer in the commit log/documentation. Point taken, I'll
> improve this for the next version.
> 
> > Relooking at the bit definition, for example 'Control Number' is defined
> > in both 17:15 as well as 2:0, why is that. Is it split?
> > 
> > How does one program a control number into this?
> 
> A Control Number is represented on 6 bits.
> 
> See the documentation above.
> 
> 	17:15		Control Selector[5:3]
> 	2:0		Control Selector[2:0]
> 
> The 3 MSBs for into bits 17:15 of the address, and the 3 LSBs into bits 2:0
> of the address. The second part is simpler for Control Number but for
> entities and control selectors the LSB positions don't match.
> 
> Yes it's convoluted but it was well-intended: in most cases, there is a
> limited number of entities, control selectors, channel numbers, and putting
> the LSBs together in the 16-LSB of the address helps avoid reprogramming
> paging registers: all the addresses for a given function typically map into
> the same page.
> 
> That said, I am not sure the optimization is that great in the end, because
> we end-up having to play with bits for each address. Fewer changes of the
> paging registers but tons of operations in the core.
> 
> I wasn't around when this mapping was defined, and it is what is is now.
> There's hardware built based on this formula so we have to make it work.
> 
> Does this clarify the usage?

Thanks, that is very helpful. I have overlooked this bit.

For LSB bits, I dont think this is an issue. I expect it to work, for example:
#define CONTROL_LSB_MASK  GENMASK(2, 0)
        foo |= u32_encode_bits(control, CONTROL_LSB_MASK);

would mask the control value and program that in specific bitfeild.

But for MSB bits, I am not sure above will work so, you may need to extract
the bits and then use, for example:
#define CONTROL_MSB_BITS        GENMASK(5, 3)
#define CONTROL_MSB_MASK        GENMASK(17, 15)

        control = FIELD_GET(CONTROL_MSB_BITS, control);
        foo |= u32_encode_bits(control, CONTROL_MSB_MASK);

> If you have a better suggestion that the FIELD_PREP/FIELD_GET use, I am all
> ears. At the end of the day, the mapping is pre-defined and we don't have
> any degree of freedom. What I do want is that this macro/inline function is
> shared by all codec drivers so that we don't have different interpretations
> of how the address is constructed.

Absolutely, this need to be defined here and used by everyone else.

-- 
~Vinod
