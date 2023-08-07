Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0735D773100
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51D06850;
	Mon,  7 Aug 2023 23:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51D06850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442855;
	bh=MWtjix3wdopgO4XQsh9npH4qW5epItO031FWd/TkHfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SJvl+EcsmZQLo6zRrW71qxSOB5H5w/DeBg7MlJ8Laf4or2JDKsAPNcDLbwer1jYG4
	 4TZoGxHFka5ANpjTefTLmA25cCeXPa3zqnyG633Q7OiaS8j+kvOPjFI0MCWdqgmQoZ
	 eptCfeyG1gU1J4m3in2vVDJKhQPmbyRCruMNIEfI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECBB9F805ED; Mon,  7 Aug 2023 23:10:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C24BF805E7;
	Mon,  7 Aug 2023 23:10:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91F62F805AF; Mon,  7 Aug 2023 23:10:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94260F80551
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94260F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AdWv1QXk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442623; x=1722978623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MWtjix3wdopgO4XQsh9npH4qW5epItO031FWd/TkHfQ=;
  b=AdWv1QXkMN7dI4XX7WlbhJu1hDuNjeX6GgRPdRoMReuYFKL+5TyQ+u5Q
   DZlrlPQVSNwdoJtYC5k8tV3In2yI3NqI6XBNJeU4Z2rIitD8+t3n/9NiL
   PSoVLmHgZ9Ie03RM+40aJBRrYQ++6Ybsz589XXuNLTzvPUSD582kznVh4
   E+/RsqJeJ6ZwLegJLXyPsQiScQxXO7Q906A9edCOJ6JdxjbT5AkE4eQtw
   kpBVgq9sReClv6VS6/Hol1PF0Ho+4HkXYgNYBy7+jXfCEErhf1hEGCb/t
   wukAt76Z4v9BFp6G2iOWyrXg6vIxURbBQCoMfTxdvf48Xo4U8FISKjlJs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244354"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244354"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465230"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465230"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Jaska Uimonen <jaska.uimonen@linux.intel.com>
Subject: [PATCH 11/20] ASoC: SOF: Intel: hda-dai: add DMIC support
Date: Mon,  7 Aug 2023 16:09:50 -0500
Message-Id: <20230807210959.506849-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O6K262VIIPHUKQP542WQNKN7AXE36IXK
X-Message-ID-Hash: O6K262VIIPHUKQP542WQNKN7AXE36IXK
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

We can reuse the same helpers as for SSP, with just the link type
being different.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 55 +++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda-dai.c     | 24 ++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 05ef77be6435..b66886244f24 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -237,6 +237,36 @@ static unsigned int generic_calc_stream_format(struct snd_sof_dev *sdev,
 	return format_val;
 }
 
+static unsigned int dmic_calc_stream_format(struct snd_sof_dev *sdev,
+					    struct snd_pcm_substream *substream,
+					    struct snd_pcm_hw_params *params)
+{
+	unsigned int format_val;
+	snd_pcm_format_t format;
+	unsigned int channels;
+	unsigned int width;
+
+	channels = params_channels(params);
+	format = params_format(params);
+	width = params_physical_width(params);
+
+	if (format == SNDRV_PCM_FORMAT_S16_LE) {
+		format = SNDRV_PCM_FORMAT_S32_LE;
+		channels /= 2;
+		width = 32;
+	}
+
+	format_val = snd_hdac_calc_stream_format(params_rate(params), channels,
+						 format,
+						 width,
+						 0);
+
+	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
+		params_rate(params), channels, format);
+
+	return format_val;
+}
+
 static struct hdac_ext_link *ssp_get_hlink(struct snd_sof_dev *sdev,
 					   struct snd_pcm_substream *substream)
 {
@@ -245,6 +275,14 @@ static struct hdac_ext_link *ssp_get_hlink(struct snd_sof_dev *sdev,
 	return hdac_bus_eml_ssp_get_hlink(bus);
 }
 
+static struct hdac_ext_link *dmic_get_hlink(struct snd_sof_dev *sdev,
+					    struct snd_pcm_substream *substream)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	return hdac_bus_eml_dmic_get_hlink(bus);
+}
+
 static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 				struct snd_pcm_substream *substream, int cmd)
 {
@@ -402,6 +440,19 @@ static const struct hda_dai_widget_dma_ops ssp_ipc4_dma_ops = {
 	.get_hlink = ssp_get_hlink,
 };
 
+static const struct hda_dai_widget_dma_ops dmic_ipc4_dma_ops = {
+	.get_hext_stream = hda_ipc4_get_hext_stream,
+	.assign_hext_stream = hda_assign_hext_stream,
+	.release_hext_stream = hda_release_hext_stream,
+	.setup_hext_stream = hda_setup_hext_stream,
+	.reset_hext_stream = hda_reset_hext_stream,
+	.pre_trigger = hda_ipc4_pre_trigger,
+	.trigger = hda_trigger,
+	.post_trigger = hda_ipc4_post_trigger,
+	.calc_stream_format = dmic_calc_stream_format,
+	.get_hlink = dmic_get_hlink,
+};
+
 static const struct hda_dai_widget_dma_ops hda_ipc4_chain_dma_ops = {
 	.get_hext_stream = hda_get_hext_stream,
 	.assign_hext_stream = hda_assign_hext_stream,
@@ -523,6 +574,10 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 			if (chip->hw_ip_version < SOF_INTEL_ACE_2_0)
 				return NULL;
 			return &ssp_ipc4_dma_ops;
+		case SOF_DAI_INTEL_DMIC:
+			if (chip->hw_ip_version < SOF_INTEL_ACE_2_0)
+				return NULL;
+			return &dmic_ipc4_dma_ops;
 		default:
 			break;
 		}
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 711854f59cf5..08de9b614a83 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -422,6 +422,13 @@ static const struct snd_soc_dai_ops ssp_dai_ops = {
 	.prepare = non_hda_dai_prepare,
 };
 
+static const struct snd_soc_dai_ops dmic_dai_ops = {
+	.hw_params = non_hda_dai_hw_params,
+	.hw_free = hda_dai_hw_free,
+	.trigger = hda_dai_trigger,
+	.prepare = non_hda_dai_prepare,
+};
+
 static int hda_dai_suspend(struct hdac_bus *bus)
 {
 	struct snd_soc_pcm_runtime *rtd;
@@ -491,9 +498,25 @@ static void ssp_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops
 	}
 }
 
+static void dmic_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
+{
+	const struct sof_intel_dsp_desc *chip;
+	int i;
+
+	chip = get_chip_info(sdev->pdata);
+
+	if (chip->hw_ip_version >= SOF_INTEL_ACE_2_0) {
+		for (i = 0; i < ops->num_drv; i++) {
+			if (strstr(ops->drv[i].name, "DMIC"))
+				ops->drv[i].ops = &dmic_dai_ops;
+		}
+	}
+}
+
 #else
 
 static inline void ssp_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops) {}
+static inline void dmic_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops) {}
 
 #endif /* CONFIG_SND_SOC_SOF_HDA_LINK */
 
@@ -511,6 +534,7 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 	}
 
 	ssp_set_dai_drv_ops(sdev, ops);
+	dmic_set_dai_drv_ops(sdev, ops);
 
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4 && !hda_use_tplg_nhlt) {
 		struct sof_ipc4_fw_data *ipc4_data = sdev->private;
-- 
2.39.2

