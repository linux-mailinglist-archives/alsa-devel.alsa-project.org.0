Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B37821A79C4
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 13:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61FC916A4;
	Tue, 14 Apr 2020 13:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61FC916A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586864498;
	bh=x1fY+jVROWmJz0peHM3Z1QtNP1+cRwMv+d0JXsjRqpk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VvOmU4r0pmuFSScvh3IjtFv7YPG9iV4o7JpJsWL58JP50AjooYeV4oMQ1T+TRlF68
	 fYeJ+kHwyM2F12g4vuYAUfxlsx/QTKSVkmvPGe4WsT4CAmFNS/33dQnmxPYNICyKMd
	 HpWe+ksH3G644eTF4lP0VdpO/lvw5wEbmaWTyDXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8080EF8014E;
	Tue, 14 Apr 2020 13:39:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F627F8013D; Tue, 14 Apr 2020 13:39:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F9CCF800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 13:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F9CCF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xKMjVCvT"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99EBD2075E;
 Tue, 14 Apr 2020 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586864390;
 bh=x1fY+jVROWmJz0peHM3Z1QtNP1+cRwMv+d0JXsjRqpk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=xKMjVCvTApCNBtnsZ94yVRSL63UYvJokFdtgqYlzHy7JR7dSv8djUd8VMr6dgIMKC
 c7JYniqKDPQE5wnMdiqk+/NnDKq/PreXiLn7+1CRY8vjfuZVrKj3ritexMjZ2nlC6h
 +K66930WE1XESqMHpSMvWDUI5COG0tL01bkb2wcY=
Date: Tue, 14 Apr 2020 12:39:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Applied "ASoC: dapm: Fix regression introducing multiple copies of
 DAI widgets" to the asoc tree
In-Reply-To: <20200409181209.30130-1-ckeepax@opensource.cirrus.com>
Message-Id: <applied-20200409181209.30130-1-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, shreyas.nc@intel.com,
 yung-chuan.liao@linux.intel.com
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

The patch

   ASoC: dapm: Fix regression introducing multiple copies of DAI widgets

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 595571cca4dec8ac48122a6d2733f790c9a2cade Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Thu, 9 Apr 2020 19:12:07 +0100
Subject: [PATCH] ASoC: dapm: Fix regression introducing multiple copies of DAI
 widgets

Refactoring was done to factor out the linking of DAI widgets into
a helper function, dapm_add_valid_dai_widget. However when this was
done, a regression was introduced for CODEC to CODEC links. It was
over looked that the playback and capture variables persisted across
all CODEC DAIs being processed, which ensured that the special DAI
widget that is added for CODEC to CODEC links was only created once.
This bug causes kernel panics during DAPM shutdown.

To stick with the spirit of the original refactoring whilst fixing the
issue, variables to hold the DAI widgets are added to snd_soc_dai_link.
Furthermore the dapm_add_valid_dai_widget function is renamed to
dapm_connect_dai_pair, the function only adds DAI widgets in the CODEC
to CODEC case and its primary job is to add routes connecting two DAI
widgets, making the original name quite misleading.

Fixes: 6c4b13b51aa3 ("ASoC: Add dapm_add_valid_dai_widget helper")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20200409181209.30130-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  3 ++
 sound/soc/soc-dapm.c | 91 +++++++++++++++++++++++---------------------
 2 files changed, 51 insertions(+), 43 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 13458e4fbb13..946f88a6c63d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -790,6 +790,9 @@ struct snd_soc_dai_link {
 	const struct snd_soc_pcm_stream *params;
 	unsigned int num_params;
 
+	struct snd_soc_dapm_widget *playback_widget;
+	struct snd_soc_dapm_widget *capture_widget;
+
 	unsigned int dai_fmt;           /* format to set on init */
 
 	enum snd_soc_dpcm_trigger trigger[2]; /* trigger type for DPCM */
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 679ed60d850e..fe907f0cc709 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4283,52 +4283,63 @@ int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card)
 	return 0;
 }
 
-static void dapm_add_valid_dai_widget(struct snd_soc_card *card,
-				      struct snd_soc_pcm_runtime *rtd,
-				      struct snd_soc_dai *codec_dai,
-				      struct snd_soc_dai *cpu_dai)
+static void dapm_connect_dai_routes(struct snd_soc_dapm_context *dapm,
+				    struct snd_soc_dai *src_dai,
+				    struct snd_soc_dapm_widget *src,
+				    struct snd_soc_dapm_widget *dai,
+				    struct snd_soc_dai *sink_dai,
+				    struct snd_soc_dapm_widget *sink)
 {
-	struct snd_soc_dapm_widget *playback = NULL, *capture = NULL;
-	struct snd_soc_dapm_widget *codec, *playback_cpu, *capture_cpu;
+	dev_dbg(dapm->dev, "connected DAI link %s:%s -> %s:%s\n",
+		src_dai->component->name, src->name,
+		sink_dai->component->name, sink->name);
+
+	if (dai) {
+		snd_soc_dapm_add_path(dapm, src, dai, NULL, NULL);
+		src = dai;
+	}
+
+	snd_soc_dapm_add_path(dapm, src, sink, NULL, NULL);
+}
+
+static void dapm_connect_dai_pair(struct snd_soc_card *card,
+				  struct snd_soc_pcm_runtime *rtd,
+				  struct snd_soc_dai *codec_dai,
+				  struct snd_soc_dai *cpu_dai)
+{
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	struct snd_soc_dapm_widget *dai, *codec, *playback_cpu, *capture_cpu;
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_str *streams = rtd->pcm->streams;
 
-	if (rtd->dai_link->params) {
+	if (dai_link->params) {
 		playback_cpu = cpu_dai->capture_widget;
 		capture_cpu = cpu_dai->playback_widget;
 	} else {
-		playback = cpu_dai->playback_widget;
-		capture = cpu_dai->capture_widget;
-		playback_cpu = playback;
-		capture_cpu = capture;
+		playback_cpu = cpu_dai->playback_widget;
+		capture_cpu = cpu_dai->capture_widget;
 	}
 
 	/* connect BE DAI playback if widgets are valid */
 	codec = codec_dai->playback_widget;
 
 	if (playback_cpu && codec) {
-		if (!playback) {
+		if (dai_link->params && !dai_link->playback_widget) {
 			substream = streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-			playback = snd_soc_dapm_new_dai(card, substream,
-							"playback");
-			if (IS_ERR(playback)) {
+			dai = snd_soc_dapm_new_dai(card, substream, "playback");
+			if (IS_ERR(dai)) {
 				dev_err(rtd->dev,
 					"ASoC: Failed to create DAI %s: %ld\n",
 					codec_dai->name,
-					PTR_ERR(playback));
+					PTR_ERR(dai));
 				goto capture;
 			}
-
-			snd_soc_dapm_add_path(&card->dapm, playback_cpu,
-					      playback, NULL, NULL);
+			dai_link->playback_widget = dai;
 		}
 
-		dev_dbg(rtd->dev, "connected DAI link %s:%s -> %s:%s\n",
-			cpu_dai->component->name, playback_cpu->name,
-			codec_dai->component->name, codec->name);
-
-		snd_soc_dapm_add_path(&card->dapm, playback, codec,
-				      NULL, NULL);
+		dapm_connect_dai_routes(&card->dapm, cpu_dai, playback_cpu,
+					dai_link->playback_widget,
+					codec_dai, codec);
 	}
 
 capture:
@@ -4336,28 +4347,22 @@ static void dapm_add_valid_dai_widget(struct snd_soc_card *card,
 	codec = codec_dai->capture_widget;
 
 	if (codec && capture_cpu) {
-		if (!capture) {
+		if (dai_link->params && !dai_link->capture_widget) {
 			substream = streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-			capture = snd_soc_dapm_new_dai(card, substream,
-						       "capture");
-			if (IS_ERR(capture)) {
+			dai = snd_soc_dapm_new_dai(card, substream, "capture");
+			if (IS_ERR(dai)) {
 				dev_err(rtd->dev,
 					"ASoC: Failed to create DAI %s: %ld\n",
 					codec_dai->name,
-					PTR_ERR(capture));
+					PTR_ERR(dai));
 				return;
 			}
-
-			snd_soc_dapm_add_path(&card->dapm, capture,
-					      capture_cpu, NULL, NULL);
+			dai_link->capture_widget = dai;
 		}
 
-		dev_dbg(rtd->dev, "connected DAI link %s:%s -> %s:%s\n",
-			codec_dai->component->name, codec->name,
-			cpu_dai->component->name, capture_cpu->name);
-
-		snd_soc_dapm_add_path(&card->dapm, codec, capture,
-				      NULL, NULL);
+		dapm_connect_dai_routes(&card->dapm, codec_dai, codec,
+					dai_link->capture_widget,
+					cpu_dai, capture_cpu);
 	}
 }
 
@@ -4369,12 +4374,12 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 
 	if (rtd->num_cpus == 1) {
 		for_each_rtd_codec_dais(rtd, i, codec_dai)
-			dapm_add_valid_dai_widget(card, rtd, codec_dai,
-						  rtd->cpu_dais[0]);
+			dapm_connect_dai_pair(card, rtd, codec_dai,
+					      rtd->cpu_dais[0]);
 	} else if (rtd->num_codecs == rtd->num_cpus) {
 		for_each_rtd_codec_dais(rtd, i, codec_dai)
-			dapm_add_valid_dai_widget(card, rtd, codec_dai,
-						  rtd->cpu_dais[i]);
+			dapm_connect_dai_pair(card, rtd, codec_dai,
+					      rtd->cpu_dais[i]);
 	} else {
 		dev_err(card->dev,
 			"N cpus to M codecs link is not supported yet\n");
-- 
2.20.1

