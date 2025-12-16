Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7129CC1496
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Dec 2025 08:22:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C39860227;
	Tue, 16 Dec 2025 08:22:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C39860227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765869753;
	bh=I/a2fvl5cM973mSNSEqBU8ga1TYoVjNL+XdtwVAdlyk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iAHLbUQMz+Z+IgnZgtlIRuIfrfNpGvk0NHYB0zNkI/fgkFh5W+p96L6t8UuvYhFzA
	 rFdOEkv8h3koJC62ZcbwhvZMM37lT0xKFcPyBdE6MSM4z6/VxTjKGzkKocDxtqw9Jz
	 T3IcTy9G3Uft3kHkTwWM8xgTPBIXEVXVZOLitczE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6987FF805C7; Tue, 16 Dec 2025 08:21:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4471F805C7;
	Tue, 16 Dec 2025 08:21:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9933AF8016E; Tue, 16 Dec 2025 08:17:42 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C3C2F80217
	for <alsa-devel@alsa-project.org>; Tue, 16 Dec 2025 08:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C3C2F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=RpLAtZ/t
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BG7HNiwC3480197,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765869443; bh=O9P1ZmwkNILnvEnOhiWwKahZCFj/t+KyiynfI1j6KqQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=RpLAtZ/tZSFNkspgJjkVha7X/DloMdTbskKkDtlabRQ2K4XmESkF64smMGfu8U8Kn
	 cqXQsFTZPIF3447ZgGN2xeOp67uMbHN/NQW9RjJTmOnmV8Kmw/XLptUDfJ3t2mSSoW
	 TIhIZb+ocyIPq5QLTvGml4mVV2XQdoljzZrgfgvwhEEsBbBrI+u+ZJMnQLafAo0QJK
	 UsXpS5Bt6BAkVQ7wfj+A8kpIrrXbj1RGvLUcocwMmpaoJRn6+h+AeY2yV4sJOH10ix
	 0dd0PzoOoak57fwZXBiQEdUsJgY6awJbP37DlExe+QH/TjEzzeJ5wavBk2SlhUHVuY
	 SrfDcRI2SP2ow==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BG7HNiwC3480197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 15:17:23 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 16 Dec 2025 15:17:22 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 16 Dec 2025 15:17:22 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <cezary.rojewski@intel.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-spi@vger.kernel.org>, <perex@perex.cz>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <flove@realtek.com>,
        <shumingf@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Oder Chiou
	<oder_chiou@realtek.com>
Subject: [PATCH v10 2/3] ASoC: dt-bindings: realtek,rt5575: add support for
 ALC5575
Date: Tue, 16 Dec 2025 15:18:52 +0800
Message-ID: <20251216071853.3929135-3-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216071853.3929135-1-oder_chiou@realtek.com>
References: <20251216071853.3929135-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: UAIELPC57RWFVSAS33QATM3G2YJVZHIM
X-Message-ID-Hash: UAIELPC57RWFVSAS33QATM3G2YJVZHIM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UAIELPC57RWFVSAS33QATM3G2YJVZHIM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Audio codec with I2S, I2C and SPI.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
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

