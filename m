Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D46807EF24A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:07:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28C24E73;
	Fri, 17 Nov 2023 13:06:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28C24E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700222867;
	bh=4ttkQ7PIQkKT2/3gCz8weikAO2wQPzi85VUSExLas40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ou+GFUV96tmLsSHO+mnuahi/rDDL3fMnqj6WBsQQn8nP5wYQxjzo4TomO2lXil7Rn
	 4M5BRBAD37UM4b35QJ6e+RcdRYi5M5aEYVwg4vOLZoe5PQH0wjUjwu90Aom37zxN/k
	 Aqf12r1JzxmMxrig/JUcIvZqDANkI0k1R1htLjAg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E7B1F805E9; Fri, 17 Nov 2023 13:05:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 332B2F805DA;
	Fri, 17 Nov 2023 13:05:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5196AF805B3; Fri, 17 Nov 2023 13:04:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D663F80564
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 13:04:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D663F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f+Ns694L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222671; x=1731758671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4ttkQ7PIQkKT2/3gCz8weikAO2wQPzi85VUSExLas40=;
  b=f+Ns694L4Nag6KM7cN2uMUfa12o3LzOf9Nv+daLjt4Y+6LbXoFpN9irQ
   tqMPUY0S/pug2rgq0xstSMsykLaPHMbvawBCqfkz015Qm6GdAiBbcqu3Q
   RRUQu8LuZ89rYb9LIpactZBeNl5PmTn90eMaxEqyUzy2hR/TtnYQZPMpA
   FRM591zViPuO/ob+q/0ozPI1fc3JFP+zWGJ3AaZT9EkG4C1SlhVHxOORf
   pe7rYW06DQ1dK9DquOIJbumzZCAXZhWIzhzR/a8C6Eun3XdWYpFZzPteH
   0F0vxrWeVTqC84A2TTce4ba7bUyykto/79QAAbUSIk/ZK5zMTtGFIbPB3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675290"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="381675290"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:04:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110210"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="883110210"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:27 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5 12/16] ASoC: SOF: Intel: Switch to new stream-format
 interface
Date: Fri, 17 Nov 2023 13:06:06 +0100
Message-Id: <20231117120610.1755254-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GYKJDGAMS7UZXW2DPJ7HE5C6NIHBI4IH
X-Message-ID-Hash: GYKJDGAMS7UZXW2DPJ7HE5C6NIHBI4IH
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GYKJDGAMS7UZXW2DPJ7HE5C6NIHBI4IH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 87935554b1e4..55ce75db23e5 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -208,14 +208,16 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int link_bps;
 	unsigned int format_val;
+	unsigned int bits;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		link_bps = codec_dai->driver->playback.sig_bits;
 	else
 		link_bps = codec_dai->driver->capture.sig_bits;
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
-						 params_format(params), link_bps, 0);
+	bits = snd_hdac_stream_format_bits(params_format(params), SNDRV_PCM_SUBFORMAT_STD,
+					   link_bps);
+	format_val = snd_hdac_stream_format(params_channels(params), bits, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), params_channels(params), params_format(params));
@@ -238,11 +240,11 @@ static unsigned int generic_calc_stream_format(struct snd_sof_dev *sdev,
 					       struct snd_pcm_hw_params *params)
 {
 	unsigned int format_val;
+	unsigned int bits;
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
-						 params_format(params),
-						 params_physical_width(params),
-						 0);
+	bits = snd_hdac_stream_format_bits(params_format(params), SNDRV_PCM_SUBFORMAT_STD,
+					   params_physical_width(params));
+	format_val = snd_hdac_stream_format(params_channels(params), bits, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), params_channels(params), params_format(params));
@@ -258,6 +260,7 @@ static unsigned int dmic_calc_stream_format(struct snd_sof_dev *sdev,
 	snd_pcm_format_t format;
 	unsigned int channels;
 	unsigned int width;
+	unsigned int bits;
 
 	channels = params_channels(params);
 	format = params_format(params);
@@ -269,10 +272,8 @@ static unsigned int dmic_calc_stream_format(struct snd_sof_dev *sdev,
 		width = 32;
 	}
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), channels,
-						 format,
-						 width,
-						 0);
+	bits = snd_hdac_stream_format_bits(format, SNDRV_PCM_SUBFORMAT_STD, width);
+	format_val = snd_hdac_stream_format(channels, bits, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), channels, format);
-- 
2.25.1

