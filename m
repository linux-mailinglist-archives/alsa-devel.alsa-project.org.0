Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 456D77E8499
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 21:44:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D7DC3E;
	Fri, 10 Nov 2023 21:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D7DC3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699649084;
	bh=wItCm3pGOmZTSCtqQEGnAmMZ50ckZeJlrICn7/BXDBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JKwH92GzSJ4n522SHXGR0jcN/D8lxEBzs6ilaGvTcZDMcRdoZ1+AYcYxlNganTCBi
	 rzTGKjHEzJZOOY/OmkCgioOaOajqXblMWhnX0zVfIBXhy3c9JPArqcCl7sV7/HTeuW
	 S9fblzv2WHfOqk1gi+u0hmySnxfWIc5dyPonWYCM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E471F80567; Fri, 10 Nov 2023 21:43:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7092F80169;
	Fri, 10 Nov 2023 21:43:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D137EF8055C; Fri, 10 Nov 2023 21:43:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0205F80169
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 21:43:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0205F80169
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3b2e4107f47so1540349b6e.2
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Nov 2023 12:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699649000; x=1700253800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNaUrVj08NBtZOvpIGNqsCz93eA7N7P0VcAZpJigNHA=;
        b=O6D6uS1f33JLEiZWYMYR9XDOPd7X81q90oad6lVhCX76L6O/bH3a9reN8vgByQPl6t
         9TVXVrWt0RE3dXV1okt932lXWMIKGsCLwIUT/6X3IH1nFOBH75IE5L/cu6kwKBNeRaZ5
         wo7hRlbd1sgGPPKt7PtHsYVrINod1RyD4oDdftYXIkExBtDKnPo4sOpArgFI2/H2RS0K
         70OjcizENwXt3EdG51Prv1ucjQuQqn4KLsSwwA/QQ13Rnh8pkubKSd4sKktal/ehrHRT
         IZeuaBiU5v9kDSy5aX31OdAiGYHYAaNu0JOncv/V/qZ5KggcN5E4fPTynvoThCOYl0ft
         exfA==
X-Gm-Message-State: AOJu0YyMPP1rfb0oDOMC/EQ1gwfBSmgadmeqKfztGUS+lryJEFRQMyKm
	FmbxH76JW2HPw4cG39pCNC3Upjl7PQ==
X-Google-Smtp-Source: 
 AGHT+IGuCIrvtFv3ALEU5ciLcJTT36N1k9uB2xQVwrMFf1+eMSPG74AQUVS8heVBUqI66wOHlKeqbA==
X-Received: by 2002:a05:6871:551:b0:1dc:9714:e2b3 with SMTP id
 t17-20020a056871055100b001dc9714e2b3mr423099oal.7.1699649000334;
        Fri, 10 Nov 2023 12:43:20 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 l22-20020a056870d4d600b001efc94cc21bsm57823oai.58.2023.11.10.12.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:43:19 -0800 (PST)
Received: (nullmailer pid 398686 invoked by uid 1000);
	Fri, 10 Nov 2023 20:43:17 -0000
Date: Fri, 10 Nov 2023 14:43:17 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Jaehoon Chung <jh80.chung@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>,
	Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-serial@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org,
	Thierry Reding <thierry.reding@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lars-Peter Clausen <lars@metafoo.de>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, linux-mmc@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>, alsa-devel@alsa-project.org,
	Alim Akhtar <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 11/17] ASoC: dt-bindings: samsung-i2s: add specific
 compatibles for existing SoC
Message-ID: <169964899705.398637.5382830943719270282.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: 3A73PYKG5KD24QF5ZPSVPKAJYLU3ZG6O
X-Message-ID-Hash: 3A73PYKG5KD24QF5ZPSVPKAJYLU3ZG6O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3A73PYKG5KD24QF5ZPSVPKAJYLU3ZG6O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Nov 2023 11:43:37 +0100, Krzysztof Kozlowski wrote:
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
>  .../mfd/samsung,exynos5433-lpass.yaml         |  2 +-
>  .../bindings/sound/samsung-i2s.yaml           | 19 ++++++++++++-------
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

