Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B256101E8
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:42:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB7C32DF1;
	Thu, 27 Oct 2022 21:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB7C32DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899751;
	bh=nIv7P42SwKbD9y60YPg592tzHtlPVeM83BqoJUZoDyk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LJUExgEdLdVvCUgK49mCIPdeickfp1xYlJsGaKZ6n6NnLKS/bFbw90zrMhwHma8wX
	 GYBW4xHFT/gzfAEfNr6CybpSRo3YTXHq+dlGsQcD2shraxb0gxTkesStuD2jDmaQIu
	 +WdPchHmYTX2W80tBqfvzznEMyL5NB1OyBAj0w70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D49FF805E4;
	Thu, 27 Oct 2022 21:36:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E342EF805C6; Thu, 27 Oct 2022 21:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF3EFF804D9
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF3EFF804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BCr+9TJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899388; x=1698435388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nIv7P42SwKbD9y60YPg592tzHtlPVeM83BqoJUZoDyk=;
 b=BCr+9TJuP4HI9du0hbrQKEmLvLiuzdp4ItR3p27+lT4K7W5mGmHXwT6a
 HDmfCO43BNoHNKynq7swY2rOaDSvXpVEdQkdCbn6GmtKYSULbxWmKmhPw
 1mCrjkwHFrscV7o4PYrncf3nkORquFpDeLdTaLsXd5r8GMIuucb1Wy6/n
 fnf7f75KK65/rxJnG75W+SqbOtzx0spKZp80BrTg3lURXWD2P7PggBAUP
 pL+dNp3qOB0vCd0X/EzpShmiPEicfstLtoEwBv236H0zTgV42sNXDOf26
 Wy+pyGdFzL2iMt+qRvHdcP4YAdGBVIJjiQyoaQdQIdd/U3hIG75N4ZSaf g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957876"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957876"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632527076"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632527076"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 19/21] ASoC: SOF: Intel: hda: clarify Kconfig dependencies
Date: Thu, 27 Oct 2022 15:35:38 -0400
Message-Id: <20221027193540.259520-20-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
References: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Since we've moved to the same flows for HDaudio and iDISP codecs, we
need to be more consistent about dependencies.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 10 +++++-----
 sound/soc/sof/intel/hda.c     |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 6e368974abd1..0cb7af719c66 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -27,7 +27,7 @@ static bool hda_use_tplg_nhlt;
 module_param_named(sof_use_tplg_nhlt, hda_use_tplg_nhlt, bool, 0444);
 MODULE_PARM_DESC(sof_use_tplg_nhlt, "SOF topology nhlt override");
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 
 struct hda_pipe_params {
 	u32 ch;
@@ -772,7 +772,7 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 				ops->drv[i].ops = &ipc3_ssp_dai_ops;
 				continue;
 			}
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 			if (strstr(ops->drv[i].name, "iDisp") ||
 			    strstr(ops->drv[i].name, "Analog") ||
 			    strstr(ops->drv[i].name, "Digital"))
@@ -793,7 +793,7 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 				ops->drv[i].ops = &ipc4_ssp_dai_ops;
 				continue;
 			}
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 			if (strstr(ops->drv[i].name, "iDisp") ||
 			    strstr(ops->drv[i].name, "Analog") ||
 			    strstr(ops->drv[i].name, "Digital"))
@@ -911,7 +911,7 @@ struct snd_soc_dai_driver skl_dai[] = {
 		.channels_max = 4,
 	},
 },
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 {
 	.name = "iDisp1 Pin",
 	.playback = {
@@ -984,7 +984,7 @@ int hda_dsp_dais_suspend(struct snd_sof_dev *sdev)
 	 * Since the component suspend is called last, we can trap this corner case
 	 * and force the DAIs to release their resources.
 	 */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	int ret;
 
 	ret = hda_dai_suspend(sof_to_bus(sdev));
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 619179e7f15c..99be5ef78324 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -791,7 +791,7 @@ static int check_nhlt_ssp_mclk_mask(struct snd_sof_dev *sdev, int ssp_num)
 	return intel_nhlt_ssp_mclk_mask(nhlt, ssp_num);
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 				   const char *sof_tplg_filename,
@@ -1222,7 +1222,7 @@ int hda_power_down_dsp(struct snd_sof_dev *sdev)
 	return hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 				       struct snd_soc_acpi_mach **mach)
 {
-- 
2.34.1

