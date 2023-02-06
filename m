Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F0868C1CA
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 16:37:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCD4F83A;
	Mon,  6 Feb 2023 16:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCD4F83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675697870;
	bh=jZdKiVh44UYo6mK0vn9y6CsvHLIDZuTlTWuq4rMFPgA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PqV1fg08V4W07RR7iJneoa/jAbaspsTkBrqKtVRjaF57rvCi8Cf4RgjPS8dhaW4T8
	 6jMrxBubfI4QYFET4BphIZ2QGpgWOITBGI2pUdU6xeCiJ/wlka1a30b+uiHZG3cdpe
	 KtpOhWL9mWt7de4kGh7p87CDNhZdqWmKq9hvNHfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2198CF80579;
	Mon,  6 Feb 2023 16:35:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B771EF80568; Mon,  6 Feb 2023 16:35:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62535F804FB
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 16:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62535F804FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=YHvM+plL
Received: by mail-wr1-x431.google.com with SMTP id bk16so10741882wrb.11
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 07:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0lBSrvjf3cyT4RRbBVK5enJ7REZCr1oSf4WB5Ql0EWc=;
 b=YHvM+plLw381A2A2MT7QOvNVDR0HQtu8RETa2oQ7H8qE4X5SYfWUsxIfeXOHA1SRqq
 cC8yUyxnxWXOidoy3NlBMk4umQobfq6DVuwwpme1AzMnToLU7Xd/jScj4TMaPEklhG+6
 Pux1PK+aFU3FsF5r5Q8j0LE32477kwTGDUTJVHB8eKX2jaiB6IqZG5mUiWXbxbxAfPbz
 7F4ozXCCf9wkyda2wtXAzYS8NiTSfCiT8wYi/gLCbPwAaaCmEZvaEOHrEwgZYcNBpZTY
 asRqhVRd5dp+6uuis/eFdTVAHU1qDmoTAwzmbYVj9bwWCy8otdl55Kzv7IQs9xlqhNj0
 Q9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0lBSrvjf3cyT4RRbBVK5enJ7REZCr1oSf4WB5Ql0EWc=;
 b=GEqNkALUj6lx/VtWopDsYXeYn32w8GkbM1AnKxZdLRYxwyL6S9qReaax87l+8TZv4C
 OaMd7GseSCWSRIAA7I2XG3u9hS2+3fpDH6difB2YT9sTpjgWcK8uuVXfgBnReIE76ByE
 jtDJPuMKLJWJ4bTAcX/bSwfku7iAtxeM5R1jmnO8r2ohItTHnDGRPAFsxCWIc4EyHJ7u
 iO1a3ek3WAWYIJZQis4Lc/ihQuiW/aShCksCwR3GsK/pDeR+mV8O9Wggu6UYYrbyxIZQ
 kFvdarGfsAuwp0k+fBH0F43CpET9x8qOzoYmxHm0q6cMxI18XE4cz7hhShJ2F0gWNuE5
 FjdA==
X-Gm-Message-State: AO0yUKVmUJqPt3dm/W6jje3rFCkm1V00iro11P5HKyMWLPblgjlTcopp
 IELTITMtCQh2CBu59VlxNI6vST4jGfjKVD2Z
X-Google-Smtp-Source: AK7set8csyy3uREeZXYPe0M9EgeJi6ngyhaJnYH6JVUyFj4TDjHqUq0uvG+o1JoR/ri7NlPhSAfqlQ==
X-Received: by 2002:adf:f1cc:0:b0:2c3:ea64:425c with SMTP id
 z12-20020adff1cc000000b002c3ea64425cmr3475028wro.17.1675697701479; 
 Mon, 06 Feb 2023 07:35:01 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 07:35:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 5/7] ASoC: dt-bindings: meson: convert axg spdif input to
 schema
Date: Mon,  6 Feb 2023 16:34:47 +0100
Message-Id: <20230206153449.596326-6-jbrunet@baylibre.com>
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

Convert the DT binding documentation for the Amlogic axg spdif input to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-spdifin.txt    | 27 ------
 .../bindings/sound/amlogic,axg-spdifin.yaml   | 86 +++++++++++++++++++
 2 files changed, 86 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
deleted file mode 100644
index df92a4ecf288..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* Amlogic Audio SPDIF Input
-
-Required properties:
-- compatible: 'amlogic,axg-spdifin' or
-	      'amlogic,g12a-spdifin' or
-	      'amlogic,sm1-spdifin'
-- interrupts: interrupt specifier for the spdif input.
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "pclk" : peripheral clock.
-  * "refclk" : spdif input reference clock
-- #sound-dai-cells: must be 0.
-
-Optional property:
-- resets: phandle to the dedicated reset line of the spdif input.
-
-Example on the A113 SoC:
-
-spdifin: audio-controller@400 {
-	compatible = "amlogic,axg-spdifin";
-	reg = <0x0 0x400 0x0 0x30>;
-	#sound-dai-cells = <0>;
-	interrupts = <GIC_SPI 87 IRQ_TYPE_EDGE_RISING>;
-	clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
-		 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
-	clock-names = "pclk", "refclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml
new file mode 100644
index 000000000000..a0bd7a5fb9b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-spdifin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio AXG SPDIF Input
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: amlogic,axg-spdifin
+      - items:
+          - enum:
+              - amlogic,g12a-spdifin
+              - amlogic,sm1-spdifin
+          - const: amlogic,axg-spdifin
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
+      - description: SPDIF input reference clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: refclk
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - clocks
+  - clock-names
+  - interrupts
+
+allOf:
+  - $ref: dai-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,g12a-spdifin
+              - amlogic,sm1-spdifin
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    audio-controller@400 {
+        compatible = "amlogic,axg-spdifin";
+        reg = <0x400 0x30>;
+        #sound-dai-cells = <0>;
+        interrupts = <GIC_SPI 87 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+                 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+        clock-names = "pclk", "refclk";
+    };
-- 
2.39.0

