Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F06D160E42
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 10:16:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A83F166E;
	Mon, 17 Feb 2020 10:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A83F166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581930976;
	bh=VNDjlJuK5xVIZ3HqS5Kq7fbgXCVVnzoWriEFtlEsj64=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E07jbvOQ6zxINe7qJ2hlbi+q7WVD21aQhqG3xZw1xNeUAvY8pj76e7eJkIzw0Q+fe
	 gnxHUfVv4pwZ5BuPEPEC6WBDuw09DbAYK/jPvtyCcg8uSKPyR7s5kXssxlsA4zdTVg
	 zHtPtxA2TuytRfTDQ2PrAjwMXNARls7Wr9MMmv7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47A8CF800B6;
	Mon, 17 Feb 2020 10:14:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DCC3F8015E; Mon, 17 Feb 2020 10:14:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E81FF800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 10:14:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E81FF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="EAuUGbIu"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lik8Lr7R"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 23E8158D9;
 Mon, 17 Feb 2020 04:14:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 17 Feb 2020 04:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=I14qqSa44pqibysylqjnJvoStph
 owXN60qAH0HmIOOk=; b=EAuUGbIuhZh0DXzoXVHHztJTrb8eBm2mp9htdM6LVn/
 B4yzXZmGWryVzz9Fw8WCCnvJumnVY1EdR78GNUh9O/S4NzDZzeMieTUCK+KTLW95
 9SXL7yIrbv0MrpjZzRs29MBVa7AAey6KOVjkCrfMeTlGgOe29OomQ5W/3KhfdHEB
 2I5CkHHJpJ+tiQe+1huTRXXvfla2buzQbUWGLEtd0QpruMmX4P4tic+4rr3m9nZR
 uZ9HhmwQuWxJ/wYeKwtRGMLIMSsceuTg/J4y8PryN/u62SBmoP4ldSsAPytMHtuX
 aeXiNViClRaOK4gHgmwfPvbuadUde+HnJEY36xUeGRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=I14qqS
 a44pqibysylqjnJvoStphowXN60qAH0HmIOOk=; b=lik8Lr7RVQqNSV3aPYfoUp
 H90Xt8Fpw3L2KIrMaoRynRmRd9D9C24cDxR8GAusJRkQEwWT2rHg7d+m4wOdyBcu
 AXthhxe+m8akQCKbyUJEdzv2aHGTXaQqxDXR77IqiiC4s0fvzgLT/PtwpMKItwYZ
 h3qtxU10iXxprv/nPOY5AR3ekqWqrWNy86YDf85SGHiO4MK9B+qmW8d3UeSfYPw/
 6xcdTni4SXTveWcYtzegbp3NmNPy5CSl8Q2Vdq+f2x34PWZQ+3IG8eADG9cQU4hs
 G8+ZgJXCvqIhg/DYfdqlGlgIRzv/Tne7gU2+J3Kdswk7PZcIaeA+2OgCtz4YGSrQ
 ==
X-ME-Sender: <xms:cVlKXg51H4uoiVdRpFvbxv5WaiiJHys340EmbcV2izrGll7g2Mp8eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeeigddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cVlKXjjKhtDjlU7U-ryVkWl9vjdPNTrE9gGOjfgHuR5pNC-o8u0TsQ>
 <xmx:cVlKXuITpIJ3ig2bMMiZbsUXKDTNM7wC1G_wEqOrfpQOLSOyqN_IXw>
 <xmx:cVlKXtraCBKH8gXKGfliAISdaG5b0xo3twF3iliEFo1SKbIXb1_DqA>
 <xmx:c1lKXgelgsQq-uTX3XtfZK319DHI1tQY9w1Fd2bvLlqtsutqVCD8oA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 83F823280062;
 Mon, 17 Feb 2020 04:14:25 -0500 (EST)
Date: Mon, 17 Feb 2020 10:14:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Message-ID: <20200217091423.y2muniz3hosquho6@gilmour.lan>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [RFC PATCH 00/34] sun8i-codec fixes and new
	features
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

Hi,

On Mon, Feb 17, 2020 at 12:42:16AM -0600, Samuel Holland wrote:
> The sun8i-codec driver, as used in the Allwinner A33 and A64, currently
> only exposes a small subset of the available hardware features. In order
> to use the A64 in a smartphone (the PinePhone), I've added the necessary
> functionality to the driver:
>   * The full set of supported DAI format options
>   * Support for AIF2 and AIF3
>   * Additional routing knobs
>   * Additional volume controls
>
> Unfortunately, due to preexisting issues with the driver, there are some
> breaking changes, as explained further in the commit messages:
>   * The LRCK inversion issue means we need a new compatible for the A64.
>   * Some controls are named inaccurately, so they are renamed.
>   * Likewise, the DAPM widgets used in device trees were either named
>     wrong, or the device trees were using the wrong widgets in the first
>     place. (Specifically, the links between the analog codec and digital
>     codec happen at the ADC and DAC, not AIF1.)
>
> I tended to take the philosophy of "while I'm breaking things, I might
> as well do them right", so I've probably made a few more changes than
> absolutely necessary. I'm not sure about where all of the policy
> boundaries are, about how far I should go to maintain compatibility. For
> example, for the DT widget usage, I could:
>   * Rename everything and update the DTS files (which is what I did)
>   * Keep the old (misleading/wrong) name for the widgets, but repurpose
>     them to work correctly
>       (i.e. "ADC Left" would be named "AIF1 Slot 0 Left ADC", but it
>        would work just like "ADC Left" does in this patchset)
>   * Keep the old widgets around as a compatibility layer, but add new
>     widgets and update the in-tree DTS files to use them
>       (i.e. "ADC Left" would have a path from "AIF1 Slot 0 Left ADC",
>        but "AIF1 Slot 0 Left ADC" would be a no-op widget)
>   * Something else entirely

I'm not sure this is really a concern here. We need to maintain the
compatibility with old DT's, but those will have an A33 compatible
too, and as far as I can see, you're not changing anything for that
compatible, so we're in the clear?

If not, then the third option would probably be the best, especially
since it's only a couple of them.

Maxime
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
