Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0357C258B
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 18:57:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BD951668;
	Mon, 30 Sep 2019 18:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BD951668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569862631;
	bh=6RDl5XAy0Wbiz08aGqjeZLwnrwE2+mVTkIFSCTxyx5o=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FQk/gJFlb0H151DpXiVv+WyKkRzjaiUfUSdljERooDMnQeCEO9h9GBEPyqtUcSD7u
	 VyY1tEXuexgOihDokD6WP4ZC+eSQaCAlkwDfqASR6+I0Itq43TNI6OpuxcWkzsliSv
	 +Pd/Zwr3rY3KsQxRTRa8LszJLKHvapU3CWp9seiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16EC5F80639;
	Mon, 30 Sep 2019 18:51:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2745F805FA; Mon, 30 Sep 2019 18:51:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB9D4F80528
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 18:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB9D4F80528
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iEytZ-0004A0-1u; Mon, 30 Sep 2019 17:51:33 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iEytY-0002mf-OS; Mon, 30 Sep 2019 17:51:32 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Date: Mon, 30 Sep 2019 17:51:24 +0100
Message-Id: <20190930165130.10642-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Cc: linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: [alsa-devel] [PATCH v3 1/7] ASoC: tegra: add a TDM configuration
	callback
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

Add a callback to configure TDM settings for the Tegra30 I2S ASoC 'platform'
driver.

Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
[ben.dooks@codethink.co.uk: merge fix for power management]
[ben.dooks@codethink.co.uk: add review change for fsync of 1 clock]
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/soc/tegra/tegra30_i2s.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index ac6983c6bd72..7f9ef6abeae2 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -254,6 +254,38 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+/*
+ * Set up TDM
+ */
+static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
+			       unsigned int tx_mask, unsigned int rx_mask,
+			       int slots, int slot_width)
+{
+	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	unsigned int mask, val;
+
+	dev_dbg(dai->dev, "%s: txmask=0x%08x rxmask=0x%08x slots=%d width=%d\n",
+		 __func__, tx_mask, rx_mask, slots, slot_width);
+
+	/* Set up slots and tx/rx masks */
+	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
+	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
+	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
+
+	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
+	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
+	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
+
+	pm_runtime_get_sync(dai->dev);
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
+	// set the fsync width to minimum of 1 clock width
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
+			   TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK, 0x0);
+	pm_runtime_put(dai->dev);
+
+	return 0;
+}
+
 static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 {
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -268,6 +300,7 @@ static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
 	.set_fmt	= tegra30_i2s_set_fmt,
 	.hw_params	= tegra30_i2s_hw_params,
 	.trigger	= tegra30_i2s_trigger,
+	.set_tdm_slot	= tegra30_i2s_set_tdm,
 };
 
 static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
