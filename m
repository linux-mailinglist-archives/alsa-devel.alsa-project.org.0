Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBBE5D032
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 15:09:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 881FE16A5;
	Tue,  2 Jul 2019 15:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 881FE16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562072949;
	bh=vfroZiqcqhh3zJQVu7j20miXrUXeMW01o+egDsZXS9k=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=G7RjV8Giujqs+ZWUOCrJhsahlKiIkPgFf3+Q31cI3YNr1buuNJGdBf8mk8LHb8JMv
	 I652HOQZGKbtlsLDGhBJ6zJ3YyLObSXx5gXEYuhbxh5/Qtqo6AT2jDpnQ8fFby6VN2
	 /eS6aoe7j75GDDUbhnt4JvrwpeMC7vlfZXDJKJSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE97CF8011F;
	Tue,  2 Jul 2019 15:04:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8676F800E6; Tue,  2 Jul 2019 15:04:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4704F80058
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 15:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4704F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Dh4HceMI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=lnO4zdxuXNKqHm8tUqfmXXzq3bLMN/5jfwcnTXtYA6c=; b=Dh4HceMIe0DM
 0ysbAnPt+ISykMMMwQVip6qvfOm2OUVN5rG22y+l+JRI9SWV8vSB9R9Xiu/Ai8M0F9U+Y0DSYyig1
 qRbG5W5CQqOwhZRumbIWlltYEJ1FJ+7Ps+1/Ajh1COAVZMRJsAy9FVrf2eKqA9CTEIH4uuexMVHKB
 PLQag=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hiISe-0002NE-J3; Tue, 02 Jul 2019 13:04:40 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 0B031440046; Tue,  2 Jul 2019 14:04:40 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mui2s66z.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190702130440.0B031440046@finisterre.sirena.org.uk>
Date: Tue,  2 Jul 2019 14:04:40 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: pxa: pxa2xx-ac97.c: use
	devm_snd_soc_register_component()" to the asoc tree
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

   ASoC: pxa: pxa2xx-ac97.c: use devm_snd_soc_register_component()

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

From 4b9b73b86571e8a03fb09232ff72177e66bf9ef9 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Jun 2019 13:10:31 +0900
Subject: [PATCH] ASoC: pxa: pxa2xx-ac97.c: use
 devm_snd_soc_register_component()

We have devm_xxx version of snd_soc_register_component,
let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/pxa2xx-ac97.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index 687a8f1f9e0d..bf28187315db 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -250,7 +250,7 @@ static int pxa2xx_ac97_dev_probe(struct platform_device *pdev)
 	 * driver to do interesting things with the clocking to get us up
 	 * and running.
 	 */
-	return snd_soc_register_component(&pdev->dev, &pxa_ac97_component,
+	return devm_snd_soc_register_component(&pdev->dev, &pxa_ac97_component,
 					  pxa_ac97_dai_driver, ARRAY_SIZE(pxa_ac97_dai_driver));
 }
 
@@ -258,7 +258,6 @@ static int pxa2xx_ac97_dev_remove(struct platform_device *pdev)
 {
 	struct ac97_controller *ctrl = platform_get_drvdata(pdev);
 
-	snd_soc_unregister_component(&pdev->dev);
 	snd_ac97_controller_unregister(ctrl);
 	pxa2xx_ac97_hw_remove(pdev);
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
