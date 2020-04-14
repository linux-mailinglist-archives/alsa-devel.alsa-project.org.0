Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C2A1A8082
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:55:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44AD71676;
	Tue, 14 Apr 2020 16:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44AD71676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876146;
	bh=oAUWDumR4F9z26yMD2OggByBwwC64kWCH6gBYn6fn9U=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=uAeD6J8UftxtBc8z1Fg54T2BHykwv6+JTTPxzfsURHIJUTuxDvz1o5DOf88/i/Lh/
	 goUz/siOBUotdPkZASYUTwXuFuKiXI3rPXZtUe8MTUxm0EYYofGB5T5hTDg8SwS2XU
	 r9AFzRatTVRhV9MPCnqqSUQPCbGmzfcaIVgpf6Mo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E48F80328;
	Tue, 14 Apr 2020 16:47:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA7EBF8013D; Tue, 14 Apr 2020 16:47:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05D2AF80316
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05D2AF80316
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qkwuivWW"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2026B2078B;
 Tue, 14 Apr 2020 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875620;
 bh=oAUWDumR4F9z26yMD2OggByBwwC64kWCH6gBYn6fn9U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=qkwuivWWBfJH6oZyh3p17cD6xHZGLsNhtFf4wQqEup7NdcEWoMvWcl9J+oXO3qH76
 sKcUWTRZtXoy0Ghe2jjkk7QBpEWIHdXTxDS1HQdEGc+EQjwE6cv6/AA+RiJxcM4WuU
 I8LmrjU+J/tAG0P9fmfIrpXrOVp4Ua+dyQnOmf10=
Date: Tue, 14 Apr 2020 15:46:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Applied "ASoC: wm8990: remove some defined but unused symbols" to the
 asoc tree
In-Reply-To: <20200407082932.41511-4-yanaijie@huawei.com>
Message-Id: <applied-20200407082932.41511-4-yanaijie@huawei.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>
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

   ASoC: wm8990: remove some defined but unused symbols

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

From f840ebfe58027b43d6a6ba261c11cc80963952d6 Mon Sep 17 00:00:00 2001
From: Jason Yan <yanaijie@huawei.com>
Date: Tue, 7 Apr 2020 16:29:31 +0800
Subject: [PATCH] ASoC: wm8990: remove some defined but unused symbols
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following gcc warning:

sound/soc/codecs/wm8990.c:1309:35: warning: ‘wm8990_regmap’ defined but
not used [-Wunused-const-variable=]
 static const struct regmap_config wm8990_regmap = {
                                   ^~~~~~~~~~~~~
sound/soc/codecs/wm8990.c:490:38: warning:
‘wm8990_dapm_rxvoice_controls’ defined but not used
[-Wunused-const-variable=]
 static const struct snd_kcontrol_new wm8990_dapm_rxvoice_controls[] = {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/codecs/wm8990.c:120:35: warning: ‘out_omix_tlv’ defined but
not used [-Wunused-const-variable=]
 static const DECLARE_TLV_DB_SCALE(out_omix_tlv, -600, 0, 0);
                                   ^
sound/soc/codecs/wm8990.c:112:35: warning: ‘rec_mix_tlv’ defined but not
used [-Wunused-const-variable=]
 static const DECLARE_TLV_DB_SCALE(rec_mix_tlv, -1500, 600, 0);
                                   ^

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
Link: https://lore.kernel.org/r/20200407082932.41511-4-yanaijie@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8990.c | 98 ---------------------------------------
 1 file changed, 98 deletions(-)

diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index cfe7892696dd..499a29b47d5e 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -32,93 +32,14 @@ struct wm8990_priv {
 	unsigned int pcmclk;
 };
 
-static bool wm8990_volatile_register(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case WM8990_RESET:
-		return true;
-	default:
-		return false;
-	}
-}
-
-static const struct reg_default wm8990_reg_defaults[] = {
-	{  1, 0x0000 },     /* R1  - Power Management (1) */
-	{  2, 0x6000 },     /* R2  - Power Management (2) */
-	{  3, 0x0000 },     /* R3  - Power Management (3) */
-	{  4, 0x4050 },     /* R4  - Audio Interface (1) */
-	{  5, 0x4000 },     /* R5  - Audio Interface (2) */
-	{  6, 0x01C8 },     /* R6  - Clocking (1) */
-	{  7, 0x0000 },     /* R7  - Clocking (2) */
-	{  8, 0x0040 },     /* R8  - Audio Interface (3) */
-	{  9, 0x0040 },     /* R9  - Audio Interface (4) */
-	{ 10, 0x0004 },     /* R10 - DAC CTRL */
-	{ 11, 0x00C0 },     /* R11 - Left DAC Digital Volume */
-	{ 12, 0x00C0 },     /* R12 - Right DAC Digital Volume */
-	{ 13, 0x0000 },     /* R13 - Digital Side Tone */
-	{ 14, 0x0100 },     /* R14 - ADC CTRL */
-	{ 15, 0x00C0 },     /* R15 - Left ADC Digital Volume */
-	{ 16, 0x00C0 },     /* R16 - Right ADC Digital Volume */
-
-	{ 18, 0x0000 },     /* R18 - GPIO CTRL 1 */
-	{ 19, 0x1000 },     /* R19 - GPIO1 & GPIO2 */
-	{ 20, 0x1010 },     /* R20 - GPIO3 & GPIO4 */
-	{ 21, 0x1010 },     /* R21 - GPIO5 & GPIO6 */
-	{ 22, 0x8000 },     /* R22 - GPIOCTRL 2 */
-	{ 23, 0x0800 },     /* R23 - GPIO_POL */
-	{ 24, 0x008B },     /* R24 - Left Line Input 1&2 Volume */
-	{ 25, 0x008B },     /* R25 - Left Line Input 3&4 Volume */
-	{ 26, 0x008B },     /* R26 - Right Line Input 1&2 Volume */
-	{ 27, 0x008B },     /* R27 - Right Line Input 3&4 Volume */
-	{ 28, 0x0000 },     /* R28 - Left Output Volume */
-	{ 29, 0x0000 },     /* R29 - Right Output Volume */
-	{ 30, 0x0066 },     /* R30 - Line Outputs Volume */
-	{ 31, 0x0022 },     /* R31 - Out3/4 Volume */
-	{ 32, 0x0079 },     /* R32 - Left OPGA Volume */
-	{ 33, 0x0079 },     /* R33 - Right OPGA Volume */
-	{ 34, 0x0003 },     /* R34 - Speaker Volume */
-	{ 35, 0x0003 },     /* R35 - ClassD1 */
-
-	{ 37, 0x0100 },     /* R37 - ClassD3 */
-	{ 38, 0x0079 },     /* R38 - ClassD4 */
-	{ 39, 0x0000 },     /* R39 - Input Mixer1 */
-	{ 40, 0x0000 },     /* R40 - Input Mixer2 */
-	{ 41, 0x0000 },     /* R41 - Input Mixer3 */
-	{ 42, 0x0000 },     /* R42 - Input Mixer4 */
-	{ 43, 0x0000 },     /* R43 - Input Mixer5 */
-	{ 44, 0x0000 },     /* R44 - Input Mixer6 */
-	{ 45, 0x0000 },     /* R45 - Output Mixer1 */
-	{ 46, 0x0000 },     /* R46 - Output Mixer2 */
-	{ 47, 0x0000 },     /* R47 - Output Mixer3 */
-	{ 48, 0x0000 },     /* R48 - Output Mixer4 */
-	{ 49, 0x0000 },     /* R49 - Output Mixer5 */
-	{ 50, 0x0000 },     /* R50 - Output Mixer6 */
-	{ 51, 0x0180 },     /* R51 - Out3/4 Mixer */
-	{ 52, 0x0000 },     /* R52 - Line Mixer1 */
-	{ 53, 0x0000 },     /* R53 - Line Mixer2 */
-	{ 54, 0x0000 },     /* R54 - Speaker Mixer */
-	{ 55, 0x0000 },     /* R55 - Additional Control */
-	{ 56, 0x0000 },     /* R56 - AntiPOP1 */
-	{ 57, 0x0000 },     /* R57 - AntiPOP2 */
-	{ 58, 0x0000 },     /* R58 - MICBIAS */
-
-	{ 60, 0x0008 },     /* R60 - PLL1 */
-	{ 61, 0x0031 },     /* R61 - PLL2 */
-	{ 62, 0x0026 },     /* R62 - PLL3 */
-};
-
 #define wm8990_reset(c) snd_soc_component_write(c, WM8990_RESET, 0)
 
-static const DECLARE_TLV_DB_SCALE(rec_mix_tlv, -1500, 600, 0);
-
 static const DECLARE_TLV_DB_SCALE(in_pga_tlv, -1650, 3000, 0);
 
 static const DECLARE_TLV_DB_SCALE(out_mix_tlv, 0, -2100, 0);
 
 static const DECLARE_TLV_DB_SCALE(out_pga_tlv, -7300, 600, 0);
 
-static const DECLARE_TLV_DB_SCALE(out_omix_tlv, -600, 0, 0);
-
 static const DECLARE_TLV_DB_SCALE(out_dac_tlv, -7163, 0, 0);
 
 static const DECLARE_TLV_DB_SCALE(in_adc_tlv, -7163, 1763, 0);
@@ -486,14 +407,6 @@ static SOC_ENUM_SINGLE_DECL(wm8990_ainrmux_enum,
 static const struct snd_kcontrol_new wm8990_dapm_ainrmux_controls =
 SOC_DAPM_ENUM("Route", wm8990_ainrmux_enum);
 
-/* RXVOICE */
-static const struct snd_kcontrol_new wm8990_dapm_rxvoice_controls[] = {
-SOC_DAPM_SINGLE_TLV("LIN4/RXN", WM8990_INPUT_MIXER5, WM8990_LR4BVOL_SHIFT,
-			WM8990_LR4BVOL_MASK, 0, in_mix_tlv),
-SOC_DAPM_SINGLE_TLV("RIN4/RXP", WM8990_INPUT_MIXER6, WM8990_RL4BVOL_SHIFT,
-			WM8990_RL4BVOL_MASK, 0, in_mix_tlv),
-};
-
 /* LOMIX */
 static const struct snd_kcontrol_new wm8990_dapm_lomix_controls[] = {
 SOC_DAPM_SINGLE("LOMIX Right ADC Bypass Switch", WM8990_OUTPUT_MIXER1,
@@ -1306,17 +1219,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8990 = {
 	.non_legacy_dai_naming	= 1,
 };
 
-static const struct regmap_config wm8990_regmap = {
-	.reg_bits = 8,
-	.val_bits = 16,
-
-	.max_register = WM8990_PLL3,
-	.volatile_reg = wm8990_volatile_register,
-	.reg_defaults = wm8990_reg_defaults,
-	.num_reg_defaults = ARRAY_SIZE(wm8990_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
-};
-
 static int wm8990_i2c_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
-- 
2.20.1

