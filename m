Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEA31A8148
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D19F916E7;
	Tue, 14 Apr 2020 17:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D19F916E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876837;
	bh=63n7JGeivRYim0kIYtXq6/hnL7kESSdCmfCZlqd9tsE=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cwy3paI0fvENr93ApU/0DF/oWy0Ii80ZmFQaAAOA67afkaXC89NBC0SIF3ZRh7nC5
	 PzDDwFiGF2/JnIXFgLgNlrNgX3176VkgCeqRKmw9qlNek6F8iV4VoKzLugW0PQ82qm
	 0fWeBN2ws0XkPEPeG+d2cL0eCdJVrvqJKeI9Vh5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3082AF80290;
	Tue, 14 Apr 2020 16:49:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08433F803F3; Tue, 14 Apr 2020 16:48:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83C6CF803E0
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83C6CF803E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X6mkR40i"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52B892076D;
 Tue, 14 Apr 2020 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875729;
 bh=63n7JGeivRYim0kIYtXq6/hnL7kESSdCmfCZlqd9tsE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=X6mkR40ipjzXLme+XfIryxPNyFN+6RP7abSzmefa2k6NYHxzoy6MVdD4b6HbS1XkZ
 L1QcMAyEnX5wasv9euMs2X8S5f4AihA/ednedKPaFpeqB1J56AWCY+VubVMfnq91bX
 6mxVmQ4/mcNTo5DUOr4OThQ5ur4wcm+HHCRmPphc=
Date: Tue, 14 Apr 2020 15:48:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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

The patch

   ASoC: soc: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From c2233a266178f8937cc26a84cd7672334b5424b7 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 30 Mar 2020 10:47:37 +0900
Subject: [PATCH] ASoC: soc: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87imimboli.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h                   | 12 ++++-----
 sound/soc/soc-compress.c              | 36 +++++++++++++--------------
 sound/soc/soc-core.c                  | 16 ++++++------
 sound/soc/soc-dapm.c                  |  4 +--
 sound/soc/soc-generic-dmaengine-pcm.c |  6 ++---
 sound/soc/soc-pcm.c                   | 30 +++++++++++-----------
 6 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 13458e4fbb13..4dff6745b067 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1179,16 +1179,16 @@ struct snd_soc_pcm_runtime {
 	     (i)++)
 #define for_each_rtd_cpu_dais(rtd, i, dai)				\
 	for ((i) = 0;							\
-	     ((i) < rtd->num_cpus) && ((dai) = rtd->cpu_dais[i]);	\
+	     ((i) < rtd->num_cpus) && ((dai) = asoc_rtd_to_cpu(rtd, i)); \
 	     (i)++)
 #define for_each_rtd_cpu_dais_rollback(rtd, i, dai)		\
-	for (; (--(i) >= 0) && ((dai) = rtd->cpu_dais[i]);)
+	for (; (--(i) >= 0) && ((dai) = asoc_rtd_to_cpu(rtd, i));)
 #define for_each_rtd_codec_dais(rtd, i, dai)				\
 	for ((i) = 0;							\
-	     ((i) < rtd->num_codecs) && ((dai) = rtd->codec_dais[i]);	\
+	     ((i) < rtd->num_codecs) && ((dai) = asoc_rtd_to_codec(rtd, i)); \
 	     (i)++)
 #define for_each_rtd_codec_dais_rollback(rtd, i, dai)		\
-	for (; (--(i) >= 0) && ((dai) = rtd->codec_dais[i]);)
+	for (; (--(i) >= 0) && ((dai) = asoc_rtd_to_codec(rtd, i));)
 #define for_each_rtd_dais(rtd, i, dai)					\
 	for ((i) = 0;							\
 	     ((i) < (rtd)->num_cpus + (rtd)->num_codecs) &&		\
@@ -1381,8 +1381,8 @@ struct snd_soc_dai *snd_soc_card_get_codec_dai(struct snd_soc_card *card,
 	struct snd_soc_pcm_runtime *rtd;
 
 	list_for_each_entry(rtd, &card->rtd_list, list) {
-		if (!strcmp(rtd->codec_dai->name, dai_name))
-			return rtd->codec_dai;
+		if (!strcmp(asoc_rtd_to_codec(rtd, 0)->name, dai_name))
+			return asoc_rtd_to_codec(rtd, 0);
 	}
 
 	return NULL;
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 50062eb79adb..3f77c0208e09 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -73,7 +73,7 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component, *save = NULL;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret, i;
 
 	for_each_rtd_components(rtd, i, component) {
@@ -141,7 +141,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	struct snd_pcm_substream *fe_substream =
 		 fe->pcm->streams[cstream->direction].substream;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = fe->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
 	struct snd_soc_dpcm *dpcm;
 	struct snd_soc_dapm_widget_list *list;
 	int stream;
@@ -230,8 +230,8 @@ static int soc_compr_free(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int stream, i;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -274,7 +274,7 @@ static int soc_compr_free(struct snd_compr_stream *cstream)
 static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *fe = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = fe->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
 	struct snd_soc_dpcm *dpcm;
 	int stream, ret;
 
@@ -343,8 +343,8 @@ static int soc_compr_components_trigger(struct snd_compr_stream *cstream,
 static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -373,7 +373,7 @@ static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
 static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
 {
 	struct snd_soc_pcm_runtime *fe = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = fe->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
 	int ret, stream;
 
 	if (cmd == SND_COMPR_TRIGGER_PARTIAL_DRAIN ||
@@ -446,7 +446,7 @@ static int soc_compr_set_params(struct snd_compr_stream *cstream,
 				struct snd_compr_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -500,7 +500,7 @@ static int soc_compr_set_params_fe(struct snd_compr_stream *cstream,
 	struct snd_soc_pcm_runtime *fe = cstream->private_data;
 	struct snd_pcm_substream *fe_substream =
 		 fe->pcm->streams[cstream->direction].substream;
-	struct snd_soc_dai *cpu_dai = fe->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
 	int ret, stream;
 
 	if (cstream->direction == SND_COMPRESS_PLAYBACK)
@@ -558,7 +558,7 @@ static int soc_compr_get_params(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int i, ret = 0;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -632,7 +632,7 @@ static int soc_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int i, ret = 0;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -664,7 +664,7 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
 	int i, ret = 0;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
@@ -711,7 +711,7 @@ static int soc_compr_set_metadata(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int i, ret;
 
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->set_metadata) {
@@ -739,7 +739,7 @@ static int soc_compr_get_metadata(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int i, ret;
 
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->get_metadata) {
@@ -801,8 +801,8 @@ static struct snd_compr_ops soc_compr_dyn_ops = {
 int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 {
 	struct snd_soc_component *component;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_compr *compr;
 	struct snd_pcm *be_pcm;
 	char new_name[64];
@@ -891,7 +891,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 	ret = snd_compress_new(rtd->card->snd_card, num, direction,
 				new_name, compr);
 	if (ret < 0) {
-		component = rtd->codec_dai->component;
+		component = asoc_rtd_to_codec(rtd, 0)->component;
 		dev_err(component->dev,
 			"Compress ASoC: can't create compress for codec %s: %d\n",
 			component->name, ret);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 843b8b1c89d4..4ad64b96d893 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -364,7 +364,7 @@ EXPORT_SYMBOL_GPL(snd_soc_get_pcm_runtime);
  */
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int playback = SNDRV_PCM_STREAM_PLAYBACK;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -991,13 +991,13 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 
 	rtd->num_cpus = dai_link->num_cpus;
 	for_each_link_cpus(dai_link, i, cpu) {
-		rtd->cpu_dais[i] = snd_soc_find_dai(cpu);
-		if (!rtd->cpu_dais[i]) {
+		asoc_rtd_to_cpu(rtd, i) = snd_soc_find_dai(cpu);
+		if (!asoc_rtd_to_cpu(rtd, i)) {
 			dev_info(card->dev, "ASoC: CPU DAI %s not registered\n",
 				 cpu->dai_name);
 			goto _err_defer;
 		}
-		snd_soc_rtd_add_component(rtd, rtd->cpu_dais[i]->component);
+		snd_soc_rtd_add_component(rtd, asoc_rtd_to_cpu(rtd, i)->component);
 	}
 
 	/* Single cpu links expect cpu and cpu_dai in runtime data */
@@ -1006,14 +1006,14 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 	/* Find CODEC from registered CODECs */
 	rtd->num_codecs = dai_link->num_codecs;
 	for_each_link_codecs(dai_link, i, codec) {
-		rtd->codec_dais[i] = snd_soc_find_dai(codec);
-		if (!rtd->codec_dais[i]) {
+		asoc_rtd_to_codec(rtd, i) = snd_soc_find_dai(codec);
+		if (!asoc_rtd_to_codec(rtd, i)) {
 			dev_info(card->dev, "ASoC: CODEC DAI %s not registered\n",
 				 codec->dai_name);
 			goto _err_defer;
 		}
 
-		snd_soc_rtd_add_component(rtd, rtd->codec_dais[i]->component);
+		snd_soc_rtd_add_component(rtd, asoc_rtd_to_codec(rtd, i)->component);
 	}
 
 	/* Single codec links expect codec and codec_dai in runtime data */
@@ -1062,7 +1062,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 				struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_component *component;
 	int ret, num, i;
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 679ed60d850e..8f260994b149 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4370,11 +4370,11 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 	if (rtd->num_cpus == 1) {
 		for_each_rtd_codec_dais(rtd, i, codec_dai)
 			dapm_add_valid_dai_widget(card, rtd, codec_dai,
-						  rtd->cpu_dais[0]);
+						  asoc_rtd_to_cpu(rtd, 0));
 	} else if (rtd->num_codecs == rtd->num_cpus) {
 		for_each_rtd_codec_dais(rtd, i, codec_dai)
 			dapm_add_valid_dai_widget(card, rtd, codec_dai,
-						  rtd->cpu_dais[i]);
+						  asoc_rtd_to_cpu(rtd, i));
 	} else {
 		dev_err(card->dev,
 			"N cpus to M codecs link is not supported yet\n");
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index facf1922a714..f728309a0833 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -68,7 +68,7 @@ int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 
 	ret = snd_hwparams_to_dma_slave_config(substream, params, slave_config);
 	if (ret)
@@ -134,7 +134,7 @@ dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 		return snd_soc_set_runtime_hwparams(substream,
 				pcm->config->pcm_hardware);
 
-	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 
 	memset(&hw, 0, sizeof(hw));
 	hw.info = SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
@@ -203,7 +203,7 @@ static struct dma_chan *dmaengine_pcm_compat_request_channel(
 		return NULL;
 	}
 
-	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 
 	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX) && pcm->chan[0])
 		return pcm->chan[0];
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 289aebc15529..454735f8fa92 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -136,7 +136,7 @@ static ssize_t dpcm_state_read_file(struct file *file, char __user *user_buf,
 		return -ENOMEM;
 
 	for_each_pcm_streams(stream)
-		if (snd_soc_dai_stream_valid(fe->cpu_dai, stream))
+		if (snd_soc_dai_stream_valid(asoc_rtd_to_cpu(fe, 0), stream))
 			offset += dpcm_show_state(fe, stream,
 						  buf + offset,
 						  out_count - offset);
@@ -836,10 +836,10 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	soc_pcm_init_runtime_hw(substream);
 
 	if (rtd->num_codecs == 1)
-		codec_dai_name = rtd->codec_dai->name;
+		codec_dai_name = asoc_rtd_to_codec(rtd, 0)->name;
 
 	if (rtd->num_cpus == 1)
-		cpu_dai_name = rtd->cpu_dai->name;
+		cpu_dai_name = asoc_rtd_to_cpu(rtd, 0)->name;
 
 	if (soc_pcm_has_symmetry(substream))
 		runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
@@ -1483,7 +1483,7 @@ static bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget,
 int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	int stream, struct snd_soc_dapm_widget_list **list)
 {
-	struct snd_soc_dai *cpu_dai = fe->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
 	int paths;
 
 	if (fe->num_cpus > 1) {
@@ -1842,7 +1842,7 @@ static void dpcm_runtime_merge_chan(struct snd_pcm_substream *substream,
 		 * DAIs connected to a single CPU DAI, use CPU DAI's directly
 		 */
 		if (be->num_codecs == 1) {
-			codec_stream = snd_soc_dai_get_pcm_stream(be->codec_dais[0], stream);
+			codec_stream = snd_soc_dai_get_pcm_stream(asoc_rtd_to_codec(be, 0), stream);
 
 			*channels_min = max(*channels_min,
 					    codec_stream->channels_min);
@@ -2759,7 +2759,7 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 		return 0;
 
 	/* only check active links */
-	if (!fe->cpu_dai->active)
+	if (!asoc_rtd_to_cpu(fe, 0)->active)
 		return 0;
 
 	/* DAPM sync will call this to update DSP paths */
@@ -2769,13 +2769,13 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	for_each_pcm_streams(stream) {
 
 		/* skip if FE doesn't have playback/capture capability */
-		if (!snd_soc_dai_stream_valid(fe->cpu_dai,   stream) ||
-		    !snd_soc_dai_stream_valid(fe->codec_dai, stream))
+		if (!snd_soc_dai_stream_valid(asoc_rtd_to_cpu(fe, 0),   stream) ||
+		    !snd_soc_dai_stream_valid(asoc_rtd_to_codec(fe, 0), stream))
 			continue;
 
 		/* skip if FE isn't currently playing/capturing */
-		if (!fe->cpu_dai->stream_active[stream] ||
-		    !fe->codec_dai->stream_active[stream])
+		if (!asoc_rtd_to_cpu(fe, 0)->stream_active[stream] ||
+		    !asoc_rtd_to_codec(fe, 0)->stream_active[stream])
 			continue;
 
 		paths = dpcm_path_get(fe, stream, &list);
@@ -2922,9 +2922,9 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			if (rtd->num_cpus == 1) {
-				cpu_dai = rtd->cpu_dais[0];
+				cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 			} else if (rtd->num_cpus == rtd->num_codecs) {
-				cpu_dai = rtd->cpu_dais[i];
+				cpu_dai = asoc_rtd_to_cpu(rtd, i);
 			} else {
 				dev_err(rtd->card->dev,
 					"N cpus to M codecs link is not supported yet\n");
@@ -2971,7 +2971,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 			snprintf(new_name, sizeof(new_name), "%s %s-%d",
 				rtd->dai_link->stream_name,
 				(rtd->num_codecs > 1) ?
-				"multicodec" : rtd->codec_dai->name, num);
+				"multicodec" : asoc_rtd_to_codec(rtd, 0)->name, num);
 
 		ret = snd_pcm_new(rtd->card->snd_card, new_name, num, playback,
 			capture, &pcm);
@@ -3050,8 +3050,8 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	pcm->no_device_suspend = true;
 out:
 	dev_info(rtd->card->dev, "%s <-> %s mapping ok\n",
-		 (rtd->num_codecs > 1) ? "multicodec" : rtd->codec_dai->name,
-		 (rtd->num_cpus > 1) ? "multicpu" : rtd->cpu_dai->name);
+		 (rtd->num_codecs > 1) ? "multicodec" : asoc_rtd_to_codec(rtd, 0)->name,
+		 (rtd->num_cpus > 1)   ? "multicpu"   : asoc_rtd_to_cpu(rtd, 0)->name);
 	return ret;
 }
 
-- 
2.20.1

