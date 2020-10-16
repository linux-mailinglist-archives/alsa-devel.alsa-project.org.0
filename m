Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CD82907B5
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 16:50:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B374A17C1;
	Fri, 16 Oct 2020 16:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B374A17C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602859813;
	bh=oY5yMOdKCbQGVo9AGv3B3CxSFoCT0D+DLsP9TUllMNM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kxc7JONRTkgldovXii/n7GQogosaxnCPz0JzWQJLn0U4/HE3TGJVIk1p8AEi171Pn
	 GwXFbQg5Przgc+Bz88Tt5vt9CWpee/CNjhLDwPYTaEgqKdbd++jlsFm3J1aFzqMKKP
	 szFRq/2jU3UUmR+J/gOtrgU+2V0E7hvpHdyPPOIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C723F80307;
	Fri, 16 Oct 2020 16:44:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C94A4F80321; Fri, 16 Oct 2020 16:44:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 552CCF80307
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 16:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 552CCF80307
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Gx0b2dL+"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f89b1c50000>; Fri, 16 Oct 2020 07:44:21 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 14:44:32 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 14:44:26 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <pierre-louis.bossart@linux.intel.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <p.zabel@pengutronix.de>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
Subject: [PATCH v4 11/15] ASoC: dt-bindings: tegra: Add json-schema for Tegra
 audio graph card
Date: Fri, 16 Oct 2020 20:12:58 +0530
Message-ID: <1602859382-19505-12-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602859461; bh=xaEKGdSJZpTs34Twkb/qEzNmCGGuDz9UrGpSqe3rqHo=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=Gx0b2dL+nu5LPRbtcQgF0HkfqLE1ekVmKJZUUDyIEPrspvRehMVcYvnsmxsYCjc5l
 5c0FU6ymVCkuo9aZ208scdfHc6gwQ2tOzuS9rENTnr2te5ZsCXt9NGGj1/KTys+6Ja
 lRYbTS48mhc8RaflOu3J9KeAK2w5WeqFChpUzBoK5csU+OMsumQdOiE7ime8qWdc4c
 ECmthX5NFRx1toYeuobXJGT+4nXv4gIGTDGIOTlcwVuzHPhpx6EfBUBxaOMqC9Kvrf
 +mKEWnOLRu5ZTd4lMzNKu6Uz7eUWfrlZwOqGVu88aKkaFcC6Dz+pYBkzNZGQAx6CsD
 I20vFeZMIaZUw==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 nicoleotsuka@gmail.com, swarren@nvidia.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, atalambedu@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, nwartikar@nvidia.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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
---
 .../sound/nvidia,tegra-audio-graph-card.yaml       | 158 +++++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
new file mode 100644
index 0000000..284d185
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
@@ -0,0 +1,158 @@
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
+  See{LINUX}/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nvidia,tegra210-audio-graph-card
+          - nvidia,tegra186-audio-graph-card
+
+  dais:
+    $ref: /schemas/sound/audio-graph-card.yaml#/properties/dais
+
+  label:
+    $ref: /schemas/sound/simple-card.yaml#/properties/label
+
+  pa-gpios:
+    $ref: /schemas/sound/audio-graph-card.yaml#/properties/pa-gpios
+
+  widgets:
+    $ref: /schemas/sound/simple-card.yaml#/definitions/widgets
+
+  routing:
+    $ref: /schemas/sound/simple-card.yaml#/definitions/routing
+
+  mclk-fs:
+    $ref: /schemas/sound/simple-card.yaml#/definitions/mclk-fs
+
+  prefix:
+    $ref: /schemas/sound/simple-card.yaml#/definitions/prefix
+
+  clocks:
+   minItems: 2
+
+  clock-names:
+   minItems: 2
+   items:
+     - const: pll_a
+     - const: plla_out0
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
+  ports:
+    $ref: /schemas/sound/audio-graph-card.yaml#/properties/ports
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
+
+additionalProperties: false
+
+required:
+  - compatible
+  - dais
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
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
+    tegra_ahub: ahub@702d0800 {
+        // ...
+
+        reg = <0x702d0800 0x800>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            xbar_i2s1_port: port@a {
+                reg = <0xa>;
+                xbar_i2s1_ep: endpoint {
+                    remote-endpoint = <&i2s1_cif_ep>;
+                };
+            };
+        };
+    };
+
+    tegra_i2s1: i2s@702d1000 {
+        // ...
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        reg = <0x702d1000 0x100>;
+
+        port@0 {
+            reg = <0>;
+
+            i2s1_cif_ep: endpoint {
+                remote-endpoint = <&xbar_i2s1_ep>;
+            };
+        };
+
+        i2s1_port: port@1 {
+            reg = <1>;
+
+            i2s1_dap: endpoint {
+                dai-format = "i2s";
+
+                // ...
+            };
+        };
+    };
+
+...
-- 
2.7.4

