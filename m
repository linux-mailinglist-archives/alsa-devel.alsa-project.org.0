Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F4C7B3159
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 13:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C751EE76;
	Fri, 29 Sep 2023 13:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C751EE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695986828;
	bh=n6j/8JbNexZ4eZNndUruxtY9Vtx+V07GnvEiTnjwOq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kks+W4um4DI6b5iJNH92vl9M6iCAhA9Vb281mLzWTRES66MLHL4hLZkKmLsZvjT2s
	 ja8IJi4hLlGpWXSPcwUjZxr+BDVDi2m3sG+CRWDRo6h+C+Sz+9mO01GxCrrVaztgQY
	 SpVUl9qW+Plmu5gd9mq9wgrFBcTuB40gRt0CQ9+0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AD3FF805B0; Fri, 29 Sep 2023 13:25:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AF27F805A9;
	Fri, 29 Sep 2023 13:25:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F275F8047D; Fri, 29 Sep 2023 13:24:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17666F80551
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 13:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17666F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jeMLjf3J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695986682; x=1727522682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n6j/8JbNexZ4eZNndUruxtY9Vtx+V07GnvEiTnjwOq4=;
  b=jeMLjf3JvGDKKig28uQcWYKVAkfiA/OigU3FF2E0nPYr2oyxRFyk1U+8
   gsYupMK1tUNUYkcBjbR2tTD8vOLPq5MXKc3lBJYKlqkAJ70cZTEhMBwyR
   gRRa9vd3gcKon0vjJKOhFhUuaiawJEa2JNc4wlfbGHKRCW11C8eWR7mM2
   A49VTj+zYr3kfzuC+0Qj1P/EXsdgEk0V6GwL5XXdrj0XvL/OH/iAHNndg
   CeyEP5s5JzI14CO9ZHq2sOqfhWyaRJi4heYMdk70YOeaVfdTkSp6QMvzn
   ewU6Lumv8QMFk093hvv8L3GdWUuszyAI+uWgEsvput7+1HBMEb+1jlUyb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="880267"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="880267"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753353787"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="753353787"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga007.fm.intel.com with ESMTP; 29 Sep 2023 04:24:37 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 6/6] ASoC: Intel: avs: Drop superfluous stream decoupling
Date: Fri, 29 Sep 2023 13:24:36 +0200
Message-Id: <20230929112436.787058-7-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
References: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SSIU5WDBU6DO2YNCOX2MS7JKEESFHA7W
X-Message-ID-Hash: SSIU5WDBU6DO2YNCOX2MS7JKEESFHA7W
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSIU5WDBU6DO2YNCOX2MS7JKEESFHA7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

HDAudio streams are decoupled on startup() and, decoupling them again on
prepare() is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/pcm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 3f1f98e1a31a..7b84197bd8b9 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -350,7 +350,6 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
 						 runtime->sample_bits, 0);
 
-	snd_hdac_ext_stream_decouple(bus, link_stream, true);
 	snd_hdac_ext_stream_reset(link_stream);
 	snd_hdac_ext_stream_setup(link_stream, format_val);
 
@@ -615,7 +614,6 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 		return 0;
 
 	bus = hdac_stream(host_stream)->bus;
-	snd_hdac_ext_stream_decouple(bus, data->host_stream, true);
 	snd_hdac_stream_reset(hdac_stream(host_stream));
 
 	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
-- 
2.34.1

