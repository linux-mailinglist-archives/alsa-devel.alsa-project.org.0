Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB39E31058B
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 08:11:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9332215F9;
	Fri,  5 Feb 2021 08:10:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9332215F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612509084;
	bh=w9e1ppYJfFu4WdHjdwJZR0Ke8zwA8emsbITmuI9v7sk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WwpPBz6Y2MfIbMSDVE4dHkTRylBuNrhRFq026xB4GIOYP/cANaueN+WLUTfo+uQEC
	 U/VARa6bRZTYr3AtfMcIgh+S2Adj1gOqyMmzNsXQAirvSlJbDlP+CUK/S3Q0mbiaVG
	 wB2jDVhOs/Njt/gm5cne5gcdNLc+oBtHx6MZz/kY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EA08F801DB;
	Fri,  5 Feb 2021 08:09:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBD90F8028B; Fri,  5 Feb 2021 08:09:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E78CCF80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 08:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E78CCF80139
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 48E78200B61;
 Fri,  5 Feb 2021 08:08:48 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2DA0C200B08;
 Fri,  5 Feb 2021 08:08:43 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id EE4F940305;
 Fri,  5 Feb 2021 08:08:36 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 3/7] ASoC: dt-bindings: fsl_rpmsg: Add binding doc for rpmsg
 cpu dai driver
Date: Fri,  5 Feb 2021 14:57:26 +0800
Message-Id: <1612508250-10586-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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

fsl_rpmsg cpu dai driver is dummy driver, which is mainly used for
getting the user's configuration from device tree and configure the
clocks which is used by Cortex-M core. So in this document define the
needed property.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
new file mode 100644
index 000000000000..1c2679fac31e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,rpmsg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Audio RPMSG Dummy Controller
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx7ulp-rpmsg
+      - fsl,imx8mn-rpmsg
+      - fsl,imx8mm-rpmsg
+      - fsl,imx8mp-rpmsg
+
+  clocks:
+    items:
+      - description: Peripheral clock for register access
+      - description: Master clock
+      - description: DMA clock for DMA register access
+      - description: Parent clock for multiple of 8kHz sample rates
+      - description: Parent clock for multiple of 11kHz sample rates
+    minItems: 5
+
+  clock-names:
+    items:
+      - const: ipg
+      - const: mclk
+      - const: dma
+      - const: pll8k
+      - const: pll11k
+    minItems: 5
+
+  power-domains:
+    maxItems: 1
+
+  fsl,audioindex:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: instance index for rpmsg image
+
+  fsl,version:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: rpmsg image version index
+
+  fsl,buffer-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: pre allocate dma buffer size
+
+  fsl,enable-lpa:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: enable low power audio path.
+
+  fsl,codec-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Sometimes the codec is registered by
+                 driver not the device tree, this items
+                 can be used to distinguish codecs
+
+required:
+  - compatible
+  - fsl,audioindex
+  - fsl,version
+  - fsl,buffer-size
+
+additionalProperties: false
+
+examples:
+  - |
+    rpmsg_audio: rpmsg_audio {
+        compatible = "fsl,imx8mn-rpmsg";
+        fsl,audioindex = <0> ;
+        fsl,version = <2>;
+        fsl,buffer-size = <0x6000000>;
+        fsl,enable-lpa;
+        status = "okay";
+    };
-- 
2.27.0

