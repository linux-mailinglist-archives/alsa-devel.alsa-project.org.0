Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02D27A4AC5
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 15:45:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A9D4E7D;
	Mon, 18 Sep 2023 15:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A9D4E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695044754;
	bh=LFcpTbihaq4oE6+nceMWbDLtj2UaWDKfxU0SSqFbylY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kE2H22aiGvSxerXqXmUjIn6TQs+BShlQrYtDt0GIOxQ6nDmaR4mYn2qsbXg5yIEm8
	 N7fj6vzUN5IrCYlKjaRr5Ak87RoGj38ygLJ7qAZuepjBttiE7eylo56bGPrx/+rMtc
	 hMlYbcOvzLThT5o7QdwmeicwwwP/ISxFHAvrUNY4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5241FF8047D; Mon, 18 Sep 2023 15:41:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 927CAF8047D;
	Mon, 18 Sep 2023 15:41:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8176FF805E6; Mon, 18 Sep 2023 15:40:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6A07F805B6
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 15:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6A07F805B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mPWcXmzs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695044438; x=1726580438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LFcpTbihaq4oE6+nceMWbDLtj2UaWDKfxU0SSqFbylY=;
  b=mPWcXmzs9lqx/BdR7ro/wykAD8G6wwMPfku1lWZmsMGYKxNhzVLLVn7A
   9RjkOyod7t7SYw6XNpKB90G+XePgpR4gxgwcljQzbY4E/a3Wdy643fZ2K
   4eqOYZ7DtwQvAh6FQ3FBXhj1tUKGC0xKgrCrjYu5ZaHwg8/K66DBlQWls
   yYWimQJVFwp3a0cL97GnzKC3vpfECkwRpnDifZxbNj4bWvkcmMxahdziA
   1MKgWX8uvG+aqANq6QNGVEotYggMR/V7KVG//AN70GCxSzhASwXShyEj4
   2nWbDji8pezC/HgpCC1WQMki9ITwTPscpG3uU4GO1+yiksaEqlqqqpvG9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466003872"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="466003872"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:40:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="745826080"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="745826080"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga002.jf.intel.com with ESMTP; 18 Sep 2023 06:40:35 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 15/17] ALSA: hda: Drop snd_hdac_calc_stream_format()
Date: Mon, 18 Sep 2023 15:39:38 +0200
Message-Id: <20230918133940.3676091-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230918133940.3676091-1-cezary.rojewski@intel.com>
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 276AW23ZD7RARB4HTQSHAKUBFJZH6DVD
X-Message-ID-Hash: 276AW23ZD7RARB4HTQSHAKUBFJZH6DVD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/276AW23ZD7RARB4HTQSHAKUBFJZH6DVD/>
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
index 589812c6f6ce..b6e4529279f9 100644
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
 				 u32 *ratesp, u64 *formatsp,
 				 const struct snd_pcm_subformat **subformatsp,
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index ff5f45b95be4..c1243315338e 100644
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

