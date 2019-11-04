Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88961EE11C
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:29:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF3541768;
	Mon,  4 Nov 2019 14:28:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF3541768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572874142;
	bh=GzoULrkngYBLJNJ8+xIIPEmemRONYWzsyXfDAYP0abY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ioc0r0Al+qOGz1AaKlwuAAOvjqpjz++4sXmgh0C6U6QTNG44XZHg/ZmnvTrshk9Ku
	 pdLgWalWBHuYZWy6XaE+IZvksiaumeOKS9JkokilYseicqfdJTI1jqrdRIrHi2/Bq3
	 iuVu6YF8Y+fn/x+rDlaECyzt8Pr/lVElGTrlR15Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 842C9F80611;
	Mon,  4 Nov 2019 14:27:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C593FF805FF; Mon,  4 Nov 2019 14:27:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 424F8F800F3
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:27:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 424F8F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="IjNtkR3T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=w5hXHB3vaoSYVGIezHs1+1UIXlnj0xzuZ+tHBig1sdo=; b=IjNtkR3T8fKA
 GzyFF3JHmD+a7FI3g7GHY7YxpqN9GxjsnKEXFnRjFy2d5UgeyfnPa0GnLPk47pf/h10/6nx8Ou2M1
 HzjapPwGk2qelxugtNbhpRP3w7VWPLqWR8QIEIdtyahaSq3YavCtb2dBsCBZBuyidT+CgPAS9RB6v
 OqdEY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRcO0-0002ds-3g; Mon, 04 Nov 2019 13:27:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 531D0274301E; Mon,  4 Nov 2019 13:27:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191101173045.27099-12-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191104132711.531D0274301E@ypsilon.sirena.org.uk>
Date: Mon,  4 Nov 2019 13:27:11 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [alsa-devel] Applied "ASoC: Intel: boards: sof_rt5682: use
	dependency on SOF_HDA_LINK" to the asoc tree
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

   ASoC: Intel: boards: sof_rt5682: use dependency on SOF_HDA_LINK

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

From 8039105987fcd8dda39074df013cfdf0025dd297 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 1 Nov 2019 12:30:45 -0500
Subject: [PATCH] ASoC: Intel: boards: sof_rt5682: use dependency on
 SOF_HDA_LINK

The wrong dependency is used and the build can be broken

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191101173045.27099-12-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 746e087ff6d7..dfa2c365379f 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -411,11 +411,11 @@ config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
 
 endif ## SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
 
-if SND_SOC_SOF_HDA_COMMON || SND_SOC_SOF_BAYTRAIL
+if SND_SOC_SOF_HDA_LINK || SND_SOC_SOF_BAYTRAIL
 config SND_SOC_INTEL_SOF_RT5682_MACH
 	tristate "SOF with rt5682 codec in I2S Mode"
 	depends on I2C && ACPI
-	depends on (SND_SOC_SOF_HDA_COMMON && (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
+	depends on (SND_SOC_SOF_HDA_LINK && (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
 	select SND_SOC_RT5682
 	select SND_SOC_DMIC
@@ -425,7 +425,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	   with rt5682 codec.
 	   Say Y if you have such a device.
 	   If unsure select "N".
-endif ## SND_SOC_SOF_HDA_COMMON || SND_SOC_SOF_BAYTRAIL
+endif ## SND_SOC_SOF_HDA_LINK || SND_SOC_SOF_BAYTRAIL
 
 if (SND_SOC_SOF_COMETLAKE_LP && SND_SOC_SOF_HDA_LINK)
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
