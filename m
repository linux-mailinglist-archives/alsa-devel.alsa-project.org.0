Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8783FEE153
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:35:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 114F6177D;
	Mon,  4 Nov 2019 14:34:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 114F6177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572874510;
	bh=1DKsCnUuALURH9vC2eiOokLZ/7jn42iSUf3qqIUBfKw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rC+uk9REGmTDiclm4kENgTwJKpYtAkP45L9dBM0UQ+hKD0+X1//OgwQIyLf71Twxt
	 YUViY1/jwR1A0f5l9LNuLapxdNwyikqDnj1yRZoH3f9fz0zC41Hx07sJSa0UYbyZ2k
	 fjcI0X11vSL/MDQ96JRKHGturxX1sRPxWCSMTgHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DA17F806F0;
	Mon,  4 Nov 2019 14:27:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D8D4F8064C; Mon,  4 Nov 2019 14:27:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B4A5F805FB
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B4A5F805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RgzPoBIz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=sHCiVydzSZL8Z2DqsQLfaHSWNXdbmL0IfK9PqyBPMec=; b=RgzPoBIzDYWI
 LwQEfov8oF/5sYUBHEq13FWIL8GhCcvW+KiJlA7gXc7MN4e9ZOg8CKPj3kBH5l/6e0uVpdnl9zMwo
 C8BD/mLXERbJoOZ0PzK3BaOATsYxrikyjxCwrlIU+de9TF2IJM8tyfSjmCCr1mts3LWeTYBAA4/Fw
 sLPgc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRcO2-0002eY-0i; Mon, 04 Nov 2019 13:27:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 762682743193; Mon,  4 Nov 2019 13:27:13 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191101173045.27099-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191104132713.762682743193@ypsilon.sirena.org.uk>
Date: Mon,  4 Nov 2019 13:27:13 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: Baytrail: clarify mutual
	exclusion with Atom/SST driver" to the asoc tree
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

   ASoC: SOF: Intel: Baytrail: clarify mutual exclusion with Atom/SST driver

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

From df7257e544faf838c3e7ad6b4e89ffe59e87f5e1 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 1 Nov 2019 12:30:35 -0500
Subject: [PATCH] ASoC: SOF: Intel: Baytrail: clarify mutual exclusion with
 Atom/SST driver

Some distros select all options blindly, which leads to confusion and
bug reports. Since SOF does not support Baytrail-CR for now, and
UCM/topology files are still being propagated to downstream distros,
make SOF on Baytrail an opt-in option that first require distros to
opt-out of existing defaults.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191101173045.27099-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/Kconfig     |  3 +++
 sound/soc/sof/intel/Kconfig | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 01c99750212a..ba5b90e66e2f 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -101,6 +101,9 @@ config SND_SST_ATOM_HIFI2_PLATFORM_ACPI
 	  If you have a Intel Baytrail or Cherrytrail platform with an I2S
 	  codec, then enable this option by saying Y or m. This is a
 	  recommended option
+	  This option is mutually exclusive with the SOF support on
+	  Baytrail/Cherrytrail. If you want to enable SOF on
+	  Baytrail/Cherrytrail, you need to deselect this option first.
 
 config SND_SOC_INTEL_SKYLAKE
 	tristate "All Skylake/SST Platforms"
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index d52298946c00..973c137a6c5a 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -62,10 +62,18 @@ if SND_SOC_SOF_INTEL_ACPI
 
 config SND_SOC_SOF_BAYTRAIL_SUPPORT
 	bool "SOF support for Baytrail, Braswell and Cherrytrail"
+	depends on SND_SST_ATOM_HIFI2_PLATFORM_ACPI=n
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
 	  using the Baytrail, Braswell or Cherrytrail processors.
-	  Say Y if you have such a device.
+	  This option is mutually exclusive with the Atom/SST and Baytrail
+	  legacy drivers. If you want to enable SOF on Baytrail/Cherrytrail,
+	  you need to deselect those options first.
+	  SOF does not support Baytrail-CR for now, so this option is not
+	  recommended for distros. At some point all legacy drivers will be
+	  deprecated but not before all userspace firmware/topology/UCM files
+	  are made available to downstream distros.
+	  Say Y if you want to enable SOF on Baytrail/Cherrytrail
 	  If unsure select "N".
 
 config SND_SOC_SOF_BAYTRAIL
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
