Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7436D9CBC
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 17:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95A0AF2F;
	Thu,  6 Apr 2023 17:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95A0AF2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680796354;
	bh=v9n853gmUz13H6iQOLid2xaIWbXZ9nhj0XVb6F8IFlI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ln1tX9276y79g83VNxmNenK4/DUyXA8SZcwfLz1XpyTL5etOam5BdVDa7FCMBx5mi
	 mBL4xvO80ELcUoIp6s2Y3ADCqUDH5F+MwdBB8w2FM0v2ly95ZJilyFglyAHor011aG
	 LchhUC+2RMOOtAgheybWL7PTzuBLB5MnFXOnSfJ8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A938F8052D;
	Thu,  6 Apr 2023 17:51:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F035F8052E; Thu,  6 Apr 2023 17:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CD0EF80171
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CD0EF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TW7xGfQU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680796252; x=1712332252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v9n853gmUz13H6iQOLid2xaIWbXZ9nhj0XVb6F8IFlI=;
  b=TW7xGfQUyFm6ca7CrimY3yAtGIZRgAXsd8kYCRVfIxBBiHtlIdBgoa0l
   Fv62VIcoO+ck4oveDKCLCquXOXTZHV7kN1qQCO/2Fbj8DbkZ0uN9f1bRW
   netpTSf83tK+pj+bay0JglCIrLuKkcRS0UEuNazIx9/BQGxstgTRQbJOD
   ov/i22iQq9tDjyhAPn/w1SFRy6KrL2cjj1JjfSSu/S2BTZl2hPK4I5JXE
   zM9cW0F7TQo2N9xbFYZFkumtjf1Qj8D50hB6LgHJwOd/mYT9ZgjwYmXVv
   DjomMIFf+NGzoGdTArA0uSAEg7QvlZoknrodtxN/79ShG2v5bCMZKWywz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331407027"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="331407027"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="830802327"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="830802327"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.83.247])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:50:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: Use no_reply calls for TX
Date: Thu,  6 Apr 2023 10:50:26 -0500
Message-Id: <20230406155026.18723-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230406155026.18723-1-pierre-louis.bossart@linux.intel.com>
References: <20230406155026.18723-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BJPKDWM5VFL62KG22TE2H2OX5BO62ZPX
X-Message-ID-Hash: BJPKDWM5VFL62KG22TE2H2OX5BO62ZPX
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org,
 Curtis Malainey <cujomalainey@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJPKDWM5VFL62KG22TE2H2OX5BO62ZPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Convert all existing calls that pass "NULL, 0" for reply data to the new
no_reply calls. Also convert any calls that pass in data but don't
actually parse the result.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/compress.c                  | 12 +++------
 sound/soc/sof/intel/hda-loader.c          |  2 +-
 sound/soc/sof/ipc3-dtrace.c               | 12 +++------
 sound/soc/sof/ipc3-pcm.c                  |  6 ++---
 sound/soc/sof/ipc3-topology.c             | 33 +++++++----------------
 sound/soc/sof/ipc3.c                      | 12 +++------
 sound/soc/sof/ipc4-pcm.c                  |  6 ++---
 sound/soc/sof/ipc4-topology.c             | 10 +++----
 sound/soc/sof/sof-client-ipc-flood-test.c |  3 +--
 sound/soc/sof/sof-client-probes-ipc3.c    | 12 +++------
 sound/soc/sof/sof-client-probes-ipc4.c    |  4 +--
 11 files changed, 38 insertions(+), 74 deletions(-)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 8d205eb16d2f..7196516f8506 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -135,7 +135,6 @@ static int sof_compr_free(struct snd_soc_component *component,
 	struct sof_compr_stream *sstream = cstream->runtime->private_data;
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct sof_ipc_stream stream;
-	struct sof_ipc_reply reply;
 	struct snd_sof_pcm *spcm;
 	int ret = 0;
 
@@ -148,8 +147,7 @@ static int sof_compr_free(struct snd_soc_component *component,
 	stream.comp_id = spcm->stream[cstream->direction].comp_id;
 
 	if (spcm->prepared[cstream->direction]) {
-		ret = sof_ipc_tx_message(sdev->ipc, &stream, sizeof(stream),
-					 &reply, sizeof(reply));
+		ret = sof_ipc_tx_message_no_reply(sdev->ipc, &stream, sizeof(stream));
 		if (!ret)
 			spcm->prepared[cstream->direction] = false;
 	}
@@ -167,7 +165,6 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *crtd = cstream->runtime;
-	struct sof_ipc_pcm_params_reply ipc_params_reply;
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
 	struct sof_compr_stream *sstream;
@@ -231,8 +228,7 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 
 	memcpy((u8 *)pcm->params.ext_data, &params->codec, ext_data_size);
 
-	ret = sof_ipc_tx_message(sdev->ipc, pcm, sizeof(*pcm) + ext_data_size,
-				 &ipc_params_reply, sizeof(ipc_params_reply));
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, pcm, sizeof(*pcm) + ext_data_size);
 	if (ret < 0) {
 		dev_err(component->dev, "error ipc failed\n");
 		goto out;
@@ -273,7 +269,6 @@ static int sof_compr_trigger(struct snd_soc_component *component,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct sof_ipc_stream stream;
-	struct sof_ipc_reply reply;
 	struct snd_sof_pcm *spcm;
 
 	spcm = snd_sof_find_spcm_dai(component, rtd);
@@ -302,8 +297,7 @@ static int sof_compr_trigger(struct snd_soc_component *component,
 		break;
 	}
 
-	return sof_ipc_tx_message(sdev->ipc, &stream, sizeof(stream),
-				  &reply, sizeof(reply));
+	return sof_ipc_tx_message_no_reply(sdev->ipc, &stream, sizeof(stream));
 }
 
 static int sof_compr_copy_playback(struct snd_compr_runtime *rtd,
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index de8d9ad89bc7..50ce6b190002 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -557,7 +557,7 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 		goto cleanup;
 	}
 
-	ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &msg, 0);
 
 	ret1 = cl_trigger(sdev, hext_stream, SNDRV_PCM_TRIGGER_STOP);
 	if (ret1 < 0) {
diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index b815b0244d9e..1d3bca2d28dd 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -150,7 +150,6 @@ static int ipc3_trace_update_filter(struct snd_sof_dev *sdev, int num_elems,
 				    struct sof_ipc_trace_filter_elem *elems)
 {
 	struct sof_ipc_trace_filter *msg;
-	struct sof_ipc_reply reply;
 	size_t size;
 	int ret;
 
@@ -172,13 +171,13 @@ static int ipc3_trace_update_filter(struct snd_sof_dev *sdev, int num_elems,
 		dev_err(sdev->dev, "enabling device failed: %d\n", ret);
 		goto error;
 	}
-	ret = sof_ipc_tx_message(sdev->ipc, msg, msg->hdr.size, &reply, sizeof(reply));
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, msg, msg->hdr.size);
 	pm_runtime_mark_last_busy(sdev->dev);
 	pm_runtime_put_autosuspend(sdev->dev);
 
 error:
 	kfree(msg);
-	return ret ? ret : reply.error;
+	return ret;
 }
 
 static ssize_t dfsentry_trace_filter_write(struct file *file, const char __user *from,
@@ -434,7 +433,6 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
 	struct sof_ipc_dma_trace_params_ext params;
-	struct sof_ipc_reply ipc_reply;
 	int ret;
 
 	if (!sdev->fw_trace_is_supported)
@@ -474,7 +472,7 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 
 	/* send IPC to the DSP */
 	priv->dtrace_state = SOF_DTRACE_INITIALIZING;
-	ret = sof_ipc_tx_message(sdev->ipc, &params, sizeof(params), &ipc_reply, sizeof(ipc_reply));
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &params, sizeof(params));
 	if (ret < 0) {
 		dev_err(sdev->dev, "can't set params for DMA for trace %d\n", ret);
 		goto trace_release;
@@ -604,7 +602,6 @@ static void ipc3_dtrace_release(struct snd_sof_dev *sdev, bool only_stop)
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
 	struct sof_ipc_cmd_hdr hdr;
-	struct sof_ipc_reply ipc_reply;
 	int ret;
 
 	if (!sdev->fw_trace_is_supported || priv->dtrace_state == SOF_DTRACE_DISABLED)
@@ -623,8 +620,7 @@ static void ipc3_dtrace_release(struct snd_sof_dev *sdev, bool only_stop)
 		hdr.size = sizeof(hdr);
 		hdr.cmd = SOF_IPC_GLB_TRACE_MSG | SOF_IPC_TRACE_DMA_FREE;
 
-		ret = sof_ipc_tx_message(sdev->ipc, &hdr, hdr.size,
-					 &ipc_reply, sizeof(ipc_reply));
+		ret = sof_ipc_tx_message_no_reply(sdev->ipc, &hdr, hdr.size);
 		if (ret < 0)
 			dev_err(sdev->dev, "DMA_TRACE_FREE failed with error: %d\n", ret);
 	}
diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index b7f1eb21ca26..304faf6425ab 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -19,7 +19,6 @@ static int sof_ipc3_pcm_hw_free(struct snd_soc_component *component,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct sof_ipc_stream stream;
-	struct sof_ipc_reply reply;
 	struct snd_sof_pcm *spcm;
 
 	spcm = snd_sof_find_spcm_dai(component, rtd);
@@ -34,7 +33,7 @@ static int sof_ipc3_pcm_hw_free(struct snd_soc_component *component,
 	stream.comp_id = spcm->stream[substream->stream].comp_id;
 
 	/* send IPC to the DSP */
-	return sof_ipc_tx_message(sdev->ipc, &stream, sizeof(stream), &reply, sizeof(reply));
+	return sof_ipc_tx_message_no_reply(sdev->ipc, &stream, sizeof(stream));
 }
 
 static int sof_ipc3_pcm_hw_params(struct snd_soc_component *component,
@@ -146,7 +145,6 @@ static int sof_ipc3_pcm_trigger(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct sof_ipc_stream stream;
-	struct sof_ipc_reply reply;
 	struct snd_sof_pcm *spcm;
 
 	spcm = snd_sof_find_spcm_dai(component, rtd);
@@ -178,7 +176,7 @@ static int sof_ipc3_pcm_trigger(struct snd_soc_component *component,
 	}
 
 	/* send IPC to the DSP */
-	return sof_ipc_tx_message(sdev->ipc, &stream, sizeof(stream), &reply, sizeof(reply));
+	return sof_ipc_tx_message_no_reply(sdev->ipc, &stream, sizeof(stream));
 }
 
 static void ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev, const char *link_name,
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index b1f425b39db9..fc1eb8e2de2c 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -1627,7 +1627,6 @@ static void sof_ipc3_widget_free_comp_dai(struct snd_sof_widget *swidget)
 static int sof_ipc3_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *sroute)
 {
 	struct sof_ipc_pipe_comp_connect connect;
-	struct sof_ipc_reply reply;
 	int ret;
 
 	connect.hdr.size = sizeof(connect);
@@ -1640,7 +1639,7 @@ static int sof_ipc3_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 		sroute->sink_widget->widget->name);
 
 	/* send ipc */
-	ret = sof_ipc_tx_message(sdev->ipc, &connect, sizeof(connect), &reply, sizeof(reply));
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &connect, sizeof(connect));
 	if (ret < 0)
 		dev_err(sdev->dev, "%s: route %s -> %s failed\n", __func__,
 			sroute->src_widget->widget->name, sroute->sink_widget->widget->name);
@@ -1789,7 +1788,7 @@ static int sof_ipc3_control_free(struct snd_sof_dev *sdev, struct snd_sof_contro
 	fcomp.id = scontrol->comp_id;
 
 	/* send IPC to the DSP */
-	return sof_ipc_tx_message(sdev->ipc, &fcomp, sizeof(fcomp), NULL, 0);
+	return sof_ipc_tx_message_no_reply(sdev->ipc, &fcomp, sizeof(fcomp));
 }
 
 /* send pcm params ipc */
@@ -1797,7 +1796,6 @@ static int sof_ipc3_keyword_detect_pcm_params(struct snd_sof_widget *swidget, in
 {
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct sof_ipc_pcm_params_reply ipc_params_reply;
 	struct snd_pcm_hw_params *params;
 	struct sof_ipc_pcm_params pcm;
 	struct snd_sof_pcm *spcm;
@@ -1841,8 +1839,7 @@ static int sof_ipc3_keyword_detect_pcm_params(struct snd_sof_widget *swidget, in
 	}
 
 	/* send IPC to the DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, &pcm, sizeof(pcm),
-				 &ipc_params_reply, sizeof(ipc_params_reply));
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &pcm, sizeof(pcm));
 	if (ret < 0)
 		dev_err(scomp->dev, "%s: PCM params failed for %s\n", __func__,
 			swidget->widget->name);
@@ -1856,7 +1853,6 @@ static int sof_ipc3_keyword_detect_trigger(struct snd_sof_widget *swidget, int c
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc_stream stream;
-	struct sof_ipc_reply reply;
 	int ret;
 
 	/* set IPC stream params */
@@ -1865,7 +1861,7 @@ static int sof_ipc3_keyword_detect_trigger(struct snd_sof_widget *swidget, int c
 	stream.comp_id = swidget->comp_id;
 
 	/* send IPC to the DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, &stream, sizeof(stream), &reply, sizeof(reply));
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &stream, sizeof(stream));
 	if (ret < 0)
 		dev_err(scomp->dev, "%s: Failed to trigger %s\n", __func__, swidget->widget->name);
 
@@ -1982,7 +1978,6 @@ static int sof_ipc3_widget_bind_event(struct snd_soc_component *scomp,
 static int sof_ipc3_complete_pipeline(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	struct sof_ipc_pipe_ready ready;
-	struct sof_ipc_reply reply;
 	int ret;
 
 	dev_dbg(sdev->dev, "tplg: complete pipeline %s id %d\n",
@@ -1993,7 +1988,7 @@ static int sof_ipc3_complete_pipeline(struct snd_sof_dev *sdev, struct snd_sof_w
 	ready.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_PIPE_COMPLETE;
 	ready.comp_id = swidget->comp_id;
 
-	ret = sof_ipc_tx_message(sdev->ipc, &ready, sizeof(ready), &reply, sizeof(reply));
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &ready, sizeof(ready));
 	if (ret < 0)
 		return ret;
 
@@ -2009,7 +2004,6 @@ static int sof_ipc3_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 		},
 		.id = swidget->comp_id,
 	};
-	struct sof_ipc_reply reply;
 	int ret;
 
 	if (!swidget->private)
@@ -2029,8 +2023,7 @@ static int sof_ipc3_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 		break;
 	}
 
-	ret = sof_ipc_tx_message(sdev->ipc, &ipc_free, sizeof(ipc_free),
-				 &reply, sizeof(reply));
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &ipc_free, sizeof(ipc_free));
 	if (ret < 0)
 		dev_err(sdev->dev, "failed to free widget %s\n", swidget->widget->name);
 
@@ -2044,7 +2037,6 @@ static int sof_ipc3_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 	struct snd_sof_dai *dai = swidget->private;
 	struct sof_dai_private_data *private;
 	struct sof_ipc_dai_config *config;
-	struct sof_ipc_reply reply;
 	int ret = 0;
 
 	if (!dai || !dai->private) {
@@ -2118,8 +2110,7 @@ static int sof_ipc3_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 
 	/* only send the IPC if the widget is set up in the DSP */
 	if (swidget->use_count > 0) {
-		ret = sof_ipc_tx_message(sdev->ipc, config, config->hdr.size,
-					 &reply, sizeof(reply));
+		ret = sof_ipc_tx_message_no_reply(sdev->ipc, config, config->hdr.size);
 		if (ret < 0)
 			dev_err(sdev->dev, "Failed to set dai config for %s\n", dai->name);
 
@@ -2132,7 +2123,6 @@ static int sof_ipc3_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 
 static int sof_ipc3_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
-	struct sof_ipc_comp_reply reply;
 	int ret;
 
 	if (!swidget->private)
@@ -2146,8 +2136,7 @@ static int sof_ipc3_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		struct sof_dai_private_data *dai_data = dai->private;
 		struct sof_ipc_comp *comp = &dai_data->comp_dai->comp;
 
-		ret = sof_ipc_tx_message(sdev->ipc, dai_data->comp_dai,
-					 comp->hdr.size, &reply, sizeof(reply));
+		ret = sof_ipc_tx_message_no_reply(sdev->ipc, dai_data->comp_dai, comp->hdr.size);
 		break;
 	}
 	case snd_soc_dapm_scheduler:
@@ -2155,8 +2144,7 @@ static int sof_ipc3_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		struct sof_ipc_pipe_new *pipeline;
 
 		pipeline = swidget->private;
-		ret = sof_ipc_tx_message(sdev->ipc, pipeline, sizeof(*pipeline),
-					 &reply, sizeof(reply));
+		ret = sof_ipc_tx_message_no_reply(sdev->ipc, pipeline, sizeof(*pipeline));
 		break;
 	}
 	default:
@@ -2164,8 +2152,7 @@ static int sof_ipc3_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		struct sof_ipc_cmd_hdr *hdr;
 
 		hdr = swidget->private;
-		ret = sof_ipc_tx_message(sdev->ipc, swidget->private, hdr->size,
-					 &reply, sizeof(reply));
+		ret = sof_ipc_tx_message_no_reply(sdev->ipc, swidget->private, hdr->size);
 		break;
 	}
 	}
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 4493bbd7faf1..c67767742093 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -1044,15 +1044,13 @@ static int sof_ipc3_set_core_state(struct snd_sof_dev *sdev, int core_idx, bool
 		.hdr.size = sizeof(core_cfg),
 		.hdr.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CORE_ENABLE,
 	};
-	struct sof_ipc_reply reply;
 
 	if (on)
 		core_cfg.enable_mask = sdev->enabled_cores_mask | BIT(core_idx);
 	else
 		core_cfg.enable_mask = sdev->enabled_cores_mask & ~BIT(core_idx);
 
-	return sof_ipc3_tx_msg(sdev, &core_cfg, sizeof(core_cfg),
-			       &reply, sizeof(reply), false);
+	return sof_ipc3_tx_msg(sdev, &core_cfg, sizeof(core_cfg), NULL, 0, false);
 }
 
 static int sof_ipc3_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
@@ -1061,11 +1059,9 @@ static int sof_ipc3_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
 		.hdr.size = sizeof(pm_ctx),
 		.hdr.cmd = SOF_IPC_GLB_PM_MSG | cmd,
 	};
-	struct sof_ipc_reply reply;
 
 	/* send ctx save ipc to dsp */
-	return sof_ipc3_tx_msg(sdev, &pm_ctx, sizeof(pm_ctx),
-			       &reply, sizeof(reply), false);
+	return sof_ipc3_tx_msg(sdev, &pm_ctx, sizeof(pm_ctx), NULL, 0, false);
 }
 
 static int sof_ipc3_ctx_save(struct snd_sof_dev *sdev)
@@ -1081,7 +1077,6 @@ static int sof_ipc3_ctx_restore(struct snd_sof_dev *sdev)
 static int sof_ipc3_set_pm_gate(struct snd_sof_dev *sdev, u32 flags)
 {
 	struct sof_ipc_pm_gate pm_gate;
-	struct sof_ipc_reply reply;
 
 	memset(&pm_gate, 0, sizeof(pm_gate));
 
@@ -1091,8 +1086,7 @@ static int sof_ipc3_set_pm_gate(struct snd_sof_dev *sdev, u32 flags)
 	pm_gate.flags = flags;
 
 	/* send pm_gate ipc to dsp */
-	return sof_ipc_tx_message_no_pm(sdev->ipc, &pm_gate, sizeof(pm_gate),
-					&reply, sizeof(reply));
+	return sof_ipc_tx_message_no_pm_no_reply(sdev->ipc, &pm_gate, sizeof(pm_gate));
 }
 
 static const struct sof_ipc_pm_ops ipc3_pm_ops = {
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index a2cd21256e44..6a4c91ea47ed 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -39,7 +39,7 @@ static int sof_ipc4_set_multi_pipeline_state(struct snd_sof_dev *sdev, u32 state
 	msg.data_size = ipc_size;
 	msg.data_ptr = trigger_list;
 
-	return sof_ipc_tx_message(sdev->ipc, &msg, ipc_size, NULL, 0);
+	return sof_ipc_tx_message_no_reply(sdev->ipc, &msg, ipc_size);
 }
 
 int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state)
@@ -57,7 +57,7 @@ int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state)
 
 	msg.primary = primary;
 
-	return sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
+	return sof_ipc_tx_message_no_reply(sdev->ipc, &msg, 0);
 }
 EXPORT_SYMBOL(sof_ipc4_set_pipeline_state);
 
@@ -272,7 +272,7 @@ static int sof_ipc4_chain_dma_trigger(struct snd_sof_dev *sdev,
 	if (enable)
 		msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_ENABLE_MASK;
 
-	return sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
+	return sof_ipc_tx_message_no_reply(sdev->ipc, &msg, 0);
 }
 
 static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f493b4ff210b..059eebf0a687 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2118,7 +2118,7 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	msg->data_size = ipc_size;
 	msg->data_ptr = ipc_data;
 
-	ret = sof_ipc_tx_message(sdev->ipc, msg, ipc_size, NULL, 0);
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, msg, ipc_size);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to create module %s\n", swidget->widget->name);
 
@@ -2162,7 +2162,7 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 
 		msg.primary = header;
 
-		ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
+		ret = sof_ipc_tx_message_no_reply(sdev->ipc, &msg, 0);
 		if (ret < 0)
 			dev_err(sdev->dev, "failed to free pipeline widget %s\n",
 				swidget->widget->name);
@@ -2320,7 +2320,7 @@ static int sof_ipc4_set_copier_sink_format(struct snd_sof_dev *sdev,
 	msg.primary = header;
 	msg.extension = extension;
 
-	return sof_ipc_tx_message(sdev->ipc, &msg, msg.data_size, NULL, 0);
+	return sof_ipc_tx_message_no_reply(sdev->ipc, &msg, msg.data_size);
 }
 
 static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *sroute)
@@ -2405,7 +2405,7 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 	msg.primary = header;
 	msg.extension = extension;
 
-	ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &msg, 0);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to bind modules %s:%d -> %s:%d\n",
 			src_widget->widget->name, sroute->src_queue_id,
@@ -2464,7 +2464,7 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 	msg.primary = header;
 	msg.extension = extension;
 
-	ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &msg, 0);
 	if (ret < 0)
 		dev_err(sdev->dev, "failed to unbind modules %s:%d -> %s:%d\n",
 			src_widget->widget->name, sroute->src_queue_id,
diff --git a/sound/soc/sof/sof-client-ipc-flood-test.c b/sound/soc/sof/sof-client-ipc-flood-test.c
index 4bdecd80248a..c0d6723aed59 100644
--- a/sound/soc/sof/sof-client-ipc-flood-test.c
+++ b/sound/soc/sof/sof-client-ipc-flood-test.c
@@ -64,7 +64,6 @@ static int sof_debug_ipc_flood_test(struct sof_client_dev *cdev,
 	struct sof_ipc_flood_priv *priv = cdev->data;
 	struct device *dev = &cdev->auxdev.dev;
 	struct sof_ipc_cmd_hdr hdr;
-	struct sof_ipc_reply reply;
 	u64 min_response_time = U64_MAX;
 	ktime_t start, end, test_end;
 	u64 avg_response_time = 0;
@@ -84,7 +83,7 @@ static int sof_debug_ipc_flood_test(struct sof_client_dev *cdev,
 	/* send test IPC's */
 	while (1) {
 		start = ktime_get();
-		ret = sof_client_ipc_tx_message(cdev, &hdr, &reply, sizeof(reply));
+		ret = sof_client_ipc_tx_message_no_reply(cdev, &hdr);
 		end = ktime_get();
 
 		if (ret < 0)
diff --git a/sound/soc/sof/sof-client-probes-ipc3.c b/sound/soc/sof/sof-client-probes-ipc3.c
index ef768db5f04d..5e8eb19582a8 100644
--- a/sound/soc/sof/sof-client-probes-ipc3.c
+++ b/sound/soc/sof/sof-client-probes-ipc3.c
@@ -65,7 +65,6 @@ static int ipc3_probes_init(struct sof_client_dev *cdev, u32 stream_tag,
 {
 	struct sof_ipc_probe_dma_add_params *msg;
 	size_t size = struct_size(msg, dma, 1);
-	struct sof_ipc_reply reply;
 	int ret;
 
 	msg = kmalloc(size, GFP_KERNEL);
@@ -77,7 +76,7 @@ static int ipc3_probes_init(struct sof_client_dev *cdev, u32 stream_tag,
 	msg->dma[0].stream_tag = stream_tag;
 	msg->dma[0].dma_buffer_size = buffer_size;
 
-	ret = sof_client_ipc_tx_message(cdev, msg, &reply, sizeof(reply));
+	ret = sof_client_ipc_tx_message_no_reply(cdev, msg);
 	kfree(msg);
 	return ret;
 }
@@ -93,12 +92,11 @@ static int ipc3_probes_init(struct sof_client_dev *cdev, u32 stream_tag,
 static int ipc3_probes_deinit(struct sof_client_dev *cdev)
 {
 	struct sof_ipc_cmd_hdr msg;
-	struct sof_ipc_reply reply;
 
 	msg.size = sizeof(msg);
 	msg.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_DEINIT;
 
-	return sof_client_ipc_tx_message(cdev, &msg, &reply, sizeof(reply));
+	return sof_client_ipc_tx_message_no_reply(cdev, &msg);
 }
 
 static int ipc3_probes_info(struct sof_client_dev *cdev, unsigned int cmd,
@@ -180,7 +178,6 @@ static int ipc3_probes_points_add(struct sof_client_dev *cdev,
 {
 	struct sof_ipc_probe_point_add_params *msg;
 	size_t size = struct_size(msg, desc, num_desc);
-	struct sof_ipc_reply reply;
 	int ret;
 
 	msg = kmalloc(size, GFP_KERNEL);
@@ -191,7 +188,7 @@ static int ipc3_probes_points_add(struct sof_client_dev *cdev,
 	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_POINT_ADD;
 	memcpy(&msg->desc[0], desc, size - sizeof(*msg));
 
-	ret = sof_client_ipc_tx_message(cdev, msg, &reply, sizeof(reply));
+	ret = sof_client_ipc_tx_message_no_reply(cdev, msg);
 	kfree(msg);
 	return ret;
 }
@@ -211,7 +208,6 @@ static int ipc3_probes_points_remove(struct sof_client_dev *cdev,
 {
 	struct sof_ipc_probe_point_remove_params *msg;
 	size_t size = struct_size(msg, buffer_id, num_buffer_id);
-	struct sof_ipc_reply reply;
 	int ret;
 
 	msg = kmalloc(size, GFP_KERNEL);
@@ -222,7 +218,7 @@ static int ipc3_probes_points_remove(struct sof_client_dev *cdev,
 	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_POINT_REMOVE;
 	memcpy(&msg->buffer_id[0], buffer_id, size - sizeof(*msg));
 
-	ret = sof_client_ipc_tx_message(cdev, msg, &reply, sizeof(reply));
+	ret = sof_client_ipc_tx_message_no_reply(cdev, msg);
 	kfree(msg);
 	return ret;
 }
diff --git a/sound/soc/sof/sof-client-probes-ipc4.c b/sound/soc/sof/sof-client-probes-ipc4.c
index 66fa7c2f390a..ea21ef176c42 100644
--- a/sound/soc/sof/sof-client-probes-ipc4.c
+++ b/sound/soc/sof/sof-client-probes-ipc4.c
@@ -129,7 +129,7 @@ static int ipc4_probes_init(struct sof_client_dev *cdev, u32 stream_tag,
 	msg.data_size = sizeof(cfg);
 	msg.data_ptr = &cfg;
 
-	return sof_client_ipc_tx_message(cdev, &msg, NULL, 0);
+	return sof_client_ipc_tx_message_no_reply(cdev, &msg);
 }
 
 /**
@@ -156,7 +156,7 @@ static int ipc4_probes_deinit(struct sof_client_dev *cdev)
 	msg.data_size = 0;
 	msg.data_ptr = NULL;
 
-	return sof_client_ipc_tx_message(cdev, &msg, NULL, 0);
+	return sof_client_ipc_tx_message_no_reply(cdev, &msg);
 }
 
 /**
-- 
2.37.2

