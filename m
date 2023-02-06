Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBB968C1BA
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 16:36:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37FAB83A;
	Mon,  6 Feb 2023 16:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37FAB83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675697809;
	bh=y+GRrNuLDCtqEjxXY3s6OKqIFV5SdMNI6Z+ZDjJbZso=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=howm52PKnfzZo7rW5KPV9X/letAtoBGF73BIq22eG/JbGHv5EOAKsy3WlQjUvw3hO
	 Eb7tnVN1/fep7tC3J9700gIJKx1pk2fDHa7yhTxxNyKISgGOnau2J3w4sx7I8ID+rR
	 Og10kiPoObRqQ+OdzExGjeepfGoCwAd86k29bl1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0685F804E7;
	Mon,  6 Feb 2023 16:35:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8CF3F804E7; Mon,  6 Feb 2023 16:35:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30572F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 16:35:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30572F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=7+0Oo1DV
Received: by mail-wr1-x42f.google.com with SMTP id o18so10772946wrj.3
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 07:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dE4PzawJ8Ivz1Xkrb1ainxw3MHkOCZBpNlDJteLfhvQ=;
 b=7+0Oo1DVaqD7naQ+tMMYeuBowi/hiXS2Pth67RgSbzizIqJCJUg91R28kFILkD38nm
 OW1Xpyp6KIBZhnCdiQok71iMY/Bn5tV3amkYRfb/6DeGwaBaCJJLlUJWhiUtmAaR/VQf
 +w7cNV6/oG8nPnlySxo+KIWUT9IfR/s5N7Xm4UpDemXPzr/+mAwXl99X2m0FimpJpTwL
 mEM1h4wzIEpayxRIUbK9mwOXPc5D9JOkHvfRjwaH6oaZCNjhpB0yoFqaETseakuwffoP
 cUEd+FaJVNgXGpLVPFXCOXuI8bxrcWl2sdURbnW9SxhM+FaKlM2h0nJ/KKfZrVFpN7L8
 bKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dE4PzawJ8Ivz1Xkrb1ainxw3MHkOCZBpNlDJteLfhvQ=;
 b=X+ChZ4Y0fZ8hoLebPNRzCdjzSzQWxztORFX4HyGC3KFkZHN/XQjr6KmfGTCO9xHgpP
 4akW8I0r/W6fp6hwYyFyf/lYULe8heMA/AnT3MzT9hqNU6GFsydLY4do8jIMyfoO/OAP
 z0uwUlik+4EuyvsdpXFLZbTsvlL/IXVPGPfuWsIHI68BoPK+lpbuBxxCrUA4XAXUNluN
 eRjDsWvaQiHRjGx00Sx4+LeDcvtSU6/2DQFfQEdw6NcvS28iaj11d3lSvGf0epERTst/
 C+lvB+hLD8Dhaix2rQDiRGrxAmeuZ9sK6ot3XfEcua85sq4oEPvBiwl6Sue7wUqC8wHm
 mz+g==
X-Gm-Message-State: AO0yUKUsImebHbgrPQhgKdxTUtmHsIRpw3tVXbHgPTd0NQmMeo3Xyvcl
 FtSkUew/kKCyIUjH34m7R2fAXLJuOe6quH3a
X-Google-Smtp-Source: AK7set+Cme49xULbeUvBE9RVSvhB4aDvKFF0sWuGFJ6rilNHj3MTFMavhArsApfIKncV0218UZWksA==
X-Received: by 2002:a5d:6d8b:0:b0:2bf:dcfb:b58a with SMTP id
 l11-20020a5d6d8b000000b002bfdcfbb58amr26988602wrs.68.1675697699115; 
 Mon, 06 Feb 2023 07:34:59 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 07:34:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/7] ASoC: dt-bindings: meson: convert axg tdm formatters
 to schema
Date: Mon,  6 Feb 2023 16:34:44 +0100
Message-Id: <20230206153449.596326-3-jbrunet@baylibre.com>
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

Convert the DT binding documentation for the Amlogic tdm formatters to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
 .../sound/amlogic,axg-tdm-formatters.yaml     | 88 +++++++++++++++++++
 2 files changed, 88 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
deleted file mode 100644
index 5996c0cd89c2..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Amlogic Audio TDM formatters
-
-Required properties:
-- compatible: 'amlogic,axg-tdmin' or
-	      'amlogic,axg-tdmout' or
-	      'amlogic,g12a-tdmin' or
-	      'amlogic,g12a-tdmout' or
-	      'amlogic,sm1-tdmin' or
-	      'amlogic,sm1-tdmout
-- reg: physical base address of the controller and length of memory
-       mapped region.
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "pclk"     : peripheral clock.
-  * "sclk"     : bit clock.
-  * "sclk_sel" : bit clock input multiplexer.
-  * "lrclk"    : sample clock
-  * "lrclk_sel": sample clock input multiplexer
-
-Optional property:
-- resets: phandle to the dedicated reset line of the tdm formatter.
-
-Example of TDMOUT_A on the S905X2 SoC:
-
-tdmout_a: audio-controller@500 {
-	compatible = "amlogic,axg-tdmout";
-	reg = <0x0 0x500 0x0 0x40>;
-	resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
-	clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
-		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
-		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
-		 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
-		 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
-	clock-names = "pclk", "sclk", "sclk_sel",
-		      "lrclk", "lrclk_sel";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
new file mode 100644
index 000000000000..719ca8fc98c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio AXG TDM formatters
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,g12a-tdmout
+      - amlogic,sm1-tdmout
+      - amlogic,axg-tdmout
+      - amlogic,g12a-tdmin
+      - amlogic,sm1-tdmin
+      - amlogic,axg-tdmin
+
+  clocks:
+    items:
+      - description: Peripheral clock
+      - description: Bit clock
+      - description: Bit clock input multiplexer
+      - description: Sample clock
+      - description: Sample clock input multiplexer
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: sclk
+      - const: sclk_sel
+      - const: lrclk
+      - const: lrclk_sel
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: component-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,g12a-tdmin
+              - amlogic,sm1-tdmin
+              - amlogic,g12a-tdmout
+              - amlogic,sm1-tdmout
+    then:
+      required:
+        - resets
+
+    else:
+      properties:
+        resets: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+    audio-controller@500 {
+        compatible = "amlogic,g12a-tdmout";
+        reg = <0x500 0x40>;
+        resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
+        clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
+                 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
+                 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
+                 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
+                 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
+        clock-names = "pclk", "sclk", "sclk_sel",
+                      "lrclk", "lrclk_sel";
+    };
-- 
2.39.0

