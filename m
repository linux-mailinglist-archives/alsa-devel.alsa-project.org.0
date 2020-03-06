Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0F717C13F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 16:08:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E4BE827;
	Fri,  6 Mar 2020 16:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E4BE827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583507302;
	bh=7X2Yzo2I+SuK4/fJV9bvjLEGD2vAtuuDGv0b1QheDMo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MNFzG14NdPgXKwoBqC4B7RR5n7qKc4mTfNDc8iPniyiBT3x1cY1GqL/BhIUaXniHt
	 zsJpt8Qm9Nkp3tnbYJAC/HVbLRUY7mod5NvEBWtgtfqADjaeSGz4n7gwwxSjr2CzA2
	 BEy4slkvcHx/Hb74xXM66/LS5q/zgRizDr+gFTi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96D20F802DB;
	Fri,  6 Mar 2020 16:03:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEDB2F802C4; Fri,  6 Mar 2020 16:03:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0C88CF802A8
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 16:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C88CF802A8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 459C531B;
 Fri,  6 Mar 2020 07:03:31 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD2C63F237;
 Fri,  6 Mar 2020 07:03:30 -0800 (PST)
Date: Fri, 06 Mar 2020 15:03:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: move dpcm_fe_dai_close()" to the asoc tree
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

   ASoC: soc-pcm: move dpcm_fe_dai_close()

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

From 30fca26f8e2277ccd14fe3277a330b4f21cadca7 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 6 Mar 2020 10:09:44 +0900
Subject: [PATCH] ASoC: soc-pcm: move dpcm_fe_dai_close()

move dpcm_fe_dai_close() next to dpcm_fe_dai_open().
This is prepare for dpcm_fe_dai_open() cleanup

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87pndqp9uv.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e3a2c4f7757b..3686dda097e2 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2978,6 +2978,26 @@ int soc_dpcm_runtime_update(struct snd_soc_card *card)
 	return ret;
 }
 
+static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
+{
+	struct snd_soc_pcm_runtime *fe = fe_substream->private_data;
+	struct snd_soc_dpcm *dpcm;
+	int stream = fe_substream->stream, ret;
+
+	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+	ret = dpcm_fe_dai_shutdown(fe_substream);
+
+	/* mark FE's links ready to prune */
+	for_each_dpcm_be(fe, stream, dpcm)
+		dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
+
+	dpcm_be_disconnect(fe, stream);
+
+	fe->dpcm[stream].runtime = NULL;
+	mutex_unlock(&fe->card->mutex);
+	return ret;
+}
+
 static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
 {
 	struct snd_soc_pcm_runtime *fe = fe_substream->private_data;
@@ -3017,26 +3037,6 @@ static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
 	return ret;
 }
 
-static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
-{
-	struct snd_soc_pcm_runtime *fe = fe_substream->private_data;
-	struct snd_soc_dpcm *dpcm;
-	int stream = fe_substream->stream, ret;
-
-	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
-	ret = dpcm_fe_dai_shutdown(fe_substream);
-
-	/* mark FE's links ready to prune */
-	for_each_dpcm_be(fe, stream, dpcm)
-		dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
-
-	dpcm_be_disconnect(fe, stream);
-
-	fe->dpcm[stream].runtime = NULL;
-	mutex_unlock(&fe->card->mutex);
-	return ret;
-}
-
 /* create a new pcm */
 int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 {
-- 
2.20.1

