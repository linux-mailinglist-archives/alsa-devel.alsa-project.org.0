Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 793115441F5
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:31:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0AD9203C;
	Thu,  9 Jun 2022 05:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0AD9203C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745516;
	bh=ISVB/mPM9YEDQ1c/ZveV4UqE2Xlr8B02NT2/l7eKHAM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z9CCJkKvowGTrEmiYr8Ju8ENsTZZxWZBWYjHQe4XJnMT0ACM9R3ZvC+jW9Hpkap06
	 FIVfGyIJxrjwjvNxXMTe+e0g3xnSUuMD2jIFcUTjL6OK78rxUbjwt0ajruyrUrW+rK
	 DzT4xK90T6ZSMGrJ1R6AFoLufvAPayV3TpXc5mc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65B99F80552;
	Thu,  9 Jun 2022 05:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F37B6F805B0; Thu,  9 Jun 2022 05:27:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C2A4F80116
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C2A4F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mEch1916"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745234; x=1686281234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ISVB/mPM9YEDQ1c/ZveV4UqE2Xlr8B02NT2/l7eKHAM=;
 b=mEch1916eXICkzPIpQ8Yk0a+AX7MyQoSxANoa1Qrj3g/bLWBrnvup4+z
 9qmqtrnzJG1vco3wuXA9CZZlR6F144N5T7PnjoJsYVk1MN04LSnJsUhqu
 Cd0shMykv257lmq9rNoUlF0mTox1CjRljDCPaL7EXaVFVOeX7bR/ORIJK
 qvyqVXOQUmU3lY32WhMDkfGj67nlKYmm8Ju8uJpnp6yewQNgdmhfxfuOt
 w1bflnhPgYxSzFkWEnzIuggq/2nbJ87Vnm1xnm38lrPb/qv4Bg40pr6nr
 Q0sIXcxXhAFIsnw+4kImwJuhuwwnIFvp8Q6veO4cj8AWzN/cl8cWEgzh+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219554"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219554"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260234"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:58 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/23] ASoC: SOF: ipc4-topology: Add prepare op for DAI type
 widgets
Date: Wed,  8 Jun 2022 20:26:26 -0700
Message-Id: <20220609032643.916882-7-ranjani.sridharan@linux.intel.com>
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

Define the prepare op for the DAI type widgets for IPC4.
The prepare op is responsible for choosing the input/output audio
formats for these widgets based on the runtime PCM params, assigning the
instance ID and updating the total memory usage for the pipelines these
widgets belong to.

Co-developed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 43 ++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 1a73c16f1624..1bc5ff0154c5 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -706,8 +706,13 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 	pipeline = pipe_widget->private;
 	pipeline->mem_usage = 0;
 
-	if (WIDGET_IS_AIF(swidget->id))
+	if (WIDGET_IS_AIF(swidget->id)) {
 		ipc4_copier = swidget->private;
+	} else if (WIDGET_IS_DAI(swidget->id)) {
+		struct snd_sof_dai *dai = swidget->private;
+
+		ipc4_copier = dai->private;
+	}
 
 	if (ipc4_copier) {
 		kfree(ipc4_copier->ipc_config_data);
@@ -776,6 +781,34 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		ref_params = fe_params;
 		break;
 	}
+	case snd_soc_dapm_dai_in:
+	case snd_soc_dapm_dai_out:
+	{
+		struct snd_sof_dai *dai = swidget->private;
+
+		ipc4_copier = (struct sof_ipc4_copier *)dai->private;
+		copier_data = &ipc4_copier->data;
+		available_fmt = &ipc4_copier->available_fmt;
+		if (dir == SNDRV_PCM_STREAM_CAPTURE) {
+			available_fmt->ref_audio_fmt = available_fmt->out_audio_fmt;
+			ref_audio_fmt_size = sizeof(struct sof_ipc4_audio_format);
+
+			/*
+			 * modify the input params for the dai copier as it only supports
+			 * 32-bit always
+			 */
+			fmt = hw_param_mask(pipeline_params, SNDRV_PCM_HW_PARAM_FORMAT);
+			snd_mask_none(fmt);
+			snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+		} else {
+			available_fmt->ref_audio_fmt = &available_fmt->base_config->audio_fmt;
+			ref_audio_fmt_size = sizeof(struct sof_ipc4_base_module_cfg);
+		}
+
+		ref_params = pipeline_params;
+
+		break;
+	}
 	default:
 		dev_err(sdev->dev, "unsupported type %d for copier %s",
 			swidget->id, swidget->widget->name);
@@ -879,9 +912,13 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 				  sof_ipc4_prepare_copier_module,
 				  sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_dai_in] = {sof_ipc4_widget_setup_comp_dai, sof_ipc4_widget_free_comp_dai,
-				 dai_token_list, ARRAY_SIZE(dai_token_list), NULL, NULL, NULL},
+				 dai_token_list, ARRAY_SIZE(dai_token_list), NULL,
+				 sof_ipc4_prepare_copier_module,
+				 sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_dai_out] = {sof_ipc4_widget_setup_comp_dai, sof_ipc4_widget_free_comp_dai,
-				  dai_token_list, ARRAY_SIZE(dai_token_list), NULL, NULL, NULL},
+				  dai_token_list, ARRAY_SIZE(dai_token_list), NULL,
+				  sof_ipc4_prepare_copier_module,
+				  sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_scheduler] = {sof_ipc4_widget_setup_comp_pipeline, sof_ipc4_widget_free_comp,
 				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL,
 				    NULL, NULL},
-- 
2.25.1

