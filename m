Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 337837EF249
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:07:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E799AE9;
	Fri, 17 Nov 2023 13:06:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E799AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700222861;
	bh=yMFZO1XFVSMnVTs0FKW+mfiZ2iIU7XgPnUanFhVdXKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iQx5pwAXw1ucYE4EBH3uZn3FC03DGbFfzFkFmBdKJjMyQ9YGr8uqNzCnqiawSZhh7
	 DbUTIIH71COVDaNcCZekXoFFYQFTKEj2gG0ZlbBUfOh0z7e/jKWg88wg2V1aqZyjob
	 rhAOjqKgK2vBKxIArNiG6n8rI+oZWF5MfDKllHu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CD0DF805D7; Fri, 17 Nov 2023 13:05:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 434F4F805D9;
	Fri, 17 Nov 2023 13:05:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D139BF8056F; Fri, 17 Nov 2023 13:04:55 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F3F56F80570
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 13:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3F56F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Smg5zmFN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222670; x=1731758670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yMFZO1XFVSMnVTs0FKW+mfiZ2iIU7XgPnUanFhVdXKo=;
  b=Smg5zmFNBmHQMx61KPeHNk7n5gCiwvnDTtTHqLRUgJCLvee038Z03pqL
   FHYym0wMKRXSaN+ys869DC3TGJpN1bl3yZR0DWYkzEek1ju2wBRH1AJ+6
   Mzb1g/opuSp2tkvc9h+x02o8sEGHzwINwbLqrAL+yFK7vqQhmi+AdzGkD
   RZL+MvXVfh/0mtyPbYixUOGbmtbHK0pmvcsBJp5cOPl8MkVtqesPvdxBR
   qOMkaHKJytmHmD9Aqld816QxxpWvM5JsQRF2tv0YTCoOGdIW+bif2hjaI
   ygm4XpYhzBlaNLCQm42aI+IwqmvmE2mLXD1+GvqkEY8RE9xpDgp5Um1nz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675284"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="381675284"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:04:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110206"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="883110206"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:25 -0800
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
Subject: [PATCH v5 11/16] ASoC: Intel Skylake: Switch to new stream-format
 interface
Date: Fri, 17 Nov 2023 13:06:05 +0100
Message-Id: <20231117120610.1755254-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DTXUSILGJPTPGCA3IM6KOJUSIMHCW73X
X-Message-ID-Hash: DTXUSILGJPTPGCA3IM6KOJUSIMHCW73X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTXUSILGJPTPGCA3IM6KOJUSIMHCW73X/>
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
 sound/soc/intel/skylake/skl-pcm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index d0c02e8a6785..4d52e3b35850 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -127,6 +127,7 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	unsigned int format_val;
 	struct hdac_stream *hstream;
 	struct hdac_ext_stream *stream;
+	unsigned int bits;
 	int err;
 
 	hstream = snd_hdac_get_stream(bus, params->stream,
@@ -137,8 +138,9 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	stream = stream_to_hdac_ext_stream(hstream);
 	snd_hdac_ext_stream_decouple(bus, stream, true);
 
-	format_val = snd_hdac_calc_stream_format(params->s_freq,
-			params->ch, params->format, params->host_bps, 0);
+	bits = snd_hdac_stream_format_bits(params->format, SNDRV_PCM_SUBFORMAT_STD,
+					   params->host_bps);
+	format_val = snd_hdac_stream_format(params->ch, bits, params->s_freq);
 
 	dev_dbg(dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
 		format_val, params->s_freq, params->ch, params->format);
@@ -165,6 +167,7 @@ int skl_pcm_link_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	struct hdac_ext_stream *stream;
 	struct hdac_ext_link *link;
 	unsigned char stream_tag;
+	unsigned int bits;
 
 	hstream = snd_hdac_get_stream(bus, params->stream,
 					params->link_dma_id + 1);
@@ -173,8 +176,10 @@ int skl_pcm_link_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 
 	stream = stream_to_hdac_ext_stream(hstream);
 	snd_hdac_ext_stream_decouple(bus, stream, true);
-	format_val = snd_hdac_calc_stream_format(params->s_freq, params->ch,
-					params->format, params->link_bps, 0);
+
+	bits = snd_hdac_stream_format_bits(params->format, SNDRV_PCM_SUBFORMAT_STD,
+					   params->link_bps);
+	format_val = snd_hdac_stream_format(params->ch, bits, params->s_freq);
 
 	dev_dbg(dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
 		format_val, params->s_freq, params->ch, params->format);
-- 
2.25.1

