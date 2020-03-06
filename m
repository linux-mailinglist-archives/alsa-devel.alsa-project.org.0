Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4673617C13E
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 16:08:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEC8182E;
	Fri,  6 Mar 2020 16:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEC8182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583507281;
	bh=oxE5q2fgQFobcW6Ad/hRqPxWN7bZ5K2oQ0tQfAj3GuI=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=PVjFLHb89UIcz5dl5QJvLXWvEj1oQYKTI9+sYXHAh+gIYICsv3/TQRYr5P/NMSlsU
	 gFkNHHSFdPcMgbpuwiE+xU1EvTFWyfPjrk/TVplOSjDaFJoBptDo5jr9Svr5vm1lBY
	 fGlNibXYZnzt6V590GLcQHYcZs2mQ69bp5QVLsTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB6E0F802BD;
	Fri,  6 Mar 2020 16:03:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CC6CF802BC; Fri,  6 Mar 2020 16:03:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8708DF802A9
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 16:03:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8708DF802A9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03C6531B;
 Fri,  6 Mar 2020 07:03:27 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 781E63F237;
 Fri,  6 Mar 2020 07:03:26 -0800 (PST)
Date: Fri, 06 Mar 2020 15:03:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: add dpcm_fe_dai_cleanup()" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: soc-pcm: add dpcm_fe_dai_cleanup()

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

From 265694b67c13f00384bd0b97549b4681cbcc85af Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 6 Mar 2020 10:09:49 +0900
Subject: [PATCH] ASoC: soc-pcm: add dpcm_fe_dai_cleanup()

dpcm_fe_dai_close() and error case of dpcm_fe_dai_open()
need to do same cleanup operation.
To avoid duplicate code, this patch adds dpcm_fe_dai_cleanup()
and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87o8tap9uq.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 3686dda097e2..b405fb3a181b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2978,14 +2978,11 @@ int soc_dpcm_runtime_update(struct snd_soc_card *card)
 	return ret;
 }
 
-static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
+static void dpcm_fe_dai_cleanup(struct snd_pcm_substream *fe_substream)
 {
 	struct snd_soc_pcm_runtime *fe = fe_substream->private_data;
 	struct snd_soc_dpcm *dpcm;
-	int stream = fe_substream->stream, ret;
-
-	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
-	ret = dpcm_fe_dai_shutdown(fe_substream);
+	int stream = fe_substream->stream;
 
 	/* mark FE's links ready to prune */
 	for_each_dpcm_be(fe, stream, dpcm)
@@ -2994,6 +2991,18 @@ static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
 	dpcm_be_disconnect(fe, stream);
 
 	fe->dpcm[stream].runtime = NULL;
+}
+
+static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
+{
+	struct snd_soc_pcm_runtime *fe = fe_substream->private_data;
+	int ret;
+
+	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+	ret = dpcm_fe_dai_shutdown(fe_substream);
+
+	dpcm_fe_dai_cleanup(fe_substream);
+
 	mutex_unlock(&fe->card->mutex);
 	return ret;
 }
@@ -3001,7 +3010,6 @@ static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
 static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
 {
 	struct snd_soc_pcm_runtime *fe = fe_substream->private_data;
-	struct snd_soc_dpcm *dpcm;
 	struct snd_soc_dapm_widget_list *list;
 	int ret;
 	int stream = fe_substream->stream;
@@ -3021,14 +3029,8 @@ static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
 	dpcm_process_paths(fe, stream, &list, 1);
 
 	ret = dpcm_fe_dai_startup(fe_substream);
-	if (ret < 0) {
-		/* clean up all links */
-		for_each_dpcm_be(fe, stream, dpcm)
-			dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
-
-		dpcm_be_disconnect(fe, stream);
-		fe->dpcm[stream].runtime = NULL;
-	}
+	if (ret < 0)
+		dpcm_fe_dai_cleanup(fe_substream);
 
 	dpcm_clear_pending_state(fe, stream);
 	dpcm_path_put(&list);
-- 
2.20.1

