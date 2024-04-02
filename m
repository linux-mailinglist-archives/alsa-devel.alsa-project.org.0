Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EF9895806
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:20:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BBEB2C3C;
	Tue,  2 Apr 2024 17:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BBEB2C3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071230;
	bh=AINXQ+oARNLK98XYvBhR8VR2hzFoyR1tT0x1hV7z2E8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X+2m19UmzNVcH0JNXpG8uM8Nmu4CgHi7ONcl2H8vyVJAYnljcLV4qqcBdRQj4z9UL
	 zwErGKm4WkgQxQ8fLcGUVHdej+ck6Va/7X3cbabl4tR1vMapYLBqWjgQSytZ0Tc/TU
	 t9lBKxDKuGu0wgzzA6xyxaotpf2jNnnsUJlI+M+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8535FF80623; Tue,  2 Apr 2024 17:19:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17683F8063D;
	Tue,  2 Apr 2024 17:19:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FF4AF805EA; Tue,  2 Apr 2024 17:18:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD115F8020D
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD115F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fEQ7VMlp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071129; x=1743607129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AINXQ+oARNLK98XYvBhR8VR2hzFoyR1tT0x1hV7z2E8=;
  b=fEQ7VMlphKDdvPJXpmFpxW+OBaqTWiSOsoTXSInpEdikID87NgBGsXCV
   b9rVpKiH14NzS5nIxAorvr8HkoYe21rwSdokZ2iYcjoYeuNvl4158ZgOv
   5U7ThLiWCymRP3sYxcROY0hGG2+BJ7gQITJqNC0xXDMjlwrijuIz5sR77
   ZJhteHqW8BydFGKnHTlEXZA12iy/ULIQzh1qz1X6XiIBtKeqxe3dgvvvl
   5TwnX38du1hufkEcgrYdZwws7OmHXYKblHtU6789ltz6FExffcxHOtqSq
   3y/eX1ypYK2zxdha+yY2LZVyBvUIPyp5ZQ3ckwwVGUvqJn5u8VgnyAoi2
   w==;
X-CSE-ConnectionGUID: WqH1u2neT/e2oqs9WwwhdQ==
X-CSE-MsgGUID: D3u+7ya1SnmIZnQu2MV/LA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729998"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29729998"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:41 -0700
X-CSE-ConnectionGUID: m/9pMPszSXiJ+Mv0ygyftQ==
X-CSE-MsgGUID: FhQk9oFbTNS6lGzab0KFyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796507"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 07/17] ASoC: SOF: Intel: hda-dai: add helpers to set dai
 config
Date: Tue,  2 Apr 2024 10:18:18 -0500
Message-Id: <20240402151828.175002-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LOJM4BWYXQJOGPMMZFGOFRFYOWCMV733
X-Message-ID-Hash: LOJM4BWYXQJOGPMMZFGOFRFYOWCMV733
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LOJM4BWYXQJOGPMMZFGOFRFYOWCMV733/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We need to be able to set the dai config differently for SoundWire.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 51 ++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index de71e1595a78..c48ac931753c 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -221,15 +221,15 @@ static int __maybe_unused hda_dai_hw_free(struct snd_pcm_substream *substream,
 	return hda_link_dma_cleanup(substream, hext_stream, cpu_dai);
 }
 
-static int __maybe_unused hda_dai_hw_params(struct snd_pcm_substream *substream,
-					    struct snd_pcm_hw_params *params,
-					    struct snd_soc_dai *dai)
+static int __maybe_unused hda_dai_hw_params_data(struct snd_pcm_substream *substream,
+						 struct snd_pcm_hw_params *params,
+						 struct snd_soc_dai *dai,
+						 struct snd_sof_dai_config_data *data,
+						 unsigned int flags)
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, substream->stream);
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
 	struct hdac_ext_stream *hext_stream;
-	struct snd_sof_dai_config_data data = { 0 };
-	unsigned int flags = SOF_DAI_CONFIG_FLAGS_HW_PARAMS;
 	struct snd_sof_dev *sdev = widget_to_sdev(w);
 	int ret;
 
@@ -249,9 +249,19 @@ static int __maybe_unused hda_dai_hw_params(struct snd_pcm_substream *substream,
 	hext_stream = ops->get_hext_stream(sdev, dai, substream);
 
 	flags |= SOF_DAI_CONFIG_FLAGS_2_STEP_STOP << SOF_DAI_CONFIG_FLAGS_QUIRK_SHIFT;
-	data.dai_data = hdac_stream(hext_stream)->stream_tag - 1;
+	data->dai_data = hdac_stream(hext_stream)->stream_tag - 1;
 
-	return hda_dai_config(w, flags, &data);
+	return hda_dai_config(w, flags, data);
+}
+
+static int __maybe_unused hda_dai_hw_params(struct snd_pcm_substream *substream,
+					    struct snd_pcm_hw_params *params,
+					    struct snd_soc_dai *dai)
+{
+	struct snd_sof_dai_config_data data = { 0 };
+	unsigned int flags = SOF_DAI_CONFIG_FLAGS_HW_PARAMS;
+
+	return hda_dai_hw_params_data(substream, params, dai, &data, flags);
 }
 
 /*
@@ -341,9 +351,11 @@ static struct sof_ipc4_copier *widget_to_copier(struct snd_soc_dapm_widget *w)
 	return ipc4_copier;
 }
 
-static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *params,
-				 struct snd_soc_dai *cpu_dai)
+static int non_hda_dai_hw_params_data(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *cpu_dai,
+				      struct snd_sof_dai_config_data *data,
+				      unsigned int flags)
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -366,9 +378,9 @@ static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* use HDaudio stream handling */
-	ret = hda_dai_hw_params(substream, params, cpu_dai);
+	ret = hda_dai_hw_params_data(substream, params, cpu_dai, data, flags);
 	if (ret < 0) {
-		dev_err(cpu_dai->dev, "%s: hda_dai_hw_params failed: %d\n", __func__, ret);
+		dev_err(cpu_dai->dev, "%s: hda_dai_hw_params_data failed: %d\n", __func__, ret);
 		return ret;
 	}
 
@@ -422,6 +434,16 @@ static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *cpu_dai)
+{
+	struct snd_sof_dai_config_data data = { 0 };
+	unsigned int flags = SOF_DAI_CONFIG_FLAGS_HW_PARAMS;
+
+	return non_hda_dai_hw_params_data(substream, params, cpu_dai, &data, flags);
+}
+
 static int non_hda_dai_prepare(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
@@ -453,6 +475,8 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_ipc4_dma_config_tlv *dma_config_tlv;
+	struct snd_sof_dai_config_data data = { 0 };
+	unsigned int flags = SOF_DAI_CONFIG_FLAGS_HW_PARAMS;
 	const struct hda_dai_widget_dma_ops *ops;
 	struct sof_ipc4_dma_config *dma_config;
 	struct sof_ipc4_copier *ipc4_copier;
@@ -465,7 +489,8 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 	int i;
 
-	ret = non_hda_dai_hw_params(substream, params, cpu_dai);
+	data.dai_index = (link_id << 8) | cpu_dai->id;
+	ret = non_hda_dai_hw_params_data(substream, params, cpu_dai, &data, flags);
 	if (ret < 0) {
 		dev_err(cpu_dai->dev, "%s: non_hda_dai_hw_params failed %d\n", __func__, ret);
 		return ret;
-- 
2.40.1

