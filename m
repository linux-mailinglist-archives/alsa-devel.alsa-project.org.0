Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17207608F33
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 21:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8FE39CCB;
	Sat, 22 Oct 2022 21:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8FE39CCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666466206;
	bh=FIDLMQJuDlAuNSYse+GQDyb7LMhn93N903DWDRnK0Sk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pg0RSRyBCUruoO3f9bNFTI5i6AkHpW9hFYWL5rvQPx/PEEqqdyYrJD5KzhsXpuKFz
	 y9ZeFWQLVtg6OzFBVmvJThm9yJpIrlMITvMZYYmLWpumfB76o1RriQBgNNJgVf2GIC
	 MRvMG0pZWhcz79conp/uFZCO2evNwyRya0W6Un+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB825F80566;
	Sat, 22 Oct 2022 21:13:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53A54F80578; Sat, 22 Oct 2022 21:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1CB8F80551
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 21:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1CB8F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oqJu8idV"
Received: by mail-wm1-x329.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso4124061wmb.5
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 12:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iboSBornxxq5IGUmNwjcHJMSvR6JYlZCJH/3I/odZvU=;
 b=oqJu8idVmaPE2LMxcxWsLgGsAW2tGfh5XvsPFHkCPRZyF99ZTJ3OttyzL7xNtIH9Eb
 hDNW79sudExmGZ2fAsl3tOyh572iBMWG7vByO8keqMC/vee9+Z6Qgxnb/9Pcqu+3I7Cl
 6/apLAkn5OENy/0Scvf3Lmeoa+J+9cCBAie9jv64kQnIrXfH51gUV6wcv7ypeN7McqQP
 yvafe8i8aVLjyqdcH5hTEIDPowDKtENQyUHggOTsHeZcDQvfEtQPhoRkxb9TZWuxOIap
 KLmRRdTeVzh94m7uPJZG7oLDb6iwQZFeQbklrUw6DEXSXRWQKKEalzcuIaavw/eZfL6n
 +L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iboSBornxxq5IGUmNwjcHJMSvR6JYlZCJH/3I/odZvU=;
 b=eaxrZB+Auuf1wwi7mXo1lpTuI8i7iSq62mmb2V+/PWfY2bE+Ps2DCydEIH6fdPPdP0
 9nk2qFCaWIM9XTlBDix0Ob1tNU2gVtndxGguPS5dRH8SFGb/aGDZmnYZS82GUw56ps+z
 mDCof81qrwY1SH8JCT9LTToJEM8wb0JrTqmit/v75xs77y45JVM04fGd3oJNhPdzZtbB
 2F0bc987QnWxDAikXeMonCJjbYS7h550ThsNmo8v3Q9FyuAbacaGHHyhdSm7uWhKyTx7
 fO76KJV0sLUDZZIz09jWUopnKN3Ta12YvbBk5be2Q7wiHC1rIkB1Y/EogwjwOJLWDPg1
 Strg==
X-Gm-Message-State: ACrzQf335YN3qzZK6y7rqJwIbRKFeEOz3TdapFmC9bWe4sYahdm418EH
 +YMraatfOZQ+/eFSdV7Jdwc=
X-Google-Smtp-Source: AMsMyM70MXJZAWK50FvealyeZjpK7na1yNlXvvbKwBNPVXvZWYif3RfyAo8Mb+sqm4+r2Dm++KIjbg==
X-Received: by 2002:a05:600c:4789:b0:3c4:dbb7:ab0c with SMTP id
 k9-20020a05600c478900b003c4dbb7ab0cmr17526542wmo.164.1666466012056; 
 Sat, 22 Oct 2022 12:13:32 -0700 (PDT)
Received: from localhost (94.197.1.68.threembb.co.uk. [94.197.1.68])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a05600c1c8e00b003c6bd12ac27sm6489884wms.37.2022.10.22.12.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 12:13:31 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v5 8/9] ASoC: jz4740-i2s: Move component functions near the
 component driver
Date: Sat, 22 Oct 2022 20:13:07 +0100
Message-Id: <20221022191308.82348-9-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221022191308.82348-1-aidanmacdonald.0x0@gmail.com>
References: <20221022191308.82348-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 zhouyu@wanyeetech.com, linux-mips@vger.kernel.org
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

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 72 +++++++++++++++++------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 201368f828ff..ac04b17c2787 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -302,42 +302,6 @@ static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
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
@@ -454,6 +418,42 @@ static const struct i2s_soc_info jz4780_i2s_soc_info = {
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
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
2.38.1

