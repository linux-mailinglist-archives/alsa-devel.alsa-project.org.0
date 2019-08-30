Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 900CEA3B88
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 18:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F5FA165F;
	Fri, 30 Aug 2019 18:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F5FA165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567181281;
	bh=15CbK9hmMtWLl6teyIZ1Zq3lSQmHKfdWBxhfgUw7Ssw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Aji9uVCUTHbgpM30df0nxsGC//eZ1kB2HncsY+53PsduA+F1OMJySk+hn1wv97one
	 ScBU4Uprx8FMrz2+ySEb+h/GzM7ISv30StbAGtX1t2lkqtJ+yfjUqBPjcukQjUHrnZ
	 yx0/3xo3HzKgX59PbfNRcFYNcOUENRH0dV+79Yus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57075F80445;
	Fri, 30 Aug 2019 18:06:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3552CF80445; Fri, 30 Aug 2019 18:06:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7EFAF80362
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 18:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7EFAF80362
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WEqyfVAc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=YhMasvUbf5bB7nMIZWCC37hmGc/Hr8ew1rZw/T3hagU=; b=WEqyfVAcJduq
 NPjCWBMQR/G5IemJwEE45AyhAIUtJv2tD72/Gc54YtsiwX78uf1a/DhyxqxzV5VWiFvBkKaNhOQwt
 IQ+aUb7EP0oy/wa9skfhiZUmJz5inwEXzhKVb7wlVvB8i6VKIr1xBpJFJNTm4xsxjRW9PLJ1l53P9
 vKe/I=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i3jPc-000790-Sa; Fri, 30 Aug 2019 16:06:08 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3DFB32742CC6; Fri, 30 Aug 2019 17:06:08 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20190830074240.195166-4-tzungbi@google.com>
X-Patchwork-Hint: ignore
Message-Id: <20190830160608.3DFB32742CC6@ypsilon.sirena.org.uk>
Date: Fri, 30 Aug 2019 17:06:08 +0100 (BST)
Cc: tzungbi@google.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, dgreid@google.com, cychiang@google.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183: remove forward
	declaration of headset_init" to the asoc tree
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

   ASoC: mediatek: mt8183: remove forward declaration of headset_init

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

From fc347483b87f029c1bc18a8492623ca21dcd7607 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 30 Aug 2019 15:42:39 +0800
Subject: [PATCH] ASoC: mediatek: mt8183: remove forward declaration of
 headset_init

The forward declaration of mt8183_mt6358_ts3a227_max98357_headset_init
is for cyclic dependency between card, headset_dev, and headset_init.

It used to be:
- card depends on headset_dev
- headset_dev depends on headset_init
- headset_init depends on card

Commit a962a809e5e4 ("ASoC: mediatek: mt8183: make headset codec
optional") removed the cyclic dependency.

Thus, it is safe to remove the forward declaration.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20190830074240.195166-4-tzungbi@google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c         | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index a7ad41b6e885..30a7735c4af3 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -390,14 +390,6 @@ mt8183_mt6358_ts3a227_max98357_dai_links[] = {
 	},
 };
 
-static int
-mt8183_mt6358_ts3a227_max98357_headset_init(struct snd_soc_component *cpnt);
-
-static struct snd_soc_aux_dev mt8183_mt6358_ts3a227_max98357_headset_dev = {
-	.dlc = COMP_EMPTY(),
-	.init = mt8183_mt6358_ts3a227_max98357_headset_init,
-};
-
 static struct snd_soc_card mt8183_mt6358_ts3a227_max98357_card = {
 	.name = "mt8183_mt6358_ts3a227_max98357",
 	.owner = THIS_MODULE,
@@ -428,6 +420,11 @@ mt8183_mt6358_ts3a227_max98357_headset_init(struct snd_soc_component *component)
 	return ret;
 }
 
+static struct snd_soc_aux_dev mt8183_mt6358_ts3a227_max98357_headset_dev = {
+	.dlc = COMP_EMPTY(),
+	.init = mt8183_mt6358_ts3a227_max98357_headset_init,
+};
+
 static int
 mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
