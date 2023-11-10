Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF61A7E842B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 21:41:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 753EB74C;
	Fri, 10 Nov 2023 21:40:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 753EB74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699648875;
	bh=Y9dsS2cVECH/d90He7owyS4IgFBhxDD7kIOOXNgCVko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DFepyvYmJ1u49B4gZuxcYIRUPX48oJ9+8ITEbG4JRAUW1anSETQnDgdIqqZPlnO4L
	 nm459ulCBFOjTRqb6SObKc27ttRvk7sU2B4uWwvUu31kzJiJvZZYsY0GOlXzgc+mkr
	 jAejn+0Tbk76afeE6PqENKAhSG6HoMCBqb7j5zf4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F2FBF80549; Fri, 10 Nov 2023 21:40:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA41F80549;
	Fri, 10 Nov 2023 21:40:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EFF3F80557; Fri, 10 Nov 2023 21:40:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DEE1F801F5
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 21:40:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DEE1F801F5
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-6d2fedd836fso1405941a34.1
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Nov 2023 12:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648803; x=1700253603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIUKFeCBp8QWWYNKFRJyz0CogaqLBpf4Mvy06PqKugo=;
        b=v3KoClspVwqa1Q9P5DA3sVaFsaaNDZ730qi3GBDxUFz2p71v9iqjZ5VXSzowTZRLlp
         oHlyVRgQxPh1hVOx6URTk3X3HhmH6kD6wcFuuB88xOIiZc6VHPY/fM8lQh/Frm4vtnuB
         QC602WLjJYGZoOymx4E2ym4ZRqFDboX4mBvOlM5RzJfOegFjCVbnzso3MMRqLxW561EK
         PHfwuAULzl8QJK+/P0bn4g1EzIVMd3QRcJpoobcnUjRkc/qRQ6FTIlQvEpTSzLLiElD8
         vER7p3UAKaX3pdT27L+07gH3vKg1BzgIBic9t7LuoXe/xAWstYmJPed6jN8nqC5fGu8b
         tBqQ==
X-Gm-Message-State: AOJu0YzbZ4+rPyjMOrBosRJQMZQsrlEdkV63ceB3GnVpylsSw3L+TmT+
	oi6Dd9dvm58UlNFaJZXv6A==
X-Google-Smtp-Source: 
 AGHT+IHRxgqmlIcaZxA+uUtss7i4GqToCENI8qvZ/6FLZfO0lFbqJf5Tp34OcuHctKTILzporo4hUw==
X-Received: by 2002:a05:6830:2644:b0:6ba:865b:ca72 with SMTP id
 f4-20020a056830264400b006ba865bca72mr207172otu.31.1699648803023;
        Fri, 10 Nov 2023 12:40:03 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 do2-20020a0568300e0200b006d64467c68asm46743otb.77.2023.11.10.12.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:40:02 -0800 (PST)
Received: (nullmailer pid 393449 invoked by uid 1000);
	Fri, 10 Nov 2023 20:40:00 -0000
Date: Fri, 10 Nov 2023 14:40:00 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>, linux-pwm@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
	Jiri Slaby <jirislaby@kernel.org>, alsa-devel@alsa-project.org,
	Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lars-Peter Clausen <lars@metafoo.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-serial@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
	Jonathan Cameron <jic23@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 05/17] dt-bindings: pinctrl: samsung: add specific
 compatibles for existing SoC
Message-ID: <169964880016.393384.2296633788360305234.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: ZSNI6YAWURY7QACXEETBK63DZR6VVWIQ
X-Message-ID-Hash: ZSNI6YAWURY7QACXEETBK63DZR6VVWIQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSNI6YAWURY7QACXEETBK63DZR6VVWIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Nov 2023 11:43:31 +0100, Krzysztof Kozlowski wrote:
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
>  .../samsung,pinctrl-wakeup-interrupt.yaml     | 24 ++++++++++++-------
>  .../bindings/pinctrl/samsung,pinctrl.yaml     |  3 ++-
>  2 files changed, 17 insertions(+), 10 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

