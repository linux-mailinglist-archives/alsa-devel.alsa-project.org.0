Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9A328EB85
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Oct 2020 05:26:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D8561758;
	Thu, 15 Oct 2020 05:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D8561758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602732398;
	bh=PFPHv5elys8/Vn9NxtBP32ks3VqmZLEpyX1CfzMTmto=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rYuMj75xQgcAfLvwAqljtbnV+MHozX+jI7lR2D0sDGcGf2gMDxvLwCCWWPox/7Llb
	 AT3iCMv1pHotqp4hxcnkVY+4wbbp6KeVQdiKjwGo/JJs3kyZAM0vjB5+4Dqv+Lacdc
	 vfjVFTUAIk10Dbr5kUa+SH7nJdfeaYZvembwZHZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3833F801D9;
	Thu, 15 Oct 2020 05:24:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24AB6F801A3; Thu, 15 Oct 2020 05:24:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89B1AF8012A
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 05:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B1AF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="lcopQqEw"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TYdGD2Mp"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F6FA5C012E;
 Wed, 14 Oct 2020 23:24:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 14 Oct 2020 23:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=6
 33k04Ermo1an3mDMSvAtzUHQjTooJ4QgvE/Gm77Mdw=; b=lcopQqEwLo//TiwC2
 HBGQskvfTOo33tXcoX1Q80sueYBOJ/xwmLd5vByJljxcNcbVrWyGFV9gfTYLaAf1
 /hf1DxAQH+3n/KZZtatTcAEXbCtfXR9dSaZp121cU/HhdhB+ToPUsShwz/L+LbA9
 NH2YP+7ImGVp+sXdSBufk5cTXS9Ek9Nw6F+mIoBqDPSpI8ghwyHo69xNaff9nCud
 UV6ZypNPvtbSXe/Y5O74TaEr7hxO7ASWZxO3bIz48+RlLEIle4+nnshRbT+5cL2R
 flPsaE83CCBAgfjwEVShp0uyXyPoisyyeYAvbm1k0HWhzcGcVe/GfVXQAeXmxCnY
 pD3Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=633k04Ermo1an3mDMSvAtzUHQjTooJ4QgvE/Gm77M
 dw=; b=TYdGD2MpRujuQmocMfATYuuiZyGB3P3rmv5PokVe0tF5Up4bYpM0GkZ4S
 5b9ktVsfnffRrbRnzeAMHuPt8hee0hdB5zDPCpNI9u4z5Tb9L77ExYLkUxpbQvDD
 iI+I1gGxusS36Hjd7qnYzHLji/MUoE2UV7AjPektLtYGir3AEnstvS3wA6j3tUkL
 5tueqM7lVfpOTPrQDv2SFqAu3D7XUqAslAuKTeLoMjIV6UNKeQGZrVJirhhWo9Be
 5SQD4QldEYf2b/uEuibmueKfuLgLr7SY/gTTif6Fa7J5hiJHW/semE9GArj/qNAn
 u8hsfyb9TYKKyJxj3An0ydTnM0Kbg==
X-ME-Sender: <xms:9cCHX16awqMqueGRURpMj0UpKoGdahGyBEwfXgEDu-N-kVguQh2ZeA>
 <xme:9cCHXy5KKquC5WjFfKNixUwTTZeLf0fTEC87jHsucAtYs4J1RJwMgALiwVtI8U7NI
 DmgZ-krSzuyQKG_aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedvgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
 gfettdeggeenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:9cCHX8dBbx2I2TqKf7EnyAB4l30lAfPlG_SIXmuPBY3Pq6o-cUo6kA>
 <xmx:9cCHX-I3z_ffI6nhpXbCQhXqz1B8VLoFUVZRo9sPjo44I_EV4WvIFw>
 <xmx:9cCHX5KbC2z8-C8owAmCo1Ts3Ck3QrRe6KBAtP-3WunKhh9k5LfHTQ>
 <xmx:9sCHX-q7kpk8MSrDkfLT30wY7hbWBO9xUOT5OqP5ScbPQSIzV7Cj-g>
Received: from [70.135.148.151]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id B75CC3064680;
 Wed, 14 Oct 2020 23:24:36 -0400 (EDT)
Subject: Re: [PATCH v2 17/17] ASoC: sun8i-codec: Add the AIF3 DAI, widgets,
 and routes
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20201014061941.4306-1-samuel@sholland.org>
 <20201014061941.4306-18-samuel@sholland.org>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <d2d57d02-206e-534b-ca35-afc27e921596@sholland.org>
Date: Wed, 14 Oct 2020 22:24:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201014061941.4306-18-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 10/14/20 1:19 AM, Samuel Holland wrote:
> AIF3 has some differences from AIF1 and AIF2:
>  - It supports one channel only
>  - It supports master mode only
>  - It is not directly connected to any of the mixers; instead all audio
>    goes through a mux with AIF2.
>  - It does not have its own clock dividers; instead it reuses AIF2 BCLK
>    and LRCK. This means that when both AIF2 and AIF3 are active, they
>    must use the same sample rate and total frame width. Since AIF2 and
>    AIF3 are only used for codec2codec DAI links, constraints are not
>    applicable here; the only thing we can do when the rates don't match
>    is report an error.
> 
> Make the necessary adjustments to support this AIF.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  sound/soc/sunxi/sun8i-codec.c | 138 ++++++++++++++++++++++++++++++++--
>  1 file changed, 130 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> index 6a8232e07983..180442c62be1 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
[snip]
> @@ -263,19 +273,30 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  		break;
>  	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
>  		value = 0x0;
>  		break;
>  	default:
>  		return -EINVAL;
>  	}
>  
> -	regmap_update_bits(scodec->regmap, SUN8I_AIF_CLK_CTRL(dai->id),
> -			   BIT(SUN8I_AIF_CLK_CTRL_MSTR_MOD),
> -			   value << SUN8I_AIF_CLK_CTRL_MSTR_MOD);
> +	if (dai->id == SUN8I_CODEC_AIF3) {
> +		/* AIF3 only supports master mode. */
> +		if (value)
> +			return -EINVAL;
> +
> +		/* Use the AIF2 BCLK and LRCK for AIF3. */
> +		regmap_update_bits(scodec->regmap, SUN8I_AIF_CLK_CTRL(dai->id),
> +				   SUN8I_AIF3_CLK_CTRL_AIF3_CLK_SRC_MASK,
> +				   SUN8I_AIF3_CLK_CTRL_AIF3_CLK_SRC_AIF2);

Since the AIF3 clock source is set to AIF2 here...

> +	} else {
> +		regmap_update_bits(scodec->regmap, SUN8I_AIF_CLK_CTRL(dai->id),
> +				   BIT(SUN8I_AIF_CLK_CTRL_MSTR_MOD),
> +				   value << SUN8I_AIF_CLK_CTRL_MSTR_MOD);
> +	}
>  
>  	/* DAI format */
>  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>  	case SND_SOC_DAIFMT_I2S:
>  		format = 0x0;
>  		break;
>  	case SND_SOC_DAIFMT_LEFT_J:
>  		format = 0x1;
[snip]
> @@ -908,16 +1016,22 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
>  	{ "CLK AIF2", NULL, "AIF2CLK" },
>  	{ "CLK AIF2", NULL, "SYSCLK" },
>  	{ "RST AIF2", NULL, "CLK AIF2" },
>  	{ "AIF2 ADCL", NULL, "RST AIF2" },
>  	{ "AIF2 ADCR", NULL, "RST AIF2" },
>  	{ "AIF2 DACL", NULL, "RST AIF2" },
>  	{ "AIF2 DACR", NULL, "RST AIF2" },
>  
> +	{ "CLK AIF3", NULL, "AIF1CLK" },
                             ^^^^^^^
...this should be "AIF2CLK". I will fix it in the next version.

> +	{ "CLK AIF3", NULL, "SYSCLK" },
> +	{ "RST AIF3", NULL, "CLK AIF3" },
> +	{ "AIF3 ADC", NULL, "RST AIF3" },
> +	{ "AIF3 DAC", NULL, "RST AIF3" },
> +
>  	{ "CLK ADC", NULL, "SYSCLK" },
>  	{ "RST ADC", NULL, "CLK ADC" },
>  	{ "ADC", NULL, "RST ADC" },
>  	{ "ADCL", NULL, "ADC" },
>  	{ "ADCR", NULL, "ADC" },
>  
>  	{ "CLK DAC", NULL, "SYSCLK" },
>  	{ "RST DAC", NULL, "CLK DAC" },
