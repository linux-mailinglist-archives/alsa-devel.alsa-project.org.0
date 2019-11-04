Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23EEE122
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:30:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B867B1771;
	Mon,  4 Nov 2019 14:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B867B1771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572874232;
	bh=YyyKwfyP7kqU98rFYmQBsWrx1nAn+Kmd0utb65A/00w=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GfMc6B0u31WTP+BoA9y+HhZ1dz1Jav8QQiLjVE+2g8x3kwzNayyqOPU2wDh83IVpk
	 LQfsASSGQD0zvRiL0fk1pgC5nygRExksZbmh/lX0Gi7gFCYopPqqugbAg4BJzGFnU8
	 NzTRTQtGsbrIFPahG4ap5r3mhFUgz2nbOa3uJ7yY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA140F80634;
	Mon,  4 Nov 2019 14:27:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34A5BF80637; Mon,  4 Nov 2019 14:27:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66F26F8015B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:27:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66F26F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wyr4pCUX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=LvMvHXynSMjUbhz6Nw4O5yAlpRJ7k9ioKpcx/rSow+E=; b=wyr4pCUX5Ldb
 FPOtGXqnVWnnq0HCZi8uFOXB1sqhatMAmfC6Vrf0WUUSo/PKcMy9kYnlfDPYKEOls1sB6iZFmkwwE
 NDRZl/oEHOlXPHi+rhHYL4kxB1EBqIwy9pzCq1E7ENjlLaTk3mMA1LYleYVkCte2jyaER6pIEcjW/
 T80o8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRcO0-0002du-8y; Mon, 04 Nov 2019 13:27:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B7C912743044; Mon,  4 Nov 2019 13:27:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191101173045.27099-10-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191104132711.B7C912743044@ypsilon.sirena.org.uk>
Date: Mon,  4 Nov 2019 13:27:11 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [alsa-devel] Applied "ASoC: Intel: boards: fix configs for
	bxt-da7219-max98057a" to the asoc tree
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

   ASoC: Intel: boards: fix configs for bxt-da7219-max98057a

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From c4a09f9a523e674ef9a046e05d99c90f2c9513b1 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 1 Nov 2019 12:30:43 -0500
Subject: [PATCH] ASoC: Intel: boards: fix configs for bxt-da7219-max98057a

The same driver is reused for 3 different configurations, but the
driver will only be build if ApolloLake is selected.

Fix and make sure each device can work without dependencies on others
(useful for minimal configurations).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191101173045.27099-10-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig  | 24 ++++++++++++++++++++++--
 sound/soc/intel/boards/Makefile |  2 +-
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index c63070c3a250..0b3101dc8286 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -263,13 +263,17 @@ config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
 
+config SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
+	tristate
+	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
+
 if SND_SOC_INTEL_APL
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 	tristate "Broxton with DA7219 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
+	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	help
 	   This adds support for ASoC machine driver for Broxton-P platforms
 	   with DA7219 + MAX98357A I2S audio codec.
@@ -365,6 +369,17 @@ endif ## SND_SOC_INTEL_KBL
 
 if SND_SOC_INTEL_GLK || (SND_SOC_SOF_GEMINILAKE  && SND_SOC_SOF_HDA_LINK)
 
+config SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH
+	tristate "GLK with DA7219 and MAX98357A in I2S Mode"
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
+	help
+	   This adds support for ASoC machine driver for Geminilake platforms
+	   with DA7219 + MAX98357A I2S audio codec.
+	   Say Y or m if you have such a device. This is a recommended option.
+	   If unsure select "N".
+
 config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 	tristate "GLK with RT5682 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
@@ -418,7 +433,12 @@ config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
 	tristate "CML_LP with DA7219 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
+	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
+	help
+	   This adds support for ASoC machine driver for Cometlake platforms
+	   with DA7219 + MAX98357A I2S audio codec.
+	   Say Y or m if you have such a device. This is a recommended option.
+	   If unsure select "N".
 
 config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
         tristate "CML with RT1011 and RT5682 in I2S Mode"
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 9ae6544c6f3b..ba1aa89db09d 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -33,7 +33,7 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-sst-haswell.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_RT5640_MACH) += snd-soc-sst-byt-rt5640-mach.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_MAX98090_MACH) += snd-soc-sst-byt-max98090-mach.o
-obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH) += snd-soc-sst-bxt-da7219_max98357a.o
+obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON) += snd-soc-sst-bxt-da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_RT298_MACH) += snd-soc-sst-bxt-rt298.o
 obj-$(CONFIG_SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH) += snd-soc-sst-glk-rt5682_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_BROADWELL_MACH) += snd-soc-sst-broadwell.o
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
