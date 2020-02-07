Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A155155459
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 10:15:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6352E3E;
	Fri,  7 Feb 2020 10:14:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6352E3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581066941;
	bh=cYouInvN+WKZeFBAeu3GPd3J2jG4RbCGB1m6zOuiIWs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HVJdYw6hcspNo/8GPNK0XhjsGmPlgXkdrtvEoAP1IuZwJYYK3GlNli64E0KkFPjCN
	 +PCXevobBWOcVFETXX4RCu5jLEChOpq0MvFKoasROUv0tHAXryZXkwU1kCnLuFa5wH
	 25gA+IgYqdACgV1GJwVCi2TcO6KvYNxTzzNfHwl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DD01F8014C;
	Fri,  7 Feb 2020 10:14:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 645EBF8012F; Fri,  7 Feb 2020 10:13:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB8BCF8012F
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 10:13:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB8BCF8012F
Received: from ramsan ([84.195.182.253]) by andre.telenet-ops.be with bizsmtp
 id zlDt2100S5USYZQ01lDtP9; Fri, 07 Feb 2020 10:13:53 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1izzhx-0000wB-GT; Fri, 07 Feb 2020 10:13:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1izzhx-0004jC-EF; Fri, 07 Feb 2020 10:13:53 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Fri,  7 Feb 2020 10:13:51 +0100
Message-Id: <20200207091351.18133-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [alsa-devel] [PATCH] [RFC] ASoC: Use imply for SND_SOC_ALL_CODECS
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

Currently SND_SOC_ALL_CODECS selects the config symbols for all codec
drivers.  As "select" bypasses dependencies, lots of "select" statements
need explicit dependencies, which are hard to get right, and hard to
maintain[*].

Fix this by using "imply" instead, which is a weak version of "select",
and which obeys dependencies of target symbols.

Add dependencies to invisible symbols that are currently selected only
if their dependencies are fulfilled.

[*] See e.g. commit 13426feaf46c48fc ("ASoC: wcd934x: Add missing
    COMMON_CLK dependency to SND_SOC_ALL_CODECS").

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Does this sound like a good solution?
Anything I'm missing w.r.t. the "imply" semantics?
FIXME Nothing but SND_SOC_ALL_CODECS selects SND_SOC_WM8400!

Tested with m68k/allmodconfig and m68k/allyesconfig only.
Hence some other invisible symbols may still have missing dependencies.
---
 sound/soc/codecs/Kconfig | 520 ++++++++++++++++++++-------------------
 1 file changed, 263 insertions(+), 257 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7e90f5d830971309..7a14b1c416b55e46 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -14,262 +14,262 @@ menu "CODEC drivers"
 config SND_SOC_ALL_CODECS
 	tristate "Build all ASoC CODEC drivers"
 	depends on COMPILE_TEST
-	select SND_SOC_88PM860X if MFD_88PM860X
-	select SND_SOC_L3
-	select SND_SOC_AB8500_CODEC if ABX500_CORE
-	select SND_SOC_AC97_CODEC
-	select SND_SOC_AD1836 if SPI_MASTER
-	select SND_SOC_AD193X_SPI if SPI_MASTER
-	select SND_SOC_AD193X_I2C if I2C
-	select SND_SOC_AD1980 if SND_SOC_AC97_BUS
-	select SND_SOC_AD73311
-	select SND_SOC_ADAU1373 if I2C
-	select SND_SOC_ADAU1761_I2C if I2C
-	select SND_SOC_ADAU1761_SPI if SPI
-	select SND_SOC_ADAU1781_I2C if I2C
-	select SND_SOC_ADAU1781_SPI if SPI
-	select SND_SOC_ADAV801 if SPI_MASTER
-	select SND_SOC_ADAV803 if I2C
-	select SND_SOC_ADAU1977_SPI if SPI_MASTER
-	select SND_SOC_ADAU1977_I2C if I2C
-	select SND_SOC_ADAU1701 if I2C
-	select SND_SOC_ADAU7002
-	select SND_SOC_ADAU7118_I2C if I2C
-	select SND_SOC_ADAU7118_HW
-	select SND_SOC_ADS117X
-	select SND_SOC_AK4104 if SPI_MASTER
-	select SND_SOC_AK4118 if I2C
-	select SND_SOC_AK4458 if I2C
-	select SND_SOC_AK4535 if I2C
-	select SND_SOC_AK4554
-	select SND_SOC_AK4613 if I2C
-	select SND_SOC_AK4641 if I2C
-	select SND_SOC_AK4642 if I2C
-	select SND_SOC_AK4671 if I2C
-	select SND_SOC_AK5386
-	select SND_SOC_AK5558 if I2C
-	select SND_SOC_ALC5623 if I2C
-	select SND_SOC_ALC5632 if I2C
-	select SND_SOC_BT_SCO
-	select SND_SOC_BD28623
-	select SND_SOC_CQ0093VC
-	select SND_SOC_CROS_EC_CODEC if CROS_EC
-	select SND_SOC_CS35L32 if I2C
-	select SND_SOC_CS35L33 if I2C
-	select SND_SOC_CS35L34 if I2C
-	select SND_SOC_CS35L35 if I2C
-	select SND_SOC_CS35L36 if I2C
-	select SND_SOC_CS42L42 if I2C
-	select SND_SOC_CS42L51_I2C if I2C
-	select SND_SOC_CS42L52 if I2C && INPUT
-	select SND_SOC_CS42L56 if I2C && INPUT
-	select SND_SOC_CS42L73 if I2C
-	select SND_SOC_CS4265 if I2C
-	select SND_SOC_CS4270 if I2C
-	select SND_SOC_CS4271_I2C if I2C
-	select SND_SOC_CS4271_SPI if SPI_MASTER
-	select SND_SOC_CS42XX8_I2C if I2C
-	select SND_SOC_CS43130 if I2C
-	select SND_SOC_CS4341 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_CS4349 if I2C
-	select SND_SOC_CS47L15 if MFD_CS47L15
-	select SND_SOC_CS47L24 if MFD_CS47L24
-	select SND_SOC_CS47L35 if MFD_CS47L35
-	select SND_SOC_CS47L85 if MFD_CS47L85
-	select SND_SOC_CS47L90 if MFD_CS47L90
-	select SND_SOC_CS47L92 if MFD_CS47L92
-	select SND_SOC_CS53L30 if I2C
-	select SND_SOC_CX20442 if TTY
-	select SND_SOC_CX2072X if I2C
-	select SND_SOC_DA7210 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_DA7213 if I2C
-	select SND_SOC_DA7218 if I2C
-	select SND_SOC_DA7219 if I2C
-	select SND_SOC_DA732X if I2C
-	select SND_SOC_DA9055 if I2C
-	select SND_SOC_DMIC if GPIOLIB
-	select SND_SOC_ES8316 if I2C
-	select SND_SOC_ES8328_SPI if SPI_MASTER
-	select SND_SOC_ES8328_I2C if I2C
-	select SND_SOC_ES7134
-	select SND_SOC_ES7241
-	select SND_SOC_GTM601
-	select SND_SOC_HDAC_HDMI
-	select SND_SOC_HDAC_HDA
-	select SND_SOC_ICS43432
-	select SND_SOC_INNO_RK3036
-	select SND_SOC_ISABELLE if I2C
-	select SND_SOC_JZ4740_CODEC
-	select SND_SOC_JZ4725B_CODEC
-	select SND_SOC_JZ4770_CODEC
-	select SND_SOC_LM4857 if I2C
-	select SND_SOC_LM49453 if I2C
-	select SND_SOC_LOCHNAGAR_SC if MFD_LOCHNAGAR
-	select SND_SOC_MAX98088 if I2C
-	select SND_SOC_MAX98090 if I2C
-	select SND_SOC_MAX98095 if I2C
-	select SND_SOC_MAX98357A if GPIOLIB
-	select SND_SOC_MAX98371 if I2C
-	select SND_SOC_MAX98504 if I2C
-	select SND_SOC_MAX9867 if I2C
-	select SND_SOC_MAX98925 if I2C
-	select SND_SOC_MAX98926 if I2C
-	select SND_SOC_MAX98927 if I2C
-	select SND_SOC_MAX98373 if I2C
-	select SND_SOC_MAX9850 if I2C
-	select SND_SOC_MAX9860 if I2C
-	select SND_SOC_MAX9759
-	select SND_SOC_MAX9768 if I2C
-	select SND_SOC_MAX9877 if I2C
-	select SND_SOC_MC13783 if MFD_MC13XXX
-	select SND_SOC_ML26124 if I2C
-	select SND_SOC_MT6351 if MTK_PMIC_WRAP
-	select SND_SOC_MT6358 if MTK_PMIC_WRAP
-	select SND_SOC_MT6660 if I2C
-	select SND_SOC_NAU8540 if I2C
-	select SND_SOC_NAU8810 if I2C
-	select SND_SOC_NAU8822 if I2C
-	select SND_SOC_NAU8824 if I2C
-	select SND_SOC_NAU8825 if I2C
-	select SND_SOC_HDMI_CODEC
-	select SND_SOC_PCM1681 if I2C
-	select SND_SOC_PCM1789_I2C if I2C
-	select SND_SOC_PCM179X_I2C if I2C
-	select SND_SOC_PCM179X_SPI if SPI_MASTER
-	select SND_SOC_PCM186X_I2C if I2C
-	select SND_SOC_PCM186X_SPI if SPI_MASTER
-	select SND_SOC_PCM3008
-	select SND_SOC_PCM3060_I2C if I2C
-	select SND_SOC_PCM3060_SPI if SPI_MASTER
-	select SND_SOC_PCM3168A_I2C if I2C
-	select SND_SOC_PCM3168A_SPI if SPI_MASTER
-	select SND_SOC_PCM5102A
-	select SND_SOC_PCM512x_I2C if I2C
-	select SND_SOC_PCM512x_SPI if SPI_MASTER
-	select SND_SOC_RK3328
-	select SND_SOC_RT274 if I2C
-	select SND_SOC_RT286 if I2C
-	select SND_SOC_RT298 if I2C
-	select SND_SOC_RT1011 if I2C
-	select SND_SOC_RT1015 if I2C
-	select SND_SOC_RT1305 if I2C
-	select SND_SOC_RT1308 if I2C
-	select SND_SOC_RT5514 if I2C
-	select SND_SOC_RT5616 if I2C
-	select SND_SOC_RT5631 if I2C
-	select SND_SOC_RT5640 if I2C
-	select SND_SOC_RT5645 if I2C
-	select SND_SOC_RT5651 if I2C
-	select SND_SOC_RT5659 if I2C
-	select SND_SOC_RT5660 if I2C
-	select SND_SOC_RT5663 if I2C
-	select SND_SOC_RT5665 if I2C
-	select SND_SOC_RT5668 if I2C
-	select SND_SOC_RT5670 if I2C
-	select SND_SOC_RT5677 if I2C && SPI_MASTER
-	select SND_SOC_RT5682 if I2C
-	select SND_SOC_RT700_SDW if SOUNDWIRE
-	select SND_SOC_RT711_SDW if SOUNDWIRE
-	select SND_SOC_RT715_SDW if SOUNDWIRE
-	select SND_SOC_RT1308_SDW if SOUNDWIRE
-	select SND_SOC_SGTL5000 if I2C
-	select SND_SOC_SI476X if MFD_SI476X_CORE
-	select SND_SOC_SIMPLE_AMPLIFIER
-	select SND_SOC_SIRF_AUDIO_CODEC
-	select SND_SOC_SPDIF
-	select SND_SOC_SSM2305
-	select SND_SOC_SSM2518 if I2C
-	select SND_SOC_SSM2602_SPI if SPI_MASTER
-	select SND_SOC_SSM2602_I2C if I2C
-	select SND_SOC_SSM4567 if I2C
-	select SND_SOC_STA32X if I2C
-	select SND_SOC_STA350 if I2C
-	select SND_SOC_STA529 if I2C
-	select SND_SOC_STAC9766 if SND_SOC_AC97_BUS
-	select SND_SOC_STI_SAS
-	select SND_SOC_TAS2552 if I2C
-	select SND_SOC_TAS2562 if I2C
-	select SND_SOC_TAS2770 if I2C
-	select SND_SOC_TAS5086 if I2C
-	select SND_SOC_TAS571X if I2C
-	select SND_SOC_TAS5720 if I2C
-	select SND_SOC_TAS6424 if I2C
-	select SND_SOC_TDA7419 if I2C
-	select SND_SOC_TFA9879 if I2C
-	select SND_SOC_TLV320AIC23_I2C if I2C
-	select SND_SOC_TLV320AIC23_SPI if SPI_MASTER
-	select SND_SOC_TLV320AIC26 if SPI_MASTER
-	select SND_SOC_TLV320AIC31XX if I2C
-	select SND_SOC_TLV320AIC32X4_I2C if I2C && COMMON_CLK
-	select SND_SOC_TLV320AIC32X4_SPI if SPI_MASTER && COMMON_CLK
-	select SND_SOC_TLV320AIC3X if I2C
-	select SND_SOC_TPA6130A2 if I2C
-	select SND_SOC_TLV320DAC33 if I2C
-	select SND_SOC_TSCS42XX if I2C
-	select SND_SOC_TSCS454 if I2C
-	select SND_SOC_TS3A227E if I2C
-	select SND_SOC_TWL4030 if TWL4030_CORE
-	select SND_SOC_TWL6040 if TWL6040_CORE
-	select SND_SOC_UDA1334 if GPIOLIB
-	select SND_SOC_UDA134X
-	select SND_SOC_UDA1380 if I2C
-	select SND_SOC_WCD9335 if SLIMBUS
-	select SND_SOC_WCD934X if MFD_WCD934X && COMMON_CLK
-	select SND_SOC_WL1273 if MFD_WL1273_CORE
-	select SND_SOC_WM0010 if SPI_MASTER
-	select SND_SOC_WM1250_EV1 if I2C
-	select SND_SOC_WM2000 if I2C
-	select SND_SOC_WM2200 if I2C
-	select SND_SOC_WM5100 if I2C
-	select SND_SOC_WM5102 if MFD_WM5102
-	select SND_SOC_WM5110 if MFD_WM5110
-	select SND_SOC_WM8350 if MFD_WM8350
-	select SND_SOC_WM8400 if MFD_WM8400
-	select SND_SOC_WM8510 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8523 if I2C
-	select SND_SOC_WM8524 if GPIOLIB
-	select SND_SOC_WM8580 if I2C
-	select SND_SOC_WM8711 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8727
-	select SND_SOC_WM8728 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8731 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8737 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8741 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8750 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8753 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8770 if SPI_MASTER
-	select SND_SOC_WM8776 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8782
-	select SND_SOC_WM8804_I2C if I2C
-	select SND_SOC_WM8804_SPI if SPI_MASTER
-	select SND_SOC_WM8900 if I2C
-	select SND_SOC_WM8903 if I2C
-	select SND_SOC_WM8904 if I2C
-	select SND_SOC_WM8940 if I2C
-	select SND_SOC_WM8955 if I2C
-	select SND_SOC_WM8960 if I2C
-	select SND_SOC_WM8961 if I2C
-	select SND_SOC_WM8962 if I2C && INPUT
-	select SND_SOC_WM8971 if I2C
-	select SND_SOC_WM8974 if I2C
-	select SND_SOC_WM8978 if I2C
-	select SND_SOC_WM8983 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8985 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8988 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8990 if I2C
-	select SND_SOC_WM8991 if I2C
-	select SND_SOC_WM8993 if I2C
-	select SND_SOC_WM8994 if MFD_WM8994
-	select SND_SOC_WM8995 if SND_SOC_I2C_AND_SPI
-	select SND_SOC_WM8996 if I2C
-	select SND_SOC_WM8997 if MFD_WM8997
-	select SND_SOC_WM8998 if MFD_WM8998
-	select SND_SOC_WM9081 if I2C
-	select SND_SOC_WM9090 if I2C
-	select SND_SOC_WM9705 if (SND_SOC_AC97_BUS || SND_SOC_AC97_BUS_NEW)
-	select SND_SOC_WM9712 if (SND_SOC_AC97_BUS || SND_SOC_AC97_BUS_NEW)
-	select SND_SOC_WM9713 if (SND_SOC_AC97_BUS || SND_SOC_AC97_BUS_NEW)
-	select SND_SOC_WSA881X if SOUNDWIRE
+	imply SND_SOC_88PM860X
+	imply SND_SOC_L3
+	imply SND_SOC_AB8500_CODEC
+	imply SND_SOC_AC97_CODEC
+	imply SND_SOC_AD1836
+	imply SND_SOC_AD193X_SPI
+	imply SND_SOC_AD193X_I2C
+	imply SND_SOC_AD1980
+	imply SND_SOC_AD73311
+	imply SND_SOC_ADAU1373
+	imply SND_SOC_ADAU1761_I2C
+	imply SND_SOC_ADAU1761_SPI
+	imply SND_SOC_ADAU1781_I2C
+	imply SND_SOC_ADAU1781_SPI
+	imply SND_SOC_ADAV801
+	imply SND_SOC_ADAV803
+	imply SND_SOC_ADAU1977_SPI
+	imply SND_SOC_ADAU1977_I2C
+	imply SND_SOC_ADAU1701
+	imply SND_SOC_ADAU7002
+	imply SND_SOC_ADAU7118_I2C
+	imply SND_SOC_ADAU7118_HW
+	imply SND_SOC_ADS117X
+	imply SND_SOC_AK4104
+	imply SND_SOC_AK4118
+	imply SND_SOC_AK4458
+	imply SND_SOC_AK4535
+	imply SND_SOC_AK4554
+	imply SND_SOC_AK4613
+	imply SND_SOC_AK4641
+	imply SND_SOC_AK4642
+	imply SND_SOC_AK4671
+	imply SND_SOC_AK5386
+	imply SND_SOC_AK5558
+	imply SND_SOC_ALC5623
+	imply SND_SOC_ALC5632
+	imply SND_SOC_BT_SCO
+	imply SND_SOC_BD28623
+	imply SND_SOC_CQ0093VC
+	imply SND_SOC_CROS_EC_CODEC
+	imply SND_SOC_CS35L32
+	imply SND_SOC_CS35L33
+	imply SND_SOC_CS35L34
+	imply SND_SOC_CS35L35
+	imply SND_SOC_CS35L36
+	imply SND_SOC_CS42L42
+	imply SND_SOC_CS42L51_I2C
+	imply SND_SOC_CS42L52
+	imply SND_SOC_CS42L56
+	imply SND_SOC_CS42L73
+	imply SND_SOC_CS4265
+	imply SND_SOC_CS4270
+	imply SND_SOC_CS4271_I2C
+	imply SND_SOC_CS4271_SPI
+	imply SND_SOC_CS42XX8_I2C
+	imply SND_SOC_CS43130
+	imply SND_SOC_CS4341
+	imply SND_SOC_CS4349
+	imply SND_SOC_CS47L15
+	imply SND_SOC_CS47L24
+	imply SND_SOC_CS47L35
+	imply SND_SOC_CS47L85
+	imply SND_SOC_CS47L90
+	imply SND_SOC_CS47L92
+	imply SND_SOC_CS53L30
+	imply SND_SOC_CX20442
+	imply SND_SOC_CX2072X
+	imply SND_SOC_DA7210
+	imply SND_SOC_DA7213
+	imply SND_SOC_DA7218
+	imply SND_SOC_DA7219
+	imply SND_SOC_DA732X
+	imply SND_SOC_DA9055
+	imply SND_SOC_DMIC
+	imply SND_SOC_ES8316
+	imply SND_SOC_ES8328_SPI
+	imply SND_SOC_ES8328_I2C
+	imply SND_SOC_ES7134
+	imply SND_SOC_ES7241
+	imply SND_SOC_GTM601
+	imply SND_SOC_HDAC_HDMI
+	imply SND_SOC_HDAC_HDA
+	imply SND_SOC_ICS43432
+	imply SND_SOC_INNO_RK3036
+	imply SND_SOC_ISABELLE
+	imply SND_SOC_JZ4740_CODEC
+	imply SND_SOC_JZ4725B_CODEC
+	imply SND_SOC_JZ4770_CODEC
+	imply SND_SOC_LM4857
+	imply SND_SOC_LM49453
+	imply SND_SOC_LOCHNAGAR_SC
+	imply SND_SOC_MAX98088
+	imply SND_SOC_MAX98090
+	imply SND_SOC_MAX98095
+	imply SND_SOC_MAX98357A
+	imply SND_SOC_MAX98371
+	imply SND_SOC_MAX98504
+	imply SND_SOC_MAX9867
+	imply SND_SOC_MAX98925
+	imply SND_SOC_MAX98926
+	imply SND_SOC_MAX98927
+	imply SND_SOC_MAX98373
+	imply SND_SOC_MAX9850
+	imply SND_SOC_MAX9860
+	imply SND_SOC_MAX9759
+	imply SND_SOC_MAX9768
+	imply SND_SOC_MAX9877
+	imply SND_SOC_MC13783
+	imply SND_SOC_ML26124
+	imply SND_SOC_MT6351
+	imply SND_SOC_MT6358
+	imply SND_SOC_MT6660
+	imply SND_SOC_NAU8540
+	imply SND_SOC_NAU8810
+	imply SND_SOC_NAU8822
+	imply SND_SOC_NAU8824
+	imply SND_SOC_NAU8825
+	imply SND_SOC_HDMI_CODEC
+	imply SND_SOC_PCM1681
+	imply SND_SOC_PCM1789_I2C
+	imply SND_SOC_PCM179X_I2C
+	imply SND_SOC_PCM179X_SPI
+	imply SND_SOC_PCM186X_I2C
+	imply SND_SOC_PCM186X_SPI
+	imply SND_SOC_PCM3008
+	imply SND_SOC_PCM3060_I2C
+	imply SND_SOC_PCM3060_SPI
+	imply SND_SOC_PCM3168A_I2C
+	imply SND_SOC_PCM3168A_SPI
+	imply SND_SOC_PCM5102A
+	imply SND_SOC_PCM512x_I2C
+	imply SND_SOC_PCM512x_SPI
+	imply SND_SOC_RK3328
+	imply SND_SOC_RT274
+	imply SND_SOC_RT286
+	imply SND_SOC_RT298
+	imply SND_SOC_RT1011
+	imply SND_SOC_RT1015
+	imply SND_SOC_RT1305
+	imply SND_SOC_RT1308
+	imply SND_SOC_RT5514
+	imply SND_SOC_RT5616
+	imply SND_SOC_RT5631
+	imply SND_SOC_RT5640
+	imply SND_SOC_RT5645
+	imply SND_SOC_RT5651
+	imply SND_SOC_RT5659
+	imply SND_SOC_RT5660
+	imply SND_SOC_RT5663
+	imply SND_SOC_RT5665
+	imply SND_SOC_RT5668
+	imply SND_SOC_RT5670
+	imply SND_SOC_RT5677
+	imply SND_SOC_RT5682
+	imply SND_SOC_RT700_SDW
+	imply SND_SOC_RT711_SDW
+	imply SND_SOC_RT715_SDW
+	imply SND_SOC_RT1308_SDW
+	imply SND_SOC_SGTL5000
+	imply SND_SOC_SI476X
+	imply SND_SOC_SIMPLE_AMPLIFIER
+	imply SND_SOC_SIRF_AUDIO_CODEC
+	imply SND_SOC_SPDIF
+	imply SND_SOC_SSM2305
+	imply SND_SOC_SSM2518
+	imply SND_SOC_SSM2602_SPI
+	imply SND_SOC_SSM2602_I2C
+	imply SND_SOC_SSM4567
+	imply SND_SOC_STA32X
+	imply SND_SOC_STA350
+	imply SND_SOC_STA529
+	imply SND_SOC_STAC9766
+	imply SND_SOC_STI_SAS
+	imply SND_SOC_TAS2552
+	imply SND_SOC_TAS2562
+	imply SND_SOC_TAS2770
+	imply SND_SOC_TAS5086
+	imply SND_SOC_TAS571X
+	imply SND_SOC_TAS5720
+	imply SND_SOC_TAS6424
+	imply SND_SOC_TDA7419
+	imply SND_SOC_TFA9879
+	imply SND_SOC_TLV320AIC23_I2C
+	imply SND_SOC_TLV320AIC23_SPI
+	imply SND_SOC_TLV320AIC26
+	imply SND_SOC_TLV320AIC31XX
+	imply SND_SOC_TLV320AIC32X4_I2C
+	imply SND_SOC_TLV320AIC32X4_SPI
+	imply SND_SOC_TLV320AIC3X
+	imply SND_SOC_TPA6130A2
+	imply SND_SOC_TLV320DAC33
+	imply SND_SOC_TSCS42XX
+	imply SND_SOC_TSCS454
+	imply SND_SOC_TS3A227E
+	imply SND_SOC_TWL4030
+	imply SND_SOC_TWL6040
+	imply SND_SOC_UDA1334
+	imply SND_SOC_UDA134X
+	imply SND_SOC_UDA1380
+	imply SND_SOC_WCD9335
+	imply SND_SOC_WCD934X
+	imply SND_SOC_WL1273
+	imply SND_SOC_WM0010
+	imply SND_SOC_WM1250_EV1
+	imply SND_SOC_WM2000
+	imply SND_SOC_WM2200
+	imply SND_SOC_WM5100
+	imply SND_SOC_WM5102
+	imply SND_SOC_WM5110
+	imply SND_SOC_WM8350
+	imply SND_SOC_WM8400
+	imply SND_SOC_WM8510
+	imply SND_SOC_WM8523
+	imply SND_SOC_WM8524
+	imply SND_SOC_WM8580
+	imply SND_SOC_WM8711
+	imply SND_SOC_WM8727
+	imply SND_SOC_WM8728
+	imply SND_SOC_WM8731
+	imply SND_SOC_WM8737
+	imply SND_SOC_WM8741
+	imply SND_SOC_WM8750
+	imply SND_SOC_WM8753
+	imply SND_SOC_WM8770
+	imply SND_SOC_WM8776
+	imply SND_SOC_WM8782
+	imply SND_SOC_WM8804_I2C
+	imply SND_SOC_WM8804_SPI
+	imply SND_SOC_WM8900
+	imply SND_SOC_WM8903
+	imply SND_SOC_WM8904
+	imply SND_SOC_WM8940
+	imply SND_SOC_WM8955
+	imply SND_SOC_WM8960
+	imply SND_SOC_WM8961
+	imply SND_SOC_WM8962
+	imply SND_SOC_WM8971
+	imply SND_SOC_WM8974
+	imply SND_SOC_WM8978
+	imply SND_SOC_WM8983
+	imply SND_SOC_WM8985
+	imply SND_SOC_WM8988
+	imply SND_SOC_WM8990
+	imply SND_SOC_WM8991
+	imply SND_SOC_WM8993
+	imply SND_SOC_WM8994
+	imply SND_SOC_WM8995
+	imply SND_SOC_WM8996
+	imply SND_SOC_WM8997
+	imply SND_SOC_WM8998
+	imply SND_SOC_WM9081
+	imply SND_SOC_WM9090
+	imply SND_SOC_WM9705
+	imply SND_SOC_WM9712
+	imply SND_SOC_WM9713
+	imply SND_SOC_WSA881X
 	help
 	  Normally ASoC codec drivers are only built if a machine driver which
 	  uses them is also built since they are only usable with a machine
@@ -283,6 +283,7 @@ config SND_SOC_ALL_CODECS
 
 config SND_SOC_88PM860X
 	tristate
+	depends on MFD_88PM860X
 
 config SND_SOC_ARIZONA
 	tristate
@@ -1301,11 +1302,13 @@ config SND_SOC_TSCS454
 	  Add support for Tempo Semiconductor's TSCS454 audio CODEC.
 
 config SND_SOC_TWL4030
-	select MFD_TWL4030_AUDIO
 	tristate
+	depends on TWL4030_CORE
+	select MFD_TWL4030_AUDIO
 
 config SND_SOC_TWL6040
 	tristate
+	depends on TWL6040_CORE
 
 config SND_SOC_UDA1334
 	tristate "NXP UDA1334 DAC"
@@ -1366,9 +1369,12 @@ config SND_SOC_WM5110
 
 config SND_SOC_WM8350
 	tristate
+	depends on MFD_WM8350
 
 config SND_SOC_WM8400
 	tristate
+	# FIXME nothing selects SND_SOC_WM8400??
+	depends on MFD_WM8400
 
 config SND_SOC_WM8510
 	tristate "Wolfson Microelectronics WM8510 CODEC"
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
