Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A09DB630D86
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Nov 2022 09:49:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A0511704;
	Sat, 19 Nov 2022 09:48:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A0511704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668847762;
	bh=+KP4KPDplSXS5beEV5TrsIwBP8ZVtWojvZIAOFm1OGY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f0UzVyiCCq9bnNOVKLAM0i2wrZepJ4fsMZHp3t/0yr6CQxrLSSRWp5gAxh/xpGFKM
	 a4ms0AFDWEJxPRL20vRDSohgYn1mQR9xUFizrCWhNQq3py6DyxCgVkVTk51UneUERs
	 18evPFgcAn9UXLWBt4zOypXiJSsI4m5ZJvRw/O5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C62BF8060B;
	Sat, 19 Nov 2022 09:40:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 565B7F8020D; Fri, 18 Nov 2022 23:38:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CD5AF8020D
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 23:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CD5AF8020D
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-13c2cfd1126so7587692fac.10
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 14:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m0raBjAqYekKQWPt8CeBL05C5sEHyP1ZPYbyFvxhkC0=;
 b=KUkjlH4nz8W7ymKiftkYVSZb2S0IEITaEMgA/HSqtVLrOk+9mYmN3kjW+lNzBlDhNa
 IqVUjLzpF9FqwWoItuxgNRlFp7Ndf9SRjoBLtmGBa2gCWwPu99Hbu72TpECrkuD6bWWe
 zZJiNl6UdhJGimmdgHqwenWyX7zd7Fsoplr8xsUkme5HpaqtLVEF9MXlRoH6G4GZB3V9
 YOtLZKQHJY7HT1KDJPfuWcR94bc0UQXQvJqXOurDDO39zjfuK7NcdYmvVpC/99h0pL4B
 Mm+rrFSDzkj7cXgzKaI9ixkG1rZ/f+gYio2m+9FtWF6bbHM4O8GNGMXfzL+pVuBBHz/N
 xDTQ==
X-Gm-Message-State: ANoB5plsSxigDNphP5tnDMiP+DJkPQ4yiYcHbZcw8YMMtzxptMjnbuga
 KpYrUNhFkLEuG1fPqdRjWA==
X-Google-Smtp-Source: AA0mqf4uC828wW0XMFRcw+1h9kzuiTCYIXYE5a9yh+nlTeD+x6xGbslmOI8E3ZIqUy+Kwbf6RoH4Ow==
X-Received: by 2002:a05:6870:ac0b:b0:13a:e051:7c68 with SMTP id
 kw11-20020a056870ac0b00b0013ae0517c68mr5202453oab.150.1668811081476; 
 Fri, 18 Nov 2022 14:38:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t19-20020a9d7753000000b0066cf6a14d1asm2061199otl.23.2022.11.18.14.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 14:38:00 -0800 (PST)
Received: (nullmailer pid 1722360 invoked by uid 1000);
 Fri, 18 Nov 2022 22:38:02 -0000
From: Rob Herring <robh@kernel.org>
To: Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Yangtao Li <tiny.windzz@gmail.com>,
 Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Maxime Ripard <mripard@kernel.org>, Daniel Mack <zonque@gmail.com>, 
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
Date: Fri, 18 Nov 2022 16:37:27 -0600
Message-Id: <20221118223728.1721589-1-robh@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Nov 2022 09:40:30 +0100
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

json-schema patterns by default will match anywhere in a string, so
typically we want at least the start or end anchored. Fix the obvious
cases where the anchors were forgotten.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml       | 2 +-
 Documentation/devicetree/bindings/hwmon/adt7475.yaml          | 4 ++--
 .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml    | 4 ++--
 .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 2 +-
 .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-
 Documentation/devicetree/bindings/regulator/max8660.yaml      | 2 +-
 .../devicetree/bindings/regulator/maxim,max77802.yaml         | 2 +-
 Documentation/devicetree/bindings/regulator/regulator.yaml    | 2 +-
 .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml  | 2 +-
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml     | 2 +-
 .../devicetree/bindings/spi/nvidia,tegra210-quad.yaml         | 2 +-
 11 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index a11e1b867379..3c00ad09eeaa 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -38,7 +38,7 @@ properties:
     type: object
 
     patternProperties:
-      'cpu@[0-9a-f]+':
+      '^cpu@[0-9a-f]+$':
         type: object
 
         properties:
diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.yaml b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
index ea595102a86e..051c976ab711 100644
--- a/Documentation/devicetree/bindings/hwmon/adt7475.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
@@ -61,7 +61,7 @@ patternProperties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1]
 
-  "adi,pin(5|10)-function":
+  "^adi,pin(5|10)-function$":
     description: |
       Configures the function for pin 5 on the adi,adt7473 and adi,adt7475. Or
       pin 10 on the adi,adt7476 and adi,adt7490.
@@ -70,7 +70,7 @@ patternProperties:
       - pwm2
       - smbalert#
 
-  "adi,pin(9|14)-function":
+  "^adi,pin(9|14)-function$":
     description: |
       Configures the function for pin 9 on the adi,adt7473 and adi,adt7475. Or
       pin 14 on the adi,adt7476 and adi,adt7490
diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
index 385b0692261c..51f62c3ae194 100644
--- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
+++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
@@ -41,7 +41,7 @@ required:
   - nvmem-cells
 
 patternProperties:
-  "opp-[0-9]+":
+  "^opp-[0-9]+$":
     type: object
 
     properties:
@@ -49,7 +49,7 @@ patternProperties:
       clock-latency-ns: true
 
     patternProperties:
-      "opp-microvolt-.*": true
+      "^opp-microvolt-speed[0-9]$": true
 
     required:
       - opp-hz
diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
index d60f43fd9c5a..e63e6458cea8 100644
--- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
@@ -31,7 +31,7 @@ properties:
     maxItems: 2
 
 patternProperties:
-  'pcie@[0-2],0':
+  '^pcie@[0-2],0$':
     type: object
     $ref: /schemas/pci/pci-bus.yaml#
 
diff --git a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
index 0f18cceba3d5..5a0d64d3ae6b 100644
--- a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
@@ -65,7 +65,7 @@ properties:
     maxItems: 1
 
 patternProperties:
-  'usb@[0-1],0':
+  '^usb@[0-1],0$':
     type: object
 
     description:
diff --git a/Documentation/devicetree/bindings/regulator/max8660.yaml b/Documentation/devicetree/bindings/regulator/max8660.yaml
index 9c038698f880..4d550ca396eb 100644
--- a/Documentation/devicetree/bindings/regulator/max8660.yaml
+++ b/Documentation/devicetree/bindings/regulator/max8660.yaml
@@ -24,7 +24,7 @@ properties:
     type: object
 
     patternProperties:
-      "regulator-.+":
+      "^regulator-.+$":
         $ref: "regulator.yaml#"
 
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
index 71138c611b6c..b704f05ea454 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
@@ -77,7 +77,7 @@ patternProperties:
       regulator-initial-mode: false
 
     patternProperties:
-      regulator-state-(standby|mem|disk):
+      "^regulator-state-(standby|mem|disk)$":
         type: object
         additionalProperties: true
         properties:
diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 6e8aa9eed3aa..53b81d8a2d41 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -231,7 +231,7 @@ patternProperties:
   ".*-supply$":
     description: Input supply phandle(s) for this node
 
-  regulator-state-(standby|mem|disk):
+  "^regulator-state-(standby|mem|disk)$":
     type: object
     description:
       sub-nodes for regulator state in Standby, Suspend-to-RAM, and
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
index 7cb74cc8c5d9..54be194bb244 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
@@ -21,7 +21,7 @@ description: |
   regulator-voutl1, regulator-vouts1
 
 patternProperties:
-  "regulator-.+":
+  "^regulator-.+$":
     type: object
     description:
       Properties for single regulator.
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 679a246dd666..7df40c38e865 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -115,7 +115,7 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     patternProperties:
-      port(@[0-9a-f]+)?:
+      '^port(@[0-9a-f]+)?$':
         $ref: audio-graph-port.yaml#
         unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
index 6b733e5c1163..899100e783c9 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
@@ -48,7 +48,7 @@ properties:
       - const: tx
 
 patternProperties:
-  "@[0-9a-f]+":
+  "@[0-9a-f]+$":
     type: object
 
     properties:
-- 
2.35.1

