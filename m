Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07122A1E3A
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:02:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91E3A16E0;
	Thu, 29 Aug 2019 17:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91E3A16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090950;
	bh=h7d32KazYQzveViQocbR5IZiKYijRWovAhKYaJf/CKE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dDklADa+al4y8gYAuN4O0VZXFSkU82sTqyJ5LYfCl9pU3iEE9rGerAQ2CINnJNmuz
	 i5Qzc6uI2pX8CXzUKlS3V5IdGq15huQ2cjL17IbZAutkmMwUBLXxicqAJkndQkCMm4
	 z0gCc30rsuWPrKdWQig6wqMXFNFWPe471Hv3iyJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A1D1F8067B;
	Tue, 27 Aug 2019 21:58:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABA41F8063E; Tue, 27 Aug 2019 21:58:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1465DF80641
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 21:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1465DF80641
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Fl+cZL3r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=NvqUNXJbJAvMRX1de86ISSwIZP71G+d6RhEuhnN8bo8=; b=Fl+cZL3rwvxD
 V6Zxi63foeLQaKYyONW7SbWX+6FAedUs1azFZ5gBWCPBxc5Tb9014Vf1TZ3gOBZqOq2Ki12xdBoEh
 VsLBZeBYX0q+PzrgMmJzyKbjA6qM5jHw0pAc2ymmspDBdQb7h+ZMyI6JEWzETrV5friVLvFkEJI+A
 Aefws=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2hb9-0001BU-85; Tue, 27 Aug 2019 19:57:47 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 7A129D02CEB; Tue, 27 Aug 2019 20:57:44 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20190826090052.1875-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190827195744.7A129D02CEB@fitzroy.sirena.org.uk>
Date: Tue, 27 Aug 2019 20:57:44 +0100 (BST)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cychiang@google.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com,
 sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1011: add mutex protection to
	set_fmt/set_tdm_slot" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: rt1011: add mutex protection to set_fmt/set_tdm_slot

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From e9e897d5fdba9bda3a8c80ea39761413725f198c Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Mon, 26 Aug 2019 17:00:52 +0800
Subject: [PATCH] ASoC: rt1011: add mutex protection to set_fmt/set_tdm_slot

The calibration process at booting will reset registers and bypass cache
to make sure the calibration is done.
We add mutex protection to avoid unexpected settings while
the registration process and calibration are interleaved.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20190826090052.1875-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1011.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 0a6ff13d76e1..ed28250d5e34 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1619,14 +1619,18 @@ static int rt1011_hw_params(struct snd_pcm_substream *substream,
 static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
 	unsigned int reg_val = 0, reg_bclk_inv = 0;
+	int ret = 0;
 
+	snd_soc_dapm_mutex_lock(dapm);
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
 		reg_val |= RT1011_I2S_TDM_MS_S;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -1636,7 +1640,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		reg_bclk_inv |= RT1011_TDM_INV_BCLK;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -1652,7 +1656,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		reg_val |= RT1011_I2S_TDM_DF_PCM_B;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
 	switch (dai->id) {
@@ -1667,9 +1671,11 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	default:
 		dev_err(component->dev, "Invalid dai->id: %d\n", dai->id);
-		return -EINVAL;
+		ret = -EINVAL;
 	}
-	return 0;
+
+	snd_soc_dapm_mutex_unlock(dapm);
+	return ret;
 }
 
 static int rt1011_set_component_sysclk(struct snd_soc_component *component,
@@ -1788,8 +1794,12 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
 	unsigned int val = 0, tdm_en = 0;
+	int ret = 0;
 
+	snd_soc_dapm_mutex_lock(dapm);
 	if (rx_mask || tx_mask)
 		tdm_en = RT1011_TDM_I2S_DOCK_EN_1;
 
@@ -1809,7 +1819,7 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 	case 2:
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
 	switch (slot_width) {
@@ -1828,7 +1838,7 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 	case 16:
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
 	snd_soc_component_update_bits(component, RT1011_TDM1_SET_1,
@@ -1845,7 +1855,8 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 		RT1011_ADCDAT1_PIN_CONFIG | RT1011_ADCDAT2_PIN_CONFIG,
 		RT1011_ADCDAT1_OUTPUT | RT1011_ADCDAT2_OUTPUT);
 
-	return 0;
+	snd_soc_dapm_mutex_unlock(dapm);
+	return ret;
 }
 
 static int rt1011_probe(struct snd_soc_component *component)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
