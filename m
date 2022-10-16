Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 072815FFFA8
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 15:30:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C37D61FA;
	Sun, 16 Oct 2022 15:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C37D61FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665927025;
	bh=I336HX1c2WRNZaW8fUehubG98LOs73CoXWdt9DyywFY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B5t0GEL2Wnpj0eNyly1v5AroBJIAYi+bku+Cx3AzJiCdAmazjqMqmuCjeLZeKGHOq
	 lHE5kJOwZSbVvp1YzVKfvBrxJyeLtu+oe1NbxJlHW51/za6HIzY4kdQoAFX/CqpEdj
	 XxJhQrDwrJ7V4IHzBpr2IIfuh9L4UkS0M2vcyOug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ABA8F8053D;
	Sun, 16 Oct 2022 15:28:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 812E5F80563; Sun, 16 Oct 2022 15:27:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAA4FF80551
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 15:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAA4FF80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mMrjWmGO"
Received: by mail-ej1-x632.google.com with SMTP id 13so19626731ejn.3
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J+d4zYZ2OcrExgu67AwFyCEVw5ZLbwcKQnaxEzIUbSA=;
 b=mMrjWmGOWPj+C9rRMvyoO46WUEnlfRtEdLgPUR+JGPnHwMPR8SDTdC/OMHqnsvlbsO
 uAwIB6Dii987acRt1fXMF5i0TMU353WzTrDYcnBf1Qy61/5fTgyC8ZS8q1Hmwna9zEgw
 nSx2+QuChjF4E/rqYhj+nfwQ4DnUPgSrjHvw5J0li9Xq4Pk8Ki+MDQU4fkddJfQQBRGN
 sMj6I/x54DLEW1hPsx03ZHWgDNs1SMxzWIZ7iOc/RFOv0ZhVw3EdwsHqdVzXP+4Hh6Kx
 Ikr4iJKaEMbWgE/CeGhUWMVACdvtHreTDJOj+9pdQ5Uq29sHodsIf3dVM08LZqBjQtQk
 ho6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+d4zYZ2OcrExgu67AwFyCEVw5ZLbwcKQnaxEzIUbSA=;
 b=1aOfULKZ7JGRrjvP+MBM8jPITy90ZojOwxg3k53p2RFr5G2M/j1f0YJZPOnxDcmzxh
 1ZELl71bn6iicS5dokZMSfcEP8V8YyhPT2a2Kf+zzCez5xhK1zVxZtRCeojPVcIe5T+G
 L4ywr3ktZG88dU2PFGyoOkqStlU+vWfjF3E9rFVZlE+xaar335j66f5N5EuudQuZkGmS
 5tuyBfSXRkhSD5hasOn0F8mxCPk4doUn70W3o17CDH4M9yDoWUOMwNSguWjUuCJY+ZwX
 7eNFBCCvv3BULdX8sxmwUAv3xou8glzzkRxQwJksh5vG7BPaR57zfDla4JpBN+rHreTz
 ozCQ==
X-Gm-Message-State: ACrzQf3Wo+KD7We5T7+GXkA+4b1RBrw0Dm8uYbHdhS0hqiTtcHH5oXX+
 0t/5J41RP6vDw0Z2Dp+8z5A=
X-Google-Smtp-Source: AMsMyM5dMNtbDLm6MEm7cnMuWNaK+QO5ZZ+c9vzpWV5tcd39S+YzfLjNrzXGd0ed3T23TkI0TChLQQ==
X-Received: by 2002:a17:906:8479:b0:78d:cf17:2d70 with SMTP id
 hx25-20020a170906847900b0078dcf172d70mr5129252ejc.319.1665926874773; 
 Sun, 16 Oct 2022 06:27:54 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-39-7-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.7.39])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa7ce85000000b0045c72bba0bfsm5572057edv.4.2022.10.16.06.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 06:27:54 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v3 6/7] ASoC: codecs: jz4725b: add missed Mixer inputs
Date: Sun, 16 Oct 2022 16:26:47 +0300
Message-Id: <20221016132648.3011729-7-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221016132648.3011729-1-lis8215@gmail.com>
References: <20221016132648.3011729-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Mixer couples analog input from 4 sources (DAC, Line In, Mic 1,
 Mic 2) each input has its own gain & mute controls.

At the moment only DAC is implemented fully and Line In path can be
switched on/off. The patch implements Mic 1 and Mic 2 paths and fully
implements Line In path.

Manual states that these controls (16.6.3.3 Programmable attenuation:
GOi) gain varies from -22.5dB to +6.0dB with 1.5dB step. Also there's
extra values below the minimum, but they behave the same as the minimum
value.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 42 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index c39398e0a..52b2bb95b 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -136,6 +136,18 @@ enum {
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
 #define REG_CGR8_GOR_OFFSET		0
 #define REG_CGR8_GOR_MASK		(0x1f << REG_CGR8_GOR_OFFSET)
 
@@ -153,6 +165,11 @@ struct jz_icdc {
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_adc_tlv,     0, 150, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_dac_tlv, -2250, 150, 0);
+static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(jz4725b_mix_tlv,
+	 0, 11, TLV_DB_SCALE_ITEM(-2250,   0, 0),
+	12, 31, TLV_DB_SCALE_ITEM(-2250, 150, 0),
+);
+
 static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(jz4725b_out_tlv,
 	 0, 11, TLV_DB_SCALE_ITEM(-3350, 200, 0),
 	12, 23, TLV_DB_SCALE_ITEM(-1050, 100, 0),
@@ -170,6 +187,21 @@ static const struct snd_kcontrol_new jz4725b_codec_controls[] = {
 		       REG_CGR10_GIL_OFFSET,
 		       REG_CGR10_GIR_OFFSET,
 		       0xf, 0, jz4725b_adc_tlv),
+	SOC_DOUBLE_R_TLV("Mixer Line In Bypass Playback Volume",
+			 JZ4725B_CODEC_REG_CGR3,
+			 JZ4725B_CODEC_REG_CGR2,
+			 REG_CGR2_GO1R_OFFSET,
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
 
 	SOC_DOUBLE_R_TLV("Master Playback Volume",
 			 JZ4725B_CODEC_REG_CGR9,
@@ -203,8 +235,12 @@ static const struct snd_kcontrol_new jz4725b_codec_adc_src_ctrl =
 	SOC_DAPM_ENUM("ADC Source Capture Route", jz4725b_codec_adc_src_enum);
 
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
@@ -299,7 +335,9 @@ static const struct snd_soc_dapm_route jz4725b_codec_dapm_routes[] = {
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

