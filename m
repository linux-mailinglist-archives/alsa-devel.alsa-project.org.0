Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 983CD528BA
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 11:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05F7584C;
	Tue, 25 Jun 2019 11:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05F7584C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561456591;
	bh=t1T9raw/NBbO/jLuiYVXn1k4269I5m9f+49Qt+ov4Uw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pC8tDoOrZniOCjMeP10AUlcVQJoxAZurpavr6JMmjIf9zkyQngFmviopKJjHgcJEy
	 SViDfYtnEQG/+qVqJzkdT4o7m6yen3am0TVefwTj96gOv55sIVjgJ6DiGQJKP0uNGS
	 9Npq48ryPuT2v+fhHXUjzHtOzfcnVgPFCQP33wok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EDA9F896FC;
	Tue, 25 Jun 2019 11:54:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9A32F89719; Tue, 25 Jun 2019 11:54:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_12_24, DKIM_SIGNED,
 DKIM_VALID, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBD61F8071F
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 11:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBD61F8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="hFml1vld"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=9bSTlhnSEWW7vvF9B458f8kkczjbnoENYj+h47M8AJU=; b=hFml1vldvbYi
 YbubEEx7EdxSVpqyv7qFLDKQn1e5CowfNGeAE110+k0PhucpU6+h0ADXNI9sebJCpRKIShzxBtH3i
 i2CnVpvY6s+UHByGLgN3aSmKfAmw9c7EBNx4PO8UkiYCWapcljacjL2WgXZqgPaXwX4CGkIyz39Uc
 uUJAo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hfi9E-0004mO-Vl; Tue, 25 Jun 2019 09:53:57 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 0EB9B440053; Mon, 24 Jun 2019 17:32:14 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgs5rsl2.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190624163214.0EB9B440053@finisterre.sirena.org.uk>
Date: Mon, 24 Jun 2019 17:32:14 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: move soc_find_component()" to
	the asoc tree
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

   ASoC: soc-core: move soc_find_component()

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

From 7d7db5d3c3d849c2f877be3b4c9afa7f5b5257c2 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 20 Jun 2019 09:49:17 +0900
Subject: [PATCH] ASoC: soc-core: move soc_find_component()

move soc_find_component() next to snd_soc_is_matching_component().
This is prepare for soc_find_component() cleanup

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4cd77cd6c864..1b94119cfb0d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -760,6 +760,25 @@ static struct device_node
 	return of_node;
 }
 
+static int snd_soc_is_matching_component(
+	const struct snd_soc_dai_link_component *dlc,
+	struct snd_soc_component *component)
+{
+	struct device_node *component_of_node;
+
+	if (!dlc)
+		return 0;
+
+	component_of_node = soc_component_to_node(component);
+
+	if (dlc->of_node && component_of_node != dlc->of_node)
+		return 0;
+	if (dlc->name && strcmp(component->name, dlc->name))
+		return 0;
+
+	return 1;
+}
+
 static struct snd_soc_component *soc_find_component(
 	const struct device_node *of_node, const char *name)
 {
@@ -782,25 +801,6 @@ static struct snd_soc_component *soc_find_component(
 	return NULL;
 }
 
-static int snd_soc_is_matching_component(
-	const struct snd_soc_dai_link_component *dlc,
-	struct snd_soc_component *component)
-{
-	struct device_node *component_of_node;
-
-	if (!dlc)
-		return 0;
-
-	component_of_node = soc_component_to_node(component);
-
-	if (dlc->of_node && component_of_node != dlc->of_node)
-		return 0;
-	if (dlc->name && strcmp(component->name, dlc->name))
-		return 0;
-
-	return 1;
-}
-
 /**
  * snd_soc_find_dai - Find a registered DAI
  *
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
