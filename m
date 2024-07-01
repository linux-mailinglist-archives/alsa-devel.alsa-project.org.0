Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2E791E78A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 20:31:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30BC1EC0;
	Mon,  1 Jul 2024 20:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30BC1EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719858685;
	bh=vDGLWmIXVVyB1exjrHzcvgHK5kCnv8kyZp7T/Bw4t/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pPa1GvkKlOJjgd92ERSLBHxtNrf5PRd7sH9Qt7oNwLaA0hsM8ya3DzWcvA6h20jPM
	 i0sfJYm5olH7ooXLl6MeeIb6kGKqQM1sC9BB5+cudoFfikfVGg3x/2fwwZz8EOwBcV
	 W/QM0O+D8I6kKQiZicfZ8F+Qgv1ExhpmaIzbg1tI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABF91F805B5; Mon,  1 Jul 2024 20:30:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DAC4F805AE;
	Mon,  1 Jul 2024 20:30:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1B80F8028B; Mon,  1 Jul 2024 20:30:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A56AF8013D
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 20:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A56AF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FYJo2ggA
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52e7693c369so4409852e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 11:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719858640; x=1720463440;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sX/O4fr2+8PvQYguZGt7KddLq0tEWxhads05D+kvVqE=;
        b=FYJo2ggAySxttt1jU5EnKTqioKH/w4y8wEo/Nm9447GP7Zw+MueCP2C1mlxCHHhUpW
         mVu98uquPPPuC64xrm4131nUMWom5vpyW5IxbE6yvC8ltkVYY6lKuMeVUS23q+5JoFgz
         krenLaHe+5YoimnH4yJKQikrglWiBazFNauAjsTbWFB9nLYSpcVRbtOPtZiQrzQly/XG
         wjB4WQKmdeKKyBXeuZyFWFvC4peT5QkZcOzQRlVg3btYJ724e2Z9M3q3HX4Oc0Abwy2c
         8jcSk3ryPYY89oaTfu4e+kDgvEyOO9dsw196E7FLc1kTys50MbKI1c5WuYHTjiVMntHZ
         QfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719858640; x=1720463440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX/O4fr2+8PvQYguZGt7KddLq0tEWxhads05D+kvVqE=;
        b=FATkNJI9P2GcuqzHhvd7CT95fQXj5tMYFmdsMMSE9xIctA0dmfhKI6Iwf+tB7N0HZn
         Pkc4LcjTToSI7EHkHRM4U4Tpu32e4qmTMtRTmM2zFuGlHy0Z2EFctI9Lhc6ULtHUdkN6
         8tNlrwSv37KrAYFuZUo0KcxyF5R2DgOCMqZpUnqmS9P5EyoR0d0j5pislrnIscFXSqW3
         hlIhzRAnHa7/MjkSRH9M4Kf++7gHQeLCvigNQv0m31IBx2N9gx8Nq4t5j0kiC+7riflA
         00ke//Tbiq7Y3aRagO/OvtWvRIRC3J938MPbncSw+SO/eOkhWv4T0fAK9WWa07fa5yJQ
         +m5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh6mCLGzhR3uqymhrSTIBeQVQWZcvxUdr0cYpzDmZLXjg3iUqaeuyJYdyhiTMg9hn03XBfKIlWLJUDRzu/762R97deyseylWeNPiA=
X-Gm-Message-State: AOJu0Yz2HrK9+f7KudMI2xCj8/aAs3K5QEOeh7OAJDVD817Snh+FoDiY
	fe3gy3msx9AOkGRxbmO+XGy7HECxOEIcPHqb/J6hl7OXQzG94z8Tp4ole8e+faA=
X-Google-Smtp-Source: 
 AGHT+IGYAOEefMGp+PasSD6aXVE+wt5WaW5Ihd9eWiI8BlyAfQBL2BD7FLoq6KyCw0TQKGNw5LYjtA==
X-Received: by 2002:a05:6512:3e28:b0:52c:a5cb:69e4 with SMTP id
 2adb3069b0e04-52e826f12d1mr4520600e87.54.1719858640404;
        Mon, 01 Jul 2024 11:30:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab1089dsm1502831e87.86.2024.07.01.11.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:30:40 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:30:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: Fix using NULL pointer
 in probe() dev_err
Message-ID: <kblpzus3lr6j6xnitmjk2qt2vpfbutqar2zdxrjbepcvey73no@j6f6whmsk2mj>
References: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: YPNTLPRU2U5SKP2SRDULUOPSGJ3JOWJR
X-Message-ID-Hash: YPNTLPRU2U5SKP2SRDULUOPSGJ3JOWJR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPNTLPRU2U5SKP2SRDULUOPSGJ3JOWJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 28, 2024 at 11:58:30AM GMT, Krzysztof Kozlowski wrote:
> The 'rx->dev' is assigned closer to the end of the probe() function, so
> the dev_err() must not use it - it is still NULL at this point.  Instead
> there is already a local 'dev' variable.
> 
> Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
