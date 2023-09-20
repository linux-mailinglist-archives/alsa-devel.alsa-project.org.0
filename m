Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E89017A94BA
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:25:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A415206;
	Thu, 21 Sep 2023 15:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A415206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302729;
	bh=UPjgTbT8a40bfmtAEf3UzLG2zB1cinN3u1mfFNQe9Nk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CxhFyVmhrvLCsMH8pyU8UoPDs9TuiQNQ0Ungla3K/Fb5CgPBvRYM3maoxAIOV4eLW
	 M/ORug+smMKEatkZHbngGFtnhpVnEVGz7Ni+bzHKI4Tfo9VzX/YcHCEo1GlUxUJgnA
	 3cckZFHFFmly24N3Sz8XnlPRjqn6QLi6kM8utAdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE5F6F80588; Thu, 21 Sep 2023 15:22:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3D81F80578;
	Thu, 21 Sep 2023 15:22:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 836B3F8025A; Wed, 20 Sep 2023 05:52:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id 30688F801F5
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 05:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30688F801F5
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1978106:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Wed, 20 Sep 2023 11:50:36 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 20 Sep
 2023 11:50:35 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Wed, 20 Sep 2023 11:50:35 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Pierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>, ChiYuan Huang
	<cy_huang@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	<alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: Add Richtek rtq9128 audio amplifier
Date: Wed, 20 Sep 2023 11:50:33 +0800
Message-ID: <1695181834-5809-2-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1695181834-5809-1-git-send-email-cy_huang@richtek.com>
References: <1695181834-5809-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: prvs=16244D1BD6=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NIH5SHHHHIUSOT4FYARUHN3NHSDXPDZA
X-Message-ID-Hash: NIH5SHHHHIUSOT4FYARUHN3NHSDXPDZA
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:22:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIH5SHHHHIUSOT4FYARUHN3NHSDXPDZA/>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v3
- Add Reviewed-by tag

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

