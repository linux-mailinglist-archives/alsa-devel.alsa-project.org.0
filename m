Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BCD71DAD
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EF01185A;
	Tue, 23 Jul 2019 19:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EF01185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563902886;
	bh=Y9Wzo4obCao6Tik1nLc2ULhGfCqfaxKa1HF3jRLTl9Y=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZKDC4DsgpjJyxVYquMkNHZQIZNxRrpadkiAFIqiYsaWyoO7eVTwzhhVw2vas2u03Z
	 Xa2lbGOUow97cyF/fsK2CVioWfNCFJBoMAN6lzNcm99kT6wocWVZ24Q4qnmr271aOa
	 9DIJo/8Z+XQHlSMsaPe/hFgdMsACyGWf1VkUCols=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 392BAF80600;
	Tue, 23 Jul 2019 19:19:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A44BF804CC; Tue, 23 Jul 2019 19:19:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D2F6F8048F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D2F6F8048F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="a0zdYsO3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=M5zjV8t549AS6YviIeu37EIMh+iJ1KJZHUwS6he8xRA=; b=a0zdYsO3utYD
 qmYKx0DO93vFE7flrQb3Ci9tAoqad3kM6Jac72JBSoTuAgv4hr2NtKXny7UInyFReYTWBCZhyNp/6
 4tlSUzIk/qhRBNc5ut4RLz1uPBie6PqSM98G2b/z0KJu4WU1vyN/MYYiTyk4wDuoBvvFDpPUxFPwZ
 XRDMo=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyRB-0004Lz-5p; Tue, 23 Jul 2019 17:18:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 936E92742BAB; Tue, 23 Jul 2019 18:18:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v9vuhn4b.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723171852.936E92742BAB@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 18:18:52 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-dai: add snd_soc_dai_shutdown()" to
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

   ASoC: soc-dai: add snd_soc_dai_shutdown()

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

From 330fcb5135e0588b1ea3b0bbab587d1317c1cf7b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 22 Jul 2019 10:33:39 +0900
Subject: [PATCH] ASoC: soc-dai: add snd_soc_dai_shutdown()

Current ALSA SoC is directly using dai->driver->ops->xxx,
thus, it has deep nested bracket, and it makes code unreadable.
This patch adds new snd_soc_dai_shutdown() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87v9vuhn4b.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h |  2 ++
 sound/soc/soc-dai.c     |  7 +++++++
 sound/soc/soc-dapm.c    |  7 ++-----
 sound/soc/soc-pcm.c     | 18 ++++++------------
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 0d16c5bb20bb..32545d457b3d 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -152,6 +152,8 @@ void snd_soc_dai_hw_free(struct snd_soc_dai *dai,
 			 struct snd_pcm_substream *substream);
 int snd_soc_dai_startup(struct snd_soc_dai *dai,
 			struct snd_pcm_substream *substream);
+void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
+			  struct snd_pcm_substream *substream);
 
 struct snd_soc_dai_ops {
 	/*
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 6e196636e42f..67ff6cc1fe02 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -300,3 +300,10 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
 
 	return ret;
 }
+
+void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
+			 struct snd_pcm_substream *substream)
+{
+	if (dai->driver->ops->shutdown)
+		dai->driver->ops->shutdown(substream, dai);
+}
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 71bfd049480a..1d04612601ad 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3893,9 +3893,7 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 			snd_soc_dai_hw_free(source, &substream);
 
 			source->active--;
-			if (source->driver->ops->shutdown)
-				source->driver->ops->shutdown(&substream,
-							      source);
+			snd_soc_dai_shutdown(source, &substream);
 		}
 
 		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
@@ -3905,8 +3903,7 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 			snd_soc_dai_hw_free(sink, &substream);
 
 			sink->active--;
-			if (sink->driver->ops->shutdown)
-				sink->driver->ops->shutdown(&substream, sink);
+			snd_soc_dai_shutdown(sink, &substream);
 		}
 		break;
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 9c8713a3eef1..ed5ae23c7104 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -641,16 +641,13 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	i = rtd->num_codecs;
 
 codec_dai_err:
-	for_each_rtd_codec_dai_rollback(rtd, i, codec_dai) {
-		if (codec_dai->driver->ops->shutdown)
-			codec_dai->driver->ops->shutdown(substream, codec_dai);
-	}
+	for_each_rtd_codec_dai_rollback(rtd, i, codec_dai)
+		snd_soc_dai_shutdown(codec_dai, substream);
 
 component_err:
 	soc_pcm_components_close(substream, component);
 
-	if (cpu_dai->driver->ops->shutdown)
-		cpu_dai->driver->ops->shutdown(substream, cpu_dai);
+	snd_soc_dai_shutdown(cpu_dai, substream);
 out:
 	mutex_unlock(&rtd->pcm_mutex);
 
@@ -728,13 +725,10 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 
 	snd_soc_dai_digital_mute(cpu_dai, 1, substream->stream);
 
-	if (cpu_dai->driver->ops->shutdown)
-		cpu_dai->driver->ops->shutdown(substream, cpu_dai);
+	snd_soc_dai_shutdown(cpu_dai, substream);
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		if (codec_dai->driver->ops->shutdown)
-			codec_dai->driver->ops->shutdown(substream, codec_dai);
-	}
+	for_each_rtd_codec_dai(rtd, i, codec_dai)
+		snd_soc_dai_shutdown(codec_dai, substream);
 
 	if (rtd->dai_link->ops->shutdown)
 		rtd->dai_link->ops->shutdown(substream);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
