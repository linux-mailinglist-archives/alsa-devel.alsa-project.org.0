Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CD411752B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:05:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7E6F166E;
	Mon,  9 Dec 2019 20:04:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7E6F166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918310;
	bh=umJrvJNZ3pgaVQaargQvmQ1KfNw4KO0zGu6+uO7T748=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Irro7CJ7JwTI+TxtXkxUhtQQTpLk28scwQPjYRW8G/Bwg/KPctGm9J3qIDHyElhoz
	 ocBxEQkKc/FB4uRhpyKihf/wUdJnN8m3ebj/xF9BF84+jedS/GFEPgToXc6vEEB3lA
	 wMlTIpwm6IgVJbCBIkfvHBK3uoGgxN3/YMq4LCco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD9F8F8028E;
	Mon,  9 Dec 2019 19:59:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A82F8027B; Mon,  9 Dec 2019 19:58:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1DCBEF80271
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:58:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DCBEF80271
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E68E6113E;
 Mon,  9 Dec 2019 10:58:53 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66D183F6CF;
 Mon,  9 Dec 2019 10:58:53 -0800 (PST)
Date: Mon, 09 Dec 2019 18:58:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20191204211556.12671-7-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191204211556.12671-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: core: move check for runtime
	callbacks to core" to the asoc tree
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

   ASoC: SOF: core: move check for runtime callbacks to core

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

From 8c583f526ee9df5c6693f54ac272b7e103b5f1d2 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 4 Dec 2019 15:15:49 -0600
Subject: [PATCH] ASoC: SOF: core: move check for runtime callbacks to core

For some platforms, the refcount is explicitly incremented
to prevent it from entering runtime suspend. This
should be be done during probe in the core instead
of being done in the PCM driver.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191204211556.12671-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/core.c | 8 ++++++++
 sound/soc/sof/pcm.c  | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 6a7f342203e9..d8446fb9fdde 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -355,6 +355,14 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	dev_dbg(sdev->dev, "created machine %s\n",
 		dev_name(&plat_data->pdev_mach->dev));
 
+	/*
+	 * Some platforms in SOF, ex: BYT, may not have their platform PM
+	 * callbacks set. Increment the usage count so as to
+	 * prevent the device from entering runtime suspend.
+	 */
+	if (!sof_ops(sdev)->runtime_suspend || !sof_ops(sdev)->runtime_resume)
+		pm_runtime_get_noresume(sdev->dev);
+
 	if (plat_data->sof_probe_complete)
 		plat_data->sof_probe_complete(sdev->dev);
 
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 9fd73ef08904..a9c47f6bf657 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -741,14 +741,6 @@ static int sof_pcm_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
-	/*
-	 * Some platforms in SOF, ex: BYT, may not have their platform PM
-	 * callbacks set. Increment the usage count so as to
-	 * prevent the device from entering runtime suspend.
-	 */
-	if (!sof_ops(sdev)->runtime_suspend || !sof_ops(sdev)->runtime_resume)
-		pm_runtime_get_noresume(sdev->dev);
-
 	return ret;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
