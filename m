Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFED59D320
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 10:12:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E9E01635;
	Tue, 23 Aug 2022 10:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E9E01635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661242330;
	bh=JfZ5OrN2Cv2GWc0P6I18xfPJKDWqu8L0EzftbRkl22k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iUAqw+5PHxrTxu8SsTgkQMs9ldrqkCopw/JXV/Pg7+cpVH27nyP6ffQuNGqGj+zkK
	 2Mixbr5aNsxI447ezIr8PG4HHqtygFeQ9/jmBagDSHo47yWcoZSjoMkDY0r7BMNyHF
	 Oc6r97Pf/WQL8WDgoth+U4ckycTVet6dWLozRmM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB14F8053D;
	Tue, 23 Aug 2022 10:10:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4616F8053D; Tue, 23 Aug 2022 10:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9080F80536
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 10:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9080F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="aifpKOrC"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="FerjczoS"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 46C8F5CEBF;
 Tue, 23 Aug 2022 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661242202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w92g0Jv73eux3p0n6c6YhvvYjDp6DPXsyERv4Tz9dWY=;
 b=aifpKOrCmx4FmF4MfFwhn88iR+HqZJ9/u4sQDcYdCtH/X2r9COmD9DzEcXauAMtMIyvrIQ
 1LLGpMUN7MqRw+BlU3B/4feUy6DjVPybmSqvOXvZdaEmuwyOe2zJ17wpoWUhLR/5f5SE5Z
 LxXuCIkYOlEqCHEH2bOJzaDv9znrnfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661242202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w92g0Jv73eux3p0n6c6YhvvYjDp6DPXsyERv4Tz9dWY=;
 b=FerjczoSgjCK8qxqZGW8BnzMbYK7aBfLPYzv68WqI78Joa6fjTrXlgojuVWVwnNu+IHwci
 XeMA8Epvn6k5/5DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2501013AE6;
 Tue, 23 Aug 2022 08:10:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UPAHCFqLBGMxTgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 08:10:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/5] ASoC: nau8821: Implement hw constraint for rates
Date: Tue, 23 Aug 2022 10:09:56 +0200
Message-Id: <20220823081000.2965-2-tiwai@suse.de>
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

nau8821 driver restricts the sample rate with over sampling rate, but
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
 sound/soc/codecs/nau8821.c | 66 +++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 2d21339932e6..4a72b94e8410 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -670,28 +670,40 @@ static const struct snd_soc_dapm_route nau8821_dapm_routes[] = {
 	{"HPOR", NULL, "Class G"},
 };
 
-static int nau8821_clock_check(struct nau8821 *nau8821,
-	int stream, int rate, int osr)
+static const struct nau8821_osr_attr *
+nau8821_get_osr(struct nau8821 *nau8821, int stream)
 {
-	int osrate = 0;
+	unsigned int osr;
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_read(nau8821->regmap, NAU8821_R2C_DAC_CTRL1, &osr);
+		osr &= NAU8821_DAC_OVERSAMPLE_MASK;
 		if (osr >= ARRAY_SIZE(osr_dac_sel))
-			return -EINVAL;
-		osrate = osr_dac_sel[osr].osr;
+			return NULL;
+		return &osr_dac_sel[osr];
 	} else {
+		regmap_read(nau8821->regmap, NAU8821_R2B_ADC_RATE, &osr);
+		osr &= NAU8821_ADC_SYNC_DOWN_MASK;
 		if (osr >= ARRAY_SIZE(osr_adc_sel))
-			return -EINVAL;
-		osrate = osr_adc_sel[osr].osr;
+			return NULL;
+		return &osr_adc_sel[osr];
 	}
+}
 
-	if (!osrate || rate * osrate > CLK_DA_AD_MAX) {
-		dev_err(nau8821->dev,
-			"exceed the maximum frequency of CLK_ADC or CLK_DAC");
+static int nau8821_dai_startup(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+	const struct nau8821_osr_attr *osr;
+
+	osr = nau8821_get_osr(nau8821, substream->stream);
+	if (!osr || !osr->osr)
 		return -EINVAL;
-	}
 
-	return 0;
+	return snd_pcm_hw_constraint_minmax(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_RATE,
+					    0, CLK_DA_AD_MAX / osr->osr);
 }
 
 static int nau8821_hw_params(struct snd_pcm_substream *substream,
@@ -699,7 +711,8 @@ static int nau8821_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
-	unsigned int val_len = 0, osr, ctrl_val, bclk_fs, clk_div;
+	unsigned int val_len = 0, ctrl_val, bclk_fs, clk_div;
+	const struct nau8821_osr_attr *osr;
 
 	nau8821->fs = params_rate(params);
 	/* CLK_DAC or CLK_ADC = OSR * FS
@@ -708,27 +721,19 @@ static int nau8821_hw_params(struct snd_pcm_substream *substream,
 	 * values must be selected such that the maximum frequency is less
 	 * than 6.144 MHz.
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		regmap_read(nau8821->regmap, NAU8821_R2C_DAC_CTRL1, &osr);
-		osr &= NAU8821_DAC_OVERSAMPLE_MASK;
-		if (nau8821_clock_check(nau8821, substream->stream,
-			nau8821->fs, osr)) {
-			return -EINVAL;
-		}
+	osr = nau8821_get_osr(nau8821, substream->stream);
+	if (!osr || !osr->osr)
+		return -EINVAL;
+	if (nau8821->fs * osr->osr > CLK_DA_AD_MAX)
+		return -EINVAL;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		regmap_update_bits(nau8821->regmap, NAU8821_R03_CLK_DIVIDER,
 			NAU8821_CLK_DAC_SRC_MASK,
-			osr_dac_sel[osr].clk_src << NAU8821_CLK_DAC_SRC_SFT);
-	} else {
-		regmap_read(nau8821->regmap, NAU8821_R2B_ADC_RATE, &osr);
-		osr &= NAU8821_ADC_SYNC_DOWN_MASK;
-		if (nau8821_clock_check(nau8821, substream->stream,
-			nau8821->fs, osr)) {
-			return -EINVAL;
-		}
+			osr->clk_src << NAU8821_CLK_DAC_SRC_SFT);
+	else
 		regmap_update_bits(nau8821->regmap, NAU8821_R03_CLK_DIVIDER,
 			NAU8821_CLK_ADC_SRC_MASK,
-			osr_adc_sel[osr].clk_src << NAU8821_CLK_ADC_SRC_SFT);
-	}
+			osr->clk_src << NAU8821_CLK_ADC_SRC_SFT);
 
 	/* make BCLK and LRC divde configuration if the codec as master. */
 	regmap_read(nau8821->regmap, NAU8821_R1D_I2S_PCM_CTRL2, &ctrl_val);
@@ -843,6 +848,7 @@ static int nau8821_digital_mute(struct snd_soc_dai *dai, int mute,
 }
 
 static const struct snd_soc_dai_ops nau8821_dai_ops = {
+	.startup = nau8821_dai_startup,
 	.hw_params = nau8821_hw_params,
 	.set_fmt = nau8821_set_dai_fmt,
 	.mute_stream = nau8821_digital_mute,
-- 
2.35.3

