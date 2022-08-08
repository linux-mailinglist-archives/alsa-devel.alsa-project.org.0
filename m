Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FCD58C6EF
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 12:50:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51C2AAEA;
	Mon,  8 Aug 2022 12:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51C2AAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659955829;
	bh=zZCBPHy/qIT18JCWwOObeSapIU4e4ErNu7oQtztp+q4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nFlkKrzZGZ3K+aU9nF3oQ+/iE6rv665zwLPmXstba/pzm1Fd/soC9F8BOUt4nP5yy
	 7xWRKDd2ZX0m7cIqfjcqn3SX7sUjynJ+DHQP9dmIwnBkYv7tbgOprEPx3rlpDTBx93
	 SjaHcWtUAGNQ30PvtLbq+ZM43aKtfOqQfvZAheGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BEEEF8056F;
	Mon,  8 Aug 2022 12:48:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C950F80568; Mon,  8 Aug 2022 12:48:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4DDDF804B1
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 12:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4DDDF804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="W9rPnh7b"
Received: by mail-lf1-x12a.google.com with SMTP id z25so12110882lfr.2
 for <alsa-devel@alsa-project.org>; Mon, 08 Aug 2022 03:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MC2v6NUHdyQnnZYkJCn4LjAypKIo0C8pXGhVxCJJimA=;
 b=W9rPnh7bC1E2NKlPctj5CJl6XHy4ZUkYXokDx3/Y5yxoMPcuCFr+UQ2ZLBxyRfBHpx
 2fAykpcZDEMCmok4jhq1A0Q7r822Vw7OIwnhxgOOyUAyl5usH7tCnO2N4vJ1cAAdmrKr
 8t01asrDC5BVRDPZXYPeeR/SuAx+2SnbyK+jPWbNJDMA25+O7EP5otc5w2ClcuCblXGV
 sR/adjLroM+SMGlbNTsPmF79C0Y7gBjkIvdrKPM3uMZP9qk0t1qECLfuDdgqrAbW8Xv0
 dGfKVARp5SdlZvePRidCQGD8wavpowmm6cfXdPpItSs3NfoydSY5fhvk6+DfrMhH93sq
 SQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MC2v6NUHdyQnnZYkJCn4LjAypKIo0C8pXGhVxCJJimA=;
 b=NflGEy/5UqZcizRFwL9FbrtxDkRBBaq/a80dGA2sCxN0m/lp+SjjhawfjjlWdoHF44
 gi9GLMlP20ak++7BERbaFpZnLGVBp3x7KQxYpcSI8BwfeWzEaZXc1JRrCY4/dvJDOUpu
 EkD2RbK8Hddd/XL9/x3cBDZaowwwD829CQsiEwl+j2+xXlhy4/UvYoDg4dbFu1rg1wgO
 TIxL+Alr1TWMqYTAcrnRGudjgH4GEhhRvoW5h2tPyo1Z9N/V8ZO1wdEzkIihvpejnMjI
 L2SeSC+hj+gj2BQ6HFFxbZmAt6j9j1wNUuFE8Urca+UofV5AQebQogLqzZ/TtbZD0eod
 Im6Q==
X-Gm-Message-State: ACgBeo1eCkNgPAbd3HpG/U55WpnMo7WYTH3jN4GZ5JqJTbUT420O0pg1
 7TDp8W71I7AG1M/9R3RXd7fBog==
X-Google-Smtp-Source: AA6agR4QI9l+GRE03Zrm7i5mh9rcgI/S73YecChrNB3PcmYXz2UlrE8dBO5icUSF5md8laPwJNDO4w==
X-Received: by 2002:a05:6512:2989:b0:48a:f4b9:84bf with SMTP id
 du9-20020a056512298900b0048af4b984bfmr6611596lfb.39.1659955677840; 
 Mon, 08 Aug 2022 03:47:57 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a2ea312000000b0025e040510e7sm1314321lje.74.2022.08.08.03.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 03:47:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, Tim Harvey <tharvey@gateworks.com>,
 Robert Jones <rjones@gateworks.com>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ricardo Rivera-Matos <r-rivera-matos@ti.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 5/5] dt-bindings: Drop Dan Murphy
Date: Mon,  8 Aug 2022 13:47:12 +0300
Message-Id: <20220808104712.54315-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Emails to Dan Murphy bounce ("550 Invalid recipient <dmurphy@ti.com>
(#5.1.1)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/ti,ads124s08.yaml     | 2 +-
 .../devicetree/bindings/leds/leds-class-multicolor.yaml         | 2 +-
 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml         | 2 +-
 Documentation/devicetree/bindings/net/ti,dp83822.yaml           | 2 +-
 Documentation/devicetree/bindings/net/ti,dp83867.yaml           | 2 +-
 Documentation/devicetree/bindings/net/ti,dp83869.yaml           | 2 +-
 Documentation/devicetree/bindings/power/supply/bq2515x.yaml     | 1 -
 Documentation/devicetree/bindings/power/supply/bq25980.yaml     | 1 -
 Documentation/devicetree/bindings/sound/tas2562.yaml            | 2 +-
 Documentation/devicetree/bindings/sound/tlv320adcx140.yaml      | 2 +-
 10 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads124s08.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads124s08.yaml
index 9f5e96439c01..8f50f0f719df 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads124s08.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads124s08.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Texas Instruments' ads124s08 and ads124s06 ADC chip
 
 maintainers:
-  - Dan Murphy <dmurphy@ti.com>
+  - Jonathan Cameron <jic23@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
index 12693483231f..1a9e5bd352c1 100644
--- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Common properties for the multicolor LED class.
 
 maintainers:
-  - Dan Murphy <dmurphy@ti.com>
+  - Pavel Machek <pavel@ucw.cz>
 
 description: |
   Bindings for multi color LEDs show how to describe current outputs of
diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index e0b658f07973..7fdda32d0ff4 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: LED driver for LP50XX RGB LED from Texas Instruments.
 
 maintainers:
-  - Dan Murphy <dmurphy@ti.com>
+  - Pavel Machek <pavel@ucw.cz>
 
 description: |
   The LP50XX is multi-channel, I2C RGB LED Drivers that can group RGB LEDs into
diff --git a/Documentation/devicetree/bindings/net/ti,dp83822.yaml b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
index 75e8712e903a..ac329a9555bf 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83822.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
@@ -8,7 +8,7 @@ $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 title: TI DP83822 ethernet PHY
 
 maintainers:
-  - Dan Murphy <dmurphy@ti.com>
+  - David S. Miller <davem@davemloft.net>
 
 description: |
   The DP83822 is a low-power, single-port, 10/100 Mbps Ethernet PHY. It
diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index 76ff08a477ba..b7a651443543 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -11,7 +11,7 @@ allOf:
   - $ref: "ethernet-controller.yaml#"
 
 maintainers:
-  - Dan Murphy <dmurphy@ti.com>
+  - David S. Miller <davem@davemloft.net>
 
 description: |
   The DP83867 device is a robust, low power, fully featured Physical Layer
diff --git a/Documentation/devicetree/bindings/net/ti,dp83869.yaml b/Documentation/devicetree/bindings/net/ti,dp83869.yaml
index 1b780dce61ab..4f6ad9d30d44 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83869.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83869.yaml
@@ -11,7 +11,7 @@ allOf:
   - $ref: "ethernet-phy.yaml#"
 
 maintainers:
-  - Dan Murphy <dmurphy@ti.com>
+  - David S. Miller <davem@davemloft.net>
 
 description: |
   The DP83869HM device is a robust, fully-featured Gigabit (PHY) transceiver
diff --git a/Documentation/devicetree/bindings/power/supply/bq2515x.yaml b/Documentation/devicetree/bindings/power/supply/bq2515x.yaml
index 27db38577822..4376e6dca48d 100644
--- a/Documentation/devicetree/bindings/power/supply/bq2515x.yaml
+++ b/Documentation/devicetree/bindings/power/supply/bq2515x.yaml
@@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: TI bq2515x 500-mA Linear charger family
 
 maintainers:
-  - Dan Murphy <dmurphy@ti.com>
   - Ricardo Rivera-Matos <r-rivera-matos@ti.com>
 
 description: |
diff --git a/Documentation/devicetree/bindings/power/supply/bq25980.yaml b/Documentation/devicetree/bindings/power/supply/bq25980.yaml
index 4883527ab5c7..509a0667b04e 100644
--- a/Documentation/devicetree/bindings/power/supply/bq25980.yaml
+++ b/Documentation/devicetree/bindings/power/supply/bq25980.yaml
@@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: TI BQ25980 Flash Charger
 
 maintainers:
-  - Dan Murphy <dmurphy@ti.com>
   - Ricardo Rivera-Matos <r-rivera-matos@ti.com>
 
 description: |
diff --git a/Documentation/devicetree/bindings/sound/tas2562.yaml b/Documentation/devicetree/bindings/sound/tas2562.yaml
index 5f7dd5d6cbca..3655d3077dc9 100644
--- a/Documentation/devicetree/bindings/sound/tas2562.yaml
+++ b/Documentation/devicetree/bindings/sound/tas2562.yaml
@@ -8,7 +8,7 @@ $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 title: Texas Instruments TAS2562 Smart PA
 
 maintainers:
-  - Dan Murphy <dmurphy@ti.com>
+  - Mark Brown <broonie@kernel.org>
 
 description: |
   The TAS2562 is a mono, digital input Class-D audio amplifier optimized for
diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
index bc2fb1a80ed7..4ab57c835ba3 100644
--- a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
+++ b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
@@ -8,7 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Texas Instruments TLV320ADCX140 Quad Channel Analog-to-Digital Converter
 
 maintainers:
-  - Dan Murphy <dmurphy@ti.com>
+  - Mark Brown <broonie@kernel.org>
 
 description: |
   The TLV320ADCX140 are multichannel (4-ch analog recording or 8-ch digital
-- 
2.34.1

