Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A006C660E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 12:02:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66BE5EC8;
	Thu, 23 Mar 2023 12:01:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66BE5EC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679569356;
	bh=+IR3/3hsQmMxdnHwf5wOi9y8mStWTKoBiHt2euuxRhQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dZyd0+toYVbjSnlZF6GoYo8encqJ96gGEUle/NGmFX2pG+4EV+o1kptfbybLCY3TD
	 IS2u7ymUwG0V27DdNetELjv8WBx5vgqwQcDL+qwCFKpaQ7zO+jAkOFnYiNdQleYkKz
	 FFYkonSB8LpcSR2CkeJfk8Vd/7DhHloyWYWl3SMg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4C2AF8027B;
	Thu, 23 Mar 2023 12:01:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17C9EF802E8; Thu, 23 Mar 2023 12:01:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F2B9F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 12:01:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F2B9F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QuK7pVzc
Received: by mail-ed1-x529.google.com with SMTP id ew6so21648489edb.7
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 04:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679569293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ahu8cJkhHnhzUOlpxuAtr0xDCT/S8rOYab9pN6g8aow=;
        b=QuK7pVzcIN1kxnSgkMaJd1q1aZ/0cNK/3nrFNc7eXQ8fUBlIAlZIe9nJ4UZPfrBgCP
         NJD13PXxGHT+CcouoFJLdjzhXO4s+ogC7g8qE4bGZAvQ60eqDbmcY9eB0KdJkwSp6Ujw
         f5TteRs0xrHf1KPJFT1HdxxNcCbXJIWChpoW7ZR1DQAQ5RcV2xyuHUXOx8WWjDnUwvxq
         FBuS88qeSTOZ1uLPA105JEK7F4vs9zMGjvOMpe8eOS2Jdorrsby+MV7VLKLoQp22DyFI
         ihF0194SQ2ChEs4FwrbryvXk6Hp8lbJHtQ+NTuoBQCMIk/bKXMaE3KKkKUBudoLlZ/Sp
         PREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679569293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ahu8cJkhHnhzUOlpxuAtr0xDCT/S8rOYab9pN6g8aow=;
        b=S4YEbKN5nfo1hFy7/9+TX/1CJCFIgD/ie6wIuLobCsR7dy8IMXjmcwvumHG7HmqKVH
         jSafn5FeRXmDhbmcz9tM+CW8aSlsa9bYLcL+QpHW9hLmRFAGfOdf3amBljJc8eOPD4tZ
         vLtJ/nnBm0UA8eVZSDuSqIYHNIhfZCpAh0XjPlifqEidDiz8w3o2WPachZJLIlTRyNYH
         RDzTguRPrDXIC6zAchJ+or+0eOKYZdQuvfSdYktwjPpPuzNT3GoxzR/9tQcnWIyepzKe
         NPZvDQvBcYHsKvu0FzOAMTULBEp5y24zSTM6VEDRZJ3VbOrkDnoFM82RQE0ij4zBfqip
         9ncg==
X-Gm-Message-State: AO0yUKXs115YZlyeez6tyREkQxDRP6E1XP8U+mwgPd1ZJS/egH/g09Gn
	D3WdQ+lNd0tj3Ngdw8NoMxEOOQ==
X-Google-Smtp-Source: 
 AK7set+VkIEJFUs3BcCNTxgxlbqPZF4opEfOOks6fNYPBLX0E2pUV8JwSmNwHYOpN53HDRb9qr81+g==
X-Received: by 2002:a05:6402:1619:b0:4fc:3777:f630 with SMTP id
 f25-20020a056402161900b004fc3777f630mr10171556edv.0.1679569292850;
        Thu, 23 Mar 2023 04:01:32 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 x23-20020a50d617000000b004fa268da13esm9129009edi.56.2023.03.23.04.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 04:01:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [RESEND PATCH] ASoC: codecs: lpass: fix the order or clks turn off
 during suspend
Date: Thu, 23 Mar 2023 11:01:25 +0000
Message-Id: <20230323110125.23790-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3ZXHSB7MVBFPZLQIMHVW6MSQHOWJHDGY
X-Message-ID-Hash: 3ZXHSB7MVBFPZLQIMHVW6MSQHOWJHDGY
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amit Pundir <amit.pundir@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZXHSB7MVBFPZLQIMHVW6MSQHOWJHDGY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The order in which clocks are stopped matters as some of the clock
like NPL are derived from MCLK.

Without this patch, Dragonboard RB5 DSP would crash with below error:
 qcom_q6v5_pas 17300000.remoteproc: fatal error received:
 ABT_dal.c:278:ABTimeout: AHB Bus hang is detected,
 Number of bus hang detected := 2 , addr0 = 0x3370000 , addr1 = 0x0!!!

Turn off  fsgen first, followed by npl and then finally mclk, which is exactly
the opposite order of enable sequence.

Fixes: 1dc3459009c3 ("ASoC: codecs: lpass: register mclk after runtime pm")
Reported-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---

Sorry for noise, resending this one, as I missed the asoc mailing list in my previous send.


 sound/soc/codecs/lpass-rx-macro.c  | 4 ++--
 sound/soc/codecs/lpass-tx-macro.c  | 4 ++--
 sound/soc/codecs/lpass-wsa-macro.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 9e0a4e8a46c3..372bea8b3525 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3668,9 +3668,9 @@ static int __maybe_unused rx_macro_runtime_suspend(struct device *dev)
 	regcache_cache_only(rx->regmap, true);
 	regcache_mark_dirty(rx->regmap);
 
-	clk_disable_unprepare(rx->mclk);
-	clk_disable_unprepare(rx->npl);
 	clk_disable_unprepare(rx->fsgen);
+	clk_disable_unprepare(rx->npl);
+	clk_disable_unprepare(rx->mclk);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index b044c9c6f89b..d9318799f6b7 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2096,9 +2096,9 @@ static int __maybe_unused tx_macro_runtime_suspend(struct device *dev)
 	regcache_cache_only(tx->regmap, true);
 	regcache_mark_dirty(tx->regmap);
 
-	clk_disable_unprepare(tx->mclk);
-	clk_disable_unprepare(tx->npl);
 	clk_disable_unprepare(tx->fsgen);
+	clk_disable_unprepare(tx->npl);
+	clk_disable_unprepare(tx->mclk);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 728f26d12ab0..6484c335bd5d 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2504,9 +2504,9 @@ static int __maybe_unused wsa_macro_runtime_suspend(struct device *dev)
 	regcache_cache_only(wsa->regmap, true);
 	regcache_mark_dirty(wsa->regmap);
 
-	clk_disable_unprepare(wsa->mclk);
-	clk_disable_unprepare(wsa->npl);
 	clk_disable_unprepare(wsa->fsgen);
+	clk_disable_unprepare(wsa->npl);
+	clk_disable_unprepare(wsa->mclk);
 
 	return 0;
 }
-- 
2.21.0

