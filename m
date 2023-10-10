Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 668FE7BFC57
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 15:01:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0D571501;
	Tue, 10 Oct 2023 15:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0D571501
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696942876;
	bh=EeELU8lM1RH9exlQYeS3/1jW32YALY3T4xjBaW1cEdg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sRFbjsgMDUXti3rm5mX+q9HoV3GjyQYXGux+Stwcq09+hRkO0xHJAogAm0hQW65ke
	 ElM8GzSvQ17lhxLMSprFp2CsL+KK0kOOhSlwHijkN4i+/Otc/fRhQBqnQAEHdlyMZ+
	 IkDqInO/2fgDqmsHFBmmfFV4smvReIa11tiTppZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CBE0F805AA; Tue, 10 Oct 2023 14:59:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0381F8059F;
	Tue, 10 Oct 2023 14:59:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BAABF80579; Tue, 10 Oct 2023 14:59:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 499D3F80310
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 14:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 499D3F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=lIqVHGSB
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39ACrwM5016233;
	Tue, 10 Oct 2023 14:58:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=iI5H47zvcA4f2T9X0SOLjyUIMcFUo42eiKhj9yV6NCc=; b=lI
	qVHGSB+vWxBhvBVCvKZOk7NvDu3/mut7PSOn88IcilkXD2ZxKgdeAlMn9616LKD/
	4Wjd+NWXWqpvmmJk0gOIZrX/MLzEEFI/OgaH6wsMR5d23p6jvwJsKNvZijvQQ3Ib
	1V2qwIy8bDHLCxi5J9zcoBU18PXkez0zNj5NkQyUNpKA2MFot8I2uU4wpSO8WlZN
	JJtHqQBIwrN5kF5TciEI7/KGrtMut/bKWbkPlaCoSHl3yQhKR283grlKCRyLYiWs
	eiH2ArHx1GeJ4IlCkVy4kF7wZ7FuCZV1Jiezyt8Ke+6OlO1TIoA1gtrg7/JFKz3E
	hBSlfwYgvLZ0XvPULiug==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tkhf7j5c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 14:58:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95FE4100058;
	Tue, 10 Oct 2023 14:58:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89FB2231506;
	Tue, 10 Oct 2023 14:58:50 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 14:58:50 +0200
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
        <peng.fan@oss.nxp.com>
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
Subject: [PATCH v6 03/11] dt-bindings: bus: document RIFSC
Date: Tue, 10 Oct 2023 14:57:11 +0200
Message-ID: <20231010125719.784627-4-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_08,2023-10-10_01,2023-05-22_02
Message-ID-Hash: S3UEUVVIGPWBP5IEFJJRRSJTJD3Q4WFN
X-Message-ID-Hash: S3UEUVVIGPWBP5IEFJJRRSJTJD3Q4WFN
X-MailFrom: prvs=86470762f1=gatien.chevallier@foss.st.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
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

Document RIFSC (RIF security controller). RIFSC is a firewall controller
composed of different kinds of hardware resources.

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

 .../bindings/bus/st,stm32mp25-rifsc.yaml      | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
new file mode 100644
index 000000000000..95aa7f04c739
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/st,stm32mp25-rifsc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Resource isolation framework security controller
+
+maintainers:
+  - Gatien Chevallier <gatien.chevallier@foss.st.com>
+
+description: |
+  Resource isolation framework (RIF) is a comprehensive set of hardware blocks
+  designed to enforce and manage isolation of STM32 hardware resources like
+  memory and peripherals.
+
+  The RIFSC (RIF security controller) is composed of three sets of registers,
+  each managing a specific set of hardware resources:
+    - RISC registers associated with RISUP logic (resource isolation device unit
+      for peripherals), assign all non-RIF aware peripherals to zero, one or
+      any security domains (secure, privilege, compartment).
+    - RIMC registers: associated with RIMU logic (resource isolation master
+      unit), assign all non RIF-aware bus master to one security domain by
+      setting secure, privileged and compartment information on the system bus.
+      Alternatively, the RISUP logic controlling the device port access to a
+      peripheral can assign target bus attributes to this peripheral master port
+      (supported attribute: CID).
+    - RISC registers associated with RISAL logic (resource isolation device unit
+      for address space - Lite version), assign address space subregions to one
+      security domains (secure, privilege, compartment).
+
+properties:
+  compatible:
+    contains:
+      const: st,stm32mp25-rifsc
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
+    // In this example, the usart2 device refers to rifsc as its domain
+    // controller.
+    // Access rights are verified before creating devices.
+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    rifsc: bus@42080000 {
+        compatible = "st,stm32mp25-rifsc";
+        reg = <0x42080000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <1>;
+        ranges;
+
+        usart2: serial@400e0000 {
+              compatible = "st,stm32h7-uart";
+              reg = <0x400e0000 0x400>;
+              interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+              clocks = <&ck_flexgen_08>;
+              access-controllers = <&rifsc 32>;
+        };
+    };
-- 
2.35.3

