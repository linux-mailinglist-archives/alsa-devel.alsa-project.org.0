Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1827E840B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 21:39:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F19CB6C1;
	Fri, 10 Nov 2023 21:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F19CB6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699648764;
	bh=Wp37ZRJHOp7mH5gGipjb50Bxm/eiMMWhwlg3nkIIlAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZYQCizmDnthHHi5Sw0cn0q4vvB9lq/AxGTHyDcw+NBdcmte5SZJygWjsjrEjWQS4v
	 zHzI7r+VBZXugov4XuE2BW1wmcgaZOu+rk0zXu2G4YjG0Hrnm9G1h5Ti84OtV5dnkc
	 Agv9QPgRq2T5mKBXSlCMOPyQsE9MjguGxx8P5C+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C6D6F8016D; Fri, 10 Nov 2023 21:38:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A8B6F80166;
	Fri, 10 Nov 2023 21:38:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFE70F80169; Fri, 10 Nov 2023 21:38:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3801F80100
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 21:38:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3801F80100
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-1f03d9ad89fso1281075fac.1
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Nov 2023 12:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648694; x=1700253494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDEOGTCwLGe8/AbnY8N0ixov4mA0V6wpnOxoAqQPSK4=;
        b=VucMbGE4a5XIHPd4+JPaSZl7CvMk0Z7dZ7+oIa/PcWmVqHhfITu+vd9wYhYooJbYZm
         k7wx88zzCAHVJFc4No9P5NLlVFp5Ww++MJKZFulndytFXgIShwg+GgaohnegpgvArr+d
         Q+q9Z24iTKgDzz8jM12F6Dc7ivVBbyzAwC3gFPrph6A/U8+ZW9SdFSzfEoeyKv7lTdDC
         Ys9b728h5d24PhvHlvRuexz8pxhFgfE//XQtf5LkpAv7kzzrOfN6LZZpO5EXz81VUsDJ
         JUlXv/WyOjJoE7mL/0ggqFt+XpFPOj3WOTPLFLdit/M91HkGeB24bcLxzhiTdZOmb0CT
         mS0w==
X-Gm-Message-State: AOJu0Ywol13sXmgv4RjDbIqIe/iRxGenDt/TJir6h97On+2GnBQaQNyN
	sGfRMuI3jQ8/oei+aw9SQA==
X-Google-Smtp-Source: 
 AGHT+IFVVQE4BI8cOz3AIQYw2pXVqurA/tQ+STytYpdzYk+6P+Wjdqy5vAj94WGd/H3Kxm+R2FQFzQ==
X-Received: by 2002:a05:6870:d1c2:b0:1ea:14eb:b741 with SMTP id
 b2-20020a056870d1c200b001ea14ebb741mr343191oac.54.1699648694529;
        Fri, 10 Nov 2023 12:38:14 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 y4-20020a056870a34400b001e9ce1b5e8fsm59655oak.15.2023.11.10.12.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:38:13 -0800 (PST)
Received: (nullmailer pid 390527 invoked by uid 1000);
	Fri, 10 Nov 2023 20:38:11 -0000
Date: Fri, 10 Nov 2023 14:38:11 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>, alsa-devel@alsa-project.org,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-rtc@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
	Lee Jones <lee@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-mmc@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
	linux-serial@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 02/17] dt-bindings: i2c: exynos5: add specific
 compatibles for existing SoC
Message-ID: <169964869116.390473.6961652258456026108.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-3-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: UB7PVNU2LW3AFAIIXJR4E4JKR33A2N4V
X-Message-ID-Hash: UB7PVNU2LW3AFAIIXJR4E4JKR33A2N4V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UB7PVNU2LW3AFAIIXJR4E4JKR33A2N4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Nov 2023 11:43:28 +0100, Krzysztof Kozlowski wrote:
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
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 10 +++++++++-
>  .../devicetree/bindings/soc/samsung/exynos-usi.yaml    |  2 +-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

