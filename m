Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FAE71D8D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5FB018D5;
	Tue, 23 Jul 2019 19:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5FB018D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563902500;
	bh=uCTXmX0JngNMp2md6Tt/fLOhdRIBgeNPD6Cf3x5t2m8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=S3R28CSU0XgNq5LLaKnA4IMqJRfG3ICwO8e2TUIyZ/5b1x/CS+2MFOgdzTy8/OOXq
	 nH51AET+pjefEs34CvjQ7HE+lVJyyDEm3JE6lid2sH0gaOF1fqvb/1IlhQuDiNoRP6
	 jO5615DjpA9xqhCHs53zsAi1HgfAeZ+yWc4p67nU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 615F5F80481;
	Tue, 23 Jul 2019 19:19:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7D4CF804CF; Tue, 23 Jul 2019 19:18:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94E89F8044B
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94E89F8044B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="c6cgCqid"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=fVVzmympb3yRnZbecdyT/mGyRmGSMVpflsfi/quxSNg=; b=c6cgCqidhLKL
 QMio1AItz2uAdlNV2njJl1u/5oaloOHUu4QPww1VAs72Ll35qsne090H+EwPPRS2TEuFRHJq97zeP
 CBy7ElMRBefI8Lp4NYh77rZTIFt/Js1BsAzdb43ZQBebMLh8J2U0i4PRzLSffP55cBuYv//jGcN0g
 F06as=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyRA-0004LW-3s; Tue, 23 Jul 2019 17:18:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 928712742BAE; Tue, 23 Jul 2019 18:18:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87muh6hn2x.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723171851.928712742BAE@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 18:18:51 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-dai: add snd_soc_dai_suspend()" to
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

   ASoC: soc-dai: add snd_soc_dai_suspend()

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

From e0f2262292d0c8160cfd9a8c40425107fb65ab29 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 22 Jul 2019 10:34:29 +0900
Subject: [PATCH] ASoC: soc-dai: add snd_soc_dai_suspend()

Current ALSA SoC is directly using dai->driver->xxx,
thus, it has deep nested bracket, and it makes code unreadable.
This patch adds new snd_soc_dai_suspend() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87muh6hn2x.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h | 1 +
 sound/soc/soc-core.c    | 8 ++++----
 sound/soc/soc-dai.c     | 6 ++++++
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 7cfed3034511..6c5604a7dbc2 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -162,6 +162,7 @@ int snd_soc_dai_bespoke_trigger(struct snd_soc_dai *dai,
 			struct snd_pcm_substream *substream, int cmd);
 snd_pcm_sframes_t snd_soc_dai_delay(struct snd_soc_dai *dai,
 				    struct snd_pcm_substream *substream);
+void snd_soc_dai_suspend(struct snd_soc_dai *dai);
 
 struct snd_soc_dai_ops {
 	/*
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6e8c5c8eeaec..7493afb2371c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -511,8 +511,8 @@ int snd_soc_suspend(struct device *dev)
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		if (cpu_dai->driver->suspend && !cpu_dai->driver->bus_control)
-			cpu_dai->driver->suspend(cpu_dai);
+		if (!cpu_dai->driver->bus_control)
+			snd_soc_dai_suspend(cpu_dai);
 	}
 
 	/* close any waiting streams */
@@ -584,8 +584,8 @@ int snd_soc_suspend(struct device *dev)
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		if (cpu_dai->driver->suspend && cpu_dai->driver->bus_control)
-			cpu_dai->driver->suspend(cpu_dai);
+		if (cpu_dai->driver->bus_control)
+			snd_soc_dai_suspend(cpu_dai);
 
 		/* deactivate pins to sleep state */
 		pinctrl_pm_select_sleep_state(cpu_dai->dev);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 5b5b979cd1f3..3373598e0682 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -353,3 +353,9 @@ snd_pcm_sframes_t snd_soc_dai_delay(struct snd_soc_dai *dai,
 
 	return delay;
 }
+
+void snd_soc_dai_suspend(struct snd_soc_dai *dai)
+{
+	if (dai->driver->suspend)
+		dai->driver->suspend(dai);
+}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
