Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7718A5A2496
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 11:38:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D66E6846;
	Fri, 26 Aug 2022 11:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D66E6846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661506692;
	bh=opO+q9m5a+NODt113Cuxype1w27vzaFs6rfieB1EmFo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PkmW5i8/kPD/5/eEtqzmr0ysSuuqkNTBMmnPxtvx2NuNKpEsfwj5w1QUbRlKrHJnr
	 MDsN5PGEMCLFkkXxjsw2RidxULHi+PT2v7H/qZPT3cNdDN/Yn1zzsuBQIipG+92Tz2
	 QV8aoKOgDmlFUckaDG59abzBk8qxaEf8bayQzn/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A4B3F8032D;
	Fri, 26 Aug 2022 11:37:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D366F80238; Fri, 26 Aug 2022 11:37:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0720AF800BD
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 11:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0720AF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RLdJJxcq"
Received: by mail-lj1-x230.google.com with SMTP id w22so1038588ljg.7
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 02:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Mlpv6zMC5nZyYiheus3egIapL2MqYMyQVfbERY5zhDI=;
 b=RLdJJxcqyMf5k/P5cumVodYAzSpCgKk4K0C6c08pnMkW6mc5Mz5l0tn1gHKZ1kRfwo
 AZ57POhXMBDqLhGc/erFt4rpe5Lfd0CwxLqX7ejyH8qPX4IeqOhpHCtEJ6zbv/e4H/pF
 VlLjzzy7ylB4OZQ3SzefGUM7+SPR5m6MHSYSIxH7miD4Gq1WVyto+jwM+IMSWHB00Ucy
 VGgynPUDoFuJyY8v714w6DQKHgoY/t3qk7SEMbEtFwMeGmnideXp03SY5a/tEYkHIZJ/
 t+3FM8y2QnpON9G00cWuvO+IOlHpVfKSiBLkJicApLTv9cvaBZjsjWZtgnXaxbmymgyX
 M8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Mlpv6zMC5nZyYiheus3egIapL2MqYMyQVfbERY5zhDI=;
 b=p33HWtYe+B23uPJjfL1SMJgatXDxk4Y2fkO4KieiLN1vJtgS68TllBAI4Lb9ASsHcp
 RsFX2rZJPvRa8IKAh5kvKVv/pTx0f8qZ4k0LYkzpq+YXOShBzEqEToy93r7V35b+5ubB
 kyneT45GxfETHP2Kr3bADUqLAkhsqiWmPV1c2an4E43SwFSfAnL+Kt2bRn7TVEGnO9i7
 OO5SkhCZwHtNtX5KNzswCxIa/PNu0cYVD57JXl/Y6pqGBqnA43AHozXVTCXmcF03YbMF
 4Iw1fJbfscQjN2L6kidcCXcPc5hLuM7zpgyNHNvhKOogbaTyPEl2kOUPHwmzedRLcgtJ
 hNmg==
X-Gm-Message-State: ACgBeo248lq25zK4MLPRA0T3DD7TRZRZC9WkVG9644yWJDF+B+Sb0ZcV
 6LzSuzDw4BMpdT0qgaLgh8sc0Z+cTn+pzD2r
X-Google-Smtp-Source: AA6agR6B7J/kOZXk73idA4fIQppxgN1IPDOxplY7U2v6gFNy8ic61L00Si0eFSiypKmYhwoDY9CxLA==
X-Received: by 2002:a2e:3515:0:b0:261:e569:77ff with SMTP id
 z21-20020a2e3515000000b00261e56977ffmr2214941ljz.478.1661506623008; 
 Fri, 26 Aug 2022 02:37:03 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee.
 [82.131.98.15]) by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b0048af6242892sm334329lfg.14.2022.08.26.02.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 02:37:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: allow compile testing without MFD drivers
Date: Fri, 26 Aug 2022 12:36:59 +0300
Message-Id: <20220826093659.1059276-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Motorola CPCAP, Lochnagar Sound, Rockchip RK817 and Qualcomm
WCD9340/WCD9341 do not depend on parent MFD driver in build time and can
be compile tested without respective MFD part for increased build
coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5926b33ba09e..94b7bb85d236 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -610,7 +610,7 @@ config SND_SOC_BT_SCO
 
 config SND_SOC_CPCAP
 	tristate "Motorola CPCAP codec"
-	depends on MFD_CPCAP
+	depends on MFD_CPCAP || COMPILE_TEST
 
 config SND_SOC_CQ0093VC
 	tristate
@@ -972,7 +972,7 @@ config SND_SOC_LM49453
 
 config SND_SOC_LOCHNAGAR_SC
 	tristate "Lochnagar Sound Card"
-	depends on MFD_LOCHNAGAR
+	depends on MFD_LOCHNAGAR || COMPILE_TEST
 	help
 	  This driver support the sound card functionality of the Cirrus
 	  Logic Lochnagar audio development board.
@@ -1197,7 +1197,7 @@ config SND_SOC_RK3328
 
 config SND_SOC_RK817
 	tristate "Rockchip RK817 audio CODEC"
-	depends on MFD_RK808
+	depends on MFD_RK808 || COMPILE_TEST
 	select REGMAP_I2C
 
 config SND_SOC_RL6231
@@ -1745,7 +1745,7 @@ config SND_SOC_WCD934X
 	tristate "WCD9340/WCD9341 Codec"
 	depends on COMMON_CLK
 	select SND_SOC_WCD_MBHC
-	depends on MFD_WCD934X
+	depends on MFD_WCD934X || COMPILE_TEST
 	help
 	  The WCD9340/9341 is a audio codec IC Integrated in
 	  Qualcomm SoCs like SDM845.
-- 
2.34.1

