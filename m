Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A462899EFD
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 20:39:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6E4165F;
	Thu, 22 Aug 2019 20:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6E4165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566499175;
	bh=9iOkCnOYh1riLB78VA3PCjA14WpS3QOkFyOFIDMjJUY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bUpducuMgibvxsU6eWwDBAZnChgsh500WM1HZW9msWjIhHySd7Q4TuEQhvHRZE1sA
	 Rr/lFOk40EGsuiFFA7rRDlqD4JuDAIKAoA7fCnDTpt6r154U0CNbHYMCWVaj5PUIJJ
	 sAWx8tXhnlK0OelPiA4lfX6kHr2fjTDBAyWnbM58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19FE7F8063B;
	Thu, 22 Aug 2019 20:33:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89426F805FF; Thu, 22 Aug 2019 20:33:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAC0AF803F3
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 20:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAC0AF803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AxiGYKh3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=1AwukWFUqXxaIfMJ13u1qz4SbI+yNJiVN1i1chu58OA=; b=AxiGYKh3GC0t
 dAQdULav9es/DJJngQAxrqLC3fuLGj43/bBc8kfaRtroV9U7qu9YidIN2pvQvnDSIz4QjK74n0lIg
 w5zpbgJpUls/e0pRqVCcZAtr4BXnjW5dfNMBTlZUDIMRDwki1hHT2RsVCgQJUtPag5Egjvv4+WNge
 mqyeU=;
Received: from 92.40.26.78.threembb.co.uk ([92.40.26.78]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i0rtR-0007fe-Jz; Thu, 22 Aug 2019 18:33:06 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 14831D02CD4; Thu, 22 Aug 2019 19:32:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878sro1ldw.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190822183257.14831D02CD4@fitzroy.sirena.org.uk>
Date: Thu, 22 Aug 2019 19:32:57 +0100 (BST)
Cc: Sridharan@sirena.org.uk, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Ranjani <ranjani.sridharan@intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: use device_register()" to the
	asoc tree
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

   ASoC: soc-core: use device_register()

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

From 4168ddabb480bef818c93f378428632fb681b500 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 20 Aug 2019 14:04:49 +0900
Subject: [PATCH] ASoC: soc-core: use device_register()

It is easy to read code if it is cleanly using paired function/naming,
like start <-> stop, register <-> unregister, etc, etc.
But, current ALSA SoC code is very random, unbalance, not paired, etc.

soc-core.c is using device_unregiser(), but there is no its paired
device_regiser(). We can find its code at soc_post_component_init()
which is using device_initialize() and device_add().
Here, device_initialize() + device_add() = device_register().

	-- linux/drivers/base/core.c --
	int device_register(struct device *dev)
	{
		device_initialize(dev);
		return device_add(dev);
	}

device_initialize() is doing each dev member's initialization only,
not related to device parent/release/groups.
Thus, we can postpone it.
let's use device_register() instead of device_initialize()/device_add().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/878sro1ldw.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6df880be1622..3860d8521734 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1347,7 +1347,6 @@ static int soc_post_component_init(struct snd_soc_pcm_runtime *rtd,
 	rtd->dev = kzalloc(sizeof(struct device), GFP_KERNEL);
 	if (!rtd->dev)
 		return -ENOMEM;
-	device_initialize(rtd->dev);
 	rtd->dev->parent = rtd->card->dev;
 	rtd->dev->release = rtd_release;
 	rtd->dev->groups = soc_dev_attr_groups;
@@ -1357,7 +1356,7 @@ static int soc_post_component_init(struct snd_soc_pcm_runtime *rtd,
 	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
 	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
 	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].fe_clients);
-	ret = device_add(rtd->dev);
+	ret = device_register(rtd->dev);
 	if (ret < 0) {
 		/* calling put_device() here to free the rtd->dev */
 		put_device(rtd->dev);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
