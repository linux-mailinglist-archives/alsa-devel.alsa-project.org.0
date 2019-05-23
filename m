Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ACB27ECA
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 15:52:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83F791671;
	Thu, 23 May 2019 15:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83F791671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558619527;
	bh=zdzsY+5nAfr5t9ToKbqSkU9CgvgTF4qePd32FNmTFGM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=COfWIXdiELUMNdzHkgj6TJGHgGCwdTh9unxz2Mq7lE69/hNmIPfDjCzi/CmM5Bhat
	 PFT1gYzeHJnTfpiB8CDeO6kffL0TEUjJ6JVSm1Qi8kgzd5wjFpcopYwYsFjFq0nibr
	 1JGf4rGVL2tWjYw5eC752pP39LdRUiIvFYE4i/UQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA697F89715;
	Thu, 23 May 2019 15:49:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A411F89725; Thu, 23 May 2019 15:49:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AA6BF89717
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 15:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AA6BF89717
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qU/N5s4s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=hTpmJpPnUl348fvANAwWFt8t/iw5ooVeLLCBkWV0jLw=; b=qU/N5s4sCXLS
 OsIQtkMSZ6wLTfWxLjl9oaf6orRHlJUL+Ki3mS7DOZIiqb2KEHSnyrhRVszbvJCpPiGJdCSjQdolu
 wUgG8H75JhmXfiI2603sPLZte2Q+vGknudeqmE/UHbUv8WuPTSErQlKijoxLpTmBEkU36t8AHwkEk
 Pxg8U=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTo5b-0000E4-D5; Thu, 23 May 2019 13:48:59 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id D99DB1126D25; Thu, 23 May 2019 14:48:53 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20190522145505.257961-1-tzungbi@google.com>
X-Patchwork-Hint: ignore
Message-Id: <20190523134853.D99DB1126D25@debutante.sirena.org.uk>
Date: Thu, 23 May 2019 14:48:53 +0100 (BST)
Cc: alsa-devel@alsa-project.org, cychiang@google.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>, dgreid@google.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183: remove unused DAPM
	pins" to the asoc tree
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

   ASoC: mediatek: mt8183: remove unused DAPM pins

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

From 108d0d40b932f80fc7f1dbd1de548d666e649a4b Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 22 May 2019 22:55:05 +0800
Subject: [PATCH] ASoC: mediatek: mt8183: remove unused DAPM pins

Kernel emits the following messages when booting.
ASoC: DAPM unknown pin Headset Mic
ASoC: DAPM unknown pin Headphone

Remove the unused DAPM pins.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../soc/mediatek/mt8183/mt8183-da7219-max98357.c | 15 +--------------
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c      | 16 +---------------
 2 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 31ea8632c397..231fb49d79b9 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -18,18 +18,6 @@
 
 static struct snd_soc_jack headset_jack;
 
-/* Headset jack detection DAPM pins */
-static struct snd_soc_jack_pin headset_jack_pins[] = {
-	{
-		.pin = "Headphone",
-		.mask = SND_JACK_HEADPHONE,
-	},
-	{
-		.pin = "Headset Mic",
-		.mask = SND_JACK_MICROPHONE,
-	},
-};
-
 static struct snd_soc_dai_link_component
 mt8183_da7219_max98357_external_codecs[] = {
 	{
@@ -375,8 +363,7 @@ mt8183_da7219_max98357_headset_init(struct snd_soc_component *component)
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
 				    &headset_jack,
-				    headset_jack_pins,
-				    ARRAY_SIZE(headset_jack_pins));
+				    NULL, 0);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 4e44e5689d6f..1ba7aa58e4b6 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -17,19 +17,6 @@
 
 static struct snd_soc_jack headset_jack;
 
-/* Headset jack detection DAPM pins */
-static struct snd_soc_jack_pin headset_jack_pins[] = {
-	{
-		.pin = "Headphone",
-		.mask = SND_JACK_HEADPHONE,
-	},
-	{
-		.pin = "Headset Mic",
-		.mask = SND_JACK_MICROPHONE,
-	},
-
-};
-
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
@@ -328,8 +315,7 @@ mt8183_mt6358_ts3a227_max98357_headset_init(struct snd_soc_component *component)
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
 				    &headset_jack,
-				    headset_jack_pins,
-				    ARRAY_SIZE(headset_jack_pins));
+				    NULL, 0);
 	if (ret)
 		return ret;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
