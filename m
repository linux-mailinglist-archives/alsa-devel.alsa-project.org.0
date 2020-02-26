Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F049C170818
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 19:54:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FDAE16BC;
	Wed, 26 Feb 2020 19:54:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FDAE16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582743292;
	bh=mD1A1lFsxdnKER9j2IxUSs2Ez4jLoEFeDxKmDhYmFKI=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=k2rR9tLv7Cw3JWlTSrQEWXbhDXZXoECMMCcbemZbzA3mK/xAeomRh3n2Lo7Rfxs68
	 j5QYQxhL446G27G25vyngBdafSmkaySpw/QvzIIDL/eys90angRJVHHlTN2WO2Dvth
	 K1DMsUBoqKL1Lw3PPGahb+b91V9osfj91D6h7EKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E986EF802FB;
	Wed, 26 Feb 2020 19:48:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C812F802FB; Wed, 26 Feb 2020 19:48:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 04878F802E8
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 19:47:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04878F802E8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E87531B;
 Wed, 26 Feb 2020 10:47:57 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0516D3F881;
 Wed, 26 Feb 2020 10:47:56 -0800 (PST)
Date: Wed, 26 Feb 2020 18:47:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Shreyas NC <shreyas.nc@intel.com>
Subject: Applied "ASoC: Add dapm_add_valid_dai_widget helper" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

   ASoC: Add dapm_add_valid_dai_widget helper

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

From 6c4b13b51aa36aab023dd0bf24bf5582c9ba091e Mon Sep 17 00:00:00 2001
From: Shreyas NC <shreyas.nc@intel.com>
Date: Tue, 25 Feb 2020 21:39:14 +0800
Subject: [PATCH] ASoC: Add dapm_add_valid_dai_widget helper

Adding a helper to connect widget for a specific cpu and codec dai
The helper will help dapm_connect_dai_link_widgets() to reduce indents.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Shreyas NC <shreyas.nc@intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20200225133917.21314-4-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-dapm.c | 119 +++++++++++++++++++++++--------------------
 1 file changed, 63 insertions(+), 56 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 58c318c9debb..539a1eaebeac 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4277,16 +4277,15 @@ int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card)
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
@@ -4298,67 +4297,75 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
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
2.20.1

