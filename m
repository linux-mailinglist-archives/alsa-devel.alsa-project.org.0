Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB1EC3386
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:57:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A501166F;
	Tue,  1 Oct 2019 13:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A501166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569931027;
	bh=ycK3GVcIQmL3UPOJ9qIUZIC1U694I3bRpF4SYyPSAOA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mn+x47WKeh2/Jzy/Ep+/8VL5NskSUF/8InDeqaWd2Jy09pwY1eTBFrtrKhmgpdzbC
	 mxFd3w8x7AguadJMXkiWnuiPX7gTrQShQP2d6x1F35hjPey42cmawevX1glTnsLnUd
	 aZDq60FsFifgQMvFvvwoiEzGD/ToS38fpJEuhj9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD3D2F8085A;
	Tue,  1 Oct 2019 13:41:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 779A5F8060E; Tue,  1 Oct 2019 13:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BA1FF80611
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BA1FF80611
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ahRlF1HX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=VwOEm4EHq0GqQ4nXb2BK4dB4t1ttwWcmSlGgzzqNC7c=; b=ahRlF1HXzs57
 yt9Ks72lLsfHLMDZO1VVBqW7bRTe+1hbL0PeZKjeLo7xcB6fyR4tFOlsg4FoBxaTjCUemD3e8FMrg
 sCEaMHXdDIKI/we3ctBsvcMxkjEJ7O7zNJyaDp9XL5sj6wl1/22p4WIZUa712ujZ+2Iv8IbyNsA7h
 NVlbs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWQ-0004US-Me; Tue, 01 Oct 2019 11:40:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1C3682742A30; Tue,  1 Oct 2019 12:40:50 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ftl2f7sx.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114050.1C3682742A30@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:50 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: move soc_free_pcm_runtime()"
	to the asoc tree
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

   ASoC: soc-core: move soc_free_pcm_runtime()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 1c93a9e00e40e3a084ebbcaa4a8f412b83f1fa0d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 12 Sep 2019 13:38:22 +0900
Subject: [PATCH] ASoC: soc-core: move soc_free_pcm_runtime()

This patch moves soc_free_pcm_runtime() next to soc_new_pcm_runtime().
This is prepare for soc_xxx_pcm_runtime() cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87ftl2f7sx.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 88978a3036c4..96d38db8b578 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -355,6 +355,13 @@ EXPORT_SYMBOL_GPL(snd_soc_get_dai_substream);
 
 static const struct snd_soc_ops null_snd_soc_ops;
 
+static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
+{
+	kfree(rtd->codec_dais);
+	snd_soc_rtdcom_del_all(rtd);
+	kfree(rtd);
+}
+
 static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
@@ -381,13 +388,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	return rtd;
 }
 
-static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
-{
-	kfree(rtd->codec_dais);
-	snd_soc_rtdcom_del_all(rtd);
-	kfree(rtd);
-}
-
 static void soc_add_pcm_runtime(struct snd_soc_card *card,
 		struct snd_soc_pcm_runtime *rtd)
 {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
