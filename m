Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 783CC2ADD63
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 18:50:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFCDC1740;
	Tue, 10 Nov 2020 18:49:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFCDC1740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605030650;
	bh=zPxIMAkEVIEMOAGGnj6kQhsiXvLfhAIJ8JDU+PGhGrU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gnWUh+fhhAhKwD4quXtG+ruoRo/4lxBXfqL5bU3lb1TAiZmPtfMiDDwkAO1SdFVP/
	 HNg5XHIYg14Bc3y2z/7VVa7wUPlbn2ujxvA+E3Nu2WkqJxEQMVlyG3yvFcZE7QVwvF
	 oUCWZZKtkufED0f77MPivBK6pjDWFf6cTsQGchOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B727F80059;
	Tue, 10 Nov 2020 18:49:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FABEF801D5; Tue, 10 Nov 2020 18:49:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79C40F800EB
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 18:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79C40F800EB
Received: from ramsan.of.borg ([84.195.186.194])
 by andre.telenet-ops.be with bizsmtp
 id qhp52300z4C55Sk01hp51Z; Tue, 10 Nov 2020 18:49:06 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kcXlR-001FNO-Iw; Tue, 10 Nov 2020 18:49:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kcXlQ-00EK6n-TX; Tue, 10 Nov 2020 18:49:04 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: Fix 7/8 spaces indentation in Kconfig
Date: Tue, 10 Nov 2020 18:49:04 +0100
Message-Id: <20201110174904.3413846-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org
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

Some entries used 7 or 8 spaces instead if a single TAB.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 sound/soc/codecs/Kconfig       | 18 +++++++++---------
 sound/soc/generic/Kconfig      |  2 +-
 sound/soc/intel/boards/Kconfig |  2 +-
 sound/soc/meson/Kconfig        |  2 +-
 sound/soc/pxa/Kconfig          | 14 +++++++-------
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 34c6dd04b85a3c9e..384c5de0107e4077 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -517,7 +517,7 @@ config SND_SOC_AK5558
 	select REGMAP_I2C
 
 config SND_SOC_ALC5623
-       tristate "Realtek ALC5623 CODEC"
+	tristate "Realtek ALC5623 CODEC"
 	depends on I2C
 
 config SND_SOC_ALC5632
@@ -728,7 +728,7 @@ config SND_SOC_JZ4770_CODEC
 	  will be called snd-soc-jz4770-codec.
 
 config SND_SOC_L3
-       tristate
+	tristate
 
 config SND_SOC_DA7210
 	tristate
@@ -768,10 +768,10 @@ config SND_SOC_HDMI_CODEC
 	select HDMI
 
 config SND_SOC_ES7134
-       tristate "Everest Semi ES7134 CODEC"
+	tristate "Everest Semi ES7134 CODEC"
 
 config SND_SOC_ES7241
-       tristate "Everest Semi ES7241 CODEC"
+	tristate "Everest Semi ES7241 CODEC"
 
 config SND_SOC_ES8316
 	tristate "Everest Semi ES8316 CODEC"
@@ -970,10 +970,10 @@ config SND_SOC_PCM186X_SPI
 	select REGMAP_SPI
 
 config SND_SOC_PCM3008
-       tristate
+	tristate
 
 config SND_SOC_PCM3060
-       tristate
+	tristate
 
 config SND_SOC_PCM3060_I2C
 	tristate "Texas Instruments PCM3060 CODEC - I2C"
@@ -1436,7 +1436,7 @@ config SND_SOC_UDA1334
 	  rate) and mute.
 
 config SND_SOC_UDA134X
-       tristate
+	tristate
 
 config SND_SOC_UDA1380
 	tristate
@@ -1761,8 +1761,8 @@ config SND_SOC_MT6660
 	  Select M to build this as module.
 
 config SND_SOC_NAU8540
-       tristate "Nuvoton Technology Corporation NAU85L40 CODEC"
-       depends on I2C
+	tristate "Nuvoton Technology Corporation NAU85L40 CODEC"
+	depends on I2C
 
 config SND_SOC_NAU8810
 	tristate "Nuvoton Technology Corporation NAU88C10 CODEC"
diff --git a/sound/soc/generic/Kconfig b/sound/soc/generic/Kconfig
index a90c3b28bce5fcac..4cafcf0e2bbfd38d 100644
--- a/sound/soc/generic/Kconfig
+++ b/sound/soc/generic/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config SND_SIMPLE_CARD_UTILS
-       tristate
+	tristate
 
 config SND_SIMPLE_CARD
 	tristate "ASoC Simple sound card support"
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index c10c37803c670b6b..dddb672a6d553357 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -552,7 +552,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT715_SDCA_SDW
 	select SND_SOC_RT5682_SDW
 	select SND_SOC_DMIC
-        help
+	help
 	  Add support for Intel SoundWire-based platforms connected to
 	  MAX98373, RT700, RT711, RT1308 and RT715
 	  If unsure select "N".
diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 363dc3b1bbe47032..917fce7fa3cb7bde 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -98,7 +98,7 @@ config SND_MESON_AXG_PDM
 	  in the Amlogic AXG SoC family
 
 config SND_MESON_CARD_UTILS
-       tristate
+	tristate
 
 config SND_MESON_CODEC_GLUE
 	tristate
diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index 0ac85eada75cb1b7..9d40e8a206d104aa 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -221,13 +221,13 @@ config SND_PXA2XX_SOC_MIOA701
 	  MIO A701.
 
 config SND_PXA2XX_SOC_IMOTE2
-       tristate "SoC Audio support for IMote 2"
-       depends on SND_PXA2XX_SOC && MACH_INTELMOTE2 && I2C
-       select SND_PXA2XX_SOC_I2S
-       select SND_SOC_WM8940
-       help
-	 Say Y if you want to add support for SoC audio on the
-	 IMote 2.
+	tristate "SoC Audio support for IMote 2"
+	depends on SND_PXA2XX_SOC && MACH_INTELMOTE2 && I2C
+	select SND_PXA2XX_SOC_I2S
+	select SND_SOC_WM8940
+	help
+	  Say Y if you want to add support for SoC audio on the
+	  IMote 2.
 
 config SND_MMP_SOC_BROWNSTONE
 	tristate "SoC Audio support for Marvell Brownstone"
-- 
2.25.1

