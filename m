Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E4E1CD06F
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 05:32:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E17561664;
	Mon, 11 May 2020 05:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E17561664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589167961;
	bh=hz/+lWAuk+6aUeT8Tkk2nWH1T19VSQySo+OZ/Zq6R80=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SdNVh15rGFqtgzqN2rl9hsFJMR2q5OuMBLzMRgXMJvxiQD0hD303xuTq52EXOIDp7
	 f2t2lWtYgtw1FVkN5t9uyJcT+UI2Gq4pALqQAAPmQDmUdE4JZlpYW5oyFAvldPFgu3
	 ljRbnikLs9mhN1EbBaVfmSYfBH1QTAAjD7jAYOL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B881FF80157;
	Mon, 11 May 2020 05:30:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AFFFF80107; Mon, 11 May 2020 05:30:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FAF8F80107
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 05:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FAF8F80107
IronPort-SDR: BjNQ9lzZ4Fa0NkdJaw9OeGn59bHhUkYWcoAeHNcmFZi0t+T1J3iNZB7R65jGBevXmGd79/xH9F
 AG0/RmSTzRfg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2020 20:28:58 -0700
IronPort-SDR: S/qRtOhGdqx8dH4eGrxBUbi7fheNMABYxPtEhd31zMF5rauygj/PZp1zoC1o9HQ5P5y5/cRJ1P
 C9mn9ZDYMrKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,378,1583222400"; d="scan'208";a="265024263"
Received: from unknown (HELO jsia-HP-Z620-Workstation.png.intel.com)
 ([10.221.118.135])
 by orsmga006.jf.intel.com with ESMTP; 10 May 2020 20:28:57 -0700
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH 4/4] dt-bindings: sound: Add documentation for KeemBay sound
 card and i2s
Date: Mon, 11 May 2020 11:16:04 +0800
Message-Id: <1589166964-8985-5-git-send-email-jee.heng.sia@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589166964-8985-1-git-send-email-jee.heng.sia@intel.com>
References: <1589166964-8985-1-git-send-email-jee.heng.sia@intel.com>
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

Document Intel KeemBay sound card and i2s DT bindings.

Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
---
 .../bindings/sound/intel,keembay-i2s.yaml          | 57 ++++++++++++++++++++++
 .../bindings/sound/intel,keembay-sound-card.yaml   | 30 ++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/intel,keembay-sound-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
new file mode 100644
index 0000000..737a16d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
@@ -0,0 +1,57 @@
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
+      - snps,designware-i2s
+
+  reg:
+    items:
+      - description: Should contain registers location and length
+
+  reg-names:
+    items:
+      - const: i2s-regs
+      - const: i2s_gen_cfg
+      - const: i2s_gen_cfg_count
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
+examples:
+  - |
+     #include <dt-bindings/interrupt-controller/arm-gic.h>
+     #include <dt-bindings/interrupt-controller/irq.h>
+     #define KEEM_BAY_PSS_AUX_I2S3
+     #define KEEM_BAY_PSS_I2S3
+     i2s@20140000 {
+         compatible = "snps,designware-i2s";
+         reg = <0x0 0x20140000 0x0 0x200 0x0 0x202a00a4 0x0 0x4 0x0 0x202a00c0 0x0 0x4>;
+         reg-names = "i2s-regs", "i2s_gen_cfg", "i2s_gen_cfg_count";
+         interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+         clock-names = "osc", "apb_clk";
+         clocks = <&scmi_clk KEEM_BAY_PSS_AUX_I2S3>, <&scmi_clk KEEM_BAY_PSS_I2S3>;
+     };
diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-sound-card.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-sound-card.yaml
new file mode 100644
index 0000000..cca413a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/intel,keembay-sound-card.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 Intel Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/intel,keembay-sound-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel KeemBay Sound Card
+
+maintainers:
+  - Sia, Jee Heng <jee.heng.sia@intel.com>
+
+description: |
+ Intel KeemBay Sound Card DT Binding
+
+properties:
+  compatible:
+    enum:
+      - intel,kmb-snd-asoc
+
+  intel,pcm-audio:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the i2s
+
+examples:
+ - |
+    sound {
+      compatible = "intel,kmb-snd-asoc";
+      intel,pcm-audio = <&i2s3>;
+    };
-- 
1.9.1

