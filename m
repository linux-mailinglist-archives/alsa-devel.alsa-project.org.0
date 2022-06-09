Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8575441EC
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:30:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14B6B1FF2;
	Thu,  9 Jun 2022 05:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14B6B1FF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745404;
	bh=W8f0kYRtjHBgJoVVyL+K9FYRrpeXMAMm/6D8H0ce1/o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i8J4JWPBVc5eUI2p7/l7kkNhB/mnAvDjUI1NlRhwYldME2a1gi8jVpqqKz0654hpy
	 +QjyOii8Wso8Sdu1KeylqD4wJxd++S0IFMPJRqkMCIgzS6pANWdj82jo1qxQ+BICFp
	 dk9FKSTYFh9V6jtMU/A0YvcEgd4q8TVnKIQ/E78w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D8EDF80579;
	Thu,  9 Jun 2022 05:27:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3DE7F8052D; Thu,  9 Jun 2022 05:27:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94F10F8052D
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F10F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GSP6LPga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745236; x=1686281236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W8f0kYRtjHBgJoVVyL+K9FYRrpeXMAMm/6D8H0ce1/o=;
 b=GSP6LPgauWVAlxjTjuEljSGsqQcSeDEKjuTDMjurhb9UrqjZBCxQoMUG
 o1RqydoCo+gScsAjGus4Y/ES3ryzlaYvtptoC71JLe17A46pzdkYOvjCF
 HczzqKehF17PpWMKVLYASm8hULRNxFaNldUS1qzss3/nZ7J8LqtwTNyQF
 j78iwF8T6iClc6K3OlFKsO63P5yFntS2rFCdMefgxy1jrx0PivXuDRWNy
 KmWy29dm+ZZSpx4/EA+vU6QlzqvY5LlKThkGzhVX4jbv6ZkDK805nZPgP
 y4SJ6S4orYxYD7weSWUvE/HaWuYQjTfz2CWAwX2bX7d7RJz8cOQj/8yCe A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219558"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219558"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260241"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:59 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/23] ASoC: SOF: ipc4-topology: Add control_setup op
Date: Wed,  8 Jun 2022 20:26:29 -0700
Message-Id: <20220609032643.916882-10-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
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

Define the control_setup op for IPC4 topology IPC ops to handle the
volume kcontrol types. Support for other kcontrol types will be added in
the follow up patches.

Co-developed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 49 +++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 35457fe4edd9..0c36b7cb6e79 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -15,6 +15,8 @@
 #include "ipc4-topology.h"
 #include "ops.h"
 
+#define SOF_IPC4_GAIN_PARAM_ID  0
+
 static const struct sof_topology_token ipc4_sched_tokens[] = {
 	{SOF_TKN_SCHED_LP_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
 		offsetof(struct sof_ipc4_pipeline, lp_mode)}
@@ -1030,6 +1032,52 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	return sof_ipc4_widget_assign_instance_id(sdev, swidget);
 }
 
+static int sof_ipc4_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
+{
+	struct sof_ipc4_control_data *control_data;
+	struct sof_ipc4_msg *msg;
+	int i;
+
+	scontrol->size = struct_size(control_data, chanv, scontrol->num_channels);
+
+	/* scontrol->ipc_control_data will be freed in sof_control_unload */
+	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
+	if (!scontrol->ipc_control_data)
+		return -ENOMEM;
+
+	control_data = scontrol->ipc_control_data;
+	control_data->index = scontrol->index;
+
+	msg = &control_data->msg;
+	msg->primary = SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_LARGE_CONFIG_SET);
+	msg->primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg->primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+
+	msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_GAIN_PARAM_ID);
+
+	/* set default volume values to 0dB in control */
+	for (i = 0; i < scontrol->num_channels; i++) {
+		control_data->chanv[i].channel = i;
+		control_data->chanv[i].value = SOF_IPC4_VOL_ZERO_DB;
+	}
+
+	return 0;
+}
+
+static int sof_ipc4_control_setup(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
+{
+	switch (scontrol->info_type) {
+	case SND_SOC_TPLG_CTL_VOLSW:
+	case SND_SOC_TPLG_CTL_VOLSW_SX:
+	case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
+		return sof_ipc4_control_load_volume(sdev, scontrol);
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static enum sof_tokens host_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
@@ -1108,4 +1156,5 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
 	.widget = tplg_ipc4_widget_ops,
 	.token_list = ipc4_token_list,
+	.control_setup = sof_ipc4_control_setup,
 };
-- 
2.25.1

