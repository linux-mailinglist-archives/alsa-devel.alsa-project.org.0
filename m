Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2025A26C2CE
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 14:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFE07169F;
	Wed, 16 Sep 2020 14:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFE07169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600259861;
	bh=dUpUZqe3rC0sVtDWDaPG2xJyKgaEhAZQeOxcGrqq61I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jZkzcP/8q1O7WKwlL0/RdcajwpViMkO/HcJOgmmz/yjQ5dnnInUp+MI80y/uv6XMf
	 NmgEJDO0C3592f6LE/w8V7YE+/9rjuzM/O/oax6x2JLW40+bA/H4tiUlAnKTwdeWZS
	 83drlAAwhhWkZnns7LTZwsKdMYKJQcNZtct334t8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF36F8015C;
	Wed, 16 Sep 2020 14:35:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CAF0F8015A; Wed, 16 Sep 2020 14:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_21,PRX_BODY_72,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E68EF800BB
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 14:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E68EF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aClGXSR6"
Received: from localhost (unknown [122.172.186.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F338420665;
 Wed, 16 Sep 2020 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600259750;
 bh=dUpUZqe3rC0sVtDWDaPG2xJyKgaEhAZQeOxcGrqq61I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aClGXSR6UsBal59SBWT86GU8nrZzQUWEy+YFXPAHx6RnuJqnIj4OOq7G9hwiTPAVh
 phpz/3aiU+J3+ipNNHH04Nf8BXPocH9FpXlJKfQdH6nw7M6uoFARGm+QxHLMuR2GAA
 Td6e/ltujdkiU7VAnoAPXpsbFUqosKCXR7IwU14s=
Date: Wed, 16 Sep 2020 18:05:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 2/3] soundwire: SDCA: add helper macro to access
 controls
Message-ID: <20200916123545.GK2968@vkoul-mobl>
References: <20200904050244.GT2639@vkoul-mobl>
 <f35a0ae7-2779-0c69-9ef3-0d0e298888ac@linux.intel.com>
 <20200909075555.GK77521@vkoul-mobl>
 <184867c2-9f0c-bffe-2eb7-e9c5735614b0@linux.intel.com>
 <20200910062223.GQ77521@vkoul-mobl>
 <adf51127-2813-cdf0-e5a6-f5ec3b0d33fa@linux.intel.com>
 <20200911070649.GU77521@vkoul-mobl>
 <21606609-8aaf-c7b2-ffaf-c7d37de1fa3f@linux.intel.com>
 <20200914050825.GA2968@vkoul-mobl>
 <11feabb2-dc8b-7acc-6e4d-0903fc435b00@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11feabb2-dc8b-7acc-6e4d-0903fc435b00@linux.intel.com>
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

On 14-09-20, 09:44, Pierre-Louis Bossart wrote:
> > For LSB bits, I dont think this is an issue. I expect it to work, for example:
> > #define CONTROL_LSB_MASK  GENMASK(2, 0)
> >          foo |= u32_encode_bits(control, CONTROL_LSB_MASK);
> > 
> > would mask the control value and program that in specific bitfeild.
> > 
> > But for MSB bits, I am not sure above will work so, you may need to extract
> > the bits and then use, for example:
> > #define CONTROL_MSB_BITS        GENMASK(5, 3)
> > #define CONTROL_MSB_MASK        GENMASK(17, 15)
> > 
> >          control = FIELD_GET(CONTROL_MSB_BITS, control);
> >          foo |= u32_encode_bits(control, CONTROL_MSB_MASK);
> > 
> > > If you have a better suggestion that the FIELD_PREP/FIELD_GET use, I am all
> > > ears. At the end of the day, the mapping is pre-defined and we don't have
> > > any degree of freedom. What I do want is that this macro/inline function is
> > > shared by all codec drivers so that we don't have different interpretations
> > > of how the address is constructed.
> > 
> > Absolutely, this need to be defined here and used by everyone else.
> 
> Compare:
> 
> #define SDCA_CONTROL_MSB_BITS        GENMASK(5, 3)
> #define SDCA_CONTROL_MSB_MASK        GENMASK(17, 15)
> #define SDCA_CONTROL_LSB_MASK        GENMASK(2, 0)
> 
> foo |= u32_encode_bits(control, SDCA_CONTROL_LSB_MASK);
> control = FIELD_GET(SDCA_CONTROL_MSB_BITS, control);
> foo |= u32_encode_bits(control, SDCA_CONTROL_MSB_MASK);
> 
> with the original proposal:
> 
> foo |= FIELD_GET(GENMASK(2, 0), control))	
> foo |= FIELD_PREP(GENMASK(17, 15), FIELD_GET(GENMASK(5, 3), control))	
> 
> it gets worse when the LSB positions don't match, you need another variable
> and an additional mask.
> 
> I don't see how this improves readability? I get that hard-coding magic
> numbers is a bad thing in general, but in this case there are limited
> benefits to the use of additional defines.

I think it would be prudent to define the masks and use them rather than
magic values. Also it makes it future proof

Thanks
-- 
~Vinod
