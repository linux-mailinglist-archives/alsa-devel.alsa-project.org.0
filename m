Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED71E71650F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 16:50:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9414982B;
	Tue, 30 May 2023 16:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9414982B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685458249;
	bh=z8IyfgIUAkZ0pQWWA/rjiNvjJfBljcBK5q0duiB8SEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BTsaCfkx1kWCqUoIXhgt2Zwx4IMRanHwU2fEZN5CBn8PNAZTN+3Cb4UJb/1PNnMEF
	 XpUpodHWg3kqjWyYw6wFoSJPFhetaLx8XAAJ/4N+X5KdXMlEXoeWjxBG1NJWx4fiL5
	 OVJBZYR1Fc+hB+jzREbNUeOVBJmdjrd+hUIQaVwM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8D55F80568; Tue, 30 May 2023 16:49:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6762AF804FC;
	Tue, 30 May 2023 16:49:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE9B3F80552; Tue, 30 May 2023 16:49:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DAC7F80149
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 16:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DAC7F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=q76h1ZEy
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2afb2874e83so48819591fa.0
        for <alsa-devel@alsa-project.org>;
 Tue, 30 May 2023 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685458139; x=1688050139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlemkSAZzL/U9gKFtrjPiWNMuzaH3xd08e53mEnq57M=;
        b=q76h1ZEyA3kflY8T+tAg6eEkOHLYK0YZTFqFbCCKF2K9iyLput/pxGqmVSlGXhqv7P
         WnAHGN3sBVvANR/w6I/EN92qOLxT7kfA+TYRrbMeQfQ5Ix17P62ma2yKm6N1X7n7zy6a
         9nl5jWppRRrsIKlusdV7Z4xtzwxXfCbcQGTgabenNUfaXkr6pbTiAq/s44M2sqhPwN5Y
         aF2N5hQt6Q2QJHKpFbTR/tFqhDOls0J+/KD33Q68HF2m1O8GZk0L7u6CimkvrwEvNDi8
         9vyiJE+L61MBUJCGSp7RCegRZ1TxnfE/0ySvZZCeQAKuFtx+4L45fUMJd/FEseCp9LT+
         MzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458139; x=1688050139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlemkSAZzL/U9gKFtrjPiWNMuzaH3xd08e53mEnq57M=;
        b=O13dQLTmXEx6eacrVokt8m3C/kfRacDfSy2y5oBCXT+Vf11KwYKrMKKW5TG7TQa4g+
         582Io81cOau+7HD0tTd0LUkHPCUV/VIwj4ttplTxV1jDe2ztp28wjkYdtZxKTrHUIRIU
         2n8YB7XLaw41meTfqEUfQ4XwEnVoF6Nk81UWzpuhil3skgcvKO+7bovq67iZ0L135Qw4
         iIT4HCFovZ1mbykkbkHekrGnbMnalu5BfTJC+PFn/Yc4I5zTEj92E+rORGPZ0i66+oCj
         3Gr49TkRAOasi4bIPoxgO9aIH76Kz5a336Phyf1D187WikuCjSnh9VLVDF/yMFzyG4f5
         /mtA==
X-Gm-Message-State: AC+VfDw0josRqURUsr0mZP7fNSM4Q+0bvuL4cgK9TgzqYYYVZRuY9AyU
	U7T3Ij0UsZAYYdrJU9v9w9rb9g==
X-Google-Smtp-Source: 
 ACHHUZ75iw6ri2Ado2xzCbkAC1E3tQDvSOkgKFSnxjKffw7eTsxcgM6foIzrYPzzNhulhzOltIlCVg==
X-Received: by 2002:a2e:6a17:0:b0:2ac:b63e:94a6 with SMTP id
 f23-20020a2e6a17000000b002acb63e94a6mr966165ljc.21.1685458139198;
        Tue, 30 May 2023 07:48:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id
 q21-20020aa7cc15000000b00514b2717ec6sm631283edt.28.2023.05.30.07.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:48:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
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
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH 1/7] dt-bindings: phy: intel,combo-phy: restrict node name
 suffixes
Date: Tue, 30 May 2023 16:48:45 +0200
Message-Id: <20230530144851.92059-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GVAEFDS6JA2NZDCE3JGG6VYPFISUE5GZ
X-Message-ID-Hash: GVAEFDS6JA2NZDCE3JGG6VYPFISUE5GZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVAEFDS6JA2NZDCE3JGG6VYPFISUE5GZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make the pattern matching node names a bit stricter to improve DTS
consistency.  The pattern is restricted to:
1. Only one unit address or one -N suffix,
2. -N suffixes to decimal numbers.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Tony Lindgren <tony@atomide.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/phy/intel,combo-phy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/intel,combo-phy.yaml b/Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
index 5d54b0a0e873..7dd6a4d94b48 100644
--- a/Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
@@ -15,7 +15,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "combophy(@.*|-[0-9a-f])*$"
+    pattern: "combophy(@.*|-([0-9]|[1-9][0-9]+))?$"
 
   compatible:
     items:
-- 
2.34.1

