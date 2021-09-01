Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5826B3FD1FA
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 05:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA7FE1779;
	Wed,  1 Sep 2021 05:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA7FE1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630468285;
	bh=VCkjsVuqtUHFaic0a+d/r/nOFuvmXZfP6G+OQyhLybM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PqfKpvhUnSnDMzNXmF1Xw3k1FMWWH0z+NMNZduzaoKs41LeErpfbVLIeSEi4Pinjq
	 nSMpssCEnGeBkIE/j2X7mxAf60hVJyazLCyjM/AuEBfTVcSD8VTMBcij3WSQntAY46
	 ge4X0JUt6D3H9CYMKMHaxuwLz0ExhpmsRwzGvKd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BADD3F804FD;
	Wed,  1 Sep 2021 05:49:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FCF6F804FC; Wed,  1 Sep 2021 05:49:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 275AFF804E2
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 05:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 275AFF804E2
Received: from localhost (unknown [192.168.167.172])
 by lucky1.263xmail.com (Postfix) with ESMTP id B8199CFAFF;
 Wed,  1 Sep 2021 11:48:41 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P6276T140522026899200S1630468119931360_; 
 Wed, 01 Sep 2021 11:48:41 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6a04f27340317120328ab4c36cb59b7e>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: broonie@kernel.org
X-RCPT-COUNT: 6
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Sugar Zhang <sugar.zhang@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de
Subject: [PATCH v3 7/7] ASoC: dt-bindings: rockchip: Convert pdm bindings to
 yaml
Date: Wed,  1 Sep 2021 11:48:38 +0800
Message-Id: <1630468118-7321-2-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630468039-7186-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1630468039-7186-1-git-send-email-sugar.zhang@rock-chips.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
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

This patch converts pdm bindings to yaml.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

Changes in v3:
- Fix property 'path-map' suggested by Rob Herring.

Changes in v2:
- Fix yamllint errors.

 .../devicetree/bindings/sound/rockchip,pdm.txt     |  64 -----------
 .../devicetree/bindings/sound/rockchip,pdm.yaml    | 120 +++++++++++++++++++++
 2 files changed, 120 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,pdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,pdm.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,pdm.txt b/Documentation/devicetree/bindings/sound/rockchip,pdm.txt
deleted file mode 100644
index b2d7e47..0000000
--- a/Documentation/devicetree/bindings/sound/rockchip,pdm.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-* Rockchip PDM controller
-
-Required properties:
-
-- compatible: "rockchip,pdm"
-  - "rockchip,px30-pdm"
-  - "rockchip,rk1808-pdm"
-  - "rockchip,rk3308-pdm"
-  - "rockchip,rk3568-pdm"
-  - "rockchip,rv1126-pdm"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- dmas: DMA specifiers for rx dma. See the DMA client binding,
-	Documentation/devicetree/bindings/dma/dma.txt
-- dma-names: should include "rx".
-- clocks: a list of phandle + clock-specifer pairs, one for each entry in clock-names.
-- clock-names: should contain following:
-   - "pdm_hclk": clock for PDM BUS
-   - "pdm_clk" : clock for PDM controller
-- resets: a list of phandle + reset-specifer paris, one for each entry in reset-names.
-- reset-names: reset names, should include "pdm-m".
-- pinctrl-names: Must contain a "default" entry.
-- pinctrl-N: One property must exist for each entry in
-	     pinctrl-names. See ../pinctrl/pinctrl-bindings.txt
-	     for details of the property values.
-
-Optional properties:
-- rockchip,path-map: This is a variable length array, that shows the mapping
-  of SDIx to PATHx. By default, they are one-to-one mapping as follows:
-
-   path0 <-- sdi0
-   path1 <-- sdi1
-   path2 <-- sdi2
-   path3 <-- sdi3
-
-  e.g. "rockchip,path-map = <3 2 1 0>" means the mapping as follows:
-
-   path0 <-- sdi3
-   path1 <-- sdi2
-   path2 <-- sdi1
-   path3 <-- sdi0
-
-Example for rk3328 PDM controller:
-
-pdm: pdm@ff040000 {
-	compatible = "rockchip,pdm";
-	reg = <0x0 0xff040000 0x0 0x1000>;
-	clocks = <&clk_pdm>, <&clk_gates28 0>;
-	clock-names = "pdm_clk", "pdm_hclk";
-	dmas = <&pdma 16>;
-	#dma-cells = <1>;
-	dma-names = "rx";
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pdmm0_clk
-		     &pdmm0_sdi0
-		     &pdmm0_sdi1
-		     &pdmm0_sdi2
-		     &pdmm0_sdi3>;
-	pinctrl-1 = <&pdmm0_clk_sleep
-		     &pdmm0_sdi0_sleep
-		     &pdmm0_sdi1_sleep
-		     &pdmm0_sdi2_sleep
-		     &pdmm0_sdi3_sleep>;
-};
diff --git a/Documentation/devicetree/bindings/sound/rockchip,pdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,pdm.yaml
new file mode 100644
index 0000000..22e1cf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,pdm.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,pdm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip PDM controller
+
+description:
+  The Pulse Density Modulation Interface Controller (PDMC) is
+  a PDM interface controller and decoder that support PDM format.
+  It integrates a clock generator driving the PDM microphone
+  and embeds filters which decimate the incoming bit stream to
+  obtain most common audio rates.
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,pdm
+      - rockchip,px30-pdm
+      - rockchip,rk1808-pdm
+      - rockchip,rk3308-pdm
+      - rockchip,rk3568-pdm
+      - rockchip,rv1126-pdm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for PDM controller
+      - description: clock for PDM BUS
+
+  clock-names:
+    items:
+      - const: pdm_clk
+      - const: pdm_hclk
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    items:
+      - const: rx
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: reset for PDM controller
+
+  reset-names:
+    items:
+      - const: pdm-m
+
+  rockchip,path-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Defines the mapping of PDM SDIx to PDM PATHx.
+      By default, they are mapped one-to-one.
+    maxItems: 4
+    uniqueItems: true
+    items:
+      enum: [ 0, 1, 2, 3 ]
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3328-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pdm@ff040000 {
+            compatible = "rockchip,pdm";
+            reg = <0x0 0xff040000 0x0 0x1000>;
+            interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru SCLK_PDM>, <&cru HCLK_PDM>;
+            clock-names = "pdm_clk", "pdm_hclk";
+            dmas = <&dmac 16>;
+            dma-names = "rx";
+            #sound-dai-cells = <0>;
+            pinctrl-names = "default", "sleep";
+            pinctrl-0 = <&pdmm0_clk
+                         &pdmm0_sdi0
+                         &pdmm0_sdi1
+                         &pdmm0_sdi2
+                         &pdmm0_sdi3>;
+            pinctrl-1 = <&pdmm0_clk_sleep
+                         &pdmm0_sdi0_sleep
+                         &pdmm0_sdi1_sleep
+                         &pdmm0_sdi2_sleep
+                         &pdmm0_sdi3_sleep>;
+        };
+    };
-- 
2.7.4



