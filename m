Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8EE6886C5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 19:39:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DA93EDC;
	Thu,  2 Feb 2023 19:38:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DA93EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675363187;
	bh=CQLsfz3A8UEGXiZu80BXp9lNztwshS4JBjzN312D934=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VX1vzvxfqrCwfNJ/UGXqI1prYo2wPMok/8G/CpiOlVeDHDJxphvvMyxM8imSP9Og8
	 odWSUyRMTxck47CAXhw7ttA/8zXYF/9LhSeM+UH3izqQRm9O05VvQL/GzCXgs7jTMJ
	 +1PfWrEqqKHePNZTzrlJHS+rEUHo4Ta1Oj32ziag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9728BF80568;
	Thu,  2 Feb 2023 19:37:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36FA5F80564; Thu,  2 Feb 2023 19:37:43 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id B8A44F80557
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 19:37:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8A44F80557
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=FMUtGEoR
Received: by mail-wr1-x42d.google.com with SMTP id q10so2564081wrm.4
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 10:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AXyZIljlivZsyzzAaHca17k18SeAHW7oVhmpWiofUc0=;
 b=FMUtGEoR5wyvukeWTuN6esPODhE46k/rhSExRP7aKN1Ra7+p49TL2Ncnhq5W86gmyh
 YOKEodOntnVZyvdzh9rcLgnpcIb7hY/g8lFQoZ0PvE7j2+HxcLJmVewOtx3zMdj45Guc
 M2U7S+V4Mgjf2GkFNqh3JsxXuLqBQBY9MmCDJGn9NkOJkVZkWBVTgMNUc8H1dIg4IHA/
 UCISsTW6FGVWUALFZpSZDBd6bZLzYlmM+h7Oam7TBz+T+2KcA3RTey4LdwPO9kthzgyo
 QBWLtHXn64XSfGpkNz21INQYWpm33vvWlutGKdXAYs2B3Abfl70vmWdqin4zd3sV/PMZ
 P/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AXyZIljlivZsyzzAaHca17k18SeAHW7oVhmpWiofUc0=;
 b=bpplWnxW0QUwBqOGd5K7OGQrcKlJjfqRuV+zGTo/zJmvAqH/uCjfjuYpySLIuqMOPD
 MKR6fqMlzmvcYZnNZFj0L3PyjMT4waIvSsyANcl6FK70PvTEwJ0V1egN8B5/6MCCfCzc
 om6KhGaSQBmyWG+/Trr85icNOM/Ly/p/N17S4EOEhE5LXKiChyUUpWD3oqDaD0iwkf2H
 j0wnIDU0h3GbpBcCcFQiuKll9qh47BUYMgYmiiplDOk6qEikQI+oOczNvtPKzUvextrF
 8KRc0SF9BJgdlL/5uyj3U78CsrBbf43Jf+xNaBH13ln1f7E8bU0BObK9YjpNY6O8Fr1Z
 L9gQ==
X-Gm-Message-State: AO0yUKXQCjGjzNd5ko3+0CwiRSaPPrT0f7gBuKbAfJiPahS77S5A1l4l
 Lnf3H47RFP7cQ9gmb2srrUmFiQ==
X-Google-Smtp-Source: AK7set+pxbmG29Re1i0cjbsUOsmWZYs4v9LsA6E81NYg48kXNwVHEfKppSuZr6aXTpqsaW2+37hakg==
X-Received: by 2002:a05:6000:1843:b0:2bf:e7a0:8b63 with SMTP id
 c3-20020a056000184300b002bfe7a08b63mr8342067wri.5.1675363057949; 
 Thu, 02 Feb 2023 10:37:37 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74]) by smtp.googlemail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 10:37:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH 4/9] ASoC: dt-bindings: meson: convert axg tdm formatters to
 schema
Date: Thu,  2 Feb 2023 19:36:48 +0100
Message-Id: <20230202183653.486216-5-jbrunet@baylibre.com>
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

Convert the DT binding documentation for the Amlogic tdm formatters to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
 .../sound/amlogic,axg-tdm-formatters.yaml     | 90 +++++++++++++++++++
 2 files changed, 90 insertions(+), 36 deletions(-)
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
index 000000000000..f618724411de
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
@@ -0,0 +1,90 @@
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
+allOf:
+  - $ref: component-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,g12a-tdmout
+          - amlogic,sm1-tdmout
+          - amlogic,axg-tdmout
+          - amlogic,g12a-tdmin
+          - amlogic,sm1-tdmin
+          - amlogic,axg-tdmin
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
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,g12a-tdmin
+          - amlogic,sm1-tdmin
+          - amlogic,g12a-tdmout
+          - amlogic,sm1-tdmout
+then:
+  properties:
+    resets:
+      items:
+        - description: Dedicated device reset line
+
+  required:
+    - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+    tdmout_a: audio-controller@500 {
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

