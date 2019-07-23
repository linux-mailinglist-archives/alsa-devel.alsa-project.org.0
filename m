Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B4C71DB5
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:30:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 713091905;
	Tue, 23 Jul 2019 19:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 713091905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563903006;
	bh=1lMF0kuYLl/4/0p0NDmAtQ2CDEm+FFQzaHohYwSrues=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=LbM8qDRh3/hndfC/jGs4oIaZ7IhxapwFtGgQW3URm2H+VsegeSKFsZur5+x/zluq/
	 Y6pHHyATDCJruWrHaKG3DqKnGjrF2ODUNA1iSExdQmlD9K81qcq0G9Zo5KUxH9yM86
	 i8RG3A+BW6RvWMKTQQ/sqZHl2uBY75VYBXO8QCCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BA4AF8063B;
	Tue, 23 Jul 2019 19:19:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 476D3F80519; Tue, 23 Jul 2019 19:19:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DDECF8049C
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DDECF8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="B6U+6lbX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=r75NUu142YOBIU+rx47FOS51xwP6QVw49QqdQzmU5Ag=; b=B6U+6lbXipmb
 YJuyO0KFh/ADFg+dC69ORbtQjMBSgD1VhtfA7w4HYOCBKXP+a2nmMj5txl1FbSjclWQoAiVr3k3kd
 4Y6rON8jMmUEXCqKmhmz0UNnnxuzRG0f92quywlj94TrDpvSvVaq/H9er2NvyFsVvJnx8wur6UE/U
 cwIbI=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyRB-0004M8-Ce; Tue, 23 Jul 2019 17:18:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C67692742B59; Tue, 23 Jul 2019 18:18:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wogahn4i.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723171852.C67692742B59@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 18:18:52 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-dai: add snd_soc_dai_startup()" to
	the asoc tree
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

The patch

   ASoC: soc-dai: add snd_soc_dai_startup()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 5a52a04531486e2ab069b7882432c8b266db36e6 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 22 Jul 2019 10:33:32 +0900
Subject: [PATCH] ASoC: soc-dai: add snd_soc_dai_startup()

Current ALSA SoC is directly using dai->driver->ops->xxx,
thus, it has deep nested bracket, and it makes code unreadable.
This patch adds new snd_soc_dai_startup() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87wogahn4i.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h |  2 ++
 sound/soc/soc-dai.c     | 11 +++++++++++
 sound/soc/soc-dapm.c    | 28 ++++++++++------------------
 sound/soc/soc-pcm.c     | 27 +++++++++++----------------
 4 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 5222b6a758f2..0d16c5bb20bb 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -150,6 +150,8 @@ int snd_soc_dai_hw_params(struct snd_soc_dai *dai,
 			  struct snd_pcm_hw_params *params);
 void snd_soc_dai_hw_free(struct snd_soc_dai *dai,
 			 struct snd_pcm_substream *substream);
+int snd_soc_dai_startup(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream);
 
 struct snd_soc_dai_ops {
 	/*
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 39a685e6acd5..6e196636e42f 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -289,3 +289,14 @@ void snd_soc_dai_hw_free(struct snd_soc_dai *dai,
 	if (dai->driver->ops->hw_free)
 		dai->driver->ops->hw_free(substream, dai);
 }
+
+int snd_soc_dai_startup(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream)
+{
+	int ret = 0;
+
+	if (dai->driver->ops->startup)
+		ret = dai->driver->ops->startup(substream, dai);
+
+	return ret;
+}
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 0783b05133ad..71bfd049480a 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3828,15 +3828,11 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
 
-			if (source->driver->ops->startup) {
-				ret = source->driver->ops->startup(&substream,
-								   source);
-				if (ret < 0) {
-					dev_err(source->dev,
-						"ASoC: startup() failed: %d\n",
-						ret);
-					goto out;
-				}
+			ret = snd_soc_dai_startup(source, &substream);
+			if (ret < 0) {
+				dev_err(source->dev,
+					"ASoC: startup() failed: %d\n", ret);
+				goto out;
 			}
 			source->active++;
 			ret = snd_soc_dai_hw_params(source, &substream, params);
@@ -3850,15 +3846,11 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
 
-			if (sink->driver->ops->startup) {
-				ret = sink->driver->ops->startup(&substream,
-								 sink);
-				if (ret < 0) {
-					dev_err(sink->dev,
-						"ASoC: startup() failed: %d\n",
-						ret);
-					goto out;
-				}
+			ret = snd_soc_dai_startup(sink, &substream);
+			if (ret < 0) {
+				dev_err(sink->dev,
+					"ASoC: startup() failed: %d\n", ret);
+				goto out;
 			}
 			sink->active++;
 			ret = snd_soc_dai_hw_params(sink, &substream, params);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 58fc4e98ab59..9c8713a3eef1 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -535,13 +535,11 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
 
 	/* startup the audio subsystem */
-	if (cpu_dai->driver->ops->startup) {
-		ret = cpu_dai->driver->ops->startup(substream, cpu_dai);
-		if (ret < 0) {
-			dev_err(cpu_dai->dev, "ASoC: can't open interface"
-				" %s: %d\n", cpu_dai->name, ret);
-			goto out;
-		}
+	ret = snd_soc_dai_startup(cpu_dai, substream);
+	if (ret < 0) {
+		dev_err(cpu_dai->dev, "ASoC: can't open interface %s: %d\n",
+			cpu_dai->name, ret);
+		goto out;
 	}
 
 	ret = soc_pcm_components_open(substream, &component);
@@ -549,15 +547,12 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 		goto component_err;
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		if (codec_dai->driver->ops->startup) {
-			ret = codec_dai->driver->ops->startup(substream,
-							      codec_dai);
-			if (ret < 0) {
-				dev_err(codec_dai->dev,
-					"ASoC: can't open codec %s: %d\n",
-					codec_dai->name, ret);
-				goto codec_dai_err;
-			}
+		ret = snd_soc_dai_startup(codec_dai, substream);
+		if (ret < 0) {
+			dev_err(codec_dai->dev,
+				"ASoC: can't open codec %s: %d\n",
+				codec_dai->name, ret);
+			goto codec_dai_err;
 		}
 
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
