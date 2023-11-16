Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D27EDFBD
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 12:26:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 820E2DF5;
	Thu, 16 Nov 2023 12:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 820E2DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700133964;
	bh=7Sn7Vlvm+H31slXD2xR054WW/r6iHg6RkCypVi0YYB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MmJL4lKtMsyh6LkCKBG4qnNwBTT9jvRCxuUKZUUwIS7HKT/IYlvpfAFzmRjWP/2hH
	 kKsi/Wl9vMMvhFptgd5h1gaq11BJHw9ojUkQ8amK0cHURFCbNhiGlcVhnVH5Abi7kP
	 WfO8ToE1IcOp70OCaXODTSNCGo3lZmrUDc+zPajw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E820F805F6; Thu, 16 Nov 2023 12:22:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3397EF805F0;
	Thu, 16 Nov 2023 12:22:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D8D3F805EE; Thu, 16 Nov 2023 12:22:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0518BF805BB
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 12:22:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0518BF805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QXVEYUoW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133758; x=1731669758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Sn7Vlvm+H31slXD2xR054WW/r6iHg6RkCypVi0YYB4=;
  b=QXVEYUoWHlWpgpPOe/O+w4J0IrWwneniaRxPW4q7BtroNAwv6ntvKbV+
   CTg9mwetnRnhljWBDhwrTA9hFggIupD6mQE26T+WLpxL1ID2YZK+9iUHt
   L6za6HeUg70aF7zMHWrdXCcZnDimvZr6n9Ag0prztBmfw291qk0GfGD1F
   h1f4baAb/JzoLH0XItTiANqP3LeNvR0ycr2yfRHA8cQB3CtuDGhea/ZE6
   GxjyZlV9do2AY9RH9H0zzPl/qmsjndxrOTpuwzUJ98JvFkgS3vu53kgHQ
   AUoO02bxVicavvpU4HjCbFxpBJdNpdx190gI+7q1lk4r75KCDhUomQTlS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457562066"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600";
   d="scan'208";a="457562066"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 03:22:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200";
   d="scan'208";a="6698269"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:22:10 -0800
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
Subject: [PATCH v4 14/16] ALSA: hda: Drop snd_hdac_calc_stream_format()
Date: Thu, 16 Nov 2023 12:22:53 +0100
Message-Id: <20231116112255.1584795-15-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116112255.1584795-1-cezary.rojewski@intel.com>
References: <20231116112255.1584795-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XM574Y2M3T66MJT4F6AFZTCAX2YTOIUM
X-Message-ID-Hash: XM574Y2M3T66MJT4F6AFZTCAX2YTOIUM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XM574Y2M3T66MJT4F6AFZTCAX2YTOIUM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are no users of the function.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio.h |  5 ----
 sound/hda/hdac_device.c | 61 -----------------------------------------
 2 files changed, 66 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 964ccf1d8b5b..2a8a763a3c14 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -145,11 +145,6 @@ unsigned int snd_hdac_stream_format_bps(snd_pcm_format_t format, snd_pcm_subform
 unsigned int snd_hdac_stream_format(unsigned int channels, unsigned int bps, unsigned int rate);
 unsigned int snd_hdac_spdif_stream_format(unsigned int channels, unsigned int bps,
 					  unsigned int rate, unsigned short spdif_ctls);
-unsigned int snd_hdac_calc_stream_format(unsigned int rate,
-					 unsigned int channels,
-					 snd_pcm_format_t format,
-					 unsigned int maxbps,
-					 unsigned short spdif_ctls);
 int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
 				 u32 *ratesp, u64 *formatsp, u32 *subformatsp,
 				 unsigned int *bpsp);
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index f885724d10b0..bcc4d90201b1 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -849,67 +849,6 @@ unsigned int snd_hdac_spdif_stream_format(unsigned int channels, unsigned int bp
 }
 EXPORT_SYMBOL_GPL(snd_hdac_spdif_stream_format);
 
-/**
- * snd_hdac_calc_stream_format - calculate the format bitset
- * @rate: the sample rate
- * @channels: the number of channels
- * @format: the PCM format (SNDRV_PCM_FORMAT_XXX)
- * @maxbps: the max. bps
- * @spdif_ctls: HD-audio SPDIF status bits (0 if irrelevant)
- *
- * Calculate the format bitset from the given rate, channels and th PCM format.
- *
- * Return zero if invalid.
- */
-unsigned int snd_hdac_calc_stream_format(unsigned int rate,
-					 unsigned int channels,
-					 snd_pcm_format_t format,
-					 unsigned int maxbps,
-					 unsigned short spdif_ctls)
-{
-	int i;
-	unsigned int val = 0;
-
-	for (i = 0; rate_bits[i].hz; i++)
-		if (rate_bits[i].hz == rate) {
-			val = rate_bits[i].hda_fmt;
-			break;
-		}
-	if (!rate_bits[i].hz)
-		return 0;
-
-	if (channels == 0 || channels > 8)
-		return 0;
-	val |= channels - 1;
-
-	switch (snd_pcm_format_width(format)) {
-	case 8:
-		val |= AC_FMT_BITS_8;
-		break;
-	case 16:
-		val |= AC_FMT_BITS_16;
-		break;
-	case 20:
-	case 24:
-	case 32:
-		if (maxbps >= 32 || format == SNDRV_PCM_FORMAT_FLOAT_LE)
-			val |= AC_FMT_BITS_32;
-		else if (maxbps >= 24)
-			val |= AC_FMT_BITS_24;
-		else
-			val |= AC_FMT_BITS_20;
-		break;
-	default:
-		return 0;
-	}
-
-	if (spdif_ctls & AC_DIG1_NONAUDIO)
-		val |= AC_FMT_TYPE_NON_PCM;
-
-	return val;
-}
-EXPORT_SYMBOL_GPL(snd_hdac_calc_stream_format);
-
 static unsigned int query_pcm_param(struct hdac_device *codec, hda_nid_t nid)
 {
 	unsigned int val = 0;
-- 
2.25.1

