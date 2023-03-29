Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E866CEF05
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:16:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 613A384D;
	Wed, 29 Mar 2023 18:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 613A384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106568;
	bh=4MelF61u3XuKw9dFs91lDORcDIfaFEje+8xpuMSgiLI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rn50B8WpO3VgDRazOcAm36z7j8BDUXXd2vkw9zmGoTi18KwzwaOtpzbAFF6Y7WVHp
	 GtKxTU/PpVv/JaNRkuu+OW2FlBYvNPk11vyfrdxX6N+CwmhE5EJdzmBxNHHgHx911g
	 CnNQrWhohoJc8QgegwQHBONXImabAhaVb4jwAO1Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C35F8F80578;
	Wed, 29 Mar 2023 18:13:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0164DF80527; Wed, 29 Mar 2023 17:33:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_PASS,T_SPF_HELO_TEMPERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14BA3F8032D
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 17:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14BA3F8032D
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5A6E724DC09;
	Wed, 29 Mar 2023 23:33:33 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Mar
 2023 23:33:33 +0800
Received: from localhost.localdomain (113.72.144.76) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Mar
 2023 23:33:32 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Walker Chen
	<walker.chen@starfivetech.com>
Subject: [PATCH v1 1/3] dt-bindings: sound: Add TDM for StarFive JH7110
Date: Wed, 29 Mar 2023 23:33:18 +0800
Message-ID: <20230329153320.31390-2-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230329153320.31390-1-walker.chen@starfivetech.com>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.144.76]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GV4IVWUXU3NT3CHNQJ4G6SLYGTHKOCEZ
X-Message-ID-Hash: GV4IVWUXU3NT3CHNQJ4G6SLYGTHKOCEZ
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:13:49 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GV4IVWUXU3NT3CHNQJ4G6SLYGTHKOCEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings to describe the TDM driver for the StarFive JH7110 SoC.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 .../bindings/sound/starfive,jh7110-tdm.yaml   | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml

diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
new file mode 100644
index 000000000000..d65b9ed781ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/starfive,jh7110-tdm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 TDM Controller
+
+description: |
+  The TDM Controller is a Time Division Multiplexed audio interface
+  integrated in StarFive JH7110 SoC, allowing up to 8 channels of
+  audio over a serial interface. The TDM controller can operate both
+  in master and slave mode.
+
+maintainers:
+  - Walker Chen <walker.chen@starfivetech.com>
+
+properties:
+  compatible:
+    enum:
+      - starfive,jh7110-tdm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: TDM AHB Clock
+      - description: TDM APB Clock
+      - description: TDM Internal Clock
+      - description: TDM Clock
+      - description: Inner MCLK
+      - description: TDM External Clock
+
+  clock-names:
+    items:
+      - const: tdm_ahb
+      - const: tdm_apb
+      - const: tdm_internal
+      - const: tdm
+      - const: mclk_inner
+      - const: tdm_ext
+
+  resets:
+    items:
+      - description: tdm ahb reset line
+      - description: tdm apb reset line
+      - description: tdm core reset line
+
+  dmas:
+    items:
+      - description: RX DMA Channel
+      - description: TX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    tdm: tdm@10090000 {
+        compatible = "starfive,jh7110-tdm";
+        reg = <0x10090000 0x1000>;
+        clocks = <&syscrg 184>,
+                 <&syscrg 185>,
+                 <&syscrg 186>,
+                 <&syscrg 187>,
+                 <&syscrg 17>,
+                 <&tdm_ext>;
+        clock-names = "tdm_ahb", "tdm_apb",
+                      "tdm_internal", "tdm",
+                      "mclk_inner", "tdm_ext";
+        resets = <&syscrg 105>,
+                 <&syscrg 107>,
+                 <&syscrg 106>;
+        dmas = <&dma 20>, <&dma 21>;
+        dma-names = "rx","tx";
+        #sound-dai-cells = <0>;
+    };
-- 
2.17.1

