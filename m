Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0425016A913
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 16:02:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F6021677;
	Mon, 24 Feb 2020 16:01:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F6021677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582556560;
	bh=/V3rk551EX4+qKJgr2HSXLQH6qyUUTeDu7csFDwkZZI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CS/t/OcV/KBZdxcdNvbvMig/M5YAeNbx2dCslbOxl59MXCnwMwBJIdrnGtYXIv4QC
	 BpIOlkQ+aXUWOY0zdjVZgU+CxhhrJNOuonN18Ofc3Aut1e3xFMeGy5B8hfwoiYpMxj
	 +zi+3F4tOE5beHxl/7GU83DKU6C+im+80HmlTzVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8929F802A2;
	Mon, 24 Feb 2020 15:58:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7973EF8028A; Mon, 24 Feb 2020 15:58:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41F29F8014E
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 15:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41F29F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="BxwsppZ2"
Received: by mail-wr1-x442.google.com with SMTP id z3so10748594wru.3
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 06:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+m5Zk6ATehdxswy6Hjbn0kVD8RHIMq9I1KqtdFphR4Y=;
 b=BxwsppZ2TqEjT+8Z3y25ke1pudvOilFOi8pPUubmpCnhiDngRYPXdE94G7U9Ava7zQ
 RomwNhFUanS4atJGqdbEqofH6EZH/03ujPLOashF22t7WT2B1Fhp7Z9KFA+8uPmxzRMt
 0h2oPjI7KDMWdHsVDhW1N6Eu9/UVeLCDLPonER6wXezzegFK9KFX61o0pT2TOElUJex3
 gQv8ec3/kuemWFl7o+5ymRoCd6NmXdQ66o7/uaxH+5SIUtHSfr05mntPv7wZsULLI7Ij
 bWBoqaYzCjFr3npplC/8TRkuHWl35sd6nxfFn9P3WZ9X8q8LCuQOiF8stMRuF4ocpmby
 fbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+m5Zk6ATehdxswy6Hjbn0kVD8RHIMq9I1KqtdFphR4Y=;
 b=pEY0k71BRoC+iz1mDYMaxxEiRiDnLMzhCzETFpjNnLf3JVpLYWeoTpDNjDZu68AhPR
 Qzo453dl7fV9I7kT/9YIAM0aF+bFNb87M90y0JRTjoex3oiAqbrV970Tutv+7tGbnFJh
 KkVeh+e1nsoYXEgLDLyXob9a3WSk67VCFIsW4QFZ7DstabiqvBkqevIEiAPYo3YgpdDj
 O7u96KgiPsV5YCzlwB8/TfrLBKLEfZDNahNKFyE7iqu9TNiRZr8r95atR4/YOMu4UEK3
 0z2NEC6NJiS+JsUYpL/oolJTmfweGNqJSqfRvLv37w+HCsP/sJ3Ges53Lvrnmqehr+jR
 rwEw==
X-Gm-Message-State: APjAAAU+LW/FIXUEO9i23rBA3dgGgzWmyFv5mgJBhg9vwGdrttDjpCvu
 3vmY/CDywQHwTN033lQhMhEyqg==
X-Google-Smtp-Source: APXvYqwKJQRnmPqcIIix9h+Okty9D6LqCQRrxgqAPcpQ8cagQSHDEFG5tHJ6MlgBAUv48MiCgtTlPw==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr70933271wru.57.1582556312782; 
 Mon, 24 Feb 2020 06:58:32 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm8035127wrt.35.2020.02.24.06.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:58:32 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 7/9] ASoC: meson: convert axg spdif output to schema
Date: Mon, 24 Feb 2020 15:58:19 +0100
Message-Id: <20200224145821.262873-8-jbrunet@baylibre.com>
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

Convert the DT binding documentation for the Amlogic axg spdif output to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-spdifout.txt   | 25 ------
 .../bindings/sound/amlogic,axg-spdifout.yaml  | 77 +++++++++++++++++++
 2 files changed, 77 insertions(+), 25 deletions(-)
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
index 000000000000..9ac52916f88b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0
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
+            amlogic,axg-spdifout
+      - items:
+        - enum:
+          - amlogic,g12a-spdifout
+          - amlogic,sm1-spdifout
+        - const:
+            amlogic,axg-spdifout
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
+  reg:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: dedicated device reset line
+
+required:
+  - "#sound-dai-cells"
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
+          - amlogic,g12a-spdifout
+          - amlogic,sm1-spdifout
+then:
+  required:
+    - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+
+    spdifout: audio-controller@480 {
+    	compatible = "amlogic,axg-spdifout";
+        reg = <0x0 0x480 0x0 0x50>;
+        #sound-dai-cells = <0>;
+        clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
+                 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
+        clock-names = "pclk", "mclk";
+    };
-- 
2.24.1

