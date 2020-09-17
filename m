Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4811C271DCD
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:22:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD71E1766;
	Mon, 21 Sep 2020 10:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD71E1766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600676526;
	bh=dV0RJmZrCOhLfLOZpDoJWxNcxKwbXemwt+fCiTuTk1A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=akiF55BGAU5fvlFWtziaRbIp+C1FWY1ORK2H9+i6pBe1jj9e0Ys81/R1XCJWpkmHL
	 Bl73RIddeoFBWJGdbdCq1NZTbDDbIz2Z/M9sxB+I6l10MszlD8PyRQRqaCxC20Cz39
	 TbSeM1IQHkSyi/JOg9V3c2iSDipPQOoTZGzJRXEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB768F80362;
	Mon, 21 Sep 2020 10:10:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22B19F80212; Thu, 17 Sep 2020 18:56:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8891F80134
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 18:56:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8891F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RLjPKbr7"
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12A3720838;
 Thu, 17 Sep 2020 16:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600361773;
 bh=dV0RJmZrCOhLfLOZpDoJWxNcxKwbXemwt+fCiTuTk1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RLjPKbr7P21OXEU7ceJ2mx37qg3eABYBb3zaPjWzAU7DOqdbgooe8f/mo1/RL9uyZ
 rf73qne7R+Ov8bfBF6rrWyb0+F6Vt3UP4YOiozO6nIOfPQMAkOCDNvMWHR0HXAxP8r
 c0d+uXN9tlXLN0vLlmNC159+wVc0Lb9RcmWL0J/A=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Anson Huang <Anson.Huang@nxp.com>, Sungbo Eo <mans0n@gorani.run>,
 Stefan Agner <stefan@agner.ch>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Yash Shah <yash.shah@sifive.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 - <patches@opensource.cirrus.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Amelie Delaunay <amelie.delaunay@st.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Andy Teng <andy.teng@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sricharan R <sricharan@codeaurora.org>,
 Chris Brandt <chris.brandt@renesas.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 09/13] dt-bindings: pinctrl: include common schema in GPIO
 controllers
Date: Thu, 17 Sep 2020 18:52:57 +0200
Message-Id: <20200917165301.23100-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917165301.23100-1-krzk@kernel.org>
References: <20200917165301.23100-1-krzk@kernel.org>
X-Mailman-Approved-At: Mon, 21 Sep 2020 10:10:22 +0200
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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

Include the common GPIO schema in GPIO controllers to be sure all common
properties are properly validated.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 .../devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml      | 3 +++
 .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml          | 1 +
 .../devicetree/bindings/pinctrl/cirrus,lochnagar.yaml          | 3 +++
 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml | 3 +++
 .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml   | 3 +++
 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml  | 3 +++
 .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml      | 3 +++
 .../devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml      | 3 +++
 .../devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml       | 3 +++
 .../devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml      | 3 +++
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 +++
 11 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
index 33391d30c00c..51bfc214bba6 100644
--- a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
@@ -15,6 +15,9 @@ description: |
   GPIO function selection & GPIO attributes configuration. Please refer to
   pinctrl-bindings.txt in this directory for common binding part and usage.
 
+allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
+
 properties:
   compatible:
     const: actions,s500-pinctrl
diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 7556be6e2754..55662f8d1f94 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -143,6 +143,7 @@ allOf:
   # boards are defining it at the moment so it would generate a lot of
   # warnings.
 
+  - $ref: /schemas/gpio/gpio-common.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
index 420d74856032..ed478b0ed4cc 100644
--- a/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
@@ -31,6 +31,9 @@ description: |
   This binding must be part of the Lochnagar MFD binding:
     [4] ../mfd/cirrus,lochnagar.yaml
 
+allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
+
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
index 44c04d11ae4c..ffa64832b4f9 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
@@ -59,6 +59,9 @@ properties:
 patternProperties:
   "^gpio@[0-9]$":
     type: object
+    allOf:
+      - $ref: /schemas/gpio/gpio-common.yaml#
+
     properties:
       compatible:
         enum:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 152c151c27ad..7d0a4cb96f39 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -14,6 +14,9 @@ description: |+
   required property:
   - compatible: "syscon"
 
+allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
+
 properties:
   compatible:
     const: mediatek,mt6779-pinctrl
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
index 5556def6b99b..bc8bc0ac1926 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
@@ -12,6 +12,9 @@ maintainers:
 description: |
   The Mediatek's Pin controller is used to control SoC pins.
 
+allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
+
 properties:
   compatible:
     const: mediatek,mt8192-pinctrl
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index c64c93206817..22a6b80b4c0e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -13,6 +13,9 @@ description: |
   This binding describes the Top Level Mode Multiplexer block found in the
   IPQ6018 platform.
 
+allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
+
 properties:
   compatible:
     const: qcom,ipq6018-pinctrl
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index 1f0f5757f9e1..9855d859fe61 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -13,6 +13,9 @@ description: |
   This binding describes the Top Level Mode Multiplexer block found in the
   MSM8226 platform.
 
+allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
+
 properties:
   compatible:
     const: qcom,msm8226-pinctrl
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index 8508c57522fd..e5757b6ced40 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -13,6 +13,9 @@ description: |
   This binding describes the Top Level Mode Multiplexer block found in the
   SM8250 platform.
 
+allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
+
 properties:
   compatible:
     const: qcom,sm8250-pinctrl
diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
index b7911a994f3a..4d7bf4340262 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Chris Brandt <chris.brandt@renesas.com>
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
+allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
+
 description:
   The Renesas SoCs of the RZ/A2 series feature a combined Pin and GPIO
   controller.
diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 72877544ca78..28b861362ba0 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -56,6 +56,9 @@ properties:
 patternProperties:
   '^gpio@[0-9a-f]*$':
     type: object
+    allOf:
+      - $ref: /schemas/gpio/gpio-common.yaml#
+
     properties:
       gpio-controller: true
       '#gpio-cells':
-- 
2.17.1

