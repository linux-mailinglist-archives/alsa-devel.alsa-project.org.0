Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 523F042C35A
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 16:33:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D022F1684;
	Wed, 13 Oct 2021 16:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D022F1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634135629;
	bh=+/vdt+UAe5Qi+GzfCdT0qO/gLrIROcclzyExp0vWBi4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VLnsvDizBfPaLt3GR2zuskw+evbCDIt/vvfqlY+t3gZE79TRcWY23TWQVMFC5UiaS
	 fyJ7P1zFEXSgY1bBSVHb5tgl359J5dEVImS4c/jcNqDyi7t2Dry+1jjo3FifxCpfgf
	 xMrFTwWD6BQAE+NKHgde+2IvuCLlV513mTBiEf/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5850F80507;
	Wed, 13 Oct 2021 16:31:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FCF8F804FA; Wed, 13 Oct 2021 16:31:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29929F804ED
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 16:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29929F804ED
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="313639557"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="313639557"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:31:18 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524649537"
Received: from ssafavib-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.164.198])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:31:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH v3 07/13] ASoC: soc-pcm: protect for_each_dpcm_be() loops
Date: Wed, 13 Oct 2021 09:30:44 -0500
Message-Id: <20211013143050.244444-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
References: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
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

The D in DPCM stands for 'dynamic', which means that connections
between FE and BE can evolve.

Commit a97648697790 ("ASoC: dpcm: prevent snd_soc_dpcm use after
free") started to protect some of the for_each_dpcm_be() loops, but
there are still many cases that were not modified.

This patch adds protection for all the remaining loops, with the
notable exception of the dpcm_be_dai_trigger(), where the lock is
already taken at a higher level, e.g. in snd_pcm_period_elapsed().

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-pcm.c | 86 ++++++++++++++++++++-------------------------
 1 file changed, 39 insertions(+), 47 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 797f0d114c83..5f2368059e14 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -42,15 +42,12 @@ void snd_soc_dpcm_fe_unlock_irq(struct snd_soc_pcm_runtime *fe, int stream)
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_unlock_irq);
 
 /* can this BE stop and free */
-static int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
-					 struct snd_soc_pcm_runtime *be, int stream);
-
 static int snd_soc_dpcm_can_be_free_stop_locked(struct snd_soc_pcm_runtime *fe,
 						struct snd_soc_pcm_runtime *be, int stream);
 
 /* can this BE perform a hw_params() */
-static int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
-				      struct snd_soc_pcm_runtime *be, int stream);
+static int snd_soc_dpcm_can_be_params_locked(struct snd_soc_pcm_runtime *fe,
+					     struct snd_soc_pcm_runtime *be, int stream);
 
 /* is the current PCM operation for this BE ? */
 static int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
@@ -335,6 +332,7 @@ int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
 {
 	struct snd_soc_dpcm *dpcm;
 
+	snd_soc_dpcm_fe_lock_irq(fe, dir);
 	for_each_dpcm_be(fe, dir, dpcm) {
 
 		struct snd_soc_pcm_runtime *be = dpcm->be;
@@ -348,6 +346,8 @@ int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
 
 		snd_soc_dapm_stream_event(be, dir, event);
 	}
+	snd_soc_dpcm_fe_unlock_irq(fe, dir);
+
 
 	snd_soc_dapm_stream_event(fe, dir, event);
 
@@ -1237,6 +1237,7 @@ void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	struct snd_soc_dpcm *dpcm, *d;
 
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be_safe(fe, stream, dpcm, d) {
 		dev_dbg(fe->dev, "ASoC: BE %s disconnect check for %s\n",
 				stream ? "capture" : "playback",
@@ -1254,12 +1255,11 @@ void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 
 		dpcm_remove_debugfs_state(dpcm);
 
-		snd_soc_dpcm_fe_lock_irq(fe, stream);
 		list_del(&dpcm->list_be);
 		list_del(&dpcm->list_fe);
-		snd_soc_dpcm_fe_unlock_irq(fe, stream);
 		kfree(dpcm);
 	}
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 }
 
 /* get BE for DAI widget and stream */
@@ -1386,6 +1386,7 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	int prune = 0;
 
 	/* Destroy any old FE <--> BE connections */
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		if (dpcm_be_is_active(dpcm, stream, *list_))
 			continue;
@@ -1397,6 +1398,7 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		dpcm_set_be_update_state(dpcm->be, stream, SND_SOC_DPCM_UPDATE_BE);
 		prune++;
 	}
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 
 	dev_dbg(fe->dev, "ASoC: found %d old BE paths for pruning\n", prune);
 	return prune;
@@ -1496,13 +1498,16 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 	struct snd_soc_dpcm *dpcm;
 
 	/* disable any enabled and non active backends */
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_pcm_substream *be_substream =
 			snd_soc_dpcm_get_substream(be, stream);
 
-		if (dpcm == last)
+		if (dpcm == last) {
+			snd_soc_dpcm_fe_unlock_irq(fe, stream);
 			return;
+		}
 
 		/* is this op for this BE ? */
 		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
@@ -1532,6 +1537,7 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 		be_substream->runtime = NULL;
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
 	}
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 }
 
 int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
@@ -1541,6 +1547,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 	int err, count = 0;
 
 	/* only startup BE DAIs that are either sinks or sources to this FE DAI */
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_pcm_substream *be_substream;
 
@@ -1591,11 +1598,13 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
 		count++;
 	}
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 
 	return count;
 
 unwind:
 	dpcm_be_dai_startup_rollback(fe, stream, dpcm);
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 
 	dev_err(fe->dev, "ASoC: %s() failed at %s (%d)\n",
 		__func__, be->dai_link->name, err);
@@ -1650,6 +1659,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 	 * if FE want to use it (= dpcm_merged_format)
 	 */
 
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_soc_pcm_stream *codec_stream;
@@ -1668,6 +1678,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 			soc_pcm_hw_update_format(hw, codec_stream);
 		}
 	}
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 }
 
 static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
@@ -1685,7 +1696,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 	 * It returns merged BE codec channel;
 	 * if FE want to use it (= dpcm_merged_chan)
 	 */
-
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_soc_pcm_stream *cpu_stream;
@@ -1716,6 +1727,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 			soc_pcm_hw_update_chan(hw, codec_stream);
 		}
 	}
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 }
 
 static void dpcm_runtime_setup_be_rate(struct snd_pcm_substream *substream)
@@ -1733,7 +1745,7 @@ static void dpcm_runtime_setup_be_rate(struct snd_pcm_substream *substream)
 	 * It returns merged BE codec channel;
 	 * if FE want to use it (= dpcm_merged_chan)
 	 */
-
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_soc_pcm_stream *pcm;
@@ -1753,6 +1765,7 @@ static void dpcm_runtime_setup_be_rate(struct snd_pcm_substream *substream)
 			soc_pcm_hw_update_rate(hw, pcm);
 		}
 	}
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 }
 
 static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
@@ -1775,6 +1788,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 	}
 
 	/* apply symmetry for BE */
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_pcm_substream *be_substream =
@@ -1800,6 +1814,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 		}
 	}
 error:
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 	if (err < 0)
 		dev_err(fe->dev, "ASoC: %s failed (%d)\n", __func__, err);
 
@@ -1875,6 +1890,7 @@ void dpcm_be_dai_hw_free(struct snd_soc_pcm_runtime *fe, int stream)
 
 	/* only hw_params backends that are either sinks or sources
 	 * to this frontend DAI */
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
 
 		struct snd_soc_pcm_runtime *be = dpcm->be;
@@ -1886,7 +1902,7 @@ void dpcm_be_dai_hw_free(struct snd_soc_pcm_runtime *fe, int stream)
 			continue;
 
 		/* only free hw when no longer used - check all FEs */
-		if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_free_stop_locked(fe, be, stream))
 			continue;
 
 		/* do not free hw if this BE is used by other FE */
@@ -1908,6 +1924,7 @@ void dpcm_be_dai_hw_free(struct snd_soc_pcm_runtime *fe, int stream)
 
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_HW_FREE;
 	}
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 }
 
 static int dpcm_fe_dai_hw_free(struct snd_pcm_substream *substream)
@@ -1941,6 +1958,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 	struct snd_soc_dpcm *dpcm;
 	int ret;
 
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		be = dpcm->be;
 		be_substream = snd_soc_dpcm_get_substream(be, stream);
@@ -1963,7 +1981,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 		       sizeof(struct snd_pcm_hw_params));
 
 		/* only allow hw_params() if no connected FEs are running */
-		if (!snd_soc_dpcm_can_be_params(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_params_locked(fe, be, stream))
 			continue;
 
 		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) &&
@@ -1980,6 +1998,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_HW_PARAMS;
 	}
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 	return 0;
 
 unwind:
@@ -1995,7 +2014,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 			continue;
 
 		/* only allow hw_free() if no connected FEs are running */
-		if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_free_stop_locked(fe, be, stream))
 			continue;
 
 		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) &&
@@ -2006,6 +2025,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 
 		soc_pcm_hw_free(be_substream);
 	}
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 
 	return ret;
 }
@@ -2290,6 +2310,7 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream)
 	struct snd_soc_dpcm *dpcm;
 	int ret = 0;
 
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
 
 		struct snd_soc_pcm_runtime *be = dpcm->be;
@@ -2315,6 +2336,7 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream)
 
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_PREPARE;
 	}
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 
 	if (ret < 0)
 		dev_err(fe->dev, "ASoC: %s() failed (%d)\n", __func__, ret);
@@ -2588,8 +2610,10 @@ static void dpcm_fe_dai_cleanup(struct snd_pcm_substream *fe_substream)
 	int stream = fe_substream->stream;
 
 	/* mark FE's links ready to prune */
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm)
 		dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 
 	dpcm_be_disconnect(fe, stream);
 
@@ -2905,22 +2929,6 @@ static int snd_soc_dpcm_check_state_locked(struct snd_soc_pcm_runtime *fe,
 	return ret;
 }
 
-static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
-				    struct snd_soc_pcm_runtime *be,
-				    int stream,
-				    const enum snd_soc_dpcm_state *states,
-				    int num_states)
-{
-	int ret;
-
-	snd_soc_dpcm_fe_lock_irq(fe, stream);
-	ret = snd_soc_dpcm_check_state_locked(fe, be, stream, states, num_states);
-	snd_soc_dpcm_fe_unlock_irq(fe, stream);
-
-	/* it's safe to do this BE DAI */
-	return ret;
-}
-
 /*
  * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
  * are not running, paused or suspended for the specified stream direction.
@@ -2937,27 +2945,11 @@ static int snd_soc_dpcm_can_be_free_stop_locked(struct snd_soc_pcm_runtime *fe,
 	return snd_soc_dpcm_check_state_locked(fe, be, stream, state, ARRAY_SIZE(state));
 }
 
-/*
- * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
- * are not running, paused or suspended for the specified stream direction.
- */
-static int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream)
-{
-	const enum snd_soc_dpcm_state state[] = {
-		SND_SOC_DPCM_STATE_START,
-		SND_SOC_DPCM_STATE_PAUSED,
-		SND_SOC_DPCM_STATE_SUSPEND,
-	};
-
-	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
-}
-
 /*
  * We can only change hw params a BE DAI if any of it's FE are not prepared,
  * running, paused or suspended for the specified stream direction.
  */
-static int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
+static int snd_soc_dpcm_can_be_params_locked(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
 {
 	const enum snd_soc_dpcm_state state[] = {
@@ -2967,5 +2959,5 @@ static int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 		SND_SOC_DPCM_STATE_PREPARE,
 	};
 
-	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
+	return snd_soc_dpcm_check_state_locked(fe, be, stream, state, ARRAY_SIZE(state));
 }
-- 
2.25.1

