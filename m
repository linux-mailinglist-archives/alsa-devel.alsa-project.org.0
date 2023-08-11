Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB83778AD6
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 12:08:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE1B13E7;
	Fri, 11 Aug 2023 12:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE1B13E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691748530;
	bh=cDZUe+bS0wGD2V9Xyhzz3L1/r5CAUkHZNN6h7zn/OGo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VXcRd+NE80ML4C6xtuKMRQxtDWwRZQY60u4rju6Pa6NVQE332ZOAzKpltXX9+SeAp
	 ONB4Yw72xQmvippeom6ZscFFbzdzLbX6L3qu/SDOB+bnoAbs8/nD+NrPzwcKBf7Iv3
	 Kxtmlt31Z2tz8gnueCKysrPhYYLf8kmywVCPB/mM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7628DF80134; Fri, 11 Aug 2023 12:08:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0602BF801EB;
	Fri, 11 Aug 2023 12:08:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57782F80510; Fri, 11 Aug 2023 12:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3DD9F80016
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 12:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3DD9F80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=ztdLCCs9
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37B6sQmc008644;
	Fri, 11 Aug 2023 12:07:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=HR3hURRfNMxwM0MNF+bffvIV/HtWswDGC7r7A8PHRvw=; b=zt
	dLCCs9Mh95e+0719CFdW3EV6mAoXUpTAZGo8U7JU77UEtgPshTkd0IN7xof5vy8h
	kjkQa4QYKTYkEHuVDbH+wYpvI10km7WmmIUjupCqYBEMDMvxVcVEql/OUlzpNMIO
	qKrynGR+MoLX5A061Xf5DV/ClsrEe/vQBunQfbZ0VAMxyelZMIx4vQ/uSTzzvSD+
	DAqCcbBNaOK28L5vBecTAegcqlqG7oSZwBtAB38H2hyN8Hq9wNk5m98SeERclQA+
	DTHJtwZ2Z42tb/pQi3iCHs57qffMt2rWWumDM4NevRPVGj5nyT7mPxKZV7LfsVpc
	MaqpOlbkpJX9JIgX7KKA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sd9jrtyf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 12:07:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8031100050;
	Fri, 11 Aug 2023 12:07:41 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 985B02138FD;
	Fri, 11 Aug 2023 12:07:41 +0200 (CEST)
Received: from localhost (10.201.21.121) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 11 Aug
 2023 12:07:41 +0200
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
        Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [IGNORE][PATCH v4 01/11] dt-bindings: Document common device
 controller bindings
Date: Fri, 11 Aug 2023 12:07:21 +0200
Message-ID: <20230811100731.108145-2-gatien.chevallier@foss.st.com>
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
Message-ID-Hash: HHTJLLKNCMEMFMYBN55O7ASROLHDGLFY
X-Message-ID-Hash: HHTJLLKNCMEMFMYBN55O7ASROLHDGLFY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HHTJLLKNCMEMFMYBN55O7ASROLHDGLFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>

Introducing of the common device controller bindings for the controller
provider and consumer devices. Those bindings are intended to allow
divided system on chip into multiple domains, that can be used to
configure hardware permissions.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
[Gatien: Fix typos and YAML error]
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V4: 
	Corrected typos and YAML errors	
	
 .../feature-domain-controller.yaml            | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml

diff --git a/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml b/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
new file mode 100644
index 000000000000..57217da2d1cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/feature-controllers/feature-domain-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Domain Controller
+
+maintainers:
+  - Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+
+description: |+
+  Common Feature Domains Controller properties
+
+  Domain controllers allow to divided system on chip into multiple feature
+  domains that can be used to select by who hardware blocks could be accessed.
+  A feature domain could be a cluster of CPUs (or coprocessors), a range of
+  addresses or a group of hardware blocks.
+
+  This device tree bindings can be used to bind feature domain consumer devices
+  with their feature domains provided by feature-domains controllers.
+  Feature omain controller provider can be represened by any node in the
+  device tree and can provide one or more configuration parameters, needed to
+  control parameters of the consumer device. A consumer node can refer to the
+  provider by phandle and a set of phandle arguments, specified by
+  '#feature-domain-cells' property in the device controller provider node.
+
+  Device controllers are typically used to set the permissions of the hardware
+  block. The contents of the feature-domains configuration properties are
+  defined by the binding for the individual feature-domains controller device.
+
+  Each node can be a consumer for the several providers. The first
+  configuration of 'feature-domains' or the one named 'default' is applied
+  before probing the device itself.
+
+# always select the core schema
+select: true
+
+properties:
+  '#feature-domain-cells':
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of cells in a feature-domains controller specifier;
+      Can be any value as specified by device tree binding documentation
+      of a particular provider.
+
+  feature-domain-controller:
+    description:
+      Indicates that the node is feature-domain-controller provider.
+
+  feature-domain-names:
+    $ref: '/schemas/types.yaml#/definitions/string-array'
+    description:
+      A list of feature-domains names, sorted in the same order as
+      feature-domains entries. Consumer drivers will use feature-domain-names
+      to match with existing feature-domains entries.
+
+  feature-domains:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      A list of feature-domains controller specifiers, as defined by the
+      bindings of the feature-domain-controller provider.
+
+additionalProperties: true
+
+examples:
+  - |
+    ctrl0: ctrl@100 {
+        feature-domain-controller;
+        reg = <0x100 0x10>;
+        #feature-domain-cells = <2>;
+    };
+
+    ctrl1: ctrl@110 {
+        feature-domain-controller;
+        reg = <0x110 0x10>;
+        #feature-domain-cells = <3>;
+    };
+
+    foo@0 {
+        reg = <0x0 0x1>;
+        feature-domains = <&ctrl0 1 2>, <&ctrl1 3 4 5>;
+        feature-domain-names = "default", "unbind";
+    };
-- 
2.25.1

