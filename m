Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3C6B8ED3
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 13:11:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2B93167F;
	Fri, 20 Sep 2019 13:10:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2B93167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568977884;
	bh=cVWN7dYicIBVfDwLUyCaUltzbfo8PgEaarKJHyc6HB4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=h+jED/sY9fSoAMNpVQ73HoVUAK2PEWaac6LbUCdY13WdswHGr8W9+hDZeyedQULhI
	 vO1qiivYl0t/UXpxOJ1pn0XigmagKSk3zEBfkTozxrZKE32xaBeAgnaRwroIdD86tP
	 ylyVTe6FPDJtmiygTwvNf3dV9/J1km/5uFpyjHGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21CAEF805F8;
	Fri, 20 Sep 2019 13:09:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 535B2F800C7; Fri, 20 Sep 2019 13:09:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1C5DF800C7
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1C5DF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="MqFKteSd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Z70n2Z6BU9jMkXwWxciRSQmegfY6LqP81y3tgyLEgeI=; b=MqFKteSdEbPX
 6ZbcHZKocF5vKKvqjaxR3DWg0IHlNxZ7L7sP2YNQ/GZjYpyq/7qT1gJaBnsOqwyvbaRWbcDAAAszV
 piJhCIXZJNL1ppEJkmiNgL8b0mOqd26LTxMxBOQVjWWlqY/XFRdrBSQ4JJu3cMmfUf6tEiQKrfrR8
 z5Rvg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iBGn7-0001cL-Gl; Fri, 20 Sep 2019 11:09:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 11CB2274293C; Fri, 20 Sep 2019 12:09:33 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20190920075046.3210393-1-arnd@arndb.de>
X-Patchwork-Hint: ignore
Message-Id: <20190920110933.11CB2274293C@ypsilon.sirena.org.uk>
Date: Fri, 20 Sep 2019 12:09:33 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Tony Lindgren <tony@atomide.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: [alsa-devel] Applied "ASoC: ti: fix SND_SOC_DM365_VOICE_CODEC
	dependencies" to the asoc tree
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

   ASoC: ti: fix SND_SOC_DM365_VOICE_CODEC dependencies

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

From 147162f575152db80000fb3de26358264768ee9f Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 20 Sep 2019 09:50:18 +0200
Subject: [PATCH] ASoC: ti: fix SND_SOC_DM365_VOICE_CODEC dependencies

SND_SOC_DM365_VOICE_CODEC is a 'bool' option in a choice statement,
meaning it cannot be set to =m, but it selects two other drivers
that we may want to be loadable modules after all:

WARNING: unmet direct dependencies detected for SND_SOC_CQ0093VC
  Depends on [m]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m]
  Selected by [y]:
  - SND_SOC_DM365_VOICE_CODEC [=y] && <choice>
  Selected by [m]:
  - SND_SOC_ALL_CODECS [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && COMPILE_TEST [=y]

Add an intermediate symbol that sets SND_SOC_CQ0093VC and
MFD_DAVINCI_VOICECODEC to =m if SND_SOC=m.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/r/20190920075046.3210393-1-arnd@arndb.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/Kconfig | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 87a9b9dd4e98..29f61053ab62 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -200,11 +200,18 @@ config SND_SOC_DM365_AIC3X_CODEC
 
 config SND_SOC_DM365_VOICE_CODEC
 	bool "Voice Codec - CQ93VC"
-	select MFD_DAVINCI_VOICECODEC
-	select SND_SOC_CQ0093VC
 	help
 	  Say Y if you want to add support for SoC On-chip voice codec
 endchoice
 
+config SND_SOC_DM365_VOICE_CODEC_MODULE
+	def_tristate y
+	depends on SND_SOC_DM365_VOICE_CODEC && SND_SOC
+	select MFD_DAVINCI_VOICECODEC
+	select SND_SOC_CQ0093VC
+	help
+	  The is an internal symbol needed to ensure that the codec
+	  and MFD driver can be built as loadable modules if necessary.
+
 endmenu
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
