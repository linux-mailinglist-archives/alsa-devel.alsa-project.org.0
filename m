Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F1D59D321
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 10:12:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A94741675;
	Tue, 23 Aug 2022 10:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A94741675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661242350;
	bh=fq9WYUUWHFBGPAzI2xA8LS5PXHGKT3r1BU38qAzwD3g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nAd6VlLwXiG3fOHJOKevCqAyXNC9LtsJlOZH/jekrgKQ/kITp73gBVXjjG5fjG0Aj
	 IypqDPqwgmrSB3x5dEoJ83juWRf25EQIvIEUpqhFl4qgFwZcdbcT9Znn0nuBnc/rDu
	 NV3oOzdoFSFkm4boTHYsEY4HURWK9Dy19FLe3oPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06965F8054A;
	Tue, 23 Aug 2022 10:10:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A352F8053B; Tue, 23 Aug 2022 10:10:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3602F80535
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 10:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3602F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="UfecQ5rY"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="0+WbgpGR"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 71B305CEC0;
 Tue, 23 Aug 2022 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661242202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XxiV2xZWWbURF04dpsPSk3ndlD6jZgDnSJrKi8B+5MU=;
 b=UfecQ5rYOonwy2jlXPNcDYHam1r5LJ/bCWCHGLHA2DIIvHVhNnDDnPNdPLutWIaedDmxLf
 NQJx1xPpvuArs8uXFH2MNgLwwCRDPfeVUIYMFL1N4WiHASboridZ2Kd21kXzZzYfDnKaMm
 nIDY4ycXis17mtpvPQbJ7wMNywH9fbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661242202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XxiV2xZWWbURF04dpsPSk3ndlD6jZgDnSJrKi8B+5MU=;
 b=0+WbgpGR0Q2Ji5SnmpSpxM0vFBAVwZokjDo5V2hyAmX1ZmzXXfxFmbXPtVpkLNd6gCUB7O
 u3LHnu0Yb9cg8VBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4704B13A89;
 Tue, 23 Aug 2022 08:10:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kLR4EFqLBGMxTgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 08:10:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/5] ASoC: nau8824: Fix semaphore unbalance at error paths
Date: Tue, 23 Aug 2022 10:09:57 +0200
Message-Id: <20220823081000.2965-3-tiwai@suse.de>
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

The semaphore of nau8824 wasn't properly unlocked at some error
handling code paths, hence this may result in the unbalance (and
potential lock-up).  Fix them to handle the semaphore up properly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/nau8824.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index ad54d70f7d8e..10bdfebe92d5 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1043,6 +1043,7 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	unsigned int val_len = 0, osr, ctrl_val, bclk_fs, bclk_div;
+	int err = -EINVAL;
 
 	nau8824_sema_acquire(nau8824, HZ);
 
@@ -1059,7 +1060,7 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
 		osr &= NAU8824_DAC_OVERSAMPLE_MASK;
 		if (nau8824_clock_check(nau8824, substream->stream,
 			nau8824->fs, osr))
-			return -EINVAL;
+			goto error;
 		regmap_update_bits(nau8824->regmap, NAU8824_REG_CLK_DIVIDER,
 			NAU8824_CLK_DAC_SRC_MASK,
 			osr_dac_sel[osr].clk_src << NAU8824_CLK_DAC_SRC_SFT);
@@ -1069,7 +1070,7 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
 		osr &= NAU8824_ADC_SYNC_DOWN_MASK;
 		if (nau8824_clock_check(nau8824, substream->stream,
 			nau8824->fs, osr))
-			return -EINVAL;
+			goto error;
 		regmap_update_bits(nau8824->regmap, NAU8824_REG_CLK_DIVIDER,
 			NAU8824_CLK_ADC_SRC_MASK,
 			osr_adc_sel[osr].clk_src << NAU8824_CLK_ADC_SRC_SFT);
@@ -1090,7 +1091,7 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
 		else if (bclk_fs <= 256)
 			bclk_div = 0;
 		else
-			return -EINVAL;
+			goto error;
 		regmap_update_bits(nau8824->regmap,
 			NAU8824_REG_PORT0_I2S_PCM_CTRL_2,
 			NAU8824_I2S_LRC_DIV_MASK | NAU8824_I2S_BLK_DIV_MASK,
@@ -1111,15 +1112,17 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
 		val_len |= NAU8824_I2S_DL_32;
 		break;
 	default:
-		return -EINVAL;
+		goto error;
 	}
 
 	regmap_update_bits(nau8824->regmap, NAU8824_REG_PORT0_I2S_PCM_CTRL_1,
 		NAU8824_I2S_DL_MASK, val_len);
+	err = 0;
 
+ error:
 	nau8824_sema_release(nau8824);
 
-	return 0;
+	return err;
 }
 
 static int nau8824_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
@@ -1128,8 +1131,6 @@ static int nau8824_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	unsigned int ctrl1_val = 0, ctrl2_val = 0;
 
-	nau8824_sema_acquire(nau8824, HZ);
-
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBM_CFM:
 		ctrl2_val |= NAU8824_I2S_MS_MASTER;
@@ -1171,6 +1172,8 @@ static int nau8824_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
+	nau8824_sema_acquire(nau8824, HZ);
+
 	regmap_update_bits(nau8824->regmap, NAU8824_REG_PORT0_I2S_PCM_CTRL_1,
 		NAU8824_I2S_DF_MASK | NAU8824_I2S_BP_MASK |
 		NAU8824_I2S_PCMB_EN, ctrl1_val);
-- 
2.35.3

