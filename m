Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C461189A4
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:25:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 744331658;
	Tue, 10 Dec 2019 14:24:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 744331658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575984308;
	bh=RkMqUPOxDjyOhSjdK6RSTakUPvOOzijOeA3A91eP8pQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GrW6iFKpp9S1Q1o6BZ6xoTuT/qHs0zYi0X5TfQphweADPCH0YjrGZSLDq168vJ6Vx
	 ZixgpiDazOyO0JBwOz/xXkoyF2KfzqaIILL6qxL+s25FzF8ymlD66xTAAFPpATX7gp
	 kY4X0XN8YIeo+rRE5o0+U7kS5VRhhhLXoY4w1q9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F05B4F80254;
	Tue, 10 Dec 2019 14:22:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F17C0F80217; Tue, 10 Dec 2019 14:22:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6D84EF800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:22:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D84EF800F3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07AA0328;
 Tue, 10 Dec 2019 05:22:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BE993F52E;
 Tue, 10 Dec 2019 05:22:31 -0800 (PST)
Date: Tue, 10 Dec 2019 13:22:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191210004854.16845-8-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191210004854.16845-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: byt: fixup topology
	filename for BYT-CR" to the asoc tree
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

   ASoC: SOF: Intel: byt: fixup topology filename for BYT-CR

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

From 2aae447a4c100d2a7b7cae26b1df8b329e730d8b Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 9 Dec 2019 18:48:53 -0600
Subject: [PATCH] ASoC: SOF: Intel: byt: fixup topology filename for BYT-CR

On Baytrail-CR, SSP0 needs to be used instead of SSP2.  The
substitution is assumed to be done in the topology file.

When Baytrail-CR is detected, add -ssp0 suffix to the topology file
name so that the topology code picks up the correct file.

Tested on Asus T100TAF

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191210004854.16845-8-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/byt.c | 47 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 2f5db1a8c701..ec6ca863243c 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -18,6 +18,7 @@
 #include "../ops.h"
 #include "shim.h"
 #include "../sof-audio.h"
+#include "../../intel/common/soc-intel-quirks.h"
 
 /* DSP memories */
 #define IRAM_OFFSET		0x0C0000
@@ -383,11 +384,37 @@ static int byt_reset(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
+				   const char *sof_tplg_filename,
+				   const char *ssp_str)
+{
+	const char *tplg_filename = NULL;
+	char *filename;
+	char *split_ext;
+
+	filename = devm_kstrdup(sdev->dev, sof_tplg_filename, GFP_KERNEL);
+	if (!filename)
+		return NULL;
+
+	/* this assumes a .tplg extension */
+	split_ext = strsep(&filename, ".");
+	if (split_ext) {
+		tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
+					       "%s-%s.tplg",
+					       split_ext, ssp_str);
+		if (!tplg_filename)
+			return NULL;
+	}
+	return tplg_filename;
+}
+
 static void byt_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
 	struct snd_soc_acpi_mach *mach;
+	struct platform_device *pdev;
+	const char *tplg_filename;
 
 	mach = snd_soc_acpi_find_machine(desc->machines);
 	if (!mach) {
@@ -395,7 +422,25 @@ static void byt_machine_select(struct snd_sof_dev *sdev)
 		return;
 	}
 
-	sof_pdata->tplg_filename = mach->sof_tplg_filename;
+	pdev = to_platform_device(sdev->dev);
+	if (soc_intel_is_byt_cr(pdev)) {
+		dev_dbg(sdev->dev,
+			"BYT-CR detected, SSP0 used instead of SSP2\n");
+
+		tplg_filename = fixup_tplg_name(sdev,
+						mach->sof_tplg_filename,
+						"ssp0");
+	} else {
+		tplg_filename = mach->sof_tplg_filename;
+	}
+
+	if (!tplg_filename) {
+		dev_dbg(sdev->dev,
+			"error: no topology filename\n");
+		return;
+	}
+
+	sof_pdata->tplg_filename = tplg_filename;
 	mach->mach_params.acpi_ipc_irq_index = desc->irqindex_host_ipc;
 	sof_pdata->machine = mach;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
