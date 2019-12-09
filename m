Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4530C117521
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:01:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D03C51655;
	Mon,  9 Dec 2019 20:00:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D03C51655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918074;
	bh=VNPHqC0NpKNnjSwPDqmbq2be0OABlTm4oRQI6+TW7Ic=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hwD4YmF3uu6U4uclz+tXtAwRLz1xy7Fid7eCYLVcfZFPmFiz0dhjFtIQXqSqeT2Y+
	 /yF/527wXcCdqD3VST4d/OTj9N67+C+E3ow76+pjye5peNquVPgqS5cIbV2aQ9Ww33
	 Eexb+uB9Y9htw2egkDz2LBFrEEphqSGZBxLM+H2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 182BEF80240;
	Mon,  9 Dec 2019 19:58:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF7A2F800C4; Mon,  9 Dec 2019 19:58:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id BFA32F8011E
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:58:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFA32F8011E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5838B1045;
 Mon,  9 Dec 2019 10:58:38 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD5653F6CF;
 Mon,  9 Dec 2019 10:58:37 -0800 (PST)
Date: Mon, 09 Dec 2019 18:58:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20191204211556.12671-13-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191204211556.12671-13-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Remove unused drv_name in
	sof_pdata" to the asoc tree
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

   ASoC: SOF: Remove unused drv_name in sof_pdata

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

From 5ad1cece81db9b389526499ae2e784013c85f136 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 4 Dec 2019 15:15:55 -0600
Subject: [PATCH] ASoC: SOF: Remove unused drv_name in sof_pdata

This field is only set but never used. Let's remove
it to make code cleaner.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191204211556.12671-13-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof.h     | 1 -
 sound/soc/sof/nocodec.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 98a757d3a67d..96625355aa94 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -22,7 +22,6 @@ struct snd_sof_dsp_ops;
  */
 struct snd_sof_pdata {
 	const struct firmware *fw;
-	const char *drv_name;
 	const char *name;
 	const char *platform;
 
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 0a2167f19f25..56d887545da3 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -74,8 +74,6 @@ int sof_nocodec_setup(struct device *dev,
 	if (!mach)
 		return -EINVAL;
 
-	sof_pdata->drv_name = "sof-nocodec";
-
 	mach->drv_name = "sof-nocodec";
 	sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
