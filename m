Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D725B83AA
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6DF011C;
	Wed, 14 Sep 2022 11:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6DF011C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663146149;
	bh=9m5W7lH4DrxdFeITuIr/sv2lNngTtPNkfQ9F2jbC9eE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mhd0Qo7FUXY1TAWivRWNX50KUnmeJM4NqsEx3oqF4g5oOh8UJudatgPJAicBLMRK5
	 tqsJu+lNMyXNmVfXC1seRmJJHeggO9E4T7lUC50Ki4Hu2Nmw37x6Tc5uHxElyDbYrT
	 gf9jaZCb+Z/8/xuuaeTlXD59fn7QYPP9tMMFIMVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FDEAF801D8;
	Wed, 14 Sep 2022 11:01:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F974F800C0; Wed, 14 Sep 2022 11:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8C25F800C0
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8C25F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F/Wjb7UC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8922461812;
 Wed, 14 Sep 2022 09:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498BBC433C1;
 Wed, 14 Sep 2022 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663146077;
 bh=9m5W7lH4DrxdFeITuIr/sv2lNngTtPNkfQ9F2jbC9eE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F/Wjb7UCGPVKHOpbTnlbjgrUKzxFhMkHlPh4E5DVQnxNWQJAV82PyIPsqzZ24KED5
 26CrLHDDKROF48E2scMO/wmURpx2yTUz2WB2ZElVjuSeQEDvae0uG9XZPDN+nfyV9q
 mWZalkZskra53nRhDG1o6fPYUKkTVBbWaQbqQyy73XRc2tk4KhtpsrGkOGi8zrK6Li
 FObzYTj5HTDIALkee4/roQyZDHDb2V1Cw0ZdQZSnubGNWI9ONkdL/Ta4Zn0vlSx7u1
 vNP3GYN5UzTnonqUqUyuA3aqFxkKSjOtHnIG0dmqLaAR20VPLnXmZxYaEvtpKMv9az
 r2qVNUhfdj4ug==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 03/22] ASoC: nau8824: Fix semaphore unbalance at
 error paths
Date: Wed, 14 Sep 2022 05:00:44 -0400
Message-Id: <20220914090103.470630-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220914090103.470630-1-sashal@kernel.org>
References: <20220914090103.470630-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>, tiwai@suse.com,
 lgirdwood@gmail.com, hdegoede@redhat.com, Mark Brown <broonie@kernel.org>,
 steve@sk2.org
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 5628560e90395d3812800a8e44a01c32ffa429ec ]

The semaphore of nau8824 wasn't properly unlocked at some error
handling code paths, hence this may result in the unbalance (and
potential lock-up).  Fix them to handle the semaphore up properly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20220823081000.2965-3-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/nau8824.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 2a7c935085353..c263858745ee2 100644
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
2.35.1

