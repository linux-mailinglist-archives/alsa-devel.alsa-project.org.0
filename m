Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EEE376151
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 09:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630571698;
	Fri,  7 May 2021 09:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630571698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620373237;
	bh=9NSJbv3AKNTMKXT17FVzjPuIQ1pGAFF6QCAZUTS/8os=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EntTwldo39x0tiaZUc1uBwAr1d8u89TMytACK7qvJ0ZNwyB0CzsYhsY2iYBGgNXmf
	 kpr3u5FAS/pIWUpaCyzvBmXoGXaPiT1o6I4Sh2i/UFsBLwHBnr+mH2P43UZO0Kyqnb
	 wXTHiH/CIjk1XosfmEBB+6tfCUiuboWRjhoTksJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF3BFF80108;
	Fri,  7 May 2021 09:39:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E8F3F8025F; Fri,  7 May 2021 09:39:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A4EBF8010B
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 09:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A4EBF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="z+XBo5R6"
Received: by mail-ed1-x52f.google.com with SMTP id y26so9088854eds.4
 for <alsa-devel@alsa-project.org>; Fri, 07 May 2021 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=FVGhI0piG/ZT4z3Zm+F7e5QmKPHr5hT6fO27OeIGutE=;
 b=z+XBo5R6JvT8Y/3Vvp7a8IhFg5DOTNiOhZHUOfwNW9F9cvzxk9e0JfqlXSNTMVs4iS
 ijaqMc/rM87W50WuKQS9+5xQvvqJymy9S94wGVw43B3hp/zogfm9SUDw/9fiq12EpX4K
 l5WEsUo5LwRC9awZm8SMSMiPwxj/YDUSepflwnOGZGi30uBuEBfkJmcz8zIZ+1hF+zdU
 Fb4YWgcpA4T6fi48UadwBMhnCVi1cIHHOXRBuuxRTFOCV2vgoC6HwCF0QH0wsAPC/XCX
 p+lHNmqpLAzaEBDFDzE80+MU+iY7/xXHlOFIlS1qnZizA5qJSRT3ynHacFWCgqIlNvue
 kN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=FVGhI0piG/ZT4z3Zm+F7e5QmKPHr5hT6fO27OeIGutE=;
 b=IuiYzuzCViNgfVkqLaz5NpZwYLH947fzL/vKvO8XJ3rmqZ8tqxpjXh+7A7ZFQe+XWA
 TQv792dP8Mw8j1BfCAAWam4dHEUTioUlQ5PwY6T8AVkBp9oT0JYUDh9KZM2sR+XwtgIF
 ip/k3DArLK6ND2G8ZZ9Oql7ifvuSwx7imqIQ5Vb+c/BOwmLMB5GYuwZxiZ7Xa+10gURc
 hPO2xZYbYUr1Ngp5xJOR4M/mvO+9C4IoLN4RGc1/ksv3jpBan/Zft9Z6Gorwu8RzO4Qu
 m/YXNZGdMmbqsZMFqwQST6MafcvW7tROUaniA2S62M3zCHhZEa6lfrLfhKqZrm8fvn3s
 OR1w==
X-Gm-Message-State: AOAM532Fm82awVPK/hR2ebjxncwzCrGMKTjZYLHSZnUExjH2IJvoscBy
 wjSQuyfEc6CK93lNrtiM7J/dqg==
X-Google-Smtp-Source: ABdhPJwE+ezx2yC0r4CH7hMLFtjAihL3CrKtolxdfolsVVIOXdRsuDjuDzxRm1PvXc020O7Vl7sSTA==
X-Received: by 2002:a05:6402:268f:: with SMTP id
 w15mr9534035edd.321.1620373134041; 
 Fri, 07 May 2021 00:38:54 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id b12sm3549997eds.23.2021.05.07.00.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 00:38:53 -0700 (PDT)
References: <20210505072607.3815442-1-narmstrong@baylibre.com>
 <20210505072607.3815442-4-narmstrong@baylibre.com>
 <a2d7df9e-5fb7-0c86-b0b0-2a5cdfab8823@baylibre.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org
Subject: Re: [PATCH v2 2/2] sound: meson: g12a-toacodec: add support for SM1
 TOACODEC
In-reply-to: <a2d7df9e-5fb7-0c86-b0b0-2a5cdfab8823@baylibre.com>
Message-ID: <1jlf8rngc3.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 07 May 2021 09:38:52 +0200
MIME-Version: 1.0
Content-Type: text/plain
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


On Wed 05 May 2021 at 09:27, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 05/05/2021 09:26, Neil Armstrong wrote:
>> This adds support for the TOACODEC found in Amlogic SM1 SoCs.
>> 
>> The bits are shifted for more selection of clock sources, so this only
>> maps the same support for G12A to the SM1 bits.
>> 
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  sound/soc/meson/g12a-toacodec.c | 64 ++++++++++++++++++++++++++++++++-
>>  1 file changed, 63 insertions(+), 1 deletion(-)
>> 
>> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
>> index 2084c9542c9c..5437ecba9c47 100644
>> --- a/sound/soc/meson/g12a-toacodec.c
>> +++ b/sound/soc/meson/g12a-toacodec.c
>> @@ -21,13 +21,22 @@
>>  
>>  #define TOACODEC_CTRL0			0x0
>>  #define  CTRL0_ENABLE_SHIFT		31
>> +#define  CTRL0_DAT_SEL_SM1_MSB		19
>> +#define  CTRL0_DAT_SEL_SM1_LSB		18
>>  #define  CTRL0_DAT_SEL_MSB		15
>>  #define  CTRL0_DAT_SEL_LSB		14
>> +#define  CTRL0_LANE_SEL_SM1		16
>>  #define  CTRL0_LANE_SEL			12
>> +#define  CTRL0_LRCLK_SEL_SM1_MSB	14
>> +#define  CTRL0_LRCLK_SEL_SM1_LSB	12
>>  #define  CTRL0_LRCLK_SEL_MSB		9
>>  #define  CTRL0_LRCLK_SEL_LSB		8
>> +#define  CTRL0_LRCLK_INV_SM1		BIT(10)
>> +#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
>>  #define  CTRL0_BLK_CAP_INV		BIT(7)
>> +#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
>>  #define  CTRL0_BCLK_O_INV		BIT(6)
>> +#define  CTRL0_BCLK_SEL_SM1_MSB		6
>>  #define  CTRL0_BCLK_SEL_MSB		5
>>  #define  CTRL0_BCLK_SEL_LSB		4
>>  #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
>> @@ -41,6 +50,7 @@ struct g12a_toacodec {
>>  };
>>  
>>  struct g12a_toacodec_match_data {
>> +	const struct snd_soc_component_driver *component_drv;
>>  	struct reg_field field_dat_sel;
>>  	struct reg_field field_lrclk_sel;
>>  	struct reg_field field_bclk_sel;
>> @@ -98,11 +108,20 @@ static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
>>  			    CTRL0_DAT_SEL_LSB,
>>  			    g12a_toacodec_mux_texts);
>>  
>> +static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
>> +			    CTRL0_DAT_SEL_SM1_LSB,
>> +			    g12a_toacodec_mux_texts);
>> +
>>  static const struct snd_kcontrol_new g12a_toacodec_mux =
>>  	SOC_DAPM_ENUM_EXT("Source", g12a_toacodec_mux_enum,
>>  			  snd_soc_dapm_get_enum_double,
>>  			  g12a_toacodec_mux_put_enum);
>>  
>> +static const struct snd_kcontrol_new sm1_toacodec_mux =
>> +	SOC_DAPM_ENUM_EXT("Source", sm1_toacodec_mux_enum,
>> +			  snd_soc_dapm_get_enum_double,
>> +			  g12a_toacodec_mux_put_enum);
>> +
>>  static const struct snd_kcontrol_new g12a_toacodec_out_enable =
>>  	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
>>  				    CTRL0_ENABLE_SHIFT, 1, 0);
>> @@ -114,6 +133,13 @@ static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
>>  			    &g12a_toacodec_out_enable),
>>  };
>>  
>> +static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
>> +			 &sm1_toacodec_mux),
>> +	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
>> +			    &g12a_toacodec_out_enable),
>> +};
>> +
>>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>>  					 struct snd_pcm_hw_params *params,
>>  					 struct snd_soc_dai *dai)
>> @@ -184,6 +210,13 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
>>  				       CTRL0_BLK_CAP_INV);
>>  }
>>  
>> +static int sm1_toacodec_component_probe(struct snd_soc_component *c)
>> +{
>> +	/* Initialize the static clock parameters */
>> +	return snd_soc_component_write(c, TOACODEC_CTRL0,
>> +				       CTRL0_BLK_CAP_INV_SM1);
>> +}
>> +
>>  static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>>  	{ "SRC", "I2S A", "IN A Playback" },
>>  	{ "SRC", "I2S B", "IN B Playback" },
>> @@ -196,6 +229,10 @@ static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
>>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
>>  };
>>  
>> +static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
>> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
>> +};
>> +
>>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>>  	.probe			= g12a_toacodec_component_probe,
>>  	.controls		= g12a_toacodec_controls,
>> @@ -208,6 +245,18 @@ static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>>  	.non_legacy_dai_naming	= 1,
>>  };
>>  
>> +static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
>> +	.probe			= sm1_toacodec_component_probe,
>> +	.controls		= sm1_toacodec_controls,
>> +	.num_controls		= ARRAY_SIZE(sm1_toacodec_controls),
>> +	.dapm_widgets		= sm1_toacodec_widgets,
>> +	.num_dapm_widgets	= ARRAY_SIZE(sm1_toacodec_widgets),
>> +	.dapm_routes		= g12a_toacodec_routes,
>> +	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
>> +	.endianness		= 1,
>> +	.non_legacy_dai_naming	= 1,
>> +};
>> +
>>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>>  	.reg_bits	= 32,
>>  	.val_bits	= 32,
>> @@ -215,16 +264,29 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
>>  };
>>  
>>  static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
>> +	.component_drv	= &g12a_toacodec_component_drv,
>>  	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_LSB, CTRL0_DAT_SEL_MSB),
>>  	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_LSB, CTRL0_LRCLK_SEL_MSB),
>>  	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_LSB, CTRL0_BCLK_SEL_MSB),
>>  };
>>  
>> +static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
>> +	.component_drv	= &sm1_toacodec_component_drv,
>> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_SM1_LSB, CTRL0_DAT_SEL_SM1_MSB),
>> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_SM1_LSB,
>> +				     CTRL0_LRCLK_SEL_SM1_MSB),
>> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_LSB, CTRL0_BCLK_SEL_SM1_MSB),
>> +};

If you make another round, the LSB/MSB defines don't really help
readability here (and in the other patch)

Feel free to put the values directly.

>> +
>>  static const struct of_device_id g12a_toacodec_of_match[] = {
>>  	{
>>  		.compatible = "amlogic,g12a-toacodec",
>>  		.data = &g12a_toacodec_match_data,
>>  	},
>> +	{
>> +		.compatible = "amlogic,sm1-toacodec",
>> +		.data = &sm1_toacodec_match_data,
>> +	},
>>  	{}
>>  };
>>  MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);
>> @@ -278,7 +340,7 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
>>  		return PTR_ERR(priv->field_bclk_sel);
>>  
>>  	return devm_snd_soc_register_component(dev,
>> -			&g12a_toacodec_component_drv, g12a_toacodec_dai_drv,
>> +			data->component_drv, g12a_toacodec_dai_drv,
>>  			ARRAY_SIZE(g12a_toacodec_dai_drv));
>>  }
>>  
>> 
>
> Oops, spurious one, please ignore it.
>
> Neil

