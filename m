Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA680F044
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 16:26:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AF84A4A;
	Tue, 12 Dec 2023 16:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AF84A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702394775;
	bh=0T4VyZb8n+Fr6rE/aCScdaeJJGAa79uX2Rljlcg1KHA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NNTbE3zcT0owBZGanQygFQSAgIUKt14LKBUaIWNCW/IDxO+q1wsZo4wJeve4BX/5c
	 EPJ1yXfm2WnbNpslnK8bFFqRL44B/BHo9IhZL7AIR1oKR46hUx0I/ruRKNwE2t5pUS
	 5Gd2bDc9drUjHp9JFaLtfGWCJnsJkk8DH2tR2UG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50915F805D4; Tue, 12 Dec 2023 16:25:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A91A8F8019B;
	Tue, 12 Dec 2023 16:25:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94682F805B1; Tue, 12 Dec 2023 16:25:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBFA9F8019B
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 16:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBFA9F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=71l+5CnO
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BCCOnGn001179;
	Tue, 12 Dec 2023 16:25:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=QpG4L46teLbBYcxt3AXNM5BujFv4AEDCEiVswfgeH2s=; b=71
	l+5CnOazG6/owrN9/LPpceyoq14h8BUl/wClZ6vlstNujryKkM6aDgjhcYQtywWs
	FrHGo/LqhoPTh783vbnHTfsaTe2FocR9mDik120YyxjrLRTz2iaBPacfIv3XlROD
	vK74aSPwPnapnTnj8rVvUZtCriJBABL7XM7Tu99qpBHR9SZzYONZ5agfTUE27fH2
	4tQY8GEWIN5MeYee+1KHiEsqCxNlJL6X5DGnxjrijiiwZ73/+ENZxaJJZAYRxsEZ
	iY6gkadX2zEHIWMNQXTB+YSXUA0BLcd89So8iKQHm4y7iz2H9k4Ogdk3udACYraD
	vcXxT7I3wTFu7C/kJLsw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvehmc8g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:25:19 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D59610005A;
	Tue, 12 Dec 2023 16:25:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12E8922D195;
	Tue, 12 Dec 2023 16:25:19 +0100 (CET)
Received: from localhost (10.252.7.20) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Dec
 2023 16:25:18 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>, <lee@kernel.org>,
        <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
Subject: [PATCH v8 04/13] dt-bindings: bus: document ETZPC
Date: Tue, 12 Dec 2023 16:23:47 +0100
Message-ID: <20231212152356.345703-5-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.7.20]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-12_09,2023-12-12_01,2023-05-22_02
Message-ID-Hash: Q6CMCJGPF4CZAUHM6V2GDVSEAXBNR3JM
X-Message-ID-Hash: Q6CMCJGPF4CZAUHM6V2GDVSEAXBNR3JM
X-MailFrom: prvs=071036046b=gatien.chevallier@foss.st.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6CMCJGPF4CZAUHM6V2GDVSEAXBNR3JM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document ETZPC (Extended TrustZone protection controller). ETZPC is a
firewall controller.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V6:
    	- Renamed access-controller to access-controllers
    	- Removal of access-control-provider property
    	- Removal of access-controller and access-controller-names
    	  declaration in the patternProperties field. Add
    	  additionalProperties: true in this field.

Changes in V5:
	- Renamed feature-domain* to access-control*

Changes in V2:
	- Corrected errors highlighted by Rob's robot
	- No longer define the maxItems for the "feature-domains"
	  property
	- Fix example (node name, status)
	- Declare "feature-domain-names" as an optional
	  property for child nodes
	- Fix description of "feature-domains" property
	- Reordered the properties so it matches ETZPC
	- Add missing "feature-domain-controller" property

 .../bindings/bus/st,stm32-etzpc.yaml          | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml

diff --git a/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
new file mode 100644
index 000000000000..9ca0ad39bc19
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/st,stm32-etzpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Extended TrustZone protection controller
+
+description: |
+  The ETZPC configures TrustZone security in a SoC having bus masters and
+  devices with programmable-security attributes (securable resources).
+
+maintainers:
+  - Gatien Chevallier <gatien.chevallier@foss.st.com>
+
+properties:
+  compatible:
+    contains:
+      const: st,stm32-etzpc
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the firewall ID associated to the peripheral.
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    description: Peripherals
+    type: object
+
+    additionalProperties: true
+
+    required:
+      - access-controllers
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - "#access-controller-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    // In this example, the usart2 device refers to rifsc as its access
+    // controller.
+    // Access rights are verified before creating devices.
+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp13-clks.h>
+    #include <dt-bindings/reset/stm32mp13-resets.h>
+
+    etzpc: bus@5c007000 {
+        compatible = "st,stm32-etzpc";
+        reg = <0x5c007000 0x400>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <1>;
+        ranges;
+
+        usart2: serial@4c001000 {
+            compatible = "st,stm32h7-uart";
+            reg = <0x4c001000 0x400>;
+            interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&rcc USART2_K>;
+            resets = <&rcc USART2_R>;
+            wakeup-source;
+            dmas = <&dmamux1 43 0x400 0x5>,
+                    <&dmamux1 44 0x400 0x1>;
+            dma-names = "rx", "tx";
+            access-controllers = <&etzpc 17>;
+        };
+    };
-- 
2.25.1

