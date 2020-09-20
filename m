Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D59B271724
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:41:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D324F1683;
	Sun, 20 Sep 2020 20:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D324F1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600627270;
	bh=9hV2ZseyF54OJ6qPVKv71QU22X3EXzHbaE05kN2/M78=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PDx5uCCu2W+ZeChWIAA6RNJSaN1kju4GmVOhJII+2JfIN9Dnq+wCYb01OBrrFZ9Ud
	 JqKQ6SoJy8t+lpP3M7JrVzP4xnr8gllrJlaDXjmAXZBBTdYkLu/qGxb0KY317TnCQA
	 XlFvm2nsnzbsghWe+ptnFuJju7I+qtvVnZ6R0lns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D6F9F80234;
	Sun, 20 Sep 2020 20:39:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A699BF80232; Sun, 20 Sep 2020 20:39:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E45ADF8010A
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E45ADF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="puY2r3Wy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Wcl1lesv"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 734665800A9;
 Sun, 20 Sep 2020 14:39:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 20 Sep 2020 14:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=q
 9LjqQuD0m3VNCG1Acv1s+EmnUPB8l6B4L2HRjljxOk=; b=puY2r3WyE0AASRWz1
 7Z8O4T944qKgLSqFYshvCFEcZMOt9yVQ74nR0wnuc+bij63vaaxknNskJplHezWR
 XlDDeH3M6S+6LFxnNvzdsrZgSYj9lbXFyjZGbpSLBaoFRIQXiHJ+d0bFYtj5EDoL
 eUf90xRO5u9I554o2jlILBOmGTZ1v2HpSqHEjlGH2KMyOOPJEVWcgnNgyQY6uUub
 G5Lfbd4hKrBJ1npCYhvthfanZcq/8Z6LuCj7o3J1/qcvgacByNsuHfnv9PvCH1+w
 u80jMKlbnYAJLyPICVCCyvphok7NJQb3EpYoO1qA4n+TM5V4GV/cScK9x1OmFTep
 hgIKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=q9LjqQuD0m3VNCG1Acv1s+EmnUPB8l6B4L2HRjljx
 Ok=; b=Wcl1lesvyzOoS0zLnn8esyo55xDwPg20NoWI5R4QXylmACuXc9FqLAQIu
 1FVauA2BvZVDQjA4Vb4k+TzP6KR/agSCp/EjDkqopOalACTTLKwXBIv24bK+n+BE
 zR7H/hqBIx3X3YZPqL0AB32moNYz72SutL1uauXKgSQ5HMVM7P1/PygGMIV/3CpJ
 EW1VPN4tlk+hy1GF8yQWHp/HQ2Ut5HQEA1gg7akmSb8BkA/cIEIY+NU9rbowPmcb
 2yplKIg+DOUDKbzakZhi9OVLCOXS+GL9ohCCYm3Y0NPktp2xN2D9wAGmtiIhHliO
 s18AXWwykRC1ElRtKlTJdK3m012Kg==
X-ME-Sender: <xms:1KFnX5xlvtfb9t0EZ3nWFPbecXCytMzgRK-s4fW9m57b6lsa7gGp6Q>
 <xme:1KFnX5SHIScDEEBj1VGrmVHLHSyKB-7Z4vnRYyZcl2CT-dzmZY1jdzBBv1yfr1uYO
 cK_R2U0JyUCrPfK7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtgdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepgfelkeduveejtdejhfeiledvhfeggeeiieeklefhfeefffffffeg
 udetteelieejnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
 nhgurdhorhhg
X-ME-Proxy: <xmx:1KFnXzUK5hQhVCg1flQtNGOikpDVSMzoHtnodlskrZYcmJ2YXdDWzA>
 <xmx:1KFnX7hi3TZbwX9H5dRVEtBAYoTMctT5ST3q60rJ2KFJzyxGqnHyXQ>
 <xmx:1KFnX7Ac2BBwOytnFIfWWOuhDEldc82MqN5fu8DQD78FmUvhH5JqzQ>
 <xmx:1qFnX_7YQ6N9NBehLf8FBnXKKViUqGaz-UqS-80l2uahwWoZ9ZC6wA>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04BA4328005D;
 Sun, 20 Sep 2020 14:39:15 -0400 (EDT)
Subject: Re: [PATCH v3 01/19] ASoC: sun4i-i2s: Add support for H6 I2S
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
 <20200920180758.592217-2-peron.clem@gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <e0eb7e94-e736-4ec0-b838-884a4857bb97@sholland.org>
Date: Sun, 20 Sep 2020 13:39:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200920180758.592217-2-peron.clem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org
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

On 9/20/20 1:07 PM, Clément Péron wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> H6 I2S is very similar to that in H3, except it supports up to 16
> channels.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 218 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 218 insertions(+)
> 
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index f23ff29e7c1d..348057464bed 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
...
> @@ -699,6 +770,102 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
>  	return 0;
>  }
>  
> +static int sun50i_h6_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
> +				     unsigned int fmt)
> +{
> +	u32 mode, val;
> +	u8 offset;
> +
> +	/* DAI clock polarity */
> +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +	case SND_SOC_DAIFMT_IB_IF:
> +		/* Invert both clocks */
> +		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED |
> +		      SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
> +		break;
> +	case SND_SOC_DAIFMT_IB_NF:
> +		/* Invert bit clock */
> +		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED;
> +		break;
> +	case SND_SOC_DAIFMT_NB_IF:
> +		/* Invert frame clock */
> +		val = SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
> +		break;
> +	case SND_SOC_DAIFMT_NB_NF:
> +		val = 0;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

Maxime's testing that showed LRCK inversion was necessary was done on the H6. So
in addition to dropping the patch that removed the LRCK inversion for other
sun8i variants, you need to re-add it to this patch for the H6 variant.

Cheers,
Samuel

> +
> +	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
> +			   SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK |
> +			   SUN8I_I2S_FMT0_BCLK_POLARITY_MASK,
> +			   val);
> +
> +	/* DAI Mode */
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_DSP_A:
> +		mode = SUN8I_I2S_CTRL_MODE_PCM;
> +		offset = 1;
> +		break;
> +
> +	case SND_SOC_DAIFMT_DSP_B:
> +		mode = SUN8I_I2S_CTRL_MODE_PCM;
> +		offset = 0;
> +		break;
> +
> +	case SND_SOC_DAIFMT_I2S:
> +		mode = SUN8I_I2S_CTRL_MODE_LEFT;
> +		offset = 1;
> +		break;
> +
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		mode = SUN8I_I2S_CTRL_MODE_LEFT;
> +		offset = 0;
> +		break;
> +
> +	case SND_SOC_DAIFMT_RIGHT_J:
> +		mode = SUN8I_I2S_CTRL_MODE_RIGHT;
> +		offset = 0;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
> +			   SUN8I_I2S_CTRL_MODE_MASK, mode);
> +	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
> +			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK,
> +			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset));
> +	regmap_update_bits(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_SEL_REG,
> +			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK,
> +			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset));
> +
> +	/* DAI clock master masks */
> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		/* BCLK and LRCLK master */
> +		val = SUN8I_I2S_CTRL_BCLK_OUT |	SUN8I_I2S_CTRL_LRCK_OUT;
> +		break;
> +
> +	case SND_SOC_DAIFMT_CBM_CFM:
> +		/* BCLK and LRCLK slave */
> +		val = 0;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
> +			   SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_OUT,
> +			   val);
> +
> +	return 0;
> +}
> +
>  static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  {
>  	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
...
