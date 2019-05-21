Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2809E2592E
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 22:44:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F55B1654;
	Tue, 21 May 2019 22:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F55B1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558471476;
	bh=DBqNUvBvoza6V3VaKxQCkPOx+nzV9oUl5J00WKujnBE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=iKBUxl0V1ZdYlxXNIu7mkEjVM00QCG9BzvrEK4xNDNHxjEb/wJkqO1eEQ1R6zE7Kv
	 fYFYnvnuYJMKDK4dVDEKyaL7Qud198bWu2MUy1pYT3sYYtzNpjm2BgmsI0jVfPr2DT
	 umrStgioLPQi3IXF11eh9ne47Y7o8Ug5lCknp96I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4293FF89732;
	Tue, 21 May 2019 22:42:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F624F89670; Tue, 21 May 2019 22:42:48 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB9A6F89670
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 22:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB9A6F89670
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="eNGp7CIG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=e+0dW31ZssfY74jVDIaNgZsB8Si/AwkHsKhddOzH0wM=; b=eNGp7CIG97JU
 8KkaUQSUnbVh/UvmtYU2r869qSVuJIdwWbWuvyArIifrPphYewSX4Op2iADLK921X1gIRvOJ6Iln0
 a8vXdGNU/JoxSnQ/4oTyONCoQVZ8WOUHt2vJenKhTp1XWQMUYnbJupp5wIj9XYwQVt95qiuwT2A3K
 /UwXk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTBRF-0001yS-3p; Tue, 21 May 2019 20:32:45 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 6FA3C1126D1E; Tue, 21 May 2019 21:32:42 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfz53mrc.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190521203242.6FA3C1126D1E@debutante.sirena.org.uk>
Date: Tue, 21 May 2019 21:32:42 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rsnd: move pcm_new from
	snd_soc_component_driver to snd_soc_dai_driver" to the asoc tree
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

   ASoC: rsnd: move pcm_new from snd_soc_component_driver to snd_soc_dai_driver

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From e9b5daad4e9bdd1b9e467873a4463c867ccf9ff1 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 17 May 2019 10:29:16 +0900
Subject: [PATCH] ASoC: rsnd: move pcm_new from snd_soc_component_driver to
 snd_soc_dai_driver

snd_soc_dai_driver :: pcm_new has snd_soc_dai as parameter, but
snd_soc_component_driver :: pcm_new doesn't have it.

rsnd driver needs snd_soc_dai at pcm_new.
This patch moves .pcm_new from snd_soc_component_driver to
snd_soc_dai_driver, and don't use rtd->cpu_dai anymore.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/core.c | 120 +++++++++++++++++++--------------------
 1 file changed, 60 insertions(+), 60 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 37cb61553d5f..56e8dae9a15c 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1176,6 +1176,65 @@ static struct device_node *rsnd_dai_of_node(struct rsnd_priv *priv,
 	return ret;
 }
 
+
+#define PREALLOC_BUFFER		(32 * 1024)
+#define PREALLOC_BUFFER_MAX	(32 * 1024)
+
+static int rsnd_preallocate_pages(struct snd_soc_pcm_runtime *rtd,
+				  struct rsnd_dai_stream *io,
+				  int stream)
+{
+	struct rsnd_priv *priv = rsnd_io_to_priv(io);
+	struct device *dev = rsnd_priv_to_dev(priv);
+	struct snd_pcm_substream *substream;
+
+	/*
+	 * use Audio-DMAC dev if we can use IPMMU
+	 * see
+	 *	rsnd_dmaen_attach()
+	 */
+	if (io->dmac_dev)
+		dev = io->dmac_dev;
+
+	for (substream = rtd->pcm->streams[stream].substream;
+	     substream;
+	     substream = substream->next) {
+		snd_pcm_lib_preallocate_pages(substream,
+					      SNDRV_DMA_TYPE_DEV,
+					      dev,
+					      PREALLOC_BUFFER, PREALLOC_BUFFER_MAX);
+	}
+
+	return 0;
+}
+
+static int rsnd_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			struct snd_soc_dai *dai)
+{
+	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
+	int ret;
+
+	ret = rsnd_dai_call(pcm_new, &rdai->playback, rtd);
+	if (ret)
+		return ret;
+
+	ret = rsnd_dai_call(pcm_new, &rdai->capture, rtd);
+	if (ret)
+		return ret;
+
+	ret = rsnd_preallocate_pages(rtd, &rdai->playback,
+				     SNDRV_PCM_STREAM_PLAYBACK);
+	if (ret)
+		return ret;
+
+	ret = rsnd_preallocate_pages(rtd, &rdai->capture,
+				     SNDRV_PCM_STREAM_CAPTURE);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static void __rsnd_dai_probe(struct rsnd_priv *priv,
 			     struct device_node *dai_np,
 			     int dai_i)
@@ -1198,6 +1257,7 @@ static void __rsnd_dai_probe(struct rsnd_priv *priv,
 	rdai->priv	= priv;
 	drv->name	= rdai->name;
 	drv->ops	= &rsnd_soc_dai_ops;
+	drv->pcm_new	= rsnd_pcm_new;
 
 	snprintf(io_playback->name, RSND_DAI_NAME_SIZE,
 		 "DAI%d Playback", dai_i);
@@ -1572,68 +1632,8 @@ int rsnd_kctrl_new(struct rsnd_mod *mod,
 /*
  *		snd_soc_component
  */
-
-#define PREALLOC_BUFFER		(32 * 1024)
-#define PREALLOC_BUFFER_MAX	(32 * 1024)
-
-static int rsnd_preallocate_pages(struct snd_soc_pcm_runtime *rtd,
-				  struct rsnd_dai_stream *io,
-				  int stream)
-{
-	struct rsnd_priv *priv = rsnd_io_to_priv(io);
-	struct device *dev = rsnd_priv_to_dev(priv);
-	struct snd_pcm_substream *substream;
-
-	/*
-	 * use Audio-DMAC dev if we can use IPMMU
-	 * see
-	 *	rsnd_dmaen_attach()
-	 */
-	if (io->dmac_dev)
-		dev = io->dmac_dev;
-
-	for (substream = rtd->pcm->streams[stream].substream;
-	     substream;
-	     substream = substream->next) {
-		snd_pcm_lib_preallocate_pages(substream,
-					SNDRV_DMA_TYPE_DEV,
-					dev,
-					PREALLOC_BUFFER, PREALLOC_BUFFER_MAX);
-	}
-
-	return 0;
-}
-
-static int rsnd_pcm_new(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dai *dai = rtd->cpu_dai;
-	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
-	int ret;
-
-	ret = rsnd_dai_call(pcm_new, &rdai->playback, rtd);
-	if (ret)
-		return ret;
-
-	ret = rsnd_dai_call(pcm_new, &rdai->capture, rtd);
-	if (ret)
-		return ret;
-
-	ret = rsnd_preallocate_pages(rtd, &rdai->playback,
-				     SNDRV_PCM_STREAM_PLAYBACK);
-	if (ret)
-		return ret;
-
-	ret = rsnd_preallocate_pages(rtd, &rdai->capture,
-				     SNDRV_PCM_STREAM_CAPTURE);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static const struct snd_soc_component_driver rsnd_soc_component = {
 	.ops		= &rsnd_pcm_ops,
-	.pcm_new	= rsnd_pcm_new,
 	.name		= "rsnd",
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
