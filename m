Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D35CA7A1AAA
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 11:37:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D2BFDE5;
	Fri, 15 Sep 2023 11:36:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D2BFDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694770625;
	bh=JikfRxcNIS096XfD614Q8SdA3/nZ8Whzq1FJpMVVMrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OtaRotBcKxvBUANSb43IESKpoLxlIFIB9FxATXAtday9nnYfX4B5wMKK7RIl21TbP
	 VY5y6lSDjUiEHDb1NSxrGKfrLe479WkKuF3UwOJcw/eXAULP2f/Uc9wdnE/O2OrDRo
	 PLxemTsHc57626XKubxOudbvTd3FCrYxfvuI5RyM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 935D8F8057A; Fri, 15 Sep 2023 11:35:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27C1CF8056F;
	Fri, 15 Sep 2023 11:35:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FB1FF8055A; Fri, 15 Sep 2023 11:35:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A7C5F8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 11:35:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A7C5F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YABHPlqB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694770516; x=1726306516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JikfRxcNIS096XfD614Q8SdA3/nZ8Whzq1FJpMVVMrc=;
  b=YABHPlqBWYhqodioWZRh+SYvSS2lrCh6slF8JvZSOBLTEnkZjNhLXu1J
   DK9wPc8YfkIHi5nVXouIY3gRhB7O4Jb+VccGw6WEuXu+e99hZouJ9+ZJ3
   chqIFPEF0VoLsK4lIXufyIaXVr2+dKETZ1zQGo21z5Ej8ULSHIIpegIjA
   VPN8vf8Hz1qwnpeyY3AfVphwKYf5/zc7jxW7A4r503ICWsO3kIZYPDtDe
   CylzohEbSpg0vmP9fX/28lfAhaB0KviYyRuUxc1ujmwCVb+k5Cb4tJEZw
   vpt+6iY3brF1D5AlrJGnIZJJixdmK/qmU0J/Nd/lcKnvlvjbbgwOprzq8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="445666693"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="445666693"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 02:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="868646130"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="868646130"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 02:35:06 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: ipc4-pcm: fixup dailink based on copier format
Date: Fri, 15 Sep 2023 12:35:07 +0300
Message-ID: <20230915093507.7242-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230915093507.7242-1-peter.ujfalusi@linux.intel.com>
References: <20230915093507.7242-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5UPY6UZZCEBCVSVMCWJGVAFWKTMGTUTT
X-Message-ID-Hash: 5UPY6UZZCEBCVSVMCWJGVAFWKTMGTUTT
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5UPY6UZZCEBCVSVMCWJGVAFWKTMGTUTT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

When a copier exposes a single format, we can fixup the BE dailink with
that format. This is helpful when some codec have format restrictions and
e.g. don't support a 32-bit format. In that case, the copier output
formats mirror that restriction in the topology file.

An alternate solution was suggested earlier using a dedicated topology
token. When specified, the token would be used to fix-up the dailink. The
main reason why this solution was chosen is that there is a risk of a
disconnect between token definition and copier format. With a single piece
of information as suggested in this patch, there are fewer risks of a bad
configuration.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 55 ++++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index db19cd03ecad..775c864313fa 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -517,11 +517,14 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_dai *dai = snd_sof_find_dai(component, rtd->dai_link->name);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sof_ipc4_audio_format *ipc4_fmt;
 	struct sof_ipc4_copier *ipc4_copier;
-	bool use_chain_dma = false;
-	int dir;
+	bool single_fmt = false;
+	u32 valid_bits = 0;
+	int dir, ret;
 
 	if (!dai) {
 		dev_err(component->dev, "%s: No DAI found with name %s\n", __func__,
@@ -540,21 +543,57 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, dir);
 
 		if (w) {
+			struct sof_ipc4_available_audio_format *available_fmt =
+				&ipc4_copier->available_fmt;
 			struct snd_sof_widget *swidget = w->dobj.private;
 			struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
 			struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 
+			/* Chain DMA does not use copiers, so no fixup needed */
 			if (pipeline->use_chain_dma)
-				use_chain_dma = true;
+				return 0;
+
+			if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+				if (sof_ipc4_copier_is_single_format(sdev,
+					available_fmt->output_pin_fmts,
+					available_fmt->num_output_formats)) {
+					ipc4_fmt = &available_fmt->output_pin_fmts->audio_fmt;
+					single_fmt = true;
+				}
+			} else {
+				if (sof_ipc4_copier_is_single_format(sdev,
+					available_fmt->input_pin_fmts,
+					available_fmt->num_input_formats)) {
+					ipc4_fmt = &available_fmt->input_pin_fmts->audio_fmt;
+					single_fmt = true;
+				}
+			}
 		}
 	}
 
-	/* Chain DMA does not use copiers, so no fixup needed */
-	if (!use_chain_dma) {
-		int ret = sof_ipc4_pcm_dai_link_fixup_rate(sdev, params, ipc4_copier);
+	ret = sof_ipc4_pcm_dai_link_fixup_rate(sdev, params, ipc4_copier);
+	if (ret)
+		return ret;
 
-		if (ret)
-			return ret;
+	if (single_fmt) {
+		snd_mask_none(fmt);
+		valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(ipc4_fmt->fmt_cfg);
+		dev_dbg(component->dev, "Set %s to %d bit format\n", dai->name, valid_bits);
+	}
+
+	/* Set format if it is specified */
+	switch (valid_bits) {
+	case 16:
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+		break;
+	case 24:
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
+		break;
+	case 32:
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+		break;
+	default:
+		break;
 	}
 
 	switch (ipc4_copier->dai_type) {
-- 
2.42.0

