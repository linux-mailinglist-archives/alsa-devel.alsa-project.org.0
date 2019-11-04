Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C608EE147
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:33:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B60C41774;
	Mon,  4 Nov 2019 14:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B60C41774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572874389;
	bh=WYa2htW3fO9FaO+KiDO9QpiCs++93wZO0QkuZ1BaNT8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=U4ACu3nZ4GnYaZee40GmcJUs7OrKamokEcW61m83+WwO8if62qkG/h575JN+w7dRq
	 cbC2WGxNVB1Cve/KtXVeKFnB/N4irgD60PvUSK+jytqrcumzAEwlPvmX8xQASdE/4F
	 KJ1DMy7uGO9M832tlCA1EMABeai2G8v7TqirG2T0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB535F8065E;
	Mon,  4 Nov 2019 14:27:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBD78F80637; Mon,  4 Nov 2019 14:27:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ED86F8048D
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ED86F8048D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="oN6PWw+C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qqEnd6SRaJJ4olmq5sQpdBFGZk+mmIwHRFusovai2fw=; b=oN6PWw+CKc9V
 9hBw/bvO4dvZbmQ3IqzHIYbNilT0PcPRgFumh48kN9CPwvH6EzI5LlfN+o6suBk5/EEsLGBmwbqx1
 FQSZR+2o4/C7qPmlV/8/YNxB11IpOn6QECv4YOy75R3zKHYgLcHns6rzb0DUPgjf2rIw3mc8/jHk3
 F6anM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRcO1-0002eH-C6; Mon, 04 Nov 2019 13:27:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id CD1472743044; Mon,  4 Nov 2019 13:27:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191101173045.27099-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191104132712.CD1472743044@ypsilon.sirena.org.uk>
Date: Mon,  4 Nov 2019 13:27:12 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [alsa-devel] Applied "ASoC: SOF: Kconfig: add EXPERT dependency for
	developer options, clarify help" to the asoc tree
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

   ASoC: SOF: Kconfig: add EXPERT dependency for developer options, clarify help

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

From 70ae4eb540af32ee6a6260143ccae6054ebd433f Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 1 Nov 2019 12:30:38 -0500
Subject: [PATCH] ASoC: SOF: Kconfig: add EXPERT dependency for developer
 options, clarify help

Some distros select all possible options, despite existing warnings to
be careful. This leads to e.g. user reports that the HDaudio codec and
DMIC are not handled by SOF.

Add an explicit menu item to unlock developer options, and make them
dependent on CONFIG_EXPERT. Hopefully with this double-lock these
options will only be selected by developers.

GitHub issue: https://github.com/thesofproject/sof/issues/1885
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191101173045.27099-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/Kconfig | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 56a3ab66b46b..6435eb531668 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -14,7 +14,6 @@ config SND_SOC_SOF_PCI
 	depends on PCI
 	select SND_SOC_SOF
 	select SND_SOC_ACPI if ACPI
-	select SND_SOC_SOF_OPTIONS
 	select SND_SOC_SOF_INTEL_PCI if SND_SOC_SOF_INTEL_TOPLEVEL
 	help
 	  This adds support for PCI enumeration. This option is
@@ -27,7 +26,6 @@ config SND_SOC_SOF_ACPI
 	depends on ACPI || COMPILE_TEST
 	select SND_SOC_SOF
 	select SND_SOC_ACPI if ACPI
-	select SND_SOC_SOF_OPTIONS
 	select SND_SOC_SOF_INTEL_ACPI if SND_SOC_SOF_INTEL_TOPLEVEL
 	select IOSF_MBI if X86 && PCI
 	help
@@ -40,19 +38,23 @@ config SND_SOC_SOF_OF
 	tristate "SOF OF enumeration support"
 	depends on OF || COMPILE_TEST
 	select SND_SOC_SOF
-	select SND_SOC_SOF_OPTIONS
 	help
 	  This adds support for Device Tree enumeration. This option is
 	  required to enable i.MX8 devices.
 	  Say Y if you need this option. If unsure select "N".
 
-config SND_SOC_SOF_OPTIONS
-	tristate
+config SND_SOC_SOF_DEVELOPER_SUPPORT
+	bool "SOF developer options support"
+	depends on EXPERT
 	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  This option unlock SOF developer options for debug/performance/
+	  code hardening.
+	  Distributions should not select this option, only SOF development
+	  teams should select it.
+	  Say Y if you are involved in SOF development and need this option
+	  If not, select N
 
-if SND_SOC_SOF_OPTIONS
+if SND_SOC_SOF_DEVELOPER_SUPPORT
 
 config SND_SOC_SOF_NOCODEC
 	tristate
@@ -64,6 +66,11 @@ config SND_SOC_SOF_NOCODEC_SUPPORT
 	  option if no known codec is detected. This is typically only
 	  enabled for developers or devices where the sound card is
 	  controlled externally
+	  This option is mutually exclusive with the Intel HDaudio support,
+	  selecting it may have negative impacts and prevent e.g. microphone
+	  functionality from being enabled on Intel CoffeeLake and later
+	  platforms.
+	  Distributions should not select this option!
 	  Say Y if you need this nocodec fallback option
 	  If unsure select "N".
 
@@ -168,7 +175,7 @@ config SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT
 
 endif ## SND_SOC_SOF_DEBUG
 
-endif ## SND_SOC_SOF_OPTIONS
+endif ## SND_SOC_SOF_DEVELOPER_SUPPORT
 
 config SND_SOC_SOF
 	tristate
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
