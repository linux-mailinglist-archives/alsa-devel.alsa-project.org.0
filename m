Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C47487219F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 15:38:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8649832;
	Tue,  5 Mar 2024 15:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8649832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709649500;
	bh=J20fXOTpszLtviNzeEJ9oEnzRf/ob4n4tAtstEQ4FJY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O/mgLvlqmTCcGs881yeLZ+j4v5GtEO6/R1IIW/xrEvF3DpVjDSh+ZA6FSzcYtD2Hf
	 NYn6PVMMb7Gt1Sv04AAR2r9oLE/PAlrc9sRNcZTkHDGk4G/oq6O7vty1rsKuCIx3ZP
	 jwwj5eIXMiv5eSDK0c/1KNfVjcIWYv4waFd8VvO8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 442EDF805F2; Tue,  5 Mar 2024 15:37:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19FE4F805F3;
	Tue,  5 Mar 2024 15:37:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D73FCF80563; Tue,  5 Mar 2024 15:37:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56D53F801F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 15:36:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56D53F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oWOAIPcO
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E303C0002;
	Tue,  5 Mar 2024 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709649418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EFhKF2Oicstp405eHgJkca8Gx/B/aHaMRaQs7xsjBzE=;
	b=oWOAIPcOPlZK6jujVv8L/xsMG9f4RfiFp2d3vsTgbkyk8Amw1Wo0FDH8ErW3BIKDfUEDKH
	2Kn2pt3e3oW7mnP5npJrGkRVXT7aF1Pcktcv9XsU6pPXqbQiTE1xX1UBtFhih6yipnFnin
	ckMNZxAhHDx7RUoOGWH5amEeMrEXiOaFU7ke7lFVGu8So87PueLerLigLrfrE/ZKD55no3
	MvyPAhTlRspEIt8xihlBdTUz/aiX6PvBr9Dk24nZCoL8QJqFvpfXYMjMjs1SvpTyRYj4T4
	jMw3X3Zm54wO8Xjl+IJjaWLa4CCL1/Kz4kkqOw24tTAhDTbbs0VBb3jCt2nkew==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 05 Mar 2024 15:36:29 +0100
Subject: [PATCH v4 2/7] ASoC: dt-bindings: Add Rockchip RK3308 internal
 audio codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-rk3308-audio-codec-v4-2-312acdbe628f@bootlin.com>
References: <20240305-rk3308-audio-codec-v4-0-312acdbe628f@bootlin.com>
In-Reply-To: <20240305-rk3308-audio-codec-v4-0-312acdbe628f@bootlin.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com
Message-ID-Hash: 2HXAEBTZSZRCUYRGU5NKLVR2JQ4W6O7G
X-Message-ID-Hash: 2HXAEBTZSZRCUYRGU5NKLVR2JQ4W6O7G
X-MailFrom: luca.ceresoli@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2HXAEBTZSZRCUYRGU5NKLVR2JQ4W6O7G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add device tree bindings document for the internal audio codec of the
Rockchip RK3308 SoC.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v4: nothing

Changed in v3:
 - fix underscore in DT label

Changed in v2:
 - reword commit title
 - add maxItems to resets
 - remove quotes from reset-names
 - use percent values for rockchip,micbias-avdd-multiplier
 - use name compliant to the docs in the example
---
 .../bindings/sound/rockchip,rk3308-codec.yaml      | 98 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
new file mode 100644
index 000000000000..ecf3d7d968c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
@@ -0,0 +1,98 @@
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
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: codec
+
+  "#sound-dai-cells":
+    const: 0
+
+  rockchip,micbias-avdd-percent:
+    description: |
+      Voltage setting for the MICBIAS pins expressed as a percentage of
+      AVDD.
+
+      E.g. if rockchip,micbias-avdd-percent = 85 and AVDD = 3v3, then the
+      MIC BIAS voltage will be 3.3 V * 85% = 2.805 V.
+
+    enum: [ 50, 55, 60, 65, 70, 75, 80, 85 ]
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
+    audio_codec: audio-codec@ff560000 {
+        compatible = "rockchip,rk3308-codec";
+        reg = <0xff560000 0x10000>;
+        rockchip,grf = <&grf>;
+        clock-names = "mclk_tx", "mclk_rx", "hclk";
+        clocks = <&cru SCLK_I2S2_8CH_TX_OUT>,
+                 <&cru SCLK_I2S2_8CH_RX_OUT>,
+                 <&cru PCLK_ACODEC>;
+        reset-names = "codec";
+        resets = <&cru SRST_ACODEC_P>;
+        #sound-dai-cells = <0>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4f298c4187fb..9c5ef9219086 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18940,6 +18940,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip-rga.yaml
 F:	drivers/media/platform/rockchip/rga/
 
+ROCKCHIP RK3308 INTERNAL AUDIO CODEC
+M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
+
 ROCKCHIP VIDEO DECODER DRIVER
 M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 L:	linux-media@vger.kernel.org

-- 
2.34.1

