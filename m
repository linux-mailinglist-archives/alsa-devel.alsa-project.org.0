Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 711CF905A86
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 20:16:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 098A3DF8;
	Wed, 12 Jun 2024 20:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 098A3DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718216166;
	bh=xiWH756fmXpz8dkWhjOmyz0/S9uN/nhk/v2hE+f3UBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RLnUVx+hz1DkjJrj1QhVsh9ohGd8+dEmzg1yaSB6lVMJfO2NY1KzSJdutQisBHRLV
	 gDQMK+ecg6XDwjdaUpxqtcGwMf8mOfC+AGtF2Ql8GPaW75j0Ci8pisLNnqwo+r+KK2
	 XeY/fCr2jHKNW8GSHF80tHqvZ0fyUYzeFvqJLxYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10F1DF805B0; Wed, 12 Jun 2024 20:15:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 599CDF805B3;
	Wed, 12 Jun 2024 20:15:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FC89F8057A; Wed, 12 Jun 2024 20:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57335F80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 20:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57335F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=srkDtzJa
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52bbdc237f0so245307e87.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 11:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718216124; x=1718820924;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mraezCEzi7HPYzzdi4zkA3wSgYn7YV5wl4ixiQZdTak=;
        b=srkDtzJa3HYOcRssJYyrsm6l1oKTaIJxNr+lDX07Ome245Di8dfiz56RovPguP8Owg
         D3euDDWaFT8i2HKUXf5exH3xM1ReRm7SG4kmTwDSLiXic77HtyeW6jBDeCqlagTojxs6
         i3MWe/LvijQpj1B0+geZkCOcmL9MiNE5FOcGZMbZVaZWRUDew8/qDBfzNRJgkPM/m9lR
         QXqIs2PGUGlsXwXkOqrX9dGIpe5HueXRY7DXRC9q38djTn8U3w4zyl0wbD/qzV/+YdMF
         akysiEG72mdgBy3BdlJeYSIRIOs6cIxjCdRw8iIqfSQkpM+jcUA6TALCuLbv9ct+jtab
         OuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718216124; x=1718820924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mraezCEzi7HPYzzdi4zkA3wSgYn7YV5wl4ixiQZdTak=;
        b=eXsyM564hrEUFHVMy1dtCflJErjTNFuLGdEjFR8vmJ6xujK7eH4z1sWNiGC2W/ptZF
         YaHvIdJriCFtiga5zvalNR8pkxJ47vpoKL5fWfrB+v//u1eS1oaJH9xFxqVh5xNrwDYa
         y5AEt3VboZqKNfPvv0pmDyfXL3yNP+EUrDTJ9JQwyeQetj0ne2QmTQlNp8CRtAiS46AO
         7hrvC4XqOtTah0yaZMqLjbuXeleof0hY62SFne4CptBj+CA66VNiiLXbyeCLqi04qHxf
         tkG8Qf/8CnqW95qteoBV9O5KiS0Hc0PTLU8fcm9S01Im3B7yYcKFgof4svhKltPr10ob
         3SlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5pzH1sia9w4QKKmzMF9yRDAcp7m9Ytm+jElOsxY+plTyWPIB2JVDVSQkojObZ4OP+YVPJbxDJb1lpTtzH7/58puLxpTeqF9xFsZQ=
X-Gm-Message-State: AOJu0YzHK1SO7QRZe1+1CZqWixog0igMOstO9kDdb/QWiOsKbJ7PI9Y2
	r7q8hW27fv0YhEvKIcbwAg1YhnPi8fJnb9Rm6otisoeb+PffEj10dv5b8RJV6Z4=
X-Google-Smtp-Source: 
 AGHT+IFSBNLRqXQ9ycHtcrkpAwckrL3o8yPmK68fpMaDQWCd4BwUD6ZjT6xvrWnTk6ysDRpq/EKUEA==
X-Received: by 2002:a05:6512:239f:b0:52c:93f4:390 with SMTP id
 2adb3069b0e04-52c9a3b8d57mr2685629e87.4.1718216123471;
        Wed, 12 Jun 2024 11:15:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c1e056c05sm2050458e87.80.2024.06.12.11.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 11:15:23 -0700 (PDT)
Date: Wed, 12 Jun 2024 21:15:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Banajit Goswami <bgoswami@quicinc.com>, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 1/3] ASoC: codecs: lpass-macro: add helpers to get
 codec version
Message-ID: <jowqhnspiai4ydp7m7mn3p654kufg4ufbm2iexjg5dqbcxqatu@jfex2rnes5vu>
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
 <20240612-lpass-codec-v25-v1-1-9f40611a1370@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-lpass-codec-v25-v1-1-9f40611a1370@linaro.org>
Message-ID-Hash: NWKHCZABKHOSB5OO7CBTBI4UD4JIMXCK
X-Message-ID-Hash: NWKHCZABKHOSB5OO7CBTBI4UD4JIMXCK
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWKHCZABKHOSB5OO7CBTBI4UD4JIMXCK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 12, 2024 at 05:57:21PM +0100, Srinivas Kandagatla wrote:
> LPASS Digital codec have changes in register layout across multiple
> versions. Add a proper way read the codec version allowint all the lpass
> macro drivers (tx, rx, wsa, va) to configure the registers correctly.
> 
> LPASS VA macro has the required registers to read the codec version.
> Read the the version and make it available to other lpass codec macros
> using the common helper functions.
> 
> Existing method of using LPASS IP version is not accurate as the same
> the codec versioning is totally independent of LPASS IP block versions.
> 
> These helper functions should be able to provide a convient way to get
> the codec version, and will help scale the drivers in right direction.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-macro-common.c | 23 +++++++++++++++++++++++
>  sound/soc/codecs/lpass-macro-common.h | 35 +++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/lpass-va-macro.c     | 29 +++++++++++++++++++++++++++++
>  3 files changed, 87 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
> index da1b422250b8..8b038a99a8f9 100644
> --- a/sound/soc/codecs/lpass-macro-common.c
> +++ b/sound/soc/codecs/lpass-macro-common.c
> @@ -11,6 +11,9 @@
>  
>  #include "lpass-macro-common.h"
>  
> +static DEFINE_MUTEX(lpass_codec_mutex);
> +static int lpass_codec_version;
> +
>  struct lpass_macro *lpass_macro_pds_init(struct device *dev)
>  {
>  	struct lpass_macro *l_pds;
> @@ -66,5 +69,25 @@ void lpass_macro_pds_exit(struct lpass_macro *pds)
>  }
>  EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
>  
> +void lpass_macro_set_codec_version(int version)
> +{
> +	mutex_lock(&lpass_codec_mutex);
> +	lpass_codec_version = version;
> +	mutex_unlock(&lpass_codec_mutex);
> +}
> +EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
> +
> +int lpass_macro_get_codec_version(void)
> +{
> +	int ver;
> +
> +	mutex_lock(&lpass_codec_mutex);
> +	ver = lpass_codec_version;
> +	mutex_unlock(&lpass_codec_mutex);
> +
> +	return ver;
> +}
> +EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);
> +
>  MODULE_DESCRIPTION("Common macro driver");
>  MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index d98718b3dc4b..f6f1bfe8eb77 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -18,6 +18,18 @@ enum lpass_version {
>  	LPASS_VER_11_0_0,
>  };
>  
> +enum lpass_codec_version {
> +	LPASS_CODEC_VERSION_1_0 = 1,
> +	LPASS_CODEC_VERSION_1_1,
> +	LPASS_CODEC_VERSION_1_2,
> +	LPASS_CODEC_VERSION_2_0,
> +	LPASS_CODEC_VERSION_2_1,
> +	LPASS_CODEC_VERSION_2_5,
> +	LPASS_CODEC_VERSION_2_6,
> +	LPASS_CODEC_VERSION_2_7,
> +	LPASS_CODEC_VERSION_2_8,
> +};
> +
>  struct lpass_macro {
>  	struct device *macro_pd;
>  	struct device *dcodec_pd;
> @@ -25,5 +37,28 @@ struct lpass_macro {
>  
>  struct lpass_macro *lpass_macro_pds_init(struct device *dev);
>  void lpass_macro_pds_exit(struct lpass_macro *pds);
> +void lpass_macro_set_codec_version(int version);
> +int lpass_macro_get_codec_version(void);
> +
> +static inline const char *lpass_macro_get_codec_version_string(int version)
> +{
> +	switch (version) {
> +	case LPASS_CODEC_VERSION_2_0:
> +		return "v2.0";
> +	case LPASS_CODEC_VERSION_2_1:
> +		return "v2.1";
> +	case LPASS_CODEC_VERSION_2_5:
> +		return "v2.5";
> +	case LPASS_CODEC_VERSION_2_6:
> +		return "v2.6";
> +	case LPASS_CODEC_VERSION_2_7:
> +		return "v2.7";
> +	case LPASS_CODEC_VERSION_2_8:
> +		return "v2.8";
> +	default:
> +		break;
> +	}
> +	return "NA";
> +}
>  
>  #endif /* __LPASS_MACRO_COMMON_H__ */
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 6eceeff10bf6..0ae9e6377e3a 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1461,6 +1461,33 @@ static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
>  	return dmic_sample_rate;
>  }
>  
> +static void va_macro_set_lpass_codec_version(struct va_macro *va)
> +{
> +	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0, version;
> +
> +	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
> +	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
> +	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &core_id_2);
> +
> +	if ((core_id_0 == 0x01) && (core_id_1 == 0x0F))
> +		version = LPASS_CODEC_VERSION_2_0;
> +	if ((core_id_0 == 0x02) && (core_id_1 == 0x0E))
> +		version = LPASS_CODEC_VERSION_2_1;
> +	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x50 || core_id_2 == 0x51))
> +		version = LPASS_CODEC_VERSION_2_5;
> +	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x60 || core_id_2 == 0x61))
> +		version = LPASS_CODEC_VERSION_2_6;
> +	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x70 || core_id_2 == 0x71))
> +		version = LPASS_CODEC_VERSION_2_7;
> +	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
> +		version = LPASS_CODEC_VERSION_2_8;
> +
> +	lpass_macro_set_codec_version(version);
> +
> +	dev_info(va->dev, "LPASS Codec Version %s\n",
> +			lpass_macro_get_codec_version_string(version));

dev_dbg(), please. I think the kernel should be mostly quiet by default.

> +}
> +
>  static int va_macro_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1554,6 +1581,8 @@ static int va_macro_probe(struct platform_device *pdev)
>  			goto err_npl;
>  	}
>  
> +	va_macro_set_lpass_codec_version(va);
> +
>  	if (va->has_swr_master) {
>  		/* Set default CLK div to 1 */
>  		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL0,
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
