Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CDF56AC3B
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 21:50:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 223151671;
	Thu,  7 Jul 2022 21:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 223151671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657223443;
	bh=SsHuwoNRavKj0Xq/ONPG5E2DUmkMDxNiGFAZ7Z3pc5k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DDRktkV84HpxMNy0lhtgbfr1ouLlNtdiyEW9KGixQVtXAjvw6NgJWv2wb2QjlvIIY
	 +ZxPPHf5El8oNbQiaSTVzWD7w+t5a6rgADuNzOSAAP/8358A9owHyiyxwj4N8IZVgW
	 bMA/MG8iGSx33sKaXiKvp6o/xOvz1VGqmmtrA3bQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF6DDF8059F;
	Thu,  7 Jul 2022 21:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29706F8057A; Thu,  7 Jul 2022 21:47:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BD46F80570
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 21:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD46F80570
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HwLSwtkK"
Received: by mail-ej1-x62e.google.com with SMTP id u15so9776538ejx.9
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 12:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I3O9KA8l0ZyZWk4PrHMwkxFP5JEBmMEH3qlexm1SaGo=;
 b=HwLSwtkKtvR1JYRcZtIwcC4yQ+vua1ftIKD9bu7kpfEy4Cm3W8mblgbzmNPr73P/h/
 /4rPSpd9ODBgzWlhRj8NI6n+CqEoXlLf5JuCM6cu9k4JNYBDelbQyeT5aoJ/d+GkZM/4
 fvgXUgbJudUuxFavxVMK6/qk2tZDOkhN+WxmxgEPt4/sQ8GNYhxfTFQmnLuau0h73YKB
 CTqf2mABEU25rfu8arQIyQ+JFpWEjFYVntJJA6e7vE0AZ0nlrFHn4si5uXvNgtd+RxCS
 2pyvxrKFbyXqnzB/cg0rDl3FAPT4KU6JODXjBqljMnJ+8PeVHvfjCXht9gv4Pd9jUfgB
 0VGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I3O9KA8l0ZyZWk4PrHMwkxFP5JEBmMEH3qlexm1SaGo=;
 b=43LY24sAJc27r8wh+tnUHE5vT+Ad1UfzD0zPru+Q7hzylrGrwGYP4kDx6Z8VVIu4N1
 71Rzh7+25DyHG3kFd6U/leswIDISb3mpRl5w2tynFTXLpC22S35nEJuoFbYGswp539Yf
 mHnToowtG1kdltKH5U3nyMnxI/xOZGoI0+xKFh771/majIK7v/UYH/fWdHJyZC1q/V4Z
 rooIbMp/3yUneSfsyRPT8d/p1FlOSqDbfOkXheA9pFQa0EpPTHezWiN8Wi6i3o6GHE06
 t9Xg8e5BKmOY/CfYHqL6Nyocejy5er/MJSYkswPtox1YxbV2AKwG22EStKJ/lSUt7O29
 bjLQ==
X-Gm-Message-State: AJIora8SsDJ7pu9M0ORuHlaPoJPi7shaH0HyZcpS1nSId9JfdbMljKo2
 RPBQ6gZvKmyLuM2oGNWr3Bc=
X-Google-Smtp-Source: AGRyM1vlnCepxfEnkz/UpZMQDzyxm0F292miVG6p+EZfseDNlA70THgCrx3IUvfsU++monQQt7zpnw==
X-Received: by 2002:a17:907:1b03:b0:6ff:78d4:c140 with SMTP id
 mp3-20020a1709071b0300b006ff78d4c140mr48043015ejc.554.1657223216723; 
 Thu, 07 Jul 2022 12:46:56 -0700 (PDT)
Received: from localhost (92.40.202.166.threembb.co.uk. [92.40.202.166])
 by smtp.gmail.com with ESMTPSA id
 g17-20020aa7c591000000b0043a4a5813d8sm10624117edq.2.2022.07.07.12.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:46:56 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 11/11] ASoC: jz4740-i2s: Refactor DAI probe/remove ops as
 component ops
Date: Thu,  7 Jul 2022 20:46:55 +0100
Message-Id: <20220707194655.312892-12-aidanmacdonald.0x0@gmail.com>
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

Move most of the DAI probe/remove logic into component ops.
This makes things more consistent because the AIC clock is
now managed solely from the component side. And it makes it
easier to add codec switching support later on.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 53 +++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 5db73f12efcf..e39ba4911678 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -306,32 +306,10 @@ static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	int ret;
-
-	ret = clk_prepare_enable(i2s->clk_aic);
-	if (ret)
-		return ret;
 
 	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma_data,
 		&i2s->capture_dma_data);
 
-	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_RESET);
-
-	regmap_write(i2s->regmap, JZ_REG_AIC_CONF,
-		     JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
-		     JZ_AIC_CONF_I2S | JZ_AIC_CONF_INTERNAL_CODEC);
-
-	regmap_field_write(i2s->field_rx_fifo_thresh, 7);
-	regmap_field_write(i2s->field_tx_fifo_thresh, 8);
-
-	return 0;
-}
-
-static int jz4740_i2s_dai_remove(struct snd_soc_dai *dai)
-{
-	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-
-	clk_disable_unprepare(i2s->clk_aic);
 	return 0;
 }
 
@@ -351,7 +329,6 @@ static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
 
 static struct snd_soc_dai_driver jz4740_i2s_dai = {
 	.probe = jz4740_i2s_dai_probe,
-	.remove = jz4740_i2s_dai_remove,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
@@ -389,7 +366,6 @@ static const struct i2s_soc_info jz4760_i2s_soc_info = {
 
 static struct snd_soc_dai_driver jz4770_i2s_dai = {
 	.probe = jz4740_i2s_dai_probe,
-	.remove = jz4740_i2s_dai_remove,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
@@ -459,8 +435,37 @@ static int jz4740_i2s_resume(struct snd_soc_component *component)
 	return 0;
 }
 
+static int jz4740_i2s_probe(struct snd_soc_component *component)
+{
+	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
+
+	ret = clk_prepare_enable(i2s->clk_aic);
+	if (ret)
+		return ret;
+
+	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_RESET);
+
+	regmap_write(i2s->regmap, JZ_REG_AIC_CONF,
+		     JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
+		     JZ_AIC_CONF_I2S | JZ_AIC_CONF_INTERNAL_CODEC);
+
+	regmap_field_write(i2s->field_rx_fifo_thresh, 7);
+	regmap_field_write(i2s->field_tx_fifo_thresh, 8);
+
+	return 0;
+}
+
+static void jz4740_i2s_remove(struct snd_soc_component *component)
+{
+	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
+
+	clk_disable_unprepare(i2s->clk_aic);
+}
+
 static const struct snd_soc_component_driver jz4740_i2s_component = {
 	.name			= "jz4740-i2s",
+	.probe			= jz4740_i2s_probe,
+	.remove			= jz4740_i2s_remove,
 	.suspend		= jz4740_i2s_suspend,
 	.resume			= jz4740_i2s_resume,
 	.legacy_dai_naming	= 1,
-- 
2.35.1

