Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3350D15B59D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 01:03:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1713166E;
	Thu, 13 Feb 2020 01:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1713166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581552193;
	bh=fwundmDiEnMb84EUP8vKxon2BzA1+qsmMWn/9jx7B2s=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XYHsY+Hi4LU4zgCk19rj4VHyRFyUAs/e7S0e8z5ZBTM/yhU+sPPjUTIGl8Y1YcnTg
	 tNlvEz/0ucAvOgt7QLtX8AKKaz4X9fZVZC468uxO2Gj6o/v5kzJXLe5oYzzw0jS1Yl
	 0OUVonOJy13uL5AKbmyA9BvTWGiBhD+TSky4/L70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E4D0F802DB;
	Thu, 13 Feb 2020 00:57:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C616F802A9; Thu, 13 Feb 2020 00:57:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B840DF8027C
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:57:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B840DF8027C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D07F106F;
 Wed, 12 Feb 2020 15:57:26 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B69BD3F68E;
 Wed, 12 Feb 2020 15:57:25 -0800 (PST)
Date: Wed, 12 Feb 2020 23:57:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200212124608.2.I5fa3fdca69dbb5d3dd5031c939b9b24095065a94@changeid>
Message-Id: <applied-20200212124608.2.I5fa3fdca69dbb5d3dd5031c939b9b24095065a94@changeid>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, cychiang@google.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>, dgreid@google.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183-da7219: add speaker
	switch" to the asoc tree
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

   ASoC: mediatek: mt8183-da7219: add speaker switch

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 514de1c935d1670e0f162210f3794cf0be67c8a7 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 12 Feb 2020 13:55:17 +0800
Subject: [PATCH] ASoC: mediatek: mt8183-da7219: add speaker switch

Da7219 and max98357a share the same I2S lines.  When writing audio data
to the I2S, both codecs generate sound.

Da7219 already has a separate control "Headphone Switch".  Adds a new
control "Speakers Switch" for turning on/off max98357a.  Userspace
program can decide to turn on/off which codecs by different use cases.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20200212124608.2.I5fa3fdca69dbb5d3dd5031c939b9b24095065a94@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index c65493721e90..1626541cc0d6 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -372,9 +372,28 @@ static struct snd_soc_codec_conf mt6358_codec_conf[] = {
 	},
 };
 
+static const struct snd_kcontrol_new mt8183_da7219_max98357_snd_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speakers"),
+};
+
+static const
+struct snd_soc_dapm_widget mt8183_da7219_max98357_dapm_widgets[] = {
+	SND_SOC_DAPM_SPK("Speakers", NULL),
+};
+
+static const struct snd_soc_dapm_route mt8183_da7219_max98357_dapm_routes[] = {
+	{"Speakers", NULL, "Speaker"},
+};
+
 static struct snd_soc_card mt8183_da7219_max98357_card = {
 	.name = "mt8183_da7219_max98357",
 	.owner = THIS_MODULE,
+	.controls = mt8183_da7219_max98357_snd_controls,
+	.num_controls = ARRAY_SIZE(mt8183_da7219_max98357_snd_controls),
+	.dapm_widgets = mt8183_da7219_max98357_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8183_da7219_max98357_dapm_widgets),
+	.dapm_routes = mt8183_da7219_max98357_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8183_da7219_max98357_dapm_routes),
 	.dai_link = mt8183_da7219_max98357_dai_links,
 	.num_links = ARRAY_SIZE(mt8183_da7219_max98357_dai_links),
 	.aux_dev = &mt8183_da7219_max98357_headset_dev,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
