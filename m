Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 433EB382A2B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 12:50:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B44DC165E;
	Mon, 17 May 2021 12:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B44DC165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621248600;
	bh=hl+KztOi8bojUeA0tTyxaNcaxmDxVewcUFKB7xDZ/M4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JHrRNgPuLq2vdeDhMQFCTiyjfgAv0zGUVkOXg2OlsbtN6O3tvLL0JhQtaCouhDPut
	 VvdkEDA2XszN/xR8SCCfbr2764Xx4bQrMXN1Dz9XJ0Dkv2PexeTEhKWMU8p8trqsLi
	 z+tWI/zuVmp/Xy+DWbQPkFxMim6p05qFcA3TWp8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B4FDF80246;
	Mon, 17 May 2021 12:48:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BE14F80246; Mon, 17 May 2021 12:48:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18197F80082
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 12:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18197F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="ZSgOk8cr"
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 15EBC1A0A12;
 Mon, 17 May 2021 12:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com 15EBC1A0A12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
 s=nselector3; t=1621248499;
 bh=Im5JodYbpOO68PyPNbm9SHNQGqEZEAD/9V5qHFtCRc0=;
 h=From:To:Subject:Date:From;
 b=ZSgOk8crfOlyKbfm1KA1QIohQUU4aafWPnznyk4kNOIcaIgYGI6pCpKAMuOLJbqWP
 t9g9xcaVba2Ld7dvYP8zR0lwfbD2u9LNJytQZ7KLGgcMRQGiiz7BitBf3s3MvhlcyJ
 6vkZWaW+6Uhsg3lGloKlKH3Q5KXfv+wiiLfd18C4bKDRo1y9UgS2EWM0zqGx/X4DN+
 d6sUP33JhHSWYrPRD2ayD8ZdX7ULBLTK2qCoCMEldY+hyYG9xMRFduyeEtHq+kw/gO
 rLVQROZPdWpEQbPYFo8gsddCqyDBaDA58KdaCeVKYlUJQcfOi1egXFE77QU8estoug
 PN0L7oecv/nHg==
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0C2E21A0A01;
 Mon, 17 May 2021 12:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com 0C2E21A0A01
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A1987402D9;
 Mon, 17 May 2021 18:48:02 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, linux-imx@nxp.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: dt-bindings: imx-card: Add binding doc for imx
 sound card
Date: Mon, 17 May 2021 18:31:27 +0800
Message-Id: <1621247488-21412-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
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

Imx-card is a new added machine driver for supporting
ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms. But these
DAC/ADCs are not only supported codecs. This machine driver is
designed to be a more common machine driver for i.MX platform,
it can support widely cpu dai interface and codec dai interface.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v3:
- use a generic compatible string as Rob's comments.
- change the file name

changes in v2:
- update doc accoring to Rob's comment, use the common porperties.

 .../bindings/sound/imx-audio-card.yaml        | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
new file mode 100644
index 000000000000..d1816dd061cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/imx-audio-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX audio sound card.
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx-audio-card
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
+      dai-tdm-slot-num:
+        description: see tdm-slot.txt.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      dai-tdm-slot-width:
+        description: see tdm-slot.txt.
+        $ref: /schemas/types.yaml#/definitions/uint32
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
+      fsl,mclk-equal-bclk:
+        description: Indicates mclk can be equal to bclk, especially for sai interface
+        $ref: /schemas/types.yaml#/definitions/flag
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
+        compatible = "fsl,imx-audio-card";
+        model = "ak4458-audio";
+        pri-dai-link {
+            link-name = "akcodec";
+            format = "i2s";
+            fsl,mclk-equal-bclk;
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
+            dai-tdm-slot-num = <8>;
+            dai-tdm-slot-width = <32>;
+            fsl,mclk-equal-bclk;
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

