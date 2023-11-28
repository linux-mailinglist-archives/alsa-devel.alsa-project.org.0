Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5448A7FC099
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 18:50:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09CE8DEC;
	Tue, 28 Nov 2023 18:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09CE8DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701193821;
	bh=PBUNz8N/K7q4JL06xBR9ogC/lO9T7WaVOkWHXF6xgtI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=G5XOHiQ8jKoHeLv4X24O1Q9m7zDEWKjl8zRMDqQVGRytP0T+7P6jGTlIb18G+Oml0
	 Lcjx44n4BmuDjlvknVVBIdNzI/Z+MvznOnoqJ9/8WiS+1BuBUOCMcQoVcfJpjSG8jE
	 UvqDna8TVmxjVfJuX380CJW+acwC55u6aFcAB1TM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5705FF805A0; Tue, 28 Nov 2023 18:49:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FDC5F80579;
	Tue, 28 Nov 2023 18:49:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8F31F80236; Tue, 28 Nov 2023 18:49:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FBF2F8016E
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 18:49:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FBF2F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YYQ7Oxdx
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a002562bd8bso4990766b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Nov 2023 09:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701193772; x=1701798572;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Q6ar52kT12/oSOUgsQunGkK9992ePoRC0ssPbZWDgw=;
        b=YYQ7OxdxHYvXedEiee9mL87kH6j+7FMjpZBeF6SZj6kO+h8x9Fm/0J+xDoUpPRw9Gf
         bzY3ooKGfvdqACYNz6hMZtqFLI0Hnj9MdvMokgghnV08TAMaDbB40pKWRrmq36tcDGOY
         WiQmhKJNKIPGv0q+k95jRVzR+eQB6nm0H7H0loPmZAPNiXsHMcHin/oyHRqzEWT169Zt
         TDEBpLiZ5QNoXBaEuz7SCMfFr3QWk9tRe921LIqqjXFrJGz4EFBtxG+rP0hJ8/xwAORW
         bEZJ9cHRTz/2T4Y1TJDMUW+XAnlIEdTRuwsEDZwMRJ2GXPAUm12ob+jwyS4419eidkd6
         SRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701193772; x=1701798572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Q6ar52kT12/oSOUgsQunGkK9992ePoRC0ssPbZWDgw=;
        b=iOuCb5AigEnhiUYl2v3JELuaivLUCE7FOwzW5SDXq7O2HqjcjDGI2k7ga88sALxO3l
         rqI23+YAsGqL9m4kVXSvlG9M0TuRmyX+gwYT0QRSoHvbVDQpcFQ+t8gzjfRj1RYmiv59
         RdVbPwZUOg/cMf4xQwaQSBQjdp+HTAHKqUMo7xq0ltk3bJ17D4sbKLddaKe7qTK+QUWK
         LVVVf1xmjeldCMVF6AD1ROZRMKFkllB0BebLRTXjEmhZM/nL9ksWzhw3y73JWk+NWep8
         of0do/ar0tX029EVhouyQILAd84qK/twgedbOGy3t/iKnYPc8IqMmbH7Ui3ekY1Gs8An
         zR4A==
X-Gm-Message-State: AOJu0Yz4Il+9pEm9DXKEjGzcVqqu7wdlFF6tMFS5IUyFo79Y6fk0tQqa
	vU/eGQoz7EPK8uxRGeSrGjA=
X-Google-Smtp-Source: 
 AGHT+IFegfjLsT1XNjq4u1dJkNE5gSVojRjltbsyE47RsYa/oKV+OirEmiPZK9QlSr1+eKKQQmVk8w==
X-Received: by 2002:a17:906:f811:b0:a0f:1882:d5e with SMTP id
 kh17-20020a170906f81100b00a0f18820d5emr5384410ejb.37.1701193772296;
        Tue, 28 Nov 2023 09:49:32 -0800 (PST)
Received: from localhost
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 cm26-20020a0564020c9a00b0054ae75dcd6bsm5742280edb.95.2023.11.28.09.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 09:49:30 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 00/17] dt-bindings: samsung: add specific
 compatibles for existing SoC
Date: Tue, 28 Nov 2023 18:49:23 +0100
Message-ID: <170119374454.445690.515311393756577368.b4-ty@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XAN6S377SS2KSP7O6RB3QX2OLHLJHPPL
X-Message-ID-Hash: XAN6S377SS2KSP7O6RB3QX2OLHLJHPPL
X-MailFrom: thierry.reding@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XAN6S377SS2KSP7O6RB3QX2OLHLJHPPL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Nov 2023 11:43:26 +0100, Krzysztof Kozlowski wrote:
> Merging
> =======
> I propose to take entire patchset through my tree (Samsung SoC), because:
> 1. Next cycle two new SoCs will be coming (Google GS101 and ExynosAutov920), so
>    they will touch the same lines in some of the DT bindings (not all, though).
>    It is reasonable for me to take the bindings for the new SoCs, to have clean
>    `make dtbs_check` on the new DTS.
> 2. Having it together helps me to have clean `make dtbs_check` within my tree
>    on the existing DTS.
> 3. No drivers are affected by this change.
> 4. I plan to do the same for Tesla FSD and Exynos ARM32 SoCs, thus expect
>    follow up patchsets.
> 
> [...]

Applied, thanks!

[12/17] dt-bindings: pwm: samsung: add specific compatibles for existing SoC
        commit: 5d67b8f81b9d598599366214e3b2eb5f84003c9f

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>
