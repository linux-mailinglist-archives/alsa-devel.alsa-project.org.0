Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 996186886CA
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 19:40:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 397CEEB9;
	Thu,  2 Feb 2023 19:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 397CEEB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675363217;
	bh=VMgVntpefhdW9lrxT8x3V7/hexDZboWnf9VJiHuw+w4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NupvvupPpBq55LDVMUZBfX8qDqAlfe6FUcqm5HRfIhsfVQNxBJtL9TCYyPYsNTsSl
	 DZK6QfKiA91WvLXLDD5LuGZeHTsO54VWOTuWLQIltu5yMi9lOe8WGWLuH9U75OlzR9
	 C91n1O/4uEShjjDprGk71pMimLH6o7OlDic2honM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22165F80557;
	Thu,  2 Feb 2023 19:37:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0174FF8057F; Thu,  2 Feb 2023 19:37:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0620F8056F
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 19:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0620F8056F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=FOpoHF3f
Received: by mail-wr1-x42d.google.com with SMTP id d14so2544941wrr.9
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 10:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qzWJ+PJWjjXt1zQX9IH2K8XJiUf6DeC3wzgQPgc4GE=;
 b=FOpoHF3f8QzmBlP4tl0/Yl5Eb99/+m1gDJTugenbzY8kup1MBbDbxZmTLbURQXOMeS
 Gx4qKZJIhYyjaGRlQk3ceTo2nSf+ALBZD0JZy8Ced9QTim/z7DSctzKjORaTmeMaq8He
 iWP7XRNFWI8I7n2V5jc/AGauFGnQy2rTKzaU+f/ZoPNbm+Gy0PfB+qR5S8kKRWxDaEra
 Bv8IR6aN5kFwjGQao/5nSDDu5YrHO1i7bxcRs2FGdsGt3MQpxPYhrRTxsry8t/gpw3LN
 pfJFNywFnH6ieUuSToVTsMyeT3QXaa58Nj7pi45zDbH07DifystOpcm7wOfCfE6NUx2o
 WKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/qzWJ+PJWjjXt1zQX9IH2K8XJiUf6DeC3wzgQPgc4GE=;
 b=NZDoXqyIo4rYs5wZGnb3W4k6dzCzDWOeposL9YLOXzIuEAGiRPWCrGntxrlMgtuzVV
 ukspNlfpl0XcmXszEnMThRfe3LP4g5Dgd2pscd1vw26OJKsosxhAel5xZDwLwP0cWcoB
 1/7/gpINfecoprRNEW+M7IbkJWU9oXQtklDyNkSls0wi803gOVAm+DnJsl7jYAk7aAO8
 xKkKRvZ0EOa7BNcHk5kudyF7XYvDGSvEhJopFHb5MMqji/XPWGpbuMmXQsuyM2sNnY7N
 mdgtmjxmPEG7SeyVCHXjq8fA1Y8ONsVuaFutpQB4fHvlI6O3hxEJPhJp+WK1WQl3fkv6
 djyQ==
X-Gm-Message-State: AO0yUKUAt4dei4eEqmHQcLFUMB5DqysKx+jEt8WLjXtleMtR47aHiYDx
 clLTfkGvscv+P/ZLM0lDzwQPtQ==
X-Google-Smtp-Source: AK7set8onuVp4cHeXmcTC8LpsEEAQcnGWYTri6tZ8J2QzpQkkVkE/HiDhb+ly+kJ1rLPravbxzeOUQ==
X-Received: by 2002:a05:6000:15cd:b0:2bf:d8ed:ba46 with SMTP id
 y13-20020a05600015cd00b002bfd8edba46mr8007620wry.47.1675363065020; 
 Thu, 02 Feb 2023 10:37:45 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74]) by smtp.googlemail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 10:37:44 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH 6/9] ASoC: dt-bindings: meson: convert axg fifo to schema
Date: Thu,  2 Feb 2023 19:36:50 +0100
Message-Id: <20230202183653.486216-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
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
 .../bindings/sound/amlogic,axg-fifo.txt       |  34 -----
 .../bindings/sound/amlogic,axg-fifo.yaml      | 116 ++++++++++++++++++
 2 files changed, 116 insertions(+), 34 deletions(-)
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
index 000000000000..f6222ad08880
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
@@ -0,0 +1,116 @@
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
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,axg-toddr
+              - amlogic,axg-frddr
+      - items:
+          - enum:
+              - amlogic,g12a-toddr
+              - amlogic,sm1-toddr
+          - const:
+              amlogic,axg-toddr
+      - items:
+          - enum:
+              - amlogic,g12a-frddr
+              - amlogic,sm1-frddr
+          - const:
+              amlogic,axg-frddr
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
+    items:
+      - description: Memory ARB line
+      - description: Dedicated device reset line
+
+  reset-names: true
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
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,g12a-toddr
+          - amlogic,sm1-toddr
+          - amlogic,g12a-frddr
+          - amlogic,sm1-frddr
+then:
+  properties:
+    resets:
+      minItems: 2
+    reset-names:
+      items:
+        - const: arb
+        - const: rst
+  required:
+    - reset-names
+else:
+  properties:
+    resets:
+      maxItems: 1
+    reset-names:
+      const: arb
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
+    frddr_a: audio-controller@1c0 {
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

