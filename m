Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DDB71D8A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A30D18D4;
	Tue, 23 Jul 2019 19:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A30D18D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563902454;
	bh=CNrH00B9GlTDeJSfRTuhes+S644+wWr6y2wVD5S/Dek=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=OtjfKKh+ELhRSxEqo0ChraDyfjbKFJP73kcQAw5DFjwPBVT7DZHRFpKxj7Q0JhbFA
	 4Zozdx+5gKSIUAs0WnyJU0h6KoYKatluJAcnxvGtVGFVX4tGm0E/NUSnZf5R3v33U1
	 edb9cafDXjc/MBJhCI80CwjquN+daEgbIRZmdXG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C75C4F804A9;
	Tue, 23 Jul 2019 19:18:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 967D7F8049B; Tue, 23 Jul 2019 19:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B55F8F8044A
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B55F8F8044A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Ui/8HZHt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Jv/9qI14UnGjo+NbmWiY04qrOxjYYWm9dvndmgeyrg4=; b=Ui/8HZHte/W0
 jlT/VgYwh9pPwCPNEoc/cSZQFghEUVfpEocZIJKBZTDj2LDdsbrsPtS7bBS1497gM3nZCaqBlc+pl
 aHZ1a+vGo9ubAuo5wgTeL/kLPngfVw+yPfx7nNGducpZGFKR9zYX18i45JOXPK6WrYNGVQBpfJ+TR
 NE3ww=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyR8-0004LH-QA; Tue, 23 Jul 2019 17:18:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 524B42742B59; Tue, 23 Jul 2019 18:18:50 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ftmyhmzz.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723171850.524B42742B59@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 18:18:50 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-dai: move
	snd_soc_dai_stream_valid() to soc-dai.c" to the asoc tree
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

   ASoC: soc-dai: move snd_soc_dai_stream_valid() to soc-dai.c

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

From 467fece8fbc6774a3a3bd0981e1a342fb5022706 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 22 Jul 2019 10:36:16 +0900
Subject: [PATCH] ASoC: soc-dai: move snd_soc_dai_stream_valid() to soc-dai.c

snd_soc_dai_stream_valid() is function to check stream validity.
But, some code is using it, some code are checking stream->channels_min
directly. Doing samethings by different method is confusable.
This patch uses same funcntion for same purpose.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87ftmyhmzz.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h  |  1 +
 sound/soc/soc-compress.c |  9 ++++-----
 sound/soc/soc-dai.c      | 18 ++++++++++++++++++
 sound/soc/soc-pcm.c      | 39 ++++++++++-----------------------------
 4 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 0f8b09520020..dc48fe081a20 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -168,6 +168,7 @@ int snd_soc_dai_probe(struct snd_soc_dai *dai);
 int snd_soc_dai_remove(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 			     struct snd_soc_pcm_runtime *rtd, int num);
+bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int stream);
 
 struct snd_soc_dai_ops {
 	/*
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index ddef4ff677ce..289211069a1e 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -872,14 +872,13 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 	}
 
 	/* check client and interface hw capabilities */
-	if (codec_dai->driver->playback.channels_min)
+	if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+	    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
 		playback = 1;
-	if (codec_dai->driver->capture.channels_min)
+	if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+	    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
 		capture = 1;
 
-	capture = capture && cpu_dai->driver->capture.channels_min;
-	playback = playback && cpu_dai->driver->playback.channels_min;
-
 	/*
 	 * Compress devices are unidirectional so only one of the directions
 	 * should be set, check for that (xor)
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index e6f161b9f975..1c7f63871c1d 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -387,3 +387,21 @@ int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 		return dai->driver->compress_new(rtd, num);
 	return -ENOTSUPP;
 }
+
+/*
+ * snd_soc_dai_stream_valid() - check if a DAI supports the given stream
+ *
+ * Returns true if the DAI supports the indicated stream type.
+ */
+bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int dir)
+{
+	struct snd_soc_pcm_stream *stream;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		stream = &dai->driver->playback;
+	else
+		stream = &dai->driver->capture;
+
+	/* If the codec specifies any channels at all, it supports the stream */
+	return stream->channels_min;
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index f3137723301c..fabeac164a6c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -29,24 +29,6 @@
 
 #define DPCM_MAX_BE_USERS	8
 
-/*
- * snd_soc_dai_stream_valid() - check if a DAI supports the given stream
- *
- * Returns true if the DAI supports the indicated stream type.
- */
-static bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int stream)
-{
-	struct snd_soc_pcm_stream *codec_stream;
-
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		codec_stream = &dai->driver->playback;
-	else
-		codec_stream = &dai->driver->capture;
-
-	/* If the codec specifies any channels at all, it supports the stream */
-	return codec_stream->channels_min;
-}
-
 /**
  * snd_soc_runtime_activate() - Increment active count for PCM runtime components
  * @rtd: ASoC PCM runtime that is activated
@@ -2688,8 +2670,8 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 		new ? "new" : "old", fe->dai_link->name);
 
 	/* skip if FE doesn't have playback capability */
-	if (!fe->cpu_dai->driver->playback.channels_min ||
-	    !fe->codec_dai->driver->playback.channels_min)
+	if (!snd_soc_dai_stream_valid(fe->cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK) ||
+	    !snd_soc_dai_stream_valid(fe->codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
 		goto capture;
 
 	/* skip if FE isn't currently playing */
@@ -2719,8 +2701,8 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 
 capture:
 	/* skip if FE doesn't have capture capability */
-	if (!fe->cpu_dai->driver->capture.channels_min ||
-	    !fe->codec_dai->driver->capture.channels_min)
+	if (!snd_soc_dai_stream_valid(fe->cpu_dai,   SNDRV_PCM_STREAM_CAPTURE) ||
+	    !snd_soc_dai_stream_valid(fe->codec_dai, SNDRV_PCM_STREAM_CAPTURE))
 		return 0;
 
 	/* skip if FE isn't currently capturing */
@@ -3030,14 +3012,13 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		capture = rtd->dai_link->dpcm_capture;
 	} else {
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
-			if (codec_dai->driver->playback.channels_min)
+			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
 				playback = 1;
-			if (codec_dai->driver->capture.channels_min)
+			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
 				capture = 1;
 		}
-
-		capture = capture && cpu_dai->driver->capture.channels_min;
-		playback = playback && cpu_dai->driver->playback.channels_min;
 	}
 
 	if (rtd->dai_link->playback_only) {
@@ -3375,11 +3356,11 @@ static ssize_t dpcm_state_read_file(struct file *file, char __user *user_buf,
 	if (!buf)
 		return -ENOMEM;
 
-	if (fe->cpu_dai->driver->playback.channels_min)
+	if (snd_soc_dai_stream_valid(fe->cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
 		offset += dpcm_show_state(fe, SNDRV_PCM_STREAM_PLAYBACK,
 					buf + offset, out_count - offset);
 
-	if (fe->cpu_dai->driver->capture.channels_min)
+	if (snd_soc_dai_stream_valid(fe->cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
 		offset += dpcm_show_state(fe, SNDRV_PCM_STREAM_CAPTURE,
 					buf + offset, out_count - offset);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
