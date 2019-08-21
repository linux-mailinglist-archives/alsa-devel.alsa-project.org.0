Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0260E980A7
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 18:50:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90BBF166F;
	Wed, 21 Aug 2019 18:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90BBF166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566406218;
	bh=zvPodSlR0FVHFhUfVPiu5IfpzsiRLN9nTcl1VgN42Tw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=scTS58zcpdv+3i7iO1qRVb0pKZ4HOk3wkcLz6JtCTqyo3swQ/K1soZSSia3FC/JYg
	 KYtu3YO81bzCMJpAKc/2jisXzuX759oD+npAaHO1cE2A3efkoILAo0d5RXLU76KMm3
	 2p/+tMBIEUiXH0qKsHFdY9pasZ/681HkOBQLWXnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56F22F805A1;
	Wed, 21 Aug 2019 18:47:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A0AEF80322; Wed, 21 Aug 2019 18:47:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59086F802E0
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 18:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59086F802E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 09:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="181083823"
Received: from unknown (HELO pbossart-mobl3.intel.com) ([10.252.139.119])
 by orsmga003.jf.intel.com with ESMTP; 21 Aug 2019 09:47:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 21 Aug 2019 11:47:28 -0500
Message-Id: <20190821164730.7385-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821164730.7385-1-pierre-louis.bossart@linux.intel.com>
References: <20190821164730.7385-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Xiubo.Lee@gmail.com, tiwai@suse.de,
 Daniel Baluta <daniel.baluta@nxp.com>, shengjiu.wang@nxp.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 nicoleotsuka@gmail.com, broonie@kernel.org, linux-imx@nxp.com,
 viorel.suman@nxp.com, festevam@gmail.com, Rob Herring <robh@kernel.org>
Subject: [alsa-devel] [PATCH v2 1/3] dt-bindings: dsp: fsl: Add DSP core
	binding support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

This describes the DSP device tree node.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
new file mode 100644
index 000000000000..3248595dc93c
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8 DSP core
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+description: |
+  Some boards from i.MX8 family contain a DSP core used for
+  advanced pre- and post- audio processing.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dsp
+
+  reg:
+    description: Should contain register location and length
+
+  clocks:
+    items:
+      - description: ipg clock
+      - description: ocram clock
+      - description: core clock
+
+  clock-names:
+    items:
+      - const: ipg
+      - const: ocram
+      - const: core
+
+  power-domains:
+    description:
+      List of phandle and PM domain specifier as documented in
+      Documentation/devicetree/bindings/power/power_domain.txt
+    maxItems: 4
+
+  mboxes:
+    description:
+      List of <&phandle type channel> - 2 channels for TXDB, 2 channels for RXDB
+      (see mailbox/fsl,mu.txt)
+    maxItems: 4
+
+  mbox-names:
+    items:
+      - const: txdb0
+      - const: txdb1
+      - const: rxdb0
+      - const: rxdb1
+
+  memory-region:
+    description:
+       phandle to a node describing reserved memory (System RAM memory)
+       used by DSP (see bindings/reserved-memory/reserved-memory.txt)
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - mboxes
+  - mbox-names
+  - memory-region
+
+examples:
+  - |
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    #include <dt-bindings/clock/imx8-clock.h>
+    dsp@596e8000 {
+        compatible = "fsl,imx8qxp-dsp";
+        reg = <0x596e8000 0x88000>;
+        clocks = <&adma_lpcg IMX_ADMA_LPCG_DSP_IPG_CLK>,
+                 <&adma_lpcg IMX_ADMA_LPCG_OCRAM_IPG_CLK>,
+                 <&adma_lpcg IMX_ADMA_LPCG_DSP_CORE_CLK>;
+        clock-names = "ipg", "ocram", "core";
+        power-domains = <&pd IMX_SC_R_MU_13A>,
+                        <&pd IMX_SC_R_MU_13B>,
+                        <&pd IMX_SC_R_DSP>,
+                        <&pd IMX_SC_R_DSP_RAM>;
+        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+        mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;
+    };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
