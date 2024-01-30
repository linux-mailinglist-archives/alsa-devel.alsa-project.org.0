Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2342F84B1D3
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 11:01:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D3AAEBE;
	Tue,  6 Feb 2024 11:01:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D3AAEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707213684;
	bh=3j7qNw//RbI0sRRiGsyMLOaSNqnyk1fLqWXikzWa7e0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WX7Zsm7vgXTfxZ4R8M91JiBU9EfEKGMxfItey0IC8vOSxLWOYahAgHRPTuys7Gsj0
	 48xG/sK0TNwghRN7MsNMr9TKcZW68aLKYRoBVu3Ni2+Iqba14RsGjvdWQg/xYunxPP
	 GXGmZlabSYTyBrRwJoIrOqyPcZ2fVcN5byIuwBz0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88AC3F806E0; Tue,  6 Feb 2024 10:59:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4FFEF806DB;
	Tue,  6 Feb 2024 10:59:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22D36F80563; Tue, 30 Jan 2024 10:47:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C924BF80564
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 10:47:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C924BF80564
Received: by air.basealt.ru (Postfix, from userid 490)
	id 5052C2F20248; Tue, 30 Jan 2024 09:47:25 +0000 (UTC)
Received: from altlinux.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
	by air.basealt.ru (Postfix) with ESMTPSA id 4F4882F20249;
	Tue, 30 Jan 2024 09:47:15 +0000 (UTC)
From: kovalev@altlinux.org
To: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	u.kleine-koenig@pengutronix.de,
	a.firago@yadro.com,
	sashal@kernel.org,
	zhuning0077@gmail.com,
	tiwai@suse.com,
	perex@perex.cz,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	kovalev@altlinux.org
Subject: [PATCH 6.1.y 6/7] ASOC: codecs: ES8326: Add calibration support for
 version_b
Date: Tue, 30 Jan 2024 12:47:07 +0300
Message-Id: <20240130094708.290485-7-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
In-Reply-To: <20240130094708.290485-1-kovalev@altlinux.org>
References: <20240130094708.290485-1-kovalev@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kovalev@altlinux.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GM4R2RBLV3CBQDPRSYUPXSFDMXTOE53D
X-Message-ID-Hash: GM4R2RBLV3CBQDPRSYUPXSFDMXTOE53D
X-Mailman-Approved-At: Tue, 06 Feb 2024 09:58:33 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Zhu Ning <zhuning0077@gmail.com>

Commit 0663286e58e6f611f3578b5e63e1faa576d139fd upstream.

Version_b requires a new way of calibrating headset offset. A new
calibration function is added.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
Link: https://lore.kernel.org/r/20230717033223.42506-4-zhuning0077@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 sound/soc/codecs/es8326.c | 83 ++++++++++++++++++++++++++++++++-------
 1 file changed, 68 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 1525fac1f9b8b1..50b13296e246e1 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -388,6 +388,7 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 {
 	struct snd_soc_component *component = dai->component;
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int offset_l, offset_r;
 
 	if (mute) {
 		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_OFF);
@@ -398,10 +399,16 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (!es8326->calibrated) {
 			regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_FORCE_CAL);
 			msleep(30);
+			regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_OFF);
+			regmap_read(es8326->regmap, ES8326_HPL_OFFSET_INI, &offset_l);
+			regmap_read(es8326->regmap, ES8326_HPR_OFFSET_INI, &offset_r);
+			regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, 0x8c);
+			regmap_write(es8326->regmap, ES8326_HPL_OFFSET_INI, offset_l);
+			regmap_write(es8326->regmap, ES8326_HPR_OFFSET_INI, offset_r);
 			es8326->calibrated = true;
 		}
 		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa0);
-		regmap_write(es8326->regmap, ES8326_HP_VOL, 0x00);
+		regmap_write(es8326->regmap, ES8326_HP_VOL, 0x80);
 		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_ON);
 		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
 				ES8326_MUTE_MASK, ~(ES8326_MUTE));
@@ -420,15 +427,17 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 		ret = clk_prepare_enable(es8326->mclk);
 		if (ret)
 			return ret;
-		regmap_write(es8326->regmap, ES8326_RESET, ES8326_PWRUP_SEQ_EN);
-		regmap_write(es8326->regmap, ES8326_INTOUT_IO, 0x45);
+
+		regmap_write(es8326->regmap, ES8326_RESET, 0x9f);
+		msleep(20);
+		regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x00);
+		regmap_write(es8326->regmap, ES8326_INTOUT_IO, es8326->interrupt_clk);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO,
 			    (ES8326_IO_DMIC_CLK << ES8326_SDINOUT1_SHIFT));
-		regmap_write(es8326->regmap, ES8326_SDINOUT23_IO, ES8326_IO_INPUT);
-		regmap_write(es8326->regmap, ES8326_CLK_RESAMPLE, 0x05);
-		regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x02);
+		regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x0E);
 		regmap_write(es8326->regmap, ES8326_PGA_PDN, 0x40);
-		regmap_write(es8326->regmap, ES8326_DAC2HPMIX, 0xAA);
+		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x00);
+		regmap_update_bits(es8326->regmap,  ES8326_CLK_CTL, 0x20, 0x20);
 		regmap_write(es8326->regmap, ES8326_RESET, ES8326_CSM_ON);
 		break;
 	case SND_SOC_BIAS_PREPARE:
@@ -437,15 +446,10 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 		break;
 	case SND_SOC_BIAS_OFF:
 		clk_disable_unprepare(es8326->mclk);
-		regmap_write(es8326->regmap, ES8326_DAC2HPMIX, 0x11);
-		regmap_write(es8326->regmap, ES8326_RESET, ES8326_CSM_OFF);
-		regmap_write(es8326->regmap, ES8326_PGA_PDN, 0xF8);
+		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x3b);
 		regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x00);
-		regmap_write(es8326->regmap, ES8326_INT_SOURCE, 0x08);
+		regmap_update_bits(es8326->regmap, ES8326_CLK_CTL, 0x20, 0x00);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO, ES8326_IO_INPUT);
-		regmap_write(es8326->regmap, ES8326_SDINOUT23_IO, ES8326_IO_INPUT);
-		regmap_write(es8326->regmap, ES8326_RESET,
-			     ES8326_CODEC_RESET | ES8326_PWRUP_SEQ_EN);
 		break;
 	}
 
@@ -635,6 +639,54 @@ static irqreturn_t es8326_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int es8326_calibrate(struct snd_soc_component *component)
+{
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int reg;
+	unsigned int offset_l, offset_r;
+
+	regmap_read(es8326->regmap, ES8326_CHIP_VERSION, &reg);
+	es8326->version = reg;
+
+	if ((es8326->version == ES8326_VERSION_B) && (es8326->calibrated == false)) {
+		dev_dbg(component->dev, "ES8326_VERSION_B, calibrating\n");
+		regmap_write(es8326->regmap, ES8326_CLK_INV, 0xc0);
+		regmap_write(es8326->regmap, ES8326_CLK_DIV1, 0x01);
+		regmap_write(es8326->regmap, ES8326_CLK_DLL, 0x30);
+		regmap_write(es8326->regmap, ES8326_CLK_MUX, 0xed);
+		regmap_write(es8326->regmap, ES8326_CLK_TRI, 0xc1);
+		regmap_write(es8326->regmap, ES8326_DAC_MUTE, 0x03);
+		regmap_write(es8326->regmap, ES8326_ANA_VSEL, 0x7f);
+		regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x33);
+		regmap_write(es8326->regmap, ES8326_DAC2HPMIX, 0x88);
+		regmap_write(es8326->regmap, ES8326_HP_VOL, 0x80);
+		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, 0x8c);
+		regmap_write(es8326->regmap, ES8326_RESET, 0xc0);
+		usleep_range(15000, 20000);
+
+		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, ES8326_HP_OFF);
+		regmap_read(es8326->regmap, ES8326_CSM_MUTE_STA, &reg);
+		if ((reg & 0xf0) != 0x40)
+			msleep(50);
+
+		regmap_write(es8326->regmap, ES8326_HP_CAL, 0xd4);
+		msleep(200);
+		regmap_write(es8326->regmap, ES8326_HP_CAL, 0x4d);
+		msleep(200);
+		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_OFF);
+		regmap_read(es8326->regmap, ES8326_HPL_OFFSET_INI, &offset_l);
+		regmap_read(es8326->regmap, ES8326_HPR_OFFSET_INI, &offset_r);
+		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, 0x8c);
+		regmap_write(es8326->regmap, ES8326_HPL_OFFSET_INI, offset_l);
+		regmap_write(es8326->regmap, ES8326_HPR_OFFSET_INI, offset_r);
+		regmap_write(es8326->regmap, ES8326_CLK_INV, 0x00);
+
+		es8326->calibrated = true;
+	}
+
+	return 0;
+}
+
 static int es8326_resume(struct snd_soc_component *component)
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
@@ -673,7 +725,8 @@ static int es8326_resume(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_CLK_VMIDS1, 0xc4);
 	regmap_write(es8326->regmap, ES8326_CLK_VMIDS2, 0x81);
 	regmap_write(es8326->regmap, ES8326_CLK_CAL_TIME, 0x00);
-
+	/* calibrate for B version */
+	es8326_calibrate(component);
 	/* turn off headphone out */
 	regmap_write(es8326->regmap, ES8326_HP_CAL, 0x00);
 	/* set ADC and DAC in low power mode */
-- 
2.33.8

