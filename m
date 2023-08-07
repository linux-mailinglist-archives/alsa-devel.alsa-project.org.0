Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D793773114
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86B3384B;
	Mon,  7 Aug 2023 23:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86B3384B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691443003;
	bh=0FZSIRcrzq0HDJGXCrIWF5dB0PElzpyRbX6YT87v/cM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RNvz5IZo/i+aJSuDefViX4BMwlzRwODScTgBJxNnB7m3UNEI3+LPjG4QDhec+UHUS
	 usTk5DqTPmB6rO66LSA9Kx1mwOr98p+aAmaZrQmCCZ+DuYWSx1nvR8BZzHPHr0rwp0
	 AgmHwWlwmsYUYwad66hnkDhrkSxUMu6XPTIPqL6k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA207F80641; Mon,  7 Aug 2023 23:11:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9ADFF80659;
	Mon,  7 Aug 2023 23:11:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F8F7F805C9; Mon,  7 Aug 2023 23:10:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E42BF80553
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E42BF80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JEkdyIMU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442625; x=1722978625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0FZSIRcrzq0HDJGXCrIWF5dB0PElzpyRbX6YT87v/cM=;
  b=JEkdyIMUiDlB/veWUiu2iBilDaUySmvxTZH0m30noa6cxNlRTHKvj19g
   lj0gMISmfjKAFJVMEgLExRY06u2ozKqhPLLaJdAf+zdY/rxuiGRwrXJ0z
   6xE7Y4ddCnPSprx2ebwc+C3ILYjWpFrIRKxiwnmkR2BKl9tvIJ8rr3l9I
   gxJZGNtw9vLXZiMo8P7ZPJS7eugK2uxQkDurrz+gINTRbqY+UXvQW2tgJ
   Kq2T2liObNJXW1WuryjA+4H9g5dArG9nDOG1irMDNaa92Zn4SfgOdJ5kM
   2vwDLh/xPhlxyZCnK+6087umwjJFNTyo8Bv9WKhSC6OMXfBZx+qZgME6H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244371"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244371"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465247"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465247"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 14/20] ASoC: SOF: Intel: hda-dai: add helpers for SoundWire
 callbacks
Date: Mon,  7 Aug 2023 16:09:53 -0500
Message-Id: <20230807210959.506849-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N3E7TKJWYTLECFP6FCWK4ZBLQLCYKUGB
X-Message-ID-Hash: N3E7TKJWYTLECFP6FCWK4ZBLQLCYKUGB
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During the hw_params and hw_free stages, we need to map the stream tag
and channels in the PCMSyCM registers.

The trigger callback is just a wrapper.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 72 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h     | 12 ++++++
 2 files changed, 84 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 08de9b614a83..c984fa79b1ef 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -429,6 +429,78 @@ static const struct snd_soc_dai_ops dmic_dai_ops = {
 	.prepare = non_hda_dai_prepare,
 };
 
+int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *params,
+			  struct snd_soc_dai *cpu_dai,
+			  int link_id)
+{
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
+	const struct hda_dai_widget_dma_ops *ops;
+	struct hdac_ext_stream *hext_stream;
+	struct snd_sof_dev *sdev;
+	int ret;
+
+	ret = non_hda_dai_hw_params(substream, params, cpu_dai);
+	if (ret < 0) {
+		dev_err(cpu_dai->dev, "%s: non_hda_dai_hw_params failed %d\n", __func__, ret);
+		return ret;
+	}
+
+	ops = hda_dai_get_ops(substream, cpu_dai);
+	sdev = widget_to_sdev(w);
+	hext_stream = ops->get_hext_stream(sdev, cpu_dai, substream);
+
+	if (!hext_stream)
+		return -ENODEV;
+
+	/* in the case of SoundWire we need to program the PCMSyCM registers */
+	ret = hdac_bus_eml_sdw_map_stream_ch(sof_to_bus(sdev), link_id, cpu_dai->id,
+					     GENMASK(params_channels(params) - 1, 0),
+					     hdac_stream(hext_stream)->stream_tag,
+					     substream->stream);
+	if (ret < 0) {
+		dev_err(cpu_dai->dev, "%s:  hdac_bus_eml_sdw_map_stream_ch failed %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+int sdw_hda_dai_hw_free(struct snd_pcm_substream *substream,
+			struct snd_soc_dai *cpu_dai,
+			int link_id)
+{
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
+	struct snd_sof_dev *sdev;
+	int ret;
+
+	ret = hda_dai_hw_free(substream, cpu_dai);
+	if (ret < 0) {
+		dev_err(cpu_dai->dev, "%s: non_hda_dai_hw_free failed %d\n", __func__, ret);
+		return ret;
+	}
+
+	sdev = widget_to_sdev(w);
+
+	/* in the case of SoundWire we need to reset the PCMSyCM registers */
+	ret = hdac_bus_eml_sdw_map_stream_ch(sof_to_bus(sdev), link_id, cpu_dai->id,
+					     0, 0, substream->stream);
+	if (ret < 0) {
+		dev_err(cpu_dai->dev, "%s:  hdac_bus_eml_sdw_map_stream_ch failed %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+int sdw_hda_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+			struct snd_soc_dai *cpu_dai)
+{
+	return hda_dai_trigger(substream, cmd, cpu_dai);
+}
+
 static int hda_dai_suspend(struct hdac_bus *bus)
 {
 	struct snd_soc_pcm_runtime *rtd;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 17164fc42501..4f60b722e5d5 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -824,6 +824,18 @@ static inline bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev)
 
 #endif
 
+int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *params,
+			  struct snd_soc_dai *cpu_dai,
+			  int link_id);
+
+int sdw_hda_dai_hw_free(struct snd_pcm_substream *substream,
+			struct snd_soc_dai *cpu_dai,
+			int link_id);
+
+int sdw_hda_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+			struct snd_soc_dai *cpu_dai);
+
 /* common dai driver */
 extern struct snd_soc_dai_driver skl_dai[];
 int hda_dsp_dais_suspend(struct snd_sof_dev *sdev);
-- 
2.39.2

