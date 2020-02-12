Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A22A615B58C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 00:58:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C99C166C;
	Thu, 13 Feb 2020 00:58:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C99C166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581551939;
	bh=3t2lp1XCSKpB+UrueN7uWYNni4smOitL/kWvdZhRgVc=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GytewHxGe7ItgGE1rXO8AM+2HN8YVNUjFB3ltRNrKaQIpmsl2Gky8L5O560Ky/kQZ
	 8dSlwSZRSG9IgeIJBnDScGNuRDkVSFmQVCLpsMEkC0ug4H9PfaihD2ZtcCgUFEHpvt
	 TkKAV4SRetEA1SmMhP9/VdzJ1jxXVpvqieQgB9L8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86FE0F80125;
	Thu, 13 Feb 2020 00:57:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9240F8019B; Thu, 13 Feb 2020 00:57:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 91436F800E7
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91436F800E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2F4F328;
 Wed, 12 Feb 2020 15:57:07 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35CCE3F68E;
 Wed, 12 Feb 2020 15:57:07 -0800 (PST)
Date: Wed, 12 Feb 2020 23:57:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
In-Reply-To: <20200212145650.4602-4-geert@linux-m68k.org>
Message-Id: <applied-20200212145650.4602-4-geert@linux-m68k.org>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] Applied "ASoC: Fix SND_SOC_ALL_CODECS imply misc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: Fix SND_SOC_ALL_CODECS imply misc fallout

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

From d8dd3f92a6ba11f9046df48765e6f12ad70a3946 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2020 15:56:50 +0100
Subject: [PATCH] ASoC: Fix SND_SOC_ALL_CODECS imply misc fallout

Fixes for missing miscellaneous support:

    ERROR: "abx500_get_register_interruptible" [...] undefined!
    ERROR: "abx500_set_register_interruptible" [...] undefined!
    ERROR: "arizona_free_irq" [...] undefined!
    ERROR: "arizona_request_irq" [...] undefined!
    ERROR: "arizona_set_irq_wake" [...] undefined!
    ERROR: "mc13xxx_reg_rmw" [...] undefined!
    ERROR: "mc13xxx_reg_write" [...] undefined!
    ERROR: "snd_soc_free_ac97_component" [...] undefined!
    ERROR: "snd_soc_new_ac97_component" [...] undefined!

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: ea00d95200d02ece ("ASoC: Use imply for SND_SOC_ALL_CODECS")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/r/20200212145650.4602-4-geert@linux-m68k.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 3ef804d07dee..d957fd6980b1 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -319,6 +319,7 @@ config SND_SOC_WM_ADSP
 
 config SND_SOC_AB8500_CODEC
 	tristate
+	depends on ABX500_CORE
 
 config SND_SOC_AC97_CODEC
 	tristate "Build generic ASoC AC97 CODEC driver"
@@ -343,8 +344,9 @@ config SND_SOC_AD193X_I2C
 	select SND_SOC_AD193X
 
 config SND_SOC_AD1980
-	select REGMAP_AC97
 	tristate
+	depends on SND_SOC_AC97_BUS
+	select REGMAP_AC97
 
 config SND_SOC_AD73311
 	tristate
@@ -646,6 +648,7 @@ config SND_SOC_CS47L15
 
 config SND_SOC_CS47L24
 	tristate
+	depends on MFD_CS47L24
 
 config SND_SOC_CS47L35
 	tristate
@@ -1234,6 +1237,7 @@ config SND_SOC_STA529
 
 config SND_SOC_STAC9766
 	tristate
+	depends on SND_SOC_AC97_BUS
 
 config SND_SOC_STI_SAS
 	tristate "codec Audio support for STI SAS codec"
@@ -1415,9 +1419,11 @@ config SND_SOC_WM5100
 
 config SND_SOC_WM5102
 	tristate
+	depends on MFD_WM5102
 
 config SND_SOC_WM5110
 	tristate
+	depends on MFD_WM5110
 
 config SND_SOC_WM8350
 	tristate
@@ -1579,9 +1585,11 @@ config SND_SOC_WM8996
 
 config SND_SOC_WM8997
 	tristate
+	depends on MFD_WM8997
 
 config SND_SOC_WM8998
 	tristate
+	depends on MFD_WM8998
 
 config SND_SOC_WM9081
 	tristate
@@ -1639,6 +1647,7 @@ config SND_SOC_MAX9877
 
 config SND_SOC_MC13783
 	tristate
+	depends on MFD_MC13XXX
 
 config SND_SOC_ML26124
 	tristate
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
