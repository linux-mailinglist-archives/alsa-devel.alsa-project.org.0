Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E459B308937
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 14:01:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E937216B5;
	Fri, 29 Jan 2021 14:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E937216B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611925264;
	bh=dwWqmtFpy+3hGfgvGGHM7d5NKrp1QHS/ERrisAXcNkA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dpKZNu4VNE99WGMXVfsIXQ5J9B954apEe8lzDtcj5YrnQJHBcILuG6EyBsi8z3FPT
	 CUpG8OUbqmc9yOrYhpyAJACyufS9UldogU4Tt8wQBdloghxdk/ymDDuDUqsmlU4ckY
	 GXDpJBVSt5EWK5gqE0/Bx5qy8Sd4N5HwN7adHdqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C089FF8026B;
	Fri, 29 Jan 2021 13:59:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A9DAF80269; Fri, 29 Jan 2021 13:59:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C048F800E9
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 13:59:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C048F800E9
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id NczH2400S4C55Sk01czHGR; Fri, 29 Jan 2021 13:59:19 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l5TMr-001bDY-0Y; Fri, 29 Jan 2021 13:59:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l5TMq-00B8AJ-Hy; Fri, 29 Jan 2021 13:59:16 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sameer Pujar <spujar@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ASoC: tegra: SND_SOC_TEGRA_AUDIO_GRAPH_CARD should depend on
 SND_SOC_TEGRA
Date: Fri, 29 Jan 2021 13:59:15 +0100
Message-Id: <20210129125915.2652952-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
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

Audio Graph Card based Tegra driver is only useful on NVIDIA Tegra SoCs.
Hence add a dependency on SND_SOC_TEGRA, to prevent asking the user
about this driver when configuring a kernel without Tegra sound support.

Wrap all Tegra sound config options inside a big if/endif block, instead
of just adding the dependency to the single config option that does not
have it yet, to preventing similar future mistakes.

Fixes: 202e2f7745437aa5 ("ASoC: tegra: Add audio graph based card driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/tegra/Kconfig | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 6dc83ad8607a1de2..a4e6760944d028cf 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -9,9 +9,10 @@ config SND_SOC_TEGRA
 	help
 	  Say Y or M here if you want support for SoC audio on Tegra.
 
+if SND_SOC_TEGRA
+
 config SND_SOC_TEGRA20_AC97
 	tristate "Tegra20 AC97 interface"
-	depends on SND_SOC_TEGRA
 	select SND_SOC_AC97_BUS
 	select SND_SOC_TEGRA20_DAS
 	help
@@ -21,7 +22,6 @@ config SND_SOC_TEGRA20_AC97
 
 config SND_SOC_TEGRA20_DAS
 	tristate "Tegra20 DAS module"
-	depends on SND_SOC_TEGRA
 	help
 	  Say Y or M if you want to add support for the Tegra20 DAS module.
 	  You will also need to select the individual machine drivers to
@@ -29,7 +29,6 @@ config SND_SOC_TEGRA20_DAS
 
 config SND_SOC_TEGRA20_I2S
 	tristate "Tegra20 I2S interface"
-	depends on SND_SOC_TEGRA
 	select SND_SOC_TEGRA20_DAS
 	help
 	  Say Y or M if you want to add support for codecs attached to the
@@ -38,7 +37,6 @@ config SND_SOC_TEGRA20_I2S
 
 config SND_SOC_TEGRA20_SPDIF
 	tristate "Tegra20 SPDIF interface"
-	depends on SND_SOC_TEGRA
 	help
 	  Say Y or M if you want to add support for the Tegra20 SPDIF interface.
 	  You will also need to select the individual machine drivers to support
@@ -46,7 +44,6 @@ config SND_SOC_TEGRA20_SPDIF
 
 config SND_SOC_TEGRA30_AHUB
 	tristate "Tegra30 AHUB module"
-	depends on SND_SOC_TEGRA
 	help
 	  Say Y or M if you want to add support for the Tegra30 AHUB module.
 	  You will also need to select the individual machine drivers to
@@ -54,7 +51,6 @@ config SND_SOC_TEGRA30_AHUB
 
 config SND_SOC_TEGRA30_I2S
 	tristate "Tegra30 I2S interface"
-	depends on SND_SOC_TEGRA
 	select SND_SOC_TEGRA30_AHUB
 	help
 	  Say Y or M if you want to add support for codecs attached to the
@@ -63,7 +59,6 @@ config SND_SOC_TEGRA30_I2S
 
 config SND_SOC_TEGRA210_AHUB
 	tristate "Tegra210 AHUB module"
-	depends on SND_SOC_TEGRA
 	help
 	  Config to enable Audio Hub (AHUB) module, which comprises of a
 	  switch called Audio Crossbar (AXBAR) used to configure or modify
@@ -73,7 +68,6 @@ config SND_SOC_TEGRA210_AHUB
 
 config SND_SOC_TEGRA210_DMIC
 	tristate "Tegra210 DMIC module"
-	depends on SND_SOC_TEGRA
 	help
 	  Config to enable the Digital MIC (DMIC) controller which is used
 	  to interface with Pulse Density Modulation (PDM) input devices.
@@ -84,7 +78,6 @@ config SND_SOC_TEGRA210_DMIC
 
 config SND_SOC_TEGRA210_I2S
 	tristate "Tegra210 I2S module"
-	depends on SND_SOC_TEGRA
 	help
 	  Config to enable the Inter-IC Sound (I2S) Controller which
 	  implements full-duplex and bidirectional and single direction
@@ -94,7 +87,6 @@ config SND_SOC_TEGRA210_I2S
 
 config SND_SOC_TEGRA186_DSPK
 	tristate "Tegra186 DSPK module"
-	depends on SND_SOC_TEGRA
 	help
 	  Config to enable the Digital Speaker Controller (DSPK) which
 	  converts the multi-bit Pulse Code Modulation (PCM) audio input to
@@ -107,7 +99,6 @@ config SND_SOC_TEGRA186_DSPK
 
 config SND_SOC_TEGRA210_ADMAIF
 	tristate "Tegra210 ADMAIF module"
-	depends on SND_SOC_TEGRA
 	help
 	  Config to enable ADMAIF which is the interface between ADMA and
 	  Audio Hub (AHUB). Each ADMA channel that sends/receives data to/
@@ -128,7 +119,7 @@ config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
 
 config SND_SOC_TEGRA_RT5640
 	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
-	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	depends on I2C && GPIOLIB
 	select SND_SOC_RT5640
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
@@ -136,7 +127,7 @@ config SND_SOC_TEGRA_RT5640
 
 config SND_SOC_TEGRA_WM8753
 	tristate "SoC Audio support for Tegra boards using a WM8753 codec"
-	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	depends on I2C && GPIOLIB
 	select SND_SOC_WM8753
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
@@ -144,7 +135,7 @@ config SND_SOC_TEGRA_WM8753
 
 config SND_SOC_TEGRA_WM8903
 	tristate "SoC Audio support for Tegra boards using a WM8903 codec"
-	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	depends on I2C && GPIOLIB
 	select SND_SOC_WM8903
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
@@ -153,7 +144,7 @@ config SND_SOC_TEGRA_WM8903
 
 config SND_SOC_TEGRA_WM9712
 	tristate "SoC Audio support for Tegra boards using a WM9712 codec"
-	depends on SND_SOC_TEGRA && GPIOLIB
+	depends on GPIOLIB
 	select SND_SOC_TEGRA20_AC97
 	select SND_SOC_WM9712
 	help
@@ -162,7 +153,7 @@ config SND_SOC_TEGRA_WM9712
 
 config SND_SOC_TEGRA_TRIMSLICE
 	tristate "SoC Audio support for TrimSlice board"
-	depends on SND_SOC_TEGRA && I2C
+	depends on I2C
 	select SND_SOC_TLV320AIC23_I2C
 	help
 	  Say Y or M here if you want to add support for SoC audio on the
@@ -170,7 +161,7 @@ config SND_SOC_TEGRA_TRIMSLICE
 
 config SND_SOC_TEGRA_ALC5632
 	tristate "SoC Audio support for Tegra boards using an ALC5632 codec"
-	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	depends on I2C && GPIOLIB
 	select SND_SOC_ALC5632
 	help
 	  Say Y or M here if you want to add support for SoC audio on the
@@ -178,7 +169,7 @@ config SND_SOC_TEGRA_ALC5632
 
 config SND_SOC_TEGRA_MAX98090
 	tristate "SoC Audio support for Tegra boards using a MAX98090 codec"
-	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	depends on I2C && GPIOLIB
 	select SND_SOC_MAX98090
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
@@ -186,7 +177,7 @@ config SND_SOC_TEGRA_MAX98090
 
 config SND_SOC_TEGRA_RT5677
 	tristate "SoC Audio support for Tegra boards using a RT5677 codec"
-	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	depends on I2C && GPIOLIB
 	select SND_SOC_RT5677
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
@@ -194,9 +185,11 @@ config SND_SOC_TEGRA_RT5677
 
 config SND_SOC_TEGRA_SGTL5000
 	tristate "SoC Audio support for Tegra boards using a SGTL5000 codec"
-	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	depends on I2C && GPIOLIB
 	select SND_SOC_SGTL5000
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
 	  boards using the SGTL5000 codec, such as Apalis T30, Apalis TK1 or
 	  Colibri T30.
+
+endif
-- 
2.25.1

