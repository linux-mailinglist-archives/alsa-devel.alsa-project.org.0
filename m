Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1177A4FA4E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:37:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 713376034C;
	Wed,  5 Mar 2025 10:37:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 713376034C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167477;
	bh=WC2QCvg2GL8CmvoMqaoX1OV8oEgQCMAxIuRqsFZIn+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZwSdrgoJq+yaO3sh3ofn8shpOVWLsswBype1CNl9BhlHwzL11bQ1t1ed5DqyCPnZ/
	 bmlD+EBUg+sxEvDry5Jd/rTDwgXYYRZijHrOfZhiwzA3Dlv0yY4EQGqFlGHYMrczFI
	 ArEktMiC5OKV60TZEHSUpcikDKA1y/qeqTh+6t5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6778EF80695; Wed,  5 Mar 2025 10:36:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 505F7F80695;
	Wed,  5 Mar 2025 10:36:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E04D9F800C1; Fri, 28 Feb 2025 11:03:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-87.sina.com.cn (smtp134-87.sina.com.cn
 [180.149.134.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1D64F800C1
	for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2025 11:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1D64F800C1
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.30) with ESMTP
	id 67C189C6000068CE; Fri, 28 Feb 2025 18:02:51 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 7CE770405F764471853BCC45557A06E6
X-SMAIL-UIID: 7CE770405F764471853BCC45557A06E6-20250228-180251
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
Date: Fri, 28 Feb 2025 18:02:45 +0800
Message-Id: <20250228100245.127413-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250228100245.127413-1-zhangyi@everest-semi.com>
References: <20250228100245.127413-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GUCPRJ7H7HJHSTMDOTSA3TD66D3S4EYL
X-Message-ID-Hash: GUCPRJ7H7HJHSTMDOTSA3TD66D3S4EYL
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:36:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GUCPRJ7H7HJHSTMDOTSA3TD66D3S4EYL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add device tree binding documentation for Everest ES8389

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 .../bindings/sound/everest,es8389.yaml        | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/sound/everest,es8389.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
new file mode 100755
index 000000000000..4629a89b915e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es8389.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES8389 audio CODEC
+
+maintainers:
+  - Michael Zhang <zhangyi@everest-semi.com>
+
+properties:
+  compatible:
+    const: everest,es8389
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for master clock (MCLK)
+
+  clock-names:
+    items:
+      - const: mclk
+
+  "#sound-dai-cells":
+    const: 0
+
+  everest,adc-slot:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      This property is used to set the slots of recording data when multiple
+      codecs are connected in PTDM mode.
+      please set this property to default if you are setting STDM mode.
+    minimum: 0x00
+    maximum: 0x07
+    default: 0x00
+
+  everest,dac-slot:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      This property is used to set the slots of playing data when multiple
+      codecs are connected in TDM mode.
+      please do not set this property if you use single codec.
+    minimum: 0x00
+    maximum: 0x07
+    default: 0x00
+
+  prefix_name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: device name prefix
+
+  everest,dmic-enabled:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      The property is a choice between PDM and AMIC
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples for single codec:
+  - |
+    es8389: es8389@10 {
+      compatible = "everest,es8389";
+      status = "okay";
+      reg = <0x10>;
+      everest,adc-slot = [00];
+      everest,dac-slot = [00];
+      prefix_name = "es8389_0";
+      #sound-dai-cells = <0>;
+    };
+
+examples for multi codecs:
+  - |
+    es8389: es8389@10 {
+      compatible = "everest,es8389";
+      status = "okay";
+      reg = <0x10>;
+      everest,adc-slot = [00];
+      everest,dac-slot = [00];
+      prefix_name = "es8389_0";
+      #sound-dai-cells = <0>;
+    };
+    es8389_1: es8389@11 {
+      compatible = "everest,es8389";
+      status = "okay";
+      reg = <0x11>;
+      everest,adc-slot = [01];
+      everest,dac-slot = [01];
+      prefix_name = "es8389_1";
+      clock-names = "mclk";
+      #sound-dai-cells = <0>;
+    };
\ No newline at end of file
-- 
2.17.1

