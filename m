Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D772A686601
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 13:35:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A14DEE;
	Wed,  1 Feb 2023 13:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A14DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675254912;
	bh=TjhwXLW+ISaVWh4oCIl17D1DQtIaO80qf9PbF9DFUNs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ij4zm6s+R5bh/bvrUftQs6WyU/8MI1YtcpL/Zqo0DkPDd4XqEj+WYQbPQH9H0p7d0
	 mJfdbo7PHCkmSsgKnbi2njFm+BCC2Q0Oixg36RUBx9J8ZLzlLevcHW0GBYygFGLld6
	 GMYoRLnRPmPC8zzW5htrj6GZXNjlKtB31FBSkhzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83E59F80423;
	Wed,  1 Feb 2023 13:32:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6B57F80423; Wed,  1 Feb 2023 13:32:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD663F80423
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 13:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD663F80423
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J0b9YB6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675254760; x=1706790760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TjhwXLW+ISaVWh4oCIl17D1DQtIaO80qf9PbF9DFUNs=;
 b=J0b9YB6dlC8h3Sews/Ca3lHbTJXmnQTFPYO6hnF2mVkSK/ULMYoyYrk0
 VN3XLiBGfgkBj/meJ8tYNeaVNSKJord3GtNFEd7gBKMNhFiCJqpq7/Kkn
 nXp/g/AIHcqaVK+5WCyvGd2L3xZXFsMcczxaW5TgFvnLqlfCKSrq1y9Ae
 0KiUp7W1aIe0NB8iBSwil0++eXR8UtPTbTkMKApe4aQzeylWv+ePK8lvK
 G5zkrUbhUH/fqrMOIAjS0qYDwaj+4ythTUpbiBICeVS4lEOUcARPaJjXx
 WnS/PmDdz5cvmS7N49wZDcwb/5enNX9spDZECsXku+Lv4dEFnfXDYakY8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="328143579"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="328143579"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 04:32:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="788865701"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="788865701"
Received: from jehdildi-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.31.67])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 04:32:35 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 5/9] ASoC: SOF: ipc4-pcm: add hw_params
Date: Wed,  1 Feb 2023 14:32:27 +0200
Message-Id: <20230201123231.26361-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
References: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
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

From: Rander Wang <rander.wang@intel.com>

Use the hw_params to init time info for ipc4 delay calculation.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 98 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 8071db487815..a457d4d479d8 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -459,7 +459,105 @@ static int sof_ipc4_pcm_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 	return 0;
 }
 
+static void sof_ipc4_build_time_info(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *spcm)
+{
+	struct sof_ipc4_copier *host_copier = NULL;
+	struct sof_ipc4_copier *dai_copier = NULL;
+	struct sof_ipc4_llp_reading_slot llp_slot;
+	struct sof_ipc4_timestamp_info *info;
+	struct snd_soc_dapm_widget *widget;
+	struct snd_sof_dai *dai;
+	int i;
+
+	/* find host & dai to locate info in memory window */
+	for_each_dapm_widgets(spcm->list, i, widget) {
+		struct snd_sof_widget *swidget = widget->dobj.private;
+
+		if (!swidget)
+			continue;
+
+		if (WIDGET_IS_AIF(swidget->widget->id)) {
+			host_copier = swidget->private;
+		} else if (WIDGET_IS_DAI(swidget->widget->id)) {
+			dai = swidget->private;
+			dai_copier = dai->private;
+		}
+	}
+
+	/* both host and dai copier must be valid for time_info */
+	if (!host_copier || !dai_copier) {
+		dev_err(sdev->dev, "host or dai copier are not found\n");
+		return;
+	}
+
+	info = spcm->private;
+	info->host_copier = host_copier;
+	info->dai_copier = dai_copier;
+	info->llp_offset = offsetof(struct sof_ipc4_fw_registers, llp_gpdma_reading_slots) +
+				    sdev->fw_info_box.offset;
+
+	/* find llp slot used by current dai */
+	for (i = 0; i < SOF_IPC4_MAX_LLP_GPDMA_READING_SLOTS; i++) {
+		sof_mailbox_read(sdev, info->llp_offset, &llp_slot, sizeof(llp_slot));
+		if (llp_slot.node_id == dai_copier->data.gtw_cfg.node_id)
+			break;
+
+		info->llp_offset += sizeof(llp_slot);
+	}
+
+	if (i < SOF_IPC4_MAX_LLP_GPDMA_READING_SLOTS)
+		return;
+
+	/* if no llp gpdma slot is used, check aggregated sdw slot */
+	info->llp_offset = offsetof(struct sof_ipc4_fw_registers, llp_sndw_reading_slots) +
+					sdev->fw_info_box.offset;
+	for (i = 0; i < SOF_IPC4_MAX_LLP_SNDW_READING_SLOTS; i++) {
+		sof_mailbox_read(sdev, info->llp_offset, &llp_slot, sizeof(llp_slot));
+		if (llp_slot.node_id == dai_copier->data.gtw_cfg.node_id)
+			break;
+
+		info->llp_offset += sizeof(llp_slot);
+	}
+
+	if (i < SOF_IPC4_MAX_LLP_SNDW_READING_SLOTS)
+		return;
+
+	/* check EVAD slot */
+	info->llp_offset = offsetof(struct sof_ipc4_fw_registers, llp_evad_reading_slot) +
+					sdev->fw_info_box.offset;
+	sof_mailbox_read(sdev, info->llp_offset, &llp_slot, sizeof(llp_slot));
+	if (llp_slot.node_id != dai_copier->data.gtw_cfg.node_id) {
+		dev_info(sdev->dev, "no llp found, fall back to default HDA path");
+		info->llp_offset = 0;
+	}
+}
+
+static int sof_ipc4_pcm_hw_params(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_sof_platform_stream_params *platform_params)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct sof_ipc4_timestamp_info *time_info;
+	struct snd_sof_pcm *spcm;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	time_info = spcm->stream[substream->stream].private;
+	/* delay calculation is not supported by current fw_reg ABI */
+	if (!time_info)
+		return 0;
+
+	time_info->stream_start_offset = SOF_IPC4_INVALID_STREAM_POSITION;
+	time_info->llp_offset = 0;
+
+	sof_ipc4_build_time_info(sdev, &spcm->stream[substream->stream]);
+
+	return 0;
+}
+
 const struct sof_ipc_pcm_ops ipc4_pcm_ops = {
+	.hw_params = sof_ipc4_pcm_hw_params,
 	.trigger = sof_ipc4_pcm_trigger,
 	.hw_free = sof_ipc4_pcm_hw_free,
 	.dai_link_fixup = sof_ipc4_pcm_dai_link_fixup,
-- 
2.39.1

