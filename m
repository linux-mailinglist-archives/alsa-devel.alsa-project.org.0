Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 976CFF0AC2
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 00:59:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D2116F4;
	Wed,  6 Nov 2019 00:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D2116F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998361;
	bh=78j9NhoBHP9LMn1IZjpqFlUqD/sPJiAfeXbOdPm8P0E=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=b6o8QGCIArq+Iua4QA04W9893bbPwvLcgvIQ0oL9GwiaetMjTwsGjXT2Chrqpi/F1
	 bQRfCwRlxqRoxgEC2fwBiKaN2/wbHUxA90sujbbLZ7j0BNSnYd+vG8CfMvY8I8q923
	 a1AWMrvqMjyqBscV+iLg7b7lWs3Ixl6eeXiagJlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38BBBF806F0;
	Wed,  6 Nov 2019 00:51:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB282F8063D; Wed,  6 Nov 2019 00:51:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4235FF805FB
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4235FF805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J7XInWqr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=QF1YWajDeQG7Vb/u+TZ9wXKdhAWXFvMiNA39Bi1MV2w=; b=J7XInWqrX0Qb
 HVs0lJpplZK9pDGTQ8kPkPzlc0yPGT4041aluZxAVIJ/x3XaT6PW9VDXFP3OHLUZHy1dTtmlyLdXR
 /MZ2p4pRKfEPe1uzZYZmBtckegZBSdsnFziFs6Z9Jdgm1JSDy6QCUUGBxFH3iBIpRVoB309t3xgov
 J1nDk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8ba-00081V-H6; Tue, 05 Nov 2019 23:51:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id EFA0F2741915; Tue,  5 Nov 2019 23:51:21 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhha252c.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235121.EFA0F2741915@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:21 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: use
	snd_soc_lookup_component() at snd_soc_unregister_component()"
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

   ASoC: soc-core: use snd_soc_lookup_component() at snd_soc_unregister_component()

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

From ac6a4dd3e9f09697ab6a1774d7ab6a34e7ab36fa Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:46:51 +0900
Subject: [PATCH] ASoC: soc-core: use snd_soc_lookup_component() at
 snd_soc_unregister_component()

snd_soc_unregister_component() is now finding component manually,
but we already have snd_soc_lookup_component() to find component;
Let's use existing function.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87zhha252c.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index bb0592159414..0ce333669138 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2876,29 +2876,19 @@ EXPORT_SYMBOL_GPL(snd_soc_register_component);
  *
  * @dev: The device to unregister
  */
-static int __snd_soc_unregister_component(struct device *dev)
+void snd_soc_unregister_component(struct device *dev)
 {
 	struct snd_soc_component *component;
-	int found = 0;
 
 	mutex_lock(&client_mutex);
-	for_each_component(component) {
-		if (dev != component->dev)
-			continue;
+	while (1) {
+		component = snd_soc_lookup_component(dev, NULL);
+		if (!component)
+			break;
 
 		snd_soc_del_component_unlocked(component);
-		found = 1;
-		break;
 	}
 	mutex_unlock(&client_mutex);
-
-	return found;
-}
-
-void snd_soc_unregister_component(struct device *dev)
-{
-	while (__snd_soc_unregister_component(dev))
-		;
 }
 EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
