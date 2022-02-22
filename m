Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4104BF7C1
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:04:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC077181F;
	Tue, 22 Feb 2022 13:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC077181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531455;
	bh=zMKThusJ1WpkgUD2eE8/khlaRFdMFPz5EOm4A71h4Xk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pXgVLzEe47j0Z34par6ZrGgYaH/aAhAdK0M7bMgcZibn41rN5MZhCQCaOAgR5+VfO
	 UZeDZGQwiRgsULXb29p1jzT+2N1VeqpFlnVcTbbJ8na7z8KK6D4JsW2IjWKG07BmvQ
	 eoTWHz0h7aqou5B1SuAM9bntsm6gsm5nfEAIq7/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 235CEF80544;
	Tue, 22 Feb 2022 13:00:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A376F8051C; Tue, 22 Feb 2022 13:00:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B563F80517
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 12:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B563F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RPo2H0r3"
Received: by mail-wr1-x42a.google.com with SMTP id d3so17079191wrf.1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 03:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PovLFlAjWbVecaLj2Jyj4ZWgXRh7VtxF4soiFyKrJgg=;
 b=RPo2H0r344YT+gcGkz/K6ZQ4DgEydlk2KAkMh1T6kF+gXl17FFLgt4QiphRmGmCOwf
 tDv69AMM0cOWCQa55Kx4ax2/HI56fhYMoZrGMY1mxbWLG5d8DKRIeRO94RGN/cIEN81U
 7RTJcwumUoW3P6Rp2knoV76ajl/ent7tOHK5zuYamkLnwipiWtmkKOE3SSC3wQHkH5GF
 kRDbRGyqkiL1F6+FFLNLde/c7lne+amzDqyhxrCi8gAxrtFykuRXoukliI3ptsqWw23G
 0+z2Z3hl0g2CCT4TVBAbuDZ2CQcJdTayk4DM6PDoK8D/hx9xoBch1YiJa5Qk8fPIVrRf
 srpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PovLFlAjWbVecaLj2Jyj4ZWgXRh7VtxF4soiFyKrJgg=;
 b=dtVsAegjMxBHrtXq6Q4O6gDdNGXjbYkWXp+FYf3h4X6HnpKqVkoQt/nZldZC1psEkl
 NNwXZiZCGn5Op1BWY+tcTTccUkW6RUFYAllWGKfwlrdv4bDJCnCA4vnUNGQ3qGMbQWyM
 78JBrDr0e8rW4pRMmMQE14pAMqA9ZOIedr2DkkkoPpmuaYCPJQ4UKATVoWF5JDN5SaJG
 mCpvhq18xpAeyF8lDo8kA9aTuBKl3KPRgt5V/2Pk/Go3grz5xZdEa44BHMOkc1fnVjgx
 ZOhLPaY638dplgLv5bUhMwIPLIsH0SEkC9ooGDDb8D4SS0GAe3/tEfw4C+fr1b5OtFOs
 Rp6g==
X-Gm-Message-State: AOAM533zmaBinwkiCm7ktKsorvnZZ2CdkjOtYvnTJqwqgu5spymnwHkj
 9SkONbmVzi5tomzn8mpCF0frcg==
X-Google-Smtp-Source: ABdhPJxoRUq2WzjRe6cKbSthqOXk77aleSu329nCmKU4CL67S3d0nugmziFoGclsdJjqwrFWUzbMxA==
X-Received: by 2002:a5d:5986:0:b0:1ea:75c6:3d0a with SMTP id
 n6-20020a5d5986000000b001ea75c63d0amr4634125wri.166.1645531199050; 
 Tue, 22 Feb 2022 03:59:59 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.03.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:59:58 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 11/16] ASoC: codecs: tx-macro: fix tlv min max range
Date: Tue, 22 Feb 2022 11:59:28 +0000
Message-Id: <20220222115933.9114-12-srinivas.kandagatla@linaro.org>
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

Fixes: c39667ddcfc5 ("ASoC: codecs: lpass-tx-macro: add support for lpass tx macro")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index f90786100d1a..56c1f3cf73f8 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1600,28 +1600,28 @@ static const struct snd_soc_dapm_route tx_audio_map[] = {
 static const struct snd_kcontrol_new tx_macro_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("TX_DEC0 Volume",
 			  CDC_TX0_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("TX_DEC1 Volume",
 			  CDC_TX1_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("TX_DEC2 Volume",
 			  CDC_TX2_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("TX_DEC3 Volume",
 			  CDC_TX3_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("TX_DEC4 Volume",
 			  CDC_TX4_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("TX_DEC5 Volume",
 			  CDC_TX5_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("TX_DEC6 Volume",
 			  CDC_TX6_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("TX_DEC7 Volume",
 			  CDC_TX7_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 
 	SOC_ENUM_EXT("DEC0 MODE", dec_mode_mux_enum[0],
 			tx_macro_dec_mode_get, tx_macro_dec_mode_put),
-- 
2.21.0

