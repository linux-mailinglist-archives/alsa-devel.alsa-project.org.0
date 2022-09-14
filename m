Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D51395B83FE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:06:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E2C6188A;
	Wed, 14 Sep 2022 11:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E2C6188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663146383;
	bh=qE8upik8CSkwQbkwbPUN5ph1sqSRqQNZlu203IwJKBY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EIolw2n4MAKz2h/h4U8VGDbATdJufsI/nZWBPgWg+zB0T3PnWtqk4+eWvGOHERE7b
	 YJV1gEpsBWadMoVxYmXB5QsI//vYJGpsPEEPxpF+g+QoSjqFbThttzDtgZTF+5SHU7
	 llqShJcwYQcUZ4i3dhlfGcd/+T2C7OLBwEHEE12k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28EA1F80564;
	Wed, 14 Sep 2022 11:04:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FA61F80566; Wed, 14 Sep 2022 11:04:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26969F804E6
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26969F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YwbL79vQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB982619DA;
 Wed, 14 Sep 2022 09:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC832C43141;
 Wed, 14 Sep 2022 09:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663146252;
 bh=qE8upik8CSkwQbkwbPUN5ph1sqSRqQNZlu203IwJKBY=;
 h=From:To:Cc:Subject:Date:From;
 b=YwbL79vQ3JZ0mtQ0KblIlYXgMB0+KjJ2Q31yt5Z2sdgCvnuwcfN1KpzORJbeTgUkT
 KTxL+Ks56xJdl0n12EcMIWoi/80seAmBeM4ioM4nhhNCIj2Stb4F3kMrXpeKN8nh+8
 rR2yl+z4H7nqEOknPscJByW+1WlMWs2HEt6d81I9Kv0989IjydJYWy9xpQCmtcmkMd
 6g1Wy4+A4GVU1SA6RlRr6vOAY7d0k7PT/omUfAq3wGIYYVGGNk5EKPu0Vx6N/IboKr
 3lsjMZNwiYC+Qn1uxAMDhwoYvzwQx4MiXRj/l/DbBmmgSYRep6y5bQ4pd6izmbQMEN
 sHjfUNY/aOWnA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 01/12] ASoC: nau8824: Fix semaphore unbalance at
 error paths
Date: Wed, 14 Sep 2022 05:03:54 -0400
Message-Id: <20220914090407.471328-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org, steve@sk2.org,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com, lgirdwood@gmail.com,
 hdegoede@redhat.com, Mark Brown <broonie@kernel.org>,
 ckeepax@opensource.cirrus.com
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
index c8ccfa2fff848..a95fe3fff1db8 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1072,6 +1072,7 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	unsigned int val_len = 0, osr, ctrl_val, bclk_fs, bclk_div;
+	int err = -EINVAL;
 
 	nau8824_sema_acquire(nau8824, HZ);
 
@@ -1088,7 +1089,7 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
 		osr &= NAU8824_DAC_OVERSAMPLE_MASK;
 		if (nau8824_clock_check(nau8824, substream->stream,
 			nau8824->fs, osr))
-			return -EINVAL;
+			goto error;
 		regmap_update_bits(nau8824->regmap, NAU8824_REG_CLK_DIVIDER,
 			NAU8824_CLK_DAC_SRC_MASK,
 			osr_dac_sel[osr].clk_src << NAU8824_CLK_DAC_SRC_SFT);
@@ -1098,7 +1099,7 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
 		osr &= NAU8824_ADC_SYNC_DOWN_MASK;
 		if (nau8824_clock_check(nau8824, substream->stream,
 			nau8824->fs, osr))
-			return -EINVAL;
+			goto error;
 		regmap_update_bits(nau8824->regmap, NAU8824_REG_CLK_DIVIDER,
 			NAU8824_CLK_ADC_SRC_MASK,
 			osr_adc_sel[osr].clk_src << NAU8824_CLK_ADC_SRC_SFT);
@@ -1119,7 +1120,7 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
 		else if (bclk_fs <= 256)
 			bclk_div = 0;
 		else
-			return -EINVAL;
+			goto error;
 		regmap_update_bits(nau8824->regmap,
 			NAU8824_REG_PORT0_I2S_PCM_CTRL_2,
 			NAU8824_I2S_LRC_DIV_MASK | NAU8824_I2S_BLK_DIV_MASK,
@@ -1140,15 +1141,17 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
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
@@ -1157,8 +1160,6 @@ static int nau8824_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	unsigned int ctrl1_val = 0, ctrl2_val = 0;
 
-	nau8824_sema_acquire(nau8824, HZ);
-
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBM_CFM:
 		ctrl2_val |= NAU8824_I2S_MS_MASTER;
@@ -1200,6 +1201,8 @@ static int nau8824_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
+	nau8824_sema_acquire(nau8824, HZ);
+
 	regmap_update_bits(nau8824->regmap, NAU8824_REG_PORT0_I2S_PCM_CTRL_1,
 		NAU8824_I2S_DF_MASK | NAU8824_I2S_BP_MASK |
 		NAU8824_I2S_PCMB_EN, ctrl1_val);
-- 
2.35.1

