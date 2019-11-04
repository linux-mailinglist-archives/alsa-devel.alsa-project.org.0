Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC58EE14B
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:33:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E62B176F;
	Mon,  4 Nov 2019 14:32:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E62B176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572874425;
	bh=HxJt/UYV/7w7E2uAB5R2AxGMdextTpMpz0Xm6MW/dr8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DLk8ZiltmzcIshY4gGjNuSfT2PaJN/ljbely3VKVtoeD1GX6lYbxdJq1i5AUS6Gd5
	 UbR1d32SkQ//kwuD2xzjpNV6SZkK2RMo7woTqn2VQCcNZ0J4M9EnQMIbf5F+/91SoW
	 hDElSpkGuYj14pl+HLidNpqpMHpp2Ulv542/eLB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC433F80676;
	Mon,  4 Nov 2019 14:27:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73689F804FD; Mon,  4 Nov 2019 14:27:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A010F804FE
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A010F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="DCxstJ3+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=rZtKPbgQNJHvuYduAyJxhIhp4tGHE974FhzpqKmOGsM=; b=DCxstJ3+rjqd
 Rm6UKXj7WWTOMo58cVKVsnMgrrHKIZM/Wr988+D1tAxopnSL1b6Kju+GR1d1EUE2nrQwuGSV0sgWJ
 jUyah98+G7wo6uy19aRIFSSe5gSUru1pUMfUNxkYx/rDpbSjG8oUWOuGsS/wptSkWAIjRo5AxHs/G
 2uSOM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRcO0-0002e3-TP; Mon, 04 Nov 2019 13:27:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 60D99274301E; Mon,  4 Nov 2019 13:27:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191101173045.27099-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191104132712.60D99274301E@ypsilon.sirena.org.uk>
Date: Mon,  4 Nov 2019 13:27:12 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: use def_tristate,
	avoid using select" to the asoc tree
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

   ASoC: SOF: Intel: use def_tristate, avoid using select

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

From b000135e5f272118e576e9720590e5979f0abe49 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 1 Nov 2019 12:30:40 -0500
Subject: [PATCH] ASoC: SOF: Intel: use def_tristate, avoid using select

So far we used select to use the relevant built-in/module options, but
this led to blurring layers between core and Intel Kconfigs.

Use def_tristate works just as well and removes Intel stuff from the code.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191101173045.27099-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/Kconfig       | 2 --
 sound/soc/sof/intel/Kconfig | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 6435eb531668..71a0fc075a63 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -14,7 +14,6 @@ config SND_SOC_SOF_PCI
 	depends on PCI
 	select SND_SOC_SOF
 	select SND_SOC_ACPI if ACPI
-	select SND_SOC_SOF_INTEL_PCI if SND_SOC_SOF_INTEL_TOPLEVEL
 	help
 	  This adds support for PCI enumeration. This option is
 	  required to enable Intel Skylake+ devices
@@ -26,7 +25,6 @@ config SND_SOC_SOF_ACPI
 	depends on ACPI || COMPILE_TEST
 	select SND_SOC_SOF
 	select SND_SOC_ACPI if ACPI
-	select SND_SOC_SOF_INTEL_ACPI if SND_SOC_SOF_INTEL_TOPLEVEL
 	select IOSF_MBI if X86 && PCI
 	help
 	  This adds support for ACPI enumeration. This option is required
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index cd9954bfec0b..04d4929cf91f 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -10,7 +10,7 @@ config SND_SOC_SOF_INTEL_TOPLEVEL
 if SND_SOC_SOF_INTEL_TOPLEVEL
 
 config SND_SOC_SOF_INTEL_ACPI
-	tristate
+	def_tristate SND_SOC_SOF_ACPI
 	select SND_SOC_SOF_BAYTRAIL  if SND_SOC_SOF_BAYTRAIL_SUPPORT
 	select SND_SOC_SOF_BROADWELL if SND_SOC_SOF_BROADWELL_SUPPORT
 	help
@@ -18,7 +18,7 @@ config SND_SOC_SOF_INTEL_ACPI
 	  'select' statements at a higher level
 
 config SND_SOC_SOF_INTEL_PCI
-	tristate
+	def_tristate SND_SOC_SOF_PCI
 	select SND_SOC_SOF_MERRIFIELD  if SND_SOC_SOF_MERRIFIELD_SUPPORT
 	select SND_SOC_SOF_APOLLOLAKE  if SND_SOC_SOF_APOLLOLAKE_SUPPORT
 	select SND_SOC_SOF_GEMINILAKE  if SND_SOC_SOF_GEMINILAKE_SUPPORT
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
