Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 028224985DD
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 18:07:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3E8163A;
	Mon, 24 Jan 2022 18:06:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3E8163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643044027;
	bh=3DvfaMY3W9pVhODWbUagdlCyMZx1Q+cM147ebesPZg0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l4krdAICw+s2nrH8wBjC842dlLW9Aeh6377ZFvDOIPPIHQLsopLEjAZaj7GV6lqQO
	 jpioITlC0tm1X6GsK5q7j0rr1tZ9X9gPTU2vE5YQM3Ho48fM+NkxTZ7SQKYvCZFjB7
	 sxrf10zwx7pNXX835ielQKGN0E+OpvIvMFWL/hII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9B9BF80527;
	Mon, 24 Jan 2022 18:04:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C62EFF80525; Mon, 24 Jan 2022 18:04:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05A13F80517
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 18:04:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05A13F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="cJpOrBPo"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 54D793FFFD
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 17:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643043869;
 bh=tXqK0pipG2DbLRjVtcGxzSWNM2TWL5POjuuSkj4vEW8=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=cJpOrBPoyMpgaIMBUKgrGNMt6w3UvvSimrkwVFwIZZv48KB+GjVukAVJalXBCnr2o
 UCmNB5aIIykOtRAYDEEt3Ho7ydfh3BkuVuTEsn7nFHAxWXTCN9DBTjnmAiyc355/Fd
 TybYjyGOmVFoK8LCdn3Jlsj85u353eBd2xG/fSnA9AWNZHiyDUjmz8PvrHT/jvso2F
 4L9YLlxPKJQMT1hJ5TA+mCdifEKey8wN5K+d3fn0fTvmZ1UkKjwf1y+lHrw1R8NSUo
 m2MXia/UOVhnADuGw//yRgcTkGI1Gxwu6JCW3Aa9NyHFl7P7c52HC5UGIxfZMOeupt
 yar7SgJ2jyKzg==
Received: by mail-ed1-f71.google.com with SMTP id
 c11-20020a056402120b00b0040321cea9d4so13455925edw.23
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 09:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tXqK0pipG2DbLRjVtcGxzSWNM2TWL5POjuuSkj4vEW8=;
 b=04JJ4/ucQz3AXemDrfORRo7ilL07RpX2tSn8gvrSV8CMCGesb6yz3EKsKah5EXTb2G
 WvWx3c4QrQTCjllHn0d9aetAWtHMomddG/1FnWmudcvMYqWZKtTMs1+5VjAA/LT4T9ew
 iZYRezKLXm58e7GzpJtD106NDw9t0bQbAwHd9Mda6aT1g+w2yy5u4kp+X2mxDTUk6qO5
 NyPD+oAHC3InpD4AuQ3LvOGmHl39wHHgQcntwB0ksf52gN/hyZbJymEZJt5ouJ6ZjbYm
 JKwp4eBX/VoQlx1q0cm33bNp5+nk7yDZuE4bRavATLsl4CnpP12qR/Uq4HHbptMx4Rbm
 cs8g==
X-Gm-Message-State: AOAM532IXeLnzGjxOAAKtmCZkNUn143YJBJ98tOqF9ScZRfLAIAOkzFV
 tbvYtxio4miy5/xb4VtLERAzMKOLRn3IJc0a5pq2aRveqyHA347uG2Iw9nj+RCx0hjp3x3l1jmj
 wMYRhW4Nneia4N5uBvGaAlO6wWq+N4fMoEYPXd3IA
X-Received: by 2002:a17:907:62a1:: with SMTP id
 nd33mr13076926ejc.578.1643043867803; 
 Mon, 24 Jan 2022 09:04:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXf92USALcbrXLrv5+/4JqlVrxe0UnW/ZBZv+jrm84Km565mZiaUpixrWAnqJJLbn1fOdrOw==
X-Received: by 2002:a17:907:62a1:: with SMTP id
 nd33mr13076897ejc.578.1643043867500; 
 Mon, 24 Jan 2022 09:04:27 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id o11sm6903846edh.75.2022.01.24.09.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:04:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] ASoC: dt-bindings: samsung,tm2: convert to dtschema
Date: Mon, 24 Jan 2022 18:03:36 +0100
Message-Id: <20220124170336.164320-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124170336.164320-1-krzysztof.kozlowski@canonical.com>
References: <20220124170336.164320-1-krzysztof.kozlowski@canonical.com>
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

Convert the audio complex on Samsung TM2 boards with Samsung Exynos SoC
to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/sound/samsung,tm2-audio.txt      | 42 ----------
 .../bindings/sound/samsung,tm2.yaml           | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
deleted file mode 100644
index f5ccc12ddc00..000000000000
--- a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Samsung Exynos5433 TM2(E) audio complex with WM5110 codec
-
-Required properties:
-
- - compatible		 : "samsung,tm2-audio"
- - model		 : the user-visible name of this sound complex
- - audio-codec		 : the first entry should be phandle of the wm5110 audio
-			   codec node, as described in ../mfd/arizona.txt;
-			   the second entry should be phandle of the HDMI
-			   transmitter node
- - i2s-controller	 : the list of phandle and argument tuples pointing to
-			   I2S controllers, the first entry should be I2S0 and
-			   the second one I2S1
- - audio-amplifier	 : the phandle of the MAX98504 amplifier
- - samsung,audio-routing : a list of the connections between audio components;
-			   each entry is a pair of strings, the first being the
-			   connection's sink, the second being the connection's
-			   source; valid names for sources and sinks are the
-			   WM5110's and MAX98504's pins and the jacks on the
-			   board: HP, SPK, Main Mic, Sub Mic, Third Mic,
-			   Headset Mic
- - mic-bias-gpios	 : GPIO pin that enables the Main Mic bias regulator
-
-
-Example:
-
-sound {
-	compatible = "samsung,tm2-audio";
-	audio-codec = <&wm5110>, <&hdmi>;
-	i2s-controller = <&i2s0 0>, <&i2s1 0>;
-	audio-amplifier = <&max98504>;
-	mic-bias-gpios = <&gpr3 2 0>;
-	model = "wm5110";
-	samsung,audio-routing =
-		"HP", "HPOUT1L",
-		"HP", "HPOUT1R",
-		"SPK", "SPKOUT",
-		"SPKOUT", "HPOUT2L",
-		"SPKOUT", "HPOUT2R",
-		"Main Mic", "MICBIAS2",
-		"IN1R", "Main Mic";
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
new file mode 100644
index 000000000000..74712d6f3ef4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,tm2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos5433 TM2(E) audio complex with WM5110 codec
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    const: samsung,tm2-audio
+
+  audio-amplifier:
+    description: Phandle to the MAX98504 amplifier.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  audio-codec:
+    description: Phandles to the codecs.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - description: Phandle to the WM5110 audio codec.
+      - description: Phandle to the HDMI transmitter node.
+
+  samsung,audio-routing:
+    description: |
+      List of the connections between audio components; each entry is
+      a pair of strings, the first being the connection's sink, the second
+      being the connection's source; valid names for sources and sinks are the
+      WM5110's and MAX98504's pins and the jacks on the board: HP, SPK, Main
+      Mic, Sub Mic, Third Mic, Headset Mic.
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+
+  i2s-controller:
+    description: Phandles to the I2S controllers.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - description: Phandle to I2S0.
+      - description: Phandle to I2S1.
+
+  mic-bias-gpios:
+    description: GPIO pin that enables the Main Mic bias regulator.
+
+  model:
+    description: The user-visible name of this sound complex.
+    $ref: /schemas/types.yaml#/definitions/string
+
+required:
+  - compatible
+  - audio-amplifier
+  - audio-codec
+  - samsung,audio-routing
+  - i2s-controller
+  - mic-bias-gpios
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    sound {
+        compatible = "samsung,tm2-audio";
+        audio-codec = <&wm5110>, <&hdmi>;
+        i2s-controller = <&i2s0 0>, <&i2s1 0>;
+        audio-amplifier = <&max98504>;
+        mic-bias-gpios = <&gpr3 2 GPIO_ACTIVE_HIGH>;
+        model = "wm5110";
+        samsung,audio-routing = "HP", "HPOUT1L",
+                                "HP", "HPOUT1R",
+                                "SPK", "SPKOUT",
+                                "SPKOUT", "HPOUT2L",
+                                "SPKOUT", "HPOUT2R",
+                                "RCV", "HPOUT3L",
+                                "RCV", "HPOUT3R";
+    };
-- 
2.32.0

