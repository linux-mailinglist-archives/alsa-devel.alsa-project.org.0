Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2377A40CBC9
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 19:39:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B334D1811;
	Wed, 15 Sep 2021 19:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B334D1811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631727543;
	bh=Z/0ioOFwU+R3dNfdss7i2Y6pHjJpITUFT97xW+al4GY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K+4nRoF105xydCGzD+YcpNRDIsEPsXoIdLVz1BeLKAaQNEkQFOQKr9HET3HjURAn/
	 wy4m7V92RClEUdH1f/CBPv7SWSRhlJjlBAAvtzw6qLOGAC7RpCr0LTjXTz+Hr3w8b/
	 crMfLZb/flbHDUuIzotMM4gwEQ0WcczkAuFhSKCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 178EDF802E8;
	Wed, 15 Sep 2021 19:37:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1EC2F8027C; Wed, 15 Sep 2021 19:37:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7908F80132
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 19:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7908F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L+WjILJb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7DCF61101;
 Wed, 15 Sep 2021 17:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631727455;
 bh=Z/0ioOFwU+R3dNfdss7i2Y6pHjJpITUFT97xW+al4GY=;
 h=From:To:Cc:Subject:Date:From;
 b=L+WjILJbj0ZKuamWW2qWuBNdC3mSFXbKQbNiDcbu73HjdRY3CQdzJn9iOZ1p6wXIi
 2dTY606jIxM45/a5IJ9tPrqmm2Z9ranFQJab62PcIQA+lmv30N7wW5TC/JMTNop0mT
 66sxsD6G8ZN5drFxSXaDOSqhjal+5vIgzancI37sr3Kq6PRHs+ZxVqQ0hsn7Dp7hy3
 26aSAEUpu0fY+lXkBOpa5OKcFOMQTckmMqj476S1FidzDuW4tUSzK79Ufc6u26SEyU
 H7GkZemHAwMW51I0+4xP+DHAEAf5Wk6+WELhFIIo7TopDWKzL5iM4oaIIILUv9JXXW
 Lj/v+d6Gc5Chw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: amd: Convert to new style DAI format definitions
Date: Wed, 15 Sep 2021 18:35:35 +0100
Message-Id: <20210915173535.37794-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6100; h=from:subject;
 bh=Z/0ioOFwU+R3dNfdss7i2Y6pHjJpITUFT97xW+al4GY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQi3zqsZKjv8IDVSV6+Qxg/6YZMCPdxYh7KOL1cU+
 roEe+SaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUIt8wAKCRAk1otyXVSH0KAQB/
 4igAWUU31zRQIC9DogDJuDh6A8zK0F4rw6Gvh2yvQdIZ7QG0HF3KwkfMti+2cyW79adVDZXci2ZUuA
 ktilYMFz5aRDilJ13vgMx8WR6smJStwhYXmvQ2ZGz+ak4pd0teJhQg1A3de8q7kTiN4L/WiICpuw8y
 tjgRKnz51GyXo2wWbZgM4CtHwcUI/PSrcTuts0+Ppg8et6l5DXNYpoACkOvfyW5t68d6AENaMPN3CD
 BkJreU+0tjN6sP85nDX0Adoev5OV6dW4LT1xxLhpBpjeGOljFYRuwXyBGpdhzVhpopYLN3PsexIYv/
 Yu1u7WDKN+GkzTXo74Eaw+mzJLK5QE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
 sound/soc/amd/acp3x-rt5682-max9836.c |  6 +++---
 3 files changed, 15 insertions(+), 15 deletions(-)

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
index e561464f7d60..7af2bfdbf6d7 100644
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
-- 
2.20.1

