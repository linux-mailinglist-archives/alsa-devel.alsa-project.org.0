Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7B590015E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 12:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B80C7846;
	Fri,  7 Jun 2024 12:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B80C7846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717757966;
	bh=pRUs8VmuZj5e7PO+Pf05N+Dt+BF9X0+42xniTidkx1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HefTOe3ev3IFCGm0tLltfP+6wI+8CrOWqUsfXgyIvwnRclSirJpBF3BQm1fGQDBW+
	 2Qf0ORy1aQ6eROkE4CW9GdcggSEo5k+avjUEIOzuJESyxAklWbNOhgdcOF7ytErMJf
	 zJmmdI5JMcDu9qeM1mzPYgvYXV/HKkpV1/DiB2kE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EC2AF805B0; Fri,  7 Jun 2024 12:58:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6597CF8010C;
	Fri,  7 Jun 2024 12:58:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62D5AF804B2; Fri,  7 Jun 2024 12:58:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1151F800AC
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 12:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1151F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MEBCc6Q+
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52b9dda4906so2823698e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 07 Jun 2024 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717757919; x=1718362719;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pBhIdhEhaQ9KQdEpMg8LTKp34tylqUHftSlF1gdJzgw=;
        b=MEBCc6Q+gRFutmrY81x5WCQ0zJjPpXrNeVV07hB1yXZSBXlIZFhypQSLt5l2vXLydD
         Hzl/05YKIWxSGkJ6wFPT4J/dwhTdL10nqiRYdAO12zxQJuFbRr84rKQeupWU4+i9sWcr
         LJmKXiDTY09lh0nbGZXdLKgQkVLwvIoWo9Uu1I4AzR1rY0MMD4zSimEQLwb6s6VFipcK
         jiB6EWzvYTJfkCtRYYGWx0+ax3TlTtbXG+xNd/px4tRITU4uj2MycohHupm09kCIFMhR
         KhIfd4ON9xO1l8aH3cJG/B1gzpwvmZZpxan6W6i5YvGKfz8UR3qygrWdI+rlYV64je64
         ofMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717757919; x=1718362719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBhIdhEhaQ9KQdEpMg8LTKp34tylqUHftSlF1gdJzgw=;
        b=BYToB9MmGCQBCafDXDC9/DRZwYx5Wtlhcxp/SjM/9kgwIzJdTiSC0reuhVLEKnhRTn
         nuOJzJgYAHljS9xU5BtwCarCPqBIq3F9JvX9zKbM7802dJDKG/YwFgs32pyiQrru7zAR
         oZpNZmNTQBX0lo5wNhp5iD0rk7NG94GI7LUJrvU2QLJRV4qaaP4dXWMc/EbCrj3M9X+F
         1WOhwaqhcJI9DtJcYuN3W4j+UVpQbHcQYUk4rspK1pXbYcT+BFGdzusJL88u5loa9Jal
         drZ3pFrXrvvBOa0e46VSwYL94D+qKYtA4Wh8SnnMQaa/eKZX+FwsQJleSB+3PSpR/4PC
         PRug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqL2mJTKyrXfMS6CO/FAUtJBjJmpN0l2W1lOGKTrThd+Fe5YIvHOCOmFPPS5o4oZmBs/0efha9Sn5Bqy4lDK6jHOqG5a3E/Lg+d4k=
X-Gm-Message-State: AOJu0Yye2cDGF6vxbNbI9wWJgSJ/bmlXdxO+fGqt+OhmQ/TZUFNi0f09
	9wvWhTCZpxAMVb9M1axyQizfgXIqvXlh5o7412BDlsyUdoJw684tdHP/su+OzpE=
X-Google-Smtp-Source: 
 AGHT+IGwurAV2ObQ2ikkqbB73N/NRCRyMNzsURTroyyeyk3A/xI2ByWyFDa/AOI35OfN6jvpgbWzjw==
X-Received: by 2002:ac2:4d89:0:b0:516:c5c2:cba8 with SMTP id
 2adb3069b0e04-52bb9f64ccemr1690971e87.12.1717757919391;
        Fri, 07 Jun 2024 03:58:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb434dde7sm494604e87.309.2024.06.07.03.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 03:58:38 -0700 (PDT)
Date: Fri, 7 Jun 2024 13:58:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org, neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2 1/2] ASoC: codecs: lpass-macro: add helpers to get
 codec version
Message-ID: <gda23tcdsoddyamedjd5sej4fhpjru65fqbhk4htc35kqyr3ts@glxyvqqw6x75>
References: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
 <20240606122559.116698-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606122559.116698-2-srinivas.kandagatla@linaro.org>
Message-ID-Hash: ZGTINEVMXPU5I7QINEGBZWGMVTZK7ENW
X-Message-ID-Hash: ZGTINEVMXPU5I7QINEGBZWGMVTZK7ENW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZGTINEVMXPU5I7QINEGBZWGMVTZK7ENW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 06, 2024 at 01:25:58PM +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
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

So it's possible for two platforms have the same LPASS IP version, but
different codec versions?

> 
> These helper functions should be able to provide a convient way to get
> the codec version, and will help scale the drivers in right direction.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-macro-common.c | 14 +++++++++++
>  sound/soc/codecs/lpass-macro-common.h | 35 +++++++++++++++++++++++++++
>  sound/soc/codecs/lpass-va-macro.c     | 29 ++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
> index da1b422250b8..a640bf88a6cd 100644
> --- a/sound/soc/codecs/lpass-macro-common.c
> +++ b/sound/soc/codecs/lpass-macro-common.c
> @@ -11,6 +11,8 @@
>  
>  #include "lpass-macro-common.h"
>  
> +static int lpass_codec_version;
> +
>  struct lpass_macro *lpass_macro_pds_init(struct device *dev)
>  {
>  	struct lpass_macro *l_pds;
> @@ -66,5 +68,17 @@ void lpass_macro_pds_exit(struct lpass_macro *pds)
>  }
>  EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
>  
> +void lpass_macro_set_codec_version(int version)
> +{
> +	lpass_codec_version = version;
> +}
> +EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
> +
> +int lpass_macro_get_codec_version(void)
> +{
> +	return lpass_codec_version;
> +}
> +EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);

Is it really just a global variable, no locking, no device?

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

dev_dbg, please.

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
> -- 
> 2.21.0
> 

-- 
With best wishes
Dmitry
