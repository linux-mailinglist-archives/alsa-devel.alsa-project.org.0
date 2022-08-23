Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE859D322
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 10:12:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A09D1654;
	Tue, 23 Aug 2022 10:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A09D1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661242365;
	bh=FLhFl8VesE2JDedrDmBe2Fs2+SkpH1O45pvkS+qMG7g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rGtKfClchLQLF7J+8oFKvhh3DES336pWUv1Ulj/Dtfr5y0ICVNw0tioDEQMGGRnZk
	 +XBqE7Ix943F+Qv4Wl12TZsoD5iw+xVHuxndq0Yc1jGrs/9D29zDP9nUJgmG8S8H8d
	 hFXBOLwR1qplezbkLOnRU727FAPOdwhlcw+s4RVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F63F80553;
	Tue, 23 Aug 2022 10:10:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08032F80552; Tue, 23 Aug 2022 10:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13296F80537
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 10:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13296F80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ry6kUlix"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="4RbAp2as"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9E4525CEC1;
 Tue, 23 Aug 2022 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661242202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s5x8a1jguGix2BDGQTdhmoqBOFYAWHDflgHLmM3WPUA=;
 b=ry6kUlixkwhMr6Rc8xhJcTtF5NHvgmqAXlcpMZ3IXf5zHaaawLnYeiUxECFqKE79mlV64D
 J3fswiQmEhz/OC1ODxNIsuKdSOYhA2Dd9Mmj4kdhMjW93aL3XVpi+FF7B32IQTmi3JGZO6
 SiWud4QW58H1unelpUCMd/qGaeEkiPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661242202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s5x8a1jguGix2BDGQTdhmoqBOFYAWHDflgHLmM3WPUA=;
 b=4RbAp2as2HGq0/w+GMqrUc9LoEf8vDzUhrIAM1QXOBvPNaRNvtFldQJTtpePooN5nXMD7P
 XtKguC9SQl2r3lCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71D6513AE6;
 Tue, 23 Aug 2022 08:10:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GF8JG1qLBGMxTgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 08:10:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/5] ASoC: nau8824: Implement hw constraint for rates
Date: Tue, 23 Aug 2022 10:09:58 +0200
Message-Id: <20220823081000.2965-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220823081000.2965-1-tiwai@suse.de>
References: <20220823081000.2965-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

nau8824 driver restricts the sample rate with over sampling rate, but
currently it barely bails out at hw_params with -EINVAL error (with a
kernel message); this doesn't help for user-space to recognize which
rate can be actually used.

This patch introduces the proper hw constraint for adjusting the
available range of the sample rate depending on the OSR setup, as well
as some code cleanup, for improving the communication with
user-space.  Now applications can know the valid rate beforehand and
reduces the rate appropriately without errors.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/nau8824.c | 67 +++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 10bdfebe92d5..15596452ca37 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1014,27 +1014,42 @@ static irqreturn_t nau8824_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int nau8824_clock_check(struct nau8824 *nau8824,
-	int stream, int rate, int osr)
+static const struct nau8824_osr_attr *
+nau8824_get_osr(struct nau8824 *nau8824, int stream)
 {
-	int osrate;
+	unsigned int osr;
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_read(nau8824->regmap,
+			    NAU8824_REG_DAC_FILTER_CTRL_1, &osr);
+		osr &= NAU8824_DAC_OVERSAMPLE_MASK;
 		if (osr >= ARRAY_SIZE(osr_dac_sel))
-			return -EINVAL;
-		osrate = osr_dac_sel[osr].osr;
+			return NULL;
+		return &osr_dac_sel[osr];
 	} else {
+		regmap_read(nau8824->regmap,
+			    NAU8824_REG_ADC_FILTER_CTRL, &osr);
+		osr &= NAU8824_ADC_SYNC_DOWN_MASK;
 		if (osr >= ARRAY_SIZE(osr_adc_sel))
-			return -EINVAL;
-		osrate = osr_adc_sel[osr].osr;
+			return NULL;
+		return &osr_adc_sel[osr];
 	}
+}
 
-	if (!osrate || rate * osr > CLK_DA_AD_MAX) {
-		dev_err(nau8824->dev, "exceed the maximum frequency of CLK_ADC or CLK_DAC\n");
+static int nau8824_dai_startup(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
+	const struct nau8824_osr_attr *osr;
+
+	osr = nau8824_get_osr(nau8824, substream->stream);
+	if (!osr || !osr->osr)
 		return -EINVAL;
-	}
 
-	return 0;
+	return snd_pcm_hw_constraint_minmax(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_RATE,
+					    0, CLK_DA_AD_MAX / osr->osr);
 }
 
 static int nau8824_hw_params(struct snd_pcm_substream *substream,
@@ -1042,7 +1057,8 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
-	unsigned int val_len = 0, osr, ctrl_val, bclk_fs, bclk_div;
+	unsigned int val_len = 0, ctrl_val, bclk_fs, bclk_div;
+	const struct nau8824_osr_attr *osr;
 	int err = -EINVAL;
 
 	nau8824_sema_acquire(nau8824, HZ);
@@ -1054,27 +1070,19 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
 	 * than 6.144 MHz.
 	 */
 	nau8824->fs = params_rate(params);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		regmap_read(nau8824->regmap,
-			NAU8824_REG_DAC_FILTER_CTRL_1, &osr);
-		osr &= NAU8824_DAC_OVERSAMPLE_MASK;
-		if (nau8824_clock_check(nau8824, substream->stream,
-			nau8824->fs, osr))
-			goto error;
+	osr = nau8824_get_osr(nau8824, substream->stream);
+	if (!osr || !osr->osr)
+		goto error;
+	if (nau8824->fs * osr->osr > CLK_DA_AD_MAX)
+		goto error;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		regmap_update_bits(nau8824->regmap, NAU8824_REG_CLK_DIVIDER,
 			NAU8824_CLK_DAC_SRC_MASK,
-			osr_dac_sel[osr].clk_src << NAU8824_CLK_DAC_SRC_SFT);
-	} else {
-		regmap_read(nau8824->regmap,
-			NAU8824_REG_ADC_FILTER_CTRL, &osr);
-		osr &= NAU8824_ADC_SYNC_DOWN_MASK;
-		if (nau8824_clock_check(nau8824, substream->stream,
-			nau8824->fs, osr))
-			goto error;
+			osr->clk_src << NAU8824_CLK_DAC_SRC_SFT);
+	else
 		regmap_update_bits(nau8824->regmap, NAU8824_REG_CLK_DIVIDER,
 			NAU8824_CLK_ADC_SRC_MASK,
-			osr_adc_sel[osr].clk_src << NAU8824_CLK_ADC_SRC_SFT);
-	}
+			osr->clk_src << NAU8824_CLK_ADC_SRC_SFT);
 
 	/* make BCLK and LRC divde configuration if the codec as master. */
 	regmap_read(nau8824->regmap,
@@ -1550,6 +1558,7 @@ static const struct snd_soc_component_driver nau8824_component_driver = {
 };
 
 static const struct snd_soc_dai_ops nau8824_dai_ops = {
+	.startup = nau8824_dai_startup,
 	.hw_params = nau8824_hw_params,
 	.set_fmt = nau8824_set_fmt,
 	.set_tdm_slot = nau8824_set_tdm_slot,
-- 
2.35.3

