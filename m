Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E28B78CAC53
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 12:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35467202;
	Tue, 21 May 2024 12:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35467202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716287712;
	bh=Sp/7Txf6djQgFui6IajQOXTl4EvU56xHjCMGKqvCCSA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DjqaOdPna2WVcbs0Qfn+DDb5LSX7bvnL89R70SNnje1Ae9Cd2w4JA5oK/S3I1jFjI
	 1QZbyp1CGQ55wV7jzEb2L2Zh/u0hLkMfIYHMA0+49j1OVhFzxEyrsWZOCxvW1S3bIF
	 wss0r7GyhJs4PPnuZU0F9IeDEPLIkJxIiQW31q14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40A4EF805CB; Tue, 21 May 2024 12:34:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4097F805D3;
	Tue, 21 May 2024 12:34:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40FBEF8028B; Tue, 21 May 2024 12:34:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B553FF801F5
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 12:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B553FF801F5
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AF2101A09EF;
	Tue, 21 May 2024 12:34:07 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B4E941A099B;
	Tue, 21 May 2024 12:34:06 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 10CF81820F77;
	Tue, 21 May 2024 18:34:02 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible string for
 i.MX95
Date: Tue, 21 May 2024 18:13:35 +0800
Message-Id: <1716286416-17621-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1716286416-17621-1-git-send-email-shengjiu.wang@nxp.com>
References: <1716286416-17621-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: GC5LLZSXN7DW4MVDEFUGZG7LCVQII5WZ
X-Message-ID-Hash: GC5LLZSXN7DW4MVDEFUGZG7LCVQII5WZ
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GC5LLZSXN7DW4MVDEFUGZG7LCVQII5WZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible string "fsl,imx95-xcvr" for i.MX95 platform.

The difference between each platform is in below table.

+---------+--------+----------+--------+
|  SOC	  |  PHY   | eARC/ARC | SPDIF  |
+---------+--------+----------+--------+
| i.MX8MP |  V1    |  Yes     |  Yes   |
+---------+--------+----------+--------+
| i.MX93  |  N/A   |  N/A     |  Yes   |
+---------+--------+----------+--------+
| i.MX95  |  V2    |  N/A     |  Yes   |
+---------+--------+----------+--------+

On i.MX95, there are two PLL clock sources, they are the parent
clocks of the XCVR root clock. one is for 8kHz series rates, named
as 'pll8k', another one is for 11kHz series rates, named as 'pll11k'.
They are optional clocks, if there are such clocks, then the driver
can switch between them to support more accurate sample rates.

As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
clocks and clock-names properties.

On i.MX95, the 'interrupts' configuration has the same constraint
as i.MX93.

Only on i.MX8MP, the 'resets' is required, but for i.MX95 and i.MX93
there is no such hardware setting.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,xcvr.yaml   | 37 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
index 0eb0c1ba8710..d1dcc27655eb 100644
--- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
@@ -22,6 +22,7 @@ properties:
     enum:
       - fsl,imx8mp-xcvr
       - fsl,imx93-xcvr
+      - fsl,imx95-xcvr
 
   reg:
     items:
@@ -49,6 +50,9 @@ properties:
       - description: PHY clock
       - description: SPBA clock
       - description: PLL clock
+      - description: PLL clock source for 8kHz series
+      - description: PLL clock source for 11kHz series
+    minItems: 4
 
   clock-names:
     items:
@@ -56,6 +60,9 @@ properties:
       - const: phy
       - const: spba
       - const: pll_ipg
+      - const: pll8k
+      - const: pll11k
+    minItems: 4
 
   dmas:
     items:
@@ -79,15 +86,24 @@ required:
   - clock-names
   - dmas
   - dma-names
-  - resets
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8mp-xcvr
+    then:
+      required:
+        - resets
+
   - if:
       properties:
         compatible:
           contains:
             enum:
               - fsl,imx93-xcvr
+              - fsl,imx95-xcvr
     then:
       properties:
         interrupts:
@@ -98,6 +114,25 @@ allOf:
         interrupts:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-xcvr
+    then:
+      properties:
+        clocks:
+          maxItems: 6
+        clock-names:
+          maxItems: 6
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

