Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C799A52E0A5
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 01:41:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57E3317DA;
	Fri, 20 May 2022 01:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57E3317DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653003687;
	bh=F3R7SHU5I/fRFuWbHQrfCPKXdQpCrEQrpoFAT/78KDM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NfyCgWb74XG3Dg4MybBwK7W91SQIUSIxuSV5+hPzijcQrLKnhYXXN1/vDTxsVmJGS
	 wVgPZoXvdkIJWJwXKyYJe44TMDGk9L4P9nxac8tfN4FmsLmVO9X4ix6XjFaa9A5lmA
	 U91A7kkWEHQuaRtY5uj+JdE4RdvCOQCWt/EsTtkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5359F800D1;
	Fri, 20 May 2022 01:40:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED5BAF8025D; Fri, 20 May 2022 01:40:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01187F800D1
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 01:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01187F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="vWvrghW/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kpRbno/G"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 568E05C023E;
 Thu, 19 May 2022 19:40:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 19 May 2022 19:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1653003615; x=
 1653090015; bh=iqHByxP/PP0RV5Kp27EEtrVjbBff5eU8E6iDfYSzvlo=; b=v
 WvrghW/tnB2wQQZ7H1BtAjOy1RhwPLZpgzo98sCQvJhYWwor/HzjJNsV/LVOFbsE
 YSiG6I57bor0I2nDEC6ZNocpWKkv71xzTjDYt6ZfZ8NcTOw4uLTbONYN6bKYH0PY
 ZXLXErKuqY/OVSt1aiUR4bNuR2iEWFiDRXePo8UJrjuv+NMyWc7SgXvTTXZClSjS
 xX/9GfMLAZ8ZS2t+SmXFzd5bG9/XZqH4LhunRvn1mAKETHqh9PDqXC25nNdQWczb
 Ozc+ESgOxLy8gZ1sJC+Wq7Am0HXvT/m2QJQsf+liwgR8ULL+hRLTOVRO4mvNvxjd
 KHsL6W3LPExCEUM/TygiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653003615; x=
 1653090015; bh=iqHByxP/PP0RV5Kp27EEtrVjbBff5eU8E6iDfYSzvlo=; b=k
 pRbno/Gt6gUXFzSSorr0j6sxajaPEN+rwHFd8+jcnA6Sce0eyMe1DAfgUIuR5rln
 yyI3d7qfzMsS8JltiVQrFJi7K/ZoDyKheaneInXoIGCdVSulwqOTjJorhLCu2Gw7
 IoRXmbGJ3trZhAv+ZBVHrxN0gMC5BalsJ/SKUO/9f+9Ut6HKvwFdvvQ8z8xsuHUk
 fxcCGXOOf/BbfqT8Y8VSjsuEJ6GBj8XDHJJ8IRfvpiEixjiRTsOTlez4NEgoU/2g
 W4aJu6F/kQHejyjCH6arZw/g+aNM+9HBFIdRKkeEFQw/69yhZyT9EcMBkfbZV9md
 9NuahsBfHX2ficK+iYbDQ==
X-ME-Sender: <xms:XdWGYgUGUf75UPVgls83XPWiF6A-tBj4e3s97Kb34YKu5oXO3A13_Q>
 <xme:XdWGYkkqej7Sw873SF-tPbdbpAwSLvqaubcCTMpPfIOnD1JzRCeaEf8RmHncNciRB
 jroNjyXsoqZ4PKpkg>
X-ME-Received: <xmr:XdWGYkbvrZwpUnOM1O4-_2tYjgJTQpjZPqXkpDEw0EpgcjUMjLmwhmRAdevmUe4wB8Y-f3nIrmriP-19jvjm7O0yy8ouh7KCEVebaavF9pBHI4yR_-4r_4bKXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedriedvgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepffdtveekvdegkeeuueetgfetffeileevudekuefhheelvdfhiedt
 heduhfduhefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:XdWGYvUwc4jVKeqPla_0-WQCIkx0RnvqDhfHPs1ZzAd8QctkVgY8fQ>
 <xmx:XdWGYqm6J2stCQX-STAMuroIUM4y_rHHyhG_yTajyWgKhMRCq9JK7Q>
 <xmx:XdWGYkfsUHQ4XlJCEJ_vR0OyzJAV_JKQMFS6xef23lbxi7aCuM1zAg>
 <xmx:X9WGYo3IuYUdLigJsZOLgqfeufUYTAN7skI0dQ2vQGpXXTD2m7p_Gw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 May 2022 19:40:12 -0400 (EDT)
Subject: Re: [PATCH 22/56] ASoC: sunxi: Update to use set_fmt_new callback
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-23-ckeepax@opensource.cirrus.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <948d5418-44ca-2e60-0c1c-0b16f315feba@sholland.org>
Date: Thu, 19 May 2022 18:40:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220519154318.2153729-23-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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

On 5/19/22 10:42 AM, Charles Keepax wrote:
> As part of updating the core to directly tell drivers if they are clock
> provider or consumer update these CPU side drivers to use the new direct
> callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c   | 20 ++++++++++----------
>  sound/soc/sunxi/sun8i-codec.c |  8 ++++----
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 7047f71629ab3..872838d3e0a94 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -702,13 +702,13 @@ static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
>  			   SUN4I_I2S_FMT0_FMT_MASK, val);
>  
>  	/* DAI clock master masks */
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* BCLK and LRCLK master */
>  		val = SUN4I_I2S_CTRL_MODE_MASTER;
>  		break;
>  
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* BCLK and LRCLK slave */
>  		val = SUN4I_I2S_CTRL_MODE_SLAVE;
>  		break;
> @@ -802,13 +802,13 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
>  			   SUN8I_I2S_TX_CHAN_OFFSET(offset));
>  
>  	/* DAI clock master masks */
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* BCLK and LRCLK master */
>  		val = SUN8I_I2S_CTRL_BCLK_OUT |	SUN8I_I2S_CTRL_LRCK_OUT;
>  		break;
>  
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* BCLK and LRCLK slave */
>  		val = 0;
>  		break;
> @@ -909,13 +909,13 @@ static int sun50i_h6_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
>  			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset));
>  
>  	/* DAI clock master masks */
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* BCLK and LRCLK master */
>  		val = SUN8I_I2S_CTRL_BCLK_OUT |	SUN8I_I2S_CTRL_LRCK_OUT;
>  		break;
>  
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* BCLK and LRCLK slave */
>  		val = 0;
>  		break;
> @@ -1081,7 +1081,7 @@ static int sun4i_i2s_set_tdm_slot(struct snd_soc_dai *dai,
>  
>  static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
>  	.hw_params	= sun4i_i2s_hw_params,
> -	.set_fmt	= sun4i_i2s_set_fmt,
> +	.set_fmt_new	= sun4i_i2s_set_fmt,
>  	.set_sysclk	= sun4i_i2s_set_sysclk,
>  	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
>  	.trigger	= sun4i_i2s_trigger,
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> index 0bea2162f68d9..6e9ef948d6621 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
> @@ -286,11 +286,11 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	u32 dsp_format, format, invert, value;
>  
>  	/* clock masters */
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP: /* Codec slave, DAI master */

This is a codec driver, and it is only ever used on the codec end of a link, so
I would not expect it to be changed.

Regards,
Samuel

>  		value = 0x1;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
> +	case SND_SOC_DAIFMT_BC_FC: /* Codec Master, DAI slave */
>  		value = 0x0;
>  		break;
>  	default:
> @@ -630,7 +630,7 @@ static int sun8i_codec_hw_free(struct snd_pcm_substream *substream,
>  }
>  
>  static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
> -	.set_fmt	= sun8i_codec_set_fmt,
> +	.set_fmt_new	= sun8i_codec_set_fmt,
>  	.set_tdm_slot	= sun8i_codec_set_tdm_slot,
>  	.startup	= sun8i_codec_startup,
>  	.hw_params	= sun8i_codec_hw_params,
> 

