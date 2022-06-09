Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 720DF5449E2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 13:20:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF2A51F7A;
	Thu,  9 Jun 2022 13:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF2A51F7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654773647;
	bh=rEABn2US601ffFSeWfrgDDCwqCQBhDp7BcWCI7Y6IbQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lALMWSTaQl4yCtjFyT3UCqq6CfzqaKMpxqh+I5KotEYJaxGK5HSqK8qUdjJw1g0c9
	 EN+WBIhpRzTh58g07Xffli4INJDLV2Ak79SakDCL5IOn1Y2U1rs+f/fknXXI7COvrf
	 06tEIXQXxnWbSukNsKy07KFtkS0pLaxhKzSHw+6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0CE2F804BD;
	Thu,  9 Jun 2022 13:19:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 818D1F804BD; Thu,  9 Jun 2022 13:19:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58AB0F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 13:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58AB0F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oRimfVOL"
Received: by mail-wr1-x434.google.com with SMTP id o8so4106248wro.3
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 04:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FO/y+Xl/nYjfPPEc3rgv0RHcVSPJe5N+/mRzl5i3y4A=;
 b=oRimfVOLAMrzs3W4YI/uKTBmUgOn+kEn6h8yO7geBYuYouI0PRDInPVmnoYza+uhxq
 TfwfOgtR4i5iEJE1EErXzjMZ9XsLl/oqXnUQU4hP6wXwWbssD/+E9pPARTeztBcz+Unf
 IWrPDkciy4/thi6XRxUQw2qMeGZpNxw/kUc1pcR5ZqN/WXzNIe3WR3CZRtPO45dNJBh/
 RfXBEZxt4gMythKe8BXYXXWbPCsq/HwpTTqdd3G37ThyY0ne9IgsgZhW7Sb7j2rePUBH
 +veIxj8bCbN8xateH9AUonm9ZoVyYt4d4zH9NtljCP+nRwvyGsVDuXy2c+XrU7Aj8rEG
 CkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FO/y+Xl/nYjfPPEc3rgv0RHcVSPJe5N+/mRzl5i3y4A=;
 b=au5WWiOjRcU+uBxw1uA3oAzQA/G45vozAwvNE0vP/HJGnz3zfIrYUI7Gs1e+g5NIkj
 uVtt7IwAuOwk44iJA/mhirDxqPg/2oORDqn34fSK8B/RylUWEDh8NC+w4nF+XKLmy+rH
 NBNJPxrr6PxfeMrZxk21lNbXEB6E9MnY8lga5K46HJZ/2/ntl1cwqgTyrCF0NGK4+Eng
 8HJVF9oXu0ZdJh7haOenEhywzTV8y98iMz4kRyYJdk3Dwq5n+RRIwXo9bJMSW8j/ivuj
 I0629p3lUgI/szo02UZevbqLSYb6uvJhSUA1Yq6nGE0KTCIVqhlsIUjID2xlibW/dSVA
 4s7A==
X-Gm-Message-State: AOAM531UJaIgL7gM5MXqQNucInHwoS33y4C2ppAG/ibRxWpqd9b3mxFM
 GW3MqK+fuFQWMuhx5j26yHZe2g==
X-Google-Smtp-Source: ABdhPJy99C7EmQWXmN9ew1aJ94+Hohh4bCwC8l9VmgHJhn5iP6k+nPZ/sxc4E1j+oR6ZgP/euv5X1Q==
X-Received: by 2002:a05:6000:1683:b0:218:54a2:71cc with SMTP id
 y3-20020a056000168300b0021854a271ccmr12335075wrd.417.1654773552426; 
 Thu, 09 Jun 2022 04:19:12 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a1c7516000000b003942a244ed1sm26477850wmc.22.2022.06.09.04.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 04:19:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: codecs: msm8916-wcd-digital: move gains from SX_TLV
 to S8_TLV
Date: Thu,  9 Jun 2022 12:19:00 +0100
Message-Id: <20220609111901.318047-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609111901.318047-1-srinivas.kandagatla@linaro.org>
References: <20220609111901.318047-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

move all the digital gains form using SX_TLV to S8_TLV, these gains are
actually 8 bit gains with 7th signed bit and ranges from -84dB to +40dB

rest of the Qualcomm wcd codecs uses these properly.

Fixes: ef8a4757a6db ("ASoC: msm8916-wcd-digital: Add sidetone support")
Fixes: 150db8c5afa1 ("ASoC: codecs: Add msm8916-wcd digital codec")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/msm8916-wcd-digital.c | 46 +++++++++++++-------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
index 20a07c92b2fc..098a58990f07 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -328,8 +328,8 @@ static const struct snd_kcontrol_new rx1_mix2_inp1_mux = SOC_DAPM_ENUM(
 static const struct snd_kcontrol_new rx2_mix2_inp1_mux = SOC_DAPM_ENUM(
 				"RX2 MIX2 INP1 Mux", rx2_mix2_inp1_chain_enum);
 
-/* Digital Gain control -38.4 dB to +38.4 dB in 0.3 dB steps */
-static const DECLARE_TLV_DB_SCALE(digital_gain, -3840, 30, 0);
+/* Digital Gain control -84 dB to +40 dB in 1 dB steps */
+static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
 
 /* Cutoff Freq for High Pass Filter at -3dB */
 static const char * const hpf_cutoff_text[] = {
@@ -510,15 +510,15 @@ static int wcd_iir_filter_info(struct snd_kcontrol *kcontrol,
 
 static const struct snd_kcontrol_new msm8916_wcd_digital_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("RX1 Digital Volume", LPASS_CDC_RX1_VOL_CTL_B2_CTL,
-			  -128, 127, digital_gain),
+			-84, 40, digital_gain),
 	SOC_SINGLE_S8_TLV("RX2 Digital Volume", LPASS_CDC_RX2_VOL_CTL_B2_CTL,
-			  -128, 127, digital_gain),
+			-84, 40, digital_gain),
 	SOC_SINGLE_S8_TLV("RX3 Digital Volume", LPASS_CDC_RX3_VOL_CTL_B2_CTL,
-			  -128, 127, digital_gain),
+			-84, 40, digital_gain),
 	SOC_SINGLE_S8_TLV("TX1 Digital Volume", LPASS_CDC_TX1_VOL_CTL_GAIN,
-			  -128, 127, digital_gain),
+			-84, 40, digital_gain),
 	SOC_SINGLE_S8_TLV("TX2 Digital Volume", LPASS_CDC_TX2_VOL_CTL_GAIN,
-			  -128, 127, digital_gain),
+			-84, 40, digital_gain),
 	SOC_ENUM("TX1 HPF Cutoff", tx1_hpf_cutoff_enum),
 	SOC_ENUM("TX2 HPF Cutoff", tx2_hpf_cutoff_enum),
 	SOC_SINGLE("TX1 HPF Switch", LPASS_CDC_TX1_MUX_CTL, 3, 1, 0),
@@ -553,22 +553,22 @@ static const struct snd_kcontrol_new msm8916_wcd_digital_snd_controls[] = {
 	WCD_IIR_FILTER_CTL("IIR2 Band3", IIR2, BAND3),
 	WCD_IIR_FILTER_CTL("IIR2 Band4", IIR2, BAND4),
 	WCD_IIR_FILTER_CTL("IIR2 Band5", IIR2, BAND5),
-	SOC_SINGLE_SX_TLV("IIR1 INP1 Volume", LPASS_CDC_IIR1_GAIN_B1_CTL,
-			0,  -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("IIR1 INP2 Volume", LPASS_CDC_IIR1_GAIN_B2_CTL,
-			0,  -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("IIR1 INP3 Volume", LPASS_CDC_IIR1_GAIN_B3_CTL,
-			0,  -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("IIR1 INP4 Volume", LPASS_CDC_IIR1_GAIN_B4_CTL,
-			0,  -84,	40, digital_gain),
-	SOC_SINGLE_SX_TLV("IIR2 INP1 Volume", LPASS_CDC_IIR2_GAIN_B1_CTL,
-			0,  -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("IIR2 INP2 Volume", LPASS_CDC_IIR2_GAIN_B2_CTL,
-			0,  -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("IIR2 INP3 Volume", LPASS_CDC_IIR2_GAIN_B3_CTL,
-			0,  -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("IIR2 INP4 Volume", LPASS_CDC_IIR2_GAIN_B4_CTL,
-			0,  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("IIR1 INP1 Volume", LPASS_CDC_IIR1_GAIN_B1_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("IIR1 INP2 Volume", LPASS_CDC_IIR1_GAIN_B2_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("IIR1 INP3 Volume", LPASS_CDC_IIR1_GAIN_B3_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("IIR1 INP4 Volume", LPASS_CDC_IIR1_GAIN_B4_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("IIR2 INP1 Volume", LPASS_CDC_IIR2_GAIN_B1_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("IIR2 INP2 Volume", LPASS_CDC_IIR2_GAIN_B2_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("IIR2 INP3 Volume", LPASS_CDC_IIR2_GAIN_B3_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("IIR2 INP4 Volume", LPASS_CDC_IIR2_GAIN_B4_CTL,
+			-84, 40, digital_gain),
 
 };
 
-- 
2.25.1

