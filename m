Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A54AAA54
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 19:46:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D855D166A;
	Thu,  5 Sep 2019 19:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D855D166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567705607;
	bh=yWYMSpAzlZDq9XicshhXCDXMtffdUVsWAoUDllt8GGo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SNM4qYzJWFbuePN9gt70i61DL0tHWTljZvASaFmNMJy836mAsoryrAuucr5IkHpLE
	 nW5rlaAmaqgOPP8KXYqCNaElXLNVR+tTlrhZ9FBUgxhaw/lX7bRx4BRVY17vcGjBDg
	 u1Qit4y8XwRqyupnIDDIoIXwdFAHIIAPj+pbH8lc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 250A8F80677;
	Thu,  5 Sep 2019 19:39:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5146FF805FC; Thu,  5 Sep 2019 19:39:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF507F80539
 for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2019 19:38:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF507F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mowcuX34"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Kw7Sc8/OUQI+XpZIlQtPa4/jzKwmZbnxhfallE10YPc=; b=mowcuX34XcKt
 v+4geV1ZMQnB+/NsSasJjxDooP6ryicAAxa2GfxQOvQXvY5uXFahofnXDH0mkfgyl2LucPgBKTx54
 apbFNdNeEZoGMNZouDybLLDbQ5SHMZbKY9WDLP08+JlXLpIFY0Zba52Mk5gufIa7JXA4wMYv5Fxvq
 Q6FHU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5vih-0005HM-B8; Thu, 05 Sep 2019 17:38:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id CD1272742D1C; Thu,  5 Sep 2019 18:38:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20190905120120.31752-2-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190905173854.CD1272742D1C@ypsilon.sirena.org.uk>
Date: Thu,  5 Sep 2019 18:38:54 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: meson: add sm1 compatibles" to the asoc
	tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: meson: add sm1 compatibles

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f466309534b6f21304e1ee0573a60df9c4590272 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 5 Sep 2019 14:01:13 +0200
Subject: [PATCH] ASoC: meson: add sm1 compatibles

Document the compatible strings of the audio devices of the sm1 SoC
family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20190905120120.31752-2-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt  | 4 +++-
 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt   | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-spdifin.txt         | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-spdifout.txt        | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt  | 4 +++-
 .../devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt       | 3 ++-
 6 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
index 4330fc9dca6d..4b17073c8f8c 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
@@ -4,7 +4,9 @@ Required properties:
 - compatible: 'amlogic,axg-toddr' or
 	      'amlogic,axg-toddr' or
 	      'amlogic,g12a-frddr' or
-	      'amlogic,g12a-toddr'
+	      'amlogic,g12a-toddr' or
+	      'amlogic,sm1-frddr' or
+	      'amlogic,sm1-toddr'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - interrupts: interrupt specifier for the fifo.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
index 73f473a9365f..b3f097976e6b 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible: 'amlogic,axg-pdm' or
-	      'amlogic,g12a-pdm'
+	      'amlogic,g12a-pdm' or
+	      'amlogic,sm1-pdm'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: list of clock phandle, one for each entry clock-names.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
index 0b82504fa419..62e5bca71664 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible: 'amlogic,axg-spdifin' or
-	      'amlogic,g12a-spdifin'
+	      'amlogic,g12a-spdifin' or
+	      'amlogic,sm1-spdifin'
 - interrupts: interrupt specifier for the spdif input.
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
index 826152730508..d38aa35ec630 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible: 'amlogic,axg-spdifout' or
-	      'amlogic,g12a-spdifout'
+	      'amlogic,g12a-spdifout' or
+	      'amlogic,sm1-spdifout'
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
   * "pclk" : peripheral clock.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
index 8835a43edfbb..5996c0cd89c2 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
@@ -4,7 +4,9 @@ Required properties:
 - compatible: 'amlogic,axg-tdmin' or
 	      'amlogic,axg-tdmout' or
 	      'amlogic,g12a-tdmin' or
-	      'amlogic,g12a-tdmout'
+	      'amlogic,g12a-tdmout' or
+	      'amlogic,sm1-tdmin' or
+	      'amlogic,sm1-tdmout
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: list of clock phandle, one for each entry clock-names.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
index aa6c35570d31..173a95045540 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
@@ -1,7 +1,8 @@
 * Amlogic HDMI Tx control glue
 
 Required properties:
-- compatible: "amlogic,g12a-tohdmitx"
+- compatible: "amlogic,g12a-tohdmitx" or
+	      "amlogic,sm1-tohdmitx"
 - reg: physical base address of the controller and length of memory
        mapped region.
 - #sound-dai-cells: should be 1.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
