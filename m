Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3216115B58D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 00:59:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D19A6167E;
	Thu, 13 Feb 2020 00:58:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D19A6167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581551982;
	bh=MVi/Cd8hbgcEWcAZ5O1QxZAVAHQiLU+Glt5EpB/B4vs=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MVP/RVhaQPWIR1XHsXYpeW0prhs7zX+zDaJMDMwwtbyz52kHrJjpUOnruQq3LsXZH
	 ZQEZTP3LE3a4ttY2J/6+XGRl7jPmB8pEW8Z1zDgrx+zCJ60kebMqLL9SVK9gdseMbS
	 BeNtQZVkmMIzKUwe8PWpQmVL+4mW+115NFmR/lpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A83ABF80257;
	Thu, 13 Feb 2020 00:57:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C71FF80234; Thu, 13 Feb 2020 00:57:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5A162F80125
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:57:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A162F80125
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1289DFEC;
 Wed, 12 Feb 2020 15:57:10 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B56E3F68E;
 Wed, 12 Feb 2020 15:57:09 -0800 (PST)
Date: Wed, 12 Feb 2020 23:57:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
In-Reply-To: <20200212145650.4602-3-geert@linux-m68k.org>
Message-Id: <applied-20200212145650.4602-3-geert@linux-m68k.org>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] Applied "ASoC: Fix SND_SOC_ALL_CODECS imply I2C
	fallout" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============8247601739191102450=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============8247601739191102450==
Content-Type: text/plain

The patch

   ASoC: Fix SND_SOC_ALL_CODECS imply I2C fallout

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From 1d0158f547e0dbefa9e18930e93f270ab0309707 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2020 15:56:49 +0100
Subject: [PATCH] ASoC: Fix SND_SOC_ALL_CODECS imply I2C fallout
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes for CONFIG_I2C=n:

    WARNING: unmet direct dependencies detected for REGMAP_I2C
      Depends on [n]: I2C [=n]
      Selected by [m]:
      - SND_SOC_ADAU1781_I2C [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m]
      - SND_SOC_ADAU1977_I2C [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m]
      - SND_SOC_RT5677 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m]

    sound/soc/codecs/...: error: type defaults to ‘int’ in declaration of ‘module_i2c_driver’ [-Werror=implicit-int]

    drivers/base/regmap/regmap-i2c.c: In function ‘regmap_smbus_byte_reg_read’:
    drivers/base/regmap/regmap-i2c.c:25:8: error: implicit declaration of function ‘i2c_smbus_read_byte_data’; did you mean ‘i2c_set_adapdata’? [-Werror=implicit-function-declaration]

Fixes: ea00d95200d02ece ("ASoC: Use imply for SND_SOC_ALL_CODECS")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/r/20200212145650.4602-3-geert@linux-m68k.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index c2fb985de8c4..3ef804d07dee 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -339,6 +339,7 @@ config SND_SOC_AD193X_SPI
 
 config SND_SOC_AD193X_I2C
 	tristate
+	depends on I2C
 	select SND_SOC_AD193X
 
 config SND_SOC_AD1980
@@ -353,6 +354,7 @@ config SND_SOC_ADAU_UTILS
 
 config SND_SOC_ADAU1373
 	tristate
+	depends on I2C
 	select SND_SOC_ADAU_UTILS
 
 config SND_SOC_ADAU1701
@@ -387,6 +389,7 @@ config SND_SOC_ADAU1781
 
 config SND_SOC_ADAU1781_I2C
 	tristate
+	depends on I2C
 	select SND_SOC_ADAU1781
 	select REGMAP_I2C
 
@@ -407,6 +410,7 @@ config SND_SOC_ADAU1977_SPI
 
 config SND_SOC_ADAU1977_I2C
 	tristate
+	depends on I2C
 	select SND_SOC_ADAU1977
 	select REGMAP_I2C
 
@@ -450,6 +454,7 @@ config SND_SOC_ADAV801
 
 config SND_SOC_ADAV803
 	tristate
+	depends on I2C
 	select SND_SOC_ADAV80X
 
 config SND_SOC_ADS117X
@@ -471,6 +476,7 @@ config SND_SOC_AK4458
 
 config SND_SOC_AK4535
 	tristate
+	depends on I2C
 
 config SND_SOC_AK4554
 	tristate "AKM AK4554 CODEC"
@@ -481,6 +487,7 @@ config SND_SOC_AK4613
 
 config SND_SOC_AK4641
 	tristate
+	depends on I2C
 
 config SND_SOC_AK4642
 	tristate "AKM AK4642 CODEC"
@@ -488,6 +495,7 @@ config SND_SOC_AK4642
 
 config SND_SOC_AK4671
 	tristate
+	depends on I2C
 
 config SND_SOC_AK5386
 	tristate "AKM AK5638 CODEC"
@@ -1112,6 +1120,7 @@ config SND_SOC_RT5670
 
 config SND_SOC_RT5677
 	tristate
+	depends on I2C
 	select REGMAP_I2C
 	select REGMAP_IRQ
 
-- 
2.20.1


--===============8247601739191102450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8247601739191102450==--
