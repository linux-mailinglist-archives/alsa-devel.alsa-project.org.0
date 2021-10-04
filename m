Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314F421A65
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 00:58:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DD9D166D;
	Tue,  5 Oct 2021 00:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DD9D166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633388301;
	bh=dbw2rSugtNmdC9qVB4T8ePb8xuE8wWDgca+ZG8ZLSyg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mKfO5t2Ynfe+D4nQRH1jE2NJqbFlvT7bDqj26F7Qmil8G21T5vEBo5QC6LNLV+fQ3
	 ZnhZbY4t3EyH5rYKdVKCrtUCWSCfJiL6plhDUgetiKFsT97h5zzI5oMlnhOsLjjTtZ
	 Giry3UQaDAu+aFhaCPakJCcU5ZWZFCvqTu5/lCD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C24BDF80506;
	Tue,  5 Oct 2021 00:55:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00FCDF804FE; Tue,  5 Oct 2021 00:55:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FE6AF80229
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 00:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FE6AF80229
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="205727456"
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="205727456"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:55:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="559011941"
Received: from ksgonzal-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.181.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:55:05 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH v2 4/5] ASoC: soc-pcm: protect for_each_dpcm_be() loops
 with dpcm_mutex
Date: Mon,  4 Oct 2021 17:54:40 -0500
Message-Id: <20211004225441.233375-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004225441.233375-1-pierre-louis.bossart@linux.intel.com>
References: <20211004225441.233375-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, vkoul@kernel.org, broonie@kernel.org,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

When more than one FE is connected to a BE, e.g. in a mixing use case,
the BE can be triggered multiple times when the FE are opened/started
concurrently. This race condition is problematic in the case of
SoundWire BE dailinks, and this is not desirable in a general
case. The code carefully checks when the BE can be stopped or
hw_free'ed, but the trigger code does not use any mutual exclusion.

This can be fixed by using the dpcm_mutex.

As discussed on the alsa-mailing list [1], there is an additional
issue that the BEs can be disconnected dynamically, leading to
potential accesses to freed memory.

This patch suggests a general protection of the for_each_dpcm_be()
loop with the dpcm_mutex, to solve both the problem of multiple
triggers and BE dynamic addition/removal.

[1] https://lore.kernel.org/alsa-devel/002f01d7b4f5$c030f4a0$4092dde0$@samsung.com/

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-pcm.c | 48 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index af12593b033a..6089e0c1bf9f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -320,6 +320,7 @@ int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
 {
 	struct snd_soc_dpcm *dpcm;
 
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be(fe, dir, dpcm) {
 
 		struct snd_soc_pcm_runtime *be = dpcm->be;
@@ -333,6 +334,8 @@ int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
 
 		snd_soc_dapm_stream_event(be, dir, event);
 	}
+	mutex_unlock(&fe->card->dpcm_mutex);
+
 
 	snd_soc_dapm_stream_event(fe, dir, event);
 
@@ -1142,10 +1145,14 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 	struct snd_soc_dpcm *dpcm;
 
 	/* only add new dpcms */
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be(fe, stream, dpcm) {
-		if (dpcm->be == be && dpcm->fe == fe)
+		if (dpcm->be == be && dpcm->fe == fe) {
+			mutex_unlock(&fe->card->dpcm_mutex);
 			return 0;
+		}
 	}
+	mutex_unlock(&fe->card->dpcm_mutex);
 
 	dpcm = kzalloc(sizeof(struct snd_soc_dpcm), GFP_KERNEL);
 	if (!dpcm)
@@ -1202,6 +1209,7 @@ void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	struct snd_soc_dpcm *dpcm, *d;
 
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be_safe(fe, stream, dpcm, d) {
 		dev_dbg(fe->dev, "ASoC: BE %s disconnect check for %s\n",
 				stream ? "capture" : "playback",
@@ -1219,12 +1227,11 @@ void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 
 		dpcm_remove_debugfs_state(dpcm);
 
-		mutex_lock(&fe->card->dpcm_mutex);
 		list_del(&dpcm->list_be);
 		list_del(&dpcm->list_fe);
-		mutex_unlock(&fe->card->dpcm_mutex);
 		kfree(dpcm);
 	}
+	mutex_unlock(&fe->card->dpcm_mutex);
 }
 
 /* get BE for DAI widget and stream */
@@ -1351,6 +1358,7 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	int prune = 0;
 
 	/* Destroy any old FE <--> BE connections */
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		if (dpcm_be_is_active(dpcm, stream, *list_))
 			continue;
@@ -1362,6 +1370,7 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		dpcm_set_be_update_state(dpcm->be, stream, SND_SOC_DPCM_UPDATE_BE);
 		prune++;
 	}
+	mutex_unlock(&fe->card->dpcm_mutex);
 
 	dev_dbg(fe->dev, "ASoC: found %d old BE paths for pruning\n", prune);
 	return prune;
@@ -1451,13 +1460,16 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 	struct snd_soc_dpcm *dpcm;
 
 	/* disable any enabled and non active backends */
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_pcm_substream *be_substream =
 			snd_soc_dpcm_get_substream(be, stream);
 
-		if (dpcm == last)
+		if (dpcm == last) {
+			mutex_unlock(&fe->card->dpcm_mutex);
 			return;
+		}
 
 		/* is this op for this BE ? */
 		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
@@ -1487,6 +1499,7 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 		be_substream->runtime = NULL;
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
 	}
+	mutex_unlock(&fe->card->dpcm_mutex);
 }
 
 int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
@@ -1496,6 +1509,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 	int err, count = 0;
 
 	/* only startup BE DAIs that are either sinks or sources to this FE DAI */
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_pcm_substream *be_substream;
 
@@ -1546,11 +1560,13 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
 		count++;
 	}
+	mutex_unlock(&fe->card->dpcm_mutex);
 
 	return count;
 
 unwind:
 	dpcm_be_dai_startup_rollback(fe, stream, dpcm);
+	mutex_unlock(&fe->card->dpcm_mutex);
 
 	dev_err(fe->dev, "ASoC: %s() failed at %s (%d)\n",
 		__func__, be->dai_link->name, err);
@@ -1605,6 +1621,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 	 * if FE want to use it (= dpcm_merged_format)
 	 */
 
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_soc_pcm_stream *codec_stream;
@@ -1623,6 +1640,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 			soc_pcm_hw_update_format(hw, codec_stream);
 		}
 	}
+	mutex_unlock(&fe->card->dpcm_mutex);
 }
 
 static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
@@ -1640,7 +1658,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 	 * It returns merged BE codec channel;
 	 * if FE want to use it (= dpcm_merged_chan)
 	 */
-
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_soc_pcm_stream *cpu_stream;
@@ -1671,6 +1689,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 			soc_pcm_hw_update_chan(hw, codec_stream);
 		}
 	}
+	mutex_unlock(&fe->card->dpcm_mutex);
 }
 
 static void dpcm_runtime_setup_be_rate(struct snd_pcm_substream *substream)
@@ -1688,7 +1707,7 @@ static void dpcm_runtime_setup_be_rate(struct snd_pcm_substream *substream)
 	 * It returns merged BE codec channel;
 	 * if FE want to use it (= dpcm_merged_chan)
 	 */
-
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_soc_pcm_stream *pcm;
@@ -1708,6 +1727,7 @@ static void dpcm_runtime_setup_be_rate(struct snd_pcm_substream *substream)
 			soc_pcm_hw_update_rate(hw, pcm);
 		}
 	}
+	mutex_unlock(&fe->card->dpcm_mutex);
 }
 
 static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
@@ -1730,6 +1750,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 	}
 
 	/* apply symmetry for BE */
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_pcm_substream *be_substream =
@@ -1755,6 +1776,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 		}
 	}
 error:
+	mutex_unlock(&fe->card->dpcm_mutex);
 	if (err < 0)
 		dev_err(fe->dev, "ASoC: %s failed (%d)\n", __func__, err);
 
@@ -1830,6 +1852,7 @@ void dpcm_be_dai_hw_free(struct snd_soc_pcm_runtime *fe, int stream)
 
 	/* only hw_params backends that are either sinks or sources
 	 * to this frontend DAI */
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be(fe, stream, dpcm) {
 
 		struct snd_soc_pcm_runtime *be = dpcm->be;
@@ -1842,7 +1865,7 @@ void dpcm_be_dai_hw_free(struct snd_soc_pcm_runtime *fe, int stream)
 
 		/* only free hw when no longer used - check all FEs */
 		if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
-				continue;
+			continue;
 
 		/* do not free hw if this BE is used by other FE */
 		if (be->dpcm[stream].users > 1)
@@ -1863,6 +1886,7 @@ void dpcm_be_dai_hw_free(struct snd_soc_pcm_runtime *fe, int stream)
 
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_HW_FREE;
 	}
+	mutex_unlock(&fe->card->dpcm_mutex);
 }
 
 static int dpcm_fe_dai_hw_free(struct snd_pcm_substream *substream)
@@ -1896,6 +1920,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 	struct snd_soc_dpcm *dpcm;
 	int ret;
 
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		be = dpcm->be;
 		be_substream = snd_soc_dpcm_get_substream(be, stream);
@@ -1935,6 +1960,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_HW_PARAMS;
 	}
+	mutex_unlock(&fe->card->dpcm_mutex);
 	return 0;
 
 unwind:
@@ -1961,6 +1987,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 
 		soc_pcm_hw_free(be_substream);
 	}
+	mutex_unlock(&fe->card->dpcm_mutex);
 
 	return ret;
 }
@@ -2008,6 +2035,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 	struct snd_soc_dpcm *dpcm;
 	int ret = 0;
 
+	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_pcm_substream *be_substream;
 
@@ -2097,6 +2125,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 		}
 	}
 end:
+	mutex_unlock(&fe->card->dpcm_mutex);
 	if (ret < 0)
 		dev_err(fe->dev, "ASoC: %s() failed at %s (%d)\n",
 			__func__, be->dai_link->name, ret);
@@ -2831,6 +2860,7 @@ struct snd_pcm_substream *
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_get_substream);
 
+/* This must be called with fe->card->dpcm_mutex held */
 static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
 				    struct snd_soc_pcm_runtime *be,
 				    int stream,
@@ -2842,7 +2872,6 @@ static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
 	int ret = 1;
 	int i;
 
-	mutex_lock(&fe->card->dpcm_mutex);
 	for_each_dpcm_fe(be, stream, dpcm) {
 
 		if (dpcm->fe == fe)
@@ -2856,7 +2885,6 @@ static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
 			}
 		}
 	}
-	mutex_unlock(&fe->card->dpcm_mutex);
 
 	/* it's safe to do this BE DAI */
 	return ret;
@@ -2865,6 +2893,7 @@ static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
 /*
  * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
  * are not running, paused or suspended for the specified stream direction.
+ * This must be called with fe->card->dpcm_mutex held.
  */
 static int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
@@ -2881,6 +2910,7 @@ static int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 /*
  * We can only change hw params a BE DAI if any of it's FE are not prepared,
  * running, paused or suspended for the specified stream direction.
+ * This must be called with fe->card->dpcm_mutex held.
  */
 static int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
-- 
2.25.1

