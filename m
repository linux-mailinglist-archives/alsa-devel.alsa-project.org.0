Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DEA6ADDE4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 12:47:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BC281435;
	Tue,  7 Mar 2023 12:46:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BC281435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678189664;
	bh=DH1eGZx+ookTic0c1M9VLlTOz0P4dr0TCkjfubr0aAk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iL7TTf92513zOzSNGtP2MSOtL1DeFBrGpA4WHuQTr3wpRLQheUs4op5E5+hAKTJqi
	 NetrDjNnd1Fhuyx/NLF7ghIqq00K9K4TOZsCvE9MzXaFSuPHUvBpmCauuYQ25d80dJ
	 j7jVygt4PuHhSVd6FgWt1ZkY7qEsB16eZHxJ+iTw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1E74F80236;
	Tue,  7 Mar 2023 12:46:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 681E9F80431; Tue,  7 Mar 2023 12:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B909FF800C9
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 12:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B909FF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kObSOAL3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678189600; x=1709725600;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DH1eGZx+ookTic0c1M9VLlTOz0P4dr0TCkjfubr0aAk=;
  b=kObSOAL3YzoH83//tp2lltss1wzp9TwkFlEzXuv29da0cwmqHGmqlP3E
   BFpRtjW8z5axOlpicoZIfDUgd9nhDkXTH1hQ8D9KhMgNgyQ1ZMUH0zFR1
   VZ/l2h+rV3U+RoFqOnS5ktn3qx/azhYzvCUcJq3V9STXw2t6Rrom+k6Pg
   bTXFn3IZApYq00qpjhgzEjOlP94B7m3jhyiX6JRpd/bOtWb84y8CVcsaP
   zVb7tl0ZVUzEpXnWbkPocX12pI2Nerd97mSoUxmNjCdGDDZmZVF72KtB9
   49Xd2jj4c23v3eLw8uQIgRD6ybnPslVR28327bQIKoyMBIqAux8lSXoIa
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337348583"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="337348583"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:46:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005831328"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="1005831328"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:46:17 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: sof-audio: Fix broken early bclk feature for SSP
Date: Tue,  7 Mar 2023 13:46:39 +0200
Message-Id: <20230307114639.4553-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6SF4GBMNCF3RYE6IEIIHCC2RXLM7JVQA
X-Message-ID-Hash: 6SF4GBMNCF3RYE6IEIIHCC2RXLM7JVQA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SF4GBMNCF3RYE6IEIIHCC2RXLM7JVQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

With the removal of widget setup during BE hw_params, the DAI config IPC
is never sent with the SOF_DAI_CONFIG_FLAGS_HW_PARAMS. This means that
the early bit clock feature required for certain codecs will be broken.

Fix this by saving the config flags sent during BE DAI hw_params and
reusing it when the DAI_CONFIG IPC is sent after the DAI widget is set
up. Also, free the DAI config before the widget is freed.

The DAI_CONFIG IPC sent during the sof_widget_free() does not have the
DAI index information. So, save the dai_index in the config during
hw_params and reuse it during hw_free.

For IPC4, do not clear the node ID during hw_free. It will be needed for
freeing the group_ida during unprepare.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 32 ++++++++++++++++++++++++++++++--
 sound/soc/sof/ipc4-topology.c | 15 +++++++++++++--
 sound/soc/sof/sof-audio.c     | 28 +++++++++++++++++++++++++---
 3 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index dceb78bfe17c..b1f425b39db9 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2081,7 +2081,9 @@ static int sof_ipc3_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 		break;
 	case SOF_DAI_INTEL_ALH:
 		if (data) {
-			config->dai_index = data->dai_index;
+			/* save the dai_index during hw_params and reuse it for hw_free */
+			if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS)
+				config->dai_index = data->dai_index;
 			config->alh.stream_id = data->dai_data;
 		}
 		break;
@@ -2089,7 +2091,30 @@ static int sof_ipc3_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 		break;
 	}
 
-	config->flags = flags;
+	/*
+	 * The dai_config op is invoked several times and the flags argument varies as below:
+	 * BE DAI hw_params: When the op is invoked during the BE DAI hw_params, flags contains
+	 * SOF_DAI_CONFIG_FLAGS_HW_PARAMS along with quirks
+	 * FE DAI hw_params: When invoked during FE DAI hw_params after the DAI widget has
+	 * just been set up in the DSP, flags is set to SOF_DAI_CONFIG_FLAGS_HW_PARAMS with no
+	 * quirks
+	 * BE DAI trigger: When invoked during the BE DAI trigger, flags is set to
+	 * SOF_DAI_CONFIG_FLAGS_PAUSE and contains no quirks
+	 * BE DAI hw_free: When invoked during the BE DAI hw_free, flags is set to
+	 * SOF_DAI_CONFIG_FLAGS_HW_FREE and contains no quirks
+	 * FE DAI hw_free: When invoked during the FE DAI hw_free, flags is set to
+	 * SOF_DAI_CONFIG_FLAGS_HW_FREE and contains no quirks
+	 *
+	 * The DAI_CONFIG IPC is sent to the DSP, only after the widget is set up during the FE
+	 * DAI hw_params. But since the BE DAI hw_params precedes the FE DAI hw_params, the quirks
+	 * need to be preserved when assigning the flags before sending the IPC.
+	 * For the case of PAUSE/HW_FREE, since there are no quirks, flags can be used as is.
+	 */
+
+	if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS)
+		config->flags |= flags;
+	else
+		config->flags = flags;
 
 	/* only send the IPC if the widget is set up in the DSP */
 	if (swidget->use_count > 0) {
@@ -2097,6 +2122,9 @@ static int sof_ipc3_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 					 &reply, sizeof(reply));
 		if (ret < 0)
 			dev_err(sdev->dev, "Failed to set dai config for %s\n", dai->name);
+
+		/* clear the flags once the IPC has been sent even if it fails */
+		config->flags = SOF_DAI_CONFIG_FLAGS_NONE;
 	}
 
 	return ret;
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 3e27c7a48ebd..37927e9a700d 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -980,6 +980,7 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 
 		ipc4_copier = dai->private;
 		if (ipc4_copier->dai_type == SOF_DAI_INTEL_ALH) {
+			struct sof_ipc4_copier_data *copier_data = &ipc4_copier->data;
 			struct sof_ipc4_alh_configuration_blob *blob;
 			unsigned int group_id;
 
@@ -989,6 +990,9 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 					   ALH_MULTI_GTW_BASE;
 				ida_free(&alh_group_ida, group_id);
 			}
+
+			/* clear the node ID */
+			copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
 		}
 	}
 
@@ -1940,8 +1944,15 @@ static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 		pipeline->skip_during_fe_trigger = true;
 		fallthrough;
 	case SOF_DAI_INTEL_ALH:
-		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
-		copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(data->dai_data);
+		/*
+		 * Do not clear the node ID when this op is invoked with
+		 * SOF_DAI_CONFIG_FLAGS_HW_FREE. It is needed to free the group_ida during
+		 * unprepare.
+		 */
+		if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS) {
+			copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
+			copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(data->dai_data);
+		}
 		break;
 	case SOF_DAI_INTEL_DMIC:
 	case SOF_DAI_INTEL_SSP:
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 760621bfc802..d7df29f2ada8 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -50,9 +50,27 @@ static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
 	/* reset route setup status for all routes that contain this widget */
 	sof_reset_route_setup_status(sdev, swidget);
 
+	/* free DAI config and continue to free widget even if it fails */
+	if (WIDGET_IS_DAI(swidget->id)) {
+		struct snd_sof_dai_config_data data;
+		unsigned int flags = SOF_DAI_CONFIG_FLAGS_HW_FREE;
+
+		data.dai_data = DMA_CHAN_INVALID;
+
+		if (tplg_ops && tplg_ops->dai_config) {
+			err = tplg_ops->dai_config(sdev, swidget, flags, &data);
+			if (err < 0)
+				dev_err(sdev->dev, "failed to free config for widget %s\n",
+					swidget->widget->name);
+		}
+	}
+
 	/* continue to disable core even if IPC fails */
-	if (tplg_ops && tplg_ops->widget_free)
-		err = tplg_ops->widget_free(sdev, swidget);
+	if (tplg_ops && tplg_ops->widget_free) {
+		ret = tplg_ops->widget_free(sdev, swidget);
+		if (ret < 0 && !err)
+			err = ret;
+	}
 
 	/*
 	 * disable widget core. continue to route setup status and complete flag
@@ -151,8 +169,12 @@ static int sof_widget_setup_unlocked(struct snd_sof_dev *sdev,
 
 	/* send config for DAI components */
 	if (WIDGET_IS_DAI(swidget->id)) {
-		unsigned int flags = SOF_DAI_CONFIG_FLAGS_NONE;
+		unsigned int flags = SOF_DAI_CONFIG_FLAGS_HW_PARAMS;
 
+		/*
+		 * The config flags saved during BE DAI hw_params will be used for IPC3. IPC4 does
+		 * not use the flags argument.
+		 */
 		if (tplg_ops && tplg_ops->dai_config) {
 			ret = tplg_ops->dai_config(sdev, swidget, flags, NULL);
 			if (ret < 0)
-- 
2.39.2

