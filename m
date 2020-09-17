Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA61271DCC
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:21:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83DFA1736;
	Mon, 21 Sep 2020 10:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83DFA1736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600676492;
	bh=aZDGZYJid2V8Fx1m0lmm3+JurcbZ8SKx/Yu1RMA/dNU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B28Qc0g1qFnrVpFEHHviei76Ga4+5tu1Pdy+s/hN0QIwoDAVZYleBIvgpgGqVWdjp
	 1HEWsUr4ONBY4MwJUAOBqYunXDZqToQpvNnzjLv1q2vQt2GzQ99Hhib/62wTf2hrch
	 hDgUiiMJ9zBq1cwNCHuw4il7GH4L87zu8OzOkYDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1219FF80361;
	Mon, 21 Sep 2020 10:10:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D23B3F80212; Thu, 17 Sep 2020 18:56:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CD1DF80134
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 18:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CD1DF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CQqVCUrf"
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43716206A4;
 Thu, 17 Sep 2020 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600361759;
 bh=aZDGZYJid2V8Fx1m0lmm3+JurcbZ8SKx/Yu1RMA/dNU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CQqVCUrfLSMMi4PrDWY4qKZjHVNOyrDoFCP+p9QOTMBKlS8x//BbLXwkbpzdWa9Zp
 ch+gydcuGEuCGdWBPVtpfyx9z+TMM2nwLPCpQ/WzrosyUBT4SpCAT3NJgYtEdVE1R3
 m8XgMvq67Xe47mK2cmpG2EKoKLHRb57Oy3xWTRsk=
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
Subject: [PATCH v2 08/13] dt-bindings: mfd: include common schema in GPIO
 controllers
Date: Thu, 17 Sep 2020 18:52:56 +0200
Message-Id: <20200917165301.23100-9-krzk@kernel.org>
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
 Documentation/devicetree/bindings/mfd/cirrus,madera.yaml     | 1 +
 Documentation/devicetree/bindings/mfd/max77650.yaml          | 3 +++
 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml | 3 +++
 Documentation/devicetree/bindings/mfd/st,stmfx.yaml          | 2 ++
 Documentation/devicetree/bindings/mfd/wlf,arizona.yaml       | 1 +
 5 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
index 499c62c04daa..76c78f96dbd2 100644
--- a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
+++ b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
@@ -20,6 +20,7 @@ description: |
     bindings/sound/cirrus,madera.yaml
 
 allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
   - $ref: /schemas/pinctrl/cirrus,madera.yaml#
   - $ref: /schemas/regulator/wlf,arizona.yaml#
   - $ref: /schemas/sound/cirrus,madera.yaml#
diff --git a/Documentation/devicetree/bindings/mfd/max77650.yaml b/Documentation/devicetree/bindings/mfd/max77650.yaml
index b0a0f0d3d9d4..382ce6363e5e 100644
--- a/Documentation/devicetree/bindings/mfd/max77650.yaml
+++ b/Documentation/devicetree/bindings/mfd/max77650.yaml
@@ -20,6 +20,9 @@ description: |
   LEDs and onkey) refer to the binding documents under the respective
   sub-system directories.
 
+allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
+
 properties:
   compatible:
     const: maxim,max77650
diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
index 3a6a1a26e2b3..3a59ec26075d 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
@@ -15,6 +15,9 @@ description: |
   single-cell linear charger. Also included is a Coulomb counter, a real-time
   clock (RTC), and a 32.768 kHz clock gate.
 
+allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
+
 properties:
   compatible:
     const: rohm,bd71828
diff --git a/Documentation/devicetree/bindings/mfd/st,stmfx.yaml b/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
index 888ab4b5df45..dc7168255c18 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
@@ -31,6 +31,8 @@ properties:
 
   pinctrl:
     type: object
+    allOf:
+      - $ref: /schemas/gpio/gpio-common.yaml#
 
     properties:
       compatible:
diff --git a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
index 9e762d474218..a8610e304a00 100644
--- a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
+++ b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
@@ -16,6 +16,7 @@ description: |
 allOf:
   - $ref: /schemas/sound/wlf,arizona.yaml#
   - $ref: /schemas/regulator/wlf,arizona.yaml#
+  - $ref: /schemas/gpio/gpio-common.yaml#
   - $ref: /schemas/extcon/wlf,arizona.yaml#
   - if:
       properties:
-- 
2.17.1

