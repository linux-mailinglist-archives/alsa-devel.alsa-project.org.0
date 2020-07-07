Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8126D2179FC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 23:07:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C916B1696;
	Tue,  7 Jul 2020 23:06:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C916B1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594156056;
	bh=caqYWU4nACegTBZVLvm8CsvuDj/+PoHKtZ7s1qDBC2E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THrx4Y33T12YcBZKChvlncrnIr/O0s7Bc0810YXjpqRklmIoPpFqXoy/9beeNoCoB
	 wutcvwbH0KFCrx6CiXJKfQp+PSGrs+tsXmtvZnFokWkM7xbY5lq32rOsic9AMttJFG
	 CqOs1X5DPo3Hm7l3Nlkg010CL3rUEvExsQeLzNAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9AC6F800D0;
	Tue,  7 Jul 2020 23:05:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13C77F80274; Tue,  7 Jul 2020 23:05:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D07E6F800DF
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 23:04:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D07E6F800DF
IronPort-SDR: /0jt+i3HYrD2C1U+UNid5njIMNGab3mF+On+phDy+Cr7cjD3Y6IJdfqnthWRcd/LpukfWHIaEN
 z/wrD656B47A==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="127777247"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="127777247"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 14:04:57 -0700
IronPort-SDR: ldU9JkD3HCVMOfm3v8H8FJQFxH6HfCZDKWFnYuQI1sIhoDQrdeT3cdWPsi9jGLBZDgXCXBVs71
 SVaafDNAEkQw==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="483648062"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 14:04:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: soc-dai: set dai_link dpcm_ flags with a helper
Date: Tue,  7 Jul 2020 16:04:37 -0500
Message-Id: <20200707210439.115300-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707210439.115300-1-pierre-louis.bossart@linux.intel.com>
References: <20200707210439.115300-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

Add a helper to walk through all the DAIs and set dpcm_playback and
dpcm_capture flags based on the DAIs capabilities, and use this helper
to avoid setting these flags arbitrarily in generic cards.

The commit referenced in the Fixes tag did not introduce the
configuration issue but will prevent the card from probing when
detecting invalid configurations.

Fixes: b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 include/sound/soc-dai.h              |  1 +
 sound/soc/generic/audio-graph-card.c |  4 +--
 sound/soc/generic/simple-card.c      |  4 +--
 sound/soc/soc-dai.c                  | 38 ++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 212257e84fac..71e178c89793 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -161,6 +161,7 @@ void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 			     struct snd_soc_pcm_runtime *rtd, int num);
 bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int stream);
+void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link);
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action);
 static inline void snd_soc_dai_activate(struct snd_soc_dai *dai,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 9ad35d9940fe..97b4f5480a31 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -317,8 +317,8 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto out_put_node;
 
-	dai_link->dpcm_playback		= 1;
-	dai_link->dpcm_capture		= 1;
+	snd_soc_dai_link_set_capabilities(dai_link);
+
 	dai_link->ops			= &graph_ops;
 	dai_link->init			= asoc_simple_dai_init;
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 55e9f8800b3e..04d4d28ed511 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -231,8 +231,8 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto out_put_node;
 
-	dai_link->dpcm_playback		= 1;
-	dai_link->dpcm_capture		= 1;
+	snd_soc_dai_link_set_capabilities(dai_link);
+
 	dai_link->ops			= &simple_ops;
 	dai_link->init			= asoc_simple_dai_init;
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index b05e18b63a1c..457159975b01 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -391,6 +391,44 @@ bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int dir)
 	return stream->channels_min;
 }
 
+/*
+ * snd_soc_dai_link_set_capabilities() - set dai_link properties based on its DAIs
+ */
+void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link)
+{
+	struct snd_soc_dai_link_component *cpu;
+	struct snd_soc_dai_link_component *codec;
+	struct snd_soc_dai *dai;
+	bool supported[SNDRV_PCM_STREAM_LAST + 1];
+	int direction;
+	int i;
+
+	for_each_pcm_streams(direction) {
+		supported[direction] = true;
+
+		for_each_link_cpus(dai_link, i, cpu) {
+			dai = snd_soc_find_dai(cpu);
+			if (!dai || !snd_soc_dai_stream_valid(dai, direction)) {
+				supported[direction] = false;
+				break;
+			}
+		}
+		if (!supported[direction])
+			continue;
+		for_each_link_codecs(dai_link, i, codec) {
+			dai = snd_soc_find_dai(codec);
+			if (!dai || !snd_soc_dai_stream_valid(dai, direction)) {
+				supported[direction] = false;
+				break;
+			}
+		}
+	}
+
+	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
+	dai_link->dpcm_capture  = supported[SNDRV_PCM_STREAM_CAPTURE];
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_link_set_capabilities);
+
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action)
 {
-- 
2.25.1

