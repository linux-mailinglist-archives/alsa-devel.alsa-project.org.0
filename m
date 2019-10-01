Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CED97C335B
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:52:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6367F1698;
	Tue,  1 Oct 2019 13:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6367F1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569930739;
	bh=n0DEAZDsvHHbTkOfYj4LM8DJBOucViBN3DA922mPz8w=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IJIPSl0m4masvw3aNYtXmfCVp/RHyA+HN+000xmokwdiuyZx4T3DqSCKKawIqDSbY
	 6K0m63KPZzsQ5qdgKCqtZw3JmFYF/bJIfHksRsieaEA2Nyt2/0skjEoOkAalqJHLAl
	 HdIONJdSEakZ7jGZ08u8RegSICgsDMVtpLBolxgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F3DCF80753;
	Tue,  1 Oct 2019 13:41:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BCAAF8068A; Tue,  1 Oct 2019 13:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CDD4F800D0
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CDD4F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WfLupBn4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=kIdOJz5DnpESoxvgpULbi3fd+sH/ZUHCM6R1d4WE10U=; b=WfLupBn4lXNu
 MJJ5mE890F/TPmowUhnfTS/VX6Ft9CoJ9ZsmHBGwVgYbWlsJ2nciCdRusnwdfw0cjULJgXvgXwFIH
 SaDMiAiuYBc4sDjr0R9UBbXKdukjoDYRGvABwgk03aMqn0bRuTnwrwZNid7zSiHpKspfjpg34LZnE
 AMO7M=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWP-0004TW-6u; Tue, 01 Oct 2019 11:40:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A8EC22742A30; Tue,  1 Oct 2019 12:40:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e6ef7m1.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114048.A8EC22742A30@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:48 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: tidyup soc_new_pcm_runtime()
	alloc order" to the asoc tree
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

   ASoC: soc-core: tidyup soc_new_pcm_runtime() alloc order

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

From d918a37610b1bf71faa86f589bd7604f71c1e05f Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 12 Sep 2019 13:42:30 +0900
Subject: [PATCH] ASoC: soc-core: tidyup soc_new_pcm_runtime() alloc order

This patch allocs dev first at soc_new_pcm_runtime().
This is prepare for rtd->dev, rtd->codec_dais alloc cleanup

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/877e6ef7m1.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 55 ++++++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8a37850291bd..b72207412c73 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -125,6 +125,9 @@ static umode_t soc_dev_attr_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct snd_soc_pcm_runtime *rtd = dev_get_drvdata(dev);
 
+	if (!rtd)
+		return 0;
+
 	if (attr == &dev_attr_pmdown_time.attr)
 		return attr->mode; /* always visible */
 	return rtd->num_codecs ? attr->mode : 0; /* enabled only with codec */
@@ -374,9 +377,13 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 	 * we don't need to call kfree() for rtd->dev
 	 * see
 	 *	soc_release_rtd_dev()
+	 *
+	 * We don't need rtd->dev NULL check, because
+	 * it is alloced *before* rtd.
+	 * see
+	 *	soc_new_pcm_runtime()
 	 */
-	if (rtd->dev)
-		device_unregister(rtd->dev);
+	device_unregister(rtd->dev);
 	kfree(rtd);
 }
 
@@ -384,8 +391,28 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	struct device *dev;
 	int ret;
 
+	/*
+	 * for rtd->dev
+	 */
+	dev = kzalloc(sizeof(struct device), GFP_KERNEL);
+	if (!dev)
+		return NULL;
+
+	dev->parent	= card->dev;
+	dev->release	= soc_release_rtd_dev;
+	dev->groups	= soc_dev_attr_groups;
+
+	dev_set_name(dev, "%s", dai_link->name);
+
+	ret = device_register(dev);
+	if (ret < 0) {
+		put_device(dev); /* soc_release_rtd_dev */
+		return NULL;
+	}
+
 	/*
 	 * for rtd
 	 */
@@ -393,6 +420,9 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	if (!rtd)
 		goto free_rtd;
 
+	rtd->dev = dev;
+	dev_set_drvdata(dev, rtd);
+
 	/*
 	 * for rtd->codec_dais
 	 */
@@ -402,27 +432,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	if (!rtd->codec_dais)
 		goto free_rtd;
 
-	/*
-	 * for rtd->dev
-	 */
-	rtd->dev = kzalloc(sizeof(struct device), GFP_KERNEL);
-	if (!rtd->dev)
-		goto free_rtd;
-
-	rtd->dev->parent = card->dev;
-	rtd->dev->release = soc_release_rtd_dev;
-	rtd->dev->groups = soc_dev_attr_groups;
-
-	dev_set_name(rtd->dev, "%s", dai_link->name);
-	dev_set_drvdata(rtd->dev, rtd);
-
-	ret = device_register(rtd->dev);
-	if (ret < 0) {
-		put_device(rtd->dev); /* soc_release_rtd_dev */
-		rtd->dev = NULL;
-		goto free_rtd;
-	}
-
 	/*
 	 * rtd remaining settings
 	 */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
