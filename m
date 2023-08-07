Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC5A7730FE
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:14:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A81845;
	Mon,  7 Aug 2023 23:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A81845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442839;
	bh=QisfSdJo+g2YnBpVwbyQWBXurtUN9/1RAnx1C2s+nC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=brzZTX1Ap3bzE+DPLdpaB9pxDQoJ6eV6PSz27zW7M7KjPkwvSUa8FXqPVVn6878x2
	 Eu4dHMypQ2/9Xfl3O+KB5AwlWCRxHoulSIdvXTmBdpIixtTVWwgPFmqnZawuiB5qy1
	 B2OWqZ10Q7XoqE0a7mqwayHD9rIzGNfwwICSL/jw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5854F805D2; Mon,  7 Aug 2023 23:10:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40F53F805D2;
	Mon,  7 Aug 2023 23:10:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CD0BF805B0; Mon,  7 Aug 2023 23:10:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D5E5F80549
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D5E5F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SGU1r31T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442623; x=1722978623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QisfSdJo+g2YnBpVwbyQWBXurtUN9/1RAnx1C2s+nC0=;
  b=SGU1r31Tyk4TZ0FzXhlSnxDsamu/Oyc8qKPz4E+SG00/1GAbw+JlvQ5M
   zp1Hbt9zj7+NnUnxSspqTCvWVC3GphCpJXWnNoeU6aeO2kqN8r2uzGXCG
   Bj3e0QHXAjsDeChG9h88uW00d93hQCUsMLM5bGXJEUAJ3QcnuNJpEclcS
   iENuedDnm3MsM5Mder100/+zCoMn0NNgKIOlbgvsj3pO6mqpfosPLi9ft
   SRbvpXjLt1yGSqbMHL8ngTRU4kZ7cRSgwp0qyR2cFVfq+896fVSeEYUGt
   296P7CpOU7an3FmHV4bbJTlBUgZozDZPI1SHWk2S1yVZIU5q/qYei7zYP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244350"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244350"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465229"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465229"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 10/20] ASoC: SOF: Intel: hda-dai: add ops for SSP
Date: Mon,  7 Aug 2023 16:09:49 -0500
Message-Id: <20230807210959.506849-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SY6ES6KVUZVZTCNIQ4Y5IZ36HEI3NCZY
X-Message-ID-Hash: SY6ES6KVUZVZTCNIQ4Y5IZ36HEI3NCZY
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

Add new ops for SSP.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 115 +++++++++++++++++++++++++++++++++-
 1 file changed, 114 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 3297dea493aa..711854f59cf5 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -10,6 +10,8 @@
 
 #include <sound/pcm_params.h>
 #include <sound/hdaudio_ext.h>
+#include <sound/hda-mlink.h>
+#include <sound/hda_register.h>
 #include <sound/intel-nhlt.h>
 #include <sound/sof/ipc4/header.h>
 #include <uapi/sound/sof/header.h>
@@ -330,6 +332,96 @@ static const struct snd_soc_dai_ops hda_dai_ops = {
 
 #endif
 
+static struct sof_ipc4_copier *widget_to_copier(struct snd_soc_dapm_widget *w)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_sof_dai *sdai = swidget->private;
+	struct sof_ipc4_copier *ipc4_copier = (struct sof_ipc4_copier *)sdai->private;
+
+	return ipc4_copier;
+}
+
+static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *cpu_dai)
+{
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
+	struct sof_ipc4_dma_config_tlv *dma_config_tlv;
+	const struct hda_dai_widget_dma_ops *ops;
+	struct sof_ipc4_dma_config *dma_config;
+	struct sof_ipc4_copier *ipc4_copier;
+	struct hdac_ext_stream *hext_stream;
+	struct hdac_stream *hstream;
+	struct snd_sof_dev *sdev;
+	int stream_id;
+	int ret;
+
+	ops = hda_dai_get_ops(substream, cpu_dai);
+	if (!ops) {
+		dev_err(cpu_dai->dev, "DAI widget ops not set\n");
+		return -EINVAL;
+	}
+
+	/* use HDaudio stream handling */
+	ret = hda_dai_hw_params(substream, params, cpu_dai);
+	if (ret < 0) {
+		dev_err(cpu_dai->dev, "%s: hda_dai_hw_params failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	/* get stream_id */
+	sdev = widget_to_sdev(w);
+	hext_stream = ops->get_hext_stream(sdev, cpu_dai, substream);
+
+	if (!hext_stream) {
+		dev_err(cpu_dai->dev, "%s: no hext_stream found\n", __func__);
+		return -ENODEV;
+	}
+
+	hstream = &hext_stream->hstream;
+	stream_id = hstream->stream_tag;
+
+	if (!stream_id) {
+		dev_err(cpu_dai->dev, "%s: no stream_id allocated\n", __func__);
+		return -ENODEV;
+	}
+
+	/* configure TLV */
+	ipc4_copier = widget_to_copier(w);
+
+	dma_config_tlv = &ipc4_copier->dma_config_tlv;
+	dma_config_tlv->type = SOF_IPC4_GTW_DMA_CONFIG_ID;
+	/* dma_config_priv_size is zero */
+	dma_config_tlv->length = sizeof(dma_config_tlv->dma_config);
+
+	dma_config = &dma_config_tlv->dma_config;
+
+	dma_config->dma_method = SOF_IPC4_DMA_METHOD_HDA;
+	dma_config->pre_allocated_by_host = 1;
+	dma_config->dma_channel_id = stream_id - 1;
+	dma_config->stream_id = stream_id;
+	dma_config->dma_stream_channel_map.device_count = 0; /* mapping not used */
+	dma_config->dma_priv_config_size = 0;
+
+	return 0;
+}
+
+static int non_hda_dai_prepare(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *cpu_dai)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	int stream = substream->stream;
+
+	return non_hda_dai_hw_params(substream, &rtd->dpcm[stream].hw_params, cpu_dai);
+}
+
+static const struct snd_soc_dai_ops ssp_dai_ops = {
+	.hw_params = non_hda_dai_hw_params,
+	.hw_free = hda_dai_hw_free,
+	.trigger = hda_dai_trigger,
+	.prepare = non_hda_dai_prepare,
+};
+
 static int hda_dai_suspend(struct hdac_bus *bus)
 {
 	struct snd_soc_pcm_runtime *rtd;
@@ -384,7 +476,26 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 	return 0;
 }
 
-#endif
+static void ssp_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
+{
+	const struct sof_intel_dsp_desc *chip;
+	int i;
+
+	chip = get_chip_info(sdev->pdata);
+
+	if (chip->hw_ip_version >= SOF_INTEL_ACE_2_0) {
+		for (i = 0; i < ops->num_drv; i++) {
+			if (strstr(ops->drv[i].name, "SSP"))
+				ops->drv[i].ops = &ssp_dai_ops;
+		}
+	}
+}
+
+#else
+
+static inline void ssp_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops) {}
+
+#endif /* CONFIG_SND_SOC_SOF_HDA_LINK */
 
 void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 {
@@ -399,6 +510,8 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 #endif
 	}
 
+	ssp_set_dai_drv_ops(sdev, ops);
+
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4 && !hda_use_tplg_nhlt) {
 		struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 
-- 
2.39.2

