Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 612D25441F1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9B3C201F;
	Thu,  9 Jun 2022 05:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9B3C201F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745456;
	bh=YzQO5LQL20SvEyLqs0cYymJYkH26JElERs9B3uuEJLg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cb0tXjN9viJ1BptoqGyxtvdunXOIdzoaDeITX8m+9hwiLHyZpqpVbzHOSSIE2O2Fk
	 TmG1JbNWBX/szvPichh7Fc6ceP0yPfKKCBioJYXqnyvc3tuf3SQsjh1aQVqrbFqigh
	 uVALO/4vJAsZZPmuUIW0q7kJezGt//2nI2aaDbSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90AC0F805AE;
	Thu,  9 Jun 2022 05:27:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE681F80587; Thu,  9 Jun 2022 05:27:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB678F80536
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB678F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nBDs7U8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745239; x=1686281239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YzQO5LQL20SvEyLqs0cYymJYkH26JElERs9B3uuEJLg=;
 b=nBDs7U8qSR72KZyphsg15j0l5GhJvqWQX0es5d2NtXwC9zCZeG5oX1cB
 4nfJUBaMQjhAfEOx9gXzRFDcV3IN1l3D4Kci4WCFiU5rPYnDdfifRp3rh
 y3MQ8B84EKEQiWfp04rYfnUJxSL2qGdxRIlH5GlUoGKuEJvaC/ezbtEcE
 17oYT2Iea4zfTXCiovuzuPw4got1HO859CRtglpPUIWN/2O5Dx6OCNzND
 zpn5WLXj7OboKoJb2MR3xlm/sLKltmsPaRxq67a5M6+4kKL1Y7pAy2mtf
 mBizVdDC4djzjOqaKTOds2x0rdsgxTT6iEqD0K5xbh9CWkNwZcUDINGSx Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219561"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219561"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260244"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:59 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/23] ASoC: SOF: ipc4-topology: Add widget_setup/widget_free
 ops
Date: Wed,  8 Jun 2022 20:26:32 -0700
Message-Id: <20220609032643.916882-13-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Define and set the widget_setup/widget_free ops for IPC4.

Co-developed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 123 ++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 3cebd6fe7cd1..44f65b8b526a 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1078,6 +1078,127 @@ static int sof_ipc4_control_setup(struct snd_sof_dev *sdev, struct snd_sof_contr
 	return 0;
 }
 
+static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	struct snd_sof_widget *pipe_widget = swidget->pipe_widget;
+	struct sof_ipc4_pipeline *pipeline;
+	struct sof_ipc4_msg *msg;
+	void *ipc_data = NULL;
+	u32 ipc_size = 0;
+	int ret;
+
+	dev_dbg(sdev->dev, "Create widget %s instance %d - pipe %d - core %d\n",
+		swidget->widget->name, swidget->instance_id, swidget->pipeline_id, swidget->core);
+
+	switch (swidget->id) {
+	case snd_soc_dapm_scheduler:
+		pipeline = swidget->private;
+
+		dev_dbg(sdev->dev, "pipeline: %d memory pages: %d\n", swidget->pipeline_id,
+			pipeline->mem_usage);
+
+		msg = &pipeline->msg;
+		msg->primary |= pipeline->mem_usage;
+		break;
+	case snd_soc_dapm_aif_in:
+	case snd_soc_dapm_aif_out:
+	{
+		struct sof_ipc4_copier *ipc4_copier = swidget->private;
+
+		ipc_size = ipc4_copier->ipc_config_size;
+		ipc_data = ipc4_copier->ipc_config_data;
+
+		msg = &ipc4_copier->msg;
+		break;
+	}
+	case snd_soc_dapm_dai_in:
+	case snd_soc_dapm_dai_out:
+	{
+		struct snd_sof_dai *dai = swidget->private;
+		struct sof_ipc4_copier *ipc4_copier = dai->private;
+
+		ipc_size = ipc4_copier->ipc_config_size;
+		ipc_data = ipc4_copier->ipc_config_data;
+
+		msg = &ipc4_copier->msg;
+		break;
+	}
+	case snd_soc_dapm_pga:
+	{
+		struct sof_ipc4_gain *gain = swidget->private;
+
+		ipc_size = sizeof(struct sof_ipc4_base_module_cfg) +
+			   sizeof(struct sof_ipc4_gain_data);
+		ipc_data = gain;
+
+		msg = &gain->msg;
+		break;
+	}
+	case snd_soc_dapm_mixer:
+	{
+		struct sof_ipc4_mixer *mixer = swidget->private;
+
+		ipc_size = sizeof(mixer->base_config);
+		ipc_data = &mixer->base_config;
+
+		msg = &mixer->msg;
+		break;
+	}
+	default:
+		dev_err(sdev->dev, "widget type %d not supported", swidget->id);
+		return -EINVAL;
+	}
+
+	if (swidget->id != snd_soc_dapm_scheduler) {
+		pipeline = pipe_widget->private;
+		msg->primary &= ~SOF_IPC4_MOD_INSTANCE_MASK;
+		msg->primary |= SOF_IPC4_MOD_INSTANCE(swidget->instance_id);
+
+		msg->extension &= ~SOF_IPC4_MOD_EXT_PARAM_SIZE_MASK;
+		msg->extension |= ipc_size >> 2;
+		msg->extension &= ~SOF_IPC4_MOD_EXT_DOMAIN_MASK;
+		msg->extension |= SOF_IPC4_MOD_EXT_DOMAIN(pipeline->lp_mode);
+	}
+
+	msg->data_size = ipc_size;
+	msg->data_ptr = ipc_data;
+
+	ret = sof_ipc_tx_message(sdev->ipc, msg, ipc_size, NULL, 0);
+	if (ret < 0)
+		dev_err(sdev->dev, "failed to create module %s\n", swidget->widget->name);
+
+	return ret;
+}
+
+static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	int ret = 0;
+
+	/* freeing a pipeline frees all the widgets associated with it */
+	if (swidget->id == snd_soc_dapm_scheduler) {
+		struct sof_ipc4_pipeline *pipeline = swidget->private;
+		struct sof_ipc4_msg msg = {{ 0 }};
+		u32 header;
+
+		header = SOF_IPC4_GLB_PIPE_INSTANCE_ID(swidget->pipeline_id);
+		header |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_DELETE_PIPELINE);
+		header |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+		header |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
+
+		msg.primary = header;
+
+		ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
+		if (ret < 0)
+			dev_err(sdev->dev, "failed to free pipeline widget %s\n",
+				swidget->widget->name);
+
+		pipeline->mem_usage = 0;
+		pipeline->state = SOF_IPC4_PIPE_UNINITIALIZED;
+	}
+
+	return ret;
+}
+
 static enum sof_tokens host_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
@@ -1158,4 +1279,6 @@ const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
 	.token_list = ipc4_token_list,
 	.control_setup = sof_ipc4_control_setup,
 	.control = &tplg_ipc4_control_ops,
+	.widget_setup = sof_ipc4_widget_setup,
+	.widget_free = sof_ipc4_widget_free,
 };
-- 
2.25.1

