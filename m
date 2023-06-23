Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1543273BAC5
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 16:53:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A14E383B;
	Fri, 23 Jun 2023 16:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A14E383B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687531978;
	bh=WH6YqPkayf8gz4I71wfBBMWe1TjP0y4RHpEhAWFu5ys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V3dnRQS03Wx+gZR0RMqpU44bUEpdyfGpU8Ihmqylk5PwMZN7sqB8TvwrrZ1b0Z7OV
	 5MefyiWkwNjPMt9EE/oaVJM14poJJuOZPfRQL7oVf/TUbVhWdWyxHT9XU+Qc1G9sZU
	 8GGLlYztllFzSnVzShivjte3DZgWoF77egzIHsfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1622CF8051E; Fri, 23 Jun 2023 16:52:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 390FAF80132;
	Fri, 23 Jun 2023 16:52:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88794F80141; Fri, 23 Jun 2023 16:52:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3050DF80093
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 16:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3050DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=nZcAJ+sO
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31272fcedf6so723238f8f.2
        for <alsa-devel@alsa-project.org>;
 Fri, 23 Jun 2023 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687531913; x=1690123913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJWtnTqZGQqiTeKl4r3aFL4RAd0yKamdEh9nm3JU/uE=;
        b=nZcAJ+sOqOwPNZAQ60lFA97QCbjofCc+XbSeSieNhhuKrWMtiE/O020aJCaGZig5Lf
         M+2Ra8MPpBVqUhcStWmEYd2ObUzA+kQ3K8H2ePAsYG1JWTf3WWXWaROYVC6t7QX+mx6J
         ESspbYNZ8OxGO/MfZaT0ORXOyftuTisX0q5bz1doEqX176Xd3AyztjKHNHN63UimszRn
         Dqv+xetGcZd2+R0LFeA2aONQHwXzUPMXk9dRWS8mqvQ8vpJvPrOKCvsRr9lGz/T5jW+G
         bbfDKveX+aL7d/d/Okx6QglyYu1YT1lUbE8K9aKT4exUm3nUwLqWGufz9RjrDc1FYimv
         EUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531913; x=1690123913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJWtnTqZGQqiTeKl4r3aFL4RAd0yKamdEh9nm3JU/uE=;
        b=St/ry4V9XrQMtqGvJFl4FXxDBBGKT68cpFkip9GWEkyPjv1mDJ4gTJV2/UtW8YKVfo
         ZDCfI87cr0oM4bFkvq540gE9r5qwLEQNSZj5PX5RDXMbU7XNzNWcjCflwnuyepjkijfM
         aRz1LFogU6uTSCPwR3Ekfo5dMWudzgaCrkPHzb3cOK54DCtxVy/WuDyWzsdwRYlGmEAh
         Olw1NZmk+JzuBq3I7CBnhTtXt1ZB2Wn8eWW5aUD7+DdqTnpG8U3lcYNs9eB5nljRePem
         Xycu1D7u/M8sdOM2KwD4aMHVw9jjqsRQQ/yQNMmhGts3D5Rp/264g41qNJ8vl2dvN4vn
         L4xw==
X-Gm-Message-State: AC+VfDwMhZUvkH++Ya0/2kC7gk9HounuskNMosNa8TZP7KyOXjCv16VA
	xCclgJT3QJjJ7oTxZZkozHs=
X-Google-Smtp-Source: 
 ACHHUZ4EBaf4UIgKOYCqelucvQ5eoSxiLNvK3UwYGIN9g04VxMMagZ6W8cf/YKjEZ8A8mLc9ODWWzg==
X-Received: by 2002:a5d:5642:0:b0:311:13e6:6504 with SMTP id
 j2-20020a5d5642000000b0031113e66504mr14242204wrw.47.1687531913116;
        Fri, 23 Jun 2023 07:51:53 -0700 (PDT)
Received: from localhost
 (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 n11-20020a5d4c4b000000b003113ccbf388sm9844475wrt.13.2023.06.23.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:51:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Dipen Patel <dipenp@nvidia.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Dilip Kota <eswara.kota@linux.intel.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	timestamp@lists.linux.dev,
	linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>,
	Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: (subset) [PATCH 0/7] dt-bindings: restrict node name suffixes
Date: Fri, 23 Jun 2023 16:51:36 +0200
Message-ID: <168753171977.1191890.3520383079920452323.b4-ty@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7FJOEUT6NVOZAIRB2OF3WTFKGAUZW5NH
X-Message-ID-Hash: 7FJOEUT6NVOZAIRB2OF3WTFKGAUZW5NH
X-MailFrom: thierry.reding@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FJOEUT6NVOZAIRB2OF3WTFKGAUZW5NH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 30 May 2023 16:48:44 +0200, Krzysztof Kozlowski wrote:
> Tree-wide cleanup of DTS node name suffixes "-N", e.g. "pwm-5", so we allow
> only decimal numbers.  In few cases narrow the pattern to also disallow
> multiple suffixes, e.g. "pwm-5-5".
> 
> No dependencies, can be applied by individual subsystems.
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> 
> [...]

Applied, thanks!

[2/7] dt-bindings: pwm: restrict node name suffixes
      commit: 05b743db9d8cc4e51b3eb77889d24ab9aa2bf169

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>
