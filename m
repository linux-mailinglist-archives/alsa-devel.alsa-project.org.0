Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 484D659D31C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 10:11:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB4DF3E;
	Tue, 23 Aug 2022 10:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB4DF3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661242270;
	bh=CpJA1pTgAaVGrHPOf7GI6aqMPV1GFwVKpa+x8QcC2cU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CUNkD0ezLZAFaKYZxJ15b8bRtr2uC5sGfz9/aGJCvIr1OJEvnnn6Yq/ANJNA/Suvw
	 wDlQPKzXHecxCPbHgPX03y4MYQEQkOtC7KBqjJTxmJAaQmIuueo4RU6gU3cTgffO/s
	 6kp322WnoK6fg3SSv4bGXBt/QDZt4z3puj6+Ba9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D913F8030F;
	Tue, 23 Aug 2022 10:10:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA22BF804E6; Tue, 23 Aug 2022 10:10:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46E11F80152
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 10:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46E11F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="v8TYlN/Q"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Y7ccPsB8"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B58C8340E9;
 Tue, 23 Aug 2022 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661242202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p0AIX3UvBfcUEXB8VClmLOWcWPfET+Zw+fPv/d/vLD4=;
 b=v8TYlN/Q0CdGsTUMKeATcRSGgqDLj+eXlPdS905g96LnJNGnf6Eh4hlSPgB26hjBeHWO/3
 V8Zwm3r9mZQieIsTkjUeYUuVz7aRBxr2iPjo7weghxfhsuligbbL/PVzuZq2nPpVCJLS49
 CxDshkvHDos7u+9UBb7VhOnsNrbYkaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661242202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p0AIX3UvBfcUEXB8VClmLOWcWPfET+Zw+fPv/d/vLD4=;
 b=Y7ccPsB8yZrzE5u7y/Z8bb3ZX7iRPaX1W/9JdD4/O/GpYhfVUk5XAjTe0bWVYemWdLp46A
 +qy1qxgnnUMLS9AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 91B7513AE9;
 Tue, 23 Aug 2022 08:10:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UMHVIlqLBGMxTgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 08:10:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/5] ASoC: nau8825: Implement hw constraint for rates
Date: Tue, 23 Aug 2022 10:09:59 +0200
Message-Id: <20220823081000.2965-5-tiwai@suse.de>
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

nau8825 driver restricts the sample rate with over sampling rate, but
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
 sound/soc/codecs/nau8825.c | 83 +++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 54ef7b0fa878..8213273f501e 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1247,27 +1247,42 @@ static const struct snd_soc_dapm_route nau8825_dapm_routes[] = {
 	{"HPOR", NULL, "Class G"},
 };
 
-static int nau8825_clock_check(struct nau8825 *nau8825,
-	int stream, int rate, int osr)
+static const struct nau8825_osr_attr *
+nau8825_get_osr(struct nau8825 *nau8825, int stream)
 {
-	int osrate;
+	unsigned int osr;
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_read(nau8825->regmap,
+			    NAU8825_REG_DAC_CTRL1, &osr);
+		osr &= NAU8825_DAC_OVERSAMPLE_MASK;
 		if (osr >= ARRAY_SIZE(osr_dac_sel))
-			return -EINVAL;
-		osrate = osr_dac_sel[osr].osr;
+			return NULL;
+		return &osr_dac_sel[osr];
 	} else {
+		regmap_read(nau8825->regmap,
+			    NAU8825_REG_ADC_RATE, &osr);
+		osr &= NAU8825_ADC_SYNC_DOWN_MASK;
 		if (osr >= ARRAY_SIZE(osr_adc_sel))
-			return -EINVAL;
-		osrate = osr_adc_sel[osr].osr;
+			return NULL;
+		return &osr_adc_sel[osr];
 	}
+}
 
-	if (!osrate || rate * osr > CLK_DA_AD_MAX) {
-		dev_err(nau8825->dev, "exceed the maximum frequency of CLK_ADC or CLK_DAC\n");
+static int nau8825_dai_startup(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
+	const struct nau8825_osr_attr *osr;
+
+	osr = nau8825_get_osr(nau8825, substream->stream);
+	if (!osr || !osr->osr)
 		return -EINVAL;
-	}
 
-	return 0;
+	return snd_pcm_hw_constraint_minmax(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_RATE,
+					    0, CLK_DA_AD_MAX / osr->osr);
 }
 
 static int nau8825_hw_params(struct snd_pcm_substream *substream,
@@ -1276,7 +1291,9 @@ static int nau8825_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
-	unsigned int val_len = 0, osr, ctrl_val, bclk_fs, bclk_div;
+	unsigned int val_len = 0, ctrl_val, bclk_fs, bclk_div;
+	const struct nau8825_osr_attr *osr;
+	int err = -EINVAL;
 
 	nau8825_sema_acquire(nau8825, 3 * HZ);
 
@@ -1286,29 +1303,19 @@ static int nau8825_hw_params(struct snd_pcm_substream *substream,
 	 * values must be selected such that the maximum frequency is less
 	 * than 6.144 MHz.
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		regmap_read(nau8825->regmap, NAU8825_REG_DAC_CTRL1, &osr);
-		osr &= NAU8825_DAC_OVERSAMPLE_MASK;
-		if (nau8825_clock_check(nau8825, substream->stream,
-			params_rate(params), osr)) {
-			nau8825_sema_release(nau8825);
-			return -EINVAL;
-		}
+	osr = nau8825_get_osr(nau8825, substream->stream);
+	if (!osr || !osr->osr)
+		goto error;
+	if (params_rate(params) * osr->osr > CLK_DA_AD_MAX)
+		goto error;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		regmap_update_bits(nau8825->regmap, NAU8825_REG_CLK_DIVIDER,
 			NAU8825_CLK_DAC_SRC_MASK,
-			osr_dac_sel[osr].clk_src << NAU8825_CLK_DAC_SRC_SFT);
-	} else {
-		regmap_read(nau8825->regmap, NAU8825_REG_ADC_RATE, &osr);
-		osr &= NAU8825_ADC_SYNC_DOWN_MASK;
-		if (nau8825_clock_check(nau8825, substream->stream,
-			params_rate(params), osr)) {
-			nau8825_sema_release(nau8825);
-			return -EINVAL;
-		}
+			osr->clk_src << NAU8825_CLK_DAC_SRC_SFT);
+	else
 		regmap_update_bits(nau8825->regmap, NAU8825_REG_CLK_DIVIDER,
 			NAU8825_CLK_ADC_SRC_MASK,
-			osr_adc_sel[osr].clk_src << NAU8825_CLK_ADC_SRC_SFT);
-	}
+			osr->clk_src << NAU8825_CLK_ADC_SRC_SFT);
 
 	/* make BCLK and LRC divde configuration if the codec as master. */
 	regmap_read(nau8825->regmap, NAU8825_REG_I2S_PCM_CTRL2, &ctrl_val);
@@ -1321,10 +1328,8 @@ static int nau8825_hw_params(struct snd_pcm_substream *substream,
 			bclk_div = 1;
 		else if (bclk_fs <= 128)
 			bclk_div = 0;
-		else {
-			nau8825_sema_release(nau8825);
-			return -EINVAL;
-		}
+		else
+			goto error;
 		regmap_update_bits(nau8825->regmap, NAU8825_REG_I2S_PCM_CTRL2,
 			NAU8825_I2S_LRC_DIV_MASK | NAU8825_I2S_BLK_DIV_MASK,
 			((bclk_div + 1) << NAU8825_I2S_LRC_DIV_SFT) | bclk_div);
@@ -1344,17 +1349,18 @@ static int nau8825_hw_params(struct snd_pcm_substream *substream,
 		val_len |= NAU8825_I2S_DL_32;
 		break;
 	default:
-		nau8825_sema_release(nau8825);
-		return -EINVAL;
+		goto error;
 	}
 
 	regmap_update_bits(nau8825->regmap, NAU8825_REG_I2S_PCM_CTRL1,
 		NAU8825_I2S_DL_MASK, val_len);
+	err = 0;
 
+ error:
 	/* Release the semaphore. */
 	nau8825_sema_release(nau8825);
 
-	return 0;
+	return err;
 }
 
 static int nau8825_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
@@ -1420,6 +1426,7 @@ static int nau8825_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 }
 
 static const struct snd_soc_dai_ops nau8825_dai_ops = {
+	.startup	= nau8825_dai_startup,
 	.hw_params	= nau8825_hw_params,
 	.set_fmt	= nau8825_set_dai_fmt,
 };
-- 
2.35.3

