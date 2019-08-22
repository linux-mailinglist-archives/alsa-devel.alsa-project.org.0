Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A28B499019
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 12:01:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E3AD950;
	Thu, 22 Aug 2019 12:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E3AD950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566468059;
	bh=Bocly+f9VIQhDCgis9S/bvdB4qjxRT951kmQ4M9PCwo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V2n4tehOR8aCgFhyns46xqK/EdRcR5c65oDlBlYEuJJy/ooUfunC4WnOav4YVZ3Hu
	 dZ0t8ZBdjMmkiEasgITOah+YqIQVePVAEv3L4RYY4QUsOlILCM5TMV1K3BGu6kfsnB
	 4R9BIc7sqWrjAF6SALE5m0WMFHL1/6wxKQvBvO9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6252DF805F6;
	Thu, 22 Aug 2019 11:57:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC864F80112; Thu, 22 Aug 2019 11:57:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2B83F80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 11:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2B83F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XiHNyRJP"
Received: by mail-wm1-x344.google.com with SMTP id p77so6719176wme.0
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GKAFqYDadH8IMiNywSvrdjTGvpCeW6m4y4ghvkPFmxg=;
 b=XiHNyRJPSiORbIyKJHuEbQbN/oWy9Kz9DnlaRQmvE0QFRPUSfJ/wQRArr2AAZFNcjP
 +4tKvhaM1NHaTb8jYFDWQHxJoGPUw4GiB9+C7EebLxAnrt1td8dIXJUcrSNMvCJFUeEH
 993vnt+UyK/vhA3vQTs8izx9oAfKsPy6fz4DCkP5KI/ORB33uOk6QX3qb18R5ayS58K1
 hmEB0n42KVIS4w8rWTLDo1IuJyxa8hngyXZRViT273e8ueH6mtvxrRx4MGThykMogNSk
 vOxOfBk4dgwUhlBMiB3NrziEqYZ18ssarwHumTVKBZT/7OxRlvsrJa2fDU0GywpL/zuj
 B+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GKAFqYDadH8IMiNywSvrdjTGvpCeW6m4y4ghvkPFmxg=;
 b=UYE9Yi8/AlxZR/tV/t5AeDOwTISYUYlqGb0yD5UaKZG4otUO37hmvge9aASUxpDFq5
 NBBg1fZYWwco4L+IuhUOrpORHNo3NOJZjzpn7EuUdWp35yQcr4vMUPMdD5fSLbmJigSU
 1nUgOI4/e09zrcanA/0Qw/914gNO3w/sQtET3tL0WBTTZeJiiI/vwPTp6AB+Yop7cmB0
 ls/r4Wm6RqqA3CLAxHKofQV3N6VjvIKNW0pLRpmdYPfswZ6uOVnBNhYr/VZrx8m7pp4t
 P96j91cNxLMDHuZDJjQVWP9UP/64Dc9h2kF1ymvm9pG9mpH9bQ69Qbp4vnPXWhdkmyJp
 AgFA==
X-Gm-Message-State: APjAAAVAcFWCI1rnoFYFjC+7K1gxty1zcUB8xoD14DQKDqD4rrTNrPG/
 7yo6cvh8sYhdm1cA/mLp7lNtGg==
X-Google-Smtp-Source: APXvYqzK7Mj2V/hj/IO89jrFTKEWQfOQmDRvNqMHhkqgbg8bHdZAFC8WJc9kyzAdsIMmVhwhXq5RXQ==
X-Received: by 2002:a1c:a957:: with SMTP id s84mr5319660wme.65.1566467851084; 
 Thu, 22 Aug 2019 02:57:31 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id t24sm3298909wmj.14.2019.08.22.02.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 02:57:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Thu, 22 Aug 2019 10:56:51 +0100
Message-Id: <20190822095653.7200-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822095653.7200-1-srinivas.kandagatla@linaro.org>
References: <20190822095653.7200-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, plai@codeaurora.org
Subject: [alsa-devel] [PATCH v2 2/4] ASoC: wcd9335: Fix primary interpolator
	max rate
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On this codec SLIMBus RX path supports 384000 rate on primary interpolator.
Add this missing rate as supported rate.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 956602788d0e..03f8a94bba2f 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2071,9 +2071,10 @@ static struct snd_soc_dai_driver wcd9335_slim_dais[] = {
 		.id = AIF1_PB,
 		.playback = {
 			.stream_name = "AIF1 Playback",
-			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK,
+			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK |
+				 SNDRV_PCM_RATE_384000,
 			.formats = WCD9335_FORMATS_S16_S24_LE,
-			.rate_max = 192000,
+			.rate_max = 384000,
 			.rate_min = 8000,
 			.channels_min = 1,
 			.channels_max = 2,
@@ -2099,10 +2100,11 @@ static struct snd_soc_dai_driver wcd9335_slim_dais[] = {
 		.id = AIF2_PB,
 		.playback = {
 			.stream_name = "AIF2 Playback",
-			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK,
+			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK |
+				 SNDRV_PCM_RATE_384000,
 			.formats = WCD9335_FORMATS_S16_S24_LE,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 			.channels_min = 1,
 			.channels_max = 2,
 		},
@@ -2127,10 +2129,11 @@ static struct snd_soc_dai_driver wcd9335_slim_dais[] = {
 		.id = AIF3_PB,
 		.playback = {
 			.stream_name = "AIF3 Playback",
-			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK,
+			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK |
+				 SNDRV_PCM_RATE_384000,
 			.formats = WCD9335_FORMATS_S16_S24_LE,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 			.channels_min = 1,
 			.channels_max = 2,
 		},
@@ -2155,10 +2158,11 @@ static struct snd_soc_dai_driver wcd9335_slim_dais[] = {
 		.id = AIF4_PB,
 		.playback = {
 			.stream_name = "AIF4 Playback",
-			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK,
+			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK |
+				 SNDRV_PCM_RATE_384000,
 			.formats = WCD9335_FORMATS_S16_S24_LE,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 			.channels_min = 1,
 			.channels_max = 2,
 		},
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
