Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724893E0E7
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2024 22:23:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81D7BE9D;
	Sat, 27 Jul 2024 22:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81D7BE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722111805;
	bh=kHGL1U4vzMPjvspLRMbkYBQBI26OdTx3BOt3JS1aT1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h6bjOaicwMrcjFao7J0yQk5VJwDJe+PPz8iicgKah/hhk5iaG4fC1sSFpTHsb5aYZ
	 4z6eQQiyHEqem2PSBU9DPGWQFMHeg3DjnmusSacWweq+lYEYe+vOHbEMdSXmYIbU3I
	 rmM/diteq0LojdmbzG6mYTMv9BPWGKniXIq8TtqU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5FE4F805AC; Sat, 27 Jul 2024 22:23:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84015F80589;
	Sat, 27 Jul 2024 22:23:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B47F6F8026D; Sat, 27 Jul 2024 22:22:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACAB5F800C9
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 22:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACAB5F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bYF1wsIS
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ef2cb7d562so30298111fa.3
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 13:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722111737; x=1722716537;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Huc0K8rSvsCtHtQb7ohCUWF9mvI2cqys5jRNGU3Q/E8=;
        b=bYF1wsISyucywDo5X6gUV66XRACPctp4p0b8XWbI+KHHTe0gYavhUODvpMgKDOoMCm
         EzHB2numROuRkclY4SazBF0DPrmlGrI5+GaHHwaRV9ogCay5LLLPpGXfqCM97KZw46nt
         aPQ3KKzHo1xPZMNRUquACr/RogGDu85h4QapzkgZUxsyej9OM5dFCPn2Lfe1H5Da5pcV
         Wxnxf3nlKub8LxYgaYYouIdJWfxrGsb+sv0EnhlR9lzxg5s79CIhwm/h8QBgBeEZ+Jc8
         mecNLay1rvt8Dg6r2WxE9BWaQxnXx0kCMjiy6Dl9QCVimtVTfQn+Yxz4MyxGMMCs2eoU
         Ux/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722111737; x=1722716537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Huc0K8rSvsCtHtQb7ohCUWF9mvI2cqys5jRNGU3Q/E8=;
        b=w5rT9Vm+oJnQtWVLwh34UpDqiGMVIl+0Drq7CoGGshsIVxPi5stmZ07l8zw/r94+Tm
         PZoJC9oBBwDv3v/vY4LsM7ZJ1R2kzktwEEPcYT8Oki5gLEaxCrzWpK6XKNqNPrsqCkct
         PPG7DyhNvNHVBl8jZCDGhqo/JO/sCbMo/kX2f3GS5rOI58c1wud0rl7+CMVPSnPHeL7+
         PIOEMyOMI154NTIGVY1UgSaAEpECt4Np+RWD1zkyYZXx6GgekyaSqUuwSZtYZyvX07Pb
         L6V74uskGTU56UgRKV+Dz/2RS1rapy3G0OvqGZ3wcv4UEi1gA6KTrqqn1c7NZn8Ie5nG
         DPrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjSnaxYnrYCLfwdbaFdCiRy6NtTgYoYw3gatDidhHoB7nNvsaNh/PVfHd8qGjNvKvD7q7KMd2ndDl6kVrn9EUQLQlSMj6S/spq8Z4=
X-Gm-Message-State: AOJu0YzE4NrOuy1PjcYnQiOqpYm4XegOweSoMLlSM6CCu7W/BBXt0OKz
	8s7Daxhafp6cMQtytYtZojZXo25wL9/6Y8OCJGZEN0Bt2em8ReZtuZPGKAZHBrU=
X-Google-Smtp-Source: 
 AGHT+IEAM19ZrUTa03e6rXgthK0w+W59uGj7mGDLlSdELDkmYK6fX4CrolrKItgRARpBhijKL3BlCQ==
X-Received: by 2002:a05:6512:3416:b0:52c:1d8a:9716 with SMTP id
 2adb3069b0e04-5309b270b3cmr3069385e87.19.1722111736812;
        Sat, 27 Jul 2024 13:22:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c08e9fsm843335e87.134.2024.07.27.13.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 13:22:16 -0700 (PDT)
Date: Sat, 27 Jul 2024 23:22:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Message-ID: <hyjoqu6w4oqv5i4hvuewtgod3ngdkkanzokz5k2uh24gce74jw@ne5ctq7bfzv4>
References: <20240727182031.35069-1-a39.skl@gmail.com>
 <20240727182031.35069-2-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727182031.35069-2-a39.skl@gmail.com>
Message-ID-Hash: TCEXZTMK53BQMDMXFKOIAG2LDKOTT3PP
X-Message-ID-Hash: TCEXZTMK53BQMDMXFKOIAG2LDKOTT3PP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCEXZTMK53BQMDMXFKOIAG2LDKOTT3PP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Jul 27, 2024 at 08:20:24PM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add support for configuring Quinary Mi2S interface
> it will be used on MSM8953 and MSM8976 platform.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Split from MSM8953 support patch,add msg]
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)


[...]

> 
> @@ -320,6 +331,9 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->spkr_iomux))
>  		return PTR_ERR(data->spkr_iomux);
>  
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "quin-iomux");
> +	data->quin_iomux = devm_ioremap_resource(&pdev->dev, res);


This will still print an error if there is no quin-iomux. It's better to
call devm_ioremap_resource() only if res is not NULL.

LGTM otherwise

> +
>  	snd_soc_card_set_drvdata(card, data);
>  
>  	add_ops(card);
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
