Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3217E286
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 15:28:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E41B81674;
	Mon,  9 Mar 2020 15:27:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E41B81674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583764086;
	bh=Utl/A2/+AwkH9jbiRl0KspHOp6Ot6nXiidpNAvwE7KY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XS54nIHOhnFxBi8GN7m16fscKYOxLnJ0B++dhiNP/lG1UuAQzqgFuITUg6TyhsQgp
	 pj6Xj9leKfqgstnfylUfGY0ydEX2yxvDX/PNK79VEEaj9KJ0BHAtpsj1cunUOfsj+A
	 P+EDMteFyc0hvlmUxmKk5bJlNDCTR8YQfV8NBGy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 476F2F8028D;
	Mon,  9 Mar 2020 15:25:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 550DFF8028B; Mon,  9 Mar 2020 15:25:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8D8DEF801F7
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 15:25:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D8DEF801F7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 879EB101E;
 Mon,  9 Mar 2020 07:25:25 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C0163F67D;
 Mon,  9 Mar 2020 07:25:24 -0700 (PDT)
Date: Mon, 09 Mar 2020 14:25:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Subject: Applied "ASoC: amd: Adding TDM support in hw_params." to the asoc tree
In-Reply-To: <1583751029-2850-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Message-Id: <applied-1583751029-2850-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Patchwork-Hint: ignore
Cc: , "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO,
 open list <linux-kernel@vger.kernel.org>,
 POWER MANAGEM..." <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Akshu Agrawal <akshu.agrawal@amd.com>,
 Mark Brown <broonie@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>,
 Alexander.Deucher@amd.com
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

The patch

   ASoC: amd: Adding TDM support in hw_params.

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From ab985be95da1d68a0cdba1ed702961aae047bf89 Mon Sep 17 00:00:00 2001
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Date: Mon, 9 Mar 2020 16:20:10 +0530
Subject: [PATCH] ASoC: amd: Adding TDM support in hw_params.

TDM related settings for ACP registers in hw_params.
When TDM mode is enabled, Hw_params needs to read and write
from/to respective TX/RX (ACP_(I2S/BT)TDM_(TX/RX)FRMT) registers.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Link: https://lore.kernel.org/r/1583751029-2850-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/raven/acp3x-i2s.c | 44 ++++++++++-----------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 91a388184e52..3a3c47e820ab 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -42,7 +42,7 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,
 		u32 tx_mask, u32 rx_mask, int slots, int slot_width)
 {
 	struct i2s_dev_data *adata;
-	u32 val, reg_val, frmt_reg, frm_len;
+	u32 frm_len;
 	u16 slot_len;
 
 	adata = snd_soc_dai_get_drvdata(cpu_dai);
@@ -64,36 +64,7 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,
 	default:
 		return -EINVAL;
 	}
-
-	/* Enable I2S/BT channels TDM, respective TX/RX frame lengths.*/
-
 	frm_len = FRM_LEN | (slots << 15) | (slot_len << 18);
-	if (adata->substream_type == SNDRV_PCM_STREAM_PLAYBACK) {
-		switch (adata->i2s_instance) {
-		case I2S_BT_INSTANCE:
-			reg_val = mmACP_BTTDM_ITER;
-			frmt_reg = mmACP_BTTDM_TXFRMT;
-			break;
-		case I2S_SP_INSTANCE:
-		default:
-			reg_val = mmACP_I2STDM_ITER;
-			frmt_reg = mmACP_I2STDM_TXFRMT;
-		}
-	} else {
-		switch (adata->i2s_instance) {
-		case I2S_BT_INSTANCE:
-			reg_val = mmACP_BTTDM_IRER;
-			frmt_reg = mmACP_BTTDM_RXFRMT;
-			break;
-		case I2S_SP_INSTANCE:
-		default:
-			reg_val = mmACP_I2STDM_IRER;
-			frmt_reg = mmACP_I2STDM_RXFRMT;
-		}
-	}
-	val = rv_readl(adata->acp3x_base + reg_val);
-	rv_writel(val | 0x2, adata->acp3x_base + reg_val);
-	rv_writel(frm_len, adata->acp3x_base + frmt_reg);
 	adata->tdm_fmt = frm_len;
 	return 0;
 }
@@ -105,12 +76,14 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *prtd;
 	struct snd_soc_card *card;
 	struct acp3x_platform_info *pinfo;
+	struct i2s_dev_data *adata;
 	u32 val;
-	u32 reg_val;
+	u32 reg_val, frmt_reg;
 
 	prtd = substream->private_data;
 	rtd = substream->runtime->private_data;
 	card = prtd->card;
+	adata = snd_soc_dai_get_drvdata(dai);
 	pinfo = snd_soc_card_get_drvdata(card);
 	if (pinfo) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -141,21 +114,30 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			reg_val = mmACP_BTTDM_ITER;
+			frmt_reg = mmACP_BTTDM_TXFRMT;
 			break;
 		case I2S_SP_INSTANCE:
 		default:
 			reg_val = mmACP_I2STDM_ITER;
+			frmt_reg = mmACP_I2STDM_TXFRMT;
 		}
 	} else {
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			reg_val = mmACP_BTTDM_IRER;
+			frmt_reg = mmACP_BTTDM_RXFRMT;
 			break;
 		case I2S_SP_INSTANCE:
 		default:
 			reg_val = mmACP_I2STDM_IRER;
+			frmt_reg = mmACP_I2STDM_RXFRMT;
 		}
 	}
+	if (adata->tdm_mode) {
+		val = rv_readl(rtd->acp3x_base + reg_val);
+		rv_writel(val | 0x2, rtd->acp3x_base + reg_val);
+		rv_writel(adata->tdm_fmt, rtd->acp3x_base + frmt_reg);
+	}
 	val = rv_readl(rtd->acp3x_base + reg_val);
 	val = val | (rtd->xfer_resolution  << 3);
 	rv_writel(val, rtd->acp3x_base + reg_val);
-- 
2.20.1

