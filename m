Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 099BD71DB1
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:28:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9219E1915;
	Tue, 23 Jul 2019 19:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9219E1915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563902925;
	bh=sh8HjJtGvWp9w3EmqUrarj+f6VpTRV8ymoHXe7ZR67w=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QIIJ3yY7Z30tqpx0kqQOow4TIiVAsarNasUSlLHzzn+9bCaVXNeW5Y6Gg1+VLeN2C
	 bnW1sc2yRDC0Itw00URm6VVCEHvwc6UHCGyv9WXVt7k4yclh8YolmXZ0hE9oV0cSNA
	 oElIGNtflWZDKjyKrCRddaQOrZsIKSOUVluY86Wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 875E4F80611;
	Tue, 23 Jul 2019 19:19:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D069F800E8; Tue, 23 Jul 2019 19:19:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A37FF8049A
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A37FF8049A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nudF7A+e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=zxlpufFBytOK/bJpHMhGhNM+t90kDhfCGfOqfMHKPFU=; b=nudF7A+e28lm
 Il3QOHA7+C7iC6p4SHUg5Wu4stxC4FWkl9P8E5OnLCN0qmA5CSckIgvUo1BH/cDerF37K/FaxNE48
 c/KDqf6XgdyDXmnrfHxs1SOwIQk0KLDB7cWxIFVnNO25qmumnioFkOj7BMlj4/xivGSaxJpQlxMtf
 l2UZQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyRB-0004MD-Gy; Tue, 23 Jul 2019 17:18:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 035302742B60; Tue, 23 Jul 2019 18:18:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y30qhn4w.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723171853.035302742B60@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 18:18:52 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-dai: add snd_soc_dai_hw_free()" to
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

   ASoC: soc-dai: add snd_soc_dai_hw_free()

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

From 846faaed9df7899e74311db3aec0a41a2f6bc345 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 22 Jul 2019 10:33:19 +0900
Subject: [PATCH] ASoC: soc-dai: add snd_soc_dai_hw_free()

Current ALSA SoC is directly using dai->driver->ops->xxx,
thus, it has deep nested bracket, and it makes code unreadable.
This patch adds new snd_soc_dai_hw_free() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87y30qhn4w.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h |  2 ++
 sound/soc/soc-dai.c     |  7 +++++++
 sound/soc/soc-dapm.c    |  7 ++-----
 sound/soc/soc-pcm.c     | 12 ++++--------
 4 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 3773262a1b77..5222b6a758f2 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -148,6 +148,8 @@ int snd_soc_dai_is_dummy(struct snd_soc_dai *dai);
 int snd_soc_dai_hw_params(struct snd_soc_dai *dai,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params);
+void snd_soc_dai_hw_free(struct snd_soc_dai *dai,
+			 struct snd_pcm_substream *substream);
 
 struct snd_soc_dai_ops {
 	/*
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index f883d27d136f..39a685e6acd5 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -282,3 +282,10 @@ int snd_soc_dai_hw_params(struct snd_soc_dai *dai,
 
 	return 0;
 }
+
+void snd_soc_dai_hw_free(struct snd_soc_dai *dai,
+			 struct snd_pcm_substream *substream)
+{
+	if (dai->driver->ops->hw_free)
+		dai->driver->ops->hw_free(substream, dai);
+}
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 8fc6a01f5d8b..0783b05133ad 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3898,9 +3898,7 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
 
-			if (source->driver->ops->hw_free)
-				source->driver->ops->hw_free(&substream,
-							     source);
+			snd_soc_dai_hw_free(source, &substream);
 
 			source->active--;
 			if (source->driver->ops->shutdown)
@@ -3912,8 +3910,7 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
 
-			if (sink->driver->ops->hw_free)
-				sink->driver->ops->hw_free(&substream, sink);
+			snd_soc_dai_hw_free(sink, &substream);
 
 			sink->active--;
 			if (sink->driver->ops->shutdown)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 420cc94e0a46..58fc4e98ab59 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1011,8 +1011,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 component_err:
 	soc_pcm_components_hw_free(substream, component);
 
-	if (cpu_dai->driver->ops->hw_free)
-		cpu_dai->driver->ops->hw_free(substream, cpu_dai);
+	snd_soc_dai_hw_free(cpu_dai, substream);
 	cpu_dai->rate = 0;
 
 interface_err:
@@ -1023,8 +1022,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 		if (!snd_soc_dai_stream_valid(codec_dai, substream->stream))
 			continue;
 
-		if (codec_dai->driver->ops->hw_free)
-			codec_dai->driver->ops->hw_free(substream, codec_dai);
+		snd_soc_dai_hw_free(codec_dai, substream);
 		codec_dai->rate = 0;
 	}
 
@@ -1083,12 +1081,10 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 		if (!snd_soc_dai_stream_valid(codec_dai, substream->stream))
 			continue;
 
-		if (codec_dai->driver->ops->hw_free)
-			codec_dai->driver->ops->hw_free(substream, codec_dai);
+		snd_soc_dai_hw_free(codec_dai, substream);
 	}
 
-	if (cpu_dai->driver->ops->hw_free)
-		cpu_dai->driver->ops->hw_free(substream, cpu_dai);
+	snd_soc_dai_hw_free(cpu_dai, substream);
 
 	mutex_unlock(&rtd->pcm_mutex);
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
