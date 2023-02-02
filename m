Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 586C46886CC
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 19:40:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91C64EDA;
	Thu,  2 Feb 2023 19:39:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91C64EDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675363248;
	bh=eouG1ES1F+h5ln2rl+7zlkjl7K/cbKmvaDNSgx5dsbU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CSTRhGGHBwku9ParihIZgllTN1VswczhE7HusIkJS/FINBxhuYhskClPfApSD7UwT
	 sM6AmACOWCWoo6WzPkwamuGRRN7dlPlEb/ZnilcP3c5nG0s/8PjrbYANPUFeOM96JI
	 X+3/ioSoKBGcNgkY9YnctwjL5z7Qgo4KtkFVNZ/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B2C8F8059F;
	Thu,  2 Feb 2023 19:37:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F2D4F805A1; Thu,  2 Feb 2023 19:37:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19DEFF8058C
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 19:37:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19DEFF8058C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Ol+dWYPU
Received: by mail-wr1-x430.google.com with SMTP id y1so2576111wru.2
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 10:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHcTQ2BAGg+MkacXJwMrR2edvtbJn3+EYrwBcjC/8/I=;
 b=Ol+dWYPUCPY2dBcbd6w6cExLMsMOrobov9S0aUXQoGZ5H47VaMO+UiujxXMtAhNA+F
 IxHEFgfw3nkxmtX5CcE4YxDlelZCEEm7uLRwyEgPQ5uTZZdNAbPXNL6U33T89LJfxQ4O
 ZzPmQV9FaIdMksGzccnlyJs6l+clq9ECrJOcnYm5cRI0W7YVY4bpJKbRfO0xHXO6Wcwb
 YLlcXWsz2N4Bzm6JQnwII4mLiMnU+eCil6OYac7GW//Crrdid3R9mfeG3+Z6n6nuHcQZ
 6WQVO4QASUJMJ+9dcz6TzfGzw2eE9H8xEbaTGDfiQmPevqZeNSHM7JKYq9Hc9c8Vh0Q6
 W0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHcTQ2BAGg+MkacXJwMrR2edvtbJn3+EYrwBcjC/8/I=;
 b=0aWhZOg2cC8AFEEICZCA35S8ePPNnGNS/rsP7MkHhRQZxrbUdj93iIYb5a8usxVGu0
 rGAHgJ6xjSAsBk6AGMOu75wbxWN3tdipKDydnE7PqJFfIwgU8hMHzafjtYSlp5Fe+5HK
 BuNJE7m8mv+ovHsTqm+W9vF3i+i4TAnUVMgC2QPS0toyug6T4Uf2PrJWPGq2IbUVLexO
 i2EmL77rDOaJwJu9HGqNFq6G+PF5luWgsTPyX+P+Zvg6jVvH6j/9Iy7MfsPjZnUeLtfR
 Mwkj1zEft3ckS3nNXUvuQgFmg2R83mOJ0JHc12ELH2NPDfj8LRBicpvOXf30VfmwP3Pt
 TEBw==
X-Gm-Message-State: AO0yUKUYvfp0A3O+8nlvL0qwvUmmlK8zN9CBaX44YLvoDQdOVEYH7oJb
 Ncr5nUN9UDOKmQQ3oiodSjDKcA==
X-Google-Smtp-Source: AK7set/B53SqoLtzJXsKRY61oKnWcB+meMccnCo4RFMK4i/OPEORfp+Xo0hkgplJDMHVfsx1Vor9iw==
X-Received: by 2002:a5d:4bca:0:b0:242:800:9a7f with SMTP id
 l10-20020a5d4bca000000b0024208009a7fmr6275648wrt.65.1675363073190; 
 Thu, 02 Feb 2023 10:37:53 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74]) by smtp.googlemail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 10:37:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH 8/9] ASoC: dt-bindings: meson: convert axg spdif output to
 schema
Date: Thu,  2 Feb 2023 19:36:52 +0100
Message-Id: <20230202183653.486216-9-jbrunet@baylibre.com>
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

Convert the DT binding documentation for the Amlogic axg spdif output to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-spdifout.txt   | 25 ------
 .../bindings/sound/amlogic,axg-spdifout.yaml  | 83 +++++++++++++++++++
 2 files changed, 83 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
deleted file mode 100644
index 28381dd1f633..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Amlogic Audio SPDIF Output
-
-Required properties:
-- compatible: 'amlogic,axg-spdifout' or
-	      'amlogic,g12a-spdifout' or
-	      'amlogic,sm1-spdifout'
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "pclk" : peripheral clock.
-  * "mclk" : master clock
-- #sound-dai-cells: must be 0.
-
-Optional property:
-- resets: phandle to the dedicated reset line of the spdif output.
-
-Example on the A113 SoC:
-
-spdifout: audio-controller@480 {
-	compatible = "amlogic,axg-spdifout";
-	reg = <0x0 0x480 0x0 0x50>;
-	#sound-dai-cells = <0>;
-	clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
-		 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
-	clock-names = "pclk", "mclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
new file mode 100644
index 000000000000..c661ce7f8b9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-spdifout.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio AXG SPDIF Output
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
+          - const:
+              amlogic,axg-spdifout
+      - items:
+          - enum:
+              - amlogic,g12a-spdifout
+              - amlogic,sm1-spdifout
+          - const:
+              amlogic,axg-spdifout
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
+      - description: SPDIF output master clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: mclk
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - clocks
+  - clock-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,g12a-spdifout
+          - amlogic,sm1-spdifout
+then:
+  properties:
+    resets:
+      items:
+        - description: dedicated device reset line
+
+  required:
+    - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+
+    spdifout: audio-controller@480 {
+    	compatible = "amlogic,axg-spdifout";
+        reg = <0x480 0x50>;
+        #sound-dai-cells = <0>;
+        clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
+                 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
+        clock-names = "pclk", "mclk";
+    };
-- 
2.39.0

