Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DEB2B7828
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 09:08:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 069491667;
	Wed, 18 Nov 2020 09:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 069491667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605686911;
	bh=GGwL+6ai/+SFbNJsZJNjbn3qHTgLoIHUg5tWij808z4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KX8zU0H6PW6iwWtweF/n5rNM8Jdw37wNri4A8trcsTbxccDypMHVPZeuMEnPM9oTt
	 wxM+Xyw93xFLYyoIj1/pOdpW4LuQpPZD5wj8FFrUdlz5Y/+WaY7xFDBY2w4sP09530
	 rXUiZnaW8CQcY7dn7BB1u1xMWqfbKbXOqsYlbel8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34D3AF8016E;
	Wed, 18 Nov 2020 09:06:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FC45F8019D; Wed, 18 Nov 2020 09:06:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4D9FF8016C
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 09:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4D9FF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="mY8ZItWG"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fb4d6070000>; Wed, 18 Nov 2020 00:06:31 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Nov
 2020 08:06:40 +0000
Received: from audio.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 18 Nov 2020 08:06:38 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <robh+dt@kernel.org>, <thierry.reding@gmail.com>, <broonie@kernel.org>
Subject: [PATCH 2/3] dt-bindings: tegra: Convert HDA doc to json-schema
Date: Wed, 18 Nov 2020 13:36:21 +0530
Message-ID: <1605686782-29469-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605686782-29469-1-git-send-email-spujar@nvidia.com>
References: <1605686782-29469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605686791; bh=aoJcYwi5/UenP9bLitxom4hRAg/DI2I1tYEOVWyMeuY=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=mY8ZItWGAP8elYufCNd5Da4m3C0jLMu3TUT4NZZ5gFwbs69X2J6nsxOaDAkCDHZet
 t0XkD16DGDNCoQ9JLY9QRff4VAkLekBCyEg247QccWeqG/jGu9BLtzuOJuZp8Wauwl
 OHwKJCQ2U6j9plHPXuYjCv5PqNQIey0lA0ziJxvpgsslAlsO65lK8cGLhd6s2eb6x4
 uA4ypVrUvviaIvL7+m5xx5445OKu9rOdVQlDi3AcIRMceORHDW3Q1YUsYASraTzKu4
 PJrMAvvEyN+4TSTeQRG7xC5ptVDzT/Eaex2fFq05v1SZHqYOqvL1Qg0KFcJ147qi38
 BdL2BFMv+l/Uw==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, sharadg@nvidia.com
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

Convert Tegra HDA doc to YAML format.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../bindings/sound/nvidia,tegra30-hda.txt          | 35 --------
 .../bindings/sound/nvidia,tegra30-hda.yaml         | 98 ++++++++++++++++++++++
 2 files changed, 98 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
deleted file mode 100644
index 21cd310..0000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-NVIDIA Tegra30 HDA controller
-
-Required properties:
-- compatible : For Tegra30, must contain "nvidia,tegra30-hda".  Otherwise,
-  must contain '"nvidia,<chip>-hda", "nvidia,tegra30-hda"', where <chip> is
-  tegra114, tegra124, or tegra132.
-- reg : Should contain the HDA registers location and length.
-- interrupts : The interrupt from the HDA controller.
-- clocks : Must contain an entry for each required entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries: hda, hda2hdmi, hda2codec_2x
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries: hda, hda2hdmi, hda2codec_2x
-
-Optional properties:
-- nvidia,model : The user-visible name of this sound complex. Since the property
-  is optional, legacy boards can use default name provided in hda driver.
-
-Example:
-
-hda@70030000 {
-	compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
-	reg = <0x0 0x70030000 0x0 0x10000>;
-	interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA124_CLK_HDA>,
-		 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
-		 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
-	clock-names = "hda", "hda2hdmi", "hda2codec_2x";
-	resets = <&tegra_car 125>, /* hda */
-		 <&tegra_car 128>, /* hda2hdmi */
-		 <&tegra_car 111>; /* hda2codec_2x */
-	reset-names = "hda", "hda2hdmi", "hda2codec_2x";
-	nvidia,model = "jetson-tk1-hda";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
new file mode 100644
index 0000000..3059bc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra HDA controller
+
+description: |
+  The High Definition Audio (HDA) block provides a serial interface to
+  audio codec. It supports multiple input and output streams.
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^hda@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra30-hda
+      - items:
+          - enum:
+              - nvidia,tegra194-hda
+              - nvidia,tegra186-hda
+              - nvidia,tegra210-hda
+              - nvidia,tegra124-hda
+          - const: nvidia,tegra30-hda
+      - items:
+          - const: nvidia,tegra132-hda
+          - const: nvidia,tegra124-hda
+          - const: nvidia,tegra30-hda
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: The interrupt from the HDA controller
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    maxItems: 3
+    items:
+      - const: hda
+      - const: hda2hdmi
+      - const: hda2codec_2x
+
+  resets:
+    maxItems: 3
+
+  reset-names:
+    maxItems: 3
+    items:
+      - const: hda
+      - const: hda2hdmi
+      - const: hda2codec_2x
+
+  nvidia,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      The user-visible name of this sound complex. If this property is
+      not specified then boards can use default name provided in hda driver.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra124-car-common.h>
+    #include<dt-bindings/interrupt-controller/arm-gic.h>
+
+    hda@70030000 {
+        compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
+        reg = <0x70030000 0x10000>;
+        interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA124_CLK_HDA>,
+                 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
+                 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
+        clock-names = "hda", "hda2hdmi", "hda2codec_2x";
+        resets = <&tegra_car 125>, /* hda */
+                 <&tegra_car 128>, /* hda2hdmi */
+                 <&tegra_car 111>; /* hda2codec_2x */
+        reset-names = "hda", "hda2hdmi", "hda2codec_2x";
+        nvidia,model = "jetson-tk1-hda";
+    };
+
+...
-- 
2.7.4

