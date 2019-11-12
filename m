Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06046F9916
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 19:50:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86C38166E;
	Tue, 12 Nov 2019 19:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86C38166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573584601;
	bh=rKBIZFeq5/Q7ajEPfAdDtu1fKjOG4G0U9a0fYMIuUNM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lhMnhZp0dqa6fCqlTmCM+BiY3H20vegBUVxUmChb/zcaNvF2beWRG8uB69Kqe2Lx+
	 svPxJMz8FAYZImPDLLASKbkcRHXN8akAhUUApNJ4ZaFuxzDq7CXGy/XnfrAduLjnm4
	 mzTW4uxGe+9q9QAk4/PVExpYzbYRQNm9axk6nrIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A76A9F80507;
	Tue, 12 Nov 2019 19:47:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1D9BF8060D; Tue, 12 Nov 2019 19:47:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86947F80483
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 19:47:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86947F80483
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="oLP8z7P9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Xxj0TRzkG9XdgLF0n3+bDsOFxNm2L8h0FgQnFZf9Bn4=; b=oLP8z7P9gfJ7
 zE+JB/PYXuCCLBU3esGxMe74z4DLNHkNzVa3DVcjigVpQy1S/fGrraHknO/iOWLJOeP7uwGD+SfvL
 lKj8xBM43lwEye1Va0oHmvYP7h3vfb8OR/50YwzgA24P95f87xhUigeJ4m2nJKOLlheGRrelga9TE
 QKVjo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUbC4-00004s-9R; Tue, 12 Nov 2019 18:47:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C8DDF274299F; Tue, 12 Nov 2019 18:47:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8xphkwt.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112184711.C8DDF274299F@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 18:47:11 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: merge soc_remove_component()
	and soc_cleanup_component()" to the asoc tree
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

   ASoC: soc-core: merge soc_remove_component() and soc_cleanup_component()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From c6619b729814c855fc7bfa5a6936f5ea94d60dfd Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 6 Nov 2019 10:07:46 +0900
Subject: [PATCH] ASoC: soc-core: merge soc_remove_component() and
 soc_cleanup_component()

having both soc_remove_component() and soc_cleanup_component() is
very confusable. Let's merge these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87o8xphkwt.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index d80d485f46d1..11cbd7915154 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1201,8 +1201,16 @@ static void soc_set_name_prefix(struct snd_soc_card *card,
 	soc_set_of_name_prefix(component);
 }
 
-static void soc_cleanup_component(struct snd_soc_component *component)
+static void soc_remove_component(struct snd_soc_component *component,
+				 int probed)
 {
+
+	if (!component->card)
+		return;
+
+	if (probed)
+		snd_soc_component_remove(component);
+
 	/* For framework level robustness */
 	snd_soc_component_set_jack(component, NULL, NULL);
 
@@ -1213,22 +1221,13 @@ static void soc_cleanup_component(struct snd_soc_component *component)
 	snd_soc_component_module_put_when_remove(component);
 }
 
-static void soc_remove_component(struct snd_soc_component *component)
-{
-	if (!component->card)
-		return;
-
-	snd_soc_component_remove(component);
-
-	soc_cleanup_component(component);
-}
-
 static int soc_probe_component(struct snd_soc_card *card,
 			       struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
 	struct snd_soc_dai *dai;
+	int probed = 0;
 	int ret;
 
 	if (!strcmp(component->name, "snd-soc-dummy"))
@@ -1284,6 +1283,7 @@ static int soc_probe_component(struct snd_soc_card *card,
 	     dapm->bias_level != SND_SOC_BIAS_OFF,
 	     "codec %s can not start from non-off bias with idle_bias_off==1\n",
 	     component->name);
+	probed = 1;
 
 	/* machine specific init */
 	if (component->init) {
@@ -1312,7 +1312,7 @@ static int soc_probe_component(struct snd_soc_card *card,
 
 err_probe:
 	if (ret < 0)
-		soc_cleanup_component(component);
+		soc_remove_component(component, probed);
 
 	return ret;
 }
@@ -1414,7 +1414,7 @@ static void soc_remove_link_components(struct snd_soc_card *card)
 				if (component->driver->remove_order != order)
 					continue;
 
-				soc_remove_component(component);
+				soc_remove_component(component, 1);
 			}
 		}
 	}
@@ -1608,7 +1608,7 @@ static void soc_remove_aux_devices(struct snd_soc_card *card)
 	for_each_comp_order(order) {
 		for_each_card_auxs_safe(card, comp, _comp) {
 			if (comp->driver->remove_order == order)
-				soc_remove_component(comp);
+				soc_remove_component(comp, 1);
 		}
 	}
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
