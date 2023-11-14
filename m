Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 248C77EB797
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 21:15:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FE8BE73;
	Tue, 14 Nov 2023 21:14:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FE8BE73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699992930;
	bh=OFpgVgSqtLFg8U/AS3pehGhBTGCjSpz4vubtvS1Pn1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F8PtdwTMmGIJK0rTdpG6kFFdvWFdd+9fFXYbf/Y82nsLtbSDI3UoXTeY/a6u5mExV
	 W672+O93VsdHkzqMEXRQm/R3POEHGbGO3w9oBtMk0A2402vfxk65v8MlnKpNH9p/mr
	 XiJS6ioSPY5z+9WgTGIIl+NlU7cKCwFCF4KJzy2A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 589FAF80600; Tue, 14 Nov 2023 21:12:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C55BEF805F0;
	Tue, 14 Nov 2023 21:12:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F65EF805C2; Tue, 14 Nov 2023 21:11:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 724CAF80093
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 21:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 724CAF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MN3CIFAI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992711; x=1731528711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OFpgVgSqtLFg8U/AS3pehGhBTGCjSpz4vubtvS1Pn1g=;
  b=MN3CIFAIviIECRkOLX35Ke020L3ZvU+XairJNfCfMqQkWFydv4J5MGyY
   z+wmNkyuXNn+ms4409tK3ixKKwoPoWBD/wFx6wVj7mX02egneAvbfVFus
   w1z26BM4BPYLrmOPPjNkETv6jzmMejIkrNG8QWJOOjJccR+S/FyJxz9v/
   ldc6AAgoSFLGHDZ0tQt7pNGFoRzQy0zMmMm3YDqM8utgUmTqbvAzHZZh/
   9tHPCSFBadqzmjD91SLMUxS3i7PqQZD/b9ug6eMXrMiQPLnHITAaqQW6P
   QWaGeaMg6i9X0EAjBF9LHWcscz6QrLUkVEYaHBWrpNXlU6eevL85RtNVp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381134789"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="381134789"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 12:11:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855422452"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="855422452"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 12:11:47 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 14/16] ALSA: hda: Drop snd_hdac_calc_stream_format()
Date: Tue, 14 Nov 2023 21:13:15 +0100
Message-Id: <20231114201317.1348066-15-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231114201317.1348066-1-cezary.rojewski@intel.com>
References: <20231114201317.1348066-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CCYFH6RNDGLMLQNAJN43U2YCA2JUWJ3S
X-Message-ID-Hash: CCYFH6RNDGLMLQNAJN43U2YCA2JUWJ3S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCYFH6RNDGLMLQNAJN43U2YCA2JUWJ3S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are no users of the function.

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

