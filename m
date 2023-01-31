Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C8A6828CA
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 10:27:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 325A61DD;
	Tue, 31 Jan 2023 10:26:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 325A61DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675157225;
	bh=9cvfTvXApbaQZdYEWGUog4Zg8y5uRflIXtGXnvp30UQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Qoq4dEi2MsA/MmB5s970mpsgUVjsi04/PHMEO9d2UQHu4btCLBnaDS33rezFWrMs/
	 jdhen4mHJQC5Q2312Y2RuYkh3s13sN/9Mtbfrn2XShXHDgGkl6in3b+rc2H3082ke4
	 FJkUl3rOc89qlAyIhzzc1gX/+qujbnDSFdF/GKQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16889F804C2;
	Tue, 31 Jan 2023 10:26:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 641F5F804C2; Tue, 31 Jan 2023 10:26:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CAACF800A7
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 10:26:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CAACF800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EKtUC0rU
Received: by mail-pl1-x632.google.com with SMTP id r8so7603086pls.2
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 01:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A/4PkFCBp4y4Jg6epCItZWmq5g1k68oyOGtnQUmJXlQ=;
 b=EKtUC0rUKTLy90qPgx5FJzhOcfqanLJB0hi0XzWLLmRfwOjNPj/FApGXDV2aI3/KYO
 /yaVL9fmq9eY2/8Sii/PUor2Gc+TgTDKucr14o8dyaqpw3jbsV35+sd8Iq41DpQdzINd
 kGBOOkzEfF2XiRzDKfT5kbmNM+KkR8KyErMVkTkSGLDxvYvBpoKW+MyYoVRGQfhAnIpX
 fnjMxiS+eVGy0qP1amrkePugPKR433toAoe7WQjUZhU6gkRZqkCo8ESMK20X56ZB+Uuv
 go642ffmM7tRQTFZo+mpXR+IbiILuVjbFMT7zN8EitEpOl6ct+D8KDdBtwhF9DU6WXU+
 E1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A/4PkFCBp4y4Jg6epCItZWmq5g1k68oyOGtnQUmJXlQ=;
 b=uxZ1z0LUeF52PFicyBFE6fNOU0qSkTgB9kuWdldh7PdWLnvB8sD9T1Rcopp2EwV9HC
 rdwdolyKm51MfHVOSIbzUbjbpgsV5Rfu69DxxiMmIA9ZXOhzIdJPpZ6lgOSTZZF7tol1
 ZFvg30KRTDwE4qzVVnDHWqKShwJrvP9RQdO/xc3D72fqYSrzHvOaeJ4A6hDeIH6DThV9
 7EkPCox+cZNbz3FLs7wxYlyVQVgaf7b7GmHXX2GWEsQ2haWuIa6O53lqgKFMYCL3sSN1
 d2GkjekOJm23BW3N54eegM7BJ0igT/wu+JRzD07U2pMGLZ3Qkm3Iiu8VgHwt6HmqwxWB
 FS2w==
X-Gm-Message-State: AO0yUKXBggPQ3mtuAndDwRxMMT1/uXBNnY3rLVNQoQAl4O5REVp940vI
 eKcADA0kgz7zYgQxH/2QzUs=
X-Google-Smtp-Source: AK7set/nwElaHGxJrb3Jr1TpMn4cvw1yCLxaLy9VcOVpunGHVAInBOpcHRjJrHTkz73YKGwfLnsclQ==
X-Received: by 2002:a17:903:32c2:b0:196:d05:bac7 with SMTP id
 i2-20020a17090332c200b001960d05bac7mr32929299plr.58.1675157158361; 
 Tue, 31 Jan 2023 01:25:58 -0800 (PST)
Received: from localhost.localdomain
 (2001-b400-e308-cdcc-e485-4224-46de-3628.emome-ip6.hinet.net.
 [2001:b400:e308:cdcc:e485:4224:46de:3628])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a170902c74500b00195f0fb0c18sm9396313plq.31.2023.01.31.01.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 01:25:57 -0800 (PST)
From: Seven Lee <scott6986@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: nau8821: Implement DRC controls
Date: Tue, 31 Jan 2023 17:25:51 +0800
Message-Id: <20230131092551.11290-1-scott6986@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, CTLIN0@nuvoton.com, dardar923@gmail.com,
 supercraig0719@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch is support dynamic range compression controls.

Signed-off-by: Seven Lee <scott6986@gmail.com>
---
 sound/soc/codecs/nau8821.c | 96 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/nau8821.h | 23 +++++++++
 2 files changed, 119 insertions(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 4a72b94e8410..fee970427a24 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -322,12 +322,92 @@ static const struct soc_enum nau8821_dac_oversampl_enum =
 	SOC_ENUM_SINGLE(NAU8821_R2C_DAC_CTRL1, NAU8821_DAC_OVERSAMPLE_SFT,
 		ARRAY_SIZE(nau8821_dac_oversampl), nau8821_dac_oversampl);
 
+static const char * const nau8821_adc_drc_noise_gate[] = {
+	"1:1", "2:1", "4:1", "8:1" };
+
+static const struct soc_enum nau8821_adc_drc_noise_gate_enum =
+	SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES, NAU8821_DRC_NG_SLP_ADC_SFT,
+		ARRAY_SIZE(nau8821_adc_drc_noise_gate),
+		nau8821_adc_drc_noise_gate);
+
+static const char * const nau8821_adc_drc_expansion_slope[] = {
+	"1:1", "2:1", "4:1" };
+
+static const struct soc_enum nau8821_adc_drc_expansion_slope_enum =
+	SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES, NAU8821_DRC_EXP_SLP_ADC_SFT,
+		ARRAY_SIZE(nau8821_adc_drc_expansion_slope),
+		nau8821_adc_drc_expansion_slope);
+
+static const char * const nau8821_adc_drc_lower_region[] = {
+	"0", "1:2", "1:4", "1:8", "1:16", "", "", "1:1" };
+
+static const struct soc_enum nau8821_adc_drc_lower_region_enum =
+	SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES,
+		NAU8821_DRC_CMP2_SLP_ADC_SFT,
+		ARRAY_SIZE(nau8821_adc_drc_lower_region),
+		nau8821_adc_drc_lower_region);
+
+static const char * const nau8821_higher_region[] = {
+	"0", "1:2", "1:4", "1:8", "1:16", "", "", "1:1" };
+
+static const struct soc_enum nau8821_higher_region_enum =
+	SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES,
+		NAU8821_DRC_CMP1_SLP_ADC_SFT,
+		ARRAY_SIZE(nau8821_higher_region),
+		nau8821_higher_region);
+
+static const char * const nau8821_limiter_slope[] = {
+	"0", "1:2", "1:4", "1:8", "1:16", "1:32", "1:64", "1:1" };
+
+static const struct soc_enum nau8821_limiter_slope_enum =
+	SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES,
+		NAU8821_DRC_LMT_SLP_ADC_SFT, ARRAY_SIZE(nau8821_limiter_slope),
+		nau8821_limiter_slope);
+
+static const char * const nau8821_detection_attack_time[] = {
+	"Ts", "3Ts", "7Ts", "15Ts", "31Ts", "63Ts", "127Ts", "255Ts",
+	"", "511Ts" };
+
+static const struct soc_enum nau8821_detection_attack_time_enum =
+	SOC_ENUM_SINGLE(NAU8821_R39_ADC_DRC_ATKDCY,
+		NAU8821_DRC_PK_COEF1_ADC_SFT,
+		ARRAY_SIZE(nau8821_detection_attack_time),
+		nau8821_detection_attack_time);
+
+static const char * const nau8821_detection_release_time[] = {
+	"63Ts", "127Ts", "255Ts", "511Ts", "1023Ts", "2047Ts", "4095Ts",
+	"8191Ts", "", "16383Ts" };
+
+static const struct soc_enum nau8821_detection_release_time_enum =
+	SOC_ENUM_SINGLE(NAU8821_R39_ADC_DRC_ATKDCY,
+		NAU8821_DRC_PK_COEF2_ADC_SFT,
+		ARRAY_SIZE(nau8821_detection_release_time),
+		nau8821_detection_release_time);
+
+static const char * const nau8821_attack_time[] = {
+	"Ts", "3Ts", "7Ts", "15Ts", "31Ts", "63Ts", "127Ts", "255Ts",
+	"511Ts", "1023Ts", "2047Ts", "4095Ts", "8191Ts" };
+
+static const struct soc_enum nau8821_attack_time_enum =
+	SOC_ENUM_SINGLE(NAU8821_R39_ADC_DRC_ATKDCY, NAU8821_DRC_ATK_ADC_SFT,
+		ARRAY_SIZE(nau8821_attack_time), nau8821_attack_time);
+
+static const char * const nau8821_decay_time[] = {
+	"63Ts", "127Ts", "255Ts", "511Ts", "1023Ts", "2047Ts", "4095Ts",
+	"8191Ts", "16383Ts", "32757Ts", "65535Ts" };
+
+static const struct soc_enum nau8821_decay_time_enum =
+	SOC_ENUM_SINGLE(NAU8821_R39_ADC_DRC_ATKDCY, NAU8821_DRC_DCY_ADC_SFT,
+		ARRAY_SIZE(nau8821_decay_time), nau8821_decay_time);
+
 static const DECLARE_TLV_DB_MINMAX_MUTE(adc_vol_tlv, -6600, 2400);
 static const DECLARE_TLV_DB_MINMAX_MUTE(sidetone_vol_tlv, -4200, 0);
 static const DECLARE_TLV_DB_MINMAX(hp_vol_tlv, -900, 0);
 static const DECLARE_TLV_DB_SCALE(playback_vol_tlv, -6600, 50, 1);
 static const DECLARE_TLV_DB_MINMAX(fepga_gain_tlv, -100, 3600);
 static const DECLARE_TLV_DB_MINMAX_MUTE(crosstalk_vol_tlv, -7000, 2400);
+static const DECLARE_TLV_DB_MINMAX(drc_knee4_tlv, -9800, -3500);
+static const DECLARE_TLV_DB_MINMAX(drc_knee3_tlv, -8100, -1800);
 
 static const struct snd_kcontrol_new nau8821_controls[] = {
 	SOC_DOUBLE_TLV("Mic Volume", NAU8821_R35_ADC_DGAIN_CTRL1,
@@ -346,6 +426,22 @@ static const struct snd_kcontrol_new nau8821_controls[] = {
 	SOC_DOUBLE_TLV("Headphone Crosstalk Volume",
 		NAU8821_R2F_DAC_DGAIN_CTRL,
 		0, 8, 0xff, 0, crosstalk_vol_tlv),
+	SOC_SINGLE_TLV("ADC DRC KNEE4", NAU8821_R37_ADC_DRC_KNEE_IP34,
+		NAU8821_DRC_KNEE4_IP_ADC_SFT, 0x3f, 1, drc_knee4_tlv),
+	SOC_SINGLE_TLV("ADC DRC KNEE3", NAU8821_R37_ADC_DRC_KNEE_IP34,
+		NAU8821_DRC_KNEE3_IP_ADC_SFT, 0x3f, 1, drc_knee3_tlv),
+
+	SOC_ENUM("ADC DRC Noise Gate", nau8821_adc_drc_noise_gate_enum),
+	SOC_ENUM("ADC DRC Expansion Slope", nau8821_adc_drc_expansion_slope_enum),
+	SOC_ENUM("ADC DRC Lower Region", nau8821_adc_drc_lower_region_enum),
+	SOC_ENUM("ADC DRC Higher Region", nau8821_higher_region_enum),
+	SOC_ENUM("ADC DRC Limiter Slope", nau8821_limiter_slope_enum),
+	SOC_ENUM("ADC DRC Peak Detection Attack Time", nau8821_detection_attack_time_enum),
+	SOC_ENUM("ADC DRC Peak Detection Release Time", nau8821_detection_release_time_enum),
+	SOC_ENUM("ADC DRC Attack Time", nau8821_attack_time_enum),
+	SOC_ENUM("ADC DRC Decay Time", nau8821_decay_time_enum),
+	SOC_SINGLE("DRC Enable Switch", NAU8821_R36_ADC_DRC_KNEE_IP12,
+		NAU8821_DRC_ENA_ADC_SFT, 1, 0),
 
 	SOC_ENUM("ADC Decimation Rate", nau8821_adc_decimation_enum),
 	SOC_ENUM("DAC Oversampling Rate", nau8821_dac_oversampl_enum),
diff --git a/sound/soc/codecs/nau8821.h b/sound/soc/codecs/nau8821.h
index c44251f54d48..d962293c218e 100644
--- a/sound/soc/codecs/nau8821.h
+++ b/sound/soc/codecs/nau8821.h
@@ -350,6 +350,29 @@
 #define NAU8821_ADCL_CH_VOL_SFT	        0
 #define NAU8821_ADCL_CH_VOL_MASK	0xff
 
+/* ADC_DRC_KNEE_IP12 (0x36) */
+#define NAU8821_DRC_ENA_ADC_SFT		15
+#define NAU8821_DRC_ENA_ADC_EN		(0x1 << NAU8821_DRC_ENA_ADC_SFT)
+
+/* ADC_DRC_KNEE_IP34 (0x37) */
+#define NAU8821_DRC_KNEE4_IP_ADC_SFT	8
+#define NAU8821_DRC_KNEE4_IP_ADC_MASK	(0xff << NAU8821_DRC_KNEE4_IP_ADC_SFT)
+#define NAU8821_DRC_KNEE3_IP_ADC_SFT	0
+#define NAU8821_DRC_KNEE3_IP_ADC_MASK	0xff
+
+/* ADC_DRC_SLOPES (0x38) */
+#define NAU8821_DRC_NG_SLP_ADC_SFT	12
+#define NAU8821_DRC_EXP_SLP_ADC_SFT	9
+#define NAU8821_DRC_CMP2_SLP_ADC_SFT	6
+#define NAU8821_DRC_CMP1_SLP_ADC_SFT	3
+#define NAU8821_DRC_LMT_SLP_ADC_SFT	0
+
+/* ADC_DRC_ATKDCY (0x39) */
+#define NAU8821_DRC_PK_COEF1_ADC_SFT	12
+#define NAU8821_DRC_PK_COEF2_ADC_SFT	8
+#define NAU8821_DRC_ATK_ADC_SFT		4
+#define NAU8821_DRC_DCY_ADC_SFT		0
+
 /* BIQ1_COF10 (0x4a) */
 #define NAU8821_BIQ1_DAC_EN_SFT	        3
 #define NAU8821_BIQ1_DAC_EN_EN          (0x1 << NAU8821_BIQ1_DAC_EN_SFT)
-- 
2.30.2

