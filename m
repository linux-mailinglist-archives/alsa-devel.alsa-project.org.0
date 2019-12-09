Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B623D11752C
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:05:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B0BD166B;
	Mon,  9 Dec 2019 20:05:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B0BD166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918350;
	bh=dEbCrB1fy6hnjX5GhIFC7I2UeHmLT7zM4/P+3wlXqT4=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Q3hA7QEzgAaWjFs4muQwghoW8AdGwKOGmlygL+cAbD2qXpQGnCcDI5cpAxNvoC1ko
	 EVxuw6uFgxugLyZ6G45VZCiFZbNHuRMpkbmsZo6DQ5oxj5jkW2XSYYhjNCshIdRAL6
	 XVyi9+a0bVXL1vDnnxK7KTybJdINcYLOJO4idWo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07DB7F802A1;
	Mon,  9 Dec 2019 19:59:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BFBAF8028E; Mon,  9 Dec 2019 19:59:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9884CF8028B
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:58:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9884CF8028B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBAEE1045;
 Mon,  9 Dec 2019 10:58:58 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C6653F6CF;
 Mon,  9 Dec 2019 10:58:58 -0800 (PST)
Date: Mon, 09 Dec 2019 18:58:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20191204211556.12671-5-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191204211556.12671-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: topology: remove
	snd_sof_init_topology()" to the asoc tree
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

   ASoC: SOF: topology: remove snd_sof_init_topology()

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

From 78fd4ffd75eed354c1c8b567dd0b384053c933da Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 4 Dec 2019 15:15:47 -0600
Subject: [PATCH] ASoC: SOF: topology: remove snd_sof_init_topology()

Remove snd_sof_init_topology() as it is never used.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191204211556.12671-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-priv.h | 2 --
 sound/soc/sof/topology.c | 9 ---------
 2 files changed, 11 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index c7c2c70ee4d0..31f0eb31598a 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -585,8 +585,6 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_ipc *ipc,
  * There is no snd_sof_free_topology since topology components will
  * be freed by snd_soc_unregister_component,
  */
-int snd_sof_init_topology(struct snd_sof_dev *sdev,
-			  struct snd_soc_tplg_ops *ops);
 int snd_sof_load_topology(struct snd_sof_dev *sdev, const char *file);
 int snd_sof_complete_pipeline(struct snd_sof_dev *sdev,
 			      struct snd_sof_widget *swidget);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d82ab981e840..b8701d3407ad 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3463,15 +3463,6 @@ static struct snd_soc_tplg_ops sof_tplg_ops = {
 	.bytes_ext_ops_count	= ARRAY_SIZE(sof_bytes_ext_ops),
 };
 
-int snd_sof_init_topology(struct snd_sof_dev *sdev,
-			  struct snd_soc_tplg_ops *ops)
-{
-	/* TODO: support linked list of topologies */
-	sdev->tplg_ops = ops;
-	return 0;
-}
-EXPORT_SYMBOL(snd_sof_init_topology);
-
 int snd_sof_load_topology(struct snd_sof_dev *sdev, const char *file)
 {
 	const struct firmware *fw;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
