Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8FF7E8441
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 21:42:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123E586F;
	Fri, 10 Nov 2023 21:41:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123E586F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699648945;
	bh=RGogOahR7yR0WDWBvARnUcox2UMW+WFG9QNZSuw/AaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h3cW21dFdUls1vzFiM0cIaUMAYlj80Fv0yYeLdqTsfBnhd3UsEPblhsbmq0HC36Q/
	 Qomv5ZMHOjuPJbvMsEg6XYqdiBYgk+GJ+Y1qWPmcT7aDgmWpn0wZSrQDPs7folyu8s
	 gbcCGwgKyI6pseeUsz/+zDW+b5QcLBkAJDvcwu5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3BD3F80563; Fri, 10 Nov 2023 21:41:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5642FF80568;
	Fri, 10 Nov 2023 21:41:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB161F80568; Fri, 10 Nov 2023 21:41:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D7D8F800ED
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 21:41:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D7D8F800ED
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-1ea48ef2cbfso1378335fac.2
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Nov 2023 12:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648886; x=1700253686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBHIKLn/Yt1i+AZlSPolEYBWZ3bHmDQq+CYq1w7SUZQ=;
        b=vUV33sQDb2vMovGfZ0hY7OQod72RKQT6WVOPu029r+XJ/nlQXfgxOmc6p/JZrUY+/7
         YHZqEwUPpO/RQKyCoN0D9OeZPhjIll1JWzkS0rWWdw4Zad89onxEHHsaeuJdvBdeGOQ7
         E8sfuzFZodzvYtTGd42XlrhfrG/tcfPpVlWgOm/rJgsnKB/hKQ2o9Ie3MTpghAILYpoO
         6Z0XKzf1l+FjOt3KORAQu6Wyvn85NhP5hA6PO547kqeBPoXyqPx63hXz7BBnus+9OnwZ
         3IooyFNY8LX4qRhijQWozzHoXzskkChGpB2Zsf0rLoIFbeoKwYkreOZOOR4G4s/gKp3L
         xV1Q==
X-Gm-Message-State: AOJu0YzOs8ZGraSUHQRpFfYYL6SW+zCO8k87q+SQCb3R02Z43yTilcmm
	XgzsGn8/qVHftuSvhRQ76w==
X-Google-Smtp-Source: 
 AGHT+IGWPDVMk2FcTLN+vtGTQRj0d3U/p0JEK8eP2bUHcv7B2jUR734/Xzt7iQNmomOefFQYy76Dcw==
X-Received: by 2002:a05:6870:d07:b0:1ef:b16f:d294 with SMTP id
 mk7-20020a0568700d0700b001efb16fd294mr347134oab.38.1699648886590;
        Fri, 10 Nov 2023 12:41:26 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 zl25-20020a0568716d9900b001cc9bc7b569sm59526oab.27.2023.11.10.12.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:41:26 -0800 (PST)
Received: (nullmailer pid 395677 invoked by uid 1000);
	Fri, 10 Nov 2023 20:41:24 -0000
Date: Fri, 10 Nov 2023 14:41:24 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
	linux-serial@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>, linux-iio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-pwm@vger.kernel.org, linux-sound@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>, linux-i2c@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>, Maxime Ripard <mripard@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-rtc@vger.kernel.org,
	Tomasz Figa <tomasz.figa@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
	Daniel Vetter <daniel@ffwll.ch>, alsa-devel@alsa-project.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
 Alim Akhtar <alim.akhtar@samsung.com>,
	Jiri Slaby <jirislaby@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 08/17] dt-bindings: samsung: exynos-pmu: add specific
 compatibles for existing SoC
Message-ID: <169964888359.395618.988473791083039735.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-9-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: D3JB5BTUFQA766RLRGKAUWU6A3NNMTE6
X-Message-ID-Hash: D3JB5BTUFQA766RLRGKAUWU6A3NNMTE6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3JB5BTUFQA766RLRGKAUWU6A3NNMTE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Nov 2023 11:43:34 +0100, Krzysztof Kozlowski wrote:
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
>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

