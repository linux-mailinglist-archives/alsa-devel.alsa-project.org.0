Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B431B56AC39
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 21:50:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54E201687;
	Thu,  7 Jul 2022 21:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54E201687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657223426;
	bh=OIkta1EPVOBcS7tNhsqPjqhofxUmswvGsbRG9WDttBk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KMrZDm7hQEDYJEz9Pmsw15yPPaN4WUJgJQuLpw+78StaQobgnhS2KStr+XQMjDKym
	 9abRf4l1ZiGV0F35XfmJp0ieb0wo4+a8KPEO5xy6+nKBjvIfbu3JhLbd9QeGs6SPIZ
	 ZAmMkGDwSYpaLWye2NjJspyWsx+MrVmo0OTsdP1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B6E8F8058C;
	Thu,  7 Jul 2022 21:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BE25F80552; Thu,  7 Jul 2022 21:46:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85742F80557
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 21:46:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85742F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WJyzAI+U"
Received: by mail-ej1-x631.google.com with SMTP id l23so2415340ejr.5
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HY2aQJ3seKosRomDmgMnHWVFcuzDBXXIFx3XPBOLqNA=;
 b=WJyzAI+UhCADxJhSCpFfMc6JP0QO5yqzG/wGBZtRpn9kH5VJLTu4tPA4BEw9SIyFky
 +kCT7l8pqt6jrOI3gb5H3XjwW4GMf5XlfqBA95zc6cDAGqsWYByNiV4AYHWNofl9XOJO
 tGCvVyO5IdKHC9/PBlBeAE0ZPbXdRLrm3BYQpA8iyqS4E7EInufMtUzSCm15on1mziEf
 JvwJzxuNZn2oKL5mT1yPYQAANMVw43YAwSSD+8i2LFEiGiInhZfp81est8FmvqXf79fD
 stf9FHEzh6sruZa/41S5RU6J6uzUS6pZtLjJj352zcXMOucnR4ZsYkxQqGkIYZM2u+Cs
 qm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HY2aQJ3seKosRomDmgMnHWVFcuzDBXXIFx3XPBOLqNA=;
 b=FTtY3HBPCSiZW4rBEsmyHSHuREV4LajjhF0NZvn3v06qtmTIRwEf5HPKTG4rjtDvw8
 7EUIeEdUGo3oaZ+//jS+Tkb5K11YINO8bzxVuxMyiiEkZtdS9YJi6aE6LETHuV6nV4PG
 EN5jcGSZLTCggwOOvafC2b7C6JiJ+Wkhe5SrpAp6uwi1oV6RV3OK9FngfSrE90xFjoGB
 ciFjQpQJp9gqefjExu6J2AtBO4lDJezuQ1kKnf9b91l75Ub8ByKerJlL8p5ho83sXoxp
 r5q2vgScWy6w3n+I1rXuclQAhA+6jHmKzshoh92xQx5Z1cd7SxtsCSMYm4Kyrj+cGmJL
 qGWg==
X-Gm-Message-State: AJIora+gzSNOOazAJgv1Ym6eBDU+apPxDqPATIsFcKHYtKrp7zgl1TEM
 /8R0dJBbBBEojG5Yo6vn3+Q=
X-Google-Smtp-Source: AGRyM1tUzrKvbxi+tK5EGLPnSQdDaVYBSDyNJGRicwUovzw7kcQNq25KFOZRTkp/LJ+afkG0aZQikA==
X-Received: by 2002:a17:906:3589:b0:723:fe13:e981 with SMTP id
 o9-20020a170906358900b00723fe13e981mr45344059ejb.446.1657223215230; 
 Thu, 07 Jul 2022 12:46:55 -0700 (PDT)
Received: from localhost (92.40.202.166.threembb.co.uk. [92.40.202.166])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a17090666cc00b007041e969a8asm19400140ejp.97.2022.07.07.12.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:46:54 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 10/11] ASoC: jz4740-i2s: Move component functions near the
 component driver
Date: Thu,  7 Jul 2022 20:46:54 +0100
Message-Id: <20220707194655.312892-11-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220707194655.312892-1-aidanmacdonald.0x0@gmail.com>
References: <20220707194655.312892-1-aidanmacdonald.0x0@gmail.com>
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

