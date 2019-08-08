Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ED686BBB
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 22:41:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10F611657;
	Thu,  8 Aug 2019 22:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10F611657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565296885;
	bh=wEkUc22Ayo4axZbqkj6tiDnNv5UIlQMD6auWjxy7xqY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=e1yU4Bit9SITJlHGXC+3Y/a2ajbCQh3xwmEhblTOFi/KiOsJN3b/IiCD7HrKwbshx
	 XdhKO0GIPerXZreGKqndOpiZbSgblJeza6b9pk+qeNkfCKDp7i4hWawyJSy+cWIUhW
	 Ic/ZfDh5kEUDz3rOQDl8f0oER1xx27G/+U3SpLtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2203DF80649;
	Thu,  8 Aug 2019 22:34:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE126F805A1; Thu,  8 Aug 2019 22:33:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65C34F805A9
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 22:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65C34F805A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RRy1s1qI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=jqRrS3j1yb1Kpndw+VflpqdcOS5nxLEDVExFEei+v64=; b=RRy1s1qIFmu4
 Ysw+46giN6+ZDa7VwypnGMzIf/12aVPVlabZnxHFjgMCadZ1Mz/I032Vg+0oXXDiJdh+1rOqIvFpT
 JhthE6LdSHezHHgVjcsV8Mki/MRXM5XgWuz3qyVHjTJ4Kukw3xBP8TTz27cdWGL7kCUr3u+WYcfLp
 Rf8wg=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvp6U-00041e-Ek; Thu, 08 Aug 2019 20:33:42 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6EF2127430BD; Thu,  8 Aug 2019 21:33:41 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d0hhahon.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190808203341.6EF2127430BD@ypsilon.sirena.org.uk>
Date: Thu,  8 Aug 2019 21:33:41 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: tidyup for
	snd_soc_dapm_add_routes()" to the asoc tree
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

   ASoC: soc-core: tidyup for snd_soc_dapm_add_routes()

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

From daa480bde6b3a9b728965e52efffc329ccee3f77 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 7 Aug 2019 10:31:03 +0900
Subject: [PATCH] ASoC: soc-core: tidyup for snd_soc_dapm_add_routes()

snd_soc_dapm_add_routes() registers routes by using
for(... i < num; ...). If routes was NULL, num should be zero.
Thus, we don't need to check about route pointer.
This patch also cares missing return value.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87d0hhahon.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e481f9999bfb..de95b68ce9ee 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1310,10 +1310,11 @@ static int soc_probe_component(struct snd_soc_card *card,
 	if (ret < 0)
 		goto err_probe;
 
-	if (component->driver->dapm_routes)
-		snd_soc_dapm_add_routes(dapm,
-					component->driver->dapm_routes,
-					component->driver->num_dapm_routes);
+	ret = snd_soc_dapm_add_routes(dapm,
+				      component->driver->dapm_routes,
+				      component->driver->num_dapm_routes);
+	if (ret < 0)
+		goto err_probe;
 
 	list_add(&dapm->list, &card->dapm_list);
 	/* see for_each_card_components */
@@ -2061,13 +2062,15 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 		snd_soc_add_card_controls(card, card->controls,
 					  card->num_controls);
 
-	if (card->dapm_routes)
-		snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
-					card->num_dapm_routes);
+	ret = snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
+				      card->num_dapm_routes);
+	if (ret < 0)
+		goto probe_end;
 
-	if (card->of_dapm_routes)
-		snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
-					card->num_of_dapm_routes);
+	ret = snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
+				      card->num_of_dapm_routes);
+	if (ret < 0)
+		goto probe_end;
 
 	/* try to set some sane longname if DMI is available */
 	snd_soc_set_dmi_name(card, NULL);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
