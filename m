Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79AC23901
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Oct 2025 08:34:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8BE160214;
	Fri, 31 Oct 2025 08:34:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8BE160214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1761896059;
	bh=kCEt04RyTrKABYvBg6tz6oI9MDAlN+fskpo6FhYzmF8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lu/mkU++XfLomwylbxQywETXhQP3od14x80jBWU8oLm/miTsr875nevC+W6pHwvjq
	 Oq3wS3+s4YI1FNWkO7PvO6imd7AX0IZxDH2zRGJdDNxWBWLzXbfTsYNmEMrq6UQnFF
	 robklge3m/hvqc7SgDZEUATcnT9QvjMZu4nQYcQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DE07F805C6; Fri, 31 Oct 2025 08:33:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94A8FF805C6;
	Fri, 31 Oct 2025 08:33:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 417D9F80134; Fri, 31 Oct 2025 08:31:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AF870F80134
	for <alsa-devel@alsa-project.org>; Fri, 31 Oct 2025 08:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF870F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=UPDSizZY
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 59V7Ut6X23389769,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1761895855; bh=zAip/nI9EiDO+ZC8xW8inZ9boOyQ0z1iBmAYjPI25AU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=UPDSizZYXxZaKWGktj3pa1csoKJ+mQRWPD0qtIF8m3/Xu1RGEXnobUpUzCpQvLP/X
	 rNTGswVy0ycrJhjMakL3BEWN7dXqKJlRxX6+2uLSCo8MSf1RccIiKBQO/lBIiIqsmr
	 rIiedr7H2WeEOLazW0ragqC0UqyEggsc91zKi4IJRnRX6ptp9pxp2wa2ivGintx3r3
	 YJNqQzsEek9aOBMz/ecp+mxonjpEpoBX6F9hMSaHeorneXONB0LSSPHAnw/y0yOFn8
	 hpZJ6cHPB6OCZ/2fFNavzgCJGMkg9oLX7odZ5amtueuNIJPRYBy/HoWF0APcXmXFdg
	 tpLIhr+z2iAcA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 59V7Ut6X23389769
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Oct 2025 15:30:55 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 31 Oct 2025 15:30:55 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 31 Oct 2025 15:30:54 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Fri, 31 Oct 2025 15:30:54 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <flove@realtek.com>,
 <shumingf@realtek.com>,
        <jack.yu@realtek.com>, <derek.fang@realtek.com>,
        "Oder Chiou" <oder_chiou@realtek.com>
Subject: [PATCH v6 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings for
 ALC5575
Date: Fri, 31 Oct 2025 15:32:45 +0800
Message-ID: <20251031073245.3629060-2-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251031073245.3629060-1-oder_chiou@realtek.com>
References: <20251031073245.3629060-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: CIJF5TBCQY4TXIIBSHCI3EFNDT2FEJA7
X-Message-ID-Hash: CIJF5TBCQY4TXIIBSHCI3EFNDT2FEJA7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CIJF5TBCQY4TXIIBSHCI3EFNDT2FEJA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ALC5575 integrates an audio DSP that typically loads its firmware
from an external flash via its own SPI host interface. In certain
hardware configurations, the firmware can alternatively be loaded
through the SPI client interface. The driver provides basic mute and
volume control functions. When the SPI client interface is enabled,
firmware loading is handled by the SPI driver.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 .../bindings/sound/realtek,rt5575.yaml        | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
new file mode 100644
index 000000000000..4250a9231f66
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
@@ -0,0 +1,42 @@
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
+description: |
+  The device supports both I2C and SPI. I2C is mandatory, while SPI is optional depending on the
+  hardware configuration.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: realtek,rt5575
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@57 {
+            compatible = "realtek,rt5575";
+            reg = <0x57>;
+        };
+    };
-- 
2.51.1

