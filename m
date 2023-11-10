Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8659B7E8421
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 21:40:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F8B8846;
	Fri, 10 Nov 2023 21:39:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F8B8846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699648840;
	bh=KuH0y5K3X+uGckCnPr/aynQfA+XmmEA5W2eOxCFAaNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LQEhHftdwj3g12CQmYZdz4jQJS7Gg/WLAdGw2m0jr82E8/vFKgl62xS5BApqQepLD
	 byqTWCIsIhfxTEyLyejiDwNXjCsteyLpD1v/u2NqkQUxlciXKTSJV2uWj9ODPbVViJ
	 3Yqyo/iH/A6Mw2LLnOJasupjXL42oKdd/mnn+IaA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C14F3F8016D; Fri, 10 Nov 2023 21:39:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43257F80169;
	Fri, 10 Nov 2023 21:39:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F710F8016D; Fri, 10 Nov 2023 21:39:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B9EBF80100
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 21:39:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B9EBF80100
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-6d2efe8c43eso1717044a34.0
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Nov 2023 12:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648780; x=1700253580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2mpCZw6APjzuy5DVtlkGaasSgeytmGTQ3T7Ai89NIc=;
        b=w+y0L0xAu3uFMkNUKJHcdDcE28cQ8kf2pxSoYr3ylSVdOaOHELT9AWl0uVgyorKFlV
         /fya52Pqoj9d3KcJ8tdaunSjE65H+MdTou8wVZ1KlgrpECu18951shJMdrOIrB+xjTWZ
         R9YM8sZx2VtLN/55Fj+Tduxjdv77CKE7jEUFmbKjOyzdNdi5PHRJjExJdKAy6lXOJYVw
         mBzgg1fALaZzgUzGtvbQDzUSQDGp9ChHgvxyb7w2VePfZCa1kGc1UHX7zgimn61MSfK4
         fYuTB+TezYcjbmkJbfmrkNCFSM6TUGnzvFmD+oY7y/DnV3Jbod8FoMehzSIVUU36zCGq
         BPAA==
X-Gm-Message-State: AOJu0YxKDIHBlUsBPALdDlun2+MwbHj4W+rRNq9E6Rh3gYAH9F8YMaDi
	oxR5Us2a/tr/iXffGZ+r8w==
X-Google-Smtp-Source: 
 AGHT+IFDEevgxfWBbNoBxZy5wpEh6g0d1RAursubSv3B8D6mEOOuHNqGY4vD4lMK2cqLkNv2mYVlyQ==
X-Received: by 2002:a9d:73d0:0:b0:6d6:5175:50c9 with SMTP id
 m16-20020a9d73d0000000b006d6517550c9mr157442otk.6.1699648780318;
        Fri, 10 Nov 2023 12:39:40 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a056830450f00b006ce2b90d0cesm51017otv.24.2023.11.10.12.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:39:39 -0800 (PST)
Received: (nullmailer pid 392734 invoked by uid 1000);
	Fri, 10 Nov 2023 20:39:37 -0000
Date: Fri, 10 Nov 2023 14:39:37 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Alessandro Zummo <a.zummo@towertech.it>,
	Sam Protsenko <semen.protsenko@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-serial@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Cameron <jic23@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-samsung-soc@vger.kernel.org,
	linux-mmc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>, linux-gpio@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>, Jaehoon Chung <jh80.chung@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>, alsa-devel@alsa-project.org,
	Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sound@vger.kernel.org,
	linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/17] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 specific compatibles for existing SoC
Message-ID: <169964877627.392672.14874068087701843483.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: RSNTT5HX7HBHMVGKLWQI3MP6S5OME65K
X-Message-ID-Hash: RSNTT5HX7HBHMVGKLWQI3MP6S5OME65K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RSNTT5HX7HBHMVGKLWQI3MP6S5OME65K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Nov 2023 11:43:30 +0100, Krzysztof Kozlowski wrote:
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
> While re-indenting the first enum, put also axis,artpec8-dw-mshc in
> alphabetical order.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../bindings/mmc/samsung,exynos-dw-mshc.yaml  | 25 ++++++++++++-------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

