Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC893F5980
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 09:56:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FF1084A;
	Tue, 24 Aug 2021 09:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FF1084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629791764;
	bh=JSHuNWGMfkaqkZtpuoO02ACavIklAapSo3HK9o4D9v4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C9UjoxgZ3r8WHOaTM2Y9OWcPmyLfCi1cDOwauCQp3vcO/7WBH0fG/bP2PKNvHoYZa
	 7Pg5CMzfmnczyyOADHP14z8LWKlEQqlUu4qy15yQLnM20hkleBwqwgE0bOrGqq/HN9
	 USRMj6RkoxaI1XH2vi8A7u4goiWhaUht5gOsl6Dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BBBEF80424;
	Tue, 24 Aug 2021 09:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE7B9F8032D; Tue, 24 Aug 2021 09:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3EA6F80171
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 09:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3EA6F80171
Received: from localhost (unknown [192.168.167.70])
 by lucky1.263xmail.com (Postfix) with ESMTP id 4C356C2AC7;
 Tue, 24 Aug 2021 15:54:22 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P22778T140142459205376S1629791658930605_; 
 Tue, 24 Aug 2021 15:54:21 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a8e91a1fa888746d1ed6c86e2633ae26>
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
Subject: [PATCH v1 7/7] ASoC: dt-bindings: rockchip: Convert pdm bindings to
 yaml
Date: Tue, 24 Aug 2021 15:54:16 +0800
Message-Id: <1629791656-13698-2-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629791446-13528-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629791446-13528-1-git-send-email-sugar.zhang@rock-chips.com>
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

 .../devicetree/bindings/sound/rockchip,pdm.txt     |  64 ------------
 .../devicetree/bindings/sound/rockchip,pdm.yaml    | 114 +++++++++++++++++++++
 2 files changed, 114 insertions(+), 64 deletions(-)
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
index 0000000..6615717
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,pdm.yaml
@@ -0,0 +1,114 @@
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
+    items:
+      - description: which sdi to connect to path 0
+      - description: which sdi to connect to path 1
+      - description: which sdi to connect to path 2
+      - description: which sdi to connect to path 3
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
+    pdm: pdm@ff040000 {
+      compatible = "rockchip,pdm";
+      reg = <0x0 0xff040000 0x0 0x1000>;
+      clocks = <&cru SCLK_PDM>, <&cru HCLK_PDM>;
+      clock-names = "pdm_clk", "pdm_hclk";
+      dmas = <&dmac 16>;
+      dma-names = "rx";
+      #sound-dai-cells = <0>;
+      pinctrl-names = "default", "sleep";
+      pinctrl-0 = <&pdmm0_clk
+                   &pdmm0_sdi0
+                   &pdmm0_sdi1
+                   &pdmm0_sdi2
+                   &pdmm0_sdi3>;
+      pinctrl-1 = <&pdmm0_clk_sleep
+                   &pdmm0_sdi0_sleep
+                   &pdmm0_sdi1_sleep
+                   &pdmm0_sdi2_sleep
+                   &pdmm0_sdi3_sleep>;
+    };
-- 
2.7.4



