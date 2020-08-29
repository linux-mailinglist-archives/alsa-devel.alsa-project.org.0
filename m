Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D44AB25683C
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Aug 2020 16:29:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 855F5184D;
	Sat, 29 Aug 2020 16:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 855F5184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598711373;
	bh=E9thMYeMHfyw6+b2VsGPYrGNBKia9yaCy7sNBsZe7r8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GBDuHIVonMrT7PegYbQg7e0gfDktkcLGBWCFMMZG4XpRZTvXUY2N5A6YoAyOvwERp
	 cxX5WqdsAcMSjDiOylQ3KMDDf42/rnz92Ov6TBWexd88dgZisb7gPQl90mhhjzBdEU
	 jwpOZvofFQ8EldAjyHTUXUt+s7l/TZh7GWncmfTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C53F802E0;
	Sat, 29 Aug 2020 16:25:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37727F802DD; Sat, 29 Aug 2020 16:25:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE3AEF802D2
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 16:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE3AEF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OrsmhwRS"
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 952B220BED;
 Sat, 29 Aug 2020 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598711138;
 bh=E9thMYeMHfyw6+b2VsGPYrGNBKia9yaCy7sNBsZe7r8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OrsmhwRShcIabXLwV8as2jDAx/r/uAy17Lq/fbtBG8LkRsAg8kvuZzbZKULZ7lB/I
 nNJSWhl/tA2gxK/yuCsIQTte2i8RMSLUfdboo8zOpj5LnlKqfzvQk0wxWY356MkSpo
 Pw4epVgwVo1EY5mT54nPSXg6YQsYCVOgHumLKa9A=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee.jones@linaro.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 05/10] dt-bindings: connector: Convert Samsung 11-pin USB
 bindings to dtschema
Date: Sat, 29 Aug 2020 16:24:56 +0200
Message-Id: <20200829142501.31478-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829142501.31478-1-krzk@kernel.org>
References: <20200829142501.31478-1-krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
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

Add Samsung 11-pin USB-C connector into standard dtschema bindings file.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../connector/samsung,usb-connector-11pin.txt | 49 -------------------
 .../bindings/connector/usb-connector.yaml     | 44 +++++++++++++++++
 2 files changed, 44 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/connector/samsung,usb-connector-11pin.txt

diff --git a/Documentation/devicetree/bindings/connector/samsung,usb-connector-11pin.txt b/Documentation/devicetree/bindings/connector/samsung,usb-connector-11pin.txt
deleted file mode 100644
index 3dd8961154ab..000000000000
--- a/Documentation/devicetree/bindings/connector/samsung,usb-connector-11pin.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Samsung micro-USB 11-pin connector
-==================================
-
-Samsung micro-USB 11-pin connector is an extension of micro-USB connector.
-It is present in multiple Samsung mobile devices.
-It has additional pins to route MHL traffic simultanously with USB.
-
-The bindings are superset of usb-connector bindings for micro-USB connector[1].
-
-Required properties:
-- compatible: must be: "samsung,usb-connector-11pin", "usb-b-connector",
-- type: must be "micro".
-
-Required nodes:
-- any data bus to the connector should be modeled using the OF graph bindings
-  specified in bindings/graph.txt, unless the bus is between parent node and
-  the connector. Since single connector can have multpile data buses every bus
-  has assigned OF graph port number as follows:
-    0: High Speed (HS),
-    3: Mobile High-Definition Link (MHL), specific to 11-pin Samsung micro-USB.
-
-[1]: bindings/connector/usb-connector.yaml
-
-Example
--------
-
-Micro-USB connector with HS lines routed via controller (MUIC) and MHL lines
-connected to HDMI-MHL bridge (sii8620):
-
-muic-max77843@66 {
-	...
-	usb_con: connector {
-		compatible = "samsung,usb-connector-11pin", "usb-b-connector";
-		label = "micro-USB";
-		type = "micro";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@3 {
-				reg = <3>;
-				usb_con_mhl: endpoint {
-					remote-endpoint = <&sii8620_mhl>;
-				};
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 9bd52e63c935..dc6ff64422d4 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -25,6 +25,10 @@ properties:
           - const: gpio-usb-b-connector
           - const: usb-b-connector
 
+      - items:
+          - const: samsung,usb-connector-11pin
+          - const: usb-b-connector
+
   label:
     description: Symbolic name for the connector.
 
@@ -158,6 +162,16 @@ allOf:
         - required:
             - id-gpios
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,usb-connector-11pin
+    then:
+      properties:
+        type:
+          const: micro
+
 examples:
   # Micro-USB connector with HS lines routed via controller (MUIC).
   - |
@@ -233,3 +247,33 @@ examples:
         vbus-supply = <&usb_p0_vbus>;
       };
     };
+
+  # Micro-USB connector with HS lines routed via controller (MUIC) and MHL
+  # lines connected to HDMI-MHL bridge (sii8620) on Samsung Exynos5433-based
+  # mobile phone
+  - |
+    muic-max77843 {
+      usb_con4: connector {
+        compatible = "samsung,usb-connector-11pin", "usb-b-connector";
+        label = "micro-USB";
+        type = "micro";
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            muic_to_usb: endpoint {
+              remote-endpoint = <&usb_to_muic>;
+            };
+          };
+          port@3 {
+            reg = <3>;
+            usb_con_mhl: endpoint {
+              remote-endpoint = <&sii8620_mhl>;
+            };
+          };
+        };
+      };
+    };
-- 
2.17.1

