Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C09A371DA2
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56565190F;
	Tue, 23 Jul 2019 19:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56565190F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563902769;
	bh=cY+wCL8StqrLulWYiSE+LLL8Mpb5bV7LXcjqUl6cOGE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=snUJ/h3QPiyMJM7RfFs3t110GDpB6XaGfzcyrytouwN3yRivPYYukwkOfShSLB1E6
	 o7SSaISsQ8G8qTaXAA1Tn3hd31E7JwFYE0+owKiA96l9qTISEkY+9DDZI6oRpkEXH+
	 lWYvQgjyTWcKFlLPJMBHguu0BMOCAN0c+vH/n5O8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5067CF805E0;
	Tue, 23 Jul 2019 19:19:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95FC5F804FE; Tue, 23 Jul 2019 19:19:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BAE8F8048D
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BAE8F8048D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="u8TqT1Mq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=dMvHB66yXww+ajjEipG4d1q7kOf+Pur8Co+xTnxKdvQ=; b=u8TqT1Mq45hB
 NzDk1SZugkYGz1VyA6vF0LjbRpkTlYR0HANB86zoAz5XsW6SITmEthh+6Bghrho5jFV2YSW7K1lNC
 M4OqETmhxEYA/X60z3XJ9rMBCQ6fjFYJ7iT29yiXu+rqYGi9D876Cv7du8eX37T1eFenD1RRGGFlO
 rSmWU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyRA-0004Lu-TA; Tue, 23 Jul 2019 17:18:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 626CC2742BAC; Tue, 23 Jul 2019 18:18:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tvbehn46.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723171852.626CC2742BAC@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 18:18:52 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-dai: add snd_soc_dai_prepare()" to
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

   ASoC: soc-dai: add snd_soc_dai_prepare()

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

From 4beb8e109d30d339d44308a767dd6f5614492f3e Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 22 Jul 2019 10:33:45 +0900
Subject: [PATCH] ASoC: soc-dai: add snd_soc_dai_prepare()

Current ALSA SoC is directly using dai->driver->ops->xxx,
thus, it has deep nested bracket, and it makes code unreadable.
This patch adds new snd_soc_dai_prepare() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87tvbehn46.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h |  2 ++
 sound/soc/soc-dai.c     | 11 +++++++++++
 sound/soc/soc-pcm.c     | 27 +++++++++++----------------
 3 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 32545d457b3d..c7dff6a0b5b9 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -154,6 +154,8 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
 			struct snd_pcm_substream *substream);
 void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 			  struct snd_pcm_substream *substream);
+int snd_soc_dai_prepare(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream);
 
 struct snd_soc_dai_ops {
 	/*
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 67ff6cc1fe02..cb810888c563 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -307,3 +307,14 @@ void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 	if (dai->driver->ops->shutdown)
 		dai->driver->ops->shutdown(substream, dai);
 }
+
+int snd_soc_dai_prepare(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream)
+{
+	int ret = 0;
+
+	if (dai->driver->ops->prepare)
+		ret = dai->driver->ops->prepare(substream, dai);
+
+	return ret;
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ed5ae23c7104..d7611af90dce 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -814,27 +814,22 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 	}
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		if (codec_dai->driver->ops->prepare) {
-			ret = codec_dai->driver->ops->prepare(substream,
-							      codec_dai);
-			if (ret < 0) {
-				dev_err(codec_dai->dev,
-					"ASoC: codec DAI prepare error: %d\n",
-					ret);
-				goto out;
-			}
-		}
-	}
-
-	if (cpu_dai->driver->ops->prepare) {
-		ret = cpu_dai->driver->ops->prepare(substream, cpu_dai);
+		ret = snd_soc_dai_prepare(codec_dai, substream);
 		if (ret < 0) {
-			dev_err(cpu_dai->dev,
-				"ASoC: cpu DAI prepare error: %d\n", ret);
+			dev_err(codec_dai->dev,
+				"ASoC: codec DAI prepare error: %d\n",
+				ret);
 			goto out;
 		}
 	}
 
+	ret = snd_soc_dai_prepare(cpu_dai, substream);
+	if (ret < 0) {
+		dev_err(cpu_dai->dev,
+			"ASoC: cpu DAI prepare error: %d\n", ret);
+		goto out;
+	}
+
 	/* cancel any delayed stream shutdown that is pending */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
 	    rtd->pop_wait) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
