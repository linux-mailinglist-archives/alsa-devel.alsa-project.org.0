Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DB8218C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:20:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB99B168B;
	Mon,  5 Aug 2019 18:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB99B168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565022041;
	bh=NpphfbQME73M3H9lWtRPgWDZc3PGjBVpsHjXVZ8JKMw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ugYg/kt0jNcwdKtNCL8PHMWMBQNLROiFjWli0uggrkNwEAHiDKE05LpGfDxfwpfTI
	 D11bxr5wzgxi0IOxccHmFpHh31c91Ekyfb9TaK5lQpAIC/Pz95ASyL0dIbmH78v7uR
	 nMe0jav9ThdjyBfWCZljfUbi+0uswfGNWiTywGM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A1C7F8071C;
	Mon,  5 Aug 2019 18:10:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D843F80642; Mon,  5 Aug 2019 18:10:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2771EF805DF
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2771EF805DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="gdMGXAo2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qvENZRK1XlOjVKwsmLx831LjYao7HOUAGoASrTdJgjU=; b=gdMGXAo2mG1a
 cPD/ofTnYUpeva+0wUQGEUMD7wZ3HH2G1aMEOlbCRMLQeC7ls1CwtZEsRAlCJ/um2e91mRPGex9jI
 jBbSxVDNzm0olWYCsFTe9268hAeET34DgmL4S8BeigZf1VSDXk81hpWZzzDLNGjj1GBW25C4nd5sy
 xnqoE=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYd-0000lC-M7; Mon, 05 Aug 2019 16:09:59 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1034C2742EB0; Mon,  5 Aug 2019 17:09:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736it5rlt.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805160959.1034C2742EB0@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:09:59 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_component_probe()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_component_probe()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 08e837dd9e39bd3e25b1fa1a13f6ba44040e3f0d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:51:17 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_component_probe()

Current ALSA SoC is directly using component->driver->xxx,
thus, it is deep nested, and makes code difficult to read,
and is not good for encapsulation.
This patch adds new snd_soc_component_probe() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/8736it5rlt.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  1 +
 sound/soc/soc-component.c     |  8 ++++++++
 sound/soc/soc-core.c          | 12 +++++-------
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 9600dc4ca6b4..34e774efcf69 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -356,5 +356,6 @@ int snd_soc_component_trigger(struct snd_soc_component *component,
 void snd_soc_component_suspend(struct snd_soc_component *component);
 void snd_soc_component_resume(struct snd_soc_component *component);
 int snd_soc_component_is_suspended(struct snd_soc_component *component);
+int snd_soc_component_probe(struct snd_soc_component *component);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 0a9ca84d7ac6..b2bfc0375193 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -366,3 +366,11 @@ int snd_soc_component_is_suspended(struct snd_soc_component *component)
 {
 	return component->suspended;
 }
+
+int snd_soc_component_probe(struct snd_soc_component *component)
+{
+	if (component->driver->probe)
+		return component->driver->probe(component);
+
+	return 0;
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ea93edd328a2..6a422ddae130 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1282,13 +1282,11 @@ static int soc_probe_component(struct snd_soc_card *card,
 		}
 	}
 
-	if (component->driver->probe) {
-		ret = component->driver->probe(component);
-		if (ret < 0) {
-			dev_err(component->dev,
-				"ASoC: failed to probe component %d\n", ret);
-			goto err_probe;
-		}
+	ret = snd_soc_component_probe(component);
+	if (ret < 0) {
+		dev_err(component->dev,
+			"ASoC: failed to probe component %d\n", ret);
+		goto err_probe;
 	}
 	WARN(dapm->idle_bias_off &&
 	     dapm->bias_level != SND_SOC_BIAS_OFF,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
