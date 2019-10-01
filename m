Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B277C3359
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BF041699;
	Tue,  1 Oct 2019 13:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BF041699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569930695;
	bh=/ooiCe/G46xhXrMU/pFRBgCI7PvCePwXm/YtqmvWgdQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ByPvFW98fJqgP912hAn7MTYUtDbiEhv3DcYMAmIkV5RnNJU6sdiOLApLlz4x3bpuN
	 M7W86frB1J0TXjMiUKb9RgRY4nbDWQi5ZKYS2rqsj9KyTmADWsEQOFV8Q3fNSMBUON
	 d1EGiaA/B6i1E6qH5rDCucHPenfQxVoYmkcKbI30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8ADDF80746;
	Tue,  1 Oct 2019 13:41:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11D62F806E5; Tue,  1 Oct 2019 13:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7F5FF805FD
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7F5FF805FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bdKcW4bC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=84IFzwBiDY/bCbD2z9RiSXCpIU1NkPEmM33xbwUri9o=; b=bdKcW4bCIKEa
 b8FeoGVeSJyyPNezM8gvntBuAXTtnOIGPXIG1Ea1n5uxTaw40SYF0x82bxt6dSsZRixmc7THG3bIQ
 /O9G/6lKxeV1E91/st0aG4EUR82x6H9JuTuKUsuhq+vKb4eJja7oKQyD5X93Cw7W/jK+CNdQww1tJ
 myc5g=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWO-0004TL-Tu; Tue, 01 Oct 2019 11:40:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6BAB12742A10; Tue,  1 Oct 2019 12:40:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zlyf7ln.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114048.6BAB12742A10@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:48 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove
	snd_soc_rtdcom_del_all()" to the asoc tree
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

   ASoC: soc-core: remove snd_soc_rtdcom_del_all()

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

From 353e16bf60458fae5927cf04ff668fc152fff465 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 12 Sep 2019 13:42:44 +0900
Subject: [PATCH] ASoC: soc-core: remove snd_soc_rtdcom_del_all()

If we can use devm_kzalloc(rtd->dev, xxx) for rtdcom,
we don't need to call snd_soc_rtdcom_del_all() for kfree().
This patch uses devm_kzalloc(rtd->dev, xxx) for rtdcom,
and remove snd_soc_rtdcom_del_all().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/875zlyf7ln.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b72207412c73..d2842a383846 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -288,28 +288,29 @@ static int snd_soc_rtdcom_add(struct snd_soc_pcm_runtime *rtd,
 			return 0;
 	}
 
-	rtdcom = kmalloc(sizeof(*rtdcom), GFP_KERNEL);
+	/*
+	 * created rtdcom here will be freed when rtd->dev was freed.
+	 * see
+	 *	soc_free_pcm_runtime() :: device_unregister(rtd->dev)
+	 */
+	rtdcom = devm_kzalloc(rtd->dev, sizeof(*rtdcom), GFP_KERNEL);
 	if (!rtdcom)
 		return -ENOMEM;
 
 	rtdcom->component = component;
 	INIT_LIST_HEAD(&rtdcom->list);
 
+	/*
+	 * When rtd was freed, created rtdcom here will be
+	 * also freed.
+	 * And we don't need to call list_del(&rtdcom->list)
+	 * when freed, because rtd is also freed.
+	 */
 	list_add_tail(&rtdcom->list, &rtd->component_list);
 
 	return 0;
 }
 
-static void snd_soc_rtdcom_del_all(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_rtdcom_list *rtdcom1, *rtdcom2;
-
-	for_each_rtdcom_safe(rtd, rtdcom1, rtdcom2)
-		kfree(rtdcom1);
-
-	INIT_LIST_HEAD(&rtd->component_list);
-}
-
 struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 						const char *driver_name)
 {
@@ -370,7 +371,6 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 		return;
 
 	kfree(rtd->codec_dais);
-	snd_soc_rtdcom_del_all(rtd);
 	list_del(&rtd->list);
 
 	/*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
