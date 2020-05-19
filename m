Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DE11D918D
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 10:00:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E81E16EA;
	Tue, 19 May 2020 10:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E81E16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589875257;
	bh=pNDRucgqsWo1fVOYO5dsjLxD1n8btBNndmCA4h8hGvo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ms9WxxzrrsftXOCoObz2N7eOdHI6Zw9EEAq1TuOIgF0rsnBX+0kNLnEe0nIkt5/hO
	 VK5mAG9Egxd5g9mNbjCwndexUY0rrDXLSkb3MLT165oHpFLLs2XkiuzRx3OzZZkX0e
	 Tu9BUsDcmhJBINAEgF903wwLrJZFfNyHuiwrtTII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44815F800C9;
	Tue, 19 May 2020 09:59:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7EA5F801A3; Tue, 19 May 2020 09:59:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5560CF80132
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 09:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5560CF80132
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:918e:b928:22c1:d715])
 by baptiste.telenet-ops.be with bizsmtp
 id gXyz2200Q4CPMDc01XyzuV; Tue, 19 May 2020 09:59:01 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jax9P-0000ML-Fx; Tue, 19 May 2020 09:58:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jax9P-0007GE-EB; Tue, 19 May 2020 09:58:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] ASoC: fsi: Add missing properties to DT bindings
Date: Tue, 19 May 2020 09:58:58 +0200
Message-Id: <20200519075858.27869-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>
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

make dtbs_check:

    arch/arm/boot/dts/r8a7740-armadillo800eva.dt.yaml: sound@fe1f0000: '#sound-dai-cells', 'clocks', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'

Fix this by documenting the missing properties.
Update the example to match reality.
While at it, improve the document title, and comment the various
compatible values with the corresponding SoC names.

Fixes: 7f464532b05dadc8 ("dt-bindings: Add missing 'additionalProperties: false'")
Fixes: 2f52475bac7e1572 ("ASoC: fsi: switch to yaml base Documentation")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
For a clean "make dtbs_check", this depends on "ARM: dts: sh73a0: Add
missing clocks to sound node"
(http://lore.kernel.org/r/20200519075525.24742-1-geert+renesas@glider.be).
---
 .../bindings/sound/renesas,fsi.yaml           | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index 91cf4176abd5f78f..8a4406be387a6b61 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/sound/renesas,fsi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas FSI Sound Driver Device Tree Bindings
+title: Renesas FIFO-buffered Serial Interface (FSI)
 
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
@@ -18,8 +18,8 @@ properties:
       # for FSI2 SoC
       - items:
           - enum:
-              - renesas,fsi2-sh73a0
-              - renesas,fsi2-r8a7740
+              - renesas,fsi2-sh73a0  # SH-Mobile AG5
+              - renesas,fsi2-r8a7740 # R-Mobile A1
           - enum:
               - renesas,sh_fsi2
       # for Generic
@@ -34,6 +34,15 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
   fsia,spdif-connection:
     $ref: /schemas/types.yaml#/definitions/flag
     description: FSI is connected by S/PDIF
@@ -62,16 +71,24 @@ required:
   - compatible
   - reg
   - interrupts
+  - clocks
+  - power-domains
+  - '#sound-dai-cells'
 
 additionalProperties: false
 
 examples:
   - |
-    sh_fsi2: sound@ec230000 {
+    #include <dt-bindings/clock/r8a7740-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    sh_fsi2: sound@fe1f0000 {
             compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
-            reg = <0xec230000 0x400>;
-            interrupts = <0 146 0x4>;
+            reg = <0xfe1f0000 0x400>;
+            interrupts = <GIC_SPI 9 0x4>;
+            clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+            power-domains = <&pd_a4mp>;
 
+            #sound-dai-cells = <1>;
             fsia,spdif-connection;
             fsia,stream-mode-support;
             fsia,use-internal-clock;
-- 
2.17.1

