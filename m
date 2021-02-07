Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4703231238E
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Feb 2021 11:38:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF3F9950;
	Sun,  7 Feb 2021 11:38:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF3F9950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612694334;
	bh=2J/rQEJd12ONydtpn7RMAjjLX4Ppa8lb/kY/oJ9iwk4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B7NBZTrs/vpU0Tb/BNL39VFD8XWlmHELWSjR++HgqdFHTNi8EEpkEma1bpg4uU9Jt
	 +/0qT5tHXK0wCHkjFnnvO9WbREwKnBxKz/LrvnYLXQ0KV9Pizn6c4uzN2yZNUYuA3d
	 BUoGL0aj107yhl1Co/BOmHJUeTTTGAeGxMZv9p88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54494F802D2;
	Sun,  7 Feb 2021 11:36:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF6ADF8028B; Sun,  7 Feb 2021 11:35:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88097F8025F
 for <alsa-devel@alsa-project.org>; Sun,  7 Feb 2021 11:35:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88097F8025F
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1117C2019AE;
 Sun,  7 Feb 2021 11:35:40 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F3B0C200E28;
 Sun,  7 Feb 2021 11:35:34 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2980640326;
 Sun,  7 Feb 2021 11:35:25 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 7/7] ASoC: dt-bindings: imx-rpmsg: Add binding doc for
 rpmsg machine driver
Date: Sun,  7 Feb 2021 18:23:55 +0800
Message-Id: <1612693435-31418-8-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
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

Imx-rpmsg is a new added machine driver for supporting audio on Cortex-M
core. The Cortex-M core will control the audio interface, DMA and audio
codec, setup the pipeline, the audio driver on Cortex-A core side is just
to communitcate with M core, it is a virtual sound card and don't touch
the hardware.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../bindings/sound/imx-audio-rpmsg.yaml       | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml b/Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml
new file mode 100644
index 000000000000..b941aeb80678
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/imx-audio-rpmsg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX audio complex with rpmsg
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx-audio-rpmsg
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  audio-cpu:
+    description: The phandle of an CPU DAI controller
+
+  rpmsg-out:
+    description: |
+      This is a boolean property. If present, the transmitting function
+      will be enabled,
+
+  rpmsg-in:
+    description: |
+      This is a boolean property. If present, the receiving function
+      will be enabled.
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
+    sound-rpmsg {
+        compatible = "fsl,imx-audio-rpmsg";
+        model = "ak4497-audio";
+        audio-cpu = <&rpmsg_audio>;
+        rpmsg-out;
+    };
-- 
2.27.0

