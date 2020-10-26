Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6549C298AAE
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 11:48:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E732016ED;
	Mon, 26 Oct 2020 11:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E732016ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603709295;
	bh=VfJNe8cezBWVz5cM0IYYeJWuTTi6UTtZ1/Tdffprcws=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L3oj+KzfQfelfrhTn1joe5fS2jwjX4jeD3pyDfjIGPCNt/Lcwi8ZsY8FhTBGDPMLx
	 1Ytzo4sckzWOJBralsmN+fn+xnmppatEuUnTP7Olpi1MCsi/mmZAzqftBezJEnNTtD
	 CIza0eqZfnpcgiPGNpGm2WNCPNbyY9uUoF8tol9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 331F6F800CC;
	Mon, 26 Oct 2020 11:46:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 903B1F80249; Mon, 26 Oct 2020 11:46:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88AF3F800CC
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 11:46:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88AF3F800CC
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 155701A044D;
 Mon, 26 Oct 2020 11:46:33 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F17151A037D;
 Mon, 26 Oct 2020 11:46:27 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 65BED402B1;
 Mon, 26 Oct 2020 11:46:21 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl_aud2htx: Add binding doc for
 aud2htx module
Date: Mon, 26 Oct 2020 18:40:54 +0800
Message-Id: <1603708855-2663-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

AUD2HTX (Audio Subsystem TO HDMI TX Subsystem) is a new
IP module found on i.MX8MP.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../bindings/sound/fsl,aud2htx.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml b/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
new file mode 100644
index 000000000000..18548d0889a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,aud2htx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Audio Subsystem to HDMI RTX Subsystem Controller
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+properties:
+  $nodename:
+    pattern: "^aud2htx@.*"
+
+  compatible:
+    const: fsl,imx8mp-aud2htx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral clock
+
+  clock-names:
+    items:
+      - const: bus
+
+  dmas:
+    items:
+      - description: DMA controller phandle and request line for TX
+
+  dma-names:
+    items:
+      - const: tx
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx8mp-clock.h>
+
+    aud2htx: aud2htx@30cb0000 {
+             compatible = "fsl,imx8mp-aud2htx";
+             reg = <0x30cb0000 0x10000>;
+             interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+             clocks = <&audiomix_clk IMX8MP_CLK_AUDIOMIX_AUD2HTX_IPG>;
+             clock-names = "bus";
+             dmas = <&sdma2 26 2 0>;
+             dma-names = "tx";
+             power-domains = <&audiomix_pd>;
+    };
-- 
2.27.0

