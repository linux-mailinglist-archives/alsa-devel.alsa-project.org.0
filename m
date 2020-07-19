Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80045224F90
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jul 2020 07:04:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26DFB15F9;
	Sun, 19 Jul 2020 07:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26DFB15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595135065;
	bh=L37Jdyu04MGugp3cvKr41qPEyarwNPiTNhnu9AM3UAk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bQHv/5wRRsnel1bqGZvEWnILZ/Sr8TPT9QdFqibBjomKshiFvy4zhd9oCfUHbp5mz
	 2HEtk+sg0xYKkIT/z2McOa6cOIQD4Ywv3VIPwv14ey9jdM5PoR0J468q6s8Mn22IiW
	 RRODnVZpuvTOfbeUqdTQqRsO8T0nqE6W4JMpJ/vU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2318F80212;
	Sun, 19 Jul 2020 07:02:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED589F80141; Sun, 19 Jul 2020 07:01:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31C9EF80141
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 07:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31C9EF80141
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f13d3ae0000>; Sat, 18 Jul 2020 22:01:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sat, 18 Jul 2020 22:01:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sat, 18 Jul 2020 22:01:47 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jul
 2020 05:01:45 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 19 Jul 2020 05:01:45 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f13d3b40002>; Sat, 18 Jul 2020 22:01:45 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v5 01/11] ASoC: dt-bindings: tegra: Add DT bindings for
 Tegra210
Date: Sun, 19 Jul 2020 10:31:20 +0530
Message-ID: <1595134890-16470-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 Sameer Pujar <spujar@nvidia.com>, nwartikar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

This patch adds YAML schema for DT binding of AHUB and few of its
following components. These devices will be registered as ASoC
components and binding will be used on Tegra210 and later chips.
 * ADMAIF
 * I2S
 * DMIC
 * DSPK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1595134894; bh=DX96zRQRNplPikN828HbAfbjGumAn9IgtktrsenKjgk=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
	 Content-Type;
	b=IhfGFjMxsnRHso1Ku2GEGC+mtLCy3AbRKPfgTS56XGqEWquUr/1s8n9tFpriqF7a+
	 tJGrTN9mKhRQGrwdey/AHsMY4Tbm4fKEWxIASgAV/lFPCfgP3BnVjEdHclc7FdBaB0
	 Qvd3zs8HFsgoIzksLrtHNMrUepkeZajn0/XnC7nghGDRim4+6Hauupr5kj/KVlihsS
	 KS1YQ2Zz9TZzLaC5QXALiHj3ATLvBFrmIf6Vj19q7hePt0menTZVzQNy+y3h4xZfLH
	 +OvBCsLgHGGhq+iM9rm64D+S5Op2vCslwq3Q/42TnYZ0vDbD7aA9nTAQzfYeI6HK6b
	 vi7eYbryzCTSg==

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |  83 +++++++++++++
 .../bindings/sound/nvidia,tegra210-admaif.yaml     | 111 +++++++++++++++++
 .../bindings/sound/nvidia,tegra210-ahub.yaml       | 136 +++++++++++++++++++++
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |  83 +++++++++++++
 .../bindings/sound/nvidia,tegra210-i2s.yaml        | 101 +++++++++++++++
 5 files changed, 514 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
new file mode 100644
index 0000000..e620c77
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra186-dspk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra186 DSPK Controller Device Tree Bindings
+
+description: |
+  The Digital Speaker Controller (DSPK) can be viewed as a Pulse
+  Density Modulation (PDM) transmitter that up-samples the input to
+  the desired sampling rate by interpolation and then converts the
+  over sampled Pulse Code Modulation (PCM) input to the desired 1-bit
+  output via Delta Sigma Modulation (DSM).
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^dspk@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra186-dspk
+      - items:
+          - const: nvidia,tegra194-dspk
+          - const: nvidia,tegra186-dspk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: dspk
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+  sound-name-prefix:
+    pattern: "^DSPK[1-9]$"
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Used as prefix for sink/source names of the component. Must be a
+      unique string among multiple instances of the same component.
+      The name can be "DSPK1" or "DSPKx", where x depends on the maximum
+      available instances on a Tegra SoC.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+  - sound-name-prefix
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra186-clock.h>
+
+    dspk@2905000 {
+        compatible = "nvidia,tegra186-dspk";
+        reg = <0x2905000 0x100>;
+        clocks = <&bpmp TEGRA186_CLK_DSPK1>;
+        clock-names = "dspk";
+        assigned-clocks = <&bpmp TEGRA186_CLK_DSPK1>;
+        assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+        assigned-clock-rates = <12288000>;
+        sound-name-prefix = "DSPK1";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
new file mode 100644
index 0000000..41c77f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 ADMAIF Device Tree Bindings
+
+description: |
+  ADMAIF is the interface between ADMA and AHUB. Each ADMA channel
+  that sends/receives data to/from AHUB must interface through an
+  ADMAIF channel. ADMA channel sending data to AHUB pairs with ADMAIF
+  Tx channel and ADMA channel receiving data from AHUB pairs with
+  ADMAIF Rx channel.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^admaif@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra210-admaif
+          - nvidia,tegra186-admaif
+      - items:
+          - const: nvidia,tegra194-admaif
+          - const: nvidia,tegra186-admaif
+
+  reg:
+    maxItems: 1
+
+  dmas: true
+
+  dma-names: true
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: nvidia,tegra210-admaif
+
+then:
+  properties:
+    dmas:
+      description:
+        DMA channel specifiers, equally divided for Tx and Rx.
+      minItems: 1
+      maxItems: 20
+    dma-names:
+      items:
+        pattern: "^[rt]x(10|[1-9])$"
+      description:
+        Should be "rx1", "rx2" ... "rx10" for DMA Rx channel
+        Should be "tx1", "tx2" ... "tx10" for DMA Tx channel
+      minItems: 1
+      maxItems: 20
+
+else:
+  properties:
+    dmas:
+      description:
+        DMA channel specifiers, equally divided for Tx and Rx.
+      minItems: 1
+      maxItems: 40
+    dma-names:
+      items:
+        pattern: "^[rt]x(1[0-9]|[1-9]|20)$"
+      description:
+        Should be "rx1", "rx2" ... "rx20" for DMA Rx channel
+        Should be "tx1", "tx2" ... "tx20" for DMA Tx channel
+      minItems: 1
+      maxItems: 40
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+
+examples:
+  - |
+    admaif@702d0000 {
+        compatible = "nvidia,tegra210-admaif";
+        reg = <0x702d0000 0x800>;
+        dmas = <&adma 1>,  <&adma 1>,
+               <&adma 2>,  <&adma 2>,
+               <&adma 3>,  <&adma 3>,
+               <&adma 4>,  <&adma 4>,
+               <&adma 5>,  <&adma 5>,
+               <&adma 6>,  <&adma 6>,
+               <&adma 7>,  <&adma 7>,
+               <&adma 8>,  <&adma 8>,
+               <&adma 9>,  <&adma 9>,
+               <&adma 10>, <&adma 10>;
+        dma-names = "rx1",  "tx1",
+                    "rx2",  "tx2",
+                    "rx3",  "tx3",
+                    "rx4",  "tx4",
+                    "rx5",  "tx5",
+                    "rx6",  "tx6",
+                    "rx7",  "tx7",
+                    "rx8",  "tx8",
+                    "rx9",  "tx9",
+                    "rx10", "tx10";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
new file mode 100644
index 0000000..44ee9d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 AHUB Device Tree Bindings
+
+description: |
+  The Audio Hub (AHUB) comprises a collection of hardware accelerators
+  for audio pre-processing, post-processing and a programmable full
+  crossbar for routing audio data across these accelerators. It has
+  external interfaces such as I2S, DMIC, DSPK. It interfaces with ADMA
+  engine through ADMAIF.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^ahub@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra210-ahub
+          - nvidia,tegra186-ahub
+      - items:
+          - const: nvidia,tegra194-ahub
+          - const: nvidia,tegra186-ahub
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ahub
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra210-car.h>
+
+    ahub@702d0800 {
+        compatible = "nvidia,tegra210-ahub";
+        reg = <0x702d0800 0x800>;
+        clocks = <&tegra_car TEGRA210_CLK_D_AUDIO>;
+        clock-names = "ahub";
+        assigned-clocks = <&tegra_car TEGRA210_CLK_D_AUDIO>;
+        assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x702d0000 0x702d0000 0x0000e400>;
+
+        // All AHUB child nodes below
+        admaif@702d0000 {
+            compatible = "nvidia,tegra210-admaif";
+            reg = <0x702d0000 0x800>;
+            dmas = <&adma 1>,  <&adma 1>,
+               <&adma 2>,  <&adma 2>,
+               <&adma 3>,  <&adma 3>,
+               <&adma 4>,  <&adma 4>,
+               <&adma 5>,  <&adma 5>,
+               <&adma 6>,  <&adma 6>,
+               <&adma 7>,  <&adma 7>,
+               <&adma 8>,  <&adma 8>,
+               <&adma 9>,  <&adma 9>,
+               <&adma 10>, <&adma 10>;
+            dma-names = "rx1",  "tx1",
+                    "rx2",  "tx2",
+                    "rx3",  "tx3",
+                    "rx4",  "tx4",
+                    "rx5",  "tx5",
+                    "rx6",  "tx6",
+                    "rx7",  "tx7",
+                    "rx8",  "tx8",
+                    "rx9",  "tx9",
+                    "rx10", "tx10";
+        };
+
+        i2s@702d1000 {
+            compatible = "nvidia,tegra210-i2s";
+            reg = <0x702d1000 0x100>;
+            clocks = <&tegra_car TEGRA210_CLK_I2S0>;
+            clock-names = "i2s";
+            assigned-clocks = <&tegra_car TEGRA210_CLK_I2S0>;
+            assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+            assigned-clock-rates = <1536000>;
+            sound-name-prefix = "I2S1";
+        };
+
+        dmic@702d4000 {
+            compatible = "nvidia,tegra210-dmic";
+            reg = <0x702d4000 0x100>;
+            clocks = <&tegra_car TEGRA210_CLK_DMIC1>;
+            clock-names = "dmic";
+            assigned-clocks = <&tegra_car TEGRA210_CLK_DMIC1>;
+            assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+            assigned-clock-rates = <3072000>;
+            sound-name-prefix = "DMIC1";
+        };
+
+        // More child nodes to follow
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
new file mode 100644
index 0000000..1c14e83
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-dmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 DMIC Controller Device Tree Bindings
+
+description: |
+  The Digital MIC (DMIC) Controller is used to interface with Pulse
+  Density Modulation (PDM) input devices. It converts PDM signals to
+  Pulse Coded Modulation (PCM) signals. DMIC can be viewed as a PDM
+  receiver.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^dmic@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra210-dmic
+      - items:
+          - enum:
+              - nvidia,tegra194-dmic
+              - nvidia,tegra186-dmic
+          - const: nvidia,tegra210-dmic
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: dmic
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+  sound-name-prefix:
+    pattern: "^DMIC[1-9]$"
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/string
+    description:
+      used as prefix for sink/source names of the component. Must be a
+      unique string among multiple instances of the same component.
+      The name can be "DMIC1" or "DMIC2" ... "DMICx", where x depends
+      on the maximum available instances on a Tegra SoC.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra210-car.h>
+
+    dmic@702d4000 {
+        compatible = "nvidia,tegra210-dmic";
+        reg = <0x702d4000 0x100>;
+        clocks = <&tegra_car TEGRA210_CLK_DMIC1>;
+        clock-names = "dmic";
+        assigned-clocks = <&tegra_car TEGRA210_CLK_DMIC1>;
+        assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+        assigned-clock-rates = <3072000>;
+        sound-name-prefix = "DMIC1";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
new file mode 100644
index 0000000..7957970
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 I2S Controller Device Tree Bindings
+
+description: |
+  The Inter-IC Sound (I2S) controller implements full-duplex,
+  bi-directional and single direction point-to-point serial
+  interfaces. It can interface with I2S compatible devices.
+  I2S controller can operate both in master and slave mode.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^i2s@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra210-i2s
+      - items:
+          - enum:
+              - nvidia,tegra194-i2s
+              - nvidia,tegra186-i2s
+          - const: nvidia,tegra210-i2s
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: I2S bit clock
+      - description:
+          Sync input clock, which can act as clock source to other I/O
+          modules in AHUB. The Tegra I2S driver sets this clock rate as
+          per bit clock rate. I/O module which wants to use this clock
+          as source, can mention this clock as parent in the DT bindings.
+          This is an optional clock entry, since it is only required when
+          some other I/O wants to reference from a particular I2Sx
+          instance.
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: i2s
+      - const: sync_input
+
+  assigned-clocks:
+    minItems: 1
+    maxItems: 2
+
+  assigned-clock-parents:
+    minItems: 1
+    maxItems: 2
+
+  assigned-clock-rates:
+    minItems: 1
+    maxItems: 2
+
+  sound-name-prefix:
+    pattern: "^I2S[1-9]$"
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Used as prefix for sink/source names of the component. Must be a
+      unique string among multiple instances of the same component.
+      The name can be "I2S1" or "I2S2" ... "I2Sx", where x depends
+      on the maximum available instances on a Tegra SoC.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra210-car.h>
+
+    i2s@702d1000 {
+        compatible = "nvidia,tegra210-i2s";
+        reg = <0x702d1000 0x100>;
+        clocks = <&tegra_car TEGRA210_CLK_I2S0>;
+        clock-names = "i2s";
+        assigned-clocks = <&tegra_car TEGRA210_CLK_I2S0>;
+        assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+        assigned-clock-rates = <1536000>;
+        sound-name-prefix = "I2S1";
+    };
+
+...
-- 
2.7.4

