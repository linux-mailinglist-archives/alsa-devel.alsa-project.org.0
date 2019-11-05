Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D43CAF0A7A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 00:53:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54B5216E2;
	Wed,  6 Nov 2019 00:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54B5216E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572997993;
	bh=1NXz0F4wpBzp8qVPWaaxd9x1wOMEdPH0TUbfzZp8Gh0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=AF/MM/FTpwqOINGThP4LL73F4tSKZtG+cVqOfM3MpdJdhcYV4di6H0ZIJuEk8eFzH
	 BZp5b4X34jTgTem9rF0QRIDDOlUWqyxgfDoFK1Rk6YSCZYsvKhk5o+MRTOKNcFNQxW
	 Jj6FQCupv2YZhuDf15nOq3zjqgWql1WbNugPqQZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60713F80634;
	Wed,  6 Nov 2019 00:51:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2D36F80635; Wed,  6 Nov 2019 00:51:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C25CBF800F3
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C25CBF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Qfghz5gR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ljo/VD1FnJ/8DMCjRzwDwSLRSLQ1vayLGtY9phVZTlU=; b=Qfghz5gRC+HV
 hBkNuR1RlyudsjFm2uBmMM0CWUdnIhl3va2f0ZRqurZN15Fvlp6UvcUQIf9C8V8zm75U+jx9JPFvi
 stkScleNGpAFKqbUhSie/3lVmJ81cWwkGuRTMETKMLCkg2U9gQIQ5XsqQrkdy1EoHSmwMHROgRsu5
 hxcGo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8bZ-00080y-4q; Tue, 05 Nov 2019 23:51:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 92C0E2743280; Tue,  5 Nov 2019 23:51:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r22m251l.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235120.92C0E2743280@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:20 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: call snd_soc_register_dai()
	from snd_soc_register_dais()" to the asoc tree
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

   ASoC: soc-core: call snd_soc_register_dai() from snd_soc_register_dais()

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

From 71cb85f5e9da4aa3ab62020389b513275121083d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:47:18 +0900
Subject: [PATCH] ASoC: soc-core: call snd_soc_register_dai() from
 snd_soc_register_dais()

ALSA SoC has 2 functions.
snd_soc_register_dai()  is used from topology
snd_soc_register_dais() is used from snd_soc_add_component()

In general, people think like _dai() is called from _dais()
with for loop. But in reality, these are very similar
but different implementation.
We shouldn't have duplicated and confusing implementation.

This patch calls snd_soc_register_dai() from snd_soc_register_dais()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87r22m251l.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 55b13c0037d2..86c45f751598 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2607,12 +2607,16 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 					 struct snd_soc_dai_driver *dai_drv,
 					 bool legacy_dai_naming)
 {
-	if (dai_drv->dobj.type != SND_SOC_DOBJ_PCM) {
-		dev_err(component->dev, "Invalid dai type %d\n",
-			dai_drv->dobj.type);
+	struct device *dev = component->dev;
+
+	if (dai_drv->dobj.type &&
+	    dai_drv->dobj.type != SND_SOC_DOBJ_PCM) {
+		dev_err(dev, "Invalid dai type %d\n", dai_drv->dobj.type);
 		return NULL;
 	}
 
+	dev_dbg(dev, "ASoC: dai register %s\n", dai_drv->name);
+
 	lockdep_assert_held(&client_mutex);
 	return soc_add_dai(component, dai_drv, legacy_dai_naming);
 }
@@ -2642,16 +2646,12 @@ static int snd_soc_register_dais(struct snd_soc_component *component,
 				 struct snd_soc_dai_driver *dai_drv,
 				 size_t count)
 {
-	struct device *dev = component->dev;
 	struct snd_soc_dai *dai;
 	unsigned int i;
 	int ret;
 
-	dev_dbg(dev, "ASoC: dai register %s #%zu\n", dev_name(dev), count);
-
 	for (i = 0; i < count; i++) {
-
-		dai = soc_add_dai(component, dai_drv + i, count == 1 &&
+		dai = snd_soc_register_dai(component, dai_drv + i, count == 1 &&
 				  !component->driver->non_legacy_dai_naming);
 		if (dai == NULL) {
 			ret = -ENOMEM;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
