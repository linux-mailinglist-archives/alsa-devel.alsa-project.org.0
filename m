Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3015FAC12
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 08:03:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95F0E36B6;
	Tue, 11 Oct 2022 08:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95F0E36B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665468223;
	bh=Y051KI/Hjr6f43VLphgkGHvXxmr3G87P3iDh96isxe0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=muVABJ0/13jJCs41jkkADuCi48qXg8A5osI05+h6C8n1jFmKHmmJlFwrVJ4EXXgvK
	 lqE6HC4R9b6YdY3pYth0aztZQCFW8tRA70+15wWqPQbMMzh3mOjBU/QVeFFtE37Xcr
	 2N5j4wXXlNn7ZcuuaoTXg53rdKWRN0MmWBHl1ZFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 469E7F80301;
	Tue, 11 Oct 2022 08:02:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74DFCF80272; Sat,  8 Oct 2022 20:18:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC92BF800B8
 for <alsa-devel@alsa-project.org>; Sat,  8 Oct 2022 20:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC92BF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fSJ6K6v4"
Received: by mail-wr1-x430.google.com with SMTP id bu30so11500088wrb.8
 for <alsa-devel@alsa-project.org>; Sat, 08 Oct 2022 11:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tr17bxY0fOD2w+6Sv6/CDF1GUcp2o7Im0i7LAvM8KmE=;
 b=fSJ6K6v404g9VCoT8DtNgCoad9nUwj3GtiCYRAGbZj97adA9DDxz08LM2y8J4vWhFn
 aMbdSHOLfDCfAn0JHjUok1JgDurWU4rO/iH2neuEe5f/R0CEG2ssUthr+eWPK9uFVnD/
 Yc2Nq7TuJxYyGIsMcobz5uhEduAnSCjElnvH/9ONQh2VcTGVrQITG3dgc3YUthhRjh1S
 tt80yAWpc9w6QzjmTvYfAMPG1CTDMl+UI/UP2kA0WxgF1WTKmmNcj/OZlFRpP+i965K4
 mlAm4Dy4B1obUb6WYjFXtayvSvI8Kf5NGdv1MJKJYo4fXzBrmKQXK+Hx+iW6KDFQG8iO
 0KMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tr17bxY0fOD2w+6Sv6/CDF1GUcp2o7Im0i7LAvM8KmE=;
 b=xHjQvgZ6FnyHCnX1/4Zfn1HxGUUDQ46UQYchps8q/Uwu/m0XfjCYTu110LGHX2Zpon
 Ouo3S8az8OC6sCGTYTqJ3VD8JrLxB6bYFSkuOE6Zh0jg+K+NGyZUEX5PicnLT9ELG7b0
 0KfeHV/UQ1hzdFxw8/W4bDjCMMuFZlen6bfKCRjFBdP7sUhqfgSgD6xUQjRLCPlkc35a
 pQy36VPbfXc82odDw17dRtH/STgq7pZ5HmpS/735WbpvRXmqkUNY5h2jUriGuWkOrqF5
 onWwvRk6lBKCjx0cOWPkCz2BRSeO2lwnnr0Jztgu5Fek5DanBOfdw+E8qQBvgc4qZowQ
 I1KA==
X-Gm-Message-State: ACrzQf1RaOEuTzktWZQ9KzeegdKf2XeiH4hWQrGINkBrz2nM+67m9EXQ
 ch9/jON+J3n55DO6VXzzIPg=
X-Google-Smtp-Source: AMsMyM4I8m+Q/WjMJXJOXTUikLzbr8WkzfQEFi4tv8QWi3lZeaMnXWsRxTlp3nr645uApGD2BBkqaQ==
X-Received: by 2002:a5d:608d:0:b0:22e:7bde:c19d with SMTP id
 w13-20020a5d608d000000b0022e7bdec19dmr6622534wrt.494.1665253112713; 
 Sat, 08 Oct 2022 11:18:32 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-190-37-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.37.190])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a05600c0a4800b003b4fdbb6319sm12679000wmq.21.2022.10.08.11.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 11:18:32 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH] ASoC: codecs: jz4725b: Various improvements and fixes
Date: Sat,  8 Oct 2022 21:16:55 +0300
Message-Id: <20221008181655.2747857-1-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Oct 2022 08:02:21 +0200
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Siarhei Volkau <lis8215@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

The patch fixes:
- incorrectly represented dB values in alsamixer, et al.
- Line In path stays powered off during capturing or
  bypass to mixer.

The patch improves:
- Exposes all mixer inputs (both Mics, LineIn and DAC) with their
  gain controls.
- Exposes output stage (post mixer) gain control and makes it new
  Master playback gain, DAC gain was the previous master.
  However, no Master mute now.

Known issues:
- Bypass path enablement isn't applied immediately, for make
  things going bit clock needs to be triggered for a bit,
  e.g. by aplay dummy.wav
  It might be a hardware bug, since the bit clock isn't
  declared as required for codec operation.

Tested on:
- Ritmix RZX-27 (jz4725b).
- Ritmix RZX-50 (jz4755).

Tested-by: Siarhei Volkau <lis8215@gmail.com>
Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 81 ++++++++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 5201a8f6d..29f188800 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -136,28 +136,80 @@ enum {
 #define REG_CGR3_GO1L_OFFSET		0
 #define REG_CGR3_GO1L_MASK		(0x1f << REG_CGR3_GO1L_OFFSET)
 
+#define REG_CGR4_GO2R_OFFSET		0
+#define REG_CGR4_GO2R_MASK		(0x1f << REG_CGR4_GO2R_OFFSET)
+
+#define REG_CGR5_GO2L_OFFSET		0
+#define REG_CGR5_GO2L_MASK		(0x1f << REG_CGR5_GO2L_OFFSET)
+
+#define REG_CGR6_GO3R_OFFSET		0
+#define REG_CGR6_GO3R_MASK		(0x1f << REG_CGR6_GO3R_OFFSET)
+
+#define REG_CGR7_GO3L_OFFSET		0
+#define REG_CGR7_GO3L_MASK		(0x1f << REG_CGR7_GO3L_OFFSET)
+
+#define REG_CGR8_GOR_OFFSET		0
+#define REG_CGR8_GOR_MASK		(0x1f << REG_CGR8_GOR_OFFSET)
+
+#define REG_CGR9_GOL_OFFSET		0
+#define REG_CGR9_GOL_MASK		(0x1f << REG_CGR9_GOL_OFFSET)
+
+#define REG_CGR10_GIL_OFFSET		0
+#define REG_CGR10_GIR_OFFSET		4
+
 struct jz_icdc {
 	struct regmap *regmap;
 	void __iomem *base;
 	struct clk *clk;
 };
 
-static const SNDRV_CTL_TLVD_DECLARE_DB_LINEAR(jz4725b_dac_tlv, -2250, 0);
-static const SNDRV_CTL_TLVD_DECLARE_DB_LINEAR(jz4725b_line_tlv, -1500, 600);
+static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_dac_tlv, -2250, 150, 0);
+static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_adc_tlv,     0, 150, 0);
+static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(jz4725b_mix_tlv,
+	 0, 11, TLV_DB_SCALE_ITEM(-2250,   0, 0),
+	12, 31, TLV_DB_SCALE_ITEM(-2250, 150, 0),
+);
+
+static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(jz4725b_out_tlv,
+	 0, 11, TLV_DB_SCALE_ITEM(-3350, 200, 0),
+	12, 23, TLV_DB_SCALE_ITEM(-1050, 100, 0),
+	24, 31, TLV_DB_SCALE_ITEM(  100,  50, 0),
+);
 
 static const struct snd_kcontrol_new jz4725b_codec_controls[] = {
-	SOC_DOUBLE_TLV("Master Playback Volume",
+	SOC_DOUBLE_TLV("DAC Playback Volume",
 		       JZ4725B_CODEC_REG_CGR1,
 		       REG_CGR1_GODL_OFFSET,
 		       REG_CGR1_GODR_OFFSET,
 		       0xf, 1, jz4725b_dac_tlv),
-	SOC_DOUBLE_R_TLV("Master Capture Volume",
+	SOC_DOUBLE_TLV("Master Capture Volume",
+		       JZ4725B_CODEC_REG_CGR10,
+		       REG_CGR10_GIL_OFFSET,
+		       REG_CGR10_GIR_OFFSET,
+		       0xf, 0, jz4725b_adc_tlv),
+	SOC_DOUBLE_R_TLV("Mixer Line In Bypass Playback Volume",
 			 JZ4725B_CODEC_REG_CGR3,
 			 JZ4725B_CODEC_REG_CGR2,
 			 REG_CGR2_GO1R_OFFSET,
-			 0x1f, 1, jz4725b_line_tlv),
-
-	SOC_SINGLE("Master Playback Switch", JZ4725B_CODEC_REG_CR1,
+			 0x1f, 1, jz4725b_mix_tlv),
+	SOC_DOUBLE_R_TLV("Mixer Mic 1 Bypass Playback Volume",
+			 JZ4725B_CODEC_REG_CGR5,
+			 JZ4725B_CODEC_REG_CGR4,
+			 REG_CGR4_GO2R_OFFSET,
+			 0x1f, 1, jz4725b_mix_tlv),
+	SOC_DOUBLE_R_TLV("Mixer Mic 2 Bypass Playback Volume",
+			 JZ4725B_CODEC_REG_CGR7,
+			 JZ4725B_CODEC_REG_CGR6,
+			 REG_CGR6_GO3R_OFFSET,
+			 0x1f, 1, jz4725b_mix_tlv),
+
+	SOC_DOUBLE_R_TLV("Master Playback Volume",
+			 JZ4725B_CODEC_REG_CGR9,
+			 JZ4725B_CODEC_REG_CGR8,
+			 REG_CGR8_GOR_OFFSET,
+			 0x1f, 1, jz4725b_out_tlv),
+
+	SOC_SINGLE("DAC Playback Switch", JZ4725B_CODEC_REG_CR1,
 		   REG_CR1_DAC_MUTE_OFFSET, 1, 1),
 
 	SOC_SINGLE("Deemphasize Filter Playback Switch",
@@ -180,11 +232,15 @@ static SOC_VALUE_ENUM_SINGLE_DECL(jz4725b_codec_adc_src_enum,
 				  jz4725b_codec_adc_src_texts,
 				  jz4725b_codec_adc_src_values);
 static const struct snd_kcontrol_new jz4725b_codec_adc_src_ctrl =
-			SOC_DAPM_ENUM("Route", jz4725b_codec_adc_src_enum);
+	SOC_DAPM_ENUM("ADC Source Capture Route", jz4725b_codec_adc_src_enum);
 
 static const struct snd_kcontrol_new jz4725b_codec_mixer_controls[] = {
-	SOC_DAPM_SINGLE("Line In Bypass", JZ4725B_CODEC_REG_CR1,
+	SOC_DAPM_SINGLE("Line In Bypass Playback Switch", JZ4725B_CODEC_REG_CR1,
 			REG_CR1_BYPASS_OFFSET, 1, 0),
+	SOC_DAPM_SINGLE("Mic 1 Bypass Playback Switch", JZ4725B_CODEC_REG_CR3,
+			REG_CR3_SIDETONE1_OFFSET, 1, 0),
+	SOC_DAPM_SINGLE("Mic 2 Bypass Playback Switch", JZ4725B_CODEC_REG_CR3,
+			REG_CR3_SIDETONE2_OFFSET, 1, 0),
 };
 
 static int jz4725b_out_stage_enable(struct snd_soc_dapm_widget *w,
@@ -236,7 +292,8 @@ static const struct snd_soc_dapm_widget jz4725b_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("DAC to Mixer", JZ4725B_CODEC_REG_CR1,
 			   REG_CR1_DACSEL_OFFSET, 0, NULL, 0),
 
-	SND_SOC_DAPM_MIXER("Line In", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("Line In", JZ4725B_CODEC_REG_PMR1,
+			   REG_PMR1_SB_LIN_OFFSET, 1, NULL, 0),
 	SND_SOC_DAPM_MIXER("HP Out", JZ4725B_CODEC_REG_CR1,
 			   REG_CR1_HP_DIS_OFFSET, 1, NULL, 0),
 
@@ -278,7 +335,9 @@ static const struct snd_soc_dapm_route jz4725b_codec_dapm_routes[] = {
 	{"Line In", NULL, "LLINEIN"},
 	{"Line In", NULL, "RLINEIN"},
 
-	{"Mixer", "Line In Bypass", "Line In"},
+	{"Mixer", "Mic 1 Bypass Playback Switch", "Mic 1"},
+	{"Mixer", "Mic 2 Bypass Playback Switch", "Mic 2"},
+	{"Mixer", "Line In Bypass Playback Switch", "Line In"},
 	{"DAC to Mixer", NULL, "DAC"},
 	{"Mixer", NULL, "DAC to Mixer"},
 
-- 
2.36.1

