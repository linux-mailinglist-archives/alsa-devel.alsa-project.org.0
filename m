Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A660773102
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:14:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24DBE1CE;
	Mon,  7 Aug 2023 23:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24DBE1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442887;
	bh=WVMNxnMy9t7HCx+jL1wBGSpgc+8o3RjrWXhXUIfudkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sEzBk1lKQGZVoglNzF9bGE+GE7h8LyoNDEQpoGAtAMKRliQa1INM8DR+pLLBO31gt
	 uXWpab6GDUxiA/T2R6PiUrtit5zccUcVAfJGwdSNW0QCWkYP0ssrVFFgH5IjW1W4F/
	 la2k0/t8a369vpuft9ECoR8RpaLlhm9pLOmUv3nQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABB26F80601; Mon,  7 Aug 2023 23:10:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56477F805FA;
	Mon,  7 Aug 2023 23:10:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4392DF805B6; Mon,  7 Aug 2023 23:10:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF52CF8053B
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF52CF8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Cibiw2/U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442623; x=1722978623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WVMNxnMy9t7HCx+jL1wBGSpgc+8o3RjrWXhXUIfudkc=;
  b=Cibiw2/UJKMsilfq4ssVw7mdkgNZ1RZ15uU5QbFMAbmosQYC2xFQtTo7
   FJ2GoTrNcl5n2cJ+xYk2e7M89wbuvMKmotJ8snoCmgqSa+XNeaJVOt834
   xda9Kfjq7TLDBUkIoqD4W945ukWNDyNzqjBBNlN9YRNxKxAgO34kwVlXB
   rYdl/B2fPCXAkRrkxbOklnJ4rAYG7WC/MIHHzV9qYfWjHfdnYDR59zo2t
   y6u2+trt3J0qkD5tfplyHrz/J62ZpPWfYsOmmmjnVGEcJX+SOfeQgd5PN
   khqa920xcREr4R6hPi0yl4l7UNDNe5XE64DpscirDEB5OKp+UxdfuZF2T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244346"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244346"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465216"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465216"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 09/20] ASoC: SOF: Intel: hda-dai-ops: add/select DMA ops for
 SSP
Date: Mon,  7 Aug 2023 16:09:48 -0500
Message-Id: <20230807210959.506849-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DROPEEPG6J6EGXAD6XLGKTHQ2UAN4DXP
X-Message-ID-Hash: DROPEEPG6J6EGXAD6XLGKTHQ2UAN4DXP
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

The DMA widget ops are almost similar to the HDaudio ones, with the
exception of codec_dai_set_hext_stream() which is not relevant and the
format calculation which isn't dependent on the codec dai.

The DMA ops can be selected only starting with ACE_2_0.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 53 ++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index e9ae38916434..05ef77be6435 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -7,6 +7,7 @@
 
 #include <sound/pcm_params.h>
 #include <sound/hdaudio_ext.h>
+#include <sound/hda-mlink.h>
 #include <sound/sof/ipc4/header.h>
 #include <uapi/sound/sof/header.h>
 #include "../ipc4-priv.h"
@@ -219,6 +220,31 @@ static struct hdac_ext_link *hda_get_hlink(struct snd_sof_dev *sdev,
 	return snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
 }
 
+static unsigned int generic_calc_stream_format(struct snd_sof_dev *sdev,
+					       struct snd_pcm_substream *substream,
+					       struct snd_pcm_hw_params *params)
+{
+	unsigned int format_val;
+
+	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
+						 params_format(params),
+						 params_physical_width(params),
+						 0);
+
+	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
+		params_rate(params), params_channels(params), params_format(params));
+
+	return format_val;
+}
+
+static struct hdac_ext_link *ssp_get_hlink(struct snd_sof_dev *sdev,
+					   struct snd_pcm_substream *substream)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	return hdac_bus_eml_ssp_get_hlink(bus);
+}
+
 static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 				struct snd_pcm_substream *substream, int cmd)
 {
@@ -363,6 +389,19 @@ static const struct hda_dai_widget_dma_ops hda_ipc4_dma_ops = {
 	.get_hlink = hda_get_hlink,
 };
 
+static const struct hda_dai_widget_dma_ops ssp_ipc4_dma_ops = {
+	.get_hext_stream = hda_ipc4_get_hext_stream,
+	.assign_hext_stream = hda_assign_hext_stream,
+	.release_hext_stream = hda_release_hext_stream,
+	.setup_hext_stream = hda_setup_hext_stream,
+	.reset_hext_stream = hda_reset_hext_stream,
+	.pre_trigger = hda_ipc4_pre_trigger,
+	.trigger = hda_trigger,
+	.post_trigger = hda_ipc4_post_trigger,
+	.calc_stream_format = generic_calc_stream_format,
+	.get_hlink = ssp_get_hlink,
+};
+
 static const struct hda_dai_widget_dma_ops hda_ipc4_chain_dma_ops = {
 	.get_hext_stream = hda_get_hext_stream,
 	.assign_hext_stream = hda_assign_hext_stream,
@@ -465,8 +504,13 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 	case SOF_INTEL_IPC4:
 	{
 		struct sof_ipc4_copier *ipc4_copier = sdai->private;
+		const struct sof_intel_dsp_desc *chip;
 
-		if (ipc4_copier->dai_type == SOF_DAI_INTEL_HDA) {
+		chip = get_chip_info(sdev->pdata);
+
+		switch (ipc4_copier->dai_type) {
+		case SOF_DAI_INTEL_HDA:
+		{
 			struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
 			struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 
@@ -475,6 +519,13 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 
 			return &hda_ipc4_dma_ops;
 		}
+		case SOF_DAI_INTEL_SSP:
+			if (chip->hw_ip_version < SOF_INTEL_ACE_2_0)
+				return NULL;
+			return &ssp_ipc4_dma_ops;
+		default:
+			break;
+		}
 		break;
 	}
 	default:
-- 
2.39.2

