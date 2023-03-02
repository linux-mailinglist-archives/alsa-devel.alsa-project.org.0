Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF826A822E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 13:30:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D16591F9;
	Thu,  2 Mar 2023 13:29:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D16591F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677760216;
	bh=iCH9dazPzXUsGfaKDpmKc9R5H0p/aBV7o4I6B7miMi0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mMJA4uR/TI7oJ6mwv2f6r8211iDI0IZCa5PwX/9em8TmO2FTpbtsaB9IHtAFQCkpg
	 0z74snbUNzSP2LwrkgNKl/PJrJgtEDWX7afMhnjWmelyJIQ35HQfMzpW5ptAFLZqlZ
	 SoQ4Q1Au3GTUKJ2u2FevIwWyLp4BhFhADJynlGI0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15577F8025A;
	Thu,  2 Mar 2023 13:29:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6740EF80266; Thu,  2 Mar 2023 13:29:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2C9AF800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 13:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2C9AF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UaZu2BYW
Received: by mail-ed1-x531.google.com with SMTP id x3so3914431edb.10
        for <alsa-devel@alsa-project.org>;
 Thu, 02 Mar 2023 04:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677760152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MkMpyzZmxlO9b2AsSdB9NaVD+MPuHTACY2Gn31+0dVU=;
        b=UaZu2BYWB0K2sii6++RoHtMF5I+lioLvgxeEoscuP9Va3mg+vWk6yAcjGTSJGqaa3k
         RGZ/LPMXH+9wXWkzahKFbc30DkZdm9Pbgyi+y7bHuu8bDoGPUeFAz54DCb3SOBMOZKNc
         dGSDKozlupvguO0NRPCDD5XF5gPF+vbAn1YD8IGp+pCblCZjAkjPNmectE11GvBenTwD
         THK74CQdYlgv+dhoxYvOkXw4X4foBcg4s9Px0u3M3UYD2eUM0rszKk41E7pnnv7acm3t
         NOBOlZ8oDh63mQPWSNFPl53EIfzWEosnIU7qzq3Gag1PvGR7BGsVCt6OBNNQqXin3+JC
         6UVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677760152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkMpyzZmxlO9b2AsSdB9NaVD+MPuHTACY2Gn31+0dVU=;
        b=b9crti8WKDkYDLxYTCgnPZUrE8mqQGrLsEGfj7msMi/+k6c6Vpq4MxYOawQfbyvPMp
         P3E5YLIHM0C7lyukFuydPxEjkvf/YIifI6DprN7pBCEWFuLzQ15BhYsiO5ouoXX5nbBx
         Ob30HUNiyvR/3KSHqr/XJJNkWI2cbJrspyG25iq062WLKZdHdxXyOyu5d7ERVKHsLbyy
         nfl8fQiq/bYSSSza8aAba/kBvmTR2ZK90wAv5RmbeYGahhC0LTxbtCOngVowPobL9BWj
         goLNhAxstUoo1oj5blLQmtXAMALCzNyC1WrrJVJxV7L9V1CY4XogB+3c0+lCLxKisuKM
         XbrQ==
X-Gm-Message-State: AO0yUKV1aL1KdDTydOuUlGsl8KKNgnLOlU2hao8vCgMJ7719ZgQqkWSK
	SmbGSJRJcH8O8WxTOFNn5YDELw==
X-Google-Smtp-Source: 
 AK7set+vwQ+sJWL6Mw1/s1vP3DaSNtdfPbkp5RSPjIdryaxpJ01PRGBmL0J6RgaXTsCL7uxbGpM1qw==
X-Received: by 2002:a17:906:4887:b0:8af:54d2:36af with SMTP id
 v7-20020a170906488700b008af54d236afmr9381027ejq.76.1677760152468;
        Thu, 02 Mar 2023 04:29:12 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 v13-20020a1709064e8d00b008e3bf17fb2asm7162155eju.19.2023.03.02.04.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 04:29:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6prm: fix incorrect clk_root passed to ADSP
Date: Thu,  2 Mar 2023 13:29:08 +0100
Message-Id: <20230302122908.221398-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DICGUS3ENR4SS66DJCD3IXZFXAAKTYC2
X-Message-ID-Hash: DICGUS3ENR4SS66DJCD3IXZFXAAKTYC2
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DICGUS3ENR4SS66DJCD3IXZFXAAKTYC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The second to last argument is clk_root (root of the clock), however the
code called q6prm_request_lpass_clock() with clk_attr instead
(copy-paste error).  This effectively was passing value of 1 as root
clock which worked on some of the SoCs (e.g. SM8450) but fails on
others, depending on the ADSP.  For example on SM8550 this "1" as root
clock is not accepted and results in errors coming from ADSP.

Fixes: 2f20640491ed ("ASoC: qdsp6: qdsp6: q6prm: handle clk disable correctly")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/q6prm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 8aa1a213bfb7..c1dc5bae715a 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -183,9 +183,9 @@ int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_
 			  unsigned int freq)
 {
 	if (freq)
-		return q6prm_request_lpass_clock(dev, clk_id, clk_attr, clk_attr, freq);
+		return q6prm_request_lpass_clock(dev, clk_id, clk_attr, clk_root, freq);
 
-	return q6prm_release_lpass_clock(dev, clk_id, clk_attr, clk_attr, freq);
+	return q6prm_release_lpass_clock(dev, clk_id, clk_attr, clk_root, freq);
 }
 EXPORT_SYMBOL_GPL(q6prm_set_lpass_clock);
 
-- 
2.34.1

