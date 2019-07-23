Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F1D71D8E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D34E418C2;
	Tue, 23 Jul 2019 19:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D34E418C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563902516;
	bh=uDcv90BK1Nh5beJ3jMGfIilY+7emO7rDaSUHeEA7ySI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DOZrMgV3gE7gDSIT/MtA3bLldzASvsY6d1LuOaGOvykOYV+3EworwaLQedx67grid
	 YQMwyQuTUX6NoRnAgGphxsKlRs31AZtqW1qTbiG2MToJagCANzpdFYkFBCZemMnw3v
	 PflsfEKNhZe7+BfuNg9m9MWRBGJclkRuDoDx2okQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 423FEF80483;
	Tue, 23 Jul 2019 19:19:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01B34F804FD; Tue, 23 Jul 2019 19:18:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2E3FF80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2E3FF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GAUlCL/D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=1GW2Qg8bDdinIlIqMumIMXnR3EShZxgcOmw84n+2WSM=; b=GAUlCL/DchrA
 1Aijk4GXcW+anxqrbg9zuIuLkeRl35pbqpof6fam68kZwAH6wdE9QUmFQBK0dz2EtKqhW/k5zLX2G
 KHh4g2t3hL0/pSkskHbc/5Xf4a7gDB/iqNb8xp76uR1xQCadQwcgAB5Vr4QIelzXOeb7lRn3quvDj
 Kn6Bw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyR9-0004LI-0r; Tue, 23 Jul 2019 17:18:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 854DA2742B60; Tue, 23 Jul 2019 18:18:50 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ef2ihmzo.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723171850.854DA2742B60@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 18:18:50 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: use existing
	snd_soc_dai_digital_mute()" to the asoc tree
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

   ASoC: soc-core: use existing snd_soc_dai_digital_mute()

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

From 88fdffa2eef45fc9f6009ee590741c44a57c49c7 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 22 Jul 2019 10:36:27 +0900
Subject: [PATCH] ASoC: soc-core: use existing snd_soc_dai_digital_mute()

ALSA SoC already has snd_soc_dai_digital_mute() for digital_mute,
let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87ef2ihmzo.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 458b090f026a..7ecfe641ca46 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -487,10 +487,9 @@ int snd_soc_suspend(struct device *dev)
 			continue;
 
 		for_each_rtd_codec_dai(rtd, i, dai) {
-			struct snd_soc_dai_driver *drv = dai->driver;
-
-			if (drv->ops->digital_mute && dai->playback_active)
-				drv->ops->digital_mute(dai, 1);
+			if (dai->playback_active)
+				snd_soc_dai_digital_mute(dai, 1,
+						SNDRV_PCM_STREAM_PLAYBACK);
 		}
 	}
 
@@ -665,10 +664,9 @@ static void soc_resume_deferred(struct work_struct *work)
 			continue;
 
 		for_each_rtd_codec_dai(rtd, i, dai) {
-			struct snd_soc_dai_driver *drv = dai->driver;
-
-			if (drv->ops->digital_mute && dai->playback_active)
-				drv->ops->digital_mute(dai, 0);
+			if (dai->playback_active)
+				snd_soc_dai_digital_mute(dai, 0,
+						SNDRV_PCM_STREAM_PLAYBACK);
 		}
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
