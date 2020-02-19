Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1680B163842
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:11:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEF1D16A9;
	Wed, 19 Feb 2020 01:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEF1D16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071100;
	bh=T9L/8gM171dIJDRC3jN4cadMBLZQ/tQ7qXvuvlff1nM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=iA6uJ7WiTdOjaX4pJ8+sO4YB4BqtTePmMHXTpRyQ+4bBsz60ylVRugRxf0Fic+YBR
	 GGlRCEyxjNIBDEaKk04B5sjwZ3ecBY4kcR9dc829fcKgiiaoQLQBxt3dWra5UgT4hH
	 YZrWaur4fRnkRTXgtA1z4DXg+eOScTDAgRSgt2aA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8E8FF8014C;
	Wed, 19 Feb 2020 01:09:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 734C6F80135; Wed, 19 Feb 2020 01:09:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 3227AF80135
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:09:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3227AF80135
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B29301FB;
 Tue, 18 Feb 2020 16:09:09 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3562F3F68F;
 Tue, 18 Feb 2020 16:09:09 -0800 (PST)
Date: Wed, 19 Feb 2020 00:09:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: sof: sof-audio: use for_each_pcm_streams() macro" to
 the asoc tree
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

   ASoC: sof: sof-audio: use for_each_pcm_streams() macro

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

From 525c4107da8c0a86aa3548dc6e1d0014749e95f7 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 17 Feb 2020 17:28:47 +0900
Subject: [PATCH] ASoC: sof: sof-audio: use for_each_pcm_streams() macro

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87tv3paa8i.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-audio.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 75f2ef2bd94b..fc4ed2a8a914 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -23,7 +23,7 @@ bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev)
 	int dir;
 
 	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		for (dir = 0; dir <= SNDRV_PCM_STREAM_CAPTURE; dir++) {
+		for_each_pcm_streams(dir) {
 			substream = spcm->stream[dir].substream;
 			if (!substream || !substream->runtime)
 				continue;
@@ -71,7 +71,7 @@ int sof_set_hw_params_upon_resume(struct device *dev)
 	 * have been suspended.
 	 */
 	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		for (dir = 0; dir <= SNDRV_PCM_STREAM_CAPTURE; dir++) {
+		for_each_pcm_streams(dir) {
 			/*
 			 * do not reset hw_params upon resume for streams that
 			 * were kept running during suspend
@@ -319,16 +319,11 @@ struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_soc_component *scomp,
 	int dir;
 
 	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		dir = SNDRV_PCM_STREAM_PLAYBACK;
-		if (spcm->stream[dir].comp_id == comp_id) {
-			*direction = dir;
-			return spcm;
-		}
-
-		dir = SNDRV_PCM_STREAM_CAPTURE;
-		if (spcm->stream[dir].comp_id == comp_id) {
-			*direction = dir;
-			return spcm;
+		for_each_pcm_streams(dir) {
+			if (spcm->stream[dir].comp_id == comp_id) {
+				*direction = dir;
+				return spcm;
+			}
 		}
 	}
 
-- 
2.20.1

