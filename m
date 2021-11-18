Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 322CA4551EF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 02:01:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5BAA18EE;
	Thu, 18 Nov 2021 02:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5BAA18EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637197284;
	bh=2yrqw2xPk7UVhlUgRxsJb0k8K+BjOwzwTyB37aUB+kU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=krkPZE2nQQzQtFhfIoEovk3ZmO0zBitkqQjMZ+Izpna9yYdaFn/M+LuaYLyn5X97c
	 TTm+VNSCkOZVywTGzudBiEfOP7p7Vt/5cF5gkYA9lR/gIhdZxVqWkwP4mg9/3K7xuE
	 R/Nqa1XBGpBHejzfb/Xsm7dZsheLuyZI0CvGkMds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23579F8020D;
	Thu, 18 Nov 2021 02:00:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D491AF8028B; Thu, 18 Nov 2021 02:00:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09CA1F80134
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 01:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09CA1F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d8k4sJ4D"
Received: by mail-pf1-x435.google.com with SMTP id m14so4264182pfc.9
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 16:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LBUD0K4C7qmyhl0TujcIGbUVohvoG/xB+6guxlHi264=;
 b=d8k4sJ4D2Wk6p8hoVWw9wlbT7GzsM99y2DsIRuvra6Ey05UD39Cq8KD7UwZjf7EUZG
 Ln3EKMmLOmbPfQ+rJWHSSCMQCwPYcdmE9EXiZIe9AA2GWhNQGi4eZotpxXeU8g7bwrYw
 5PtSwGddDLuiFwinC6IsAMOLcMrzTfWNyvBoTqlyt9JvfzqWsQrGhZaW5xc2YMVYcggU
 PQ1AMn+qA4/bBEoqP8H5oYtUqvJnv/gKikJ4LDZZn5SzDqKHStyoEbNnu9IrOiKB1TEC
 SgJ8mP8NNLFIpo60iFgPUMLjk4Me4towoKzYajbwjFQAHxjmPzzpNPrXleIzCQFtSLAo
 NY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LBUD0K4C7qmyhl0TujcIGbUVohvoG/xB+6guxlHi264=;
 b=T548wKIDdGL0nx+B8OU0y2WlTc5eRgOjTgYaCgktGkf34UVmSr7Fj508BDjVFsjVtu
 FSKrTz3R8NbhWFggHheU1m/g2Srs33jL/M4iTZU1Hy1TVUPD7eGAEc4fuskRLpROFTUi
 nYm7st9Q7ZNuWg3nIw1A72l1qsmJUrgCtITcwkFMKn8LyvZROaD3c0FAOpD0PwJ2Q4t3
 3iGf7HqtRpVMlCJF7SKr+RVKDgZd31GpJtX7iqQgGNIsUAHlpjPplaFBpwAq06T2oKhy
 LTLQ7pMSfUkODUYI1ph15bCdgpmY07AuPZF3vtVPx64IzosV7N8ncWsFDDgGoCXXxp14
 j6Cg==
X-Gm-Message-State: AOAM53337SXc6sjlUvXgzMniENAqeeq4JxHzttyFj2tBClipMVwj0xe/
 WsXo4nhX7xB8QbOE5FiRuDMJfjddAUA=
X-Google-Smtp-Source: ABdhPJyLSdbkyb7Clc5rm7pg8GIdMXdMD9+JTg4K4Es9Tn4wkHLotm6C7otslIASDrJVAHPsMkBK7A==
X-Received: by 2002:a62:f249:0:b0:49f:b0af:b9dc with SMTP id
 y9-20020a62f249000000b0049fb0afb9dcmr11299322pfl.22.1637197190745; 
 Wed, 17 Nov 2021 16:59:50 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id a8sm835044pfv.176.2021.11.17.16.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 16:59:49 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: rt5682: Fix crash due to out of scope stack vars
Date: Wed, 17 Nov 2021 17:04:52 -0800
Message-Id: <20211118010453.843286-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Clark <robdclark@chromium.org>, Oder Chiou <oder_chiou@realtek.com>,
 linux-arm-msm@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Mark Brown <broonie@kernel.org>, Derek Fang <derek.fang@realtek.com>,
 open list <linux-kernel@vger.kernel.org>
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

From: Rob Clark <robdclark@chromium.org>

Move the declaration of temporary arrays to somewhere that won't go out
of scope before the devm_clk_hw_register() call, lest we be at the whim
of the compiler for whether those stack variables get overwritten.

Fixes a crash seen with gcc version 11.2.1 20210728 (Red Hat 11.2.1-1)

Fixes: edbd24ea1e5c ("ASoC: rt5682: Drop usage of __clk_get_name()")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 sound/soc/codecs/rt5682.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 78b4cb5fb6c8..0d59ec2a5460 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2844,6 +2844,8 @@ int rt5682_register_dai_clks(struct rt5682_priv *rt5682)
 
 	for (i = 0; i < RT5682_DAI_NUM_CLKS; ++i) {
 		struct clk_init_data init = { };
+		struct clk_parent_data parent_data;
+		const struct clk_hw *parent;
 
 		dai_clk_hw = &rt5682->dai_clks_hw[i];
 
@@ -2851,17 +2853,17 @@ int rt5682_register_dai_clks(struct rt5682_priv *rt5682)
 		case RT5682_DAI_WCLK_IDX:
 			/* Make MCLK the parent of WCLK */
 			if (rt5682->mclk) {
-				init.parent_data = &(struct clk_parent_data){
+				parent_data = (struct clk_parent_data){
 					.fw_name = "mclk",
 				};
+				init.parent_data = &parent_data;
 				init.num_parents = 1;
 			}
 			break;
 		case RT5682_DAI_BCLK_IDX:
 			/* Make WCLK the parent of BCLK */
-			init.parent_hws = &(const struct clk_hw *){
-				&rt5682->dai_clks_hw[RT5682_DAI_WCLK_IDX]
-			};
+			parent = &rt5682->dai_clks_hw[RT5682_DAI_WCLK_IDX];
+			init.parent_hws = &parent;
 			init.num_parents = 1;
 			break;
 		default:
-- 
2.33.1

