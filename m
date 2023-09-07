Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC0879711C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 11:06:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 622FC86F;
	Thu,  7 Sep 2023 11:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 622FC86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694077612;
	bh=QwScNBKP+DmbkZrHxKoImCjsJN0t7vY8bl/33N9uAxU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=a6szqk7eJpcI8TTLt9LY0wLwmBrcRRGOiovwLbG2zhzla6P+2E5bHkLX6IeRdj93w
	 sVKJoFfoe9oti//3Pas93mWGWVhX8tAb/0LGyr2OBz0ZGRO6zDFeibvD6WJcbHo/Xa
	 qXGU+IMJdumkNkD3qQSHIHSiz4maq7LliwxiVkP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97394F80494; Thu,  7 Sep 2023 11:05:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9EFAF8047D;
	Thu,  7 Sep 2023 11:05:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A10FF80494; Thu,  7 Sep 2023 11:05:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C638BF800F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 11:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C638BF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=VqPoYN/c
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-401c90ed2ecso8169605e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 07 Sep 2023 02:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694077516;
 x=1694682316; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJVDYEmcYMvyDAvrM+W+a0XTM8UX7gM4MKMeEwWok1U=;
        b=VqPoYN/cEDi7AEb7XUtfJuGV98YPjt+mBwjZSnnyD+v1rVTTrAyV2fzG499GPTpkAl
         xujs3rhpp6632bbY66mQomu/JvUBV94Ipe4cF1t6/xdxg7dwm+6IK7184qp6ZLKYFQnL
         6KPaDGiN2338X2AqxJ7JJC+amDAWBq5xQFEYqEk/s6aNdVd7/x0rQWkURAW2QKihVbXM
         BFKD5ckloxDBkhfPZYo4REf2CwyQyvx1/mTxlZt53NjVHn6ZcpakIUNCnQ62Pia0wTmg
         uFUmxcglzNelTpbKrICI5v41rqWuOIAzWlTdKtWz4+b08k7P6ai1+4OS05WbXRMxVfNK
         n6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694077516; x=1694682316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJVDYEmcYMvyDAvrM+W+a0XTM8UX7gM4MKMeEwWok1U=;
        b=IX9nORz9rLOxJuH8BPNJXNYqnZUOvc8WUfRJYn3MKheWJTIqaycObgKwB3220YKXsD
         odkiM9FVBdyWkv+NaKD8BxTgjkqIg4DuGyUAwNuc/AhX3Jg+ErUmbCr0bZ6dOfx86ush
         hAjwkl4U5jh83hbciCLHRwO9VYuxm75OBLU71mVW1N1ZKz8Oout3lZf+Cokfa4cjs4MO
         KdVHLnGXny4QFXK2sWdIcbxDTcDxyefm5AWcT1Lwjut3c1jdhjL1jH5RZn09nud0b+cZ
         P02tt4FiMQ3IcLWycAY2lfJ42PQsOpuJe0dTn8R96mlyP9e4ewpZe8ESqc3lAs+TaAd6
         Z3sg==
X-Gm-Message-State: AOJu0YyUHCvk1+pYRCJC/BqVJmEWUptlnoG/KCnBo9VS+zxmnOhqrIwG
	4dkrDfFHXEH169Hqu178QlGsSg==
X-Google-Smtp-Source: 
 AGHT+IEOvCH7hNTHOrZSew7AYc5GcTyZgtrMkRHjYNSp10f3yfgk8FqXZw9ThISAuSrWLWwP/dk53Q==
X-Received: by 2002:a05:600c:2986:b0:401:73b2:f039 with SMTP id
 r6-20020a05600c298600b0040173b2f039mr4140033wmd.7.1694077516289;
        Thu, 07 Sep 2023 02:05:16 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5be9:5575:c6f4:d478])
        by smtp.googlemail.com with ESMTPSA id
 r5-20020adfe685000000b003143867d2ebsm22767439wrm.63.2023.09.07.02.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:05:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] ASoC: meson: spdifin: start hw on dai probe
Date: Thu,  7 Sep 2023 11:05:04 +0200
Message-Id: <20230907090504.12700-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TEQPCEAHWUVOTVIZER5VQ25MML55G7IJ
X-Message-ID-Hash: TEQPCEAHWUVOTVIZER5VQ25MML55G7IJ
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TEQPCEAHWUVOTVIZER5VQ25MML55G7IJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For spdif input to report the locked rate correctly, even when no capture
is running, the HW and reference clock must be started as soon as
the dai is probed.

Fixes: 5ce5658375e6 ("ASoC: meson: add axg spdif input")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-spdifin.c | 49 ++++++++++++-----------------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index d86880169075..bc2f2849ecfb 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -112,34 +112,6 @@ static int axg_spdifin_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int axg_spdifin_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-	struct axg_spdifin *priv = snd_soc_dai_get_drvdata(dai);
-	int ret;
-
-	ret = clk_prepare_enable(priv->refclk);
-	if (ret) {
-		dev_err(dai->dev,
-			"failed to enable spdifin reference clock\n");
-		return ret;
-	}
-
-	regmap_update_bits(priv->map, SPDIFIN_CTRL0, SPDIFIN_CTRL0_EN,
-			   SPDIFIN_CTRL0_EN);
-
-	return 0;
-}
-
-static void axg_spdifin_shutdown(struct snd_pcm_substream *substream,
-				 struct snd_soc_dai *dai)
-{
-	struct axg_spdifin *priv = snd_soc_dai_get_drvdata(dai);
-
-	regmap_update_bits(priv->map, SPDIFIN_CTRL0, SPDIFIN_CTRL0_EN, 0);
-	clk_disable_unprepare(priv->refclk);
-}
-
 static void axg_spdifin_write_mode_param(struct regmap *map, int mode,
 					 unsigned int val,
 					 unsigned int num_per_reg,
@@ -251,17 +223,32 @@ static int axg_spdifin_dai_probe(struct snd_soc_dai *dai)
 	ret = axg_spdifin_sample_mode_config(dai, priv);
 	if (ret) {
 		dev_err(dai->dev, "mode configuration failed\n");
-		clk_disable_unprepare(priv->pclk);
-		return ret;
+		goto pclk_err;
 	}
 
+	ret = clk_prepare_enable(priv->refclk);
+	if (ret) {
+		dev_err(dai->dev,
+			"failed to enable spdifin reference clock\n");
+		goto pclk_err;
+	}
+
+	regmap_update_bits(priv->map, SPDIFIN_CTRL0, SPDIFIN_CTRL0_EN,
+			   SPDIFIN_CTRL0_EN);
+
 	return 0;
+
+pclk_err:
+	clk_disable_unprepare(priv->pclk);
+	return ret;
 }
 
 static int axg_spdifin_dai_remove(struct snd_soc_dai *dai)
 {
 	struct axg_spdifin *priv = snd_soc_dai_get_drvdata(dai);
 
+	regmap_update_bits(priv->map, SPDIFIN_CTRL0, SPDIFIN_CTRL0_EN, 0);
+	clk_disable_unprepare(priv->refclk);
 	clk_disable_unprepare(priv->pclk);
 	return 0;
 }
@@ -270,8 +257,6 @@ static const struct snd_soc_dai_ops axg_spdifin_ops = {
 	.probe		= axg_spdifin_dai_probe,
 	.remove		= axg_spdifin_dai_remove,
 	.prepare	= axg_spdifin_prepare,
-	.startup	= axg_spdifin_startup,
-	.shutdown	= axg_spdifin_shutdown,
 };
 
 static int axg_spdifin_iec958_info(struct snd_kcontrol *kcontrol,
-- 
2.40.1

