Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD29A4FA6A
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:41:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84BBE60422;
	Wed,  5 Mar 2025 10:41:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84BBE60422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167717;
	bh=hMDNTxNe1t6rAUme6MiOLElfl8ecDVJ2s28+Te73nNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pUFy12DiznNh7r1VmM1L61UXGJJRcLq9YO+O7xSBp5e7/XozEV8c8QkSlra1Cw0Dz
	 IZ+pD/g9yvxpiDmYg30ts/7q2c4RZmcLHjAwikGokp9JFUhYh+OmkxT9zKZsXcwt/9
	 YxUCLqfORnk2N7L/dHPlZR56+8RD+tC8VYYEG01Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAD26F80687; Wed,  5 Mar 2025 10:37:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6B57F80685;
	Wed,  5 Mar 2025 10:37:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 221AEF8051F; Tue,  4 Mar 2025 12:48:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-90.sina.com.cn (smtp134-90.sina.com.cn
 [180.149.134.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C586F8001D
	for <alsa-devel@alsa-project.org>; Tue,  4 Mar 2025 12:48:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C586F8001D
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.31) with ESMTP
	id 67C6E8690000342A; Tue, 4 Mar 2025 19:47:57 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: A6BF3BA464544B9BB303CB3593A370FC
X-SMAIL-UIID: A6BF3BA464544B9BB303CB3593A370FC-20250304-194757
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v4 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
Date: Tue,  4 Mar 2025 19:47:51 +0800
Message-Id: <20250304114751.54635-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250304114751.54635-1-zhangyi@everest-semi.com>
References: <20250304114751.54635-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MZCRSRGQ72LP357ZD3MOBHHWZM7VISXW
X-Message-ID-Hash: MZCRSRGQ72LP357ZD3MOBHHWZM7VISXW
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:37:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZCRSRGQ72LP357ZD3MOBHHWZM7VISXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add device tree binding documentation for Everest ES8389 which
is different from ES8388

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 .../bindings/sound/everest,es8389.yaml        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8389.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
new file mode 100644
index 000000000000..0860adbc8654
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
@@ -0,0 +1,83 @@
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
+allOf:
+  - $ref: dai-common.yaml#
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
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      This property is used to set the slots of recording data when multiple
+      codecs are connected in PTDM mode.
+      please set this property to default if you are setting STDM mode.
+    minimum: 0
+    maximum: 7
+    default: 0
+
+  everest,dac-slot:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      This property is used to set the slots of playing data when multiple
+      codecs are connected in TDM mode.
+      please do not set this property if you use single codec.
+    minimum: 0
+    maximum: 7
+    default: 0
+
+  prefix_name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      When using multiple codecs, The prefix_name is used to distinguish the
+      dapm and kcontrol of each individual codec.
+
+  everest,dmic-enabled:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      ES8389 use DMIC as input
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      es8389: codec@10 {
+        compatible = "everest,es8389";
+        reg = <0x10>;
+        everest,adc-slot = <0>;
+        everest,dac-slot = <0>;
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.17.1

