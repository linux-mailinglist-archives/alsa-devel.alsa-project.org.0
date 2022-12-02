Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1873640787
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 14:13:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CFD2182F;
	Fri,  2 Dec 2022 14:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CFD2182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669986798;
	bh=xlgg9yT+hbgcCPFsByPR8gjXc+/Y1vWGgSBa/GbUm+M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oMHp/fnyGoJwUzcf0YI0gN/FupqLtn5N/oq88AG73hgiJ8YBb41RDWaqQ0n/+owJu
	 wGzYFhljkbVg2WmA5FGzR/hzEpMoOG2dFvNjzWlSPdiWRf743ZoESB/eK8XuMZf44a
	 9kUPNleaGA4Toaulg0/AVWGu0uqM9gm71jEpCZg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85EDCF8055A;
	Fri,  2 Dec 2022 14:11:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF1CCF80310; Fri,  2 Dec 2022 12:59:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEFCBF8026A
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 12:59:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEFCBF8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="alW/rx1J"
Received: by mail-pj1-x1036.google.com with SMTP id
 x13-20020a17090a46cd00b00218f611b6e9so4966923pjg.1
 for <alsa-devel@alsa-project.org>; Fri, 02 Dec 2022 03:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/Vw5Bai2lwFyw6B4xoF/V+GvBFjAzY/Iy4Z1uJpuc+E=;
 b=alW/rx1JVaKZik3faPtE6RfzG8yOqEP5n3b8v7ojYOBGrsD6DFZtb2fmWKrtCw0nSP
 ClE1upRlGoOIP1AoVBJe65k5qgQwL5mf+5erzl2JKy/sM8/3eQ2Aalbv33QIrnkBKRHI
 pwGqqatanQNUyPmxGH0+X0C5WKBKw5Ez6wqBeanXUw4chjjKg3KwudLHByGTQUE2xDwr
 QTAJ0Xfu7j2nRPvsgPSA7aYISB1EWTAeRZuNgG1SMSz9Pj2KxJSSpiMzNStSL/IPcFyH
 FEs115pCVbKMfXsQ8uZdcFV6GN2jBe+kz2obyh5UxD2Hl7/6YkqNBNtZkpSeAOhrP0Pv
 yx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Vw5Bai2lwFyw6B4xoF/V+GvBFjAzY/Iy4Z1uJpuc+E=;
 b=xkSjCOjkHAEyuaQcH0LoBFDKjSQtW0kdOjbNLyZW9zzcqFZfQd6NBvxcF3cLt1O3JV
 KCt0VJfik6oDwd6M9aHrXIEuW/4wDkh5/IifW1/HgZTl6FjSVxBQUy3wAlhvLT7b/4Vd
 yFhqel/5JPqviIt+s2aH9dIZXLrUEXd7ShGlN6ncNVDcXxAJlLo94kozy5r21qIXOC81
 HWNGQZ7xq2V2smnQnOUvavRdFxj5IQ1QfPj0erpGm0D8+N/AzT92k2JCDFLl6BwJhKoz
 r7olg3+Z+P0KYBySeaLkbH27JbjM4Eq09f7ItaHzKpbVE33dL5ALpg8mVpF7GJ/BZmJQ
 ghmA==
X-Gm-Message-State: ANoB5pkLeVLlmT+G1w6YkPvJw0Oo4sgbmWmC+2jsAG6W1HhwWsBAm3S6
 oE1rr15Iv9MEa2QAORtgFRudVpBp+eCgKg==
X-Google-Smtp-Source: AA0mqf58fkrFihlcZqHRWTwWzPp/52PAzAQT9uRM4vCm25R8z7fuLCeAzYI9lWVe++6EPJh7saJHXg==
X-Received: by 2002:a17:90a:ce05:b0:219:23ea:b314 with SMTP id
 f5-20020a17090ace0500b0021923eab314mr31478641pju.230.1669982378216; 
 Fri, 02 Dec 2022 03:59:38 -0800 (PST)
Received: from localhost.localdomain
 (2403-580a-80ed--90b3-8553.ip6.aussiebb.net. [2403:580a:80ed::90b3:8553])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a17090a414500b00213d28a6dedsm6479849pjg.13.2022.12.02.03.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 03:59:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: tas27{64,70}: fix PM ops ordering
Date: Fri,  2 Dec 2022 21:58:55 +1000
Message-Id: <20221202115855.16483-1-jcalligeros99@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Dec 2022 14:11:34 +0100
Cc: povik+lin@cutebit.org, linux-kernel@vger.kernel.org,
 James Calligeros <jcalligeros99@gmail.com>, tiwai@suse.com
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

On both tas2764 and tas2770, a write to PWR_CTRL is attempted
on resume before syncing the regcache to the chip, potentially leaving
it in an undefined state that causes resume to fail. The codec
is then unavailable until the next system reset.

On tas2770 specifically, both suspend and resume ops attempt useless
register writes on unrestored registers. This causes its state to be
desynchronised from what ASoC expects it to be in.

These two codecs are almost identical, so unify their behaviour
and reorder the ops so that the codec is always suspended and
resumed in a known/expected state.

Suggested-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 11 +++++++----
 sound/soc/codecs/tas2770.c | 40 ++++++++++++++++++++------------------
 2 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 2e0ed3e68fa5..51c6b3a940c4 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -32,7 +32,7 @@ struct tas2764_priv {
 	struct regmap *regmap;
 	struct device *dev;
 	int irq;
-	
+
 	int v_sense_slot;
 	int i_sense_slot;
 
@@ -157,14 +157,17 @@ static int tas2764_codec_resume(struct snd_soc_component *component)
 		usleep_range(1000, 2000);
 	}
 
-	ret = tas2764_update_pwr_ctrl(tas2764);
+	regcache_cache_only(tas2764->regmap, false);
 
+	ret = regcache_sync(tas2764->regmap);
 	if (ret < 0)
 		return ret;
 
-	regcache_cache_only(tas2764->regmap, false);
+	ret = tas2764_update_pwr_ctrl(tas2764);
+	if (ret < 0)
+		return ret;
 
-	return regcache_sync(tas2764->regmap);
+	return 0;
 }
 #else
 #define tas2764_codec_suspend NULL
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 8557759acb1f..5c9e8419b387 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -72,25 +72,21 @@ static int tas2770_codec_suspend(struct snd_soc_component *component)
 	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
+	ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+						TAS2770_PWR_CTRL_MASK,
+						TAS2770_PWR_CTRL_SHUTDOWN);
+
+	if (ret < 0)
+		return ret;
+
 	regcache_cache_only(tas2770->regmap, true);
-	regcache_mark_dirty(tas2770->regmap);
+	regcache_sync(tas2770->regmap);
 
-	if (tas2770->sdz_gpio) {
+	if (tas2770->sdz_gpio)
 		gpiod_set_value_cansleep(tas2770->sdz_gpio, 0);
-	} else {
-		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-						    TAS2770_PWR_CTRL_MASK,
-						    TAS2770_PWR_CTRL_SHUTDOWN);
-		if (ret < 0) {
-			regcache_cache_only(tas2770->regmap, false);
-			regcache_sync(tas2770->regmap);
-			return ret;
-		}
 
-		ret = 0;
-	}
 
-	return ret;
+	return 0;
 }
 
 static int tas2770_codec_resume(struct snd_soc_component *component)
@@ -98,18 +94,24 @@ static int tas2770_codec_resume(struct snd_soc_component *component)
 	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
 	int ret;
 
+
 	if (tas2770->sdz_gpio) {
 		gpiod_set_value_cansleep(tas2770->sdz_gpio, 1);
 		usleep_range(1000, 2000);
-	} else {
-		ret = tas2770_update_pwr_ctrl(tas2770);
-		if (ret < 0)
-			return ret;
 	}
 
 	regcache_cache_only(tas2770->regmap, false);
 
-	return regcache_sync(tas2770->regmap);
+	ret = regcache_sync(tas2770->regmap);
+	if (ret < 0)
+		return ret;
+
+	ret = tas2770_update_pwr_ctrl(tas2770);
+	if (ret < 0)
+		return ret;
+
+
+	return 0;
 }
 #else
 #define tas2770_codec_suspend NULL
-- 
2.38.1

