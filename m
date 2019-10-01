Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9912C3366
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:55:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5237B1689;
	Tue,  1 Oct 2019 13:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5237B1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569930906;
	bh=ASu/PYO98+2O3HrE98U2DRWwbrlv7mDR/2lDH2J9Ync=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kLj+/p7/fydp+CZbgfT02Kmqs1SUsPHQ2xPt1o6aB/MuYDskqitNmgrbE8tSiiPIO
	 x2ef69KYw0HdLuVpxFH2y6zPQAn722GgoAW/gFNKeEgaihCCRWaVw86MwW1tbcZoEW
	 2Ytr5bavdCeNptz0tB1+Bx9PJXttD/pLwg4btW4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 448B4F80793;
	Tue,  1 Oct 2019 13:41:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE5B3F806FA; Tue,  1 Oct 2019 13:41:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22682F805FE
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22682F805FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="h+F8h5Bm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mhWHWBwXSbknkb3rCE8Kq54ngtwnC6sNCqslzzoP/mY=; b=h+F8h5BmdFrM
 LwarzQ0UJn8y1BAA6wDIE5Kc2ykAnLw30sa7nr202zk1THlrdrZAVQkD6R1WRg5Cy9mcmOkN91RdJ
 4kmiv+JQW4+ZvROrqWp+AYBxSQvKYjP2kh27FI7O3G0DDHEhO5h1/Xz/k5nmutDkX0/LtwMl3SR3L
 avrwg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWQ-0004UC-9E; Tue, 01 Oct 2019 11:40:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A9B8727429C0; Tue,  1 Oct 2019 12:40:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d0g6f7s5.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114049.A9B8727429C0@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:49 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: call list_del(&rtd->list) at
	soc_free_pcm_runtime()" to the asoc tree
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

   ASoC: soc-core: call list_del(&rtd->list) at soc_free_pcm_runtime()

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

From 753ace0a34fbd39ac2ec654c6859823db420f69e Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 12 Sep 2019 13:38:50 +0900
Subject: [PATCH] ASoC: soc-core: call list_del(&rtd->list) at
 soc_free_pcm_runtime()

Current ALSA SoC is calling list_del(&rtd->list) at (1)

	static void soc_remove_pcm_runtimes(...)
	{
		...
		for_each_card_rtds_safe(card, rtd, _rtd) {
(1)			list_del(&rtd->list);
(2)			soc_free_pcm_runtime(rtd);
		}
		...
	}

But, we will call soc_free_pcm_runtime() after that (2).
&rtd->list is         connected at soc_new_pcm_runtime(),
Thus, it should be disconnected at soc_free_pcm_runtime().

This patch calls list_del(&rtd->list) at soc_free_pcm_runtime().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87d0g6f7s5.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index cadf96bc0097..7a3f4783adf6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -359,6 +359,7 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 {
 	kfree(rtd->codec_dais);
 	snd_soc_rtdcom_del_all(rtd);
+	list_del(&rtd->list);
 	kfree(rtd);
 }
 
@@ -397,10 +398,8 @@ static void soc_remove_pcm_runtimes(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd, *_rtd;
 
-	for_each_card_rtds_safe(card, rtd, _rtd) {
-		list_del(&rtd->list);
+	for_each_card_rtds_safe(card, rtd, _rtd)
 		soc_free_pcm_runtime(rtd);
-	}
 
 	card->num_rtd = 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
