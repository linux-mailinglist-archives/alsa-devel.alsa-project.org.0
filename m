Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 158FC16385E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:17:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FD8416AC;
	Wed, 19 Feb 2020 01:16:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FD8416AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071440;
	bh=4ZuqV9/fU0NEnn9J3ifwlivXrGDKzXgC5JtILo7A3Sw=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bnt9DdTmmVDQJHnxx9a+nZx4drD/1Y4BTIhGS10phjloz2oQ3h16ELyRipQ6sm7SU
	 qMsJciGZ1TrqrivP6Ihc7lawYOPB/Aj5HDjGRu+Fmvc5otjTTMjau2UQFWf+uOcBaj
	 Cb6+54X02IysC15qaxFTGa/Sz6jO5/Ld0e7BQMiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72558F802EA;
	Wed, 19 Feb 2020 01:10:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FAF2F802E8; Wed, 19 Feb 2020 01:09:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 652CCF802E0
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:09:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 652CCF802E0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DA061FB;
 Tue, 18 Feb 2020 16:09:54 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D33503F68F;
 Tue, 18 Feb 2020 16:09:53 -0800 (PST)
Date: Wed, 19 Feb 2020 00:09:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: add snd_soc_dpcm_can_be() and remove
 duplicate code" to the asoc tree
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

   ASoC: soc-pcm: add snd_soc_dpcm_can_be() and remove duplicate code

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

From 085d22be035db245c44714cf879a73eae06c9f6b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 17 Feb 2020 17:28:07 +0900
Subject: [PATCH] ASoC: soc-pcm: add snd_soc_dpcm_can_be() and remove duplicate
 code

Below functions are doing very similar things, the difference is
used state only.

	snd_soc_dpcm_can_be_free_stop()
	snd_soc_dpcm_can_be_params()

This patch adds common snd_soc_dpcm_check_state(), and use it from
snd_soc_dpcm_can_be_free_stop() / snd_soc_dpcm_can_be_params().
It can reduce duplicate code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/878sl1bou2.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 70 ++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index bd4e4f86f5b2..d77a2c22a04f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2954,17 +2954,17 @@ struct snd_pcm_substream *
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_get_substream);
 
-/*
- * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
- * are not running, paused or suspended for the specified stream direction.
- */
-int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream)
+static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
+				    struct snd_soc_pcm_runtime *be,
+				    int stream,
+				    const enum snd_soc_dpcm_state *states,
+				    int num_states)
 {
 	struct snd_soc_dpcm *dpcm;
 	int state;
 	int ret = 1;
 	unsigned long flags;
+	int i;
 
 	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 	for_each_dpcm_fe(be, stream, dpcm) {
@@ -2973,18 +2973,34 @@ int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 			continue;
 
 		state = dpcm->fe->dpcm[stream].state;
-		if (state == SND_SOC_DPCM_STATE_START ||
-			state == SND_SOC_DPCM_STATE_PAUSED ||
-			state == SND_SOC_DPCM_STATE_SUSPEND) {
-			ret = 0;
-			break;
+		for (i = 0; i < num_states; i++) {
+			if (state == states[i]) {
+				ret = 0;
+				break;
+			}
 		}
 	}
 	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
-	/* it's safe to free/stop this BE DAI */
+	/* it's safe to do this BE DAI */
 	return ret;
 }
+
+/*
+ * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
+ * are not running, paused or suspended for the specified stream direction.
+ */
+int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
+		struct snd_soc_pcm_runtime *be, int stream)
+{
+	const enum snd_soc_dpcm_state state[] = {
+		SND_SOC_DPCM_STATE_START,
+		SND_SOC_DPCM_STATE_PAUSED,
+		SND_SOC_DPCM_STATE_SUSPEND,
+	};
+
+	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
+}
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
 
 /*
@@ -2994,30 +3010,14 @@ EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
 int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
 {
-	struct snd_soc_dpcm *dpcm;
-	int state;
-	int ret = 1;
-	unsigned long flags;
-
-	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
-	for_each_dpcm_fe(be, stream, dpcm) {
-
-		if (dpcm->fe == fe)
-			continue;
+	const enum snd_soc_dpcm_state state[] = {
+		SND_SOC_DPCM_STATE_START,
+		SND_SOC_DPCM_STATE_PAUSED,
+		SND_SOC_DPCM_STATE_SUSPEND,
+		SND_SOC_DPCM_STATE_PREPARE,
+	};
 
-		state = dpcm->fe->dpcm[stream].state;
-		if (state == SND_SOC_DPCM_STATE_START ||
-			state == SND_SOC_DPCM_STATE_PAUSED ||
-			state == SND_SOC_DPCM_STATE_SUSPEND ||
-			state == SND_SOC_DPCM_STATE_PREPARE) {
-			ret = 0;
-			break;
-		}
-	}
-	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
-
-	/* it's safe to change hw_params */
-	return ret;
+	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_params);
 
-- 
2.20.1

