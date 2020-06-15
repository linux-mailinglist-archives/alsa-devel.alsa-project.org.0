Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CBB1F8E4C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 08:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 867B2166C;
	Mon, 15 Jun 2020 08:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 867B2166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592203745;
	bh=sOlCZeAIIdnJeZ75NMKYKIJfx785+zKJ7yu0YkJu2qg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M802Q+4gSkOpbvIKGkaP43wv0CQqX7ulcpQwcGaxZDI9g1QkSBazByK0fn5PqbGoE
	 6+P+q4lDvJOBVmIQr+6dvmqffHo+vzDQlb3IoNHpWiytB7Qu+86liKVW3+eKgf+Xaw
	 MWFt8hNWp86NmvAJPKyRO2r3NgtxnmIXRTjvoCp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC77EF80162;
	Mon, 15 Jun 2020 08:47:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 027B3F80162; Mon, 15 Jun 2020 08:47:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F13CFF800CD
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 08:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F13CFF800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eYahEgyP"
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 947E521556;
 Mon, 15 Jun 2020 06:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592203632;
 bh=sOlCZeAIIdnJeZ75NMKYKIJfx785+zKJ7yu0YkJu2qg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eYahEgyPPQXSmFAT7H9YIWLrUz7r9bYJ3sEmnpf2WjfEZkEfYSQL+dnCBid4wPO3T
 Ff7Yc21Lokg1ydol9hQBG25i5Bwy/5e16o9e1ssMGQswWyQGV4Zw4FZ3rWBJGz9Iwd
 tmb2mt5uOxRpXVgFNGkevjoXwvHrVow/kwT35a+w=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
 (envelope-from <mchehab@kernel.org>)
 id 1jkith-009nmo-QD; Mon, 15 Jun 2020 08:47:09 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 13/29] dt: fix broken links due to txt->yaml renames
Date: Mon, 15 Jun 2020 08:46:52 +0200
Message-Id: <0e4a7f0b7efcc8109c8a41a2e13c8adde4d9c6b9.1592203542.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592203542.git.mchehab+huawei@kernel.org>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, netdev@vger.kernel.org,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-bluetooth@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 "David S. Miller" <davem@davemloft.net>
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

There are some new broken doc links due to yaml renames
at DT. Developers should really run:

	./scripts/documentation-file-ref-check

in order to solve those issues while submitting patches.
This tool can even fix most of the issues with:

	./scripts/documentation-file-ref-check --fix

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/devicetree/bindings/display/bridge/sii902x.txt  | 2 +-
 .../devicetree/bindings/display/rockchip/rockchip-drm.yaml    | 2 +-
 Documentation/devicetree/bindings/net/mediatek-bluetooth.txt  | 2 +-
 Documentation/devicetree/bindings/sound/audio-graph-card.txt  | 2 +-
 Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt  | 2 +-
 Documentation/mips/ingenic-tcu.rst                            | 2 +-
 MAINTAINERS                                                   | 4 ++--
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/sii902x.txt b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
index 6e14e087c0d0..0d1db3f9da84 100644
--- a/Documentation/devicetree/bindings/display/bridge/sii902x.txt
+++ b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
@@ -37,7 +37,7 @@ Optional properties:
 	simple-card or audio-graph-card binding. See their binding
 	documents on how to describe the way the sii902x device is
 	connected to the rest of the audio system:
-	Documentation/devicetree/bindings/sound/simple-card.txt
+	Documentation/devicetree/bindings/sound/simple-card.yaml
 	Documentation/devicetree/bindings/sound/audio-graph-card.txt
 	Note: In case of the audio-graph-card binding the used port
 	index should be 3.
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
index ec8ae742d4da..7204da5eb4c5 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
@@ -24,7 +24,7 @@ properties:
     description: |
       Should contain a list of phandles pointing to display interface port
       of vop devices. vop definitions as defined in
-      Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
+      Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
index 219bcbd0d344..9ef5bacda8c1 100644
--- a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
@@ -3,7 +3,7 @@ MediaTek SoC built-in Bluetooth Devices
 
 This device is a serial attached device to BTIF device and thus it must be a
 child node of the serial node with BTIF. The dt-bindings details for BTIF
-device can be known via Documentation/devicetree/bindings/serial/8250.txt.
+device can be known via Documentation/devicetree/bindings/serial/8250.yaml.
 
 Required properties:
 
diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.txt b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
index 269682619a70..d5f6919a2d69 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card.txt
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
@@ -5,7 +5,7 @@ It is based on common bindings for device graphs.
 see ${LINUX}/Documentation/devicetree/bindings/graph.txt
 
 Basically, Audio Graph Card property is same as Simple Card.
-see ${LINUX}/Documentation/devicetree/bindings/sound/simple-card.txt
+see ${LINUX}/Documentation/devicetree/bindings/sound/simple-card.yaml
 
 Below are same as Simple-Card.
 
diff --git a/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt b/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
index 4d51f3f5ea98..a6ffcdec6f6a 100644
--- a/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
@@ -5,7 +5,7 @@ codec or external codecs.
 
 sti sound drivers allows to expose sti SoC audio interface through the
 generic ASoC simple card. For details about sound card declaration please refer to
-Documentation/devicetree/bindings/sound/simple-card.txt.
+Documentation/devicetree/bindings/sound/simple-card.yaml.
 
 1) sti-uniperiph-dai: audio dai device.
 ---------------------------------------
diff --git a/Documentation/mips/ingenic-tcu.rst b/Documentation/mips/ingenic-tcu.rst
index c5a646b14450..2b75760619b4 100644
--- a/Documentation/mips/ingenic-tcu.rst
+++ b/Documentation/mips/ingenic-tcu.rst
@@ -68,4 +68,4 @@ and frameworks can be controlled from the same registers, all of these
 drivers access their registers through the same regmap.
 
 For more information regarding the devicetree bindings of the TCU drivers,
-have a look at Documentation/devicetree/bindings/timer/ingenic,tcu.txt.
+have a look at Documentation/devicetree/bindings/timer/ingenic,tcu.yaml.
diff --git a/MAINTAINERS b/MAINTAINERS
index 68f21d46614c..0617dd671c2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3946,7 +3946,7 @@ L:	linux-crypto@vger.kernel.org
 S:	Supported
 F:	drivers/char/hw_random/cctrng.c
 F:	drivers/char/hw_random/cctrng.h
-F:	Documentation/devicetree/bindings/rng/arm-cctrng.txt
+F:	Documentation/devicetree/bindings/rng/arm-cctrng.yaml
 W:	https://developer.arm.com/products/system-ip/trustzone-cryptocell/cryptocell-700-family
 
 CEC FRAMEWORK
@@ -5490,7 +5490,7 @@ F:	include/uapi/drm/r128_drm.h
 DRM DRIVER FOR RAYDIUM RM67191 PANELS
 M:	Robert Chiras <robert.chiras@nxp.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
+F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
 F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
 
 DRM DRIVER FOR ROCKTECH JH057N00900 PANELS
-- 
2.26.2

