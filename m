Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5D1368CFC
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 08:12:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59DD11694;
	Fri, 23 Apr 2021 08:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59DD11694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619158363;
	bh=VZBGMMbCBvX1lXgpT4gTpU2oKWuAeDafKQQuYMyczKA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lkCGiJuz3xocd3YJ96pA+u/jFz+ipCR3AvrIQLtNBTSOvjK6TSTqpJZIB7fnKLa0V
	 NCBb7DFyK0mWpIg134sQECZiOl2ywMv2GdBoWQqRKbv/uEYnV8nfiXoAbVP+pojOKy
	 vXEizNefGFZjSOZNDpKXL+f5Gy6XGyLqYIRIGEV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A62F4F80276;
	Fri, 23 Apr 2021 08:11:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E051F800AE; Fri, 23 Apr 2021 08:11:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86870F800AE
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 08:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86870F800AE
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2431420415A;
 Fri, 23 Apr 2021 08:10:44 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 52EB120416D;
 Fri, 23 Apr 2021 08:10:37 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CF91340339;
 Fri, 23 Apr 2021 08:10:28 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, linux-imx@nxp.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 2/2] ASoC: dt-bindings: imx-akcodec: Add binding doc for
 akcodec machine driver
Date: Fri, 23 Apr 2021 13:51:47 +0800
Message-Id: <1619157107-3734-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619157107-3734-1-git-send-email-shengjiu.wang@nxp.com>
References: <1619157107-3734-1-git-send-email-shengjiu.wang@nxp.com>
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

Imx-akcodec is a new added machine driver for supporting
ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../bindings/sound/imx-audio-akcodec.yaml     | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
new file mode 100644
index 000000000000..7419bf7224e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/imx-audio-akcodec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX audio complex with AK4458/AK5558/AK5552/AK4497 codec
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-audio-ak4458
+      - fsl,imx8mq-audio-ak4497
+      - fsl,imx8mq-audio-ak5558
+      - fsl,imx-audio-ak4497
+      - fsl,imx-audio-ak4458
+      - fsl,imx-audio-ak5558
+      - fsl,imx-audio-ak5552
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  audio-cpu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of a CPU DAI controller
+
+  audio-codec:
+    description: The phandle of Codec DAI controllers, there are two
+                 controllers maximum.
+
+  audio-asrc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of ASRC. It can be absent if there's no
+                 need to add ASRC support via DPCM.
+
+  fsl,tdm:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      This is a boolean property. If present, the TDM mode is enabled.
+
+required:
+  - compatible
+  - model
+  - audio-cpu
+  - audio-codec
+
+additionalProperties: false
+
+examples:
+  - |
+    sound-ak4458 {
+        compatible = "fsl,imx-audio-ak4458";
+        model = "ak4458-audio";
+        audio-cpu = <&sai1>;
+        audio-codec = <&ak4458_1>, <&ak4458_2>;
+    };
-- 
2.17.1

