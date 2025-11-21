Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED95C77F5F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Nov 2025 09:41:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16A26601F8;
	Fri, 21 Nov 2025 09:41:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16A26601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763714478;
	bh=wcZEPB0Dr2i32CrYKLqpUNGZcjVWFjtlJvFCLUtn7aE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jeY4b/QBUuny4auhLC36xAWryTl8huqXqOwhCWJEKhVEBWD7dCq0BYExODu4uDppK
	 ulwCUriuaG1NpMlPLrWSk1Nj57GRwdiJT6IsKVYyDWvP7cQaAM4ggKO1xaYNy42tUJ
	 c00vDq23bQE5ZXbR37FlvBOIUk7PMFHnmWUiqCYU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16CC7F805EC; Fri, 21 Nov 2025 09:40:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50324F805EE;
	Fri, 21 Nov 2025 09:40:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FA32F80448; Fri, 21 Nov 2025 09:40:08 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 595A5F80072
	for <alsa-devel@alsa-project.org>; Fri, 21 Nov 2025 09:39:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 595A5F80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=wmm3WeTE
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AL8dfM933251007,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763714381; bh=uGZMEkBw1aiAog/nwTU+ymyoDjS4E7c+8kpU7DtaM/M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=wmm3WeTEk/sbnjbi37565Cv90rXogAyUo0d3F4GLujQraXH66k1ZhcKaN6q4yI11p
	 dVVmLJeyHhzBKRXKSGi1FcH3ZpnP2upS0QF9CRIolvhhpAVvfYtgd3VMTUoJTjjF7O
	 kmnZ1VLrqorle1h+iyYXXnSE/n7mXAkqAev3wSXPOhJFT8IXhW6nNLZpyMFD/QPQV9
	 8nDWf/44ttx5RWeH1YZYLjz2ntZJpKycZr9lU7Bbmcr7/oHxNEgopXa22mDjpYQdRn
	 afq+HWcUvVkEsI8ulUS44BDqyhfyt8jjk2ZmA02O2a6vcYPhm8T1noN2xUzL6pyiqP
	 IiLI7c2mRSBzw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AL8dfM933251007
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 16:39:41 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 21 Nov 2025 16:39:41 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Fri, 21 Nov 2025 16:39:41 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <perex@perex.cz>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <flove@realtek.com>, <shumingf@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v7 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings for
 ALC5575
Date: Fri, 21 Nov 2025 16:41:12 +0800
Message-ID: <20251121084112.743518-2-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121084112.743518-1-oder_chiou@realtek.com>
References: <20251121084112.743518-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: ZX6FUMAUKRAOMJEGNR3R3JQ2RQBIMCC2
X-Message-ID-Hash: ZX6FUMAUKRAOMJEGNR3R3JQ2RQBIMCC2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZX6FUMAUKRAOMJEGNR3R3JQ2RQBIMCC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Realtek ALC5575 is a highly advanced DSP and microphone CODEC that has
been designed for AI audio technology. Its impressive features include
an advanced HiFi-5 DSP core, a Neural Network Processing Unit (NPU)
owned by Realtek, and embedded 4MB memory, which enables it to operate
highly advanced AI audio algorithms. The ALC5575 supports 4xA-mic input
and 8xD-mic input, as well as a rich set of interfaces such as I2S, I2C,
SPI, and UART.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 .../bindings/sound/realtek,rt5575.yaml        | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
new file mode 100644
index 000000000000..cc7540278ad9
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
+description:
+  The device supports both I2C and SPI. I2C is mandatory, while SPI is
+  optional depending on the hardware configuration.
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
2.51.2

