Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F511ABDFB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 12:34:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41CDF823;
	Thu, 16 Apr 2020 12:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41CDF823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587033247;
	bh=FXk5Kd3nTKXYoaPjFpU3yO4NziJhaehmyF/iuoUQRLM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nDswq2FYv7tkO0HgpHh5uxUCFdRyR7oBDRiWjb5CK5uwZ1xsRhDyU8qo+MTRthAWp
	 v1L80xiD115OalavwMstQVHYzW3UC1DbIsGCdIeIMRWmtuFmdviWRVb0SY3zZ096t0
	 dzOhGx76HS12nxJDaX/2HfBMcRDiE7u7CVPMRkXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3271F8028C;
	Thu, 16 Apr 2020 12:31:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FF4AF8016F; Thu, 16 Apr 2020 12:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_13, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1BB0F8012E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 12:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1BB0F8012E
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:fd83:81bb:c1d7:433d])
 by xavier.telenet-ops.be with bizsmtp
 id TNWz2200j4dKHqf01NWzxF; Thu, 16 Apr 2020 12:31:11 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jP1nP-0001ci-Lk; Thu, 16 Apr 2020 12:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jP1nP-0003z9-KO; Thu, 16 Apr 2020 12:30:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Stefan Popa <stefan.popa@analog.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jiri Kosina <trivial@kernel.org>
Subject: [PATCH trivial 1/6] dt-bindings: Fix misspellings of "Analog Devices"
Date: Thu, 16 Apr 2020 12:30:53 +0200
Message-Id: <20200416103058.15269-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416103058.15269-1-geert+renesas@glider.be>
References: <20200416103058.15269-1-geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dmaengine@vger.kernel.org
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

According to https://www.analog.com/, the company name is spelled
"Analog Devices".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/display/bridge/adi,adv7123.txt        | 4 ++--
 .../devicetree/bindings/display/bridge/adi,adv7511.txt        | 4 ++--
 Documentation/devicetree/bindings/dma/adi,axi-dmac.txt        | 2 +-
 Documentation/devicetree/bindings/iio/dac/ad5755.txt          | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
index a6b2b2b8f3d9e3a6..d3c2a4914ea2c247 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
@@ -1,5 +1,5 @@
-Analog Device ADV7123 Video DAC
--------------------------------
+Analog Devices ADV7123 Video DAC
+--------------------------------
 
 The ADV7123 is a digital-to-analog converter that outputs VGA signals from a
 parallel video input.
diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
index e8ddec5d9d910a5a..659523f538bfc0ee 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
@@ -1,5 +1,5 @@
-Analog Device ADV7511(W)/13/33/35 HDMI Encoders
------------------------------------------
+Analog Devices ADV7511(W)/13/33/35 HDMI Encoders
+------------------------------------------------
 
 The ADV7511, ADV7511W, ADV7513, ADV7533 and ADV7535 are HDMI audio and video
 transmitters compatible with HDMI 1.4 and DVI 1.0. They support color space
diff --git a/Documentation/devicetree/bindings/dma/adi,axi-dmac.txt b/Documentation/devicetree/bindings/dma/adi,axi-dmac.txt
index b38ee732efa9fd5f..cd17684aaab5bcd3 100644
--- a/Documentation/devicetree/bindings/dma/adi,axi-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/adi,axi-dmac.txt
@@ -1,4 +1,4 @@
-Analog Device AXI-DMAC DMA controller
+Analog Devices AXI-DMAC DMA controller
 
 Required properties:
  - compatible: Must be "adi,axi-dmac-1.00.a".
diff --git a/Documentation/devicetree/bindings/iio/dac/ad5755.txt b/Documentation/devicetree/bindings/iio/dac/ad5755.txt
index f0bbd7e1029bd44d..502e1e55adbdebd0 100644
--- a/Documentation/devicetree/bindings/iio/dac/ad5755.txt
+++ b/Documentation/devicetree/bindings/iio/dac/ad5755.txt
@@ -1,4 +1,4 @@
-* Analog Device AD5755 IIO Multi-Channel DAC Linux Driver
+* Analog Devices AD5755 IIO Multi-Channel DAC Linux Driver
 
 Required properties:
  - compatible: Has to contain one of the following:
-- 
2.17.1

