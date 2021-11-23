Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 069E545AA13
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 18:27:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94BB6167B;
	Tue, 23 Nov 2021 18:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94BB6167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637688422;
	bh=ydmyOSY+GXUqazGz9WAEMpgIRlstTgKKYqtU0hJl3y0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CGUmeyAYPBpg1Nki8dLQ9wwVB7n/mxgcsVK2Dxe8Mg1i5kVsjw6m/bNAmjO2sSGou
	 ZQCZz7/k3nhiWGzrae0/Xtq3jnMrdJt53Zrl0EsDwqS7vlkn/ma1BpSoCudUl97InN
	 aAeG9AfNE3V9iwsJEhLh01ZX/uPA0YOZa+lXmdeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E164AF804E7;
	Tue, 23 Nov 2021 18:25:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12592F804E6; Tue, 23 Nov 2021 18:24:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00DD5F804AC
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 18:24:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00DD5F804AC
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="215780405"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="215780405"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 09:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="509490827"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008.jf.intel.com with ESMTP; 23 Nov 2021 09:23:42 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 3/3] ASoC: SOF: handle paused streams during system suspend
Date: Tue, 23 Nov 2021 19:16:06 +0200
Message-Id: <20211123171606.129350-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211123171606.129350-1-kai.vehmanen@linux.intel.com>
References: <20211123171606.129350-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Paul Olaru <paul.olaru@oss.nxp.com>,
 daniel.baluta@nxp.com, Bard Liao <bard.liao@intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

During system suspend, paused streams do not get suspended.
Therefore, we need to explicitly free these PCMs in the DSP
and free the associated DAPM widgets so that they can be set
up again during resume.

Fixes: 5fcdbb2d45df ("ASoC: SOF: Add support for dynamic pipelines")
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/pcm.c       |  5 ++-
 sound/soc/sof/sof-audio.c | 74 +++++++++++++++++++++++++++++++++++++--
 sound/soc/sof/sof-audio.h |  2 ++
 3 files changed, 76 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 31dd79b794f1..0ceb1a9cbf73 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -100,9 +100,8 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
 
-static int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream,
-				struct snd_sof_dev *sdev,
-				struct snd_sof_pcm *spcm)
+int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream, struct snd_sof_dev *sdev,
+			 struct snd_sof_pcm *spcm)
 {
 	struct sof_ipc_stream stream;
 	struct sof_ipc_reply reply;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index f4e142ec0fbd..e00ce275052f 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -129,6 +129,14 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	case snd_soc_dapm_buffer:
 		ipc_free.hdr.cmd |= SOF_IPC_TPLG_BUFFER_FREE;
 		break;
+	case snd_soc_dapm_dai_in:
+	case snd_soc_dapm_dai_out:
+	{
+		struct snd_sof_dai *dai = swidget->private;
+
+		dai->configured = false;
+		fallthrough;
+	}
 	default:
 		ipc_free.hdr.cmd |= SOF_IPC_TPLG_COMP_FREE;
 		break;
@@ -720,6 +728,55 @@ int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
 	return 0;
 }
 
+/*
+ * Free the PCM, its associated widgets and set the prepared flag to false for all PCMs that
+ * did not get suspended(ex: paused streams) so the widgets can be set up again during resume.
+ */
+static int sof_tear_down_left_over_pipelines(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_widget *swidget;
+	struct snd_sof_pcm *spcm;
+	int dir, ret;
+
+	/*
+	 * free all PCMs and their associated DAPM widgets if their connected DAPM widget
+	 * list is not NULL. This should only be true for paused streams at this point.
+	 * This is equivalent to the handling of FE DAI suspend trigger for running streams.
+	 */
+	list_for_each_entry(spcm, &sdev->pcm_list, list)
+		for_each_pcm_streams(dir) {
+			struct snd_pcm_substream *substream = spcm->stream[dir].substream;
+
+			if (!substream || !substream->runtime)
+				continue;
+
+			if (spcm->stream[dir].list) {
+				ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+				if (ret < 0)
+					return ret;
+
+				ret = sof_widget_list_free(sdev, spcm, dir);
+				if (ret < 0) {
+					dev_err(sdev->dev, "failed to free widgets during suspend\n");
+					return ret;
+				}
+			}
+		}
+
+	/*
+	 * free any left over DAI widgets. This is equivalent to the handling of suspend trigger
+	 * for the BE DAI for running streams.
+	 */
+	list_for_each_entry(swidget, &sdev->widget_list, list)
+		if (WIDGET_IS_DAI(swidget->id) && swidget->use_count == 1) {
+			ret = sof_widget_free(sdev, swidget);
+			if (ret < 0)
+				return ret;
+		}
+
+	return 0;
+}
+
 /*
  * For older firmware, this function doesn't free widgets for static pipelines during suspend.
  * It only resets use_count for all widgets.
@@ -734,8 +791,8 @@ int sof_tear_down_pipelines(struct snd_sof_dev *sdev, bool verify)
 	/*
 	 * This function is called during suspend and for one-time topology verification during
 	 * first boot. In both cases, there is no need to protect swidget->use_count and
-	 * sroute->setup because during suspend all streams are suspended and during topology
-	 * loading the sound card unavailable to open PCMs.
+	 * sroute->setup because during suspend all running streams are suspended and during
+	 * topology loading the sound card unavailable to open PCMs.
 	 */
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
 		if (swidget->dynamic_pipeline_widget)
@@ -754,6 +811,19 @@ int sof_tear_down_pipelines(struct snd_sof_dev *sdev, bool verify)
 			return ret;
 	}
 
+	/*
+	 * Tear down all pipelines associated with PCMs that did not get suspended
+	 * and unset the prepare flag so that they can be set up again during resume.
+	 * Skip this step for older firmware.
+	 */
+	if (!verify && v->abi_version >= SOF_ABI_VER(3, 19, 0)) {
+		ret = sof_tear_down_left_over_pipelines(sdev);
+		if (ret < 0) {
+			dev_err(sdev->dev, "failed to tear down paused pipelines\n");
+			return ret;
+		}
+	}
+
 	list_for_each_entry(sroute, &sdev->route_list, list)
 		sroute->setup = false;
 
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 389d56ac3aba..1c4f59d34717 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -265,4 +265,6 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 /* PCM */
 int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
 int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
+int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream, struct snd_sof_dev *sdev,
+			 struct snd_sof_pcm *spcm);
 #endif
-- 
2.33.0

