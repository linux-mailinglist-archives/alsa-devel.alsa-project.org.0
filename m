Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 507F17E8438
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 21:41:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0343829;
	Fri, 10 Nov 2023 21:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0343829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699648910;
	bh=wmsRIxBS+8/7QiwB/ShE3DhXB0RGZmR9jsuRWVd2PWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f6SfOXuQXwyuZbS1qxgVz/Aam2aoKZrY8Zw267dhijQ8Xy6IYatQoHlACEKoI8eva
	 gj/p2k1EJK0HhJTSeHgwyCE7HdvqNRra7Az5vWxvB5j0jOOBYx6Y3hRtFT+e7SR9Nx
	 4m3+CKC6CUS8ZgCb7/jeRB0g0DhJ2aj/Jktd+T0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A3EFF80166; Fri, 10 Nov 2023 21:41:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C32FF80431;
	Fri, 10 Nov 2023 21:41:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 216C3F804DA; Fri, 10 Nov 2023 21:40:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B71B1F80166
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 21:40:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B71B1F80166
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6d645cfd238so574652a34.2
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Nov 2023 12:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648853; x=1700253653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0iJFdRqfvLTCqUgEC28fOOuQc4nEg1ExrvWS4swH3k=;
        b=NIK3MDhp6/Nedn8KDbbs9pMny6ewsOQW8tH0WuZXD+xmPkvIbEs0YHnGYHClMX3OJE
         mUqY19J0MgCOq9PZm9PSPGi+FU1vIK4WQGrSGnmgxYATLeuDaqGifR62/th5S3i+tpyS
         /HJWBi8Hv0ZnhxXs4EX/03IOxDuD9LIZUKUT6PxHN5yPzgHlXObPthiv0LQuumZTHcEf
         RSrOMaQU7JCxxuWiQGu/8ZAuxySBRdFY5wWzsK3BrWPuAC21LJgLBR0xry61+UbRrJtm
         K8/7TBLSU7mL4mKEgFPHYuRZDZeVtNUpqHc+RhVwIQBsxyidXibmTt9Fp5qQ/4Lk3rxt
         TxGQ==
X-Gm-Message-State: AOJu0YzcjLbJBv/dGjvpLXTF7eR6it4WHEIzIeiw7ekilqOFXkiWrhXo
	3f6l9XWXuxgZ6o89n7Du4g==
X-Google-Smtp-Source: 
 AGHT+IHiBM+Pj8rwIjD5f5ElWq7IEopHChL5V1l1hLXxoRScz48VE6f3ZULiu1sG34gKSMusYsFlGQ==
X-Received: by 2002:a05:6871:4105:b0:1e9:8e22:24c6 with SMTP id
 la5-20020a056871410500b001e98e2224c6mr331624oab.44.1699648852849;
        Fri, 10 Nov 2023 12:40:52 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 y22-20020a056870725600b001ea4324364csm61318oaf.12.2023.11.10.12.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:40:52 -0800 (PST)
Received: (nullmailer pid 394724 invoked by uid 1000);
	Fri, 10 Nov 2023 20:40:50 -0000
Date: Fri, 10 Nov 2023 14:40:50 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@kernel.org>,
 linux-rtc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>, dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 06/17] dt-bindings: rtc: s3c-rtc: add specific
 compatibles for existing SoC
Message-ID: <169964885014.394659.16948497259010559308.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-7-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: JAMGL2HDOHI3I5QK4LRCOMJ2FU3RFFC4
X-Message-ID-Hash: JAMGL2HDOHI3I5QK4LRCOMJ2FU3RFFC4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAMGL2HDOHI3I5QK4LRCOMJ2FU3RFFC4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Nov 2023 11:43:32 +0100, Krzysztof Kozlowski wrote:
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
>  Documentation/devicetree/bindings/rtc/s3c-rtc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

