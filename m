Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E36084DBC
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 15:42:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75071672;
	Wed,  7 Aug 2019 15:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75071672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565185332;
	bh=T34oqs6tXYJyF1dUWrQmiW4nO8SZI3ds5cSIyxXocgI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KAjZr4wvUiioNz4msJ9VjTPi/yCu2R0ETvS00TmSTZEBs+fkdS3a3roq4bZsoPuVB
	 L2X6cucCPwWQrLGoAFuyqNOF7qrjHIt2osO7aY7ykjuiz/KrV6Qse9sMvKUeasUomo
	 QGZE9b6ed+FADtNaHb/ftAffyuyyHmY3PoisajIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ECF4F80735;
	Wed,  7 Aug 2019 15:31:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31D36F80636; Wed,  7 Aug 2019 15:31:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS, PRX_BODY_21, RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70DCFF805F9
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 15:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70DCFF805F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="S8TfLcRr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=6ylcNEXrHl1NXvpdAvoZ7Ma9tPwvlHwCw/CafM43UoM=; b=S8TfLcRrLhB3
 yeJbbc0CuGh9HOU48eNELfSHT4rQhMGXH1LK1+AA7FUJeRXusmMeUOLqVC5AGAogyH/nKfJHuQhHU
 /cAEHTN1bCDdHMPD2YDH1Hr+8hRbzkgfALwrSJONxPrQU+Yq54exCDEQulCaqWvFUsOkXctfQ7VyD
 y9fIg=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvM1i-0007g2-IW; Wed, 07 Aug 2019 13:30:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F02C42742BE8; Wed,  7 Aug 2019 14:30:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20190806091435.14329-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190807133049.F02C42742BE8@ypsilon.sirena.org.uk>
Date: Wed,  7 Aug 2019 14:30:49 +0100 (BST)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1011: Add R0 temperature and TDM1
	ADC2DAT Swap control" to the asoc tree
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

   ASoC: rt1011: Add R0 temperature and TDM1 ADC2DAT Swap control

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 3403b808a0eb6d25883b72a6c4d2a4a452f8a233 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Tue, 6 Aug 2019 17:14:35 +0800
Subject: [PATCH] ASoC: rt1011: Add R0 temperature and TDM1 ADC2DAT Swap
 control

- The user level application could set the R0 temperature after booting system.
  The degree Celsius of R0 temperature store in the non-volatile space
  when doing R0 calibration.
- TDM1 ADC2DAT Swap controls use to control TDM slot2/3 data

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20190806091435.14329-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1011.c | 9 ++++++++-
 sound/soc/codecs/rt1011.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 0a6ff13d76e1..b25b4c1127ca 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1029,6 +1029,8 @@ static const char * const rt1011_tdm_adc_swap_select[] = {
 
 static SOC_ENUM_SINGLE_DECL(rt1011_tdm_adc1_1_enum,	RT1011_TDM1_SET_3, 6,
 	rt1011_tdm_adc_swap_select);
+static SOC_ENUM_SINGLE_DECL(rt1011_tdm_adc2_1_enum,	RT1011_TDM1_SET_3, 4,
+	rt1011_tdm_adc_swap_select);
 
 static void rt1011_reset(struct regmap *regmap)
 {
@@ -1333,7 +1335,8 @@ static const struct snd_kcontrol_new rt1011_snd_controls[] = {
 	/* TDM1 Data Out Selection */
 	SOC_ENUM("TDM1 DOUT Source", rt1011_tdm1_adc1_dat_enum),
 	SOC_ENUM("TDM1 DOUT Location", rt1011_tdm1_adc1_loc_enum),
-	SOC_ENUM("TDM1 ADCDAT Swap Select", rt1011_tdm_adc1_1_enum),
+	SOC_ENUM("TDM1 ADC1DAT Swap Select", rt1011_tdm_adc1_1_enum),
+	SOC_ENUM("TDM1 ADC2DAT Swap Select", rt1011_tdm_adc2_1_enum),
 
 	/* Data Out Mode */
 	SOC_ENUM("I2S ADC DOUT Mode", rt1011_adc_dout_mode_enum),
@@ -1355,6 +1358,10 @@ static const struct snd_kcontrol_new rt1011_snd_controls[] = {
 	SOC_SINGLE_EXT("R0 Calibration", SND_SOC_NOPM, 0, 1, 0,
 		rt1011_r0_cali_get, rt1011_r0_cali_put),
 	RT1011_R0_LOAD("R0 Load Mode"),
+
+	/* R0 temperature */
+	SOC_SINGLE("R0 Temperature", RT1011_STP_INITIAL_RESISTANCE_TEMP,
+		2, 255, 0),
 };
 
 static int rt1011_is_sys_clk_from_pll(struct snd_soc_dapm_widget *source,
diff --git a/sound/soc/codecs/rt1011.h b/sound/soc/codecs/rt1011.h
index 98a38800c4df..5d431d7f1d16 100644
--- a/sound/soc/codecs/rt1011.h
+++ b/sound/soc/codecs/rt1011.h
@@ -227,6 +227,7 @@
 #define RT1011_STP_CALIB_RS_TEMP			0x152a
 #define RT1011_INIT_RECIPROCAL_REG_24_16				0x1538
 #define RT1011_INIT_RECIPROCAL_REG_15_0				0x1539
+#define RT1011_STP_INITIAL_RESISTANCE_TEMP				0x153c
 #define RT1011_STP_ALPHA_RECIPROCAL_MSB				0x153e
 #define RT1011_SPK_RESISTANCE_1				0x1544
 #define RT1011_SPK_RESISTANCE_2				0x1546
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
