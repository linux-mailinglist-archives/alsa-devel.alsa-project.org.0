Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C46011B67F
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 14:55:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5714216E0;
	Mon, 13 May 2019 14:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5714216E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557752107;
	bh=b+4LgiqCVGH13jws2Ej4C/Gv2xHBxnPRepwCP4E/4dA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UfMztFjqTl7kEIeBGmdgsjg1XLTXmcZm9Vo4J7zwXR383j4nrZZcJjbJNDS9mZKpK
	 zwSiyL9D3Mf69W9kGadVWJlooFtXsM6h+3DFiSQ7HnMCnQnUFQQkpWGMb6LnWgO3W0
	 Uc+LrV5GGy6fzYUkGTOju3Kbj8EuWrgg5a3zVfOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 671C4F8961A;
	Mon, 13 May 2019 14:53:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7BFFF89684; Mon, 13 May 2019 14:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D181EF896B8
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 14:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D181EF896B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="A/DKG18v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=rpIth2eangk9lMTHj0LAi/8dL2k1Zh3S2qAV6N4T1EQ=; b=A/DKG18vIVxB
 DOnsAU/RmgqOfZSA0Nw2WsIRSWPv6uFDb+uv/N/7GNw8Xebh1SqK7TwC6VAxfivhwnNRlitOYFPVa
 TCRSa30UGTs7BBBa0s6nEN8H8RGlUb7NrqMIe4js0il0594W+2ibyYeXfUmybkW6t8RAHIWyYomLT
 wXtQI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hQA68-0006Wf-OA; Mon, 13 May 2019 12:30:28 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 208EB1129237; Mon, 13 May 2019 13:30:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r292alro.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190513123027.208EB1129237@debutante.sirena.org.uk>
Date: Mon, 13 May 2019 13:30:27 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: use soc_find_component() at
	snd_soc_get_dai_id()" to the asoc tree
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

   ASoC: soc-core: use soc_find_component() at snd_soc_get_dai_id()

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

From 09d4cc03ff77790872b8b9e51b6d7b5863686fc5 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 13 May 2019 16:07:20 +0900
Subject: [PATCH] ASoC: soc-core: use soc_find_component() at
 snd_soc_get_dai_id()

soc-core core already has soc_find_component() which find
component from device node.
Let's use existing function to find component.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e55170ce6d3e..e83edbe27041 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3751,7 +3751,7 @@ EXPORT_SYMBOL_GPL(snd_soc_of_parse_daifmt);
 
 int snd_soc_get_dai_id(struct device_node *ep)
 {
-	struct snd_soc_component *pos;
+	struct snd_soc_component *component;
 	struct device_node *node;
 	int ret;
 
@@ -3765,17 +3765,10 @@ int snd_soc_get_dai_id(struct device_node *ep)
 	 */
 	ret = -ENOTSUPP;
 	mutex_lock(&client_mutex);
-	for_each_component(pos) {
-		struct device_node *component_of_node = soc_component_to_node(pos);
-
-		if (component_of_node != node)
-			continue;
-
-		if (pos->driver->of_xlate_dai_id)
-			ret = pos->driver->of_xlate_dai_id(pos, ep);
-
-		break;
-	}
+	component = soc_find_component(node, NULL);
+	if (component &&
+	    component->driver->of_xlate_dai_id)
+		ret = component->driver->of_xlate_dai_id(component, ep);
 	mutex_unlock(&client_mutex);
 
 	of_node_put(node);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
