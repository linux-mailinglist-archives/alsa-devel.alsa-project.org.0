Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFDE5449E3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 13:20:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C4221FB0;
	Thu,  9 Jun 2022 13:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C4221FB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654773659;
	bh=feUkTjimDqdNAZmr88gQJ1wevRsyAEB+J/Arsp6EJSw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k6e6d3dHHPlxEWqRzL1YYaGKVMVCjDRz+gRc2GeDIoAV0L6mqj2cbaVDr8MriwTF3
	 n9vXTE9DRndeRQtqCAznU6Cs1rXSWOrdVuFmw78Ruc73MrZWMDqadQzPsbtIS5SsOV
	 FPG0nMYSPdt19+xN29xfCIiVruVJzZtDWfzHqgn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F46F800E9;
	Thu,  9 Jun 2022 13:19:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A3B5F800E9; Thu,  9 Jun 2022 13:19:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24DCBF800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 13:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24DCBF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xBqrNg9K"
Received: by mail-wm1-x32c.google.com with SMTP id
 l2-20020a05600c4f0200b0039c55c50482so4721647wmq.0
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZJSswCGWMaH9Gz+kOuAf6ytw6vrkr1yTN4Lg9FPtP0=;
 b=xBqrNg9KKVu6SZc1GxgXSEhR+1JZWXAkOge99tA0ORYzfEbChmi+5TViL7TUfnrJPb
 X2DGKMm1z56pyydomoMZS3qB1rGaH7FnuwyV89l79P6jDuAIrU5n+MWZRGq6+Vk2VY92
 8XE93wJE037IHOlwXYDm9CaBEhz9q5awUjOBK5I6YzOGhryDT+tvBh92Qn6tDBl8yxU8
 tX2O4xlYB1hDQKLsS0NQLcXXWW10Hd/o2EJR38JHI66cyzLK+QiqAagqP034HM1SGu8g
 5a8f8T7mHgEkjoDOlk0imBzW8SScWBkKuvOxlsNCTN4q5pbT7J1NjQy4oTALU224EhFg
 qRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZJSswCGWMaH9Gz+kOuAf6ytw6vrkr1yTN4Lg9FPtP0=;
 b=SE3MeyxnKAgGEHRvqLbBbyV4Ha+sR/b0Nofh01UvwStC5gq7iE05TATCAzIAEw9UGZ
 O7eg5C6j4nGYxzXIt2x9kZN7EXzKp+a/Ks5rVgXlf+Q3/9hhC0psbKjWU3YT9soDdL3s
 Cb/ca+bf8As1AhG7gj9nnFMPy4YKxSxVm/LgVnnVO3TQ7xtWyK7zyut+5vNieaZJn+40
 DNf0ppU+hnaF80OM2TugqScPnpwo6cmA8Q1yh1oKrWsTv1OoMdRiYUtXu80HUama3xLn
 lTwBI8wOugu6/vI3ANe4URvqiHLoiehJ1gNSpjm6pbcck3TzWyIzmCdIWkctHmyUm9TB
 NZ8w==
X-Gm-Message-State: AOAM5310EejwGqgmLk1nrcsq3hfB1gdBCCWs5YJY3BoYZYQTQkNHO2IK
 LaSC0+PX/LWsaweEBdNAjFYH/Q==
X-Google-Smtp-Source: ABdhPJw9zn0RkOe5DdDX7WWpabkr6e5Ps+WJTiyo5lJVo1Rp0/Xgi4rkCipV2m0jY4nKsH4ucoVpSQ==
X-Received: by 2002:a05:600c:a0b:b0:39c:3551:b226 with SMTP id
 z11-20020a05600c0a0b00b0039c3551b226mr2746192wmp.201.1654773554158; 
 Thu, 09 Jun 2022 04:19:14 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a1c7516000000b003942a244ed1sm26477850wmc.22.2022.06.09.04.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 04:19:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: codecs: wcd9335: move gains from SX_TLV to S8_TLV
Date: Thu,  9 Jun 2022 12:19:01 +0100
Message-Id: <20220609111901.318047-3-srinivas.kandagatla@linaro.org>
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

Fixes: 8c4f021d806a ("ASoC: wcd9335: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 81 +++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 45 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 617a36a89dfe..6e9c93540f7a 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2253,51 +2253,42 @@ static int wcd9335_rx_hph_mode_put(struct snd_kcontrol *kc,
 
 static const struct snd_kcontrol_new wcd9335_snd_controls[] = {
 	/* -84dB min - 40dB max */
-	SOC_SINGLE_SX_TLV("RX0 Digital Volume", WCD9335_CDC_RX0_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX1 Digital Volume", WCD9335_CDC_RX1_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX2 Digital Volume", WCD9335_CDC_RX2_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX3 Digital Volume", WCD9335_CDC_RX3_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX4 Digital Volume", WCD9335_CDC_RX4_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX5 Digital Volume", WCD9335_CDC_RX5_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX6 Digital Volume", WCD9335_CDC_RX6_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX7 Digital Volume", WCD9335_CDC_RX7_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX8 Digital Volume", WCD9335_CDC_RX8_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX0 Mix Digital Volume",
-			  WCD9335_CDC_RX0_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX1 Mix Digital Volume",
-			  WCD9335_CDC_RX1_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX2 Mix Digital Volume",
-			  WCD9335_CDC_RX2_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX3 Mix Digital Volume",
-			  WCD9335_CDC_RX3_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX4 Mix Digital Volume",
-			  WCD9335_CDC_RX4_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX5 Mix Digital Volume",
-			  WCD9335_CDC_RX5_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX6 Mix Digital Volume",
-			  WCD9335_CDC_RX6_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX7 Mix Digital Volume",
-			  WCD9335_CDC_RX7_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
-	SOC_SINGLE_SX_TLV("RX8 Mix Digital Volume",
-			  WCD9335_CDC_RX8_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX0 Digital Volume", WCD9335_CDC_RX0_RX_VOL_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX1 Digital Volume", WCD9335_CDC_RX1_RX_VOL_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX2 Digital Volume", WCD9335_CDC_RX2_RX_VOL_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX3 Digital Volume", WCD9335_CDC_RX3_RX_VOL_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX4 Digital Volume", WCD9335_CDC_RX4_RX_VOL_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX5 Digital Volume", WCD9335_CDC_RX5_RX_VOL_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX6 Digital Volume", WCD9335_CDC_RX6_RX_VOL_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX7 Digital Volume", WCD9335_CDC_RX7_RX_VOL_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX8 Digital Volume", WCD9335_CDC_RX8_RX_VOL_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX0 Mix Digital Volume", WCD9335_CDC_RX0_RX_VOL_MIX_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX1 Mix Digital Volume", WCD9335_CDC_RX1_RX_VOL_MIX_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX2 Mix Digital Volume", WCD9335_CDC_RX2_RX_VOL_MIX_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX3 Mix Digital Volume", WCD9335_CDC_RX3_RX_VOL_MIX_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX4 Mix Digital Volume", WCD9335_CDC_RX4_RX_VOL_MIX_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX5 Mix Digital Volume", WCD9335_CDC_RX5_RX_VOL_MIX_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX6 Mix Digital Volume", WCD9335_CDC_RX6_RX_VOL_MIX_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX7 Mix Digital Volume", WCD9335_CDC_RX7_RX_VOL_MIX_CTL,
+			-84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX8 Mix Digital Volume", WCD9335_CDC_RX8_RX_VOL_MIX_CTL,
+			-84, 40, digital_gain),
 	SOC_ENUM("RX INT0_1 HPF cut off", cf_int0_1_enum),
 	SOC_ENUM("RX INT0_2 HPF cut off", cf_int0_2_enum),
 	SOC_ENUM("RX INT1_1 HPF cut off", cf_int1_1_enum),
-- 
2.25.1

