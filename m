Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 242DB56B76F
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 12:45:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C67431652;
	Fri,  8 Jul 2022 12:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C67431652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657277146;
	bh=OIkta1EPVOBcS7tNhsqPjqhofxUmswvGsbRG9WDttBk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gOR+abr3jEYvSttf6oHhXDfnHHwtsqBJGtjdZWaQjgW7h+rAZH0w78Al6aewM7/1P
	 4EMjojVb94c3yMDCWL3nypW1vcAqZgo4sm8Ov5a5PoxQ/GW3Z7c3+WPJioKmb3H9fC
	 zFfKIbJ5sf/OqDaQp+323tJzm51ZAsEMmcQX3D5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF1EF8057D;
	Fri,  8 Jul 2022 12:42:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DAB7F8057D; Fri,  8 Jul 2022 12:42:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1441CF80543
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 12:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1441CF80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hTrtpZJl"
Received: by mail-wr1-x434.google.com with SMTP id d16so23645754wrv.10
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 03:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HY2aQJ3seKosRomDmgMnHWVFcuzDBXXIFx3XPBOLqNA=;
 b=hTrtpZJlPsCTGIzPfH98dtPa0cJlHrZ7Oj9Epj9QNcgo4cHfJd37lkvyOgjgW+GJwt
 4/klkb9fTnlXYOuT9tGH3q30stF2AftY1kkNXyZCwDkjn8ZbRtCL/H53IBd+2epXo87S
 CBEXBHq8KUXU5OrTwpvple6RkcXZQjPXr0fc1QZ9whWRCFa9z4/WhElmzFfrwDrqbQ4z
 7MTunmzUq7VHZRsgQXq0CoyIJG+n/39Oa+z6yHioNw2VNmyny0jA4NHEf0lAds7U46rv
 ykdWTRNJWXPLMuObRWwd/Fb/c2v5yjJ6lOB9iZ6vgCp0mOZZe/UOWfO6ZYLp5rbOAygy
 g6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HY2aQJ3seKosRomDmgMnHWVFcuzDBXXIFx3XPBOLqNA=;
 b=qRQW8+nQgW5VOurgNaha1K9qkn/68OqUPErwZeQodEdtaGM+6hEA59Rzd+jSH63xvc
 vUj9NUD4I1I/NoV7j0JnIYL5BUjx1TNQLTG54hhkvE1KoXXEBZonuYoWUfLBxREXq9Jw
 iwSyFOkoOyvCmnK2XfaUR+5Sx+FZ7hXIb0+RUxPol7rxyMlzdwmANCIdh0QQm0jrEd7W
 DjyKcSCaKIKmQfxXehpk2sFC5FejB+l2SWBqg0DzT2ayrdMZTETLz75K80+KOdw2zqPI
 +7UFi5WLw58FG4IfO3ZPBuuhv1MHfHhwC8MxxskFmQlInHABoly2W3aY7gR7Iu/ZDP5E
 PHPQ==
X-Gm-Message-State: AJIora8trZjbYlYWLdy5TXSOQ9xOuGUyrCK/0kR952A/gHjhhnVwZBdu
 jDjCExJTchyqVNcrxdJY830=
X-Google-Smtp-Source: AGRyM1tfpTvfalGhFZsiu1vbL4GpE2n3KO9i2CJQkcDQNrenOpGthP7dzyRUrWJGCDoVSiW6LpirAg==
X-Received: by 2002:a5d:6e5c:0:b0:21d:7ba1:3601 with SMTP id
 j28-20020a5d6e5c000000b0021d7ba13601mr2741822wrz.554.1657276955770; 
 Fri, 08 Jul 2022 03:42:35 -0700 (PDT)
Received: from localhost (92.40.203.220.threembb.co.uk. [92.40.203.220])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adff906000000b0021d6a23fdf3sm13621400wrr.15.2022.07.08.03.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 03:42:35 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 10/11] ASoC: jz4740-i2s: Move component functions near the
 component driver
Date: Fri,  8 Jul 2022 11:43:03 +0100
Message-Id: <20220708104304.51415-11-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220708104304.51415-1-aidanmacdonald.0x0@gmail.com>
References: <20220708104304.51415-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Move the component suspend/resume functions near the definition
of the component driver to emphasize that they're unrelated to
the DAI functions.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 72 +++++++++++++++++------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 70b9d28a40ce..5db73f12efcf 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -303,42 +303,6 @@ static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return ret;
 }
 
-static int jz4740_i2s_suspend(struct snd_soc_component *component)
-{
-	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
-
-	if (snd_soc_component_active(component)) {
-		regmap_clear_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
-		clk_disable_unprepare(i2s->clk_i2s);
-	}
-
-	clk_disable_unprepare(i2s->clk_aic);
-
-	return 0;
-}
-
-static int jz4740_i2s_resume(struct snd_soc_component *component)
-{
-	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	ret = clk_prepare_enable(i2s->clk_aic);
-	if (ret)
-		return ret;
-
-	if (snd_soc_component_active(component)) {
-		ret = clk_prepare_enable(i2s->clk_i2s);
-		if (ret) {
-			clk_disable_unprepare(i2s->clk_aic);
-			return ret;
-		}
-
-		regmap_set_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
-	}
-
-	return 0;
-}
-
 static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -459,6 +423,42 @@ static const struct i2s_soc_info jz4780_i2s_soc_info = {
 	.pll_clk_name		= "pll half",
 };
 
+static int jz4740_i2s_suspend(struct snd_soc_component *component)
+{
+	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
+
+	if (snd_soc_component_active(component)) {
+		regmap_clear_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
+		clk_disable_unprepare(i2s->clk_i2s);
+	}
+
+	clk_disable_unprepare(i2s->clk_aic);
+
+	return 0;
+}
+
+static int jz4740_i2s_resume(struct snd_soc_component *component)
+{
+	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = clk_prepare_enable(i2s->clk_aic);
+	if (ret)
+		return ret;
+
+	if (snd_soc_component_active(component)) {
+		ret = clk_prepare_enable(i2s->clk_i2s);
+		if (ret) {
+			clk_disable_unprepare(i2s->clk_aic);
+			return ret;
+		}
+
+		regmap_set_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver jz4740_i2s_component = {
 	.name			= "jz4740-i2s",
 	.suspend		= jz4740_i2s_suspend,
-- 
2.35.1

