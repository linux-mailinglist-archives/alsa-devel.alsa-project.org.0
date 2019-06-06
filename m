Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7898938169
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EE07177D;
	Fri,  7 Jun 2019 00:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EE07177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559861920;
	bh=pqkO3BnzrvjYHdQnSR6O2bjhtO4P4ul5yTz5dSTjVaI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XyMy9JXU/Uv5xnkOtyzTt5CTtqD3mx0+Wq5iwrnAjC/mJSc2X1q1dUAItGnQmU3dB
	 G4y/P161V6cdLPxKCNXrHvj4QQUktAaS6k4aRqAuykqgybHzwGBDq1TR/btxF1iNBz
	 zJ0x/9eur+9T0vQWbv5c8EYAnbVLa7C5xW3V6BaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 376B1F89A39;
	Thu,  6 Jun 2019 23:31:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48766F8989B; Thu,  6 Jun 2019 23:29:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A55BF89762
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A55BF89762
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ffNXpFlL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=g2DCI0UE00RhfPCNtUoU6yy149FH0kA/heAhExknMME=; b=ffNXpFlL3ItJ
 1m/4Qz6cZ0/ztQYJ3mULslnO9jjJSKhhMpTuwG7krq6pnY0lSFo6px2wa0sGnfYej6/1FvIBlBSD9
 oAz6CNs2KqAb2zCcwr6Tzd8blb2LpWjnZftP9pKbmDRJIT7XUmTi0EH6QM2wWcg9DNP3TzbUk8Jlj
 s/Dmw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuj-0007UA-0r; Thu, 06 Jun 2019 21:27:13 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8EF71440049; Thu,  6 Jun 2019 22:27:12 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871s07mksf.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212712.8EF71440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:12 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183-da7219-max98357: use
	modern dai_link style" to the asoc tree
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

   ASoC: mediatek: mt8183-da7219-max98357: use modern dai_link style

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

From 4b99064229b426260d6873e865cd9f6732074f6f Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:08:43 +0900
Subject: [PATCH] ASoC: mediatek: mt8183-da7219-max98357: use modern dai_link
 style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 182 ++++++++++--------
 1 file changed, 107 insertions(+), 75 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 231fb49d79b9..59076e21cb47 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -18,18 +18,6 @@
 
 static struct snd_soc_jack headset_jack;
 
-static struct snd_soc_dai_link_component
-mt8183_da7219_max98357_external_codecs[] = {
-	{
-		.name = "max98357a",
-		.dai_name = "HiFi",
-	},
-	{
-		.name = "da7219.5-001a",
-		.dai_name = "da7219-hifi",
-	},
-};
-
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
@@ -137,191 +125,244 @@ static const struct snd_soc_dapm_route mt8183_da7219_max98357_dapm_routes[] = {
 	{"IT6505_8CH", NULL, "TDM"},
 };
 
+/* FE */
+SND_SOC_DAILINK_DEFS(playback1,
+	DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback2,
+	DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback3,
+	DAILINK_COMP_ARRAY(COMP_CPU("DL3")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture1,
+	DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture2,
+	DAILINK_COMP_ARRAY(COMP_CPU("UL2")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture3,
+	DAILINK_COMP_ARRAY(COMP_CPU("UL3")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture_mono,
+	DAILINK_COMP_ARRAY(COMP_CPU("UL_MONO_1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback_hdmi,
+	DAILINK_COMP_ARRAY(COMP_CPU("HDMI")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+/* BE */
+SND_SOC_DAILINK_DEFS(primary_codec,
+	DAILINK_COMP_ARRAY(COMP_CPU("ADDA")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("mt6358-sound", "mt6358-snd-codec-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(pcm1,
+	DAILINK_COMP_ARRAY(COMP_CPU("PCM 1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(pcm2,
+	DAILINK_COMP_ARRAY(COMP_CPU("PCM 2")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s0,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S0")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s1,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s2,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("da7219.5-001a", "da7219-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s3,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("max98357a", "HiFi"),
+			 COMP_CODEC("da7219.5-001a", "da7219-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s5,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S5")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(tdm,
+	DAILINK_COMP_ARRAY(COMP_CPU("TDM")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 	/* FE */
 	{
 		.name = "Playback_1",
 		.stream_name = "Playback_1",
-		.cpu_dai_name = "DL1",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback1),
 	},
 	{
 		.name = "Playback_2",
 		.stream_name = "Playback_2",
-		.cpu_dai_name = "DL2",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback2),
 	},
 	{
 		.name = "Playback_3",
 		.stream_name = "Playback_3",
-		.cpu_dai_name = "DL3",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback3),
 	},
 	{
 		.name = "Capture_1",
 		.stream_name = "Capture_1",
-		.cpu_dai_name = "UL1",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture1),
 	},
 	{
 		.name = "Capture_2",
 		.stream_name = "Capture_2",
-		.cpu_dai_name = "UL2",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture2),
 	},
 	{
 		.name = "Capture_3",
 		.stream_name = "Capture_3",
-		.cpu_dai_name = "UL3",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture3),
 	},
 	{
 		.name = "Capture_Mono_1",
 		.stream_name = "Capture_Mono_1",
-		.cpu_dai_name = "UL_MONO_1",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture_mono),
 	},
 	{
 		.name = "Playback_HDMI",
 		.stream_name = "Playback_HDMI",
-		.cpu_dai_name = "HDMI",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback_hdmi),
 	},
 	/* BE */
 	{
 		.name = "Primary Codec",
-		.cpu_dai_name = "ADDA",
-		.codec_dai_name = "mt6358-snd-codec-aif1",
-		.codec_name = "mt6358-sound",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(primary_codec),
 	},
 	{
 		.name = "PCM 1",
-		.cpu_dai_name = "PCM 1",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(pcm1),
 	},
 	{
 		.name = "PCM 2",
-		.cpu_dai_name = "PCM 2",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(pcm2),
 	},
 	{
 		.name = "I2S0",
-		.cpu_dai_name = "I2S0",
-		.codec_dai_name = "bt-sco-pcm",
-		.codec_name = "bt-sco",
 		.no_pcm = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
+		SND_SOC_DAILINK_REG(i2s0),
 	},
 	{
 		.name = "I2S1",
-		.cpu_dai_name = "I2S1",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.codec_name = "snd-soc-dummy",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
+		SND_SOC_DAILINK_REG(i2s1),
 	},
 	{
 		.name = "I2S2",
-		.cpu_dai_name = "I2S2",
-		.codec_dai_name = "da7219-hifi",
-		.codec_name = "da7219.5-001a",
 		.no_pcm = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_da7219_i2s_ops,
+		SND_SOC_DAILINK_REG(i2s2),
 	},
 	{
 		.name = "I2S3",
-		.cpu_dai_name = "I2S3",
-		.codecs = mt8183_da7219_max98357_external_codecs,
-		.num_codecs =
-			ARRAY_SIZE(mt8183_da7219_max98357_external_codecs),
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_da7219_i2s_ops,
+		SND_SOC_DAILINK_REG(i2s3),
 	},
 	{
 		.name = "I2S5",
-		.cpu_dai_name = "I2S5",
-		.codec_dai_name = "bt-sco-pcm",
-		.codec_name = "bt-sco",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
+		SND_SOC_DAILINK_REG(i2s5),
 	},
 	{
 		.name = "TDM",
-		.cpu_dai_name = "TDM",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(tdm),
 	},
 };
 
@@ -390,18 +431,9 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	}
 
 	for_each_card_prelinks(card, i, dai_link) {
-		/* In the alsa soc-core, the "platform" will be
-		 * allocated by devm_kzalloc if null.
-		 * There is a special case that registerring
-		 * sound card is failed at the first time, but
-		 * the "platform" will not null when probe is trying
-		 * again. It's not expected normally.
-		 */
-		dai_link->platforms = NULL;
-
-		if (dai_link->platform_name)
+		if (dai_link->platforms->name)
 			continue;
-		dai_link->platform_of_node = platform_node;
+		dai_link->platforms->of_node = platform_node;
 	}
 
 	mt8183_da7219_max98357_headset_dev.codec_of_node =
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
