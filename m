Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E21F821AEF6
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 07:47:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A954851;
	Fri, 10 Jul 2020 07:46:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A954851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594360043;
	bh=rFMIeh65KzE1IPenufeyclgSSOJopnMuFH17uOAGCTs=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g9uIErsNI0n+sPs5AsOtBH6idmNncmLxpse7HbEedx75M5L3mXd56032Gyl2Km9/+
	 doQe0HXmM2/bTppTt7WpjMNB0eN5nvdESMNL3i4WU7eCgvv10tu5CY3kSMs4ypgUPq
	 cbYm1/Tqn+2Bllyu1RNfX9DRC2Zkolm6xeHrCgH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E27DF80258;
	Fri, 10 Jul 2020 07:44:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D72BF8015C; Fri, 10 Jul 2020 07:44:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF6C1F80112
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 07:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF6C1F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="FYAxZkLd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PAFB3sOr"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 4E199D63;
 Fri, 10 Jul 2020 01:44:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 10 Jul 2020 01:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:subject:to:cc:references:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=B
 kv1RNfuDFYyvEIc++Gnj9pUqO53KBzD75sd4jhLp6Y=; b=FYAxZkLd0MDjmWqiI
 U1SunbOs6XcWpC3ur+5Rikz2hulUb1pV+jPtZiqXepeBnk/XHyfJej1TF7M9taLL
 cmlQAfEHAiitoy39HJhlwZY5D87XeGe0Bq6F3rNfp796UlaIkdcCXE7Qbg6xiczF
 vVZtPC3LRZPqYeUtHZ+yT2J8dwCQratYhYDu4/szqiNEa/kk+dS+ChE3H5Lp0reC
 0kBG9k16FAkAgzbrNl3/fDvPsc8KYDnJVgQY+9qRHO+95kMq9SCOVd5gl6C767MS
 Sbfxghy0jGf0jUVWJ7iO99lrUIQB2CKQrU+X78XUA6U6WlrZVxa1uS3Gtfxll9AP
 z9yTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=Bkv1RNfuDFYyvEIc++Gnj9pUqO53KBzD75sd4jhLp
 6Y=; b=PAFB3sOrVhErSmUejakZts/M9hCPdzJx8OtEvCi/SfKT7wJAlhaM5R8RV
 S1LYmQlyRx895uuoHh3NuQu9TFmJpoD8RlqRItCVxJQtMgcRiWLTeQ/ad96ZzCDx
 31px+tXYHtnwWeF5VRP+nBFNbmSChhxlUeD7epusxSYLEFy5jCGcjRwcWk1Dp4BP
 uJY4KJO/x7TBOwvZciKZFN6WE2VYWUeHos/jAVro5Py2SNg9l6HC4QOafTxnUQBr
 Aprst6hJzyIj5AnhYpMsX820zPkVmBhoRj6QiQ14Ttcv16WlSFXprZd1QDzMSnOT
 lStrAhY1As5TzpaDoEfMEq3p75CQQ==
X-ME-Sender: <xms:QwAIX-Uyh-qJ-jagCEW6OuCJD21hhdk3ooFJ37BMkHNjQtLtEusX3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvddtgdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhuffvfhfkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeevvdffgedtieehfeeltdekleejvedtvdefueehueeihfdvjefgkeef
 udegjeejtdenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:QwAIX6mFXBxSUevng_EmAIgrV9ylrN51RCB3THWWX3SRnO4ypUKvOw>
 <xmx:QwAIXyYXp_CSleuHIhwwqjjXBwPC_Xr-tDjtutl-12H6QGRQqaHqag>
 <xmx:QwAIX1Vr3CXssyrpUCvVEq1N4pyZdxdb-nyF08KFbBX9PXX_w2Ybhw>
 <xmx:RAAIXydopoa5yry6t4FOFMRnoqlsEeXu2WUuDL-TMy_f3JGMNfy7Tfsxfpg>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 709CA328005A;
 Fri, 10 Jul 2020 01:44:34 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [linux-sunxi] [PATCH 01/16] ASoC: sun4i-i2s: Add support for H6
 I2S
To: peron.clem@gmail.com, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-2-peron.clem@gmail.com>
Message-ID: <72a6fddf-5e84-f050-2eee-74178d457789@sholland.org>
Date: Fri, 10 Jul 2020 00:44:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200704113902.336911-2-peron.clem@gmail.com>
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

On 7/4/20 6:38 AM, Clément Péron wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> H6 I2S is very similar to that in H3, except it supports up to 16
> channels.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 227 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 227 insertions(+)
> 
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index d0a8d5810c0a..9690389cb68e 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -124,6 +124,21 @@
>  #define SUN8I_I2S_RX_CHAN_SEL_REG	0x54
>  #define SUN8I_I2S_RX_CHAN_MAP_REG	0x58
>  
> +/* Defines required for sun50i-h6 support */
> +#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK	GENMASK(21, 20)
> +#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset)	((offset) << 20)
> +#define SUN50I_H6_I2S_TX_CHAN_SEL_MASK		GENMASK(19, 16)
> +#define SUN50I_H6_I2S_TX_CHAN_SEL(chan)		((chan - 1) << 16)
> +#define SUN50I_H6_I2S_TX_CHAN_EN_MASK		GENMASK(15, 0)
> +#define SUN50I_H6_I2S_TX_CHAN_EN(num_chan)	(((1 << num_chan) - 1))
> +
> +#define SUN50I_H6_I2S_TX_CHAN_MAP0_REG	0x44
> +#define SUN50I_H6_I2S_TX_CHAN_MAP1_REG	0x48
> +
> +#define SUN50I_H6_I2S_RX_CHAN_SEL_REG	0x64
> +#define SUN50I_H6_I2S_RX_CHAN_MAP0_REG	0x68
> +#define SUN50I_H6_I2S_RX_CHAN_MAP1_REG	0x6C
> +
>  struct sun4i_i2s;
>  
>  /**
> @@ -466,6 +481,65 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>  	return 0;
>  }
>  
> +static int sun50i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> +				   const struct snd_pcm_hw_params *params)
> +{
> +	unsigned int channels = params_channels(params);
> +	unsigned int slots = channels;
> +	unsigned int lrck_period;
> +
> +	if (i2s->slots)
> +		slots = i2s->slots;
> +
> +	/* Map the channels for playback and capture */
> +	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543210);
> +	regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x76543210);
> +
> +	/* Configure the channels */
> +	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
> +			   SUN50I_H6_I2S_TX_CHAN_SEL_MASK,
> +			   SUN50I_H6_I2S_TX_CHAN_SEL(channels));
> +	regmap_update_bits(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_SEL_REG,
> +			   SUN50I_H6_I2S_TX_CHAN_SEL_MASK,
> +			   SUN50I_H6_I2S_TX_CHAN_SEL(channels));
> +
> +	regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
> +			   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
> +			   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM(channels));
> +	regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
> +			   SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM_MASK,
> +			   SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM(channels));
> +
> +	switch (i2s->format & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_DSP_A:
> +	case SND_SOC_DAIFMT_DSP_B:
> +	case SND_SOC_DAIFMT_LEFT_J:
> +	case SND_SOC_DAIFMT_RIGHT_J:

According to the manual, LEFT_J and RIGHT_J should use the same calculation as
I2S, not the one for PCM/DSP.

> +		lrck_period = params_physical_width(params) * slots;
> +		break;
> +
> +	case SND_SOC_DAIFMT_I2S:
> +		lrck_period = params_physical_width(params);
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (i2s->slot_width)
> +		lrck_period = i2s->slot_width;
> +
> +	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
> +			   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
> +			   SUN8I_I2S_FMT0_LRCK_PERIOD(lrck_period));

From the description in the manual, this looks off by one. The number of BCLKs
per LRCK is LRCK_PERIOD + 1.

> +
> +	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
> +			   SUN50I_H6_I2S_TX_CHAN_EN_MASK,
> +			   SUN50I_H6_I2S_TX_CHAN_EN(channels));
> +
> +	return 0;
> +}
> +
>  static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
>  			       struct snd_pcm_hw_params *params,
>  			       struct snd_soc_dai *dai)
> @@ -691,6 +765,108 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
>  	return 0;
>  }
>  
> +static int sun50i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
> +				  unsigned int fmt)
> +{
> +	u32 mode, val;
> +	u8 offset;
> +
> +	/*
> +	 * DAI clock polarity
> +	 *
> +	 * The setup for LRCK contradicts the datasheet, but under a
> +	 * scope it's clear that the LRCK polarity is reversed
> +	 * compared to the expected polarity on the bus.
> +	 */

This comment makes us sound a lot more confident than I think we actually are.

Regards,
Samuel
