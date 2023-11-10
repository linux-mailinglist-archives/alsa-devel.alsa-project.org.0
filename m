Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 029477E843F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 21:42:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 867EF84A;
	Fri, 10 Nov 2023 21:41:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 867EF84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699648931;
	bh=acK6dDDXnxpbo/10s7QRoi2VOIULXzJF8S40rlGHk8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RCebRfd4GnX93UfFqXSkgFO8ETWHY98iGLmqa17KEGhZkJlwZ25f5TyQA9KOlsMk2
	 4VU+Tjt8zPcWUTIfz05Zs+OCJf8ALpphntvB3EOFZ6+1+PBxGJgF2BsgTNgLtiNyL7
	 I8CXvsJlJ24ui648bhPNzRjcxzrazKG0A8i/lv0M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47A09F80152; Fri, 10 Nov 2023 21:41:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC39BF80152;
	Fri, 10 Nov 2023 21:41:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BE2AF80152; Fri, 10 Nov 2023 21:41:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0CFCF80431
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 21:41:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0CFCF80431
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-1efb9571b13so1413492fac.2
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Nov 2023 12:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648872; x=1700253672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBu9jdlI8BmMP2EXqok2V/jfQ0F843VqKLKqoYajCbY=;
        b=UqmwlggTS9t5FXCMgQsCuadqmbyMxjsZErRCaG2s1TnHg8geb8oUBHD+5CS4NKGECr
         E2yjQZJfhohuDU5wC6Hbdgd4dcM1VszGZdz3I0VfoMZtzqmJlhLjkJvaZfENDcx24NPL
         mm0Li8x1UByyRV70gED5qLXngMXpEAFvWvAoNP11iTFygy4FZRtMfVlBsVNnTmz9x3Fq
         MPC+eJQlfdlvk8sLl+NG3hgI5mQNHrqaQis13WKWg2qFdtc/hWT8F874WibRxxQWbnbH
         LftzDoJCKpuzPYriof6MvFaz+BHTzOtngzPvwNRGNyBnDgP0iJdvp9vdPHfqpBtOPIBu
         pGCg==
X-Gm-Message-State: AOJu0YxR240GwTaWk2dR9cwsZMYIAd/B8o8zKkkujWjNU80od3bhDXTk
	SwPLrsZESecJefQIYou8tw==
X-Google-Smtp-Source: 
 AGHT+IE7LNnk5DWomU2D9t+1ZTG+6ik+KpyphzRkzXtQujj9+w3A1KWUmfC2t3Snd6+6Q7shaSdaiw==
X-Received: by 2002:a05:6870:c986:b0:1d5:40df:8fb1 with SMTP id
 hi6-20020a056870c98600b001d540df8fb1mr335335oab.19.1699648871913;
        Fri, 10 Nov 2023 12:41:11 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 mo37-20020a056871322500b001cd1a628c40sm57032oac.52.2023.11.10.12.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:41:11 -0800 (PST)
Received: (nullmailer pid 395219 invoked by uid 1000);
	Fri, 10 Nov 2023 20:41:09 -0000
Date: Fri, 10 Nov 2023 14:41:09 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-rtc@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
 Sam Protsenko <semen.protsenko@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pwm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org,
	linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@gmail.com>,
	Tomasz Figa <tomasz.figa@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-sound@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
	linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, Andi Shyti <andi.shyti@kernel.org>,
 linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-iio@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 07/17] dt-bindings: serial: samsung: add specific
 compatibles for existing SoC
Message-ID: <169964886893.395180.18336203725841457804.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-8-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: 35NFPUMA5VSGZ2I5XJE67O5NSL7C7N4I
X-Message-ID-Hash: 35NFPUMA5VSGZ2I5XJE67O5NSL7C7N4I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/35NFPUMA5VSGZ2I5XJE67O5NSL7C7N4I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Nov 2023 11:43:33 +0100, Krzysztof Kozlowski wrote:
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
> Re-shuffle also the entries in compatibles, so the one-compatible-enum
> is the first.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../devicetree/bindings/serial/samsung_uart.yaml   | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

