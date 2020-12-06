Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C69692D02F6
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 11:51:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF83B1790;
	Sun,  6 Dec 2020 11:50:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF83B1790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607251905;
	bh=cre4ywBr6NEc2sClDhpJoXf1dKJBoApxlXDYlNL390A=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GbEifY+1Z8JLTYSkIftULXwJpN5wSnTYLDflsnzZmxZD990Y9pg+AmGYZ81p4oHkD
	 Ocpp2Ge0QL+97wb9FbMhjSnT0PeiZMhyy3V3fU2hhHFFet99qswjg+hpZuXhH8Nhx5
	 1K2Xw4Kcxv5XrH5+j0sHBVg05z8FMDA8UDlgG2G0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9724DF800E1;
	Sun,  6 Dec 2020 11:49:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8544CF8010A; Sun,  6 Dec 2020 11:49:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF97FF8010A
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 11:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF97FF8010A
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BDF251A087E;
 Sun,  6 Dec 2020 11:49:48 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A3EE91A0AAF;
 Sun,  6 Dec 2020 11:49:43 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 26057402D0;
 Sun,  6 Dec 2020 11:49:37 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: dt-bindings: imx-hdmi: Add binding doc for hdmi
 machine driver
Date: Sun,  6 Dec 2020 18:41:58 +0800
Message-Id: <1607251319-5821-1-git-send-email-shengjiu.wang@nxp.com>
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

Imx-hdmi is a new added machine driver for supporting hdmi devices
on i.MX platforms. There is HDMI IP or external HDMI modules connect
with SAI or AUD2HTX interface.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- none

 .../bindings/sound/imx-audio-hdmi.yaml        | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-hdmi.yaml b/Documentation/devicetree/bindings/sound/imx-audio-hdmi.yaml
new file mode 100644
index 000000000000..d5474f83ac2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/imx-audio-hdmi.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/imx-audio-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX audio complex with HDMI
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx-audio-hdmi
+      - fsl,imx-audio-sii902x
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  audio-cpu:
+    description: The phandle of an CPU DAI controller
+
+  hdmi-out:
+    description: |
+      This is a boolean property. If present, the transmitting function
+      of HDMI will be enabled, indicating there's a physical HDMI out
+      connector or jack on the board or it's connecting to some other IP
+      block, such as an HDMI encoder or display-controller.
+
+  hdmi-in:
+    description: |
+      This is a boolean property. If present, the receiving function of
+      HDMI will be enabled, indicating there is a physical HDMI in
+      connector/jack on the board.
+
+required:
+  - compatible
+  - model
+  - audio-cpu
+
+additionalProperties: false
+
+examples:
+  - |
+    sound-hdmi {
+        compatible = "fsl,imx-audio-hdmi";
+        model = "audio-hdmi";
+        audio-cpu = <&aud2htx>;
+        hdmi-out;
+    };
-- 
2.27.0

