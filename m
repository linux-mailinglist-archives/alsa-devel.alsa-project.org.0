Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD59C1932F7
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:43:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D9F1839;
	Wed, 25 Mar 2020 22:42:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D9F1839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585172626;
	bh=qiYY/ZtPAHBDYBBHj6fs+4fSTdpycFRPP8tUCYaqJ7Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M+5wEz95g/o9n2aB8IuqZy1XipZjoZNAumf2LEPpVwtxB+l7YKbJQAuEQizT9nESJ
	 8ZATrBOAdksNm8WOZ9nUxax2Js3McCJhjui1zgmhiUAreqSAtW//MdOtCIJ3A+v6Ii
	 9Xd4gQzetmpNU8x/PXip2V7Mw1JV0/I8KY7ybJRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF96F80291;
	Wed, 25 Mar 2020 22:42:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17863F8011E; Wed, 25 Mar 2020 22:39:40 +0100 (CET)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4295BF800EF
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:29:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4295BF800EF
IronPort-SDR: BM0xnR6AKXptoQCjdduQm8lI2I9R+chJVEgg7dT3sjC2dt+yR+LTqbE0xevFsiDUd6IRGbO2cE
 dkDLUjpY1ubQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:29:16 -0700
IronPort-SDR: gli4SWSuAIOSKmj7LF61q2T486neciKM3cXL3uP5yONXSLtWNKif0AONwd2kSG6D7gFU4SaHyM
 I3/dUN+WPHng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="393759855"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by orsmga004.jf.intel.com with ESMTP; 25 Mar 2020 14:29:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: rt1308-sdw: add set_tdm_slot() support
Date: Wed, 25 Mar 2020 16:29:04 -0500
Message-Id: <20200325212905.28145-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325212905.28145-1-pierre-louis.bossart@linux.intel.com>
References: <20200325212905.28145-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add ability to select which of the channels is used, or both, in case
two RT1308 amplifiers are located on the same link.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt1308-sdw.c | 23 +++++++++++++++++++++++
 sound/soc/codecs/rt1308-sdw.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index d930f60cb797..8763192434c4 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -507,6 +507,28 @@ static void rt1308_sdw_shutdown(struct snd_pcm_substream *substream,
 	kfree(stream);
 }
 
+static int rt1308_sdw_set_tdm_slot(struct snd_soc_dai *dai,
+				   unsigned int tx_mask,
+				   unsigned int rx_mask,
+				   int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt1308_sdw_priv *rt1308 =
+		snd_soc_component_get_drvdata(component);
+
+	if (tx_mask)
+		return -EINVAL;
+
+	if (slots > 2)
+		return -EINVAL;
+
+	rt1308->rx_mask = rx_mask;
+	rt1308->slots = slots;
+	/* slot_width is not used since it's irrelevant for SoundWire */
+
+	return 0;
+}
+
 static int rt1308_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
@@ -597,6 +619,7 @@ static const struct snd_soc_dai_ops rt1308_aif_dai_ops = {
 	.hw_free	= rt1308_sdw_pcm_hw_free,
 	.set_sdw_stream	= rt1308_set_sdw_stream,
 	.shutdown	= rt1308_sdw_shutdown,
+	.set_tdm_slot	= rt1308_sdw_set_tdm_slot,
 };
 
 #define RT1308_STEREO_RATES SNDRV_PCM_RATE_48000
diff --git a/sound/soc/codecs/rt1308-sdw.h b/sound/soc/codecs/rt1308-sdw.h
index c9341e70d6cf..c5ce75666dcc 100644
--- a/sound/soc/codecs/rt1308-sdw.h
+++ b/sound/soc/codecs/rt1308-sdw.h
@@ -160,6 +160,8 @@ struct rt1308_sdw_priv {
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
+	int rx_mask;
+	int slots;
 };
 
 struct sdw_stream_data {
-- 
2.20.1

