Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5398F5A1B7
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 19:03:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8D6716AB;
	Fri, 28 Jun 2019 19:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8D6716AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561741409;
	bh=vvVRdof0V92KXOIQ9YQoUgtBtz0YceaZKflm3WGsmkg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QxR03Qco+pra+4grfHRie8nhfRQWp6BeqKttJMdpEYV9viPzh/gBpZjvmzqh/kjoS
	 FSKl9MuGcTxBV0Hu7SMLJxancchfXqLg9FTl6E7pD1ArqzhKTrfJGgp8fEPDrdutjN
	 FgRb7JARcJh4Hw+PIQvzeCCZsLU/egZxLcqy87KE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 775D6F89743;
	Fri, 28 Jun 2019 18:57:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B10EEF89760; Fri, 28 Jun 2019 18:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E8C6F89701
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E8C6F89701
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="T5/8UHpO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=CIhcwXBy+cg2TufJFv1wAc2iFepZFiXhzVgi7vUaOBo=; b=T5/8UHpO1qb7
 7S/EmSQV6LtD0kz03Z5j8VWNZZ42hSnby20tslZWBSgyipVWVJuTEW/+DVeIS2yH6/0YqwI0O0kRY
 Q93m3T+YkuFSFkzWSbA9chh37fffsr1hOji4tzqrp8VQJLJgoqdwxtwBtLUwKOYG3rVlbL8J6Rs26
 KjCwg=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAi-00077i-L5; Fri, 28 Jun 2019 16:56:24 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D8133440054; Fri, 28 Jun 2019 17:56:23 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r27etrao.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165623.D8133440054@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:23 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: ti: omap-abe-twl6040: consider
	CPU-Platform possibility" to the asoc tree
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

   ASoC: ti: omap-abe-twl6040: consider CPU-Platform possibility

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From b407a17a14475eea74e66ae6b531390ac0ea011c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Jun 2019 10:49:22 +0900
Subject: [PATCH] ASoC: ti: omap-abe-twl6040: consider CPU-Platform possibility

commit 1306ab2eddd1 ("ASoC: ti: omap-abe-twl6040: don't select unnecessary
Platform")

Current ALSA SoC avoid to add duplicate component to rtd,
and this driver was selecting CPU component as Platform component.
Thus, above patch removed Platform settings from this driver,
because it assumed these are same component.

But, some CPU driver is using generic DMAEngine, in such case, both
CPU component and Platform component will have same of_node/name.
In other words, there are some components which are different but
have same of_node/name.

In such case, Card driver definitely need to select Platform even
though it is same as CPU.
It is depends on CPU driver, but is difficult to know it from Card driver.
This patch reverts above patch.

Fixes: commit 1306ab2eddd1 ("ASoC: ti: omap-abe-twl6040: don't select unnecessary Platform")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/omap-abe-twl6040.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 5572f5a8de9f..6d564ab5e437 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -21,17 +21,17 @@
 #include "omap-mcpdm.h"
 #include "../codecs/twl6040.h"
 
-SND_SOC_DAILINK_DEF(link0_cpus,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-SND_SOC_DAILINK_DEF(link0_codecs,
+SND_SOC_DAILINK_DEFS(link0,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC("twl6040-codec",
-				      "twl6040-legacy")));
-
-SND_SOC_DAILINK_DEF(link1_cpus,
+				      "twl6040-legacy")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-SND_SOC_DAILINK_DEF(link1_codecs,
+
+SND_SOC_DAILINK_DEFS(link1,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec",
-				      "dmic-hifi")));
+				      "dmic-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 struct abe_twl6040 {
 	struct snd_soc_card card;
@@ -256,6 +256,9 @@ static int omap_abe_probe(struct platform_device *pdev)
 	priv->dai_links[0].cpus = link0_cpus;
 	priv->dai_links[0].num_cpus = 1;
 	priv->dai_links[0].cpus->of_node = dai_node;
+	priv->dai_links[0].platforms = link0_platforms;
+	priv->dai_links[0].num_platforms = 1;
+	priv->dai_links[0].platforms->of_node = dai_node;
 	priv->dai_links[0].codecs = link0_codecs;
 	priv->dai_links[0].num_codecs = 1;
 	priv->dai_links[0].init = omap_abe_twl6040_init;
@@ -269,6 +272,9 @@ static int omap_abe_probe(struct platform_device *pdev)
 		priv->dai_links[1].cpus = link1_cpus;
 		priv->dai_links[1].num_cpus = 1;
 		priv->dai_links[1].cpus->of_node = dai_node;
+		priv->dai_links[1].platforms = link1_platforms;
+		priv->dai_links[1].num_platforms = 1;
+		priv->dai_links[1].platforms->of_node = dai_node;
 		priv->dai_links[1].codecs = link1_codecs;
 		priv->dai_links[1].num_codecs = 1;
 		priv->dai_links[1].init = omap_abe_dmic_init;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
