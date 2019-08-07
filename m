Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5AE84D6B
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 15:34:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFF77950;
	Wed,  7 Aug 2019 15:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFF77950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565184859;
	bh=jrAvOc+212OtfDpCUIV6VJIA4qTDacDfav2cr27ro50=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=a4BoNM6vXiarcac2IZK/BHQGwgKaC0oXhtSTTPVy8Io5cu9j5/FTn1S3vl6X4tLxg
	 BsoMplRg65th7ELKwKAbsDB+9ooXwphv0ERTCVbt6zGQ1iLpLqIqbY62CfM7SFbRqd
	 JWoMqBG7lb7evgLVXGltSBnFx0ifpq72M9hBlB70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ACF1F8060F;
	Wed,  7 Aug 2019 15:31:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 967BBF8053A; Wed,  7 Aug 2019 15:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB6A8F804CB
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 15:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB6A8F804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="m1jB5JZh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=+rS7JJPX0JP6iB4+oArINaCEhTzZpafsuKOF/Hmnf/4=; b=m1jB5JZhl5Z6
 qQLRP8bSdWG029oMDdwNZ9Wd1nmgpw7Y7PiOLI+jLFZ9rEPAl4NFvTuWQQeav791WRAgDRiZZSSWq
 AHAER628djEeoViRWt/GdhsOxkP1h1xrl+CcY9QQYqlCNCHW7I8FuTUswlOW+VxDDdQqRSoEfYt9b
 WnubA=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvM1g-0007fH-Eo; Wed, 07 Aug 2019 13:30:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D3F0B2742B9E; Wed,  7 Aug 2019 14:30:47 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ftmdahow.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190807133047.D3F0B2742B9E@ypsilon.sirena.org.uk>
Date: Wed,  7 Aug 2019 14:30:47 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: tidyup for
	snd_soc_dapm_new_controls()" to the asoc tree
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

   ASoC: soc-core: tidyup for snd_soc_dapm_new_controls()

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

From b8ba3b572c70c8559ef76c1e0ca02e7b05126e8c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 7 Aug 2019 10:30:53 +0900
Subject: [PATCH] ASoC: soc-core: tidyup for snd_soc_dapm_new_controls()

snd_soc_dapm_new_controls() registers controls by using
for(... i < num; ...). It means if widget was NULL, num should be zero.
Thus, we don't need to check about widget pointer.
This patch also cares missing return value.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87ftmdahow.wl-kuninori.morimoto.gx@renesas.com
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index d12054ab8741..bb1e9e2c4ff4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1264,16 +1264,14 @@ static int soc_probe_component(struct snd_soc_card *card,
 
 	soc_init_component_debugfs(component);
 
-	if (component->driver->dapm_widgets) {
-		ret = snd_soc_dapm_new_controls(dapm,
+	ret = snd_soc_dapm_new_controls(dapm,
 					component->driver->dapm_widgets,
 					component->driver->num_dapm_widgets);
 
-		if (ret != 0) {
-			dev_err(component->dev,
-				"Failed to create new controls %d\n", ret);
-			goto err_probe;
-		}
+	if (ret != 0) {
+		dev_err(component->dev,
+			"Failed to create new controls %d\n", ret);
+		goto err_probe;
 	}
 
 	for_each_component_dais(component, dai) {
@@ -1990,13 +1988,15 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	INIT_WORK(&card->deferred_resume_work, soc_resume_deferred);
 #endif
 
-	if (card->dapm_widgets)
-		snd_soc_dapm_new_controls(&card->dapm, card->dapm_widgets,
-					  card->num_dapm_widgets);
+	ret = snd_soc_dapm_new_controls(&card->dapm, card->dapm_widgets,
+					card->num_dapm_widgets);
+	if (ret < 0)
+		goto probe_end;
 
-	if (card->of_dapm_widgets)
-		snd_soc_dapm_new_controls(&card->dapm, card->of_dapm_widgets,
-					  card->num_of_dapm_widgets);
+	ret = snd_soc_dapm_new_controls(&card->dapm, card->of_dapm_widgets,
+					card->num_of_dapm_widgets);
+	if (ret < 0)
+		goto probe_end;
 
 	/* initialise the sound card only once */
 	if (card->probe) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
