Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C86E6373596
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 09:29:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B4E716A8;
	Wed,  5 May 2021 09:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B4E716A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620199756;
	bh=M3XogPUeo3gWmj1WIuRt5mIUxJ43ZolwkP2VzDByQUs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rx4a5Qwzv1hzg5cg/cQWyQZmmTxZqtCpTO3nm/nxsRNXBbMkPhdQ2vWK6p6/WtpaI
	 h3geJ5rFTYhn5J9reOUNuod+kMaqczjtZ/p4Sgd35XZlZ3cRkmPLxu5nFqBA9rTk9g
	 O03A1un3vv0WT7X2erXsWhC8fz4FJEZZYCgE8c7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A80EF8028D;
	Wed,  5 May 2021 09:27:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 318EBF8028D; Wed,  5 May 2021 09:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD321F80163
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 09:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD321F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="vlyKFO9k"
Received: by mail-wr1-x436.google.com with SMTP id z6so649971wrm.4
 for <alsa-devel@alsa-project.org>; Wed, 05 May 2021 00:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fTqXNGzbTSVFQhK/swTSDs7zLrzEFbUi3UKZNre76o8=;
 b=vlyKFO9kYvefMZA5Qkz8Tu5XHiYtXPkVeInRSA8WcA7XDnC7yZmbMm3U/z5CbbueXl
 g0vT2FhoJIuOV3/vBoZGQtK7KL9UBvI1BE0fJU7vqcQUOCwWb11qYInpstygfpz80IFD
 gU5/yn3ihWOOHfSQdcwV9gIdPRn1r2v8Moi93HSWedg7UJfQVGq8NO+M8WPaDNrcwQCl
 ifPkRyVMPSX6FhnQ5ZB2Dwu6yFh3pt9XsrrbsPR04Ux2eCHvfQq3FlYBDMcw28a3qFKx
 +0q2N2piuwx/S4SkB/YrbKqHegvJ893g8/xTpMUKkpelOYNk7I5N9Amx/MC/YHd+y0Ve
 w6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fTqXNGzbTSVFQhK/swTSDs7zLrzEFbUi3UKZNre76o8=;
 b=ogup+3vyGm+/tWIWRPp5kbTAcPCBUYnz24ShMvQuKcGh2ba9nbElr2hFopRiHeB1dY
 WuY40yRG/ubRela/9YlA4kp/UVrpGEIt1wvVWkPM4hOPrbOHcaztvlcqEmK9dCABwfPt
 535rhQmCL8O3B+/z3AYG27Ntl5AzFfw7mpECpy9m0sxfkaNQw9LfnGkYwfaYtTQFg8PP
 0oUiKHqbMSTeDGct5f4quJs/nPfwtH66LtQQdi8rQUPvZAX5Eiaz4TywH8CubqgW5ciN
 MDIJhwv3E+MBehQJ2qh4ekbjcwv5JSBi9PEuJWtc45jVsfkcJjnhCuJRi52S/NTSEDLM
 fJnQ==
X-Gm-Message-State: AOAM532OKmLDz/s70BKlGUnKV8R7M2d5zjAL3e7Lnx3mH4G709ntdApg
 mRyH/kTPlg/Gp0b5uHUuDlzyMg==
X-Google-Smtp-Source: ABdhPJyFB/lcrtW9M7nGTwjlT0jt5wEmILG38hBgbAYglsIexcgf3R9tDMPnc28EuExwswUNRcp0Sg==
X-Received: by 2002:a5d:6352:: with SMTP id b18mr36652433wrw.76.1620199645180; 
 Wed, 05 May 2021 00:27:25 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6eb3:66ab:cb1e:ef0?
 ([2a01:e0a:90c:e290:6eb3:66ab:cb1e:ef0])
 by smtp.gmail.com with ESMTPSA id h8sm4606700wmq.19.2021.05.05.00.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 00:27:24 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] sound: meson: g12a-toacodec: add support for SM1
 TOACODEC
To: jbrunet@baylibre.com, broonie@kernel.org
References: <20210505072607.3815442-1-narmstrong@baylibre.com>
 <20210505072607.3815442-4-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a2d7df9e-5fb7-0c86-b0b0-2a5cdfab8823@baylibre.com>
Date: Wed, 5 May 2021 09:27:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505072607.3815442-4-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
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

On 05/05/2021 09:26, Neil Armstrong wrote:
> This adds support for the TOACODEC found in Amlogic SM1 SoCs.
> 
> The bits are shifted for more selection of clock sources, so this only
> maps the same support for G12A to the SM1 bits.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 64 ++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 2084c9542c9c..5437ecba9c47 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -21,13 +21,22 @@
>  
>  #define TOACODEC_CTRL0			0x0
>  #define  CTRL0_ENABLE_SHIFT		31
> +#define  CTRL0_DAT_SEL_SM1_MSB		19
> +#define  CTRL0_DAT_SEL_SM1_LSB		18
>  #define  CTRL0_DAT_SEL_MSB		15
>  #define  CTRL0_DAT_SEL_LSB		14
> +#define  CTRL0_LANE_SEL_SM1		16
>  #define  CTRL0_LANE_SEL			12
> +#define  CTRL0_LRCLK_SEL_SM1_MSB	14
> +#define  CTRL0_LRCLK_SEL_SM1_LSB	12
>  #define  CTRL0_LRCLK_SEL_MSB		9
>  #define  CTRL0_LRCLK_SEL_LSB		8
> +#define  CTRL0_LRCLK_INV_SM1		BIT(10)
> +#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
>  #define  CTRL0_BLK_CAP_INV		BIT(7)
> +#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
>  #define  CTRL0_BCLK_O_INV		BIT(6)
> +#define  CTRL0_BCLK_SEL_SM1_MSB		6
>  #define  CTRL0_BCLK_SEL_MSB		5
>  #define  CTRL0_BCLK_SEL_LSB		4
>  #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
> @@ -41,6 +50,7 @@ struct g12a_toacodec {
>  };
>  
>  struct g12a_toacodec_match_data {
> +	const struct snd_soc_component_driver *component_drv;
>  	struct reg_field field_dat_sel;
>  	struct reg_field field_lrclk_sel;
>  	struct reg_field field_bclk_sel;
> @@ -98,11 +108,20 @@ static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
>  			    CTRL0_DAT_SEL_LSB,
>  			    g12a_toacodec_mux_texts);
>  
> +static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
> +			    CTRL0_DAT_SEL_SM1_LSB,
> +			    g12a_toacodec_mux_texts);
> +
>  static const struct snd_kcontrol_new g12a_toacodec_mux =
>  	SOC_DAPM_ENUM_EXT("Source", g12a_toacodec_mux_enum,
>  			  snd_soc_dapm_get_enum_double,
>  			  g12a_toacodec_mux_put_enum);
>  
> +static const struct snd_kcontrol_new sm1_toacodec_mux =
> +	SOC_DAPM_ENUM_EXT("Source", sm1_toacodec_mux_enum,
> +			  snd_soc_dapm_get_enum_double,
> +			  g12a_toacodec_mux_put_enum);
> +
>  static const struct snd_kcontrol_new g12a_toacodec_out_enable =
>  	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
>  				    CTRL0_ENABLE_SHIFT, 1, 0);
> @@ -114,6 +133,13 @@ static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
> +			    &g12a_toacodec_out_enable),
> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -184,6 +210,13 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
>  				       CTRL0_BLK_CAP_INV);
>  }
>  
> +static int sm1_toacodec_component_probe(struct snd_soc_component *c)
> +{
> +	/* Initialize the static clock parameters */
> +	return snd_soc_component_write(c, TOACODEC_CTRL0,
> +				       CTRL0_BLK_CAP_INV_SM1);
> +}
> +
>  static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  	{ "SRC", "I2S A", "IN A Playback" },
>  	{ "SRC", "I2S B", "IN B Playback" },
> @@ -196,6 +229,10 @@ static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
>  };
>  
> +static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
> +};
> +
>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>  	.probe			= g12a_toacodec_component_probe,
>  	.controls		= g12a_toacodec_controls,
> @@ -208,6 +245,18 @@ static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>  	.non_legacy_dai_naming	= 1,
>  };
>  
> +static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
> +	.probe			= sm1_toacodec_component_probe,
> +	.controls		= sm1_toacodec_controls,
> +	.num_controls		= ARRAY_SIZE(sm1_toacodec_controls),
> +	.dapm_widgets		= sm1_toacodec_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(sm1_toacodec_widgets),
> +	.dapm_routes		= g12a_toacodec_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
> +	.endianness		= 1,
> +	.non_legacy_dai_naming	= 1,
> +};
> +
>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
> @@ -215,16 +264,29 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  };
>  
>  static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
> +	.component_drv	= &g12a_toacodec_component_drv,
>  	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_LSB, CTRL0_DAT_SEL_MSB),
>  	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_LSB, CTRL0_LRCLK_SEL_MSB),
>  	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_LSB, CTRL0_BCLK_SEL_MSB),
>  };
>  
> +static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
> +	.component_drv	= &sm1_toacodec_component_drv,
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_SM1_LSB, CTRL0_DAT_SEL_SM1_MSB),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_SM1_LSB,
> +				     CTRL0_LRCLK_SEL_SM1_MSB),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_LSB, CTRL0_BCLK_SEL_SM1_MSB),
> +};
> +
>  static const struct of_device_id g12a_toacodec_of_match[] = {
>  	{
>  		.compatible = "amlogic,g12a-toacodec",
>  		.data = &g12a_toacodec_match_data,
>  	},
> +	{
> +		.compatible = "amlogic,sm1-toacodec",
> +		.data = &sm1_toacodec_match_data,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);
> @@ -278,7 +340,7 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->field_bclk_sel);
>  
>  	return devm_snd_soc_register_component(dev,
> -			&g12a_toacodec_component_drv, g12a_toacodec_dai_drv,
> +			data->component_drv, g12a_toacodec_dai_drv,
>  			ARRAY_SIZE(g12a_toacodec_dai_drv));
>  }
>  
> 

Oops, spurious one, please ignore it.

Neil
