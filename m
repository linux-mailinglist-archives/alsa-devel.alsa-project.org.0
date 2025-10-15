Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 280B3BECEE1
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Oct 2025 13:58:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC7D960220;
	Sat, 18 Oct 2025 13:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC7D960220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1760788716;
	bh=9jYpbn8PE6LsImNmKQekyCHKFI+mZ0iotXk2kgY83Zo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kSXwFyFtmRRWf7eX5BTTXPPU4ev7MfPo3gNNsil7Agci2t9K0I1Tk+iQiDjj9JiTW
	 ome/Neb4s9Bh9p2iJtCEVe8D5BfCGgK8GGV4+lSL5AteDvPAPW+cQ2dnBbR7bQqYLY
	 lF+JDUDl55n5EUzyZaYjGZMgDK/rH1ceziDC1SJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97581F8062D; Sat, 18 Oct 2025 13:57:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 808C6F80635;
	Sat, 18 Oct 2025 13:57:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E343F805D4; Wed, 15 Oct 2025 12:35:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CA9CFF800D2
	for <alsa-devel@alsa-project.org>; Wed, 15 Oct 2025 12:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA9CFF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=We2aEycd
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 59FAYmkT6782519,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1760524488; bh=LRe5HHaJZ+PKbIf6PPoCgzmS5UQrHCwFuVDQ+Vg2ai8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=We2aEycd7/xhGYTvOlZHl/AgcFm2Mlqkz0OlRtcqhV2THGT+4I/qefx38wmr0MyAe
	 OvtTBH6BJz3EM4tt78rwD+7W7HqgcI4vmOVOf/UA+t3IbwUIXgLlvqkVLNJgRWpUKD
	 kbg9USJ/7anfbSobxHy+LhgRY9n7acWCxhc2D98DSHU/caFCjGr9enu8VgiOmeuq2b
	 +2wjUiENYh5XSuREmpCIO49mWUF8xFtCHB0PRLDlZm8/EnMfOLn71gXzx2xrMb272l
	 4zlKGNlLjcZ9KzN97Wh3Dd1amV3Gz/7XnlOdMsHgBmpZy+zdHKI63ryOgSf7vDc7jx
	 Kgn7nLJyMZOQg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 59FAYmkT6782519
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Oct 2025 18:34:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Wed, 15 Oct 2025 18:34:49 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Wed, 15 Oct 2025 18:34:49 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <flove@realtek.com>,
 <shumingf@realtek.com>,
        <jack.yu@realtek.com>, <derek.fang@realtek.com>,
        "Oder Chiou" <oder_chiou@realtek.com>
Subject: [PATCH v5 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings for
 ALC5575
Date: Wed, 15 Oct 2025 18:34:04 +0800
Message-ID: <20251015103404.3075684-2-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015103404.3075684-1-oder_chiou@realtek.com>
References: <20251015103404.3075684-1-oder_chiou@realtek.com>
MIME-Version: 1.0
X-Originating-IP: [172.24.54.4]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTKEXHMBS06.realtek.com.tw (10.21.1.56)
Message-ID-Hash: XBGGLYWJKGZZVWOP672OQPL7IFIB65IC
X-Message-ID-Hash: XBGGLYWJKGZZVWOP672OQPL7IFIB65IC
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Realtek ALC5575 codec has a built-in DSP.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 .../bindings/sound/realtek,rt5575.yaml        | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
new file mode 100644
index 000000000000..8fbcb64ae1d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
@@ -0,0 +1,41 @@
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
+  This device supports both I2C and SPI.
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
2.34.1

_______________________________________________
Alsa-devel mailing list -- alsa-devel@alsa-project.org
To unsubscribe send an email to alsa-devel-leave@alsa-project.org
