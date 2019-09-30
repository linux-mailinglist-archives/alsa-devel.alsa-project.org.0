Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE500C257E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 18:54:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 772D21660;
	Mon, 30 Sep 2019 18:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 772D21660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569862451;
	bh=ehufgTXxYYYAL7GHyjFzFgKQhxkKDJLinCC9f9wQ72M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SMqJ2b54LycEbGmTRJPtwuaIbdz8LzScbt8xcpfUd9OC0CYEX8Ck8XueUV1I5wTb6
	 2R3zhyw6fmM8KQASFlDzCr6PVSN8prcwdhS0RLh/En5OK633MJ6aC/zB6cZb/HC4+S
	 VSFDrwRlpiq/o783bFIonUcvRu3PcwsuZBazCdgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F324F805E1;
	Mon, 30 Sep 2019 18:51:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01A57F803F3; Mon, 30 Sep 2019 18:51:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABF03F80391
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 18:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABF03F80391
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iEytZ-0004A6-7P; Mon, 30 Sep 2019 17:51:33 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iEytY-0002mu-Th; Mon, 30 Sep 2019 17:51:32 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Date: Mon, 30 Sep 2019 17:51:29 +0100
Message-Id: <20190930165130.10642-7-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Cc: linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [alsa-devel] [PATCH v3 6/7] ASoC: tegra: config fifos on hw_param
	changes
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

If the hw_params uses a different bit or channel count, then we
need to change both the I2S unit's CIF configuration as well as
the APBIF one.

To allow changing the APBIF, add a call to reconfigure the RX or
TX FIFO without changing the DMA or allocation, and get the I2S
driver to call it once the hw params have been calculate.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/soc/tegra/tegra30_ahub.c | 114 ++++++++++++++++++---------------
 sound/soc/tegra/tegra30_ahub.h |   5 ++
 sound/soc/tegra/tegra30_i2s.c  |   2 +
 3 files changed, 69 insertions(+), 52 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 952381260dc3..58e05ceb86da 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -84,12 +84,40 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 	return 0;
 }
 
+int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
+			       struct tegra30_ahub_cif_conf *cif_conf)
+{
+	int channel = rxcif - TEGRA30_AHUB_RXCIF_APBIF_RX0;
+	u32 reg, val;
+
+	pm_runtime_get_sync(ahub->dev);
+
+	reg = TEGRA30_AHUB_CHANNEL_CTRL +
+	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
+	val = tegra30_apbif_read(reg);
+	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
+		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
+	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
+	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
+	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
+	tegra30_apbif_write(reg, val);
+
+	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
+
+	reg = TEGRA30_AHUB_CIF_RX_CTRL +
+	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
+	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, cif_conf);
+
+	pm_runtime_put(ahub->dev);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra30_ahub_setup_rx_fifo);
+
 int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
 				  char *dmachan, int dmachan_len,
 				  dma_addr_t *fiforeg)
 {
 	int channel;
-	u32 reg, val;
 	struct tegra30_ahub_cif_conf cif_conf;
 
 	channel = find_first_zero_bit(ahub->rx_usage,
@@ -104,37 +132,14 @@ int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
 	*fiforeg = ahub->apbif_addr + TEGRA30_AHUB_CHANNEL_RXFIFO +
 		   (channel * TEGRA30_AHUB_CHANNEL_RXFIFO_STRIDE);
 
-	pm_runtime_get_sync(ahub->dev);
+	memset(&cif_conf, 0, sizeof(cif_conf));
 
-	reg = TEGRA30_AHUB_CHANNEL_CTRL +
-	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
-	val = tegra30_apbif_read(reg);
-	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
-		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
-	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
-	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
-	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
-	tegra30_apbif_write(reg, val);
-
-	cif_conf.threshold = 0;
 	cif_conf.audio_channels = 2;
 	cif_conf.client_channels = 2;
 	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
 	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
-	cif_conf.expand = 0;
-	cif_conf.stereo_conv = 0;
-	cif_conf.replicate = 0;
-	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
-	cif_conf.truncate = 0;
-	cif_conf.mono_conv = 0;
-
-	reg = TEGRA30_AHUB_CIF_RX_CTRL +
-	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
-	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
-
-	pm_runtime_put(ahub->dev);
 
-	return 0;
+	return tegra30_ahub_setup_rx_fifo(*rxcif, &cif_conf);
 }
 EXPORT_SYMBOL_GPL(tegra30_ahub_allocate_rx_fifo);
 
@@ -186,12 +191,40 @@ int tegra30_ahub_free_rx_fifo(enum tegra30_ahub_rxcif rxcif)
 }
 EXPORT_SYMBOL_GPL(tegra30_ahub_free_rx_fifo);
 
+int tegra30_ahub_setup_tx_fifo(enum tegra30_ahub_txcif txcif,
+			       struct tegra30_ahub_cif_conf *cif_conf)
+{
+	int channel = txcif - TEGRA30_AHUB_TXCIF_APBIF_TX0;
+	u32 reg, val;
+
+	pm_runtime_get_sync(ahub->dev);
+
+	reg = TEGRA30_AHUB_CHANNEL_CTRL +
+	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
+	val = tegra30_apbif_read(reg);
+	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_MASK |
+		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK);
+	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT) |
+	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN |
+	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
+	tegra30_apbif_write(reg, val);
+
+	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
+
+	reg = TEGRA30_AHUB_CIF_TX_CTRL +
+	      (channel * TEGRA30_AHUB_CIF_TX_CTRL_STRIDE);
+	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, cif_conf);
+
+	pm_runtime_put(ahub->dev);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra30_ahub_setup_tx_fifo);
+
 int tegra30_ahub_allocate_tx_fifo(enum tegra30_ahub_txcif *txcif,
 				  char *dmachan, int dmachan_len,
 				  dma_addr_t *fiforeg)
 {
 	int channel;
-	u32 reg, val;
 	struct tegra30_ahub_cif_conf cif_conf;
 
 	channel = find_first_zero_bit(ahub->tx_usage,
@@ -206,37 +239,14 @@ int tegra30_ahub_allocate_tx_fifo(enum tegra30_ahub_txcif *txcif,
 	*fiforeg = ahub->apbif_addr + TEGRA30_AHUB_CHANNEL_TXFIFO +
 		   (channel * TEGRA30_AHUB_CHANNEL_TXFIFO_STRIDE);
 
-	pm_runtime_get_sync(ahub->dev);
-
-	reg = TEGRA30_AHUB_CHANNEL_CTRL +
-	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
-	val = tegra30_apbif_read(reg);
-	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_MASK |
-		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK);
-	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT) |
-	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN |
-	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
-	tegra30_apbif_write(reg, val);
-
-	cif_conf.threshold = 0;
+	memset(&cif_conf, 0, sizeof(cif_conf));
 	cif_conf.audio_channels = 2;
 	cif_conf.client_channels = 2;
 	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
 	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
-	cif_conf.expand = 0;
-	cif_conf.stereo_conv = 0;
-	cif_conf.replicate = 0;
 	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
-	cif_conf.truncate = 0;
-	cif_conf.mono_conv = 0;
-
-	reg = TEGRA30_AHUB_CIF_TX_CTRL +
-	      (channel * TEGRA30_AHUB_CIF_TX_CTRL_STRIDE);
-	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
 
-	pm_runtime_put(ahub->dev);
-
-	return 0;
+	return tegra30_ahub_setup_tx_fifo(*txcif, &cif_conf);
 }
 EXPORT_SYMBOL_GPL(tegra30_ahub_allocate_tx_fifo);
 
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index 6889c5f23d02..26120aee64b3 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -490,6 +490,11 @@ void tegra30_ahub_set_cif(struct regmap *regmap, unsigned int reg,
 void tegra124_ahub_set_cif(struct regmap *regmap, unsigned int reg,
 			   struct tegra30_ahub_cif_conf *conf);
 
+extern int tegra30_ahub_setup_tx_fifo(enum tegra30_ahub_txcif txcif,
+				      struct tegra30_ahub_cif_conf *cif_conf);
+extern int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif,
+				      struct tegra30_ahub_cif_conf *cif_conf);
+
 struct tegra30_ahub_soc_data {
 	u32 mod_list_mask;
 	void (*set_audio_cif)(struct regmap *regmap,
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index a03692b0afc3..19ac49df6cc8 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -202,9 +202,11 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
+		tegra30_ahub_setup_tx_fifo(i2s->playback_fifo_cif, &cif_conf);
 		reg = TEGRA30_I2S_CIF_RX_CTRL;
 	} else {
 		cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
+		tegra30_ahub_setup_rx_fifo(i2s->capture_fifo_cif, &cif_conf);
 		reg = TEGRA30_I2S_CIF_TX_CTRL;
 	}
 
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
