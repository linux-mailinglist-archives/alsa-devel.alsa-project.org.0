Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E46F1528B4
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 11:55:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED9C15E5;
	Tue, 25 Jun 2019 11:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED9C15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561456548;
	bh=cvH5lOS+QlyQD3X6cEYNgTdcQRCWhGk6tn5UcZ14h3w=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GIFJQg6HC+LUH1dxriWAVlBlz08+MYyu7luX0zbWzm66CxSIHzUzplA9iU644Qwmn
	 ydD2ftJGAZuMefkHF8HxCabQUhPZrXZ7AXJ6nVGpfsaM20No4sKSM0UEby7hFrmTP/
	 V3fjm7330I25WiPEJoyeS2Vm6SHRJVLdCCD/IgHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6DB8F8972F;
	Tue, 25 Jun 2019 11:54:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E321DF89719; Tue, 25 Jun 2019 11:54:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_12_24, DKIM_SIGNED,
 DKIM_VALID, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5274DF896EA
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 11:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5274DF896EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ISwX+Yc8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=kkZLrhbSfJ6MMU/zkByIceFwRkzWAhCCuq+/VD34SbI=; b=ISwX+Yc8WUeQ
 BoqDSIriGrPyY7zFU2u7hQ1EfUnsIw13JEkLDClDvgSOBd6X1PCA67OueXu8v99pZd3HuKu5D+jjd
 snKK+AqsrFSd6GmloiYqU02E/M15B4Ut9E9uDlS/Vp9YTPVrhR4i8NZaevy9EJo0rPNwN9FS9KpFi
 nSVlA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hfi9E-0004mP-W9; Tue, 25 Jun 2019 09:53:57 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id A70C9440041; Mon, 24 Jun 2019 17:32:13 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o92trskm.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190624163213.A70C9440041@finisterre.sirena.org.uk>
Date: Mon, 24 Jun 2019 17:32:13 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: use soc_find_component() at
	snd_soc_find_dai()" to the asoc tree
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

   ASoC: soc-core: use soc_find_component() at snd_soc_find_dai()

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

From b9f2e25c599bbbf0646957e07ebb72b942c286cc Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 20 Jun 2019 09:49:33 +0900
Subject: [PATCH] ASoC: soc-core: use soc_find_component() at
 snd_soc_find_dai()

snd_soc_find_dai() finds component first via specified
snd_soc_dai_link_component, and find DAI from it.

We already have soc_find_component() to find component,
but soc_find_dai() has original implementation to find component.

We shouldn't have duplicate implementation to do same things.
This patch uses soc_find_component() at soc_find_dai()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1749f4af91b6..358f1fbf9a30 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -813,9 +813,8 @@ struct snd_soc_dai *snd_soc_find_dai(
 	lockdep_assert_held(&client_mutex);
 
 	/* Find CPU DAI from registered DAIs */
-	for_each_component(component) {
-		if (!snd_soc_is_matching_component(dlc, component))
-			continue;
+	component = soc_find_component(dlc);
+	if (component) {
 		for_each_component_dais(component, dai) {
 			if (dlc->dai_name && strcmp(dai->name, dlc->dai_name)
 			    && (!dai->driver->name
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
