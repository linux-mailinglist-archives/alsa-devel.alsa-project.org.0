Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BFB4A2F6A
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 13:26:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E97B179B;
	Sat, 29 Jan 2022 13:25:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E97B179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643459205;
	bh=3DvfaMY3W9pVhODWbUagdlCyMZx1Q+cM147ebesPZg0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wf03eJD/lPOefsJnAkLoaM7w/Re7SjsopAW2/hmcaNLUcSWkQp/zVQ/fw1v9rIY5W
	 2HsXTZERdFwPqc6YowgMRtkPjOAEpRNl7MO5zXjEy6zIMxSLGgxwaIsy+EzZHQkG76
	 xf7+SLUnakRAxncY3hW9r48hf8OUEcYhoHemSDK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EE5EF80162;
	Sat, 29 Jan 2022 13:25:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A06FBF800CE; Sat, 29 Jan 2022 13:25:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 477DEF80511
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 13:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 477DEF80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="IaW3Ldpd"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A21813F1E0
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643459079;
 bh=tXqK0pipG2DbLRjVtcGxzSWNM2TWL5POjuuSkj4vEW8=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=IaW3LdpdbTff9xH8SspyupTT21wzY14hYmcMTrISstTTeAppHtlnBNq7dQWUXOeAG
 SepEfZlb8dgazZKCrpmvNEtnSUiNhYXIOykonRe2ZKhNU1u5n2Glyly3ypG28yMyEs
 zY8/+E2tejh2XywXxB4btPuQQzFqUyq0hNF1+GB8RS4A47G/uikn2LT7Ui7fXtEYmu
 CyQgTY+9RnFyit6lh+GTyc7hCLgcNZ4R+Ox8QfidezL9wIfsXO72ixLjwkyNlZbb7j
 IQBppbrNoy8n78fOcuVKltAU+3ZYAfXdN1vjMIiEejE6D6vXS+ECCD/gFkAx0lC9YH
 gE7Ka7JFiji4Q==
Received: by mail-wm1-f71.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso3047284wmz.0
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 04:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tXqK0pipG2DbLRjVtcGxzSWNM2TWL5POjuuSkj4vEW8=;
 b=RmEICbIkCArfuRjMP0AJBwYcANiRqqe0EomEJIjtE0IOFh9UV2z9PGMAnN8Q7HPR8G
 q0DBVjZl/4gnukvMeDPgurZy8VeticE8ywhfRqDNwF/GsoTpxLg6FgSEs+SsJflfMJCi
 ntVrrJ2vTSSIezTKU0TUIZyaF1vTvLwJDgxmj7doOcr2F8/LYT+g2Q9uvgi9nYpsmDP0
 GG8PccUZD0IZIpXIs6vGvmHlh5rOXzEcsWZ3fapot/UTkDKg6ZBkNHOxF2XI4TkCqDmX
 dNoye6oAIX7FCnxQS2c5X0QNAKT0I422WVC4CTYcW3CYgGf/IdZKHXr7mStyvKifkUIW
 KCKg==
X-Gm-Message-State: AOAM533AvVBtC5hPHyW1zLbKRJpOTl0XIAVlWiwofWAVeHkhpaEA45t7
 lt1Yxd3HxCPsBAHN/n/uMk+6VgZ9z4iceYk5/A5WO2yit4oDGRtHmPZ/8UnI8sMdiDsoopLadZn
 0F0krNsnNT76/7GtINFRVbAJPERMf4BjB1zqiRtZ/
X-Received: by 2002:a7b:c153:: with SMTP id z19mr19068533wmi.118.1643459079231; 
 Sat, 29 Jan 2022 04:24:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdmqfActw14wC7FL3RmrVzbohLPY/HdEUge5K9x5B3jaX/pE3A4wDMlx+joQVK33YEdtkdlQ==
X-Received: by 2002:a7b:c153:: with SMTP id z19mr19068521wmi.118.1643459078995; 
 Sat, 29 Jan 2022 04:24:38 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id m28sm1106875wms.34.2022.01.29.04.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 04:24:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] ASoC: dt-bindings: samsung,tm2: convert to dtschema
Date: Sat, 29 Jan 2022 13:24:30 +0100
Message-Id: <20220129122430.45694-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
References: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
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

