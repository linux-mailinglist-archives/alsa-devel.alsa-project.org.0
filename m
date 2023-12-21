Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8135E822164
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:51:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E523A950;
	Tue,  2 Jan 2024 19:51:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E523A950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221514;
	bh=GmqrKJTTGPRiALNb0irStnUl6pDUV2vzAIWeHiBaB/c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IfWDoIsyo58S+5k4yzgzJTeSnKZvpeurrtrh/AltNAXNNp+iOr9thsmzx9i/Fi/X6
	 l3rmgQeU7hTBmDQlxRbmoDiy6NyIMV2ptVvK038cVht3TQfZR21ipQkuO3mmvx6++K
	 cyJeAxQLk9L26dOWNsgUUXca2qYeQhaOfNXucenU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EF31F80587; Tue,  2 Jan 2024 19:50:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75227F80567;
	Tue,  2 Jan 2024 19:50:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C40EF80153; Thu, 21 Dec 2023 04:32:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 327A6F80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 04:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 327A6F80124
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 59C7B24E280;
	Thu, 21 Dec 2023 11:32:25 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 11:32:25 +0800
Received: from localhost.localdomain (113.72.145.47) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 11:32:24 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
CC: Walker Chen <walker.chen@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>
Subject: [PATCH v1 1/2] dt-bindings: ASoC: Add Cadence I2S controller for
 StarFive JH8100 SoC
Date: Thu, 21 Dec 2023 11:32:22 +0800
Message-ID: <20231221033223.73201-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231221033223.73201-1-xingyu.wu@starfivetech.com>
References: <20231221033223.73201-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.145.47]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JKSHV7G4Q7MQXA4DL74VTXXYXFZILEMP
X-Message-ID-Hash: JKSHV7G4Q7MQXA4DL74VTXXYXFZILEMP
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:17:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKSHV7G4Q7MQXA4DL74VTXXYXFZILEMP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for the Multi-Channel I2S controller of Cadence
on the StarFive JH8100 SoC.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../bindings/sound/cdns,jh8100-i2s.yaml       | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cdns,jh8100-i=
2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/cdns,jh8100-i2s.yaml=
 b/Documentation/devicetree/bindings/sound/cdns,jh8100-i2s.yaml
new file mode 100644
index 000000000000..5d95d9ab3e45
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cdns,jh8100-i2s.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cdns,jh8100-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence multi-channel I2S controller for StarFive JH8100 SoC
+
+description: |
+  The Cadence I2S Controller implements a function of the multi-channel
+  (up to 8-channel) bus. It combines functions of a transmitter and a re=
ceiver.
+  It is used in the StarFive JH8100 SoC.
+
+maintainers:
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+  - Walker Chen <walker.chen@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh8100-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      The interrupt line number for the I2S controller. Add this
+      parameter if the I2S controller that you are using does not
+      support DMA.
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bit clock
+      - description: Main ICG clock
+      - description: Inner master clock
+
+  clock-names:
+    items:
+      - const: bclk
+      - const: icg
+      - const: mclk_inner
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: TX DMA Channel
+      - description: RX DMA Channel
+    minItems: 1
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+    minItems: 1
+
+  cdns,i2s-max-channels:
+    description: |
+      Number of I2S max stereo channels supported by the hardware.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 8
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
+
+oneOf:
+  - required:
+      - dmas
+      - dma-names
+  - required:
+      - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2s@122b0000 {
+      compatible =3D "starfive,jh8100-i2s";
+      reg =3D <0x122b0000 0x1000>;
+      clocks =3D <&syscrg_ne 133>,
+               <&syscrg_ne 170>,
+               <&syscrg 50>;
+      clock-names =3D "bclk", "icg",
+                    "mclk_inner";
+      resets =3D <&syscrg_ne 43>;
+      dmas =3D <&dma 7>, <&dma 6>;
+      dma-names =3D "tx", "rx";
+      cdns,i2s-max-channels =3D <2>;
+      #sound-dai-cells =3D <0>;
+    };
--=20
2.25.1

