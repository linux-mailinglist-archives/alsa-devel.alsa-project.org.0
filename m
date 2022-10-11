Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F3D5FBAA0
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 20:42:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B43844189;
	Tue, 11 Oct 2022 20:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B43844189
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665513747;
	bh=c7ir3cod2zt+MkQp+ZnXyI6BD6OTK0p37kV92iHjRFM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VzmM1fQ442vCs+CiIVPMCUG0bPdCfrMcBt/Bs2u+Ih16ChTwELrKb1EfwEoTJ4wxB
	 +Cb25x8PF1uFY4Xoquxbp4pV7qn6LvKWznaI1uKCzqfMXm82kV78SAjfIuROYJ2wcH
	 MA/ljSuaXllklfX/fa43/M3GsK9cEVBMol25hhYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28965F80130;
	Tue, 11 Oct 2022 20:41:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E414F801D5; Tue, 11 Oct 2022 20:41:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C9D1F80130
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 20:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C9D1F80130
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-131ea99262dso16960540fac.9
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 11:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4JAJVk0JnsSinL2EcEIankDF1nDr2CRkvvuRQlFNUCo=;
 b=mWdvnzyb4lKH6aR/WG6odvxFYv826DlVRvKz8IN/j0z8ymUbUCaSe2ehKKPfQO+le3
 nRkbmHQVoc7dVF5h1k1j/hno/B3x0y2l3Vvt0rMXHm3JfaTG6gcSafAuKC/qz5FYBBtA
 zjJpjBUJomJI7a2C3jGKZT/+ao7gOPA0I+M8D5am/E0QUNa9eNsE8YcBW+dly5cgcvto
 vkxZtMr3rVQEEanblru6lVdwwByYdica6IR+SSe9U9SFUvtNseBHKuCGSrk7V8oiXj9U
 urHZ3f4CXde/mFGULpgGWYRNyGUVVie87Zxxu+hMgoBgOQMw0C7bEM8GvG7qOle8NNsT
 1vEQ==
X-Gm-Message-State: ACrzQf26kI3WcKZjnoe2WnF9BbFZx51EWvO362WHPPV+yFIIezs097Xz
 8h0rOOzOjW4cLg5OQEC9Cg==
X-Google-Smtp-Source: AMsMyM6NnHYJgkyLWS5L0o44ZzcDSOea6RklSLt6jGqdzkkxoYu8wriiAf7by2811mt0dFqqdYz6Yg==
X-Received: by 2002:a05:6870:424d:b0:132:5c64:dd5a with SMTP id
 v13-20020a056870424d00b001325c64dd5amr344320oac.128.1665513683076; 
 Tue, 11 Oct 2022 11:41:23 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e22-20020a056820061600b00480816a5b8csm117789oow.18.2022.10.11.11.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 11:41:22 -0700 (PDT)
Received: (nullmailer pid 3755271 invoked by uid 1000);
 Tue, 11 Oct 2022 18:41:24 -0000
From: Rob Herring <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [PATCH] ASoC: dt-bindings: Convert dmic-codec to DT schema
Date: Tue, 11 Oct 2022 13:41:19 -0500
Message-Id: <20221011184119.3754096-1-robh@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Convert the dmic-codec binding to DT schema format.

The '#sound-dai-cells' and 'sound-name-prefix' properties were not
documented, but are in use, so add them.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/dmic-codec.yaml | 55 +++++++++++++++++++
 .../devicetree/bindings/sound/dmic.txt        | 22 --------
 2 files changed, 55 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/dmic-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/dmic.txt

diff --git a/Documentation/devicetree/bindings/sound/dmic-codec.yaml b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
new file mode 100644
index 000000000000..767152fa99cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/dmic-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic PDM Digital microphone (DMIC) codec
+
+maintainers:
+  - Arnaud Pouliquen <arnaud.pouliquen@st.com>
+
+allOf:
+  - $ref: name-prefix.yaml#
+
+properties:
+  compatible:
+    const: dmic-codec
+
+  '#sound-dai-cells':
+    const: 0
+
+  dmicen-gpios:
+    description: GPIO specifier for DMIC to control start and stop
+    maxItems: 1
+
+  num-channels:
+    description: Number of microphones on this DAI
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 8
+    default: 8
+
+  modeswitch-delay-ms:
+    description: Delay (in ms) to complete DMIC mode switch
+
+  wakeup-delay-ms:
+    description: Delay (in ms) after enabling the DMIC
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio.h>
+
+    dmic {
+        compatible = "dmic-codec";
+        dmicen-gpios = <&gpio4 3 GPIO_ACTIVE_HIGH>;
+        num-channels = <1>;
+        wakeup-delay-ms <50>;
+        modeswitch-delay-ms <35>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/dmic.txt b/Documentation/devicetree/bindings/sound/dmic.txt
deleted file mode 100644
index 32e871037269..000000000000
--- a/Documentation/devicetree/bindings/sound/dmic.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Device-Tree bindings for Digital microphone (DMIC) codec
-
-This device support generic PDM digital microphone.
-
-Required properties:
-	- compatible: should be "dmic-codec".
-
-Optional properties:
-	- dmicen-gpios: GPIO specifier for dmic to control start and stop
-	- num-channels: Number of microphones on this DAI
-	- wakeup-delay-ms: Delay (in ms) after enabling the DMIC
-	- modeswitch-delay-ms: Delay (in ms) to complete DMIC mode switch
-
-Example node:
-
-	dmic_codec: dmic@0 {
-		compatible = "dmic-codec";
-		dmicen-gpios = <&gpio4 3 GPIO_ACTIVE_HIGH>;
-		num-channels = <1>;
-		wakeup-delay-ms <50>;
-		modeswitch-delay-ms <35>;
-	};
-- 
2.35.1

