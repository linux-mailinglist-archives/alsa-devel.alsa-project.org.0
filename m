Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25445CC238
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 19:57:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DB2A1691;
	Fri,  4 Oct 2019 19:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DB2A1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570211823;
	bh=3omDBv6uyQCP59LcorJ9oS5pSVtgM/tMzAflVvkxnfM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SrjmEeuziwe2Vgt58wwYXgRHsAH8gH1wGrCAASOroZpFUTMuhEOpUhcP/Wf+L2EKD
	 y3JghfPYQhXnb07eSkPgumZ2/biOkltF05nVofPgywgPSxA1bNQlrlyfJ6lsRgZUpP
	 YPlnf3JIIiSMmg9Pjv/7pBi2EHo5Mt+QtCbTMo2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33310F8063A;
	Fri,  4 Oct 2019 19:52:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42401F805FE; Fri,  4 Oct 2019 19:52:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86FFEF804CB
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 19:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86FFEF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="b8ELJMdv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=jBMEAf9oH++sVWxPcM9wa31UD07A8ZoRnH5qEhdXpKQ=; b=b8ELJMdvTDXA
 Kka0grEWRtC+7h1JqcJcExiGAfFXCzFZJi69xSMoYS0VMovcObAjABYqrx73jo4ExBs5PAk8UKAv6
 eIoe/Yvje5ZGSvir0msZLcst999qnm+ZRzBvrczXHMFeshpxYm5xsisDTeDMD9tZqXnfCWgGty/Xm
 sIqqw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iGRkp-0003v1-UL; Fri, 04 Oct 2019 17:52:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 695462741F98; Fri,  4 Oct 2019 18:52:35 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e5nbu1z.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191004175235.695462741F98@ypsilon.sirena.org.uk>
Date: Fri,  4 Oct 2019 18:52:35 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: use devm_kzalloc() for rtd"
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

   ASoC: soc-core: use devm_kzalloc() for rtd

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

From 4dc0e7df62839d052476de0f8447f29f857cecda Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:22:32 +0900
Subject: [PATCH] ASoC: soc-core: use devm_kzalloc() for rtd

Current rtd, rtd->dev, rtd->codec_dais are created by normal kzalloc(),
but we want to use devm_kzalloc() as much as possible.

Created rtd->dev is registered by device_register() at
soc_new_pcm_runtime(), and it will be freed at
soc_free_pcm_runtime() by device_unregister().

This means, if we can use devm_kzalloc(rtd->dev, xxx) for
rtd / rtd->codec_dais, all these are automatically freed
via soc_free_pcm_runtime().
This patch uses devm_kzalloc(rtd->dev, xxx) for rtd / rtd->codec_dais.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/877e5nbu1z.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4a47ba94559f..b16a94228091 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -370,7 +370,6 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 	if (!rtd)
 		return;
 
-	kfree(rtd->codec_dais);
 	list_del(&rtd->list);
 
 	/*
@@ -384,7 +383,6 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 	 *	soc_new_pcm_runtime()
 	 */
 	device_unregister(rtd->dev);
-	kfree(rtd);
 }
 
 static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
@@ -416,7 +414,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	/*
 	 * for rtd
 	 */
-	rtd = kzalloc(sizeof(struct snd_soc_pcm_runtime), GFP_KERNEL);
+	rtd = devm_kzalloc(dev, sizeof(*rtd), GFP_KERNEL);
 	if (!rtd)
 		goto free_rtd;
 
@@ -426,7 +424,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	/*
 	 * for rtd->codec_dais
 	 */
-	rtd->codec_dais = kcalloc(dai_link->num_codecs,
+	rtd->codec_dais = devm_kcalloc(dev, dai_link->num_codecs,
 					sizeof(struct snd_soc_dai *),
 					GFP_KERNEL);
 	if (!rtd->codec_dais)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
