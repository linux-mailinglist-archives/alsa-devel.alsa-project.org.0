Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D67978526E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 10:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B47227F1;
	Wed, 23 Aug 2023 10:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B47227F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692778339;
	bh=z1C/1ra+Jw69lBFjbEpEPLpWSIEF15eimBoH/bFoe6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dASkEeIv3AqMj1EIFElDSZ2ISs0W/5q6CZ6+HKiZM9IXaILSai4dGNBnjyn9e3koz
	 SRoq6XSJ81MSdgrwNBsD30SVRdSAhvFjxC0j94CFaITzx/h0gjeEZio86gb1+14SGI
	 HqFeCxGPXJ3E2Y4d5S6FnEPslwdZqiD8hmqoEUyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B925F80614; Wed, 23 Aug 2023 10:07:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9AA9F80607;
	Wed, 23 Aug 2023 10:07:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 539E3F8023B; Wed, 23 Aug 2023 10:06:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFDF5F804F3
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 10:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFDF5F804F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kkjfOqei
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692777995; x=1724313995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z1C/1ra+Jw69lBFjbEpEPLpWSIEF15eimBoH/bFoe6M=;
  b=kkjfOqeimcmQhjXUH0lWM6TLoddVPA7V1kKmYuN4pNzWdiBYnAayjxf/
   KlT9BZIJ9Pw1kgJ4AIBSGgLcdm1Viouc5dxGgojEsti8XI7EYaNcbwgpN
   KjhJR6Gp2ylpSrrQ8Fd//NXrbR0akHjFrr0LmCWGJaUUjME2MngLRm4un
   3K5pNdAMzYROBjh4JKFqgg2BRPgdb7QVUm9uypYddvPhsANVeN6Grl89u
   lUUDmUERDPSQJCHTeDqLzIa9tk8jgGW8OKUIsufcWTnQWF4WgrOjheQLf
   cj4eTApzEyvQd533S1FbrdxqLw+S9cZ5rJsLxw53e277RWfm03GkZoKm3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372988126"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="372988126"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="766042768"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="766042768"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 01:06:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 13/17] ASoC: SOF: Intel: Switch to new stream-format interface
Date: Wed, 23 Aug 2023 10:05:42 +0200
Message-Id: <20230823080546.2224713-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823080546.2224713-1-cezary.rojewski@intel.com>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EJPEXZFP7TNE2DLOFV7QWYRJQ7SAW564
X-Message-ID-Hash: EJPEXZFP7TNE2DLOFV7QWYRJQ7SAW564
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EJPEXZFP7TNE2DLOFV7QWYRJQ7SAW564/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 494ced2b746e..18e06712372f 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -213,9 +213,10 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 		link_bps = codec_dai->driver->playback.sig_bits;
 	else
 		link_bps = codec_dai->driver->capture.sig_bits;
+	link_bps = snd_hdac_stream_format_bps(params_format(params), SNDRV_PCM_SUBFORMAT_STD,
+					      link_bps);
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
-						 params_format(params), link_bps, 0);
+	format_val = snd_hdac_stream_format(params_channels(params), link_bps, params_rate(params));
 
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

