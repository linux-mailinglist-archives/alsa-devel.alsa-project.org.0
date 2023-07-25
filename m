Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3CC760ED7
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:27:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1BFBED7;
	Tue, 25 Jul 2023 11:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1BFBED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690277233;
	bh=rdTlvX9eLxywWeEuDo4q50A57WMhniuwW452UK1ZfV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lzIVo5TPTS89eFr7R8lwMp7HhcWjDCgDtYrGWBR76xRAwTx2pvxb6/BmNixh4LGG4
	 LqJSkfktkRLjmM8ticTVtjAulFV2HkLuBjNRLac1Z4Ik8CWIqLxz85ur2RU3Hu+BVy
	 G16XUd8Rgsds91fh4uVgpBM4bwy/aCjpqA6Rb88c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFE7DF8059F; Tue, 25 Jul 2023 11:25:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 592D7F80580;
	Tue, 25 Jul 2023 11:25:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD58CF80563; Tue, 25 Jul 2023 11:25:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49F02F80149
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49F02F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hlCdvQbx
Received: by mail.gandi.net (Postfix) with ESMTPA id F1BF840008;
	Tue, 25 Jul 2023 09:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690277104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Yo43qISdINrTXoBGMrpCx+B9kqhLajfGlqFUUD8Czs=;
	b=hlCdvQbxeve6hG8yi+7vxdIc1azx1JXyYRmkFu+1UKc2rJ6kabWxhF10Bed1z4BWDmpcWp
	v41Zmf6DNeCiZ9UvSBGTcTCCDWYF2Xmg5Bcf4mwA+Ed9seDLsvKKykjiNZHLi29VicVUAI
	eP2d51mb+rsvNBqlhWmVM0dXU9ZJoGxvwqV7lvg8soHb7latBvHKf5oZJIkDCbtDieG2lf
	6AWrkKgYGqd59gHU2ZnpBNUdLLpXgSBmD/Czh4QFay4ZIjMOn0Jrv+rEu7Hake71o5eIGy
	Ic6vErwVpLHEw8Pu6XDMoljzP9RDqV/bdISilESfSiWnN/HKC1eij4MwrgJ6Tg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 03/26] dt-bindings: net: Add support for QMC HDLC
Date: Tue, 25 Jul 2023 11:23:39 +0200
Message-ID: <20230725092417.43706-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725092417.43706-1-herve.codina@bootlin.com>
References: <20230725092417.43706-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: YAMD7HP5NQ3OTVRQZR4IIC3S7HDPGF3L
X-Message-ID-Hash: YAMD7HP5NQ3OTVRQZR4IIC3S7HDPGF3L
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YAMD7HP5NQ3OTVRQZR4IIC3S7HDPGF3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The QMC (QUICC mutichannel controller) is a controller present in some
PowerQUICC SoC such as MPC885.
The QMC HDLC uses the QMC controller to transfer HDLC data.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../devicetree/bindings/net/fsl,qmc-hdlc.yaml | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml

diff --git a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
new file mode 100644
index 000000000000..8bb6f34602d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/fsl,qmc-hdlc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QMC HDLC
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  The QMC HDLC uses a QMC (QUICC Multichannel Controller) channel to transfer
+  HDLC data.
+
+properties:
+  compatible:
+    const: fsl,qmc-hdlc
+
+  fsl,qmc-chan:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to QMC node
+          - description: Channel number
+    description:
+      Should be a phandle/number pair. The phandle to QMC node and the QMC
+      channel to use.
+
+required:
+  - compatible
+  - fsl,qmc-chan
+
+additionalProperties: false
+
+examples:
+  - |
+    hdlc {
+        compatible = "fsl,qmc-hdlc";
+        fsl,qmc-chan = <&qmc 16>;
+    };
-- 
2.41.0

