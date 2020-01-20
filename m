Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBF14352A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 02:29:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EE281664;
	Tue, 21 Jan 2020 02:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EE281664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579570149;
	bh=IELZCa0jfVR1RA/DpZ0ZToBzX39+028kXNY3pEPABC4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CQagprnLXXFrh8Zh/RjI3kn88O1sX+cJTfvuYfyQ9VkyTuKKuHYYE6c8SutBEvfid
	 o6pjdb5aca+q8t3vaBrJWiJh2vLRieGtJHcW23X5lrS/wLu2W5cBvmKIF0slrCJik8
	 zXm3SyQqXB4c7SYh1gVbxDuXR1qQDrfzo17XXWug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A24EF80248;
	Tue, 21 Jan 2020 02:26:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2632F80272; Tue, 21 Jan 2020 02:25:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6FF9F801D8
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 02:25:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6FF9F801D8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 17:25:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="258880016"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2020 17:25:42 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Mon, 20 Jan 2020 21:29:25 +0800
Message-Id: <20200120132928.25257-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120132928.25257-1-yung-chuan.liao@linux.intel.com>
References: <20200120132928.25257-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH RFC v4 3/6] ASoC: Add dapm_add_valid_dai_widget
	helper
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shreyas NC <shreyas.nc@intel.com>

Adding a helper to connect widget for a specific cpu and codec dai
The helper will help dapm_connect_dai_link_widgets() to reduce indents.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Shreyas NC <shreyas.nc@intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/soc-dapm.c | 119 +++++++++++++++++++++++--------------------
 1 file changed, 63 insertions(+), 56 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 442846f12cd4..1a414054ee23 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4274,16 +4274,15 @@ int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card)
 	return 0;
 }
 
-static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
-					  struct snd_soc_pcm_runtime *rtd)
+static void dapm_add_valid_dai_widget(struct snd_soc_card *card,
+				      struct snd_soc_pcm_runtime *rtd,
+				      struct snd_soc_dai *codec_dai,
+				      struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dapm_widget *playback = NULL, *capture = NULL;
 	struct snd_soc_dapm_widget *codec, *playback_cpu, *capture_cpu;
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_str *streams = rtd->pcm->streams;
-	int i;
 
 	if (rtd->dai_link->params) {
 		playback_cpu = cpu_dai->capture_widget;
@@ -4295,67 +4294,75 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 		capture_cpu = capture;
 	}
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		/* connect BE DAI playback if widgets are valid */
-		codec = codec_dai->playback_widget;
-
-		if (playback_cpu && codec) {
-			if (!playback) {
-				substream = streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-				playback = snd_soc_dapm_new_dai(card, substream,
-								"playback");
-				if (IS_ERR(playback)) {
-					dev_err(rtd->dev,
-						"ASoC: Failed to create DAI %s: %ld\n",
-						codec_dai->name,
-						PTR_ERR(playback));
-					continue;
-				}
-
-				snd_soc_dapm_add_path(&card->dapm, playback_cpu,
-						      playback, NULL, NULL);
+	/* connect BE DAI playback if widgets are valid */
+	codec = codec_dai->playback_widget;
+
+	if (playback_cpu && codec) {
+		if (!playback) {
+			substream = streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+			playback = snd_soc_dapm_new_dai(card, substream,
+							"playback");
+			if (IS_ERR(playback)) {
+				dev_err(rtd->dev,
+					"ASoC: Failed to create DAI %s: %ld\n",
+					codec_dai->name,
+					PTR_ERR(playback));
+				goto capture;
 			}
 
-			dev_dbg(rtd->dev, "connected DAI link %s:%s -> %s:%s\n",
-				cpu_dai->component->name, playback_cpu->name,
-				codec_dai->component->name, codec->name);
-
-			snd_soc_dapm_add_path(&card->dapm, playback, codec,
-					      NULL, NULL);
+			snd_soc_dapm_add_path(&card->dapm, playback_cpu,
+					      playback, NULL, NULL);
 		}
-	}
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		/* connect BE DAI capture if widgets are valid */
-		codec = codec_dai->capture_widget;
-
-		if (codec && capture_cpu) {
-			if (!capture) {
-				substream = streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-				capture = snd_soc_dapm_new_dai(card, substream,
-							       "capture");
-				if (IS_ERR(capture)) {
-					dev_err(rtd->dev,
-						"ASoC: Failed to create DAI %s: %ld\n",
-						codec_dai->name,
-						PTR_ERR(capture));
-					continue;
-				}
-
-				snd_soc_dapm_add_path(&card->dapm, capture,
-						      capture_cpu, NULL, NULL);
+		dev_dbg(rtd->dev, "connected DAI link %s:%s -> %s:%s\n",
+			cpu_dai->component->name, playback_cpu->name,
+			codec_dai->component->name, codec->name);
+
+		snd_soc_dapm_add_path(&card->dapm, playback, codec,
+				      NULL, NULL);
+	}
+
+capture:
+	/* connect BE DAI capture if widgets are valid */
+	codec = codec_dai->capture_widget;
+
+	if (codec && capture_cpu) {
+		if (!capture) {
+			substream = streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+			capture = snd_soc_dapm_new_dai(card, substream,
+						       "capture");
+			if (IS_ERR(capture)) {
+				dev_err(rtd->dev,
+					"ASoC: Failed to create DAI %s: %ld\n",
+					codec_dai->name,
+					PTR_ERR(capture));
+				return;
 			}
 
-			dev_dbg(rtd->dev, "connected DAI link %s:%s -> %s:%s\n",
-				codec_dai->component->name, codec->name,
-				cpu_dai->component->name, capture_cpu->name);
-
-			snd_soc_dapm_add_path(&card->dapm, codec, capture,
-					      NULL, NULL);
+			snd_soc_dapm_add_path(&card->dapm, capture,
+					      capture_cpu, NULL, NULL);
 		}
+
+		dev_dbg(rtd->dev, "connected DAI link %s:%s -> %s:%s\n",
+			codec_dai->component->name, codec->name,
+			cpu_dai->component->name, capture_cpu->name);
+
+		snd_soc_dapm_add_path(&card->dapm, codec, capture,
+				      NULL, NULL);
 	}
 }
 
+static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
+					  struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *codec_dai;
+	int i;
+
+	for_each_rtd_codec_dai(rtd, i, codec_dai)
+		dapm_add_valid_dai_widget(card, rtd,
+					  codec_dai, rtd->cpu_dais[0]);
+}
+
 static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 	int event)
 {
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
