Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 191C5CEB190
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Dec 2025 03:36:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEA1C601C0;
	Wed, 31 Dec 2025 03:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEA1C601C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767148601;
	bh=LqxyURtloegT4m/zAMO9KjepBqGZM6jzaRvo+Psy7E0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F2QANaKZYKnEhhaqWNiesMR14Xoe+qo0evkpwXYeuT+EJ+RdsmCUvz07J3cdT3n8q
	 eMYg4wPzXNZOT4uokQMWF+ml5RO9YjRLvMMFQ5HFB3MOeIW43e7ZcYHEnEPuphbWVl
	 W6Z+HGFULrQhnDKOpJDfQYaMXr3yDuLKymSE+WSM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E735F805D3; Wed, 31 Dec 2025 03:36:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAE6FF80579;
	Wed, 31 Dec 2025 03:36:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D596F80240; Wed, 31 Dec 2025 03:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38058F801F5
	for <alsa-devel@alsa-project.org>; Wed, 31 Dec 2025 03:35:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38058F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=Bl9/EFli
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BV2ZegkE264407,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1767148540; bh=z7Wwgy0d8I6voARKvl0a7KvTVnYk//mpi1lBYRvjR84=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Bl9/EFli+7enao9Py7jKFI0Nr8NE50u+tMTXk2Gn1o+ECtzeeZavwBaxtR36L9a+V
	 X8Im9/o2MkN/PGxd4FhTGV5g/mwmOI32gZ4K3+j60nyOCJIf0z7gaTiBcnmDdiILcy
	 s9uE0gRULWNOhbIb/D5raopJ+Efl3NM7a/5klrFN8aS5EA9K7CJydvqcaIo0VS4awx
	 7emMaURPPM364g8W/VTB+6XWX9xIl9VYPzZnjP+7vaA8TJKzr33zXr+9XK0Nu4gVrI
	 vQmyUDcB1hM3gykd9f4EgVssMpm2+E0TKjipewG9RqhsfW2UeyrOSJygDekd2lLnSv
	 JSQ31JEuZXLkg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BV2ZegkE264407
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Dec 2025 10:35:40 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 31 Dec 2025 10:35:40 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 31 Dec 2025 10:35:39 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <cezary.rojewski@intel.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <perex@perex.cz>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <flove@realtek.com>, <shumingf@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v11 3/4] ASoC: dt-bindings: realtek,rt5575: add support for
 ALC5575
Date: Wed, 31 Dec 2025 10:37:01 +0800
Message-ID: 
 <cad38383a8f4c7235158779c270fee7f61bf6cfe.1767148150.git.oder_chiou@realtek.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1767148150.git.oder_chiou@realtek.com>
References: <cover.1767148150.git.oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: RYUSFHKMF3MPLETCTEQC4LDVK5JHSUGH
X-Message-ID-Hash: RYUSFHKMF3MPLETCTEQC4LDVK5JHSUGH
X-MailFrom: oder_chiou@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYUSFHKMF3MPLETCTEQC4LDVK5JHSUGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Audio codec with I2S, I2C and SPI.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/realtek,rt5575.yaml        | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
new file mode 100644
index 000000000000..981ebc39b195
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/realtek,rt5575.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ALC5575 audio CODEC
+
+maintainers:
+  - Oder Chiou <oder_chiou@realtek.com>
+
+description:
+  The device supports both I2C and SPI. I2C is mandatory, while SPI is
+  optional depending on the hardware configuration. SPI is used for
+  firmware loading if present.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: realtek,rt5575
+
+  reg:
+    maxItems: 1
+
+  spi-parent:
+    description:
+      Optional phandle reference to the SPI controller used for firmware
+      loading. The argument specifies the chip select.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  # I2C-only node
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@57 {
+            compatible = "realtek,rt5575";
+            reg = <0x57>;
+        };
+    };
+
+  # I2C + optional SPI node
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@57 {
+            compatible = "realtek,rt5575";
+            reg = <0x57>;
+            spi-parent = <&spi0 0>; /* chip-select 0 */
+        };
+    };
-- 
2.52.0

