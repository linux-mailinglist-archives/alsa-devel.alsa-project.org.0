Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C6ABBDD0
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 23:24:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4319416B6;
	Mon, 23 Sep 2019 23:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4319416B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569273853;
	bh=+qDw7/z7PFFq5Gwk9fRUpqtPnKNsr0O1SUwYFBHztOA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MYKWI2kS+SGyQoZl9l8hjP4gOrrq0LUWuPkfLHFLgz+RI3DSjdKk2yEI508aeumEn
	 egaCpnusjRkjKlXZwhNdsAe5zWOrGN+SNkTAN9IkFUkfh6pSCOsytSrQIVYt2AejIF
	 LmAAQusN9FCdHwuMWKiPyZNOTi5RaQ7qB5Ig5zBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4926F805AA;
	Mon, 23 Sep 2019 23:23:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4183EF80307; Mon, 23 Sep 2019 23:23:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDB81F80307
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 23:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB81F80307
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="kXBLMxdL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Dqx0t8oApf8vJTD+XdXWJkomG/Wt3YhGIuSXYOi8rJA=; b=kXBLMxdLEvos
 52f3fYbL0FtBMgpR09dpcZQFApPFqDWR4cpw3v78cgWpx6VhUf82MWYFAzJpgoryhWlUmPm2gIQjB
 33sUldPvjlOLdlnW1Ho+odY/fLRw6fLIuwBQmEj8Ai6ThB5D4zuK3kdQwYwyZwHtID2n8DimqlQpH
 LWrWo=;
Received: from [12.157.10.114] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iCVnP-0005WR-Lf; Mon, 23 Sep 2019 21:22:59 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id D95BED02FCA; Mon, 23 Sep 2019 22:22:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
In-Reply-To: <20190923142257.GB31251@mwanda>
X-Patchwork-Hint: ignore
Message-Id: <20190923212257.D95BED02FCA@fitzroy.sirena.org.uk>
Date: Mon, 23 Sep 2019 22:22:57 +0100 (BST)
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: fix a couple missing
	error assignments" to the asoc tree
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

   ASoC: soc-component: fix a couple missing error assignments

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

From 901e822b2e365dac4727e0ddffb444a2554b0a89 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Sep 2019 17:22:57 +0300
Subject: [PATCH] ASoC: soc-component: fix a couple missing error assignments

There were a couple places where the return value wasn't assigned so the
error handling wouldn't trigger.

Fixes: 5c0769af4caf ("ASoC: soc-dai: add snd_soc_dai_bespoke_trigger()")
Fixes: 95aef3553384 ("ASoC: soc-dai: add snd_soc_dai_trigger()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/r/20190923142257.GB31251@mwanda
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e163dde5eab1..a1b99ac57d9e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1070,7 +1070,7 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 			return ret;
 	}
 
-	snd_soc_dai_trigger(cpu_dai, substream, cmd);
+	ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
 	if (ret < 0)
 		return ret;
 
@@ -1097,7 +1097,7 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	snd_soc_dai_bespoke_trigger(cpu_dai, substream, cmd);
+	ret = snd_soc_dai_bespoke_trigger(cpu_dai, substream, cmd);
 	if (ret < 0)
 		return ret;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
