Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D51107A4ABF
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 15:44:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71FFFA4D;
	Mon, 18 Sep 2023 15:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71FFFA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695044691;
	bh=FfBIQhnDOMOczPVWM3Pz9qcen/kHIrK/vME9pRWKLoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CLCiQ835vivjKfCEPFLSAhDaK6Xxwff6YpJ9RYR1gzs7A5D9sJ+ws0Ipu1XpvHMuZ
	 0ZeoJFTB+LWcl33WmduE5CZymMmz5FcIq8k6JvcOJJ++Ya/E0HKa4Nz/r6jPdgbe6M
	 toNWQjCa5rVVB1/Iv56leuEufoyxOlaySFuXrfqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6B64F8060C; Mon, 18 Sep 2023 15:41:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14369F8060C;
	Mon, 18 Sep 2023 15:41:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21317F805D3; Mon, 18 Sep 2023 15:40:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C604FF805C0
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 15:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C604FF805C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b4OVX7/y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695044438; x=1726580438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FfBIQhnDOMOczPVWM3Pz9qcen/kHIrK/vME9pRWKLoA=;
  b=b4OVX7/yL/ofTUWSrg5TKlxcucpmUiF/ggLnchVHO/NEQTiRP46mFl3r
   D5GOm2th5Pjz5w4iKWs3reGl0NPtOXOJ/DfpH13AZ5GAuFO3ZKTEiXttP
   j+UhiSr1i+0yUuWBxkHeHsDLtOUwzH8fYt42tz+OG2Mp/c5fWxZreDk3i
   zbgccmCJGIBIsCRnTbC4NU+YObjjFJQVoyo0p7CEsE92ECGJgOLgvj3nr
   UhvOS37ZRrDIu48KCECFL0UIeKvrBavzw2jqJHAGedGF0U4/yCPt6PWbe
   2R0gBa4p8yrjzpRaec14Spcxve28G9HSln5IrnPj63J/q375SJ+yMu222
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466003850"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="466003850"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="745826038"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="745826038"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga002.jf.intel.com with ESMTP; 18 Sep 2023 06:40:30 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 13/17] ASoC: SOF: Intel: Switch to new stream-format
 interface
Date: Mon, 18 Sep 2023 15:39:36 +0200
Message-Id: <20230918133940.3676091-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230918133940.3676091-1-cezary.rojewski@intel.com>
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WW6UKULWOBAPAEG4PDBN4NKWEP72SGI7
X-Message-ID-Hash: WW6UKULWOBAPAEG4PDBN4NKWEP72SGI7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WW6UKULWOBAPAEG4PDBN4NKWEP72SGI7/>
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
 sound/soc/sof/intel/hda-dai-ops.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 494ced2b746e..fb5989888ff4 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -208,14 +208,15 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
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
-- 
2.25.1

