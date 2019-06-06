Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE8A38180
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 01:02:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12AAD176E;
	Fri,  7 Jun 2019 01:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12AAD176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559862151;
	bh=F6TeK1cMjxePL7VEnUsXMQQoi15IbnZwYAtn9FvZiiI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=WB8efuE5mR3K3tzLxHEUTK33WhJYDHi9cLhEXOgZFNZOR+dkAmzCNayM/doTCWSwq
	 Qk03bMoPRFmlwHJO3cGFYNVKS4UALhFW0uuw3lo1Ql8q2zYK17Kup+/y9U23w4XbhY
	 bC6eys25ZVSG+/QcIcO3Xmbgf+PL59MLgVbqNmyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21699F89A58;
	Thu,  6 Jun 2019 23:31:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FDE4F898A7; Thu,  6 Jun 2019 23:29:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2856BF8980D
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2856BF8980D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="hBQs/z69"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=g9bpP75Sbx4Rbf3f6/PMm+4Ujfe63cEv9yvrUlRoee0=; b=hBQs/z69FGiO
 qlGy+4o+xhoVxtQP4UaMGuwxjYOQi1nTWl0xSZ1QjgA1aQ2v/7Q35NmCXbpOTTXeTg840et+ajZZK
 bvulSS895Rpw6TPjvTuKV045YR4n/D9xTROdXzsVBX+yNbGTcMcLAddYn2aBWGw4Lz6ik5wGDUtFp
 mYB5k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzul-0007Ue-Uq; Thu, 06 Jun 2019 21:27:15 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7BE21440049; Thu,  6 Jun 2019 22:27:15 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878sufmkti.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212715.7BE21440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:15 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mediatek: mt2701-cs42448: use modern
	dai_link style" to the asoc tree
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

   ASoC: mediatek: mt2701-cs42448: use modern dai_link style

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

From 4ddabddabf410a261ecbd8177f6e307bdae70d12 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:08:04 +0900
Subject: [PATCH] ASoC: mediatek: mt2701-cs42448: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt2701/mt2701-cs42448.c | 95 +++++++++++++++-------
 1 file changed, 65 insertions(+), 30 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 97f9f38ce6b3..b6941796efca 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -163,118 +163,153 @@ enum {
 	DAI_LINK_BE_MRG_BT,
 };
 
+SND_SOC_DAILINK_DEFS(fe_multi_ch_out,
+	DAILINK_COMP_ARRAY(COMP_CPU("PCM_multi")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(fe_pcm0_in,
+	DAILINK_COMP_ARRAY(COMP_CPU("PCM0")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(fe_pcm1_in,
+	DAILINK_COMP_ARRAY(COMP_CPU("PCM1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(fe_bt_out,
+	DAILINK_COMP_ARRAY(COMP_CPU("PCM_BT_DL")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(fe_bt_in,
+	DAILINK_COMP_ARRAY(COMP_CPU("PCM_BT_UL")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(be_i2s0,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S0")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cs42448")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(be_i2s1,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S1")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cs42448")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(be_i2s2,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cs42448")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(be_i2s3,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cs42448")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(be_mrg_bt,
+	DAILINK_COMP_ARRAY(COMP_CPU("MRG BT")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "bt-sco-pcm-wb")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 	/* FE */
 	[DAI_LINK_FE_MULTI_CH_OUT] = {
 		.name = "mt2701-cs42448-multi-ch-out",
 		.stream_name = "mt2701-cs42448-multi-ch-out",
-		.cpu_dai_name = "PCM_multi",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.ops = &mt2701_cs42448_48k_fe_ops,
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(fe_multi_ch_out),
 	},
 	[DAI_LINK_FE_PCM0_IN] = {
 		.name = "mt2701-cs42448-pcm0",
 		.stream_name = "mt2701-cs42448-pcm0-data-UL",
-		.cpu_dai_name = "PCM0",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.ops = &mt2701_cs42448_48k_fe_ops,
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(fe_pcm0_in),
 	},
 	[DAI_LINK_FE_PCM1_IN] = {
 		.name = "mt2701-cs42448-pcm1-data-UL",
 		.stream_name = "mt2701-cs42448-pcm1-data-UL",
-		.cpu_dai_name = "PCM1",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.ops = &mt2701_cs42448_48k_fe_ops,
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(fe_pcm1_in),
 	},
 	[DAI_LINK_FE_BT_OUT] = {
 		.name = "mt2701-cs42448-pcm-BT-out",
 		.stream_name = "mt2701-cs42448-pcm-BT",
-		.cpu_dai_name = "PCM_BT_DL",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(fe_bt_out),
 	},
 	[DAI_LINK_FE_BT_IN] = {
 		.name = "mt2701-cs42448-pcm-BT-in",
 		.stream_name = "mt2701-cs42448-pcm-BT",
-		.cpu_dai_name = "PCM_BT_UL",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(fe_bt_in),
 	},
 	/* BE */
 	[DAI_LINK_BE_I2S0] = {
 		.name = "mt2701-cs42448-I2S0",
-		.cpu_dai_name = "I2S0",
 		.no_pcm = 1,
-		.codec_dai_name = "cs42448",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(be_i2s0),
 	},
 	[DAI_LINK_BE_I2S1] = {
 		.name = "mt2701-cs42448-I2S1",
-		.cpu_dai_name = "I2S1",
 		.no_pcm = 1,
-		.codec_dai_name = "cs42448",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(be_i2s1),
 	},
 	[DAI_LINK_BE_I2S2] = {
 		.name = "mt2701-cs42448-I2S2",
-		.cpu_dai_name = "I2S2",
 		.no_pcm = 1,
-		.codec_dai_name = "cs42448",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(be_i2s2),
 	},
 	[DAI_LINK_BE_I2S3] = {
 		.name = "mt2701-cs42448-I2S3",
-		.cpu_dai_name = "I2S3",
 		.no_pcm = 1,
-		.codec_dai_name = "cs42448",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(be_i2s3),
 	},
 	[DAI_LINK_BE_MRG_BT] = {
 		.name = "mt2701-cs42448-MRG-BT",
-		.cpu_dai_name = "MRG BT",
 		.no_pcm = 1,
-		.codec_dai_name = "bt-sco-pcm-wb",
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(be_mrg_bt),
 	},
 };
 
@@ -311,9 +346,9 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
-		if (dai_link->platform_name)
+		if (dai_link->platforms->name)
 			continue;
-		dai_link->platform_of_node = platform_node;
+		dai_link->platforms->of_node = platform_node;
 	}
 
 	card->dev = dev;
@@ -326,9 +361,9 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
-		if (dai_link->codec_name)
+		if (dai_link->codecs->name)
 			continue;
-		dai_link->codec_of_node = codec_node;
+		dai_link->codecs->of_node = codec_node;
 	}
 
 	codec_node_bt_mrg = of_parse_phandle(pdev->dev.of_node,
@@ -338,7 +373,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 			"Property 'audio-codec-bt-mrg' missing or invalid\n");
 		return -EINVAL;
 	}
-	mt2701_cs42448_dai_links[DAI_LINK_BE_MRG_BT].codec_of_node
+	mt2701_cs42448_dai_links[DAI_LINK_BE_MRG_BT].codecs->of_node
 							= codec_node_bt_mrg;
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
