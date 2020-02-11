Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F61159404
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 16:56:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FCD61686;
	Tue, 11 Feb 2020 16:55:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FCD61686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581436566;
	bh=uxrBTZ2FRH9lrPI4FeWY/q650AaNbTALD4Hyjam/e6w=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UIvvF2H7LDWwQ9YIE/BAv/XbkqaMaJMkQUtjsWAbfRWP1HRv/b4EnyKww7jnUbswi
	 OqZvCQ1Wjh2bmW3mPJ66XpkrE/C1e0SRW7U0qtL6AgS/kjddUV9cdFoIAjah3eqTNs
	 0QyzO4CoTU6/HvlpgB2+SX1e+zuLpa1vmzYSksQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84D2EF802EB;
	Tue, 11 Feb 2020 16:48:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83A82F802DD; Tue, 11 Feb 2020 16:48:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 61469F802BE
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:48:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61469F802BE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA26E1045;
 Tue, 11 Feb 2020 07:48:44 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 307E63F68E;
 Tue, 11 Feb 2020 07:48:44 -0800 (PST)
Date: Tue, 11 Feb 2020 15:48:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20200129220726.31792-7-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200129220726.31792-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: audio: Add helper to check if only
	D0i3 streams are active" to the asoc tree
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

   ASoC: SOF: audio: Add helper to check if only D0i3 streams are active

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From de23a838d8d61767c6232f229f019eb46401cb93 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 29 Jan 2020 16:07:23 -0600
Subject: [PATCH] ASoC: SOF: audio: Add helper to check if only D0i3 streams
 are active

Add a helper function to check if only D0i3-compatible streams
are active.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200129220726.31792-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-audio.c | 33 +++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index d16571ca129c..75f2ef2bd94b 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -11,6 +11,39 @@
 #include "sof-audio.h"
 #include "ops.h"
 
+/*
+ * helper to determine if there are only D0i3 compatible
+ * streams active
+ */
+bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_sof_pcm *spcm;
+	bool d0i3_compatible_active = false;
+	int dir;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		for (dir = 0; dir <= SNDRV_PCM_STREAM_CAPTURE; dir++) {
+			substream = spcm->stream[dir].substream;
+			if (!substream || !substream->runtime)
+				continue;
+
+			/*
+			 * substream->runtime being not NULL indicates that
+			 * that the stream is open. No need to check the
+			 * stream state.
+			 */
+			if (!spcm->stream[dir].d0i3_compatible)
+				return false;
+
+			d0i3_compatible_active = true;
+		}
+	}
+
+	return d0i3_compatible_active;
+}
+EXPORT_SYMBOL(snd_sof_dsp_only_d0i3_compatible_stream_active);
+
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pcm *spcm;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index a2702afbd9a1..eacd10e4da11 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -203,6 +203,7 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 int sof_restore_pipelines(struct device *dev);
 int sof_set_hw_params_upon_resume(struct device *dev);
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev);
+bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev);
 
 /* Machine driver enumeration */
 int sof_machine_register(struct snd_sof_dev *sdev, void *pdata);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
