Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF98190897
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 10:12:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB6691655;
	Tue, 24 Mar 2020 10:11:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB6691655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585041143;
	bh=Qn845Yl6tTZk1kz7s+fGTqMh6JS6MnZxcGBAy8fC3Yw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gHHG3+9dQxDh3ZA5qBh/J73OteupkGlN5GR1JNSnlxVD6oBy9Zzw9sDgyfTAyNpoD
	 +WebZXbbi/qmIlA9bEdpkah27stb96HyF8kP0lSrMB5GR1SoOupxQSsGOWAlYiROLJ
	 ulwLpITRRtKTm9J/5UngFGt6JYzCPdAURAByQ+TM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE0D4F800B9;
	Tue, 24 Mar 2020 10:10:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44B0BF800B9; Tue, 24 Mar 2020 10:10:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_SOFTFAIL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from pecan2.exetel.com.au (pecan2-mail.exetel.com.au [220.233.0.71])
 by alsa1.perex.cz (Postfix) with ESMTP id 6A062F800B9
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 10:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A062F800B9
Received: from 41.68.233.220.static.exetel.com.au ([220.233.68.41]
 helo=localhost.localdomain)
 by pecan2.exetel.com.au with esmtp (Exim 4.91)
 (envelope-from <flatmax@flatmax.org>)
 id 1jGfZc-0000Zd-ME; Tue, 24 Mar 2020 20:10:12 +1100
From: Matt Flax <flatmax@flatmax.org>
To: 
Subject: [PATCH] ASoC: bcm2835-i2s: substream alignment now independent in
 hwparams
Date: Tue, 24 Mar 2020 20:08:21 +1100
Message-Id: <20200324090823.20754-1-flatmax@flatmax.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kate Stewart <kstewart@linuxfoundation.org>, alsa-devel@alsa-project.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 Scott Branden <sbranden@broadcom.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Matt Flax <flatmax@flatmax.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
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

Substream sample alignment was being set in hwparams for both
substreams at the same time. This became a problem when	the Audio
Injector isolated sound card needed to offset sample alignment
for high sample	rates. The latency difference between playback
and capture occurs because of the digital isolation chip
propagation time, particularly when the codec is master and
the DAC return is twice delayed.

This patch sets sample alignment registers  based on the substream
direction in hwparams. This gives the machine driver more control
over sample alignment in the bcm2835 i2s driver.

Signed-off-by: Matt Flax <flatmax@flatmax.org>
---
 sound/soc/bcm/bcm2835-i2s.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index e6a12e271b07..9db542699a13 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -493,11 +493,6 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	bcm2835_i2s_calc_channel_pos(&rx_ch1_pos, &rx_ch2_pos,
-		rx_mask, slot_width, data_delay, odd_slot_offset);
-	bcm2835_i2s_calc_channel_pos(&tx_ch1_pos, &tx_ch2_pos,
-		tx_mask, slot_width, data_delay, odd_slot_offset);
-
 	/*
 	 * Transmitting data immediately after frame start, eg
 	 * in left-justified or DSP mode A, only works stable
@@ -508,19 +503,26 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
 			"Unstable slave config detected, L/R may be swapped");
 
 	/*
-	 * Set format for both streams.
-	 * We cannot set another frame length
-	 * (and therefore word length) anyway,
-	 * so the format will be the same.
+	 * Set format on a per stream basis.
+	 * The alignment format can be different depending on direction.
 	 */
-	regmap_write(dev->i2s_regmap, BCM2835_I2S_RXC_A_REG, 
-		  format
-		| BCM2835_I2S_CH1_POS(rx_ch1_pos)
-		| BCM2835_I2S_CH2_POS(rx_ch2_pos));
-	regmap_write(dev->i2s_regmap, BCM2835_I2S_TXC_A_REG, 
-		  format
-		| BCM2835_I2S_CH1_POS(tx_ch1_pos)
-		| BCM2835_I2S_CH2_POS(tx_ch2_pos));
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		bcm2835_i2s_calc_channel_pos(&rx_ch1_pos, &rx_ch2_pos,
+			rx_mask, slot_width, data_delay, odd_slot_offset);
+		regmap_write(dev->i2s_regmap, BCM2835_I2S_RXC_A_REG,
+			  format
+			| BCM2835_I2S_CH1_POS(rx_ch1_pos)
+			| BCM2835_I2S_CH2_POS(rx_ch2_pos));
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		bcm2835_i2s_calc_channel_pos(&tx_ch1_pos, &tx_ch2_pos,
+			tx_mask, slot_width, data_delay, odd_slot_offset);
+		regmap_write(dev->i2s_regmap, BCM2835_I2S_TXC_A_REG,
+			  format
+			| BCM2835_I2S_CH1_POS(tx_ch1_pos)
+			| BCM2835_I2S_CH2_POS(tx_ch2_pos));
+	}
 
 	/* Setup the I2S mode */
 
-- 
2.20.1

