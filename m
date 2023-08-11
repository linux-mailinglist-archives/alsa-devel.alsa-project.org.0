Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D190D77952B
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 18:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2AF2846;
	Fri, 11 Aug 2023 18:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2AF2846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691772695;
	bh=9Ua79NZSwCdc96yfFBP5UKyuX1caiGcxe3cHQNEZ2gU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sPciW8fudf/jypcJcrwR49/Mk9wRSu9o4+u0bw0ZjI1zjJeWP9qZaSozFeJMpP3Ca
	 jVjpW6KtDsRKuDzUMolC6bRlMEibwNRv8putGXhU6q3gvpZazzJILJ9Kby1kfHJnBM
	 6S7NQIqbqnQMCrxGhugBUYGPI4UaLABZJj2VNge4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73C59F805AE; Fri, 11 Aug 2023 18:49:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19333F805AF;
	Fri, 11 Aug 2023 18:49:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30FDEF805AE; Fri, 11 Aug 2023 18:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACFFCF80588
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 18:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACFFCF80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JECKoX7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691772581; x=1723308581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Ua79NZSwCdc96yfFBP5UKyuX1caiGcxe3cHQNEZ2gU=;
  b=JECKoX7AGJR/gofizKZsWiS8yXQx4hZh8hcpNWRVtWcWVFN2ANcGkgwb
   Xa3PzK9oqNOKX0dO+0cHZaScpcQnzDHc4wY4waKCk41td2OlqOmhrUYb0
   sPgSTImPlvZ/WA1glh6GawSg1pwrje03xzKjj19w/90lA2lmWtK0+BM5U
   Pufj50Sj0H23s8RjvB9AN2mzxPoR58Iy5dEy7mVKA9J8Yt5hV6/AD+C2i
   STuaEcpOcdm+XNhiGfqUWoxngp9cJ9nC+pI0cpcwdyCtDPVdSthiUkAAP
   hYJZtz6aAs3oe3+cI5niPwR4DWGLgnkfKxMoEuwRFfVC68WoZKtt207bZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371725040"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="371725040"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846842768"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="846842768"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 09:49:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC PATCH 04/17] ASoC: pcm: Honor subformat when configuring runtime
Date: Fri, 11 Aug 2023 18:48:40 +0200
Message-Id: <20230811164853.1797547-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811164853.1797547-1-cezary.rojewski@intel.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VNY5EJUKP62SCYJC2CURBDIKZFZVFZAV
X-Message-ID-Hash: VNY5EJUKP62SCYJC2CURBDIKZFZVFZAV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNY5EJUKP62SCYJC2CURBDIKZFZVFZAV/>
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
index 755907fe82b4..cb74295ab020 100644
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
index dc5f41879cc0..80118c5cb194 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -525,6 +525,7 @@ static void soc_pcm_hw_init(struct snd_pcm_hardware *hw)
 	hw->channels_min	= 0;
 	hw->channels_max	= UINT_MAX;
 	hw->formats		= ULLONG_MAX;
+	hw->subformats		= ULLONG_MAX;
 }
 
 static void soc_pcm_hw_update_rate(struct snd_pcm_hardware *hw,
@@ -553,6 +554,12 @@ static void soc_pcm_hw_update_format(struct snd_pcm_hardware *hw,
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
@@ -591,6 +598,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 		soc_pcm_hw_update_chan(hw, cpu_stream);
 		soc_pcm_hw_update_rate(hw, cpu_stream);
 		soc_pcm_hw_update_format(hw, cpu_stream);
+		soc_pcm_hw_update_subformat(hw, cpu_stream);
 	}
 	cpu_chan_min = hw->channels_min;
 	cpu_chan_max = hw->channels_max;
@@ -612,6 +620,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 		soc_pcm_hw_update_chan(hw, codec_stream);
 		soc_pcm_hw_update_rate(hw, codec_stream);
 		soc_pcm_hw_update_format(hw, codec_stream);
+		soc_pcm_hw_update_subformat(hw, codec_stream);
 	}
 
 	/* Verify both a valid CPU DAI and a valid CODEC DAI were found */
@@ -636,6 +645,7 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_hardware *hw = &substream->runtime->hw;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	u64 subformats = hw->subformats;
 	u64 formats = hw->formats;
 
 	/*
@@ -647,6 +657,8 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 
 	if (formats)
 		hw->formats &= formats;
+	if (subformats)
+		hw->subformats &= subformats;
 }
 
 static int soc_pcm_components_open(struct snd_pcm_substream *substream)
@@ -1675,6 +1687,7 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dai *dai;
 	int stream = substream->stream;
+	u64 subformats = hw->subformats;
 	u64 formats = hw->formats;
 	int i;
 
@@ -1682,6 +1695,8 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 
 	if (formats)
 		hw->formats &= formats;
+	if (subformats)
+		hw->subformats &= subformats;
 
 	for_each_rtd_cpu_dais(fe, i, dai) {
 		struct snd_soc_pcm_stream *cpu_stream;
@@ -1698,6 +1713,7 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 		soc_pcm_hw_update_rate(hw, cpu_stream);
 		soc_pcm_hw_update_chan(hw, cpu_stream);
 		soc_pcm_hw_update_format(hw, cpu_stream);
+		soc_pcm_hw_update_subformat(hw, cpu_stream);
 	}
 
 }
@@ -1735,6 +1751,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 			codec_stream = snd_soc_dai_get_pcm_stream(dai, stream);
 
 			soc_pcm_hw_update_format(hw, codec_stream);
+			soc_pcm_hw_update_subformat(hw, codec_stream);
 		}
 	}
 }
-- 
2.25.1

