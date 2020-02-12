Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C38115AB95
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 16:00:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D88D8166E;
	Wed, 12 Feb 2020 15:59:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D88D8166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581519622;
	bh=0vAMmePJB+37CTkdPu/9q6WVlA5Om3UyNidla9pyK5k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cD37oUe2TaIJKsBZQeIdJroR4mtb8aYi/XL0g57cw/dg88vLpheEWwVczq4o+mxnS
	 6R+XZoddMIE0RC7AyJjqw69lQOmJCZ9kV2W/bSqnbzy2QkdD9fssTm9A6J14Y9UR/G
	 zT+90KSiDP8YE0WvUoIjSyiNI6BOp6c2/7KqrCxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C23CF80278;
	Wed, 12 Feb 2020 15:57:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE28DF80279; Wed, 12 Feb 2020 15:57:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB7D6F80257
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 15:57:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB7D6F80257
Received: from ramsan ([84.195.182.253])
 by baptiste.telenet-ops.be with bizsmtp
 id 1qwu2200W5USYZQ01qwuik; Wed, 12 Feb 2020 15:57:02 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1j1tRe-0004yn-NF; Wed, 12 Feb 2020 15:56:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1j1tRe-0001DS-M0; Wed, 12 Feb 2020 15:56:54 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>
Date: Wed, 12 Feb 2020 15:56:48 +0100
Message-Id: <20200212145650.4602-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212145650.4602-1-geert@linux-m68k.org>
References: <20200212145650.4602-1-geert@linux-m68k.org>
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/3] ASoC: Fix SND_SOC_ALL_CODECS imply SPI
	fallout
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

Fixes for CONFIG_SPI=n:

    WARNING: unmet direct dependencies detected for REGMAP_SPI
      Depends on [n]: SPI [=n]
      Selected by [m]:
      - SND_SOC_ADAU1781_SPI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m]
      - SND_SOC_ADAU1977_SPI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m]

    ERROR: "spi_async" [...] undefined!
    ERROR: "spi_get_device_id" [...] undefined!
    ERROR: "__spi_register_driver" [...] undefined!
    ERROR: "spi_setup" [...] undefined!
    ERROR: "spi_sync" [...] undefined!
    ERROR: "spi_write_then_read" [...] undefined!

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: ea00d95200d02ece ("ASoC: Use imply for SND_SOC_ALL_CODECS")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 sound/soc/codecs/Kconfig | 68 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7a14b1c416b55e46..c2fb985de8c4e02a 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -327,12 +327,14 @@ config SND_SOC_AC97_CODEC
 
 config SND_SOC_AD1836
 	tristate
+	depends on SPI_MASTER
 
 config SND_SOC_AD193X
 	tristate
 
 config SND_SOC_AD193X_SPI
 	tristate
+	depends on SPI_MASTER
 	select SND_SOC_AD193X
 
 config SND_SOC_AD193X_I2C
@@ -390,6 +392,7 @@ config SND_SOC_ADAU1781_I2C
 
 config SND_SOC_ADAU1781_SPI
 	tristate
+	depends on SPI_MASTER
 	select SND_SOC_ADAU1781
 	select REGMAP_SPI
 
@@ -398,6 +401,7 @@ config SND_SOC_ADAU1977
 
 config SND_SOC_ADAU1977_SPI
 	tristate
+	depends on SPI_MASTER
 	select SND_SOC_ADAU1977
 	select REGMAP_SPI
 
@@ -441,6 +445,7 @@ config SND_SOC_ADAV80X
 
 config SND_SOC_ADAV801
 	tristate
+	depends on SPI_MASTER
 	select SND_SOC_ADAV80X
 
 config SND_SOC_ADAV803
@@ -498,6 +503,7 @@ config SND_SOC_ALC5623
 
 config SND_SOC_ALC5632
 	tristate
+	depends on I2C
 
 config SND_SOC_BD28623
 	tristate "ROHM BD28623 CODEC"
@@ -698,6 +704,7 @@ config SND_SOC_L3
 
 config SND_SOC_DA7210
 	tristate
+	depends on I2C
 
 config SND_SOC_DA7213
 	tristate "Dialog DA7213 CODEC"
@@ -705,15 +712,19 @@ config SND_SOC_DA7213
 
 config SND_SOC_DA7218
 	tristate
+	depends on I2C
 
 config SND_SOC_DA7219
 	tristate
+	depends on I2C
 
 config SND_SOC_DA732X
 	tristate
+	depends on I2C
 
 config SND_SOC_DA9055
 	tristate
+	depends on I2C
 
 config SND_SOC_DMIC
 	tristate "Generic Digital Microphone CODEC"
@@ -773,9 +784,11 @@ config SND_SOC_INNO_RK3036
 
 config SND_SOC_ISABELLE
 	tristate
+	depends on I2C
 
 config SND_SOC_LM49453
 	tristate
+	depends on I2C
 
 config SND_SOC_LOCHNAGAR_SC
 	tristate "Lochnagar Sound Card"
@@ -802,17 +815,20 @@ config SND_SOC_MAX98088
 	depends on I2C
 
 config SND_SOC_MAX98090
-       tristate
+	tristate
+	depends on I2C
 
 config SND_SOC_MAX98095
-       tristate
+	tristate
+	depends on I2C
 
 config SND_SOC_MAX98357A
 	tristate "Maxim MAX98357A CODEC"
 	depends on GPIOLIB
 
 config SND_SOC_MAX98371
-       tristate
+	tristate
+	depends on I2C
 
 config SND_SOC_MAX98504
 	tristate "Maxim MAX98504 speaker amplifier"
@@ -823,10 +839,12 @@ config SND_SOC_MAX9867
 	depends on I2C
 
 config SND_SOC_MAX98925
-       tristate
+	tristate
+	depends on I2C
 
 config SND_SOC_MAX98926
 	tristate
+	depends on I2C
 
 config SND_SOC_MAX98927
 	tristate "Maxim Integrated MAX98927 Speaker Amplifier"
@@ -838,6 +856,7 @@ config SND_SOC_MAX98373
 
 config SND_SOC_MAX9850
 	tristate
+	depends on I2C
 
 config SND_SOC_MAX9860
 	tristate "Maxim MAX9860 Mono Audio Voice Codec"
@@ -1016,26 +1035,32 @@ config SND_SOC_RT298
 
 config SND_SOC_RT1011
 	tristate
+	depends on I2C
 
 config SND_SOC_RT1015
 	tristate
+	depends on I2C
 
 config SND_SOC_RT1305
 	tristate
+	depends on I2C
 
 config SND_SOC_RT1308
 	tristate
+	depends on I2C
 
 config SND_SOC_RT1308_SDW
 	tristate "Realtek RT1308 Codec - SDW"
-	depends on SOUNDWIRE
+	depends on I2C && SOUNDWIRE
 	select REGMAP_SOUNDWIRE
 
 config SND_SOC_RT5514
 	tristate
+	depends on I2C
 
 config SND_SOC_RT5514_SPI
 	tristate
+	depends on SPI_MASTER
 
 config SND_SOC_RT5514_SPI_BUILTIN
 	bool # force RT5514_SPI to be built-in to avoid link errors
@@ -1051,30 +1076,39 @@ config SND_SOC_RT5631
 
 config SND_SOC_RT5640
 	tristate
+	depends on I2C
 
 config SND_SOC_RT5645
 	tristate
+	depends on I2C
 
 config SND_SOC_RT5651
 	tristate
+	depends on I2C
 
 config SND_SOC_RT5659
 	tristate
+	depends on I2C
 
 config SND_SOC_RT5660
 	tristate
+	depends on I2C
 
 config SND_SOC_RT5663
 	tristate
+	depends on I2C
 
 config SND_SOC_RT5665
 	tristate
+	depends on I2C
 
 config SND_SOC_RT5668
 	tristate
+	depends on I2C
 
 config SND_SOC_RT5670
 	tristate
+	depends on I2C
 
 config SND_SOC_RT5677
 	tristate
@@ -1087,6 +1121,7 @@ config SND_SOC_RT5677_SPI
 
 config SND_SOC_RT5682
 	tristate
+	depends on I2C
 
 config SND_SOC_RT700
 	tristate
@@ -1154,6 +1189,7 @@ config SND_SOC_SSM2305
 
 config SND_SOC_SSM2518
 	tristate
+	depends on I2C
 
 config SND_SOC_SSM2602
 	tristate
@@ -1185,6 +1221,7 @@ config SND_SOC_STA350
 
 config SND_SOC_STA529
 	tristate
+	depends on I2C
 
 config SND_SOC_STAC9766
 	tristate
@@ -1282,6 +1319,7 @@ config SND_SOC_TLV320AIC3X
 
 config SND_SOC_TLV320DAC33
 	tristate
+	depends on I2C
 
 config SND_SOC_TS3A227E
 	tristate "TI Headset/Mic detect and keypress chip"
@@ -1348,18 +1386,23 @@ config SND_SOC_WL1273
 
 config SND_SOC_WM0010
 	tristate
+	depends on SPI_MASTER
 
 config SND_SOC_WM1250_EV1
 	tristate
+	depends on I2C
 
 config SND_SOC_WM2000
 	tristate
+	depends on I2C
 
 config SND_SOC_WM2200
 	tristate
+	depends on I2C
 
 config SND_SOC_WM5100
 	tristate
+	depends on I2C
 
 config SND_SOC_WM5102
 	tristate
@@ -1462,9 +1505,11 @@ config SND_SOC_WM8904
 
 config SND_SOC_WM8940
 	tristate
+	depends on I2C
 
 config SND_SOC_WM8955
 	tristate
+	depends on I2C
 
 config SND_SOC_WM8960
 	tristate "Wolfson Microelectronics WM8960 CODEC"
@@ -1472,6 +1517,7 @@ config SND_SOC_WM8960
 
 config SND_SOC_WM8961
 	tristate
+	depends on I2C
 
 config SND_SOC_WM8962
 	tristate "Wolfson Microelectronics WM8962 CODEC"
@@ -1479,6 +1525,7 @@ config SND_SOC_WM8962
 
 config SND_SOC_WM8971
 	tristate
+	depends on I2C
 
 config SND_SOC_WM8974
 	tristate "Wolfson Microelectronics WM8974 codec"
@@ -1490,6 +1537,7 @@ config SND_SOC_WM8978
 
 config SND_SOC_WM8983
 	tristate
+	depends on I2C
 
 config SND_SOC_WM8985
 	tristate "Wolfson Microelectronics WM8985 and WM8758 codec driver"
@@ -1500,12 +1548,15 @@ config SND_SOC_WM8988
 
 config SND_SOC_WM8990
 	tristate
+	depends on I2C
 
 config SND_SOC_WM8991
 	tristate
+	depends on I2C
 
 config SND_SOC_WM8993
 	tristate
+	depends on I2C
 
 config SND_SOC_WM8994
 	tristate
@@ -1515,6 +1566,7 @@ config SND_SOC_WM8995
 
 config SND_SOC_WM8996
 	tristate
+	depends on I2C
 
 config SND_SOC_WM8997
 	tristate
@@ -1528,6 +1580,7 @@ config SND_SOC_WM9081
 
 config SND_SOC_WM9090
 	tristate
+	depends on I2C
 
 config SND_SOC_WM9705
 	tristate
@@ -1561,6 +1614,7 @@ config SND_SOC_ZX_AUD96P22
 # Amp
 config SND_SOC_LM4857
 	tristate
+	depends on I2C
 
 config SND_SOC_MAX9759
 	tristate "Maxim MAX9759 speaker Amplifier"
@@ -1568,15 +1622,18 @@ config SND_SOC_MAX9759
 
 config SND_SOC_MAX9768
 	tristate
+	depends on I2C
 
 config SND_SOC_MAX9877
 	tristate
+	depends on I2C
 
 config SND_SOC_MC13783
 	tristate
 
 config SND_SOC_ML26124
 	tristate
+	depends on I2C
 
 config SND_SOC_MT6351
 	tristate "MediaTek MT6351 Codec"
@@ -1614,6 +1671,7 @@ config SND_SOC_NAU8824
 
 config SND_SOC_NAU8825
 	tristate
+	depends on I2C
 
 config SND_SOC_TPA6130A2
 	tristate "Texas Instruments TPA6130A2 headphone amplifier"
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
