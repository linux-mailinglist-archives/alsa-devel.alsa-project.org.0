Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2AB8D326A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 10:58:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F4987F8;
	Wed, 29 May 2024 10:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F4987F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716973099;
	bh=aIeKtC8Nw2XKj9cg5CHoZdIovhCvGCSW6dffczCPMMg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=f+lmZaGN1RAdWPrnPVTltad1FKDPdWagTJUe80WjQF9aeciQtFa+Ztc6FYJNPJlPV
	 pR9YHN5lWmbvZZnPe/6PufjjoxkSPEDqZzZW6R0CBChgKp7FWsIkrVsM8iSZwEtrMN
	 4E/w2FmfDRYesNRwTHzGunno0yZQuRRbrT8i0+fA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 836C6F805A0; Wed, 29 May 2024 10:57:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A84FF8058C;
	Wed, 29 May 2024 10:57:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA2BBF80149; Wed, 29 May 2024 10:57:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BD84F800E9
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 10:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BD84F800E9
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A46691A1398;
	Wed, 29 May 2024 10:56:01 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 19AE21A083E;
	Wed, 29 May 2024 10:56:01 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 4874F183B72F;
	Wed, 29 May 2024 16:55:58 +0800 (+08)
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
Subject: [PATCH v4 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible string for
 i.MX95
Date: Wed, 29 May 2024 16:40:01 +0800
Message-Id: <1716972002-2315-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1716972002-2315-1-git-send-email-shengjiu.wang@nxp.com>
References: <1716972002-2315-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: CJPHPJQ23FVFHQXUFQFZRYOROIE5LR7H
X-Message-ID-Hash: CJPHPJQ23FVFHQXUFQFZRYOROIE5LR7H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CJPHPJQ23FVFHQXUFQFZRYOROIE5LR7H/>
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
 .../devicetree/bindings/sound/fsl,xcvr.yaml   | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
index 0eb0c1ba8710..197ae8ba9c30 100644
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
@@ -98,6 +114,20 @@ allOf:
         interrupts:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8mp-xcvr
+              - fsl,imx93-xcvr
+    then:
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

