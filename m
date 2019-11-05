Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FCFF0AB7
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 00:58:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ECA616CF;
	Wed,  6 Nov 2019 00:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ECA616CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998289;
	bh=RrzBicuLis31gcmtEKMWC0wm8nk832PY8chSk8Thp1w=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ILvh7oVIN7WILa0YrxCBfDOT4dLKf7zDzk3fPfrB+qM0hXGnvO2HUz9ESFOAov9o6
	 c1LOVIWa0j2KjgIvYx3NUfx4LNfzYDpuChZETTu3O2ZzfzNOkD0BRJUkY94FRNSWGd
	 yTOAnZQ9nraC1I/mwFu+03joJc/+qh/xKX0N2gjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1978F80679;
	Wed,  6 Nov 2019 00:51:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 500FAF8064C; Wed,  6 Nov 2019 00:51:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41847F805E0
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41847F805E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WugItoyx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=W2ZE0CEzfQ/bIGyjkoeeQAp7nPvEM5cnLSQjq/p98Ag=; b=WugItoyxvj4d
 zMfKFU7qX+fUnbwTzA7qzoL7Tql22EckOHeUapSqxVKDxO2HiAiWlffmicU54QnhzM1IBA0il4GQ2
 G4EogNm6ivgAlH/dT//zawT2dYl5SYYKcyL+KsvnyahxZMmERy1En+jKDr1wcrBjO9W0zbirnuMGV
 CtUeU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8bZ-00081D-Vv; Tue, 05 Nov 2019 23:51:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 81419274301E; Tue,  5 Nov 2019 23:51:21 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87woce2524.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235121.81419274301E@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:21 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: move
	snd_soc_unregister_dais()" to the asoc tree
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

   ASoC: soc-core: move snd_soc_unregister_dais()

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

From 3f6674ae13a1e498f249b0255659bfc4f692a7e0 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:47:00 +0900
Subject: [PATCH] ASoC: soc-core: move snd_soc_unregister_dais()

This patch moves snd_soc_unregister_dais() next to
snd_soc_register_dais().
This is prepare for snd_soc_register_dais() cleanup

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87woce2524.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index fb5f01497498..c803447fe639 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2532,22 +2532,6 @@ static inline char *fmt_multiple_name(struct device *dev,
 	return devm_kstrdup(dev, dai_drv->name, GFP_KERNEL);
 }
 
-/**
- * snd_soc_unregister_dai - Unregister DAIs from the ASoC core
- *
- * @component: The component for which the DAIs should be unregistered
- */
-static void snd_soc_unregister_dais(struct snd_soc_component *component)
-{
-	struct snd_soc_dai *dai, *_dai;
-
-	for_each_component_dais_safe(component, dai, _dai) {
-		dev_dbg(component->dev, "ASoC: Unregistered DAI '%s'\n",
-			dai->name);
-		list_del(&dai->list);
-	}
-}
-
 /* Create a DAI and add it to the component's DAI list */
 static struct snd_soc_dai *soc_add_dai(struct snd_soc_component *component,
 	struct snd_soc_dai_driver *dai_drv,
@@ -2640,6 +2624,22 @@ int snd_soc_register_dai(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_dai);
 
+/**
+ * snd_soc_unregister_dai - Unregister DAIs from the ASoC core
+ *
+ * @component: The component for which the DAIs should be unregistered
+ */
+static void snd_soc_unregister_dais(struct snd_soc_component *component)
+{
+	struct snd_soc_dai *dai, *_dai;
+
+	for_each_component_dais_safe(component, dai, _dai) {
+		dev_dbg(component->dev, "ASoC: Unregistered DAI '%s'\n",
+			dai->name);
+		list_del(&dai->list);
+	}
+}
+
 /**
  * snd_soc_register_dais - Register a DAI with the ASoC core
  *
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
