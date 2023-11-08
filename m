Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AAD7E546C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:48:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F50CE7E;
	Wed,  8 Nov 2023 11:47:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F50CE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440504;
	bh=cZIvs2s3IIFmQ0hNQD1KRCTtjMFqVFKXtyHqPlxB8ic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dSHeuMgy8xtrnhP4eBVcJ8MPucPvzC0739RPaHyuSyDylw2QX2ZkJsFI0gH6aYBjA
	 UMPhnTTLgwfSgor4sg/GdVDp/s+nLqJYlIbS0LI60VvBmTCyPdHVagXaEy7uIxRADR
	 3ap1jJBLtM9LMt5atkY/+zdWeuWvchRyBvgAdo98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41AF1F805FD; Wed,  8 Nov 2023 11:44:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC263F805F0;
	Wed,  8 Nov 2023 11:44:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 120BEF805F0; Wed,  8 Nov 2023 11:44:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F259F805ED
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:44:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F259F805ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dECN+B5l
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32da4ffd7e5so380774f8f.0
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440276; x=1700045076;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGiEI+OsEJo1M0u1Cd6qitBsDMBm2mmYId37rcw3fhE=;
        b=dECN+B5lRqMN98QooORCTTu+WOQ0XDPzQhv2NctZkL1EjkWl23bL0TGbmsXcZfeXlx
         ZfGTK1u8/zI+r7Ryl3B9QoE1EKXQ4VNmiEzY655NQ1NI7xrk/o/93m0mxfLMzW+fqrSS
         tNGZUenyPeSLJO06ywRAORyNzrCalVqD8ED/K+eUfR5yU61GjqWVuasvwx+YHcAmX37Q
         Oxv5gUfQ1pMJz9V7Av3Mw5aHBNcTZc3IKsdvUn5Muylt6wIGMNaThZ4abXHp+2iJno9y
         4JEKyRChtdhGEuC6kBIPuUyqP+DTLbGQhueR4RP9gTjX4kbKEFWUewXlIAFy1/VyYwDH
         VcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440276; x=1700045076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGiEI+OsEJo1M0u1Cd6qitBsDMBm2mmYId37rcw3fhE=;
        b=M3GnJCe5CnhZ8lLTxYCpmk0uIljUiTDPD/t5bWIpPDkTcPcczNqF1VO+q1HAprRyte
         rtTODiYn5Jn/ZB28VK1j0ouHgyxDGQzGbGzpzZEVVHv8sk4p0M0mSSuBXZLIoc0cozOE
         XsLN5zJaYaSaScxOA8PktzNeR5rxGT0LbWYxzX4JIVYQHyXCdjlCe59OKrpU6FTWPNeX
         IXBReHROF7vpJeny0Dp/975JzBkLqCGABLht5i+evN1cteAJiXsyHD/SeSb3Deh0AuZ+
         AdLfF2IS++4LaASxkpVfed9RI8h9xhItX08EHn/ok6PkYnXnoMiFEH3mRiPHWYzplLkv
         xUNg==
X-Gm-Message-State: AOJu0YwS0NZpfr6hZMc3jx+bpMXTs6DOvtWyZAI+CwlM93/jQVb64m8J
	DSIhVV9jcFiuTyxcB/jHnXnKcw==
X-Google-Smtp-Source: 
 AGHT+IH7MQXw4E1mPFEKg813JtQdA84Wn0PvEKQEX8huqjOTZRExGYnzsA13byMaAL83CD1YOh5HLg==
X-Received: by 2002:adf:fd09:0:b0:32f:7beb:d009 with SMTP id
 e9-20020adffd09000000b0032f7bebd009mr1610826wrr.17.1699440276267;
        Wed, 08 Nov 2023 02:44:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
	Thierry Reding <thierry.reding@gmail.com>,
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
	linux-sound@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/17] ASoC: dt-bindings: samsung-i2s: add specific
 compatibles for existing SoC
Date: Wed,  8 Nov 2023 11:43:37 +0100
Message-Id: <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 764Z2T6MIGCGFVDS3GX5EWTHKZUWH5VI
X-Message-ID-Hash: 764Z2T6MIGCGFVDS3GX5EWTHKZUWH5VI
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/764Z2T6MIGCGFVDS3GX5EWTHKZUWH5VI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Samsung Exynos SoC reuses several devices from older designs, thus
historically we kept the old (block's) compatible only.  This works fine
and there is no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to each SoC in front of all old-SoC-like
compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 .../mfd/samsung,exynos5433-lpass.yaml         |  2 +-
 .../bindings/sound/samsung-i2s.yaml           | 19 ++++++++++++-------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
index b97b06848729..f154103f32cc 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
@@ -85,7 +85,7 @@ examples:
         };
 
         i2s@11440000 {
-            compatible = "samsung,exynos7-i2s";
+            compatible = "samsung,exynos5433-i2s", "samsung,exynos7-i2s";
             reg = <0x11440000 0x100>;
             dmas = <&adma 0>, <&adma 2>;
             dma-names = "tx", "rx";
diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
index 30b3b6e9824b..f45f73b5056d 100644
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
@@ -44,13 +44,18 @@ properties:
       frequencies supported by Exynos7 I2S and 7.1 channel TDM support
       for playback and capture TDM (Time division multiplexing) to allow
       transfer of multiple channel audio data on single data line.
-    enum:
-      - samsung,s3c6410-i2s
-      - samsung,s5pv210-i2s
-      - samsung,exynos5420-i2s
-      - samsung,exynos7-i2s
-      - samsung,exynos7-i2s1
-      - tesla,fsd-i2s
+    oneOf:
+      - enum:
+          - samsung,s3c6410-i2s
+          - samsung,s5pv210-i2s
+          - samsung,exynos5420-i2s
+          - samsung,exynos7-i2s
+          - samsung,exynos7-i2s1
+          - tesla,fsd-i2s
+      - items:
+          - enum:
+              - samsung,exynos5433-i2s
+          - const: samsung,exynos7-i2s
 
   '#address-cells':
     const: 1
-- 
2.34.1

