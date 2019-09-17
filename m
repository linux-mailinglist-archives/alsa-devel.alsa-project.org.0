Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89050B5534
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 20:18:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21BE91686;
	Tue, 17 Sep 2019 20:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21BE91686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568744339;
	bh=cFbdCkyQH2+6QnBJXMGvCKifMZT6JuqI55TIp05KwCk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ruXJgo+inpvf8YLT97ZZ0lHlFkjzMH6jalIZc+1BaYA8T9WCJElEUMSmYVijhoyiD
	 W7EY4xq5zIoihMPO46Hy1pUmSoGJUUvwz2fkzzySIY35IOAXsKC/QU/ucW3+g8qBqk
	 cd4F5FqxhD1sPOpTpYDBKn4M6YwM9Jh+JCkSjQJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFEAAF80649;
	Tue, 17 Sep 2019 20:12:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2942F8048E; Tue, 17 Sep 2019 20:12:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E79F5F804FE
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 20:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E79F5F804FE
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iAHxq-0003oE-Mi; Tue, 17 Sep 2019 19:12:34 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iAHxq-0000BH-8M; Tue, 17 Sep 2019 19:12:34 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Date: Tue, 17 Sep 2019 19:12:27 +0100
Message-Id: <20190917181233.534-3-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917181233.534-1-ben.dooks@codethink.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: [alsa-devel] [PATCH 2/8] ASoC: tegra: Allow 24bit and 32bit samples
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Edward Cragg <edward.cragg@codethink.co.uk>

The tegra3 audio can support 24 and 32 bit sample sizes so add the
 option to the tegra30_i2s_hw_params to configure the S24_LE or
 S32_LE formats when requested.

Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
[ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
[ben.dooks@codethink.co.uk: add pm calls around ytdm config]
[ben.dooks@codethink.co.uk: remove debug prints]
---
squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code

ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
---
 sound/soc/tegra/tegra30_i2s.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index d36b4662b420..b5372839f672 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct device *dev = dai->dev;
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask, val, reg;
-	int ret, sample_size, srate, i2sclock, bitcnt;
+	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
 	struct tegra30_ahub_cif_conf cif_conf;
 
 	if (params_channels(params) != 2)
@@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
+		audio_bits = TEGRA30_AUDIOCIF_BITS_16;
 		sample_size = 16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
+		audio_bits = TEGRA30_AUDIOCIF_BITS_24;
+		sample_size = 24;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
+		audio_bits = TEGRA30_AUDIOCIF_BITS_32;
+		sample_size = 32;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	cif_conf.threshold = 0;
 	cif_conf.audio_channels = 2;
 	cif_conf.client_channels = 2;
-	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
-	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
+	cif_conf.audio_bits = audio_bits;
+	cif_conf.client_bits = audio_bits;
 	cif_conf.expand = 0;
 	cif_conf.stereo_conv = 0;
 	cif_conf.replicate = 0;
@@ -264,10 +275,6 @@ static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask = 0, val = 0;
 
-	dev_info(dai->dev, "%s: setting TDM: tx_mask: 0x%08x rx_mask: 0x%08x "
-		 "slots: 0x%08x " "width: %d\n",
-		 __func__, tx_mask, rx_mask, slots, slot_width);
-
 	/* Set up slots and tx/rx masks */
 	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
 	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
@@ -277,6 +284,8 @@ static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
 	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
 	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
 
+	pm_runtime_get_sync(dai->dev);
+
 	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
 
 	/* Set FSYNC width */
@@ -284,6 +293,7 @@ static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
 		TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK,
 		(slot_width - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
 
+	pm_runtime_put(dai->dev);
 	return 0;
 }
 
@@ -311,14 +321,18 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SNDRV_PCM_FMTBIT_S32_LE |
+			   SNDRV_PCM_FMTBIT_S24_LE |
+			   SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.capture = {
 		.stream_name = "Capture",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SNDRV_PCM_FMTBIT_S32_LE |
+			   SNDRV_PCM_FMTBIT_S24_LE |
+			   SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.ops = &tegra30_i2s_dai_ops,
 	.symmetric_rates = 1,
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
