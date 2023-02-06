Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA60668C1BB
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 16:37:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93145847;
	Mon,  6 Feb 2023 16:36:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93145847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675697819;
	bh=zY0iY+G07E1myJRJsrwN7A2qrE25LN3wHEiGh650yc4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ijoPdxWpuZEJLp04WYe7YqfLaSwtmkueNbb9DKYvR3GphW0BkmoPOyZI9VQOd9yA6
	 KSTJQH9wouZRLkvgMPxj+iAPpJ1fsOuF+FWO67arxHBO56Guldjq7SA4BaP6K3kA5Q
	 Uy2/yleWDBIF+wihHIq5ifitS3gvU0bjTYlFeoc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B482AF804F1;
	Mon,  6 Feb 2023 16:35:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45180F80553; Mon,  6 Feb 2023 16:35:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6286F80533
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 16:35:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6286F80533
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=DF2kl/z4
Received: by mail-wr1-x42a.google.com with SMTP id bk16so10741948wrb.11
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 07:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TSetshJjjOCUEIKAC3y6Jd2w3OFuVdwQxsqwKM0nNPk=;
 b=DF2kl/z4u0Sf4GSrWNz7iII+vAY/9yZbW9EGuA/Y7QCb4I2P6BuqVruEXU6FllIkqr
 WRQWVp0XisQCu4yeSvlJ3WIeon4DNVRfx31I110Ta/d+BWCBrVF3h47eLMuJWGPzYCkW
 JSDmie+fzeirMCfn60qEyj02s9XmnAfyLPDQUdqjxM7btnUnU9V7IXRbZB1hrRrEQJSA
 CW/ONGkFid9kVY/swtYfrDEdt4fGATKh4t4jQ3ewM3Nb6X9yFW6uyEteNOCvJwV4yDhR
 UEFDJSAfiSQOI68jntVNZTGYyZm13Jh9HnVsUEf9+DyOyTLYpqBXXII1uJ9s36a5KI+d
 w18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TSetshJjjOCUEIKAC3y6Jd2w3OFuVdwQxsqwKM0nNPk=;
 b=jwMv+iOknEp0LVen7417zfcTW0U4i3hI0pG6ybhutQ1w2X/MmCnIWEcTN20/lSwnbY
 HGOqrxKd/iy5fmfwGxOBODUDc47jQBc5lmZp+5vkKdJ90sCd9qnYeEBCtad/bCOCYhzx
 41lS8A8tgtZn7U/Ti+cSRyGgyM2IytGeXYYWrPS/g5nElWhI8SZvwHx45EsRHEMYRODI
 UHSlC4VMi7qraPiL71fQe7J7NCGOYwJgZB0HBGtD8JGYeLcpsRlRmj2gI+VPbEJgoOrW
 NdDL/IJsRw9k4i+O/7Xyutq1RJ4ZlznaOARmYToaVEL4EzrnxC8zUI9JQpStc1/Eaxyz
 Zr2Q==
X-Gm-Message-State: AO0yUKVgaGwkezdJhsyXkx7uFXPzKPrhKW6EezrYVRFYoS+SvNFqXy5j
 ER9P3r1K0UPoma/OTLvJqGuvUQ==
X-Google-Smtp-Source: AK7set95zmZiBk8GHsRpnlQeK89f2HnixG9gs3/a5GcPX/Yei6UJ7WJbZ7gMTtbxA6agHpVaTrLdjA==
X-Received: by 2002:a5d:6d05:0:b0:2bf:dd84:adf6 with SMTP id
 e5-20020a5d6d05000000b002bfdd84adf6mr21966221wrq.60.1675697702967; 
 Mon, 06 Feb 2023 07:35:02 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 07:35:02 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 7/7] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Date: Mon,  6 Feb 2023 16:34:49 +0100
Message-Id: <20230206153449.596326-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230206153449.596326-1-jbrunet@baylibre.com>
References: <20230206153449.596326-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Convert the DT binding documentation for the Amlogic axg sound card to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
 .../sound/amlogic,axg-sound-card.yaml         | 183 ++++++++++++++++++
 2 files changed, 183 insertions(+), 124 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
deleted file mode 100644
index 80b411296480..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
+++ /dev/null
@@ -1,124 +0,0 @@
-Amlogic AXG sound card:
-
-Required properties:
-
-- compatible: "amlogic,axg-sound-card"
-- model : User specified audio sound card name, one string
-
-Optional properties:
-
-- audio-aux-devs : List of phandles pointing to auxiliary devices
-- audio-widgets : Please refer to widgets.txt.
-- audio-routing : A list of the connections between audio components.
-
-Subnodes:
-
-- dai-link: Container for dai-link level properties and the CODEC
-	    sub-nodes. There should be at least one (and probably more)
-	    subnode of this type.
-
-Required dai-link properties:
-
-- sound-dai: phandle and port of the CPU DAI.
-
-Required TDM Backend dai-link properties:
-- dai-format : CPU/CODEC common audio format
-
-Optional TDM Backend dai-link properties:
-- dai-tdm-slot-rx-mask-{0,1,2,3}: Receive direction slot masks
-- dai-tdm-slot-tx-mask-{0,1,2,3}: Transmit direction slot masks
-				  When omitted, mask is assumed to have to no
-				  slots. A valid must have at one slot, so at
-				  least one these mask should be provided with
-				  an enabled slot.
-- dai-tdm-slot-num : Please refer to tdm-slot.txt.
-		     If omitted, slot number is set to accommodate the largest
-		     mask provided.
-- dai-tdm-slot-width : Please refer to tdm-slot.txt. default to 32 if omitted.
-- mclk-fs : Multiplication factor between stream rate and mclk
-
-Backend dai-link subnodes:
-
-- codec: dai-link representing backend links should have at least one subnode.
-	 One subnode for each codec of the dai-link.
-	 dai-link representing frontend links have no codec, therefore have no
-	 subnodes
-
-Required codec subnodes properties:
-
-- sound-dai: phandle and port of the CODEC DAI.
-
-Optional codec subnodes properties:
-
-- dai-tdm-slot-tx-mask : Please refer to tdm-slot.txt.
-- dai-tdm-slot-rx-mask : Please refer to tdm-slot.txt.
-
-Example:
-
-sound {
-	compatible = "amlogic,axg-sound-card";
-	model = "AXG-S420";
-	audio-aux-devs = <&tdmin_a>, <&tdmout_c>;
-	audio-widgets = "Line", "Lineout",
-			"Line", "Linein",
-			"Speaker", "Speaker1 Left",
-			"Speaker", "Speaker1 Right";
-			"Speaker", "Speaker2 Left",
-			"Speaker", "Speaker2 Right";
-	audio-routing = "TDMOUT_C IN 0", "FRDDR_A OUT 2",
-			"SPDIFOUT IN 0", "FRDDR_A OUT 3",
-			"TDM_C Playback", "TDMOUT_C OUT",
-			"TDMIN_A IN 2", "TDM_C Capture",
-			"TDMIN_A IN 5", "TDM_C Loopback",
-			"TODDR_A IN 0", "TDMIN_A OUT",
-			"Lineout", "Lineout AOUTL",
-			"Lineout", "Lineout AOUTR",
-			"Speaker1 Left", "SPK1 OUT_A",
-			"Speaker2 Left", "SPK2 OUT_A",
-			"Speaker1 Right", "SPK1 OUT_B",
-			"Speaker2 Right", "SPK2 OUT_B",
-			"Linein AINL", "Linein",
-			"Linein AINR", "Linein";
-
-	dai-link@0 {
-		sound-dai = <&frddr_a>;
-	};
-
-	dai-link@1 {
-		sound-dai = <&toddr_a>;
-	};
-
-	dai-link@2 {
-		sound-dai = <&tdmif_c>;
-		dai-format = "i2s";
-		dai-tdm-slot-tx-mask-2 = <1 1>;
-		dai-tdm-slot-tx-mask-3 = <1 1>;
-		dai-tdm-slot-rx-mask-1 = <1 1>;
-		mclk-fs = <256>;
-
-		codec@0 {
-			sound-dai = <&lineout>;
-		};
-
-		codec@1 {
-			sound-dai = <&speaker_amp1>;
-		};
-
-		codec@2 {
-			sound-dai = <&speaker_amp2>;
-		};
-
-		codec@3 {
-			sound-dai = <&linein>;
-		};
-
-	};
-
-	dai-link@3 {
-		sound-dai = <&spdifout>;
-
-		codec {
-			sound-dai = <&spdif_dit>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
new file mode 100644
index 000000000000..b7459fad0e7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
@@ -0,0 +1,183 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic AXG sound card
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  compatible:
+    const: amlogic,axg-sound-card
+
+  audio-aux-devs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: list of auxiliary devices
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+
+  audio-widgets:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list off component DAPM widget. Each entry is a pair of strings,
+      the first being the widget type, the second being the widget name
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+patternProperties:
+  "^dai-link-[0-9]+$":
+    type: object
+    additionalProperties: false
+    description: |
+      Container for dai-link level properties and the CODEC sub-nodes.
+      There should be at least one (and probably more) subnode of this type
+
+    properties:
+      dai-format:
+        $ref: /schemas/types.yaml#/definitions/string
+        enum: [ i2s, left-j, dsp_a ]
+
+      dai-tdm-slot-num:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Number of slots in use. If omitted, slot number is set to
+          accommodate the largest mask provided.
+        maximum: 32
+
+      dai-tdm-slot-width:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Width in bits for each slot
+        enum: [ 8, 16, 20, 24, 32 ]
+        default: 32
+
+      mclk-fs:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Multiplication factor between the frame rate and master clock
+          rate
+
+      sound-dai:
+        maxItems: 1
+        description: phandle of the CPU DAI
+
+    patternProperties:
+      "^dai-tdm-slot-(t|r)x-mask-[0-3]$":
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 32
+        description: |
+          Transmit and receive cpu slot masks of each TDM lane
+          When omitted, mask is assumed to have to no slots. A valid
+          interface must have at least one slot, so at least one these
+          mask should be provided with an enabled slot.
+
+      "^codec(-[0-9]+)?$":
+        type: object
+        additionalProperties: false
+        description: |
+          dai-link representing backend links should have at least one subnode.
+          One subnode for each codec of the dai-link. dai-link representing
+          frontend links have no codec, therefore have no subnodes
+
+        properties:
+          sound-dai:
+            maxItems: 1
+            description: phandle of the codec DAI
+
+        patternProperties:
+          "^dai-tdm-slot-(t|r)x-mask$":
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            minItems: 1
+            maxItems: 32
+            description: Transmit and receive codec slot masks
+
+        required:
+          - sound-dai
+
+    required:
+      - sound-dai
+
+required:
+  - model
+  - dai-link-0
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "amlogic,axg-sound-card";
+        model = "AXG-S420";
+        audio-aux-devs = <&tdmin_a>, <&tdmout_c>;
+        audio-widgets = "Line", "Lineout",
+                        "Line", "Linein",
+                        "Speaker", "Speaker1 Left",
+                        "Speaker", "Speaker1 Right",
+                        "Speaker", "Speaker2 Left",
+                        "Speaker", "Speaker2 Right";
+        audio-routing = "TDMOUT_C IN 0", "FRDDR_A OUT 2",
+                        "SPDIFOUT IN 0", "FRDDR_A OUT 3",
+                        "TDM_C Playback", "TDMOUT_C OUT",
+                        "TDMIN_A IN 2", "TDM_C Capture",
+                        "TDMIN_A IN 5", "TDM_C Loopback",
+                        "TODDR_A IN 0", "TDMIN_A OUT",
+                        "Lineout", "Lineout AOUTL",
+                        "Lineout", "Lineout AOUTR",
+                        "Speaker1 Left", "SPK1 OUT_A",
+                        "Speaker2 Left", "SPK2 OUT_A",
+                        "Speaker1 Right", "SPK1 OUT_B",
+                        "Speaker2 Right", "SPK2 OUT_B",
+                        "Linein AINL", "Linein",
+                        "Linein AINR", "Linein";
+
+        dai-link-0 {
+            sound-dai = <&frddr_a>;
+        };
+
+        dai-link-1 {
+            sound-dai = <&toddr_a>;
+        };
+
+        dai-link-2 {
+            sound-dai = <&tdmif_c>;
+            dai-format = "i2s";
+            dai-tdm-slot-tx-mask-2 = <1 1>;
+            dai-tdm-slot-tx-mask-3 = <1 1>;
+            dai-tdm-slot-rx-mask-1 = <1 1>;
+            mclk-fs = <256>;
+
+            codec-0 {
+                sound-dai = <&lineout>;
+            };
+
+            codec-1 {
+                sound-dai = <&speaker_amp1>;
+            };
+
+            codec-2 {
+                sound-dai = <&speaker_amp2>;
+            };
+
+            codec-3 {
+                sound-dai = <&linein>;
+            };
+        };
+
+        dai-link-3 {
+            sound-dai = <&spdifout>;
+
+            codec {
+                sound-dai = <&spdif_dit>;
+            };
+        };
+    };
-- 
2.39.0

