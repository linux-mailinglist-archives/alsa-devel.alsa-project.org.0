Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6784A785261
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 10:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8804F868;
	Wed, 23 Aug 2023 10:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8804F868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692778247;
	bh=d/y3ZSzVnLQg+JYbhzlp4/k04uFxDZCewVaVB3x4u4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IjsHQpI/BWe58myUx3RkYeXcrIlA+vjYw9cMgcay2c+LCJBkdQWy4cxX+67s2oAlf
	 Yf3Xz4mBDRRKFhhAnFREuE2nHsESapRi3r63/4eQECQkFJW9bGWRsjptCHKCZTzy0/
	 geq5tZVdruvi4N8G4XAM0MB0KBDZwE2/pdQp/FGQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08038F805C7; Wed, 23 Aug 2023 10:07:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4DCBF805C8;
	Wed, 23 Aug 2023 10:07:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 305FCF8023B; Wed, 23 Aug 2023 10:06:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96227F800F5
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 10:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96227F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G6OtF18D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692777975; x=1724313975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d/y3ZSzVnLQg+JYbhzlp4/k04uFxDZCewVaVB3x4u4c=;
  b=G6OtF18DemJNiAQmaHpv5an16PXBK/Cl/lcWJ1F1Wjy2Oatig/YQ0uKx
   nhH2dq3OLC2jw+u2gji19wTQuJgd8JHO4DW/t97EzwINRmwcJTX3/cffF
   I0JuANOIe+QnqDR54lY27rkiGCRVwM8eqYtoDqefwIZLP7Yb5fZlk2Q+5
   EZuhXZ7pWtZmWZRYrA2RN35np5bHkz3Iq/rJ4Io0dvJ4I9WP0sSzx+zH4
   sOH0INqZGsvUIVZVTerneD5yqmYhxS9IsjvFo92y9iB3+GhTcwPapemX1
   /Ri9tqAvGixreGEsXgIdaxFw80U3dwBynRzuWVOcaSDf24/lLsBRLpaME
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372988033"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="372988033"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="766042676"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="766042676"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 01:06:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 04/17] ASoC: pcm: Honor subformat when configuring runtime
Date: Wed, 23 Aug 2023 10:05:33 +0200
Message-Id: <20230823080546.2224713-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823080546.2224713-1-cezary.rojewski@intel.com>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2IEMTATKOUOETG25HKZHEY75FV2EJLDK
X-Message-ID-Hash: 2IEMTATKOUOETG25HKZHEY75FV2EJLDK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IEMTATKOUOETG25HKZHEY75FV2EJLDK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Subformat options are ignored when setting up hardware parameters and
assigning PCM stream capabilities. Account for them to allow for
granular format selection.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h |  1 +
 sound/soc/soc-pcm.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index fa2337a3cf4c..05148d4ed0fd 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -619,6 +619,7 @@ enum snd_soc_trigger_order {
 struct snd_soc_pcm_stream {
 	const char *stream_name;
 	u64 formats;			/* SNDRV_PCM_FMTBIT_* */
+	u64 subformats;			/* SNDRV_PCM_SUBFMTBIT_* */
 	unsigned int rates;		/* SNDRV_PCM_RATE_* */
 	unsigned int rate_min;		/* min rate */
 	unsigned int rate_max;		/* max rate */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 3aa6b988cb4b..bceb90f0198d 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -526,6 +526,7 @@ static void soc_pcm_hw_init(struct snd_pcm_hardware *hw)
 	hw->channels_min	= 0;
 	hw->channels_max	= UINT_MAX;
 	hw->formats		= ULLONG_MAX;
+	hw->subformats		= ULLONG_MAX;
 }
 
 static void soc_pcm_hw_update_rate(struct snd_pcm_hardware *hw,
@@ -554,6 +555,12 @@ static void soc_pcm_hw_update_format(struct snd_pcm_hardware *hw,
 	hw->formats &= p->formats;
 }
 
+static void soc_pcm_hw_update_subformat(struct snd_pcm_hardware *hw,
+					struct snd_soc_pcm_stream *p)
+{
+	hw->subformats &= p->subformats;
+}
+
 /**
  * snd_soc_runtime_calc_hw() - Calculate hw limits for a PCM stream
  * @rtd: ASoC PCM runtime
@@ -592,6 +599,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 		soc_pcm_hw_update_chan(hw, cpu_stream);
 		soc_pcm_hw_update_rate(hw, cpu_stream);
 		soc_pcm_hw_update_format(hw, cpu_stream);
+		soc_pcm_hw_update_subformat(hw, cpu_stream);
 	}
 	cpu_chan_min = hw->channels_min;
 	cpu_chan_max = hw->channels_max;
@@ -613,6 +621,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 		soc_pcm_hw_update_chan(hw, codec_stream);
 		soc_pcm_hw_update_rate(hw, codec_stream);
 		soc_pcm_hw_update_format(hw, codec_stream);
+		soc_pcm_hw_update_subformat(hw, codec_stream);
 	}
 
 	/* Verify both a valid CPU DAI and a valid CODEC DAI were found */
@@ -637,6 +646,7 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_hardware *hw = &substream->runtime->hw;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	u64 subformats = hw->subformats;
 	u64 formats = hw->formats;
 
 	/*
@@ -648,6 +658,8 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 
 	if (formats)
 		hw->formats &= formats;
+	if (subformats)
+		hw->subformats &= subformats;
 }
 
 static int soc_pcm_components_open(struct snd_pcm_substream *substream)
@@ -1676,6 +1688,7 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dai *dai;
 	int stream = substream->stream;
+	u64 subformats = hw->subformats;
 	u64 formats = hw->formats;
 	int i;
 
@@ -1683,6 +1696,8 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 
 	if (formats)
 		hw->formats &= formats;
+	if (subformats)
+		hw->subformats &= subformats;
 
 	for_each_rtd_cpu_dais(fe, i, dai) {
 		struct snd_soc_pcm_stream *cpu_stream;
@@ -1699,6 +1714,7 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 		soc_pcm_hw_update_rate(hw, cpu_stream);
 		soc_pcm_hw_update_chan(hw, cpu_stream);
 		soc_pcm_hw_update_format(hw, cpu_stream);
+		soc_pcm_hw_update_subformat(hw, cpu_stream);
 	}
 
 }
@@ -1736,6 +1752,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 			codec_stream = snd_soc_dai_get_pcm_stream(dai, stream);
 
 			soc_pcm_hw_update_format(hw, codec_stream);
+			soc_pcm_hw_update_subformat(hw, codec_stream);
 		}
 	}
 }
-- 
2.25.1

