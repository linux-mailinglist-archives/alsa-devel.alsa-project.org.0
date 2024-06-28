Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC2591BA40
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 10:42:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F32B233F;
	Fri, 28 Jun 2024 10:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F32B233F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719564148;
	bh=biRrQhODyDG178r6t+Dc7W8P46eie8EBFQWED+2NYyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=erswMEPSMMZ2dPD9WVkl79iDpAFxKld+6dBTMoKs65vTJYF1Kax4MRYU4iih232u3
	 Ac4mJYX4mdzHAcdpK30WT53rWRHLFImPhNeHKgcAG4E6ktEIj+fPYdUMFNyVZB8YE4
	 DSfTd0f+/PBLcLZObMwr6ZSxXmu3ZtL7LqpCCwK8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5EB5F8016E; Fri, 28 Jun 2024 10:42:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8DBAF805B1;
	Fri, 28 Jun 2024 10:42:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E689F804D6; Fri, 28 Jun 2024 10:39:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04FB1F80423
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 10:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04FB1F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yMDhekJN
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52cd8897c73so375853e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 01:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719563691; x=1720168491;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8zLmoIKPxnK+b9kZdJkrjuWZxz5Rl0SiMo/hxM01Sk=;
        b=yMDhekJNBmFHzVS0Q/o8ixgnJtnKnfbirGoBzBvfoE/dxZ0rG/oczHff3fclmQvu+Q
         0TfGurREFbnmyko0nMJvDy6VaRAyIjVVidBPHfb3ixw5w6m1WPkg6lRRrYJTxyzLD5AZ
         Nd6Ag1PwmjCOhajXWucD9LKYcvj8alyfqH892a2mpLLTWEopcjmGVT7oNYTx0wu6Ir0N
         fGKBdCuAeJcYJJZocQTkFiC/jylKh7Xw6gkEVZcWB3CkgmQ7J+38cfLbp4RjEFCBkVBm
         J7gZiHoFJq6ofcPJe85ku+nN6qtEUTb935R2NHcuWCBurrdJQLezQ0rJ4VkMEYH18PJY
         CMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719563691; x=1720168491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8zLmoIKPxnK+b9kZdJkrjuWZxz5Rl0SiMo/hxM01Sk=;
        b=V5xsFwmb4K36QALj7RHOmPqBauxwCRQj6mfKriWsJcbv7ZvOtjFCXK4WAZwEKjdsNe
         t9Qju31ZempV3m7I9NwsVeinNP4ugXwM/yedc6RvArvGd0i46/arFN+B+m73BZsr5bLG
         +9BdOUJbgYsR0pe7NLf8hQyj5u7aonrc5qd7Dz8GXXEu2U1zf9XK79IMcGSBgFj2m5AM
         DUU57u8njC/aEt3RxblEHw0vQIwJktN9UQJRX4c22r3TK5HfVj6zmMhcirKP7RgoXl8C
         rr+a6kgHvjKc90NeJXz5DE47wlwdkknLgiBSrNYW2qDVRzW5wogCFjeKN92VEh+bfQEo
         a99g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiLWP4myCouqMSJRgU6teFNIeJgECngpZfOJmPkQWIHGrWwmnbxCyjmWEo4MpI9z7OSGs5MRXYgeWTfRab6kLK0JKshp3RL7ptGOU=
X-Gm-Message-State: AOJu0YwQGOXaGUFzdnCrpmEWQBiVDoIPelweXKzKcF8CCnGP8wi1PQEb
	ZHsbv1xJOgPHNcCucU/VlfraN5ss4cCiM5iaQ1864Oc0neTy1A8pcNFv3O9ijgk=
X-Google-Smtp-Source: 
 AGHT+IFFgYROnO/gr2N7QSvXx1fctXVhRczM++VXS2jEv/Xjq0ZPOXaSUkxk3uPcFer4UHzQuZELGw==
X-Received: by 2002:ac2:54a8:0:b0:52c:999b:52f9 with SMTP id
 2adb3069b0e04-52ce186457cmr9622295e87.57.1719563691555;
        Fri, 28 Jun 2024 01:34:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab101f3sm207679e87.76.2024.06.28.01.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:34:51 -0700 (PDT)
Date: Fri, 28 Jun 2024 11:34:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: codecs: lpass-rx-macro: Keep static
 regmap_config as const
Message-ID: <grpb57rhum4auor3n66mqd2tpmd52gzofbdog3vlmxlamfxv5a@2mhfkigl6ek2>
References: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-2-ede31891d238@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-2-ede31891d238@linaro.org>
Message-ID-Hash: I5OWFASM45KIE4NCC6264P7CDJQ5E4Y3
X-Message-ID-Hash: I5OWFASM45KIE4NCC6264P7CDJQ5E4Y3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I5OWFASM45KIE4NCC6264P7CDJQ5E4Y3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 27, 2024 at 05:23:44PM GMT, Krzysztof Kozlowski wrote:
> The driver has static 'struct regmap_config', which is then customized
> depending on device version.  This works fine, because there should not
> be two devices in a system simultaneously and even less likely that such
> two devices would have different versions, thus different regmap config.
> However code is cleaner and more obvious when static data in the driver
> is also const - it serves as a template.
> 
> Mark the 'struct regmap_config' as const and duplicate it in the probe()
> with devm_kmemdup to allow customizing per detected device variant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 59fe76b13cdb..3d8149665439 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -1662,7 +1662,7 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
>  	return rx_is_rw_register(dev, reg);
>  }
>  
> -static struct regmap_config rx_regmap_config = {
> +static const struct regmap_config rx_regmap_config = {
>  	.name = "rx_macro",
>  	.reg_bits = 16,
>  	.val_bits = 32, /* 8 but with 32 bit read/write */
> @@ -3765,6 +3765,7 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
>  static int rx_macro_probe(struct platform_device *pdev)
>  {
>  	struct reg_default *reg_defaults;
> +	struct regmap_config *reg_config;
>  	struct device *dev = &pdev->dev;
>  	kernel_ulong_t flags;
>  	struct rx_macro *rx;
> @@ -3851,14 +3852,22 @@ static int rx_macro_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  
> -	rx_regmap_config.reg_defaults = reg_defaults;
> -	rx_regmap_config.num_reg_defaults = def_count;
> +	reg_config = devm_kmemdup(dev, &rx_regmap_config, sizeof(*reg_config),
> +				  GFP_KERNEL);
> +	if (!reg_config) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
>  
> -	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
> +	reg_config->reg_defaults = reg_defaults;
> +	reg_config->num_reg_defaults = def_count;
> +
> +	rx->regmap = devm_regmap_init_mmio(dev, base, reg_config);
>  	if (IS_ERR(rx->regmap)) {
>  		ret = PTR_ERR(rx->regmap);
>  		goto err;
>  	}
> +	devm_kfree(dev, reg_config);
>  	devm_kfree(dev, reg_defaults);

Seeing devm_kfree in the non-error path makes me feel strange. Maybe
it's one of the rare occasions when I can say that __free is suitable
here.

>  
>  	dev_set_drvdata(dev, rx);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
