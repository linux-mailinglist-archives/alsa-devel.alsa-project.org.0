Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5924805EA
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Dec 2021 04:52:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A02C5170A;
	Tue, 28 Dec 2021 04:51:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A02C5170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640663551;
	bh=QtJhYXE65JCFsvRhJfY98ZQoMIViWGMAlPiLgR2tsXY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d/AFgayANSN/SClzC1slCjJFoHkuXTB+JZmZUU9W4Yic5ZE8OP+NfV/aB5N58zW85
	 i9flEzmLCwqHy3g9qRV+dDwwTf5lMNkCUmrGxosU2lc++BL6cuQuePJIqSH0eb4Ske
	 dLnNJRG3QXMO7Sbo7Pjpc/c0weW1J/UR6gq+J37w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB6AF800D3;
	Tue, 28 Dec 2021 04:51:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F625F800D3; Tue, 28 Dec 2021 04:51:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 9C8F7F800D3
 for <alsa-devel@alsa-project.org>; Tue, 28 Dec 2021 04:51:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C8F7F800D3
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
 by maillog.nuvoton.com (Postfix) with ESMTP id 8DF4A1C80F18;
 Tue, 28 Dec 2021 11:51:07 +0800 (CST)
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 28 Dec
 2021 11:51:07 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 28 Dec 2021 11:51:07 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: nau8821: Add DMIC selections.
Date: Tue, 28 Dec 2021 11:51:01 +0800
Message-ID: <20211228035101.2973294-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, wtli@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 CTLIN0@nuvoton.com, dardar923@gmail.com, supercraig0719@gmail.com
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

Add the following two control options:
1. DMIC pin slew rate selection.
2. DMIC clock speed selection.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 sound/soc/codecs/nau8821.c | 79 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/nau8821.h |  6 ++-
 2 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 2de818377484..52cdbf263e42 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -305,6 +305,66 @@ static int nau8821_biq_coeff_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int nau8821_slew_rate_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+	unsigned int value;
+
+	regmap_read(nau8821->regmap, NAU8821_R13_DMIC_CTRL, &value);
+	nau8821->def_mclk_src = (value & NAU8821_DMIC_SLEW_MASK)
+		>> NAU8821_DMIC_SLEW_SFT;
+	ucontrol->value.bytes.data[0] = nau8821->def_mclk_src;
+
+	return 0;
+}
+
+static int nau8821_slew_rate_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+
+	nau8821->def_mclk_src = ucontrol->value.integer.value[0];
+
+	regmap_update_bits(component->regmap, NAU8821_R13_DMIC_CTRL,
+		NAU8821_DMIC_SLEW_MASK,
+		nau8821->def_mclk_src << NAU8821_DMIC_SLEW_SFT);
+
+	return 0;
+}
+
+static int nau8821_dmic_clock_speed_get(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+	unsigned int value;
+
+	regmap_read(nau8821->regmap, NAU8821_R13_DMIC_CTRL, &value);
+	nau8821->def_dmic_clock = (value & NAU8821_DMIC_SRC_MASK)
+		>> NAU8821_DMIC_SRC_SFT;
+	ucontrol->value.bytes.data[0] = nau8821->def_dmic_clock;
+
+	return 0;
+}
+
+static int nau8821_dmic_clock_speed_put(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+
+	nau8821->def_dmic_clock = ucontrol->value.integer.value[0];
+
+	regmap_update_bits(component->regmap, NAU8821_R13_DMIC_CTRL,
+		NAU8821_DMIC_SRC_MASK,
+		nau8821->def_dmic_clock << NAU8821_DMIC_SRC_SFT);
+
+	return 0;
+}
+
 static const char * const nau8821_adc_decimation[] = {
 	"32", "64", "128", "256" };
 
@@ -319,6 +379,20 @@ static const struct soc_enum nau8821_dac_oversampl_enum =
 	SOC_ENUM_SINGLE(NAU8821_R2C_DAC_CTRL1, NAU8821_DAC_OVERSAMPLE_SFT,
 		ARRAY_SIZE(nau8821_dac_oversampl), nau8821_dac_oversampl);
 
+static const char *const dmic_slew_text[] = {"0", "1", "2", "3", "4", "5",
+	"6", "7"};
+
+static const struct soc_enum nau8821_slew_rate_enum =
+		SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(dmic_slew_text),
+		dmic_slew_text);
+
+static const char *const dmic_clock_speed_text[] = {"3.072", "1.536", "0.768",
+	"0.384"};
+
+static const struct soc_enum nau8821_dmic_clock_speed_enum =
+		SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(dmic_clock_speed_text),
+		dmic_clock_speed_text);
+
 static const DECLARE_TLV_DB_MINMAX_MUTE(adc_vol_tlv, -6600, 2400);
 static const DECLARE_TLV_DB_MINMAX_MUTE(sidetone_vol_tlv, -4200, 0);
 static const DECLARE_TLV_DB_MINMAX(hp_vol_tlv, -900, 0);
@@ -350,6 +424,11 @@ static const struct snd_kcontrol_new nau8821_controls[] = {
 		nau8821_biq_coeff_get, nau8821_biq_coeff_put),
 	SOC_SINGLE("ADC Phase Switch", NAU8821_R1B_TDM_CTRL,
 		NAU8821_ADCPHS_SFT, 1, 0),
+	SOC_ENUM_EXT("Slew Rate Selection", nau8821_slew_rate_enum,
+			nau8821_slew_rate_get, nau8821_slew_rate_put),
+	SOC_ENUM_EXT("DMIC Clock Speed Selection",
+		nau8821_dmic_clock_speed_enum, nau8821_dmic_clock_speed_get,
+		nau8821_dmic_clock_speed_put),
 };
 
 static const struct snd_kcontrol_new nau8821_dmic_mode_switch =
diff --git a/sound/soc/codecs/nau8821.h b/sound/soc/codecs/nau8821.h
index a92edfeb9d3a..0ca099fa98bb 100644
--- a/sound/soc/codecs/nau8821.h
+++ b/sound/soc/codecs/nau8821.h
@@ -228,7 +228,7 @@
 #define NAU8821_IRQ_INSERT_DIS		0x1
 
 /* DMIC_CTRL (0x13) */
-#define NAU8821_DMIC_DS_SFT	7
+#define NAU8821_DMIC_DS_SFT	11
 #define NAU8821_DMIC_DS_MASK	(0x1 << NAU8821_DMIC_DS_SFT)
 #define NAU8821_DMIC_DS_HIGH	(0x1 << NAU8821_DMIC_DS_SFT)
 #define NAU8821_DMIC_DS_LOW	(0x0 << NAU8821_DMIC_DS_SFT)
@@ -236,6 +236,8 @@
 #define NAU8821_DMIC_SRC_MASK	(0x3 << NAU8821_DMIC_SRC_SFT)
 #define NAU8821_CLK_DMIC_SRC	(0x2 << NAU8821_DMIC_SRC_SFT)
 #define NAU8821_DMIC_EN_SFT	0
+#define NAU8821_DMIC_SLEW_SFT	8
+#define NAU8821_DMIC_SLEW_MASK	(0x7 << NAU8821_DMIC_SLEW_SFT)
 
 /* GPIO12_CTRL (0x1a) */
 #define NAU8821_JKDET_PULL_UP	(0x1 << 11) /* 0 - pull down, 1 - pull up */
@@ -525,6 +527,8 @@ struct nau8821 {
 	int jack_eject_debounce;
 	int fs;
 	int dmic_clk_threshold;
+	int def_mclk_src;
+	int def_dmic_clock;
 };
 
 int nau8821_enable_jack_detect(struct snd_soc_component *component,
-- 
2.25.1

