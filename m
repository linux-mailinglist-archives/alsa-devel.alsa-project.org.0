Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B3712A539
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2019 01:17:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9622B16DD;
	Wed, 25 Dec 2019 01:16:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9622B16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577233050;
	bh=eigADizJ0HB+kqn+4RmOWje19HuYeyyKxYbkhy/gX1E=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=M8C4IzX6GJgZPZ/M7TMamIPlgAsEqmqVkHdivM+ePy25qoLefoTlMJJTxhWGsIMV6
	 4i2lIJVBdOOwBSWS13jhsleoSLzyNXiEb8S5Sa7CDrnK1Wd3JVWwsecMJ6LQZmHmL/
	 9ndyg4Zt6WXJqUizwmmefEjmJyIf+TfW4e4AUX7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8010CF802F9;
	Wed, 25 Dec 2019 01:09:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05E33F8028A; Wed, 25 Dec 2019 01:09:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 600F6F8014C
 for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2019 01:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 600F6F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bWvKQw0C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=D+gflELiAYWqAf3W7ibh4uGUEvCoKO8Uul7fTN2lTb4=; b=bWvKQw0CKhPl
 auKXl93h85JnJV3mY1ZGyzaj+sy169t2HeasyxKLwY6NZFlILU3g0XuxJN2HSb7a4TaebFJlLAmqk
 vVYQn07D25a/9Gk7UsFMXeyKi0Ep1aDWptXZTgWYK3UMd4O4ADty/hKmgb/UPPFyAJ45c9homHQ4K
 GlVLo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ijuEf-0007MD-Ul; Wed, 25 Dec 2019 00:09:09 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 71D87D01957; Wed, 25 Dec 2019 00:09:09 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191204151454.21643-1-tiwai@suse.de>
Message-Id: <applied-20191204151454.21643-1-tiwai@suse.de>
X-Patchwork-Hint: ignore
Date: Wed, 25 Dec 2019 00:09:09 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: core: Fix access to uninitialized list
	heads" to the asoc tree
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

   ASoC: core: Fix access to uninitialized list heads

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 07d22a9bb623714dc3199099c5cce3df6aef496c Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 4 Dec 2019 16:14:54 +0100
Subject: [PATCH] ASoC: core: Fix access to uninitialized list heads

The error path of soc_new_pcm_runtime() invokes soc_free_pcm_runtime()
that may cause a few problems.  First off, it calls list_del() for
rtd->list that may not be initialized.  Similarly,
snd_soc_pcm_component_free() traverses over the component list that
may not be initialized, either.  Such access to the uninitialized list
head would lead to either a BUG_ON() or a memory corruption.

This patch fixes the access to uninitialized list heads by
initializing the list heads properly at the beginning before those
error paths.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191204151454.21643-1-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6050c4c62fe8..8ef0efeed0a7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -479,6 +479,12 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 		goto free_rtd;
 
 	rtd->dev = dev;
+	INIT_LIST_HEAD(&rtd->list);
+	INIT_LIST_HEAD(&rtd->component_list);
+	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
+	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
+	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
+	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].fe_clients);
 	dev_set_drvdata(dev, rtd);
 	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
 
@@ -494,12 +500,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	/*
 	 * rtd remaining settings
 	 */
-	INIT_LIST_HEAD(&rtd->component_list);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].fe_clients);
-
 	rtd->card = card;
 	rtd->dai_link = dai_link;
 	if (!rtd->dai_link->ops)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
