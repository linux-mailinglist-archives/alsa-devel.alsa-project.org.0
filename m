Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09383778AF8
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 12:09:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B268783E;
	Fri, 11 Aug 2023 12:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B268783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691748581;
	bh=JN5gekxJ5nJplVnkubnEojjRSQ+bT8B/TQHKFB3g+Bw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aR2oNCPUL0mCYPghzUK7y9RFOCkbI9sLZStjxA5LKb0tyIsN+d77yF3LTR12+63af
	 P1rf9IqhL/XPgcw88iI8iZ8jDjUPzvWyIMAP9pBg3o4LYCLz3fVvaZmutD2rwJl1Gz
	 LFfUv8mgvcbYZdiECUOz0hxdqc3hx6bODwrcP3H4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D37FF80567; Fri, 11 Aug 2023 12:08:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62EB2F80557;
	Fri, 11 Aug 2023 12:08:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F6B0F80557; Fri, 11 Aug 2023 12:08:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C263F800F4
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 12:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C263F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=LU6RvEGi
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37B72jef008118;
	Fri, 11 Aug 2023 12:07:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=+UNuTiEun7FhBdsfcJqf/qnk8DNj8pRVH/wzdvv/e68=; b=LU
	6RvEGiWjfTS5SQ1hzOvgyC9i3pIRfWwyGeWwk6cs17GkbGoMqtnrFTs/Gkcs7hB7
	RJGWWjhcGTLUj3aZ7Jd/bRq9Hg7CZlpiMS80w58RL8hvUvLrtTpYgu6HtCWCWD/J
	b9c27Rsix2P8RHB8sMHVQ+tJEo0vbWMK/5pBQwAnY43y49xhAH2x94MWvGIlv8zp
	euHeaPGsZaKT/cgERxmR8hE5/BP2KMo6RWkXGlynlmsvo0RATv4tvR1TSuhDL3si
	+vx/FnRdjpoL5NbKdyh5ydF4VnV6JdaxTK+7ZjnCdPGkq0CG3crrpqYceQX8327c
	RlcnomF/M/DeFvVvzMow==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sd9jrtyf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 12:07:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6065B100058;
	Fri, 11 Aug 2023 12:07:43 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 563362138F9;
	Fri, 11 Aug 2023 12:07:43 +0200 (CEST)
Received: from localhost (10.201.21.121) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 11 Aug
 2023 12:07:42 +0200
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
Subject: [PATCH v4 03/11] dt-bindings: bus: document RIFSC
Date: Fri, 11 Aug 2023 12:07:23 +0200
Message-ID: <20230811100731.108145-4-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811100731.108145-1-gatien.chevallier@foss.st.com>
References: <20230811100731.108145-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_20,2023-08-10_01,2023-05-22_02
Message-ID-Hash: GNMDCLWVGXHH4QL26OFG5HLA7JRTKN2S
X-Message-ID-Hash: GNMDCLWVGXHH4QL26OFG5HLA7JRTKN2S
X-MailFrom: prvs=65871b0d18=gatien.chevallier@foss.st.com
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GNMDCLWVGXHH4QL26OFG5HLA7JRTKN2S/>
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

Changes in V2: 
	- Corrected errors highlighted by Rob's robot
	- No longer define the maxItems for the "feature-domains"
	  property
	- Fix example (node name, status)
	- Declare "feature-domain-names" as an optional
	  property for child nodes
	- Fix description of "feature-domains" property

 .../bindings/bus/st,stm32mp25-rifsc.yaml      | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
new file mode 100644
index 000000000000..7aeb38296616
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
@@ -0,0 +1,105 @@
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
+  "#feature-domain-cells":
+    const: 1
+
+  feature-domain-controller: true
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    description: Peripherals
+    type: object
+    properties:
+      feature-domains:
+        minItems: 1
+        description:
+          The phandle of the firewall controller of the peripheral and the
+          platform-specific firewall ID of the peripheral.
+
+      feature-domain-names:
+        minItems: 1
+
+    required:
+      - feature-domains
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - feature-domain-controller
+  - "#feature-domain-cells"
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
+        feature-domain-controller;
+        #feature-domain-cells = <1>;
+        ranges;
+
+        usart2: serial@400e0000 {
+              compatible = "st,stm32h7-uart";
+              reg = <0x400e0000 0x400>;
+              interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+              clocks = <&ck_flexgen_08>;
+              feature-domains = <&rifsc 32>;
+        };
+    };
-- 
2.25.1

