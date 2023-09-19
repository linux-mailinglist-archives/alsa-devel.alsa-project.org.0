Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 887527A5C3B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 10:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E09DBE84;
	Tue, 19 Sep 2023 10:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E09DBE84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695111267;
	bh=Fersj7zx+4b69RRaYXnPKJmPaBdwShUo3JB+zf+AXDw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kjUUaVd22OPEz3BphfQi9yMOUhzM41YWXDRClQBn6+20bYsKYLpD+699yqH4MQ8hT
	 KEhNjsgW2t3WE7kpB9TYpGixTUMeUTgfDCqd7TCbBgABDENVw/69dChuNKk7dHSFou
	 exkmzwNOB2GOCjSNRsukROsZooe678VP9QwxcUhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B54DF805E4; Tue, 19 Sep 2023 10:11:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 967AAF805E6;
	Tue, 19 Sep 2023 10:11:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D1AFF80494; Tue, 19 Sep 2023 03:23:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id EA0E5F8025A
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 03:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA0E5F8025A
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1978116:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Tue, 19 Sep 2023 09:18:22 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Tue, 19 Sep
 2023 09:18:22 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Tue, 19 Sep 2023 09:18:22 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, ChiYuan
 Huang <cy_huang@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	<alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: Add Richtek rtq9128 audio amplifier
Date: Tue, 19 Sep 2023 09:18:20 +0800
Message-ID: <1695086301-10376-2-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1695086301-10376-1-git-send-email-cy_huang@richtek.com>
References: <1695086301-10376-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: prvs=16244D1BD6=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DJKYYC3KKMXQIJKKAABW267CNNJAZCER
X-Message-ID-Hash: DJKYYC3KKMXQIJKKAABW267CNNJAZCER
X-Mailman-Approved-At: Tue, 19 Sep 2023 08:10:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJKYYC3KKMXQIJKKAABW267CNNJAZCER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Create richtek,rtq9128.yaml for rtq9128 amplifier.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
v2
- Dual license
- Add $ref for dai-common.yaml
- Remove delimiter '|' in head of description
---
 .../bindings/sound/richtek,rtq9128.yaml       | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml

diff --git a/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml b/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
new file mode 100644
index 000000000000..d117f08fff30
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/richtek,rtq9128.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RTQ9128 Automative Audio Power Amplifier
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description:
+  The RTQ9128 is a ultra-low output noise, high-efficiency, four-channel
+  class-D audio power amplifier and delivering 4x75W into 4OHm at 10%
+  THD+N from a 25V supply in automotive applications.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - richtek,rtq9128
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      speaker@1a {
+        compatible = "richtek,rtq9128";
+        reg = <0x1a>;
+        enable-gpios = <&gpio 26 GPIO_ACTIVE_HIGH>;
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.34.1

