Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83C38172
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 01:00:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 814881778;
	Fri,  7 Jun 2019 00:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 814881778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559862036;
	bh=ksghd/+I9At3+KVlPOGJrHQUd8rzlDWqT43zhXtqi6Y=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=t1UFEAY5bgkkV9YpBteSG3iK0M7mI/UFeNStSETVn6qq2ygC+e3rCAlHdnNGQeRog
	 NgDstFRvfKZPZs7to+ckQ+AIYd4E8Iq7fxgg+Bf9y2zI6jLFE2IKWSjjOuWewOlPqS
	 OBjShWrcybz5+C34yor+KEhcHtzJDwycvwINnH10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9184DF89A4A;
	Thu,  6 Jun 2019 23:31:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0989EF898A3; Thu,  6 Jun 2019 23:29:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A03D9F8980C
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A03D9F8980C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rnVtt392"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=JSWHZSEZb+B41IKWUYwGun60OWQL1nakWdznPRkWWbY=; b=rnVtt392dnMQ
 rOLyYG1uUXio+HiKU7g+ouyChuSyG0S1/GKCVFHQ9Y8ZQL4LoOqAUDQa7HbngsT5PKJxmpmgYGDXM
 Ui5q32RjRhtc9j9r4Wnj0zWQ7fmMVsA0uu++GF/ZOLjWaKBQ4rxDvmOlzlL1ofaBGtb8EtrwVjy9f
 yFhuU=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuk-0007UM-8n; Thu, 06 Jun 2019 21:27:14 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id B05CF440046; Thu,  6 Jun 2019 22:27:13 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874l53mksz.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212713.B05CF440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:13 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8173-rt5650-rt5676: use
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

   ASoC: mediatek: mt8173-rt5650-rt5676: use modern dai_link style

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

From 05ab66178cb27ee795aa458b43818d2caa2d3953 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:08:23 +0900
Subject: [PATCH] ASoC: mediatek: mt8173-rt5650-rt5676: use modern dai_link
 style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 85 +++++++++++--------
 1 file changed, 48 insertions(+), 37 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index d83cd039b413..9d4dd9721154 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -111,14 +111,6 @@ static int mt8173_rt5650_rt5676_init(struct snd_soc_pcm_runtime *runtime)
 				      &mt8173_rt5650_rt5676_jack);
 }
 
-static struct snd_soc_dai_link_component mt8173_rt5650_rt5676_codecs[] = {
-	{
-		.dai_name = "rt5645-aif1",
-	},
-	{
-		.dai_name = "rt5677-aif1",
-	},
-};
 
 enum {
 	DAI_LINK_PLAYBACK,
@@ -129,47 +121,69 @@ enum {
 	DAI_LINK_INTERCODEC
 };
 
+SND_SOC_DAILINK_DEFS(playback,
+	DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture,
+	DAILINK_COMP_ARRAY(COMP_CPU("VUL")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(hdmi_pcm,
+	DAILINK_COMP_ARRAY(COMP_CPU("HDMI")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(codec,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5645-aif1"),
+			   COMP_CODEC(NULL, "rt5677-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(hdmi_be,
+	DAILINK_COMP_ARRAY(COMP_CPU("HDMIO")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(intercodec,
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5677-aif2")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
 /* Digital audio interface glue - connects codec <---> CPU */
 static struct snd_soc_dai_link mt8173_rt5650_rt5676_dais[] = {
 	/* Front End DAI links */
 	[DAI_LINK_PLAYBACK] = {
 		.name = "rt5650_rt5676 Playback",
 		.stream_name = "rt5650_rt5676 Playback",
-		.cpu_dai_name = "DL1",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback),
 	},
 	[DAI_LINK_CAPTURE] = {
 		.name = "rt5650_rt5676 Capture",
 		.stream_name = "rt5650_rt5676 Capture",
-		.cpu_dai_name = "VUL",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture),
 	},
 	[DAI_LINK_HDMI] = {
 		.name = "HDMI",
 		.stream_name = "HDMI PCM",
-		.cpu_dai_name = "HDMI",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(hdmi_pcm),
 	},
 
 	/* Back End DAI links */
 	[DAI_LINK_CODEC_I2S] = {
 		.name = "Codec",
-		.cpu_dai_name = "I2S",
 		.no_pcm = 1,
-		.codecs = mt8173_rt5650_rt5676_codecs,
-		.num_codecs = 2,
 		.init = mt8173_rt5650_rt5676_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBS_CFS,
@@ -177,26 +191,23 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5676_dais[] = {
 		.ignore_pmdown_time = 1,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(codec),
 	},
 	[DAI_LINK_HDMI_I2S] = {
 		.name = "HDMI BE",
-		.cpu_dai_name = "HDMIO",
 		.no_pcm = 1,
-		.codec_dai_name = "i2s-hifi",
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(hdmi_be),
 	},
 	/* rt5676 <-> rt5650 intercodec link: Sets rt5676 I2S2 as master */
 	[DAI_LINK_INTERCODEC] = {
 		.name = "rt5650_rt5676 intercodec",
 		.stream_name = "rt5650_rt5676 intercodec",
-		.cpu_dai_name = "snd-soc-dummy-dai",
-		.platform_name = "snd-soc-dummy",
 		.no_pcm = 1,
-		.codec_dai_name = "rt5677-aif2",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBM_CFM,
+		SND_SOC_DAILINK_REG(intercodec),
 	},
-
 };
 
 static struct snd_soc_codec_conf mt8173_rt5650_rt5676_codec_conf[] = {
@@ -235,34 +246,34 @@ static int mt8173_rt5650_rt5676_dev_probe(struct platform_device *pdev)
 	}
 
 	for_each_card_prelinks(card, i, dai_link) {
-		if (dai_link->platform_name)
+		if (dai_link->platforms->name)
 			continue;
-		dai_link->platform_of_node = platform_node;
+		dai_link->platforms->of_node = platform_node;
 	}
 
-	mt8173_rt5650_rt5676_codecs[0].of_node =
+	mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[0].of_node =
 		of_parse_phandle(pdev->dev.of_node, "mediatek,audio-codec", 0);
-	if (!mt8173_rt5650_rt5676_codecs[0].of_node) {
+	if (!mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[0].of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
 		return -EINVAL;
 	}
-	mt8173_rt5650_rt5676_codecs[1].of_node =
+	mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[1].of_node =
 		of_parse_phandle(pdev->dev.of_node, "mediatek,audio-codec", 1);
-	if (!mt8173_rt5650_rt5676_codecs[1].of_node) {
+	if (!mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[1].of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
 		return -EINVAL;
 	}
 	mt8173_rt5650_rt5676_codec_conf[0].of_node =
-		mt8173_rt5650_rt5676_codecs[1].of_node;
+		mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[1].of_node;
 
-	mt8173_rt5650_rt5676_dais[DAI_LINK_INTERCODEC].codec_of_node =
-		mt8173_rt5650_rt5676_codecs[1].of_node;
+	mt8173_rt5650_rt5676_dais[DAI_LINK_INTERCODEC].codecs->of_node =
+		mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[1].of_node;
 
-	mt8173_rt5650_rt5676_dais[DAI_LINK_HDMI_I2S].codec_of_node =
+	mt8173_rt5650_rt5676_dais[DAI_LINK_HDMI_I2S].codecs->of_node =
 		of_parse_phandle(pdev->dev.of_node, "mediatek,audio-codec", 2);
-	if (!mt8173_rt5650_rt5676_dais[DAI_LINK_HDMI_I2S].codec_of_node) {
+	if (!mt8173_rt5650_rt5676_dais[DAI_LINK_HDMI_I2S].codecs->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
 		return -EINVAL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
