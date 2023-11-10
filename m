Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A91A7E8497
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 21:44:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA4E9829;
	Fri, 10 Nov 2023 21:43:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA4E9829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699649057;
	bh=s+usg5G1PxXFqdDFnY9JX95KjKsHO/ZrjGdrtzctvVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nxNaIxsZvPcDiZ4ITCCfGL+DIibUvMp76jtAz3lnckNA8jcjgif2z9B0lztCAK5dj
	 KzSskm/KCO6oYkTweTOXNcVyv3jkU097Y8pm2asz4LBsZhIEjFa1R7cQ4CUhhAmt8i
	 Whg2ThbC0i9MPUGOY7jKnzWoj7eHsAKaIPCeGYao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCA1BF8016D; Fri, 10 Nov 2023 21:43:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64594F80152;
	Fri, 10 Nov 2023 21:43:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB5B9F80166; Fri, 10 Nov 2023 21:43:01 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D7C6F80152
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 21:42:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D7C6F80152
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6ce2ee17cb5so1326571a34.2
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Nov 2023 12:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648971; x=1700253771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYRGPcRyh2b3fkqQmyXc07beY1rNkEkbKXxns94N0UA=;
        b=txGPiZWkg7YeA+h81U9kUH8yy/D5cXc9xuPkD0cUksI43d6ANRVFWM6slQb+IviCiW
         mEsjlpSgt8eXuA9fgbKU8UJM6SV26kRA5rkj7eAtEKPv6Z9Hd0j8skiIpTDFZzmems2a
         hX+eCYDAptCkUwqTxS5fxiE2EbiBv6wNJS7DjAueQMjt6LaOC46qRm4Iu4nxqPqnl1Ds
         G2dF6MTaHOqbSY7nlP5o9b+eY/D3TdWBD1xWkR1kC6ZTCPZ27KUjbksvwCRpcOmKCiqG
         Xrfm7DWmxShooh/tka0n7Y2jUHhgVYscTH7DUvyRDXx0PVOooayWav8eD8Zg3qsBAiRn
         dHpA==
X-Gm-Message-State: AOJu0YyqAslpdS6YN8AoSCIj+jMwVE/k8QDJ+fQcxQse2sDqcSaHSksL
	+7re2fY33sHp9KFDAiEmbw==
X-Google-Smtp-Source: 
 AGHT+IEbpkkUwMS8m0HRQeTKdMYwXj4e9rjshafhVsgnG4tRletjT6wKTUFDB5opO1qLTOQnh19aYQ==
X-Received: by 2002:a05:6808:23cb:b0:3b6:d617:a6f7 with SMTP id
 bq11-20020a05680823cb00b003b6d617a6f7mr539897oib.3.1699648970928;
        Fri, 10 Nov 2023 12:42:50 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 x26-20020a54401a000000b003b2e3e0284fsm42223oie.53.2023.11.10.12.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:42:50 -0800 (PST)
Received: (nullmailer pid 397808 invoked by uid 1000);
	Fri, 10 Nov 2023 20:42:48 -0000
Date: Fri, 10 Nov 2023 14:42:48 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-mmc@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sam Protsenko <semen.protsenko@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-pwm@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>,
 linux-sound@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org,
	Tomasz Figa <tomasz.figa@gmail.com>, alsa-devel@alsa-project.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
	Lee Jones <lee@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 10/17] dt-bindings: iio: samsung,exynos-adc: add specific
 compatibles for existing SoC
Message-ID: <169964896802.397769.16770997428730838541.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-11-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-11-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: TCFAJC2A6PU3Y3XYZIVMHP44IYCQMADO
X-Message-ID-Hash: TCFAJC2A6PU3Y3XYZIVMHP44IYCQMADO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCFAJC2A6PU3Y3XYZIVMHP44IYCQMADO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Nov 2023 11:43:36 +0100, Krzysztof Kozlowski wrote:
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
>  .../bindings/iio/adc/samsung,exynos-adc.yaml  | 29 +++++++++++--------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

