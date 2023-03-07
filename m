Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD906AE1BF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:08:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3FA3147D;
	Tue,  7 Mar 2023 15:07:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3FA3147D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678198117;
	bh=abdWiLS/gAH3IjRfcffF8ijlft9sZSNoJZYJjq3tpaI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ck6cf+A1KlnfNg6BAnqGJYp6nNXPcjHDbvyBVtAv0F8UBbJUXXo+WNAjRCTsbfCmj
	 RSwe2frmYbQbuo3U2i54fziQ5//3bQKwaIU2AkpYPO8/uVW6UpSmBddoK1ANJo9gbH
	 qQobMvqsboeS77RBLSlBuYzuTNu39xHeu6iFf33M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C76E9F805A1;
	Tue,  7 Mar 2023 15:05:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C234CF80548; Tue,  7 Mar 2023 15:04:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8DE0F8052D
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8DE0F8052D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RK1HRzx/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197881; x=1709733881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=abdWiLS/gAH3IjRfcffF8ijlft9sZSNoJZYJjq3tpaI=;
  b=RK1HRzx/kRzrVkS46a1YudeJWw0MfQX100650BUaqLc1u41Hioh6Arkp
   RWFF3VfjK24WRtS14KBidrgk95fmjwtctKpkss0FatoXN7tjGucSbcloc
   AieMaHF2ROn1m036VOHtgTe2EvM6J2C18s2qY0A9QV87kOeiPH6oHqeby
   NM99jJ0hGDrsXJiTEAKWhUspQ0phVigiqk3tXWd85jps6QNrzAA+tjA70
   gCRWGf5VVFuobs5W0o3BAY+h39deC6zURfE+Wm4aRndjqEIFc+m2zy5ZT
   dDPsk5RvDyx7i+6HwVPJsV+cvcKwALcnOF4ibDG8ltMH4EkFU+7aERW2+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255287"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255287"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706981"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706981"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:37 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 10/14] ASoC: SOF: Intel: hda-dai: Use the topology IPC
 dai_config op
Date: Tue,  7 Mar 2023 16:04:31 +0200
Message-Id: <20230307140435.2808-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B7MOZZ2E5OUCJO6RYFZWGU2CXRODNC3H
X-Message-ID-Hash: B7MOZZ2E5OUCJO6RYFZWGU2CXRODNC3H
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B7MOZZ2E5OUCJO6RYFZWGU2CXRODNC3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Use the topology IPC dai_config to update the dai_config for
HDA DAI widgets.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 86 +++++++++++++++++------------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 9616cdba79b6..b726c0225110 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -29,6 +29,27 @@ MODULE_PARM_DESC(sof_use_tplg_nhlt, "SOF topology nhlt override");
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 
+static int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
+			  struct snd_sof_dai_config_data *data)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_soc_component *component = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	int ret;
+
+	if (tplg_ops && tplg_ops->dai_config) {
+		ret = tplg_ops->dai_config(sdev, swidget, flags, data);
+		if (ret < 0) {
+			dev_err(sdev->dev, "DAI config with flags %x failed for widget %s\n",
+				flags, w->name);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static const struct hda_dai_widget_dma_ops *
 hda_dai_get_ops(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
 {
@@ -232,33 +253,16 @@ static int hda_dai_widget_update(struct snd_soc_dapm_widget *w,
 	return hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE, &data);
 }
 
-static int hda_dai_hw_params_update(struct snd_pcm_substream *substream,
-				    struct snd_pcm_hw_params *params,
-				    struct snd_soc_dai *dai)
-{
-	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, substream->stream);
-	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
-	struct hdac_ext_stream *hext_stream;
-	int stream_tag;
-
-	hext_stream = ops->get_hext_stream(sdev, dai, substream);
-	if (!hext_stream)
-		return -EINVAL;
-
-	stream_tag = hdac_stream(hext_stream)->stream_tag;
-
-	/* set up the DAI widget and send the DAI_CONFIG with the new tag */
-	return hda_dai_widget_update(w, stream_tag - 1, true);
-}
-
 static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
 {
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, substream->stream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
 	struct hdac_ext_stream *hext_stream;
+	struct snd_sof_dai_config_data data = { 0 };
+	unsigned int flags = SOF_DAI_CONFIG_FLAGS_HW_PARAMS;
 	int ret;
 
 	if (!ops) {
@@ -274,35 +278,22 @@ static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	return hda_dai_hw_params_update(substream, params, dai);
-}
-
-
-static int hda_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
-{
-	struct snd_sof_widget *swidget = w->dobj.private;
-	struct snd_soc_component *component = swidget->scomp;
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
-	int ret = 0;
+	hext_stream = ops->get_hext_stream(sdev, dai, substream);
 
-	if (tplg_ops->dai_config) {
-		ret = tplg_ops->dai_config(sdev, swidget, SOF_DAI_CONFIG_FLAGS_PAUSE, NULL);
-		if (ret < 0)
-			dev_err(sdev->dev, "%s: DAI config failed for widget %s\n", __func__,
-				w->name);
-	}
+	flags |= SOF_DAI_CONFIG_FLAGS_2_STEP_STOP << SOF_DAI_CONFIG_FLAGS_QUIRK_SHIFT;
+	data.dai_data = hdac_stream(hext_stream)->stream_tag - 1;
 
-	return ret;
+	return hda_dai_config(w, flags, &data);
 }
 
 static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, substream->stream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct hdac_ext_stream *hext_stream;
-	int stream = substream->stream;
+	struct snd_sof_dai_config_data data = { 0 };
+	unsigned int flags = SOF_DAI_CONFIG_FLAGS_HW_PARAMS;
 	int ret;
 
 	hext_stream = ops->get_hext_stream(sdev, dai, substream);
@@ -315,7 +306,12 @@ static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 	if (ret < 0)
 		return ret;
 
-	return hda_dai_hw_params_update(substream, &rtd->dpcm[stream].hw_params, dai);
+	hext_stream = ops->get_hext_stream(sdev, dai, substream);
+
+	flags |= SOF_DAI_CONFIG_FLAGS_2_STEP_STOP << SOF_DAI_CONFIG_FLAGS_QUIRK_SHIFT;
+	data.dai_data = hdac_stream(hext_stream)->stream_tag - 1;
+
+	return hda_dai_config(w, flags, &data);
 }
 
 static int hda_dai_hw_free_ipc(int stream, /* direction */
@@ -356,7 +352,7 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = hda_dai_config_pause_push_ipc(w);
+		ret = hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_PAUSE, NULL);
 		if (ret < 0)
 			return ret;
 		break;
@@ -462,13 +458,17 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 static int hda_dai_hw_free(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, substream->stream);
+	struct snd_sof_dai_config_data data = { 0 };
 	int ret;
 
 	ret = hda_link_dma_hw_free(substream, dai);
 	if (ret < 0)
 		return ret;
 
-	return hda_dai_hw_free_ipc(substream->stream, dai);
+	data.dai_data = DMA_CHAN_INVALID;
+
+	return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_FREE, &data);
 }
 
 static const struct snd_soc_dai_ops ipc3_hda_dai_ops = {
-- 
2.39.2

