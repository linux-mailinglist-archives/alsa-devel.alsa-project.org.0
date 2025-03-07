Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6DCA61574
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Mar 2025 16:57:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B02A603D3;
	Fri, 14 Mar 2025 16:57:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B02A603D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741967840;
	bh=EaqZroNrajfsDoZLAmk+2BuuAgDA4cJ8IjLDOVAYics=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hA4qzZprgdpi9vH+pD+w5O6Ct2NSvIuFOwAcN6/YvZCjYs2Mv6TOyo6fKOrfFXQiM
	 9r7abQICHNxA4IKi5fKU4JqyVcOG5NiwpORAP2upxYLSXS+wnlsQd5HnG41MAMWYJP
	 babIPJhY/fUvxipXk08PmiSG2LPq4TEI4u1X7g04=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FBE0F805FF; Fri, 14 Mar 2025 16:56:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E34D8F805FC;
	Fri, 14 Mar 2025 16:56:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ADDDF80528; Fri,  7 Mar 2025 10:19:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-91.sina.com.cn (smtp134-91.sina.com.cn
 [180.149.134.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4138DF800ED
	for <alsa-devel@alsa-project.org>; Fri,  7 Mar 2025 10:19:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4138DF800ED
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.31) with ESMTP
	id 67CABA1500000B5C; Fri, 7 Mar 2025 17:19:21 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: D026B0AAB1FE4A218283534808FC78C5
X-SMAIL-UIID: D026B0AAB1FE4A218283534808FC78C5-20250307-171921
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
Subject: [PATCH v5 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
Date: Fri,  7 Mar 2025 17:19:16 +0800
Message-Id: <20250307091916.100164-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250307091916.100164-1-zhangyi@everest-semi.com>
References: <20250307091916.100164-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MOI2D6X2GEVHJVODXFISEBQV3KJ2IQWM
X-Message-ID-Hash: MOI2D6X2GEVHJVODXFISEBQV3KJ2IQWM
X-Mailman-Approved-At: Fri, 14 Mar 2025 15:56:15 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOI2D6X2GEVHJVODXFISEBQV3KJ2IQWM/>
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
 .../bindings/sound/everest,es8389.yaml        | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8389.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
new file mode 100644
index 000000000000..a673df485ab3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
@@ -0,0 +1,50 @@
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
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.17.1

