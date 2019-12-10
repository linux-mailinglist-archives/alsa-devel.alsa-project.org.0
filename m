Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E636C11912F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 20:56:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 728A785D;
	Tue, 10 Dec 2019 20:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 728A785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576007769;
	bh=pwhyNtpTHu+Dy1wwxTW919f4efftQQNbzqcp+SG4chk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hj4LOANV47iuuydPRFn2vHndYCVL/AuGKnjrL1METBrxDo+uoPBvkuGuq4J+NkDcJ
	 ZQniJm/XtMHcALbBPbgQblyYfUfcQOA66xRBW9jvL1HtuxgBs4z2hRCo/+6diYJ41b
	 npiOiS97j8Lwtmf8s6uLAWB0UZ1pWeO/7MbpeybY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDB4BF8020C;
	Tue, 10 Dec 2019 20:54:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29924F8020C; Tue, 10 Dec 2019 20:54:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C6F9F800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 20:54:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C6F9F800F3
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MBmDy-1iSdZE09bI-00CCMA; Tue, 10 Dec 2019 20:53:44 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 20:52:26 +0100
Message-Id: <20191210195333.648018-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:FRkHOOKgb97GU78DRa4WO6ybtXkwJBdydEWXHFH0XK6ebufL9xV
 1EnlNmOIxy2m4DJZpwOSZDYe6VdSkLHIYTkUdRCdxb96bn4+i9aM5HDbv8Y7m7upSqX0g+4
 aZ7pxvErgtXqj88QUP5vZlUGYWZsThHweb+iyAH57kzxC10soq23IhgctvcW1mAt5mudX0M
 ofu4B2dzMSXFkyVJqr7fA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aRxDfmwkuqQ=:Q5kIO/JyMKhASOEVpBGr79
 mltKx8dNXZy5JN2a10gY5qm3kf02KQ8QYkK/4v3cAdAbmccyzL4DXyE+PKfOKw6YenitwI12c
 8YbdnsOQ8CJRf8p4rEWHGUvRObVYsyum+gwXLcv7ROZGJT3/G/YCUikha20/xZ/QOXlfAzyia
 7c+O9S7Q5eND46EM3BY8MWxHHnw6vvaouoJcBvalhn6utMA4Xdyu6sQ8klBKG/OgtzUIK/5f5
 dgV1/mPcAfVkiDLHIOYY33Pv7BbxGikgB3SDFPgfExtJQj9YatmVAE8kJpv7eYxwqZEW9xR2U
 wUG2rEBAkKiD8Wfob5x3p4BZ7vIWifgoOi5pHHimENGsOT+B3UybUI5RUND6zaquO3rBi8evu
 rYtEPAxqZ5pKX8o/t6h14iPnoO/9+X619xrMLQmZMHVYg1lXfFU/da7NavX81GHaMC7DXR8lW
 yVoDxUCfei6PWs8RaBl7o7ewBIyGnUE4uocUG3rbI/SlP78kYT6tpS4PtTKHZQMiv7NbGvII1
 8/SzVaX+qN+X55J8eYxyg/eCefYiWim8pCMOjrJPOTeNSnV6RCH3iEeHZS48oGJvCIvexLTjY
 tVeasw/P6N94yIWtOgt5S1yqSEgIg0TJvze3ZruHI+ks3QwRINk3gVegkpgUvEBcd4IxFI2yl
 QDOUbechDBC9C1VkFW5voYcKksms6yCQrIFWzOrWWLxhO5Ahg3fDkwe272NzdQXH0pRQrq9nC
 OehoDnS0YYCsMz/8ALLgfgBpT9+mK0KV3838L/HVcBGhGfNBCXig+a9eqoEyQQ6SqIU83x0IQ
 C6Kx99oKCbEHzZkvBlwpEoLaMYnbY5DOCCrIY1KjWrOLqhhrYUQFyfH0Lmn7+kt/a+MbIJtvw
 QFiozHF88wZ3H1Nwewdw==
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-tegra@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, Ben Zhang <benzh@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 KaiChieh Chuang <kaichieh.chuang@mediatek.com>
Subject: [alsa-devel] [PATCH] ASoC: rt5677: add SPI_MASTER dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When CONFIG_SPI is disabled, the newly added code for the DSP
firmware loading fails to link:

ERROR: "rt5677_spi_hotword_detected" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!
ERROR: "rt5677_spi_write" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!

Add a dependency to prevent this configuration.

Note: the does not work with the DT probing, as there is no binding
for the SPI half of the driver, but nothing seems to be using that
with the mainline kernel anyway.

Fixes: 461c623270e4 ("ASoC: rt5677: Load firmware via SPI using delayed work")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/Kconfig       | 1 +
 sound/soc/intel/boards/Kconfig | 1 +
 sound/soc/mediatek/Kconfig     | 2 +-
 sound/soc/tegra/Kconfig        | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 71b7286d14f2..8e9c461a84f8 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1047,6 +1047,7 @@ config SND_SOC_RT5670
 
 config SND_SOC_RT5677
 	tristate
+	depends on SPI_MASTER
 	select REGMAP_I2C
 	select REGMAP_IRQ
 
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index ef20316e83d1..da7f9111f3d3 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -34,6 +34,7 @@ if SND_SOC_INTEL_HASWELL || SND_SOC_SOF_BROADWELL
 config SND_SOC_INTEL_BDW_RT5677_MACH
 	tristate "Broadwell with RT5677 codec"
 	depends on I2C
+	depends on SPI_MASTER
 	depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
 	depends on GPIOLIB || COMPILE_TEST
 	depends on X86_INTEL_LPSS || COMPILE_TEST
diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index a656d2014127..4699787c93ed 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -97,7 +97,7 @@ config SND_SOC_MT8173_RT5650_RT5514
 
 config SND_SOC_MT8173_RT5650_RT5676
 	tristate "ASoC Audio driver for MT8173 with RT5650 RT5676 codecs"
-	depends on SND_SOC_MT8173 && I2C
+	depends on SND_SOC_MT8173 && I2C && SPI_MASTER
 	select SND_SOC_RT5645
 	select SND_SOC_RT5677
 	select SND_SOC_HDMI_CODEC
diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index addadc827b91..df36e84c0116 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -122,7 +122,7 @@ config SND_SOC_TEGRA_MAX98090
 
 config SND_SOC_TEGRA_RT5677
 	tristate "SoC Audio support for Tegra boards using a RT5677 codec"
-	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	depends on SND_SOC_TEGRA && I2C && GPIOLIB && SPI_MASTER
 	select SND_SOC_RT5677
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
