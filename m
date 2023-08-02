Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1434476FD90
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:40:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5949885D;
	Fri,  4 Aug 2023 11:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5949885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142015;
	bh=BNkya1TDh4qDREfKESk7raNUCcaMAKGApyhk3XkSe+Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tqOCYw/niZP6TtB5zvvg4AKfH3UqEjmQhAFr8AtrtedvP4re+45W0gahy3fwTSDoN
	 7KBk83rKFFS8OWrrTOmefuDfl/KfzHarGQb5IUXmjvTE7gD69n97sZ1SGIDylevSXY
	 GnoMvgsQpSU+5MYBnoh/3ZZA1lAqncdMGSX0xSfM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC76BF805BA; Fri,  4 Aug 2023 11:37:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDC02F805B1;
	Fri,  4 Aug 2023 11:37:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C480EF8053B; Wed,  2 Aug 2023 10:43:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B528F80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 10:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B528F80149
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A3F7582CA;
	Wed,  2 Aug 2023 16:43:04 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 2 Aug
 2023 16:43:04 +0800
Received: from localhost.localdomain (183.27.98.54) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 2 Aug
 2023 16:43:03 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Maxim
 Kochetkov" <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>, "Xingyu
 Wu" <xingyu.wu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v1 2/5] ASoC: dt-bindings: snps,designware-i2s: Add StarFive
 JH7110 SoC support
Date: Wed, 2 Aug 2023 16:42:58 +0800
Message-ID: <20230802084301.134122-3-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.98.54]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5GD6ZJFHOWGL6ZZJ4WXTMOS3HNAV6A5P
X-Message-ID-Hash: 5GD6ZJFHOWGL6ZZJ4WXTMOS3HNAV6A5P
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:37:38 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the StarFive JH7110 (TX0/TX1/RX channel) SoC support in the bindings
of Designware I2S controller. The I2S controller needs two reset items
to work properly on the JH7110 SoC. And TX0 channel as master mode needs
5 clock items and TX1/RX channels as slave mode need 9 clock items on
the JH7110 SoC. The RX channel needs System Register Controller property
to enable it and other platforms do not need it.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../bindings/sound/snps,designware-i2s.yaml   | 101 +++++++++++++++++-
 1 file changed, 98 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/snps,designware-i2s.=
yaml b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
index a970fd264b21..a5ab7f3e49b2 100644
--- a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
@@ -17,6 +17,9 @@ properties:
           - const: snps,designware-i2s
       - enum:
           - snps,designware-i2s
+          - starfive,jh7110-i2stx0
+          - starfive,jh7110-i2stx1
+          - starfive,jh7110-i2srx
=20
   reg:
     maxItems: 1
@@ -29,15 +32,36 @@ properties:
     maxItems: 1
=20
   clocks:
-    description: Sampling rate reference clock
-    maxItems: 1
+    items:
+      - description: Sampling rate reference clock
+      - description: APB clock
+      - description: Audio master clock
+      - description: Inner audio master clock source
+      - description: External audio master clock source
+      - description: Bit clock
+      - description: Left/right channel clock
+      - description: External bit clock
+      - description: External left/right channel clock
+    minItems: 1
=20
   clock-names:
-    const: i2sclk
+    items:
+      - const: i2sclk
+      - const: apb
+      - const: mclk
+      - const: mclk_inner
+      - const: mclk_ext
+      - const: bclk
+      - const: lrck
+      - const: bclk_ext
+      - const: lrck_ext
+    minItems: 1
=20
   resets:
     items:
       - description: Optional controller resets
+      - description: controller reset of Sampling rate
+    minItems: 1
=20
   dmas:
     items:
@@ -51,6 +75,17 @@ properties:
       - const: rx
     minItems: 1
=20
+  starfive,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to System Register Controller sys_sysco=
n node.
+          - description: I2S-rx enabled control offset of SYS_SYSCONSAIF=
__SYSCFG register.
+          - description: I2S-rx enabled control mask
+    description:
+      The phandle to System Register Controller syscon node and the I2S-=
rx(ADC)
+      enabled control offset and mask of SYS_SYSCONSAIF__SYSCFG register=
.
+
 allOf:
   - $ref: dai-common.yaml#
   - if:
@@ -66,6 +101,66 @@ allOf:
       properties:
         "#sound-dai-cells":
           const: 0
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: snps,designware-i2s
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+        resets:
+          maxItems: 1
+    else:
+      properties:
+        resets:
+          minItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-i2stx0
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+      required:
+        - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-i2stx1
+    then:
+      properties:
+        clocks:
+          minItems: 9
+        clock-names:
+          minItems: 9
+      required:
+        - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-i2srx
+    then:
+      properties:
+        clocks:
+          minItems: 9
+        clock-names:
+          minItems: 9
+      required:
+        - resets
+        - starfive,syscon
+    else:
+      properties:
+        starfive,syscon: false
=20
 required:
   - compatible
--=20
2.25.1

