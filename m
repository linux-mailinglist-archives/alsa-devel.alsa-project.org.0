Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C4171DAB
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:27:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 203D51915;
	Tue, 23 Jul 2019 19:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 203D51915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563902852;
	bh=39Q109RIECJNgV9DhFdseMS4Hu5AOPvc+sAJwjFu3ak=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Pjmr0PdRph4sXUPU3yr6e210cXPPSr8RWHmL7gK2//NqHUbHC6sc5M2jaRmR35RcD
	 CIjULs16ZkuP4iMDjN1qCyyCBDW3GdPyax+yFmvSM7Fj9T330A/mPr94KqaWcCGYi9
	 2VCUakX864evcByaY7JqQivZYOFi2QMQytgAKTwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57378F805FC;
	Tue, 23 Jul 2019 19:19:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BFC1F8048E; Tue, 23 Jul 2019 19:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58488F8048E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58488F8048E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Cn2+n5GY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=xixb5ghQGu4DszbWSjR8y+nA2560YE3Ek226x8TpmiQ=; b=Cn2+n5GYlupd
 qLuL+c7LuviCHRJC/t0TFDgeh402BImVTf+k4EawYPGkalqtscbntwzDeZ6VAaOWPmuIpV5jDJZ4x
 73xKEEMtJcTbqcfgEGfzmbE0hsQ63P5puoSLU2aiXTEgRueLFkFFhNiJBpyU82E4dAMWFHpXgiCzi
 Lrx+w=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyRA-0004Lf-Iy; Tue, 23 Jul 2019 17:18:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F078A2742B59; Tue, 23 Jul 2019 18:18:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r26ihn3u.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723171851.F078A2742B59@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 18:18:51 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-dai: add
	snd_soc_dai_bespoke_trigger()" to the asoc tree
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

   ASoC: soc-dai: add snd_soc_dai_bespoke_trigger()

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

From 5c0769af4caf8fbdad2e9c0051ab0081b8e22b0a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 22 Jul 2019 10:33:56 +0900
Subject: [PATCH] ASoC: soc-dai: add snd_soc_dai_bespoke_trigger()

Current ALSA SoC is directly using dai->driver->ops->xxx,
thus, it has deep nested bracket, and it makes code unreadable.
This patch adds new snd_soc_dai_bespoke_trigger() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87r26ihn3u.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h |  2 ++
 sound/soc/soc-dai.c     | 12 ++++++++++++
 sound/soc/soc-pcm.c     | 16 ++++++----------
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 72b8e76f1cc4..6a5566d459ad 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -158,6 +158,8 @@ int snd_soc_dai_prepare(struct snd_soc_dai *dai,
 			struct snd_pcm_substream *substream);
 int snd_soc_dai_trigger(struct snd_soc_dai *dai,
 			struct snd_pcm_substream *substream, int cmd);
+int snd_soc_dai_bespoke_trigger(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream, int cmd);
 
 struct snd_soc_dai_ops {
 	/*
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 18c447e169f6..6f466cfcbeef 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -330,3 +330,15 @@ int snd_soc_dai_trigger(struct snd_soc_dai *dai,
 
 	return ret;
 }
+
+int snd_soc_dai_bespoke_trigger(struct snd_soc_dai *dai,
+				struct snd_pcm_substream *substream,
+				int cmd)
+{
+	int ret = 0;
+
+	if (dai->driver->ops->bespoke_trigger)
+		ret = dai->driver->ops->bespoke_trigger(substream, cmd, dai);
+
+	return ret;
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a628b08f966e..a10627f1ceff 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1123,19 +1123,15 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
 	int i, ret;
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		if (codec_dai->driver->ops->bespoke_trigger) {
-			ret = codec_dai->driver->ops->bespoke_trigger(substream,
-								cmd, codec_dai);
-			if (ret < 0)
-				return ret;
-		}
-	}
-
-	if (cpu_dai->driver->ops->bespoke_trigger) {
-		ret = cpu_dai->driver->ops->bespoke_trigger(substream, cmd, cpu_dai);
+		ret = snd_soc_dai_bespoke_trigger(codec_dai, substream, cmd);
 		if (ret < 0)
 			return ret;
 	}
+
+	snd_soc_dai_bespoke_trigger(cpu_dai, substream, cmd);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
