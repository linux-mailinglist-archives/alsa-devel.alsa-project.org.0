Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6881346FF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 17:02:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4E1A173B;
	Wed,  8 Jan 2020 17:01:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4E1A173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578499320;
	bh=4Z1whXPig8TQkSXidx6qi6X/TqDrMM+gteaax7Amt1A=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ajBgNuY93RU4ASIphfierMfzDjnSJOJifjWf/KB9AeKKKDHFy10AOY6y2Tvo+msZE
	 e4oVwLxC6ZRLUeng0+G/gqf95GCQDYagcJBzEqNcjqX8cIl9DYpOcX357geg0e4veq
	 HwDL0WuXMOnrvMORwTW9HGz1i/LeEE9EFbN1XbuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54E08F8024A;
	Wed,  8 Jan 2020 16:58:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E909F80214; Wed,  8 Jan 2020 16:58:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8566AF80116
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 16:58:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8566AF80116
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA435DA7;
 Wed,  8 Jan 2020 07:58:42 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 445923F534;
 Wed,  8 Jan 2020 07:58:42 -0800 (PST)
Date: Wed, 08 Jan 2020 15:58:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200107160840.1524-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200107160840.1524-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: pci: change the default firmware
	path when the community key is used" to the asoc tree
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

   ASoC: SOF: pci: change the default firmware path when the community key is used

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 46207ca24545540231ac8b4cf856baf1ca19e2fa Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 7 Jan 2020 10:08:39 -0600
Subject: [PATCH] ASoC: SOF: pci: change the default firmware path when the
 community key is used

Since ApolloLake, Intel platforms require signed firmware. On all
Windows platforms the default is to require the Intel production key
be used. But some platforms allow for a community key to be used,
which allows developers to compile/build their own firmware.

In the linux-firmware tree, the default intel/sof path is used for
firmwares signed for the production key, and files signed with the
community key are located in intel/sof/community.

Since we don't have an API to query which key is used on what
platforms, we have to rely on DMI-based quirks.

Developers can bypass this mechanism by setting a kernel 'fw_path'
module parameter. Additional dynamic debug traces are provided to help
debug cases where the wrong file might be used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200107160840.1524-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-pci-dev.c | 44 +++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index da7b17e5177b..9993be36d105 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -9,6 +9,7 @@
 //
 
 #include <linux/firmware.h>
+#include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
@@ -36,6 +37,23 @@ MODULE_PARM_DESC(sof_pci_debug, "SOF PCI debug options (0x0 all off)");
 
 #define SOF_PCI_DISABLE_PM_RUNTIME BIT(0)
 
+static const struct dmi_system_id community_key_platforms[] = {
+	{
+		.ident = "Up Squared",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_MATCH(DMI_BOARD_NAME, "UP-APL01"),
+		}
+	},
+	{
+		.ident = "Google Chromebooks",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+		}
+	},
+	{},
+};
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 static const struct sof_dev_desc bxt_desc = {
 	.machines		= snd_soc_acpi_intel_bxt_machines,
@@ -290,12 +308,34 @@ static int sof_pci_probe(struct pci_dev *pci,
 	sof_pdata->dev = dev;
 	sof_pdata->fw_filename = desc->default_fw_filename;
 
+	/*
+	 * for platforms using the SOF community key, change the
+	 * default path automatically to pick the right files from the
+	 * linux-firmware tree. This can be overridden with the
+	 * fw_path kernel parameter, e.g. for developers.
+	 */
+
 	/* alternate fw and tplg filenames ? */
-	if (fw_path)
+	if (fw_path) {
 		sof_pdata->fw_filename_prefix = fw_path;
-	else
+
+		dev_dbg(dev,
+			"Module parameter used, changed fw path to %s\n",
+			sof_pdata->fw_filename_prefix);
+
+	} else if (dmi_check_system(community_key_platforms)) {
+		sof_pdata->fw_filename_prefix =
+			devm_kasprintf(dev, GFP_KERNEL, "%s/%s",
+				       sof_pdata->desc->default_fw_path,
+				       "community");
+
+		dev_dbg(dev,
+			"Platform uses community key, changed fw path to %s\n",
+			sof_pdata->fw_filename_prefix);
+	} else {
 		sof_pdata->fw_filename_prefix =
 			sof_pdata->desc->default_fw_path;
+	}
 
 	if (tplg_path)
 		sof_pdata->tplg_filename_prefix = tplg_path;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
