Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C9E78526B
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 10:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6637A844;
	Wed, 23 Aug 2023 10:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6637A844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692778318;
	bh=dx91wGcbcKiYReuN+nPdxxpptTHA9nnw+fhAZ4Q7cmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EYHo+id7MJAnnQVrmencI6gReZ9Gh1eYQdHTh8HJidORNUuRi/zrBT0T1GHKXqz8M
	 lCi1Hwx5e8d0ZiJuhsbdCBdQRTXRnKXaEj9BI8t+Htz3GPQn05VyxU30+PJuw+C3bg
	 zSIPllfI5mVb3LcPoxZJrpgBNCOPUMw2AKC5isV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 249EDF80605; Wed, 23 Aug 2023 10:07:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C49EF80604;
	Wed, 23 Aug 2023 10:07:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71223F8023B; Wed, 23 Aug 2023 10:06:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27889F8025F
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 10:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27889F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ER+gXRPZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692777993; x=1724313993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dx91wGcbcKiYReuN+nPdxxpptTHA9nnw+fhAZ4Q7cmk=;
  b=ER+gXRPZlVcNvnf2hOKJd0qc2D4hiVhmCyNxSH03ie33iN1jmykd3eO+
   WKHVz5ksP6gIlLyg3oR5x62Zlz2jSY/LQrz96RzHDkICaxVpl3x/TG4I1
   anG+RB5EbJOyusl3w7RIUDE+aPWKX8VrLmBON3cSA1lXVGyTbVzDqF2HT
   gsOYNxZQIAS04cDOfQjyIxiHuXeE6Nyhvv2/6MdM2/NXOSnHSS2aGopGd
   4QlSLxr7t5h8bS9I3T6FCacV3BEJVUlCTgbattReo+O5ppugAJBrfNcU9
   0GUALIT0p5TrOUmhXQ7GgZ/TJDGM0mf7LIS2RRaq+JL+WxC7wuVxMxsER
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372988121"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="372988121"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="766042757"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="766042757"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 01:06:29 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 12/17] ASoC: Intel Skylake: Switch to new stream-format
 interface
Date: Wed, 23 Aug 2023 10:05:41 +0200
Message-Id: <20230823080546.2224713-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823080546.2224713-1-cezary.rojewski@intel.com>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7YQ3Z4YNWMXN57JORM4BYRBCQYG3BL5V
X-Message-ID-Hash: 7YQ3Z4YNWMXN57JORM4BYRBCQYG3BL5V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YQ3Z4YNWMXN57JORM4BYRBCQYG3BL5V/>
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
 sound/soc/intel/skylake/skl-pcm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index ac3dc8c63c26..4613a1335819 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -128,6 +128,7 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	unsigned int format_val;
 	struct hdac_stream *hstream;
 	struct hdac_ext_stream *stream;
+	unsigned int bps;
 	int err;
 
 	hstream = snd_hdac_get_stream(bus, params->stream,
@@ -138,8 +139,8 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	stream = stream_to_hdac_ext_stream(hstream);
 	snd_hdac_ext_stream_decouple(bus, stream, true);
 
-	format_val = snd_hdac_calc_stream_format(params->s_freq,
-			params->ch, params->format, params->host_bps, 0);
+	bps = snd_hdac_stream_format_bps(params->format, SNDRV_PCM_SUBFORMAT_STD, params->host_bps);
+	format_val = snd_hdac_stream_format(params->ch, bps, params->s_freq);
 
 	dev_dbg(dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
 		format_val, params->s_freq, params->ch, params->format);
@@ -177,6 +178,7 @@ int skl_pcm_link_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	struct hdac_ext_stream *stream;
 	struct hdac_ext_link *link;
 	unsigned char stream_tag;
+	unsigned int bps;
 
 	hstream = snd_hdac_get_stream(bus, params->stream,
 					params->link_dma_id + 1);
@@ -185,8 +187,9 @@ int skl_pcm_link_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 
 	stream = stream_to_hdac_ext_stream(hstream);
 	snd_hdac_ext_stream_decouple(bus, stream, true);
-	format_val = snd_hdac_calc_stream_format(params->s_freq, params->ch,
-					params->format, params->link_bps, 0);
+
+	bps = snd_hdac_stream_format_bps(params->format, SNDRV_PCM_SUBFORMAT_STD, params->link_bps);
+	format_val = snd_hdac_stream_format(params->ch, bps, params->s_freq);
 
 	dev_dbg(dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
 		format_val, params->s_freq, params->ch, params->format);
-- 
2.25.1

