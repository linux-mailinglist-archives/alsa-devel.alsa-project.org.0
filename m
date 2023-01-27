Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E5467E471
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:03:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC350ECD;
	Fri, 27 Jan 2023 13:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC350ECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674820991;
	bh=2SerIkFyJLI9Kvb9oAS46V2qXRic/jO3U+kVf4WmVAY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R47yT+m88JrhYlrRld9PpDK4/OZcQZ5xvstWCMT7R5M08BYUU1ZKsl1+iBRHOGChL
	 Rrd6En6S0J63Qf1N/ne0hxbEw7VHEBLdpGLwoHo8xyH58ESrA9HgvRPwvs3wF4U95w
	 u/2r/rm/ShJles2YQT5iBJWgZIgCb+f/FxIUTKzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65296F80570;
	Fri, 27 Jan 2023 13:01:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C82F0F80549; Fri, 27 Jan 2023 13:00:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B416F80543
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:00:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B416F80543
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hqmHXQVV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820840; x=1706356840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2SerIkFyJLI9Kvb9oAS46V2qXRic/jO3U+kVf4WmVAY=;
 b=hqmHXQVVGKIx1bFFQoo5wqc2Ht/bJdLIV0is1qa1ucJx30hvvjn05Ihf
 nCltE7ft0lI3TORNYkU7BZXax1a+he8S0u8+mVnYug7X4Ms+QJNQrgGPH
 Ip5WQYmFJ5AW+k1HHj4f9npNs2b+SZkHswInOkXXMwCBe0aXyHpeLfkjq
 1DoSi3IBi+jR7kDcd/oucubmxKZsYbnxTZKgl9UblzVU19t3YaviqbDOr
 0PKtG83VlKQwIE6kI0LF/dnJHM5RQ84MLzrIQmbeQKUxDYnNWC/xsOBgH
 jtv6LEMsWr5bcJA9o6Ojou1nivzgkX6X6wHv1FIYy6tBlRfukF7JGVSnh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091828"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091828"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782137"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782137"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:36 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 05/18] ASoC: SOF: pcm: do not free widgets during suspend
 trigger
Date: Fri, 27 Jan 2023 14:00:18 +0200
Message-Id: <20230127120031.10709-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

IPC3 and IPC4 have different requirements for the order in which the FE
CPU and BE CPU DAI trigger callbacks must be invoked. With a regular PCM
start/stop, pipeline widgets are set up during hw_params and freed
during hw_free.

But when the system is suspended when a PCM is running,
pipeline widgets are freed during the SUSPEND trigger callback for the
FE CPU DAI. In order to avoid freeing the pipeline widgets before the BE
CPU DAI trigger is executed, the trigger order was modified in previous
contributions in the PCM dai_link_fixup callback to make sure that the BE
CPU DAI trigger stop/suspend is always invoked before the FE CPU DAI
trigger. But this contradicts the firmware requirement for IPC4 w.r.t.
ordering of pipeline triggers.

So, remove the freeing of pipeline widgets during FE CPU DAI suspend
trigger and handle it during system suspend when the
tear_down_all_pipelines() IPC op is invoked. This will be followed up
with a patch to fix the trigger order for IPC4.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c |  2 +-
 sound/soc/sof/ipc4-pcm.c      | 12 ------------
 sound/soc/sof/ipc4-topology.c |  2 +-
 sound/soc/sof/pcm.c           |  5 +----
 4 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 989395999d6e..72ac1725af0d 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2264,7 +2264,7 @@ static int sof_tear_down_left_over_pipelines(struct snd_sof_dev *sdev)
 		for_each_pcm_streams(dir) {
 			struct snd_pcm_substream *substream = spcm->stream[dir].substream;
 
-			if (!substream || !substream->runtime)
+			if (!substream || !substream->runtime || spcm->stream[dir].suspend_ignored)
 				continue;
 
 			if (spcm->stream[dir].list) {
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 96941bebc1f1..23de58d7d06b 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -183,7 +183,6 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct sof_ipc4_copier *ipc4_copier;
-	struct snd_soc_dpcm *dpcm;
 
 	if (!dai) {
 		dev_err(component->dev, "%s: No DAI found with name %s\n", __func__,
@@ -205,17 +204,6 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	rate->min = ipc4_copier->available_fmt.base_config->audio_fmt.sampling_frequency;
 	rate->max = rate->min;
 
-	/*
-	 * Set trigger order for capture to SND_SOC_DPCM_TRIGGER_PRE. This is required
-	 * to ensure that the BE DAI pipeline gets stopped/suspended before the FE DAI
-	 * pipeline gets triggered and the pipeline widgets are freed.
-	 */
-	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_CAPTURE, dpcm) {
-		struct snd_soc_pcm_runtime *fe = dpcm->fe;
-
-		fe->dai_link->trigger[SNDRV_PCM_STREAM_CAPTURE] = SND_SOC_DPCM_TRIGGER_PRE;
-	}
-
 	switch (ipc4_copier->dai_type) {
 	case SOF_DAI_INTEL_SSP:
 		ipc4_ssp_dai_config_pcm_params_match(sdev, (char *)rtd->dai_link->name, params);
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index ae8ec98bb4eb..3938ff2d998b 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2025,7 +2025,7 @@ static int sof_ipc4_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verif
 		for_each_pcm_streams(dir) {
 			struct snd_pcm_substream *substream = spcm->stream[dir].substream;
 
-			if (!substream || !substream->runtime)
+			if (!substream || !substream->runtime || spcm->stream[dir].suspend_ignored)
 				continue;
 
 			if (spcm->stream[dir].list) {
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 952fc698a586..34d40c5c629a 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -282,7 +282,6 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	struct snd_sof_pcm *spcm;
 	bool reset_hw_params = false;
-	bool free_widget_list = false;
 	bool ipc_first = false;
 	int ret = 0;
 
@@ -326,7 +325,6 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 			spcm->stream[substream->stream].suspend_ignored = true;
 			return 0;
 		}
-		free_widget_list = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
 		ipc_first = true;
@@ -353,8 +351,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 
 	/* free PCM if reset_hw_params is set and the STOP IPC is successful */
 	if (!ret && reset_hw_params)
-		ret = sof_pcm_stream_free(sdev, substream, spcm, substream->stream,
-					  free_widget_list);
+		ret = sof_pcm_stream_free(sdev, substream, spcm, substream->stream, false);
 
 	return ret;
 }
-- 
2.39.1

