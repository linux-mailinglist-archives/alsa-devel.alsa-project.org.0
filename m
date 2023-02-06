Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E2E68C1C0
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 16:37:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A0F586E;
	Mon,  6 Feb 2023 16:36:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A0F586E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675697844;
	bh=8sTEt65soMQuxKySIjS2Ni35T54pUlJxCpjrePh+na8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p+yvcrsYaKzflXUJouda7tf7divWLxsvOrXtMql5hphlbNq84+xbGDP44yWpaLtwq
	 udPNvlZU6mT6TybUNu8+UZYBpOaI8ltNtyzrKueg2L+0gk+trN0FgLlADmcc4IGVlH
	 UfnvfrpfYjt6fXmwzuVlCSQ17MWtz3tWPuZn9h74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1B7EF804FB;
	Mon,  6 Feb 2023 16:35:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A208BF80558; Mon,  6 Feb 2023 16:35:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65868F804F1
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 16:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65868F804F1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=U6oXxdfl
Received: by mail-wr1-x42b.google.com with SMTP id r2so10755826wrv.7
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 07:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7uq9H1tcXk6HETzwlofFPzIzEQPctitFjzIM/SIe7Gs=;
 b=U6oXxdflVh5EjAdAf9l2pohgICfOD56RXCSxtpKDoY6tFpJdY/gtAZOnQMBC1hZLlZ
 ZLJk3wTnMot8h5o9wl6lf4NIlAOmMdFCtXnqHXuQH8kNmOUT4bw5+tiMxfqKgLJD2chS
 bmEPFvzK2/u99cpb97W8PbrplYKtbqSdY0KZxnijuhiKQ6tEdWiQyN9SGpFjaByD9zfI
 zUY1nBPeEbvWWZYEoEDAVWGZkZwj7myD+J+2Zk2KdR3jOBQrbR87rZnbJlEbOZWGN68v
 l+Z16QUCgqmtb8qbVP7N7PrHy36uks9vsqFg7sBqviYhqLu7ytBC96wwEarnGlO2J4M9
 tA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7uq9H1tcXk6HETzwlofFPzIzEQPctitFjzIM/SIe7Gs=;
 b=ebjbR/UxcIVag66dHzTuDe92KR3i2zvx3vetLOP46iaztX2eD4SRNwgapIs+OsmxOK
 x75NJijttCvuexrZhxI1NTs/WSxeWxkIDVshJfnCyoqKVs/YdAPFIMCa0FkmbgvURmZ3
 4i84X4rBonrISzuciqXqh7w/ssmo6XuqMIZ84KOxuUs+5aFklzQfskplr2X8VFSOInUu
 RwvaICf+U2c7Xkk0jUGEGQbQG6IOD4XcrntHH/dewmWVzHEXGUG9HeD3VxKXaNr1LWAp
 1Axn3tFIl05ewXVKcpMLP0S3Tbow2DM1avPtfnJAtR+e1Zwo8Jlij/Lgevi6k8pT3Cs7
 3lkA==
X-Gm-Message-State: AO0yUKVb4TAfrwtZlcvNvoO6RASRLHKY09VhXplRcDeLkLc2ii4noWJT
 BFzAT5tLaWlpGgZx9FEDuuKIFQ==
X-Google-Smtp-Source: AK7set/3gt+QIgKlnSPPhK6wmHyjE44gaTTK4Jxmfzqi39RNTb6+xUx4RIEYembGamlVtVI4ulVwDg==
X-Received: by 2002:a05:6000:118c:b0:2c3:eaff:aae8 with SMTP id
 g12-20020a056000118c00b002c3eaffaae8mr3587288wrx.18.1675697700681; 
 Mon, 06 Feb 2023 07:35:00 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 07:35:00 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 4/7] ASoC: dt-bindings: meson: convert axg fifo to schema
Date: Mon,  6 Feb 2023 16:34:46 +0100
Message-Id: <20230206153449.596326-5-jbrunet@baylibre.com>
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

Convert the DT binding documentation for the Amlogic axg audio FIFOs to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-fifo.txt       |  34 ------
 .../bindings/sound/amlogic,axg-fifo.yaml      | 112 ++++++++++++++++++
 2 files changed, 112 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
deleted file mode 100644
index fa4545ed81ca..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-* Amlogic Audio FIFO controllers
-
-Required properties:
-- compatible: 'amlogic,axg-toddr' or
-	      'amlogic,axg-toddr' or
-	      'amlogic,g12a-frddr' or
-	      'amlogic,g12a-toddr' or
-	      'amlogic,sm1-frddr' or
-	      'amlogic,sm1-toddr'
-- reg: physical base address of the controller and length of memory
-       mapped region.
-- interrupts: interrupt specifier for the fifo.
-- clocks: phandle to the fifo peripheral clock provided by the audio
-	  clock controller.
-- resets: list of reset phandle, one for each entry reset-names.
-- reset-names: should contain the following:
-  * "arb" : memory ARB line (required)
-  * "rst" : dedicated device reset line (optional)
-- #sound-dai-cells: must be 0.
-- amlogic,fifo-depth: The size of the controller's fifo in bytes. This
-  		      is useful for determining certain configuration such
-		      as the flush threshold of the fifo
-
-Example of FRDDR A on the A113 SoC:
-
-frddr_a: audio-controller@1c0 {
-	compatible = "amlogic,axg-frddr";
-	reg = <0x0 0x1c0 0x0 0x1c>;
-	#sound-dai-cells = <0>;
-	interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
-	clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
-	resets = <&arb AXG_ARB_FRDDR_A>;
-	fifo-depth = <512>;
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
new file mode 100644
index 000000000000..b1b48d683101
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-fifo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic AXG Audio FIFO controllers
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,axg-toddr
+          - amlogic,axg-frddr
+      - items:
+          - enum:
+              - amlogic,g12a-toddr
+              - amlogic,sm1-toddr
+          - const: amlogic,axg-toddr
+      - items:
+          - enum:
+              - amlogic,g12a-frddr
+              - amlogic,sm1-frddr
+          - const: amlogic,axg-frddr
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: Peripheral clock
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
+
+  amlogic,fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Size of the controller's fifo in bytes
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - clocks
+  - interrupts
+  - resets
+  - amlogic,fifo-depth
+
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,g12a-toddr
+              - amlogic,sm1-toddr
+              - amlogic,g12a-frddr
+              - amlogic,sm1-frddr
+
+    then:
+      properties:
+        resets:
+          minItems: 2
+        reset-names:
+          items:
+            - const: arb
+            - const: rst
+      required:
+        - reset-names
+
+    else:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          const: arb
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
+    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+    audio-controller@1c0 {
+        compatible = "amlogic,g12a-frddr", "amlogic,axg-frddr";
+        reg = <0x1c0 0x1c>;
+        #sound-dai-cells = <0>;
+        clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
+        interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
+        resets = <&arb>, <&clkc_audio AUD_RESET_FRDDR_A>;
+        reset-names = "arb", "rst";
+        amlogic,fifo-depth = <512>;
+    };
-- 
2.39.0

