Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B350C80F01A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 16:25:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FBAE9F6;
	Tue, 12 Dec 2023 16:24:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FBAE9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702394709;
	bh=98S6fEuUyKTo9EnEgMD/MQ8mRKn8mmcGkl1Sl+hxgXo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GFyX2mSG+xy9WuD2bjaLeWOzBQ0MaoDDzpVOMP76mh0trV3j3sLjRFpCDcnS31lLh
	 7MqK1qaIbSpOkcWAbMWVJMlUFuafnK9CGKmZiFqQCiYjZWNhwkuc4E/N/98z5hYAKm
	 dIZTfxgKkHd0FXDFZAyaF4Vl8sqY+f1jOCvhQ6Y8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B6A2F805BF; Tue, 12 Dec 2023 16:24:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 016B4F805A9;
	Tue, 12 Dec 2023 16:24:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7602F8019B; Tue, 12 Dec 2023 16:24:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48E32F80124
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 16:24:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48E32F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=P5a0uB+d
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BCCqu7T030022;
	Tue, 12 Dec 2023 16:24:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=JpXp2EJHxY+VtUUSPxkkTyJMNNq/ux4P17gSFHI+E8k=; b=P5
	a0uB+dKMINb+zPuc568irPju8xw51gybAQYBQqrkUxMu3M/daUwzLeBEMD67Z2pW
	ZH7PDLmlDrfr/B4lVLS62uSacZ8JiKYyAenA/x5fmTYwYB15heyGh8kTJgJvsuQD
	nOz17WrlMaFrPtHehUiLXYUtOzkQH+B35JMddfZeBL7C1Y/9mRxvGId44wPvcQkH
	ZdFozR/5Tbj7PdKW+F1yDiqRLPzvxFskqZmlwOKJrkldl/c9NYieo3Ea4A7LIhBO
	Lb/s9OGh50jT5E2CVdlCnKbHlomgpaRMh5BHVyNnOTf9otZuPl/Nr+TMg4G/wCum
	7XNZu/4Q52TZ8AlCCM3g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvg0gusvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:24:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F638100060;
	Tue, 12 Dec 2023 16:24:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7435A22F7B3;
	Tue, 12 Dec 2023 16:24:05 +0100 (CET)
Received: from localhost (10.252.7.20) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Dec
 2023 16:24:04 +0100
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
        Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH v8 01/13] dt-bindings: document generic access controllers
Date: Tue, 12 Dec 2023 16:23:44 +0100
Message-ID: <20231212152356.345703-2-gatien.chevallier@foss.st.com>
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
Message-ID-Hash: 265MZR246XXG5LVFXHBCJLOSON3O553V
X-Message-ID-Hash: 265MZR246XXG5LVFXHBCJLOSON3O553V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/265MZR246XXG5LVFXHBCJLOSON3O553V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>

Introducing of the generic access controllers bindings for the
access controller provider and consumer devices. Those bindings are
intended to allow a better handling of accesses to resources in a
hardware architecture supporting several compartments.

This patch is based on [1]. It is integrated in this patchset as it
provides a use-case for it.

Diffs with [1]:
	- Rename feature-domain* properties to access-control* to narrow
	  down the scope of the binding
	- YAML errors and typos corrected.
	- Example updated
	- Some rephrasing in the binding description

[1]: https://lore.kernel.org/lkml/0c0a82bb-18ae-d057-562b

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V6:
	- Renamed access-controller to access-controllers
	- Example updated
	- Removal of access-control-provider property

Changes in V5:
	- Diffs with [1]
	- Discarded the [IGNORE] tag as the patch is now part of the
	  patchset

 .../access-controllers.yaml                   | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/access-controllers/access-controllers.yaml

diff --git a/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml b/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
new file mode 100644
index 000000000000..99e2865f0e46
--- /dev/null
+++ b/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/access-controllers/access-controllers.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Domain Access Controllers
+
+maintainers:
+  - Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+
+description: |+
+  Common access controllers properties
+
+  Access controllers are in charge of stating which of the hardware blocks under
+  their responsibility (their domain) can be accesssed by which compartment. A
+  compartment can be a cluster of CPUs (or coprocessors), a range of addresses
+  or a group of hardware blocks. An access controller's domain is the set of
+  resources covered by the access controller.
+
+  This device tree binding can be used to bind devices to their access
+  controller provided by access-controllers property. In this case, the device
+  is a consumer and the access controller is the provider.
+
+  An access controller can be represented by any node in the device tree and
+  can provide one or more configuration parameters, needed to control parameters
+  of the consumer device. A consumer node can refer to the provider by phandle
+  and a set of phandle arguments, specified by '#access-controller-cells'
+  property in the access controller node.
+
+  Access controllers are typically used to set/read the permissions of a
+  hardware block and grant access to it. Any of which depends on the access
+  controller. The capabilities of each access controller are defined by the
+  binding of the access controller device.
+
+  Each node can be a consumer for the several access controllers.
+
+# always select the core schema
+select: true
+
+properties:
+  "#access-controller-cells":
+    description:
+      Number of cells in an access-controllers specifier;
+      Can be any value as specified by device tree binding documentation
+      of a particular provider. The node is an access controller.
+
+  access-controller-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      A list of access-controllers names, sorted in the same order as
+      access-controllers entries. Consumer drivers will use
+      access-controller-names to match with existing access-controllers entries.
+
+  access-controllers:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      A list of access controller specifiers, as defined by the
+      bindings of the access-controllers provider.
+
+additionalProperties: true
+
+examples:
+  - |
+    clock_controller: access-controllers@50000 {
+        reg = <0x50000 0x400>;
+        #access-controller-cells = <2>;
+    };
+
+    bus_controller: bus@60000 {
+        reg = <0x60000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+        #access-controller-cells = <3>;
+
+        uart4: serial@60100 {
+            reg = <0x60100 0x400>;
+            clocks = <&clk_serial>;
+            access-controllers = <&clock_controller 1 2>,
+                                 <&bus_controller 1 3 5>;
+            access-controller-names = "clock", "bus";
+        };
+    };
-- 
2.25.1

