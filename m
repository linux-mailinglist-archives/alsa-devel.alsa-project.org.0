Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F395D16A90F
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 16:01:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B9F41688;
	Mon, 24 Feb 2020 16:01:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B9F41688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582556516;
	bh=Ncq5/aXVXBiiI4RhiANLxaDew2hQEE8EUoUKCKEObvM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aiYAugdVSsa7/RQZD28RP303UqagJfz7GDPd5g/X10wxJvV6VZ+f5ReIe8AxyHC4g
	 mEggVDynysyxKTNqLpjbb0gnnVQQ3otwsz8jEXh3aG1u/blen67rdxnpMTTnmtnwbJ
	 6gEzxHmk1ioamq1sNKQUfQBJllebjaRQGIaCWb+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C977F802A1;
	Mon, 24 Feb 2020 15:58:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EFF5F8027D; Mon, 24 Feb 2020 15:58:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44ED6F80090
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 15:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44ED6F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="trsTmj6z"
Received: by mail-wm1-x341.google.com with SMTP id p9so9288755wmc.2
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 06:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z9cRXoC/GfDAtjxWi5KsDJ09IaYSATCVgnb2jSrSXVk=;
 b=trsTmj6zVlXNSoLi6KjZbFbzFLBRs7Gbl4tvKmeC/QMtjfjtG0KRvB94LBGe9rrf8K
 g6qLpJrRcJ6aWkO6aD8gXTvRwMIFkVDdi2MLdTqRkweFtGFgWXH4VXINLQEdUQeRJ9ia
 4r1EUUDep2XGR/LQJwkjBkjN/FeQluq/xDZg7MkODgYep/Ydi26Y7mU1tCBTCA2iIpsj
 5Kz6BBcFsRB2CuTdZLY9Cj4wApZI6C2QhRvYk/zNlVeL2PHr/67K6Bnk9V9uXPyQTkap
 cb+6bldDPVjqxRaZrTpIqmhq06Ym01u5RKbM+alXY9gCq3qdky5bC0r4ySg/su2xGZL5
 bfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z9cRXoC/GfDAtjxWi5KsDJ09IaYSATCVgnb2jSrSXVk=;
 b=A189RcRGLpTBlEgilDS91XGaYj4i8wPVI7NvSiys+8YFn7q3h9jZ9o7hY/ON8SI5NY
 k2J01uhSB17ItRRKrPB7e2jQAyOJSoc+iVAag3Em/wv4ZvfYAaa/ALuqw9t3JFCTY6bq
 wSWb+xSVKlyNsb2gceHFtsHvQ5T99ygBZFWxiSTKXCfRjk9gzw1eebwUTZU+rZhqMdEL
 5fhbnOCbJ/p7JCIoU6VdA/B4rnA5WKz384decwwyZJruPsgXjBLQLhuyrrR9SA7H1KoY
 niqqrbLk2uMEQanQnhpqa7h9PVAGNzKBHbNAtCTDQ7bfBDOSrnCcKrzeHxXBYMXL+s3f
 N3SQ==
X-Gm-Message-State: APjAAAXbdwbES3ja+aXri7YYtq4UU4+tw3sEhQqsGe4/DD/7gIze0R6k
 eGDENEifFhkIYFJrwB2MZPUOgg==
X-Google-Smtp-Source: APXvYqxuk/ZsOhi/Z9PZFDby6XImdLYc1HKOphlMtlNyGM6T4IvnoK5UeTKpmgEVirInMyPYyv25UQ==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr22339218wmb.0.1582556310822; 
 Mon, 24 Feb 2020 06:58:30 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm8035127wrt.35.2020.02.24.06.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:58:30 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 5/9] ASoC: meson: convert axg fifo to schema
Date: Mon, 24 Feb 2020 15:58:17 +0100
Message-Id: <20200224145821.262873-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224145821.262873-1-jbrunet@baylibre.com>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

Convert the DT binding documentation for the Amlogic axg audio FIFOs to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-fifo.txt       |  34 ------
 .../bindings/sound/amlogic,axg-fifo.yaml      | 111 ++++++++++++++++++
 2 files changed, 111 insertions(+), 34 deletions(-)
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
index 000000000000..d9fe4f624784
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: GPL-2.0
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
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    oneOf:
+      - items:
+        - const:
+            amlogic,axg-toddr
+      - items:
+        - const:
+            amlogic,axg-frddr
+      - items:
+        - enum:
+          - amlogic,g12a-toddr
+          - amlogic,sm1-toddr
+        - const:
+            amlogic,axg-toddr
+      - items:
+        - enum:
+          - amlogic,g12a-frddr
+          - amlogic,sm1-frddr
+        - const:
+            amlogic,axg-frddr
+
+  clocks:
+    items:
+      - description: Peripheral clock
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  resets:
+    minItems: 1
+    items:
+      - description: Memory ARB line
+      - description: Dedicated device reset line
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: arb
+      - const: rst
+
+  amlogic,fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Size of the controller's fifo in bytes
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - interrupts
+  - reg
+  - clocks
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
+      minItems: 2
+  required:
+    - reset-names
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
+        reg = <0x0 0x1c0 0x0 0x1c>;
+        #sound-dai-cells = <0>;
+        interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
+        resets = <&arb AXG_ARB_FRDDR_A>, <&clkc_audio AUD_RESET_FRDDR_A>;
+        reset-names = "arb", "rst";
+        amlogic,fifo-depth = <512>;
+    };
+
-- 
2.24.1

