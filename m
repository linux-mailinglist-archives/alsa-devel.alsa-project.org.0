Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9999D8C4B81
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 05:32:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87C2B208;
	Tue, 14 May 2024 05:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87C2B208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715657568;
	bh=uZ4ArMp3uQ9mQWoPEupZmFWXJPh2k6MA5dsgzfDsY8o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=O0HTdz/Hjcj0Dff55kjv4quNNeEOfhBIcZRVW1nfbpvL/gjqEE0lDbs120u1+XcIp
	 negquxCWvxTZzCMEdOqYvrZ1nx7alI7q8pkaRiv/3pDs9pUBooxXImGGiWCpxxnY4j
	 2gQm9+0OHCuo+iv+XmVukzgP/mjFF8qF6LI6bt5Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B370F805B5; Tue, 14 May 2024 05:32:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52D78F805C8;
	Tue, 14 May 2024 05:32:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6396F8024C; Tue, 14 May 2024 05:31:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AE1EF800E9
	for <alsa-devel@alsa-project.org>; Tue, 14 May 2024 05:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE1EF800E9
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8D9E32017D4;
	Tue, 14 May 2024 05:31:40 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EE4582017CF;
	Tue, 14 May 2024 05:31:39 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B90D0180222F;
	Tue, 14 May 2024 11:31:37 +0800 (+08)
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
Subject: [PATCH v2 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible string for
 i.MX95
Date: Tue, 14 May 2024 11:12:08 +0800
Message-Id: <1715656329-8061-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715656329-8061-1-git-send-email-shengjiu.wang@nxp.com>
References: <1715656329-8061-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 5UBWW6CPWCEYXJZQAKDIUIOESUYAVHIP
X-Message-ID-Hash: 5UBWW6CPWCEYXJZQAKDIUIOESUYAVHIP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5UBWW6CPWCEYXJZQAKDIUIOESUYAVHIP/>
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

As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4'
for clocks and clock-names properties.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,xcvr.yaml   | 55 +++++++++++++++----
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
index 0eb0c1ba8710..70bcde33e986 100644
--- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
@@ -22,6 +22,7 @@ properties:
     enum:
       - fsl,imx8mp-xcvr
       - fsl,imx93-xcvr
+      - fsl,imx95-xcvr
 
   reg:
     items:
@@ -44,18 +45,12 @@ properties:
     minItems: 1
 
   clocks:
-    items:
-      - description: Peripheral clock
-      - description: PHY clock
-      - description: SPBA clock
-      - description: PLL clock
+    minItems: 4
+    maxItems: 6
 
   clock-names:
-    items:
-      - const: ipg
-      - const: phy
-      - const: spba
-      - const: pll_ipg
+    minItems: 4
+    maxItems: 6
 
   dmas:
     items:
@@ -97,6 +92,46 @@ allOf:
       properties:
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
+          items:
+            - description: Peripheral clock
+            - description: PHY clock
+            - description: SPBA clock
+            - description: PLL clock
+            - description: PLL clock source for 8kHz series
+            - description: PLL clock source for 11kHz series
+          minItems: 4
+        clock-names:
+          items:
+            - const: ipg
+            - const: phy
+            - const: spba
+            - const: pll_ipg
+            - const: pll8k
+            - const: pll11k
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Peripheral clock
+            - description: PHY clock
+            - description: SPBA clock
+            - description: PLL clock
+        clock-names:
+          items:
+            - const: ipg
+            - const: phy
+            - const: spba
+            - const: pll_ipg
 
 additionalProperties: false
 
-- 
2.34.1

