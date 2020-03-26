Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6963719472A
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 20:10:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1176B1666;
	Thu, 26 Mar 2020 20:09:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1176B1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585249801;
	bh=FuSUcqFkSETh2cH7mfglQ1y8TSKkphq7Gj2evE8tnEM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Td07Bh/YXoX63ZOzq+XsxkJNKfqqR/DAPnPNhZgcPvlrdZ6Wn7hQ5t8YraS9bVLkV
	 yZL2Iu1n/KEF9hYit+BHvnlVz+K/4Mu6tgphZFG5ODljdfy3xH83dzzgQhCALY8db+
	 uYwENwtSwEewbUIIIEvhyM64v9LM/n+QiaxsAWI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2766AF802D2;
	Thu, 26 Mar 2020 20:05:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F3C1F802C4; Thu, 26 Mar 2020 20:05:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id AF743F802BD
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 20:05:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF743F802BD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B20F7FA;
 Thu, 26 Mar 2020 12:05:11 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C062A3F71F;
 Thu, 26 Mar 2020 12:05:10 -0700 (PDT)
Date: Thu, 26 Mar 2020 19:05:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Applied "ASoC: SOF: fix uninitialised "work" with VirtIO" to the asoc
 tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

   ASoC: SOF: fix uninitialised "work" with VirtIO

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

From 9ef91cad92ba75d17d5a5203230746c9d9009705 Mon Sep 17 00:00:00 2001
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Date: Wed, 25 Mar 2020 16:12:31 -0500
Subject: [PATCH] ASoC: SOF: fix uninitialised "work" with VirtIO

In the VirtIO case the sof_pcm_open() function isn't called on the
host during guest streaming, which then leaves "work" structures
uninitialised. However it is then used to handle position update
messages from the DSP. Move their initialisation to immediately after
allocation of the containing structure.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20200325211233.27394-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c       | 4 +---
 sound/soc/sof/sof-audio.h | 3 +++
 sound/soc/sof/topology.c  | 6 +++++-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index f4769e19965a..47cd741f2a8c 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -57,7 +57,7 @@ static int sof_pcm_dsp_params(struct snd_sof_pcm *spcm, struct snd_pcm_substream
 /*
  * sof pcm period elapse work
  */
-static void sof_pcm_period_elapsed_work(struct work_struct *work)
+void snd_sof_pcm_period_elapsed_work(struct work_struct *work)
 {
 	struct snd_sof_pcm_stream *sps =
 		container_of(work, struct snd_sof_pcm_stream,
@@ -475,8 +475,6 @@ static int sof_pcm_open(struct snd_soc_component *component,
 	dev_dbg(component->dev, "pcm: open stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
 
-	INIT_WORK(&spcm->stream[substream->stream].period_elapsed_work,
-		  sof_pcm_period_elapsed_work);
 
 	caps = &spcm->pcm.caps[substream->stream];
 
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index eacd10e4da11..bf65f31af858 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -11,6 +11,8 @@
 #ifndef __SOUND_SOC_SOF_AUDIO_H
 #define __SOUND_SOC_SOF_AUDIO_H
 
+#include <linux/workqueue.h>
+
 #include <sound/soc.h>
 #include <sound/control.h>
 #include <sound/sof/stream.h> /* needs to be included before control.h */
@@ -189,6 +191,7 @@ struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_soc_component *scomp,
 struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_soc_component *scomp,
 					     unsigned int pcm_id);
 void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
+void snd_sof_pcm_period_elapsed_work(struct work_struct *work);
 
 /*
  * Mixer IPC
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 54437caf9488..fe8ba3e05e08 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -9,6 +9,7 @@
 //
 
 #include <linux/firmware.h>
+#include <linux/workqueue.h>
 #include <sound/tlv.h>
 #include <sound/pcm_params.h>
 #include <uapi/sound/sof/tokens.h>
@@ -2461,8 +2462,11 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 
 	spcm->scomp = scomp;
 
-	for_each_pcm_streams(stream)
+	for_each_pcm_streams(stream) {
 		spcm->stream[stream].comp_id = COMP_ID_UNASSIGNED;
+		INIT_WORK(&spcm->stream[stream].period_elapsed_work,
+			  snd_sof_pcm_period_elapsed_work);
+	}
 
 	spcm->pcm = *pcm;
 	dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
-- 
2.20.1

