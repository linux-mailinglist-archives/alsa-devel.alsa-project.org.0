Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 168E2F0A7F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 00:55:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9413816F4;
	Wed,  6 Nov 2019 00:54:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9413816F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998149;
	bh=U8PU1mLIUPaMAIF2QVKVTN3J5TcCazUOatYgO9A4isk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=r9VK0HAN+/MKnx6g0BnUqxZuXqhKd1TcRyu6QCVPG5ydb0h+hWzRignT7qdan6GHy
	 GatuW26Fz+vkqRhmMsMq/fLu+AQya13+7kLdDvRp0DfKvx3nYSGaqPZ8oIEGkXBjFB
	 0Z6cBVuadcpczfv9yHf0FMfnGRKc9unzZZxsnBgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20401F8064C;
	Wed,  6 Nov 2019 00:51:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AFF1F8049B; Wed,  6 Nov 2019 00:51:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7147F805AE
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7147F805AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TNCcO8AH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=CrMlxbGON5halrNm85vT7kmquFrVCVIm12JgH7iNtHA=; b=TNCcO8AHtSHy
 LV9x29qDI0jml+JKhHq/sGmxnrFkKBZUQN8k0BVxmQgXXBoH9/LA+V8Li/gXbqggPeb7XRSOMwLLY
 Fsz73UTwJOCzVREVBP+YNSDoZ68KoEfi0x2QYsCMPnilgXiOks7teAW7Xomp4ytznN0tvuAJxHxVn
 UucrQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8bZ-000819-QG; Tue, 05 Nov 2019 23:51:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 480B22741915; Tue,  5 Nov 2019 23:51:21 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v9ry251z.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235121.480B22741915@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:21 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: add snd_soc_unregister_dai()"
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

   ASoC: soc-core: add snd_soc_unregister_dai()

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

From e11381f38f34789b374880c4a149e25e8d7f0cfd Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:47:04 +0900
Subject: [PATCH] ASoC: soc-core: add snd_soc_unregister_dai()

It is easy to read code if it is cleanly using paired function/naming,
like start <-> stop, register <-> unregister, etc, etc.
But, current ALSA SoC code is very random, unbalance, not paired, etc.
It is easy to create bug at the such code, and is difficult to debug.

This patch adds missing soc_del_dai() and snd_soc_unregister_dai().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87v9ry251z.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 19 ++++++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 320dcd440dab..daa0e100ecd9 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1328,6 +1328,7 @@ struct snd_soc_dai_link *snd_soc_find_dai_link(struct snd_soc_card *card,
 
 int snd_soc_register_dai(struct snd_soc_component *component,
 	struct snd_soc_dai_driver *dai_drv);
+void snd_soc_unregister_dai(struct snd_soc_dai *dai);
 
 struct snd_soc_dai *snd_soc_find_dai(
 	const struct snd_soc_dai_link_component *dlc);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c803447fe639..38199cd7ce97 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2532,6 +2532,12 @@ static inline char *fmt_multiple_name(struct device *dev,
 	return devm_kstrdup(dev, dai_drv->name, GFP_KERNEL);
 }
 
+static void soc_del_dai(struct snd_soc_dai *dai)
+{
+	dev_dbg(dai->dev, "ASoC: Unregistered DAI '%s'\n", dai->name);
+	list_del(&dai->list);
+}
+
 /* Create a DAI and add it to the component's DAI list */
 static struct snd_soc_dai *soc_add_dai(struct snd_soc_component *component,
 	struct snd_soc_dai_driver *dai_drv,
@@ -2581,6 +2587,12 @@ static struct snd_soc_dai *soc_add_dai(struct snd_soc_component *component,
 	return dai;
 }
 
+void snd_soc_unregister_dai(struct snd_soc_dai *dai)
+{
+	soc_del_dai(dai);
+}
+EXPORT_SYMBOL_GPL(snd_soc_unregister_dai);
+
 /**
  * snd_soc_register_dai - Register a DAI dynamically & create its widgets
  *
@@ -2633,11 +2645,8 @@ static void snd_soc_unregister_dais(struct snd_soc_component *component)
 {
 	struct snd_soc_dai *dai, *_dai;
 
-	for_each_component_dais_safe(component, dai, _dai) {
-		dev_dbg(component->dev, "ASoC: Unregistered DAI '%s'\n",
-			dai->name);
-		list_del(&dai->list);
-	}
+	for_each_component_dais_safe(component, dai, _dai)
+		snd_soc_unregister_dai(dai);
 }
 
 /**
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
