Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCA02CFA7E
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 09:09:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C73B18F5;
	Sat,  5 Dec 2020 09:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C73B18F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607155784;
	bh=cs7n5mGXrpUKIzYfIBw3iAhM2sh6hC/6JI2pkwaHzr8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ICcbtsOec8LRCh07kAhKTPnXQYz+R9S+wgcN2SwhxW+fmWPONvTwr/AVotMBRuQV2
	 LC0vDNKqD0thddGRIt73VksOKKaT0RQDCZ7w3YMZeSZChxLJDLMQiwGuVDVpBgYKUL
	 QfcUrkp8VBLdmyYep2L+2qYfj2W6a5vXL0HHpWQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C2CDF8051E;
	Sat,  5 Dec 2020 09:03:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D0DBF80254; Fri,  4 Dec 2020 03:43:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13, RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EC4BF8012A
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 03:43:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EC4BF8012A
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CnH7b2Y2tzkkxZ;
 Fri,  4 Dec 2020 10:43:07 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 10:43:34 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 "NXP Linux Team" <linux-imx@nxp.com>, David Airlie <airlied@linux.ie>,
 "Daniel Vetter" <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Thierry Reding" <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, "Ricardo
 Ribalda" <ribalda@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>, linux-mmc
 <linux-mmc@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, alsa-devel
 <alsa-devel@alsa-project.org>
Subject: [PATCH 1/1] dt-bindings: eliminate yamllint warnings
Date: Fri, 4 Dec 2020 10:42:26 +0800
Message-ID: <20201204024226.1222-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20201204024226.1222-1-thunder.leizhen@huawei.com>
References: <20201204024226.1222-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 05 Dec 2020 09:03:14 +0100
Cc: Zhen Lei <thunder.leizhen@huawei.com>
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

All warnings are related only to "wrong indentation", except one:
Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:4:1: \
[error] missing document start "---" (document-start)

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/clock/imx8qxp-lpcg.yaml    | 20 ++++++++---------
 .../bindings/display/bridge/analogix,anx7625.yaml  |  4 ++--
 .../bindings/display/bridge/intel,keembay-dsi.yaml |  4 ++--
 .../bindings/display/intel,keembay-msscam.yaml     |  4 ++--
 .../bindings/display/panel/novatek,nt36672a.yaml   |  2 +-
 .../devicetree/bindings/media/i2c/adv7604.yaml     |  4 ++--
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml    | 11 ++++-----
 .../devicetree/bindings/media/i2c/ovti,ov772x.yaml | 12 +++++-----
 .../devicetree/bindings/media/i2c/sony,imx214.yaml | 12 +++++-----
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml  | 26 +++++++++++-----------
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml         |  4 ++--
 11 files changed, 52 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
index e709e530e17a27a..940486ef1051d10 100644
--- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
@@ -29,18 +29,18 @@ properties:
       - const: fsl,imx8qxp-lpcg
       - items:
           - enum:
-            - fsl,imx8qm-lpcg
+              - fsl,imx8qm-lpcg
           - const: fsl,imx8qxp-lpcg
       - enum:
-        - fsl,imx8qxp-lpcg-adma
-        - fsl,imx8qxp-lpcg-conn
-        - fsl,imx8qxp-lpcg-dc
-        - fsl,imx8qxp-lpcg-dsp
-        - fsl,imx8qxp-lpcg-gpu
-        - fsl,imx8qxp-lpcg-hsio
-        - fsl,imx8qxp-lpcg-img
-        - fsl,imx8qxp-lpcg-lsio
-        - fsl,imx8qxp-lpcg-vpu
+          - fsl,imx8qxp-lpcg-adma
+          - fsl,imx8qxp-lpcg-conn
+          - fsl,imx8qxp-lpcg-dc
+          - fsl,imx8qxp-lpcg-dsp
+          - fsl,imx8qxp-lpcg-gpu
+          - fsl,imx8qxp-lpcg-hsio
+          - fsl,imx8qxp-lpcg-img
+          - fsl,imx8qxp-lpcg-lsio
+          - fsl,imx8qxp-lpcg-vpu
         deprecated: true
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 60585a4fc22bc9f..9392b5502a3293c 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -49,8 +49,8 @@ properties:
           Video port for panel or connector.
 
     required:
-        - port@0
-        - port@1
+      - port@0
+      - port@1
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
index ab5be26252240ea..35c9dfd866501a0 100644
--- a/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
@@ -39,10 +39,10 @@ properties:
 
     properties:
       '#address-cells':
-       const: 1
+        const: 1
 
       '#size-cells':
-       const: 0
+        const: 0
 
       port@0:
         type: object
diff --git a/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml b/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml
index 40caa61188098c2..a222b52d8b8ff6b 100644
--- a/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml
+++ b/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml
@@ -18,8 +18,8 @@ description: |
 properties:
   compatible:
     items:
-     - const: intel,keembay-msscam
-     - const: syscon
+      - const: intel,keembay-msscam
+      - const: syscon
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index d2170de6b72302f..2f5df1d235aea8a 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -22,7 +22,7 @@ properties:
   compatible:
     items:
       - enum:
-         - tianma,fhd-video
+          - tianma,fhd-video
       - const: novatek,nt36672a
     description: This indicates the panel manufacturer of the panel that is
       in turn using the NT36672A panel driver. This compatible string
diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
index 81f17e719d87da5..693f31daf5aa699 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
@@ -21,8 +21,8 @@ properties:
   compatible:
     items:
       - enum:
-        - adi,adv7611
-        - adi,adv7612
+          - adi,adv7611
+          - adi,adv7612
 
   reg:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index 1d90767a61962b3..41400ecbbb35eac 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 # Copyright (C) 2014--2020 Intel Corporation
-
+%YAML 1.2
+---
 $id: http://devicetree.org/schemas/media/i2c/mipi-ccs.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
@@ -26,11 +27,11 @@ properties:
   compatible:
     oneOf:
       - items:
-        - const: mipi-ccs-1.1
-        - const: mipi-ccs
+          - const: mipi-ccs-1.1
+          - const: mipi-ccs
       - items:
-        - const: mipi-ccs-1.0
-        - const: mipi-ccs
+          - const: mipi-ccs-1.0
+          - const: mipi-ccs
       - const: nokia,smia
 
   reg:
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
index 450e5bd64312ddf..eedc560837d2c80 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
@@ -76,18 +76,18 @@ properties:
                 bus-type:
                   const: 6
             then:
-                properties:
-                  hsync-active: false
-                  vsync-active: false
+              properties:
+                hsync-active: false
+                vsync-active: false
 
           - if:
               properties:
                 bus-width:
                   const: 10
             then:
-                properties:
-                  data-shift:
-                    const: 0
+              properties:
+                data-shift:
+                  const: 0
 
         required:
           - bus-type
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
index 884bd3527e0a430..0599df605a4f8a6 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
@@ -69,13 +69,13 @@ properties:
             description: See ../video-interfaces.txt
             anyOf:
               - items:
-                - const: 1
-                - const: 2
+                  - const: 1
+                  - const: 2
               - items:
-                - const: 1
-                - const: 2
-                - const: 3
-                - const: 4
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
 
           link-frequencies:
             $ref: /schemas/types.yaml#/definitions/uint64-array
diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 030e3fdce49293a..01630b0ecea773e 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -17,21 +17,21 @@ properties:
   compatible:
     oneOf:
       - enum:
-        - mediatek,mt2701-mmc
-        - mediatek,mt2712-mmc
-        - mediatek,mt6779-mmc
-        - mediatek,mt7620-mmc
-        - mediatek,mt7622-mmc
-        - mediatek,mt8135-mmc
-        - mediatek,mt8173-mmc
-        - mediatek,mt8183-mmc
-        - mediatek,mt8516-mmc
+          - mediatek,mt2701-mmc
+          - mediatek,mt2712-mmc
+          - mediatek,mt6779-mmc
+          - mediatek,mt7620-mmc
+          - mediatek,mt7622-mmc
+          - mediatek,mt8135-mmc
+          - mediatek,mt8173-mmc
+          - mediatek,mt8183-mmc
+          - mediatek,mt8516-mmc
       - items:
-        - const: mediatek,mt7623-mmc
-        - const: mediatek,mt2701-mmc
+          - const: mediatek,mt7623-mmc
+          - const: mediatek,mt2701-mmc
       - items:
-        - const: mediatek,mt8192-mmc
-        - const: mediatek,mt8183-mmc
+          - const: mediatek,mt8192-mmc
+          - const: mediatek,mt8183-mmc
 
   clocks:
     description:
diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index bf8c8ba25009dcc..54650823b29a41d 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek MT8192 with MT6359, RT1015 and RT5682 ASoC sound card driver
 
 maintainers:
-   - Jiaxin Yu <jiaxin.yu@mediatek.com>
-   - Shane Chien <shane.chien@mediatek.com>
+  - Jiaxin Yu <jiaxin.yu@mediatek.com>
+  - Shane Chien <shane.chien@mediatek.com>
 
 description:
   This binding describes the MT8192 sound card.
-- 
1.8.3


