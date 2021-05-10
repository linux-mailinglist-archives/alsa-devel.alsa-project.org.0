Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F17EC377D17
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 09:25:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85BCF16B0;
	Mon, 10 May 2021 09:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85BCF16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620631556;
	bh=6IkXA9L2IF+396egkigmfXp1ysjcbozG2ENwt0OJTFc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C5bYOvqjc/M0Ps5c7VoaHmLUnaOiksBt/88y22ayVeUfASICD5SyEw4Mrqby0XMRn
	 GjLd0CwhEQHadRZnt9eTJ1DVkm9s/E2t55uE2hw1xfp5j87w86riTgO10btza6KZEl
	 LyX9whE1vbEbGAG72TKsZssYSXsQ3xwHPsX26qHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 913C3F8042F;
	Mon, 10 May 2021 09:24:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84AE7F8020C; Mon, 10 May 2021 09:24:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AEF3F800E9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 09:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AEF3F800E9
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D6AE7200121;
 Mon, 10 May 2021 09:24:01 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C939F203C37;
 Mon, 10 May 2021 09:23:51 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 405384030C;
 Mon, 10 May 2021 15:23:40 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, linux-imx@nxp.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: dt-bindings: imx-akcodec: Add binding doc for
 akcodec machine driver
Date: Mon, 10 May 2021 15:07:21 +0800
Message-Id: <1620630441-14358-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620630441-14358-1-git-send-email-shengjiu.wang@nxp.com>
References: <1620630441-14358-1-git-send-email-shengjiu.wang@nxp.com>
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
changes in v2:
- update doc accoring to Rob's comment, use the common porperties.

 .../bindings/sound/imx-audio-akcodec.yaml     | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
new file mode 100644
index 000000000000..0812c4779b59
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
@@ -0,0 +1,107 @@
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
+      - fsl,imx8mq-audio-akcodec
+      - fsl,imx-audio-akcodec
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source. Valid names could be power supplies,
+      MicBias of codec and the jacks on the board.
+
+patternProperties:
+  ".*-dai-link$":
+    description:
+      Each subnode represents a dai link. Subnodes of each dai links would be
+      cpu/codec dais.
+
+    type: object
+
+    properties:
+      link-name:
+        description: Indicates dai-link name and PCM stream name.
+        $ref: /schemas/types.yaml#/definitions/string
+        maxItems: 1
+
+      format:
+        description: audio format.
+        items:
+          enum:
+            - i2s
+            - dsp_b
+
+      cpu:
+        description: Holds subnode which indicates cpu dai.
+        type: object
+        properties:
+          sound-dai: true
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        properties:
+          sound-dai: true
+
+    required:
+      - link-name
+      - cpu
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    sound-ak4458 {
+        compatible = "fsl,imx-audio-akcodec";
+        model = "ak4458-audio";
+        pri-dai-link {
+            link-name = "akcodec";
+            format = "i2s";
+            cpu {
+                 sound-dai = <&sai1>;
+            };
+            codec {
+                 sound-dai = <&ak4458_1>, <&ak4458_2>;
+            };
+        };
+        fe-dai-link {
+            link-name = "HiFi-ASRC-FE";
+            format = "i2s";
+            cpu {
+                sound-dai = <&easrc>;
+            };
+        };
+        be-dai-link {
+            link-name = "HiFi-ASRC-BE";
+            format = "dsp_b";
+            cpu {
+                sound-dai = <&sai1>;
+            };
+            codec {
+                sound-dai = <&ak4458_1>, <&ak4458_2>;
+            };
+        };
+    };
-- 
2.27.0

