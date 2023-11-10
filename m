Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A3C7E841A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 21:40:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A7C083A;
	Fri, 10 Nov 2023 21:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A7C083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699648808;
	bh=b9+OKu32hvDBZxMxYKjNcaWKvoysggGtH5qfewgB6Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nlU7qiMuar5TzTubgaulOnWGfprsWBi+qbJs7GmD0I0y5e8chpidb6kE9bS2+AoZm
	 cunvJ2YVqH8SNLtc8wQEJ1vvN7T8kX1LeRX2Phga+Llbt9Tb45aCSusbC5Xpsr0f/W
	 rAQZsxoz6Mbghyh3AKKwTx/jV5lFIK8cw8Fn9Xis=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31B58F8055A; Fri, 10 Nov 2023 21:39:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D66CEF80169;
	Fri, 10 Nov 2023 21:39:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0295F80431; Fri, 10 Nov 2023 21:39:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18892F800ED
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 21:39:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18892F800ED
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3b2ec5ee2e4so1427699b6e.3
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Nov 2023 12:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648751; x=1700253551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS2DPG1f2BOqV0lB92Cpsm9LSSGSaVSlz4hVTLG41TM=;
        b=jfg43917vMPL+wWzdz6jAk/sF9do6Osbf74mitwgxuRci2OlcYxl6bBmqUOwi7yejZ
         tleJoTLuDnnP7KizsmVcCJArjPisgxXLYsgdODPW1p4s338qiudRJp/M1Ye1F5IHslA9
         Ybb3onZAkxpH5iNf1gewW68GGhNFiTGauj9KduREcgGumhq1WPjTU4WnlpjSqD1P7WU/
         WVVP5ltVd0iB97lMSWCWueKe276oZqgCVApa22YxlSL1m3BBFsvHtS2hww2Ea3hsJOdE
         CTEZK4eWJrkoD1parcHX2phVR4ygWuKFB6dPXNbL2kGYKqe5P6+UPkgoGpWeICt8yIaU
         yhzw==
X-Gm-Message-State: AOJu0Yzdd4Z9s1kiVuiRLkIUUYJVedSbAiGvoKWWwJ7v3Q5wGocauP+v
	/qnRvg096mZqCuGBVPegRg==
X-Google-Smtp-Source: 
 AGHT+IE11yxoIUKi4thNm7Iyj/ixtWImO1W2Hn7ItLPU3Js0ofchT4UxunydV7s77gbgBpIQEqwLTQ==
X-Received: by 2002:a05:6808:14c:b0:3b6:c4dd:be83 with SMTP id
 h12-20020a056808014c00b003b6c4ddbe83mr464930oie.52.1699648751176;
        Fri, 10 Nov 2023 12:39:11 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 a9-20020a05680804c900b003b29c2f50f0sm43947oie.18.2023.11.10.12.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:39:10 -0800 (PST)
Received: (nullmailer pid 391980 invoked by uid 1000);
	Fri, 10 Nov 2023 20:39:08 -0000
Date: Fri, 10 Nov 2023 14:39:08 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 03/17] dt-bindings: i2c: samsung,s3c2410-i2c: add
 specific compatibles for existing SoC
Message-ID: <20231110203908.GA391217-robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: FUVKY42AMWYD3U2R7AK53CHG3WJYOXA6
X-Message-ID-Hash: FUVKY42AMWYD3U2R7AK53CHG3WJYOXA6
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FUVKY42AMWYD3U2R7AK53CHG3WJYOXA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 08, 2023 at 11:43:29AM +0100, Krzysztof Kozlowski wrote:
> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
> 
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../bindings/i2c/samsung,s3c2410-i2c.yaml     | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
