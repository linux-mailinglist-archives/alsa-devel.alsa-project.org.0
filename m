Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD33F5FAC22
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 08:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B4AC36BE;
	Tue, 11 Oct 2022 08:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B4AC36BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665468425;
	bh=hvfQhmtYqXaeeZxq8vaiJnom1BgHW5coa18GsjyV0AI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S0c9SyAJuXh62zbDFeMnBMgVOuzrXPSPPoWdcUjCvsIygcw8myotsXAFJ6combOrQ
	 0UAMH30XdeuJrA5t3cKBIg7CH25/hA5zzihtZQdhJcFxQdJXt7Cdw1dAwynroxknvt
	 vgHXs9WXeBDdGL0/p8JjNsJBzaM3vcSDZcy9Xz/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3873F805B2;
	Tue, 11 Oct 2022 08:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5563CF80256; Mon, 10 Oct 2022 20:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C35DF804AE
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 20:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C35DF804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g6GYJi+i"
Received: by mail-wr1-x435.google.com with SMTP id j7so18329544wrr.3
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 11:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0HKAhNdOKF1crgdkmfV9uw0DtKONIzdjDGfK2eaD40=;
 b=g6GYJi+i1RYgpcsc2FaPpiuxZz2OwbN4bkiNrA3qiCo061dhszzksEbCyV8xT2iRXg
 V0JoehCp9TO8iUWzX/yS1peMDKGQ++SyIFfYyZj7rvwD8afHP/2DSSwo9b1VIg8KxQqu
 MXzKq14gqz+zmaOouTfag3SRrcKDZiND9OfgnTRammxj6vrm6bg+pxT4UY+ZaCTV1J7a
 Bx1bgPe1cXG3dgK+hPOj9caNLrvWT3V3JnIGv9BmTBngK+zQLAYisVE7Fr2gskPH0sOh
 xvRwOoPkrYNl4oWcWjSQf85y+WGi1mLAaU76Tv/2oXNfX+QNP8wOtzooRkvKlkAa1hyJ
 0DHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0HKAhNdOKF1crgdkmfV9uw0DtKONIzdjDGfK2eaD40=;
 b=mdbZcKz8CQD+qTco0fRWD2dtcY/hHQruxc+VyROl231qljSEmbfMakn1tp5uxrtBrV
 Q7M8AX3zPg6/g4n1GCBFkVhKhBdR9gKSXelxt6+ZKRF0nxao02apKGQwnmmRpyp6Zt0j
 8FwJ5xtmPzr3A3sKnzFWYr6QcoI/WgHfYuXrg1ZW2TfUm7c8lI5xUnZgL1pvfdNtidxF
 4KFWxLG2iZ7Y9zL9ev7In4URrSQ7hEt2EykNqRnb+1rlboqm4J/MIfJoFwrkoSr90Jdf
 LRagq8AvxhWHWqg1XsMVcwzcgNLGvEBNP5L4X4wtqHXC/XsLHTI87omy3ebd/Lhw/xvi
 MIlg==
X-Gm-Message-State: ACrzQf2KzevqsjiVQo0nPh9xPXmDb3/l8ulheKtKhFGyPmxmBW2ehJCF
 aORYYTMeQfMmUT3NaJSSwiA=
X-Google-Smtp-Source: AMsMyM7M6A5MM0GdcXezHZYlOJYNlypNddtCR4gt9oyL9mZKAIqhFKcbNCwVzt0j7ZDFVe7Wky4s3g==
X-Received: by 2002:a5d:64af:0:b0:230:1aca:634 with SMTP id
 m15-20020a5d64af000000b002301aca0634mr5920199wrp.74.1665428099994; 
 Mon, 10 Oct 2022 11:54:59 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-126-34-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.34.126])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a5d6142000000b00230c9d427f9sm2082272wrt.53.2022.10.10.11.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 11:54:59 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v2 6/6] ASoC: codecs: jz4725b: add missed Mixer inputs
Date: Mon, 10 Oct 2022 21:54:23 +0300
Message-Id: <20221010185423.3167208-7-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221010185423.3167208-1-lis8215@gmail.com>
References: <Y0P/u4pJT8rup8Za@sirena.org.uk>
 <20221010185423.3167208-1-lis8215@gmail.com>
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
index 6614c5e37..22763bb1e 100644
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

