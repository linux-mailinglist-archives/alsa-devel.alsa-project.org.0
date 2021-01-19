Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 174452FB4E5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 10:31:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99B191875;
	Tue, 19 Jan 2021 10:30:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99B191875
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611048703;
	bh=UPteC1pgCoXv4rhH8Fh2wYMrsGgQ6L7dAsGHDiRblM0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hmO8PjGMX1yAnaB94Ozz7zX6AfzewUT6j+TSdwUVJxzbcBWIsYhtWObEPpeTPHOAB
	 oNk2P7ZGM/Y0DXW2dI4G90fujeAtR3WKS4sVWZ4lrXlFiilfbleEx1KWwVPX5MG0/Z
	 AU/Li0BeG7Ijk9tOI/p/RfY/9Q7cslDgByNlI4v4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 997C0F804C2;
	Tue, 19 Jan 2021 10:29:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63EFCF8029B; Tue, 19 Jan 2021 10:28:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3665DF80257
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 10:28:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3665DF80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="qn8O5Kuv"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6006a64c0000>; Tue, 19 Jan 2021 01:28:44 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 09:28:44 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 09:28:40 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>
Subject: [RESEND PATCH v6 2/6] ASoC: dt-bindings: tegra: Add json-schema for
 Tegra audio graph card
Date: Tue, 19 Jan 2021 14:58:12 +0530
Message-ID: <1611048496-24650-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611048524; bh=yj6PiAVqxhNZ/wClBAXh8IgIUW3+3I9GHb8QAg2m2BM=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=qn8O5KuvyCZZPYjqyJaxN2DS1lbZtfnd36SYUmieD/Qhw4NOg3LENfG/gWzAgcpqZ
 3K5tj4zU3/EJFrnFIx2ZNETRijoCuHtJKd/hS83oNHzj2WPe8wFkNco+SZpGtVMcSf
 IVQrjdfY5IzIvupbowIK87R6AQ9imRm1LQg7PrUenZpi9UDBxFNKL+MktfqTnVdUiw
 rC2T6p9mHQhs511SCFkTah8SE9bz6f4C97qps/lFrWk8Mo6Vip7K+XVglhzToKsRwD
 GA9E5JbeVletAMIPpawaVzAbYXgSj4nB6GrCYmLJnKJC5YNfbEFHYamw8P9CNfiA/m
 qgJ2i9lG+o/1A==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 linux-tegra@vger.kernel.org
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

Add YAML schema for Tegra audio graph sound card DT bindings. It uses the
same DT bindings provided by generic audio graph driver. Along with this
few standard clock DT bindings are added which are specifically required
for Tegra audio.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../sound/nvidia,tegra-audio-graph-card.yaml       | 187 +++++++++++++++++++++
 1 file changed, 187 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
new file mode 100644
index 0000000..fc271f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
@@ -0,0 +1,187 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-graph-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Graph based Tegra sound card driver
+
+description: |
+  This is based on generic audio graph card driver along with additional
+  customizations for Tegra platforms. It uses the same bindings with
+  additional standard clock DT bindings required for Tegra.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+allOf:
+  - $ref: audio-graph.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra210-audio-graph-card
+      - nvidia,tegra186-audio-graph-card
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: pll_a
+      - const: plla_out0
+
+  assigned-clocks:
+    minItems: 1
+    maxItems: 3
+
+  assigned-clock-parents:
+    minItems: 1
+    maxItems: 3
+
+  assigned-clock-rates:
+    minItems: 1
+    maxItems: 3
+
+required:
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra210-car.h>
+
+    tegra_sound {
+        compatible = "nvidia,tegra210-audio-graph-card";
+
+        clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+                 <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+        clock-names = "pll_a", "plla_out0";
+
+        assigned-clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+                          <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
+                          <&tegra_car TEGRA210_CLK_EXTERN1>;
+        assigned-clock-parents = <0>, <0>, <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+        assigned-clock-rates = <368640000>, <49152000>, <12288000>;
+
+        dais = /* FE */
+               <&admaif1_port>,
+               /* Router */
+               <&xbar_i2s1_port>,
+               /* I/O DAP Ports */
+               <&i2s1_port>;
+
+        label = "jetson-tx1-ape";
+    };
+
+    // The ports are defined for AHUB and its child devices.
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
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0x0>;
+                xbar_admaif1_ep: endpoint {
+                    remote-endpoint = <&admaif1_ep>;
+                };
+            };
+
+            // ...
+
+            xbar_i2s1_port: port@a {
+                reg = <0xa>;
+                xbar_i2s1_ep: endpoint {
+                    remote-endpoint = <&i2s1_cif_ep>;
+                };
+            };
+        };
+
+        admaif@702d0000 {
+            compatible = "nvidia,tegra210-admaif";
+            reg = <0x702d0000 0x800>;
+            dmas = <&adma 1>,  <&adma 1>,
+                   <&adma 2>,  <&adma 2>,
+                   <&adma 3>,  <&adma 3>,
+                   <&adma 4>,  <&adma 4>,
+                   <&adma 5>,  <&adma 5>,
+                   <&adma 6>,  <&adma 6>,
+                   <&adma 7>,  <&adma 7>,
+                   <&adma 8>,  <&adma 8>,
+                   <&adma 9>,  <&adma 9>,
+                   <&adma 10>, <&adma 10>;
+            dma-names = "rx1",  "tx1",
+                        "rx2",  "tx2",
+                        "rx3",  "tx3",
+                        "rx4",  "tx4",
+                        "rx5",  "tx5",
+                        "rx6",  "tx6",
+                        "rx7",  "tx7",
+                        "rx8",  "tx8",
+                        "rx9",  "tx9",
+                        "rx10", "tx10";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                admaif1_port: port@0 {
+                    reg = <0x0>;
+                    admaif1_ep: endpoint {
+                        remote-endpoint = <&xbar_admaif1_ep>;
+                    };
+                };
+
+                // More ADMAIF ports to follow
+            };
+        };
+
+        i2s@702d1000 {
+            compatible = "nvidia,tegra210-i2s";
+            clocks = <&tegra_car TEGRA210_CLK_I2S0>;
+            clock-names = "i2s";
+            assigned-clocks = <&tegra_car TEGRA210_CLK_I2S0>;
+            assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+            assigned-clock-rates = <1536000>;
+            reg = <0x702d1000 0x100>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0x0>;
+
+                    i2s1_cif_ep: endpoint {
+                        remote-endpoint = <&xbar_i2s1_ep>;
+                    };
+                };
+
+                i2s1_port: port@1 {
+                    reg = <0x1>;
+
+                    i2s1_dap: endpoint {
+                        dai-format = "i2s";
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.7.4

