Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8816D4BF7C6
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:05:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 133961825;
	Tue, 22 Feb 2022 13:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 133961825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531515;
	bh=X6//3mNKQ+iPoi8MRwWr//2U6e39CPxb8YCLNP1SE1s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FlTPLKJxBBrMXl5w9wHGFqgAX3chSXnLZySO+x+hWvCtlQOFToUT/DA2uBKlgKntv
	 PTrLwpfrHvmolTKMjW2Kyk6Iw3E4iB23dYvnHHieRQc7AqdLG8vtVTbZK4iw60yUdT
	 FT+GB6K2D7stD1JdKn94nMmO5dL8jJehWxYrPrNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8175F80579;
	Tue, 22 Feb 2022 13:00:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D48F7F80520; Tue, 22 Feb 2022 13:00:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B98E0F80520
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B98E0F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="x1SxOjEV"
Received: by mail-wr1-x42c.google.com with SMTP id s1so6314091wrg.10
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 04:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KcD87WuVqOE7wlGnuGasxFMiIGXUTo8Tdbjfbz+gy5A=;
 b=x1SxOjEVDF/UusL/0LmmHYeP0Ofgtl2s6OI52+vXm+z6+SMO49T6Id0LmiWeUHvsDH
 SpTiR+thuI4SqWpu2ywNUvbEfT1kEJJB8NtRY3bAZTJpg5aVcM4vc2G4SItQhBR5rr1b
 Xx00hhIXMj+QrW19dcIzCIXRL5hDOSDKGIkSFrjH9hqd3LCeWKhyWXoK1qQTJCc77P9D
 lr6ShwJhp2T/tmanl6XbQEDs/o1U5rbhgpT6m430LS2DnjIr8IBAbJLuNWbloc8wMBGc
 UwdTqrsM/NkXi4PZRZXO46e9uUiarx856HcPfqfr2VHsrlhhFShpwOPEzcFQobtvEx5P
 eWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KcD87WuVqOE7wlGnuGasxFMiIGXUTo8Tdbjfbz+gy5A=;
 b=oOWwITGrckPwZQ5vity31Icr6/h3yaCOdyADAWX1RSe3cBJWDsJPNnd5SS+ned76TV
 zd485J66Evg6kZCUBiMyo4uYxgE5DHR6yIiRPKzdyLvoLBcL3NsljFll89zQR4gqxr5q
 Y8KDtwL3lwb6zUjoVV8eqEz/XDaNtDvPoahMK+IeCmDfytsYPiAHBhhtGj05ntuXLeQQ
 2HlgEdsJmsyXBzniWKHsZXpYcyBpVPKi6KKrYQlKBPLRV7Afub8ZoF3mksaQKRVuzgDc
 U6wNjEF6Km9MQlCdiVKmMKmaVl8v/J4kc0pQeLtIHC3Ov+d4nrovRas1ZwS2h9atKW1c
 Jq9w==
X-Gm-Message-State: AOAM533tWMqB3E+FNUOljEAoy48xfcMfnE6i2l2XGZTTCR6W05ztFYAD
 /YjmWuoISkUU2ZAXu4fe+PeWwQ==
X-Google-Smtp-Source: ABdhPJxmeBWo72PiNWEHoBgszTA9DNaXGtpZ+YmdIUWLfk09iBTb+c6uKkES/taiEMzmaAR2NhJlpA==
X-Received: by 2002:a05:6000:2ae:b0:1ea:78a3:fe7e with SMTP id
 l14-20020a05600002ae00b001ea78a3fe7emr4284839wry.682.1645531201945; 
 Tue, 22 Feb 2022 04:00:01 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.04.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 04:00:01 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 14/16] ASoC: codecs: wcd938x: fix tlv min max range
Date: Tue, 22 Feb 2022 11:59:31 +0000
Message-Id: <20220222115933.9114-15-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

on Qualcomm codecs gain tlv control specifies min max range as both
negative to positive numbers like

SOC_SINGLE_S8_TLV("... Volume", ..,  -84, 40, gain)

However with recent boundary checks added in commit 817f7c9335ec0
("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw())
setting a value above 40 gain will fail.

So fix this min max range correctly to
SOC_SINGLE_S8_TLV("... Volume", ..,  0, 124, gain)
so that users can now set gain correctly

Fixes: 1cde8b822332 ("ASoC: wcd934x: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 62 +++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index ab580f37cf00..5e45d5eec7c2 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -3996,83 +3996,83 @@ static const struct snd_kcontrol_new wcd934x_snd_controls[] = {
 	SOC_SINGLE_TLV("ADC4 Volume", WCD934X_ANA_AMIC4, 0, 20, 0, analog_gain),
 
 	SOC_SINGLE_S8_TLV("RX0 Digital Volume", WCD934X_CDC_RX0_RX_VOL_CTL,
-			  -84, 40, digital_gain), /* -84dB min - 40dB max */
+			  0, 124, digital_gain), /* -84dB min - 40dB max */
 	SOC_SINGLE_S8_TLV("RX1 Digital Volume", WCD934X_CDC_RX1_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX2 Digital Volume", WCD934X_CDC_RX2_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX3 Digital Volume", WCD934X_CDC_RX3_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX4 Digital Volume", WCD934X_CDC_RX4_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX7 Digital Volume", WCD934X_CDC_RX7_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX8 Digital Volume", WCD934X_CDC_RX8_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX0 Mix Digital Volume",
 			  WCD934X_CDC_RX0_RX_VOL_MIX_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX1 Mix Digital Volume",
 			  WCD934X_CDC_RX1_RX_VOL_MIX_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX2 Mix Digital Volume",
 			  WCD934X_CDC_RX2_RX_VOL_MIX_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX3 Mix Digital Volume",
 			  WCD934X_CDC_RX3_RX_VOL_MIX_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX4 Mix Digital Volume",
 			  WCD934X_CDC_RX4_RX_VOL_MIX_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX7 Mix Digital Volume",
 			  WCD934X_CDC_RX7_RX_VOL_MIX_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX8 Mix Digital Volume",
 			  WCD934X_CDC_RX8_RX_VOL_MIX_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 
 	SOC_SINGLE_S8_TLV("DEC0 Volume", WCD934X_CDC_TX0_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("DEC1 Volume", WCD934X_CDC_TX1_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("DEC2 Volume", WCD934X_CDC_TX2_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("DEC3 Volume", WCD934X_CDC_TX3_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("DEC4 Volume", WCD934X_CDC_TX4_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("DEC5 Volume", WCD934X_CDC_TX5_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("DEC6 Volume", WCD934X_CDC_TX6_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("DEC7 Volume", WCD934X_CDC_TX7_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("DEC8 Volume", WCD934X_CDC_TX8_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 
 	SOC_SINGLE_S8_TLV("IIR0 INP0 Volume",
-			  WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B1_CTL, -84, 40,
+			  WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B1_CTL, 0, 124,
 			  digital_gain),
 	SOC_SINGLE_S8_TLV("IIR0 INP1 Volume",
-			  WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B2_CTL, -84, 40,
+			  WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B2_CTL, 0, 124,
 			  digital_gain),
 	SOC_SINGLE_S8_TLV("IIR0 INP2 Volume",
-			  WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B3_CTL, -84, 40,
+			  WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B3_CTL, 0, 124,
 			  digital_gain),
 	SOC_SINGLE_S8_TLV("IIR0 INP3 Volume",
-			  WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B4_CTL, -84, 40,
+			  WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B4_CTL, 0, 124,
 			  digital_gain),
 	SOC_SINGLE_S8_TLV("IIR1 INP0 Volume",
-			  WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B1_CTL, -84, 40,
+			  WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B1_CTL, 0, 124,
 			  digital_gain),
 	SOC_SINGLE_S8_TLV("IIR1 INP1 Volume",
-			  WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B2_CTL, -84, 40,
+			  WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B2_CTL, 0, 124,
 			  digital_gain),
 	SOC_SINGLE_S8_TLV("IIR1 INP2 Volume",
-			  WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B3_CTL, -84, 40,
+			  WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B3_CTL, 0, 124,
 			  digital_gain),
 	SOC_SINGLE_S8_TLV("IIR1 INP3 Volume",
-			  WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B4_CTL, -84, 40,
+			  WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B4_CTL, 0, 124,
 			  digital_gain),
 
 	SOC_ENUM("TX0 HPF cut off", cf_dec0_enum),
-- 
2.21.0

