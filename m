Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF691EA196
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 12:10:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFA671717;
	Mon,  1 Jun 2020 12:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFA671717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591006200;
	bh=B3V3MTZHqGT81Zv4orLaAJOEuGuR6fQ42kTD4gHq38s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aPlaBjwxUrJjzwXzOxBocoC7avGqcXPW9r14g6cWq1IyDXbd6d1v0TQB8hGehRGdf
	 lDdzlTOi3lBgDyAplOJEoEHHTZReBh0jTV/5zMGsinufgEc6wJIZ2CNeaYaP/mDJhq
	 2rbOv9ekWVPbMExd1DdPjLkwfaf0Kri3VJaNxzvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB2BF8013D;
	Mon,  1 Jun 2020 12:06:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94990F802A9; Mon,  1 Jun 2020 12:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C69ACF8013D
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 12:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C69ACF8013D
IronPort-SDR: v8TF8A/pWf8OucV6ep/LERwwXLiiYYfh37g/o3dSl0+HG57z5MaAeg6wBphzNThASAab50DqG0
 6BKbEIxjn3Wg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 03:06:33 -0700
IronPort-SDR: cZ7POQhtJoKoWD2dce4XJJo+qHl8EMZROXKKTquMb5gUvraDjON1TWsSh7wlJEcjFboVFSrbMo
 D8xuSbVVF1Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="415758451"
Received: from unknown (HELO jsia-HP-Z620-Workstation.png.intel.com)
 ([10.221.118.135])
 by orsmga004.jf.intel.com with ESMTP; 01 Jun 2020 03:06:32 -0700
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH v3 3/3] dt-bindings: sound: Add documentation for KeemBay i2s
Date: Mon,  1 Jun 2020 17:53:21 +0800
Message-Id: <1591005201-31704-4-git-send-email-jee.heng.sia@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591005201-31704-1-git-send-email-jee.heng.sia@intel.com>
References: <1591005201-31704-1-git-send-email-jee.heng.sia@intel.com>
Cc: liam.r.girdwood@linux.intel.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

Document Intel KeemBay i2s DT bindings.

Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
---
 .../bindings/sound/intel,keembay-i2s.yaml          | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
new file mode 100644
index 0000000..175e4fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 Intel Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/intel,keembay-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel KeemBay I2S Device Tree Bindings
+
+maintainers:
+  - Sia, Jee Heng <jee.heng.sia@intel.com>
+
+description: |
+ Intel KeemBay I2S
+
+properties:
+  compatible:
+    enum:
+      - intel,keembay-i2s
+
+  "#sound-dai-cells":
+    const: 0
+
+  reg:
+    items:
+      - description: I2S configuration
+
+  reg-names:
+    items:
+      - const: i2s-regs
+      - const: i2s_gen_cfg
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: osc
+      - const: apb_clk
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+examples:
+  - |
+     #include <dt-bindings/interrupt-controller/arm-gic.h>
+     #include <dt-bindings/interrupt-controller/irq.h>
+     #define KEEM_BAY_PSS_AUX_I2S3
+     #define KEEM_BAY_PSS_I2S3
+     i2s3: i2s@20140000 {
+         compatible = "intel,keembay-i2s";
+         #sound-dai-cells = <0>;
+         reg = <0x20140000 0x200 0x202a00a4 0x4>;
+         reg-names = "i2s-regs", "i2s_gen_cfg";
+         interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+         clock-names = "osc", "apb_clk";
+         clocks = <&scmi_clk KEEM_BAY_PSS_AUX_I2S3>, <&scmi_clk KEEM_BAY_PSS_I2S3>;
+     };
-- 
1.9.1

