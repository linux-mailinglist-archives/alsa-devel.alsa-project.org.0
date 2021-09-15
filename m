Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A1840CC60
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 20:12:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 615551817;
	Wed, 15 Sep 2021 20:11:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 615551817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631729525;
	bh=ppZ62baxSr5iQyFxf/Jx3GqE3FOZNeaZ7Ts4bvX7cY0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bo52nHvizIRMlHkj5s0qqoJP/EZBOsiRP7Exnj7D3BygXqXYPi214vbmFmVqA74x3
	 CnPcCjnd4p1/zLxTUIRYDN5Z22qK/7nh+nf+40Daz5c4Dt31+EVizeflcrXLOP3htq
	 p1hVRAMo7eF8vfDV46hDy64ozM6GfR1G3oQ0lKmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBB85F80227;
	Wed, 15 Sep 2021 20:10:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CD60F8027C; Wed, 15 Sep 2021 20:10:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B44EF800EF
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 20:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B44EF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eNgpn78P"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51955611C6;
 Wed, 15 Sep 2021 18:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631729438;
 bh=ppZ62baxSr5iQyFxf/Jx3GqE3FOZNeaZ7Ts4bvX7cY0=;
 h=From:To:Cc:Subject:Date:From;
 b=eNgpn78PN5FknDsmQfAZddbZAhjvWn4494Drc5SLc0ji9e9xaGmeh2gq/HHWyhSmj
 Oc/qdvffK+dEOQ6u40itiCcrd5dJZ+NpdvljM1Qp6742z9Fk0HFW/UNewxQFK4PzTO
 7+hFGTaMQ/gB1ssYOpWndjnAtVI+R0OV1mf5xHuzPOcK2XCdu5v6ZIe5kZERun14jd
 cz+kRzIbjTNnecBltzFavDfQGzvkHpU1qmmThG2ROZeVoawHkCiU9y2sHvP/1KZKf4
 mI2uiLvd/MNngKp79Uj94vt6fHBYCeGtah9UO+AiuCPG7kftx+6k5S6IvaocBhTYwb
 vaOA1ajxJQT1g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2] ASoC: amd: Convert to new style DAI format definitions
Date: Wed, 15 Sep 2021 19:09:57 +0100
Message-Id: <20210915180957.39996-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Convert the AMD machine drivers to use the new style defines for clocking
in DAI formats.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/acp-da7219-max98357a.c | 20 ++++++++++----------
 sound/soc/amd/acp-rt5645.c           |  4 ++--
 sound/soc/amd/acp3x-rt5682-max9836.c |  8 ++++----
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index b2065f3fe42c..3bf86c2424ae 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -522,7 +522,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.name = "amd-da7219-play",
 		.stream_name = "Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_da7219_init,
 		.dpcm_playback = 1,
 		.stop_dma_first = 1,
@@ -533,7 +533,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.name = "amd-da7219-cap",
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_capture = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_da7219_cap_ops,
@@ -543,7 +543,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.name = "amd-max98357-play",
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_playback = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_max_play_ops,
@@ -554,7 +554,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.name = "dmic0",
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_capture = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_dmic0_cap_ops,
@@ -565,7 +565,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.name = "dmic1",
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_capture = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_dmic1_cap_ops,
@@ -578,7 +578,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.name = "amd-rt5682-play",
 		.stream_name = "Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_rt5682_init,
 		.dpcm_playback = 1,
 		.stop_dma_first = 1,
@@ -589,7 +589,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.name = "amd-rt5682-cap",
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_capture = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_cap_ops,
@@ -599,7 +599,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.name = "amd-max98357-play",
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_playback = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_max_play_ops,
@@ -610,7 +610,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.name = "dmic0",
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_capture = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_dmic0_cap_ops,
@@ -621,7 +621,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.name = "dmic1",
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_capture = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_dmic1_cap_ops,
diff --git a/sound/soc/amd/acp-rt5645.c b/sound/soc/amd/acp-rt5645.c
index d6ba94677ac2..58b75cf399fc 100644
--- a/sound/soc/amd/acp-rt5645.c
+++ b/sound/soc/amd/acp-rt5645.c
@@ -111,7 +111,7 @@ static struct snd_soc_dai_link cz_dai_rt5650[] = {
 		.name = "amd-rt5645-play",
 		.stream_name = "RT5645_AIF1",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_init,
 		.ops = &cz_aif1_ops,
 		SND_SOC_DAILINK_REG(designware1, codec, platform),
@@ -120,7 +120,7 @@ static struct snd_soc_dai_link cz_dai_rt5650[] = {
 		.name = "amd-rt5645-cap",
 		.stream_name = "RT5645_AIF1",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.ops = &cz_aif1_ops,
 		SND_SOC_DAILINK_REG(designware2, codec, platform),
 	},
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index e561464f7d60..dad70436d063 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -51,7 +51,7 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 	/* set rt5682 dai fmt */
 	ret =  snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S
 			| SND_SOC_DAIFMT_NB_NF
-			| SND_SOC_DAIFMT_CBM_CFM);
+			| SND_SOC_DAIFMT_CBP_CFP);
 	if (ret < 0) {
 		dev_err(rtd->card->dev,
 				"Failed to set rt5682 dai fmt: %d\n", ret);
@@ -302,7 +302,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.name = "acp3x-5682-play",
 		.stream_name = "Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = acp3x_5682_init,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
@@ -313,7 +313,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.name = "acp3x-max98357-play",
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBS_CFS,
+				| SND_SOC_DAIFMT_CBC_CFC,
 		.dpcm_playback = 1,
 		.ops = &acp3x_max_play_ops,
 		.cpus = acp3x_bt,
@@ -325,7 +325,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.name = "acp3x-ec-dmic0-capture",
 		.stream_name = "Capture DMIC0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBS_CFS,
+				| SND_SOC_DAIFMT_CBC_CFC,
 		.dpcm_capture = 1,
 		.ops = &acp3x_ec_cap0_ops,
 		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
-- 
2.20.1

