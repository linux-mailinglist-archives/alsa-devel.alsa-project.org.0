Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 711905B0667
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 16:23:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E1041670;
	Wed,  7 Sep 2022 16:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E1041670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662560593;
	bh=BtM15gBL+GVRCEnhdXlQBB1EtTXmn51j7I06jUmL1Po=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r7HW/9rMgsFSxQNi91w6XlfW9wiAqsPilBw8dLfLOkX/fyvB8Rl129eeBjwoamhxp
	 C9dLRHo8Xhbt2fOdnPHL2j3O0LSlzDV5fhHaEMU5aXO0DhNiPqGUmLNMLfK20tD3DS
	 VEZRlpcNJnjX8TeHbwZ5kYh45zIP3waY++5zZH+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F4B4F80528;
	Wed,  7 Sep 2022 16:22:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2FA5F804FC; Wed,  7 Sep 2022 16:22:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5D07F80118
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 16:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5D07F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="As1t+bF7"
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 7C1F8200014;
 Wed,  7 Sep 2022 14:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1662560523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJgSJiCghhYz5ofqe9JG5z8U+htYvi8Oo0PRyZFIxmM=;
 b=As1t+bF7xHy0TiDvWlV9I9GIzxD73MRcATUh4KDYTxfNgSV1LpOVmTJwWvoEkOTEwhPiyj
 b/+PiATaksXk957zdxnUjUwtbbNr0gYsEDnrh4FCnF10q/wTfV+dpWJV46JfjyBxrc96fi
 v2yGwL4eMO1qMlFBf01zbYwb7sOyDsLAmlt+qjCxBG1N2JEcdJwIMSvhTCNZ76cWuMoeSQ
 t3oqPWrQyEbfaXi1vmAHC+llMteHb559Okjj7mFZ6bGBPjR563ZAxH37ZKc21CS5b5LHTS
 qtvFUCnfvUQc7lLv/7DD/VP1HvxdhbaEnwxPWLUTMAKJ7Ou7lAI/zMEoLvxrIg==
From: luca.ceresoli@bootlin.com
To: alsa-devel@alsa-project.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/8] ASoC: rockchip: rk3308: add internal audio codec bindings
Date: Wed,  7 Sep 2022 16:21:17 +0200
Message-Id: <20220907142124.2532620-2-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Add device tree bindings document for the internal audio codec of the
Rockchip RK3308 SoC.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 .../bindings/sound/rockchip,rk3308-codec.yaml | 102 ++++++++++++++++++
 MAINTAINERS                                   |   6 ++
 .../dt-bindings/sound/rockchip,rk3308-codec.h |  15 +++
 3 files changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
 create mode 100644 include/dt-bindings/sound/rockchip,rk3308-codec.h

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
new file mode 100644
index 000000000000..f3458f86ef06
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rk3308-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3308 Internal Codec
+
+description: |
+  This is the audio codec embedded in the Rockchip RK3308
+  SoC. It has 8 24-bit ADCs and 2 24-bit DACs. The maximum supported
+  sampling rate is 192 kHz.
+
+  It is connected internally to one out of a selection of the internal I2S
+  controllers.
+
+  The RK3308 audio codec has 8 independent capture channels, but some
+  features work on stereo pairs called groups:
+    * grp 0 -- MIC1 / MIC2
+    * grp 1 -- MIC3 / MIC4
+    * grp 2 -- MIC5 / MIC6
+    * grp 3 -- MIC7 / MIC8
+
+maintainers:
+  - Luca Ceresoli <luca.ceresoli@bootlin.com>
+
+properties:
+  compatible:
+    const: rockchip,rk3308-codec
+
+  reg:
+    maxItems: 1
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the General Register Files (GRF)
+
+  clocks:
+    items:
+      - description: clock for TX
+      - description: clock for RX
+      - description: AHB clock driving the interface
+
+  clock-names:
+    items:
+      - const: mclk_tx
+      - const: mclk_rx
+      - const: hclk
+
+  resets: true
+
+  reset-names:
+    items:
+      - const: "acodec"
+
+  "#sound-dai-cells":
+    const: 0
+
+  rockchip,micbias-avdd-multiplier:
+    description: |
+      Voltage setting for the MICBIAS pins expressed as a multiplier of
+      AVDD.
+
+      E.g. if rockchip,micbias-avdd-multiplier = 7 (x0.85) and AVDD = 3v3,
+      then MIC BIAS voltage will be 3.3 V * 0.85 = 2.805 V.
+
+      Value 0: multiplier = 0.50
+      Value N: multiplier = 0.50 + 0.05 * N
+      Value 7: multiplier = 0.85
+
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 7
+
+required:
+  - compatible
+  - reg
+  - rockchip,grf
+  - clocks
+  - resets
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3308-cru.h>
+
+    acodec: acodec@ff560000 {
+        compatible = "rockchip,rk3308-codec";
+        reg = <0xff560000 0x10000>;
+        rockchip,grf = <&grf>;
+        clock-names = "mclk_tx", "mclk_rx", "hclk";
+        clocks = <&cru SCLK_I2S2_8CH_TX_OUT>,
+                 <&cru SCLK_I2S2_8CH_RX_OUT>,
+                 <&cru PCLK_ACODEC>;
+        reset-names = "acodec";
+        resets = <&cru SRST_ACODEC_P>;
+        #sound-dai-cells = <0>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 895e8ace80dd..d53a8e74cb1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17588,6 +17588,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip-rga.yaml
 F:	drivers/media/platform/rockchip/rga/
 
+ROCKCHIP RK3308 INTERNAL AUDIO CODEC
+M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
+F:	include/dt-bindings/sound/rockchip,rk3308-codec.h
+
 ROCKCHIP VIDEO DECODER DRIVER
 M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 L:	linux-media@vger.kernel.org
diff --git a/include/dt-bindings/sound/rockchip,rk3308-codec.h b/include/dt-bindings/sound/rockchip,rk3308-codec.h
new file mode 100644
index 000000000000..9f1b210a048e
--- /dev/null
+++ b/include/dt-bindings/sound/rockchip,rk3308-codec.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __DT_BINDINGS_ROCKCHIP_RK3308_CODEC_H__
+#define __DT_BINDINGS_ROCKCHIP_RK3308_CODEC_H__
+
+#define RK3308_CODEC_MICBIAS_AVDD_x_0_50	0
+#define RK3308_CODEC_MICBIAS_AVDD_x_0_55	1
+#define RK3308_CODEC_MICBIAS_AVDD_x_0_60	2
+#define RK3308_CODEC_MICBIAS_AVDD_x_0_65	3
+#define RK3308_CODEC_MICBIAS_AVDD_x_0_70	4
+#define RK3308_CODEC_MICBIAS_AVDD_x_0_75	5
+#define RK3308_CODEC_MICBIAS_AVDD_x_0_80	6
+#define RK3308_CODEC_MICBIAS_AVDD_x_0_85	7
+#define RK3308_CODEC_MICBIAS_NUM		8
+
+#endif /* __DT_BINDINGS_ROCKCHIP_RK3308_CODEC_H__ */
-- 
2.34.1

