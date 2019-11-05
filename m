Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF54DF0AAE
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 00:57:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57ECB16F2;
	Wed,  6 Nov 2019 00:56:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57ECB16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998240;
	bh=xcIbSBixlQeMNW6sC1utruVSRD1ThxzKufnayjWLMJY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=W299YszunRSHxC2IxSYXy0fna+6J8kUo+lLQmrm7sGVL+GfKyEjyZOqlEw0zj85U1
	 LzN2q1Xr26BK+SVxFTNax9M39mgLg5Kf1EvAZL/FBHfi2CKaO8xRP9uBcg2f8Dr3tX
	 Pq+N+mJLHZvFrnZhSIsvuQUN622R8xOpozNL6M2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDFD4F80671;
	Wed,  6 Nov 2019 00:51:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCD4FF805DF; Wed,  6 Nov 2019 00:51:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD1D0F8015B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD1D0F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZUpquRJu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=G2pZVd/LKtB0qquPqayYc6CWcyCt+/GLzy7Jrs602cI=; b=ZUpquRJuKe0e
 kCMYU/Pmpwxp1lvwbg3QFHokb1Ram9lYzF/SVLMrYkR7upDs/yJs22Iv7yc/KM7vOuGIkzZVZboOg
 GA8fGNhu8bqhV0wWH/39XDqyYDT7wo+f8cgWKG/J3OuNgjBt8FJqxcZn5FQYLGd49zHwrc4a8SlIw
 sDUC4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8bZ-00080z-4z; Tue, 05 Nov 2019 23:51:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5DAAD2741915; Tue,  5 Nov 2019 23:51:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pni6251h.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235120.5DAAD2741915@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:20 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove topology specific
	operation" to the asoc tree
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

   ASoC: soc-core: remove topology specific operation

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

From 237d19080cd37e1ccf5462e63d8577d713f6da46 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:47:22 +0900
Subject: [PATCH] ASoC: soc-core: remove topology specific operation

soc-core has some API which is used from topology, but it is doing
topology specific operation at soc-core.
soc-core should care about core things, and topology should care
about topology things, otherwise, it is very confusable.

For example topology type is not related to soc-core,
it is topology side issue.

This patch removes meaningless check from soc-core.

This patch keeps extra initialization/destruction at
snd_soc_add_dai_link() / snd_soc_remove_dai_link()
which were for topology.
From this patch, non-topology card can use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87pni6251h.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 86c45f751598..cc596871ba7f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1436,19 +1436,12 @@ int snd_soc_add_dai_link(struct snd_soc_card *card,
 {
 	int ret;
 
-	if (dai_link->dobj.type
-	    && dai_link->dobj.type != SND_SOC_DOBJ_DAI_LINK) {
-		dev_err(card->dev, "Invalid dai link type %d\n",
-			dai_link->dobj.type);
-		return -EINVAL;
-	}
-
 	lockdep_assert_held(&client_mutex);
+
 	/*
 	 * Notify the machine driver for extra initialization
-	 * on the link created by topology.
 	 */
-	if (dai_link->dobj.type && card->add_dai_link)
+	if (card->add_dai_link)
 		card->add_dai_link(card, dai_link);
 
 	ret = soc_bind_dai_link(card, dai_link);
@@ -1475,19 +1468,12 @@ EXPORT_SYMBOL_GPL(snd_soc_add_dai_link);
 void snd_soc_remove_dai_link(struct snd_soc_card *card,
 			     struct snd_soc_dai_link *dai_link)
 {
-	if (dai_link->dobj.type
-	    && dai_link->dobj.type != SND_SOC_DOBJ_DAI_LINK) {
-		dev_err(card->dev, "Invalid dai link type %d\n",
-			dai_link->dobj.type);
-		return;
-	}
-
 	lockdep_assert_held(&client_mutex);
+
 	/*
 	 * Notify the machine driver for extra destruction
-	 * on the link created by topology.
 	 */
-	if (dai_link->dobj.type && card->remove_dai_link)
+	if (card->remove_dai_link)
 		card->remove_dai_link(card, dai_link);
 
 	list_del(&dai_link->list);
@@ -2609,12 +2595,6 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 {
 	struct device *dev = component->dev;
 
-	if (dai_drv->dobj.type &&
-	    dai_drv->dobj.type != SND_SOC_DOBJ_PCM) {
-		dev_err(dev, "Invalid dai type %d\n", dai_drv->dobj.type);
-		return NULL;
-	}
-
 	dev_dbg(dev, "ASoC: dai register %s\n", dai_drv->name);
 
 	lockdep_assert_held(&client_mutex);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
