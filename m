Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 977A47EDFAE
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 12:25:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18FA8E75;
	Thu, 16 Nov 2023 12:24:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18FA8E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700133934;
	bh=28ZTZt7AMRFjHUJBpQQ17HXdf9w4PqYBZaOJYNga+eQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HkM9ibk5tH9XhfeslE9zrZimjK0jYVmWtIz9e8kjL9s96O7DuJcgMBDtklE3E8l4r
	 rEAVG/4UizoZj2ZWTlGNym3EgaO/tMjYVCxWHjhE3T5RIcrIPy34n0rxBR2NtzM2G1
	 4ehvi7yVvTItLaJdZ0AiKq0uGMHb+ItLAPaQ94tg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CF03F805E1; Thu, 16 Nov 2023 12:22:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28D21F805D2;
	Thu, 16 Nov 2023 12:22:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4A8CF805E8; Thu, 16 Nov 2023 12:22:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D175F805D2
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 12:22:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D175F805D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nFtzFPF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133757; x=1731669757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=28ZTZt7AMRFjHUJBpQQ17HXdf9w4PqYBZaOJYNga+eQ=;
  b=nFtzFPF4/B557TuyzDGs8wCBaId+AQOvn1oSGU5om8kMnFRcGVjwqTwk
   E9UztCVC+Y/3hm/1xEHwIrdlB9pIJKv5UlBrQS0JrBfofVSqJ1XBh21xr
   Fx+bG5/8zD0PORGhPIdpjoYDjkffUE3MGLoAcA/FtYxUKhqekHLpZX+Zc
   twPtfJmY222/uj8u/7H7veEgm54IjX/JqwRCXYJphAnHGL8aBhDKL876i
   GkzXnBLc+eIZ05l+JklirxmW/aECpemCFh4no7OxrVTGs0NfX3r3yAqyZ
   f1bnCKHrQp/lg//tZHiF+DBlbcNcJHjUlPvBL6yc4bLxNs2S8SsYZbWkB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457562048"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600";
   d="scan'208";a="457562048"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 03:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200";
   d="scan'208";a="6698261"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:22:04 -0800
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
Subject: [PATCH v4 12/16] ASoC: SOF: Intel: Switch to new stream-format
 interface
Date: Thu, 16 Nov 2023 12:22:51 +0100
Message-Id: <20231116112255.1584795-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116112255.1584795-1-cezary.rojewski@intel.com>
References: <20231116112255.1584795-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JU3765RUNGG22AAKUGZNU6Z7OLVW2WDY
X-Message-ID-Hash: JU3765RUNGG22AAKUGZNU6Z7OLVW2WDY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JU3765RUNGG22AAKUGZNU6Z7OLVW2WDY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
 sound/soc/sof/intel/hda-dai-ops.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 87935554b1e4..94524f0aa1f6 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -208,14 +208,15 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int link_bps;
 	unsigned int format_val;
+	unsigned int bps;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		link_bps = codec_dai->driver->playback.sig_bits;
 	else
 		link_bps = codec_dai->driver->capture.sig_bits;
+	bps = snd_hdac_stream_format_bps(params_format(params), SNDRV_PCM_SUBFORMAT_STD, link_bps);
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
-						 params_format(params), link_bps, 0);
+	format_val = snd_hdac_stream_format(params_channels(params), bps, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), params_channels(params), params_format(params));
@@ -238,11 +239,11 @@ static unsigned int generic_calc_stream_format(struct snd_sof_dev *sdev,
 					       struct snd_pcm_hw_params *params)
 {
 	unsigned int format_val;
+	unsigned int bps;
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
-						 params_format(params),
-						 params_physical_width(params),
-						 0);
+	bps = snd_hdac_stream_format_bps(params_format(params), SNDRV_PCM_SUBFORMAT_STD,
+					 params_physical_width(params));
+	format_val = snd_hdac_stream_format(params_channels(params), bps, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), params_channels(params), params_format(params));
@@ -258,6 +259,7 @@ static unsigned int dmic_calc_stream_format(struct snd_sof_dev *sdev,
 	snd_pcm_format_t format;
 	unsigned int channels;
 	unsigned int width;
+	unsigned int bps;
 
 	channels = params_channels(params);
 	format = params_format(params);
@@ -269,10 +271,8 @@ static unsigned int dmic_calc_stream_format(struct snd_sof_dev *sdev,
 		width = 32;
 	}
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), channels,
-						 format,
-						 width,
-						 0);
+	bps = snd_hdac_stream_format_bps(format, SNDRV_PCM_SUBFORMAT_STD, width);
+	format_val = snd_hdac_stream_format(channels, bps, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), channels, format);
-- 
2.25.1

