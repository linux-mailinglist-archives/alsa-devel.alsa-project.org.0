Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A820E7EF244
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:06:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 082C1E0E;
	Fri, 17 Nov 2023 13:05:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 082C1E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700222801;
	bh=+fWRWVCYW5uARD7h3RAGmaEQlLouiu/hBV+2DhtxCOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BgX7n+xSJ2EhyZbjC9n/IfisEsj13WRf86jg4zvgfIWuuN+3nflVSTobg2UdFa5RI
	 wLajEmKLwfDo/nVgev4KUOfSZ9QFY6vxfSS067Ikd8yWLB8ludjWtSt6wBN/Sg0hEz
	 /wCC1rAU3O5LqGAAE3ZhOAYKRkWe9In7i9YCKS5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFB19F805BF; Fri, 17 Nov 2023 13:04:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E13F80564;
	Fri, 17 Nov 2023 13:04:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EB10F8058C; Fri, 17 Nov 2023 13:04:50 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A0CCF802E8
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 13:04:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A0CCF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lvemcK26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222663; x=1731758663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+fWRWVCYW5uARD7h3RAGmaEQlLouiu/hBV+2DhtxCOM=;
  b=lvemcK26BDhqnLyqaFP+6k7Mxaklfcs7YfmfIZDdphdgeUUyEulWsuyM
   SN603Z366fX5dZ2Ykc4ga4Rcy0WPhOOXzyJR7IztiP9SDIF9Nuo2JiG9r
   7mjxBahJzRypsdo4DRHptQaG5uLCGVqDI0DS6t7KLeDAzZ1nNvy6vBCm7
   HVrC4JX5WpNfKm8GsP3ZOi9F0rEi+1iCBOo3pXAj/jmOfwQ0X8paZv74J
   5bgB8YRsGzu3f0TFmYLAdM4oeTxvFJ2UALRQsOZGO3PSewKkZE/4k/yXT
   JcXJ57xwC6HgwuDhL9Ur0l79zj4SsXm5AA42ZIdy8T7c5TlOyrgsEIBEE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675255"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="381675255"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:04:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110186"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="883110186"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:18 -0800
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
Subject: [PATCH v5 08/16] ASoC: codecs: hda: Switch to new stream-format
 interface
Date: Fri, 17 Nov 2023 13:06:02 +0100
Message-Id: <20231117120610.1755254-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QDIHMTOUBWHN743OP3THLROP5I55JBM6
X-Message-ID-Hash: QDIHMTOUBWHN743OP3THLROP5I55JBM6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QDIHMTOUBWHN743OP3THLROP5I55JBM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

While at it, complete PCM stream initialization with subformat options.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/hda-dai.c | 7 +++++--
 sound/soc/codecs/hda.c     | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hda-dai.c b/sound/soc/codecs/hda-dai.c
index 5371ff086261..7bd7ddcd810f 100644
--- a/sound/soc/codecs/hda-dai.c
+++ b/sound/soc/codecs/hda-dai.c
@@ -76,13 +76,16 @@ static int hda_codec_dai_prepare(struct snd_pcm_substream *substream, struct snd
 	struct hdac_stream *stream;
 	struct hda_codec *codec;
 	unsigned int format;
+	unsigned int bits;
 	int ret;
 
 	codec = dev_to_hda_codec(dai->dev);
 	stream = substream->runtime->private_data;
 	stream_info = snd_soc_dai_get_dma_data(dai, substream);
-	format = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
-					     runtime->sample_bits, 0);
+
+	bits = snd_hdac_stream_format_bits(runtime->format, runtime->subformat,
+					   stream_info->maxbps);
+	format = snd_hdac_stream_format(runtime->channels, bits, runtime->rate);
 
 	ret = snd_hda_codec_prepare(codec, stream_info, stream->stream_tag, format, substream);
 	if (ret < 0) {
diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index d57b043d6bfe..d2117e36ddd1 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -52,6 +52,7 @@ static int hda_codec_create_dais(struct hda_codec *codec, int pcm_count,
 		stream->channels_max = pcm->stream[dir].channels_max;
 		stream->rates = pcm->stream[dir].rates;
 		stream->formats = pcm->stream[dir].formats;
+		stream->subformats = pcm->stream[dir].subformats;
 		stream->sig_bits = pcm->stream[dir].maxbps;
 
 capture_dais:
@@ -71,6 +72,7 @@ static int hda_codec_create_dais(struct hda_codec *codec, int pcm_count,
 		stream->channels_max = pcm->stream[dir].channels_max;
 		stream->rates = pcm->stream[dir].rates;
 		stream->formats = pcm->stream[dir].formats;
+		stream->subformats = pcm->stream[dir].subformats;
 		stream->sig_bits = pcm->stream[dir].maxbps;
 	}
 
-- 
2.25.1

