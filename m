Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA289117515
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:00:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A4671654;
	Mon,  9 Dec 2019 19:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A4671654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918029;
	bh=i3ipmh75mf6G/959hc4ho9EUBvWeWTU9DmnPn+5EQIw=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=aV2HqhfKMcUJz9u6j3gR/7UUl9wdwkGbkRCVE3pQiScFKb2nX6qklw0DiGRZNFNCn
	 D3ZziO2nEeob0Qe9nHMHJEdoRFluaXnMmXJ6qQn39gVQrRjFsyT0AtXEy2SwQeOf1F
	 +mpJA6Dz9Gru5Z1x1PDMvHFKXTrGUH/c8yLiB/QY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C39D0F8023F;
	Mon,  9 Dec 2019 19:58:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88926F8023E; Mon,  9 Dec 2019 19:58:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 06F8CF800C4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F8CF800C4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1B55328;
 Mon,  9 Dec 2019 10:58:35 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6272C3F6CF;
 Mon,  9 Dec 2019 10:58:35 -0800 (PST)
Date: Mon, 09 Dec 2019 18:58:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20191204211556.12671-14-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191204211556.12671-14-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: nocodec: Amend arguments for
	sof_nocodec_setup()" to the asoc tree
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

   ASoC: SOF: nocodec: Amend arguments for sof_nocodec_setup()

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

From d612b455f120d05a42c95ccd7469fa13efb8d307 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 4 Dec 2019 15:15:56 -0600
Subject: [PATCH] ASoC: SOF: nocodec: Amend arguments for sof_nocodec_setup()

Set the drv_name and tplg_filename for nocodec
machine driver in sof_machine_check().
This means the sof_nocodec_setup() does not
need the mach, plat_data or desc arguments any longer.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191204211556.12671-14-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof.h       | 3 ---
 sound/soc/sof/nocodec.c   | 9 ---------
 sound/soc/sof/sof-audio.c | 5 ++++-
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 96625355aa94..6ea74f1a9ec2 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -97,8 +97,5 @@ struct sof_dev_desc {
 };
 
 int sof_nocodec_setup(struct device *dev,
-		      struct snd_sof_pdata *sof_pdata,
-		      struct snd_soc_acpi_mach *mach,
-		      const struct sof_dev_desc *desc,
 		      const struct snd_sof_dsp_ops *ops);
 #endif
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 56d887545da3..2233146386cc 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -63,20 +63,11 @@ static int sof_nocodec_bes_setup(struct device *dev,
 }
 
 int sof_nocodec_setup(struct device *dev,
-		      struct snd_sof_pdata *sof_pdata,
-		      struct snd_soc_acpi_mach *mach,
-		      const struct sof_dev_desc *desc,
 		      const struct snd_sof_dsp_ops *ops)
 {
 	struct snd_soc_dai_link *links;
 	int ret;
 
-	if (!mach)
-		return -EINVAL;
-
-	mach->drv_name = "sof-nocodec";
-	sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
-
 	/* create dummy BE dai_links */
 	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
 			     ops->num_drv, GFP_KERNEL);
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 9c3851bfe788..0d8f65b9ae25 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -396,7 +396,10 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 	if (!mach)
 		return -ENOMEM;
 
-	ret = sof_nocodec_setup(sdev->dev, sof_pdata, mach, desc, desc->ops);
+	mach->drv_name = "sof-nocodec";
+	sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
+
+	ret = sof_nocodec_setup(sdev->dev, desc->ops);
 	if (ret < 0)
 		return ret;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
