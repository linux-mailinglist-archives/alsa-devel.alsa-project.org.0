Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7678B4985CD
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 18:06:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 028EE28DC;
	Mon, 24 Jan 2022 18:05:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 028EE28DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643043975;
	bh=47Ohb5EhFxovHgqW/3SaOJFk9U+xN5ApNqs8413PZPY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RzUlhA86eE1A1xut3goP7M4h/PCcCQrA910UUfZ63+sxDoXkNS7AGIE0peZP0ML4n
	 ku++LScGHMiiNUKsKGKu/BqtUB7nxkYbzHzIuq8kGkTWOrWTv++6M1NDgRevZ8X3Oi
	 kL7phL04r6U1ptUWxdPIEFsGeUAC/rJzGonEatWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E76BDF80424;
	Mon, 24 Jan 2022 18:04:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8691AF8050F; Mon, 24 Jan 2022 18:04:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 371DAF80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 18:04:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 371DAF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="WvHeSbDZ"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 20CF33F4B4
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 17:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643043860;
 bh=+59EwcCO1RI2K6NXx9nmWMGLlCdcb4Skfl8EoAq/R8s=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=WvHeSbDZFYvLKBAX2ytHoHQfOPhC1QmZ/mR4F5VhSa947wjWm3ihszIir9Ru1LFLt
 pTAxSGcIG6Eu6PvqSwNpH2cAyPlUSutK99sbIRHZnLrWuUl0O8cLkDHNrhKdZSXZUx
 H9yCLqt5UJgIvM1baQ3M1t/nBveVrsfgasnUL5Gx57AUleI/T0C50GfxugnVkwUPJT
 EjackeoOmTHvgYR1WM+KmdKPoqM2VKelkt1q3dnMd0IU4pyc0EUJy5P9AF7Z2kd6ya
 GCn07WUmYN/4a2Z/lM3FyL2mNsFZovyHK7ZLDcOlEJih9LcKtJ/93XtTj+zRF0H0gf
 RgTZIJdFKiWmw==
Received: by mail-ed1-f70.google.com with SMTP id
 k5-20020a508ac5000000b00408dec8390aso760491edk.13
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 09:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+59EwcCO1RI2K6NXx9nmWMGLlCdcb4Skfl8EoAq/R8s=;
 b=5qurmeb+COT8gwT1ZPsII24fM0OrzrYrIOBBwHg6fXp+oGKdLqHOVZ/4fR3WW+AT8g
 /cAQkANegy/gBUGvv1MnkSakfqKnmpysP1G1R+E4JwHxTHzoDuqyTjQsZMGuY75pyB1o
 pHBxZsOSm+gwdvX9kAAtT57i+QN/e0q/Y5zY1cdKQ2RLFWwEeFZN5ieXEd5ehIS7xGeu
 KYxcQVhsbI3KRL3jmrE2G2LIGjD8A6ojkQeKY2TPExdr2M0mrDt3iHLz0QDjbGepM3oj
 jQyn8Sj1JGmy2PfXfT7C6ti1nbUqQmVkqTcMpADzrQtIe2trcIa+hpUH1A05C6/jZPyo
 Yf0Q==
X-Gm-Message-State: AOAM530x6j85MAPcoxbPkCmdppxkAoJgLq+gK/lZZaz0pbJWseJzx2B5
 wMYwdBRZroGuL6T4V4oyKQrxd3+gcqx8GLrJiHuMNXkM1WFNOt64R0z87iRYF4hvrWMBP/TVSp7
 vMiPl17NYHieQEANjnd/Eps7BEdPCRM22tfgB/w7d
X-Received: by 2002:a17:907:97c4:: with SMTP id
 js4mr7790582ejc.586.1643043859694; 
 Mon, 24 Jan 2022 09:04:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6bIUyqSYlsbbcqUfcmbGdWW0EqG6ljBFLpi0TFeXsvlHolU79XgsL0Uo+9k2arEBqkIsRjA==
X-Received: by 2002:a17:907:97c4:: with SMTP id
 js4mr7790564ejc.586.1643043859512; 
 Mon, 24 Jan 2022 09:04:19 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id o11sm6903846edh.75.2022.01.24.09.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:04:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] ASoC: dt-bindings: samsung,
 aries-wm8994: require sound-dai property
Date: Mon, 24 Jan 2022 18:03:31 +0100
Message-Id: <20220124170336.164320-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The cpu and codec nodes must provide sound-dai property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/sound/samsung,aries-wm8994.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
index eb487ed3ca3b..d5cc221787cf 100644
--- a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
@@ -33,6 +33,8 @@ properties:
         description: |
           phandles to the I2S controller and bluetooth codec,
           in that order
+    required:
+      - sound-dai
 
   codec:
     type: object
@@ -40,6 +42,8 @@ properties:
       sound-dai:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         description: phandle to the WM8994 CODEC
+    required:
+      - sound-dai
 
   samsung,audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.32.0

