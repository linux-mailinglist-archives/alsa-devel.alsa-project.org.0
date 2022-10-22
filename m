Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB511608F34
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 21:16:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56E81C094;
	Sat, 22 Oct 2022 21:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56E81C094
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666466218;
	bh=wW6yiH9bvrdAmeDezn5x1HFvoFoiPZiViGYPnMUt8gQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tbEbU0Ka+UMvL4s40hyft8JaqWHxRYWF6ILHLiy/bdJyL0qgO10FHP1o8/JXXbLzi
	 ubPgDmbTsaA8p+SK+alSkXR1n8CyJ2imsr33Kjjo5PIvqZ9QomypxncTxYx78jGyJV
	 2jMkXnnL9zjZGnYV2RZlHGHtSv8LqYDiI7/LuAxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9F92F805AA;
	Sat, 22 Oct 2022 21:13:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30FC3F80580; Sat, 22 Oct 2022 21:13:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 601FEF80566
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 21:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 601FEF80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hw+XHD7R"
Received: by mail-wr1-x431.google.com with SMTP id bv10so9729491wrb.4
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 12:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yKcyGQjHmAJtNmBYOXlBo9pb7HsrytrHyz7qgBwYjhw=;
 b=Hw+XHD7RCt/daigkuB1KfVebYD5PXtPfs/QfW9bbg+58XHGZl/hveZweMdcSj3WCT/
 cYYSQt1IxPBc/DZKeroYCtE9APMtygG6p7h1Hrm3H0aa/3J85iUzXdFsMffI2b2ns7Ej
 uC+FAAZKtM91qSrlc/kPsYb4epqxfQcPB5h3jBvdkL51ie9tVygPbpDzhF2lnU6yMUV5
 UujDcFfl/Oco+P43unJF9Y9yhXfWQGWxxW93+qbBGLpX/xE+U1avJZjCV3ulBG8rO//G
 ZVbmceuPtb6+VCT74ijMbGExytSHSGC2IFgaLrJbn2El7xVyR6oJD8WvSdmh31WSsy6+
 9JIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yKcyGQjHmAJtNmBYOXlBo9pb7HsrytrHyz7qgBwYjhw=;
 b=FrEZYjCYZ6yFTEiTYcMYGVggaPzv0EUPnldrXnl6hgxRF85KacXl5umCmsZo80H8wk
 P4V+DbDJgGwj8zrYJD06ukGF7ykrN3ADa4MpaoIdr5uLHqY8GJeacKjpqoS8FXAuY3Cl
 LlyQhFUG/m56r4GiYdEEdj1zU5CU/e92clIRdoDg3rHqiRpRRlWQADpf7EVXhh7OI/Kc
 w1udFNh+MIJAJNpc91WRUI4a3O36ISPZ40/RJBjKl6UYFexJbjuQl4wAqslR9N0uWsSu
 nc7Ndo/fmJBWsOCSm9lljhz4ggUX7d8rAHYWxS6MWM79Odt8JCMj1ns9lmaSUh+LsMvw
 9Vrw==
X-Gm-Message-State: ACrzQf1L8j5z3ezrcOvUUDzxQvS+W0rrDG+/fJewDAxbzHQhrvg0hDUZ
 bxuyLoeHHuu4nugCEGr5wMI=
X-Google-Smtp-Source: AMsMyM5xrNk/kgbiDY0crLGB6Opb837yb+S/DPwbHApxtbjdJ3dp3v3beCEOwtdwo24iXTpY4QJpaw==
X-Received: by 2002:a05:6000:1f01:b0:236:64ae:ad19 with SMTP id
 bv1-20020a0560001f0100b0023664aead19mr1172301wrb.523.1666466013537; 
 Sat, 22 Oct 2022 12:13:33 -0700 (PDT)
Received: from localhost (94.197.1.68.threembb.co.uk. [94.197.1.68])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adff2c1000000b0022ac1be009esm22593067wrp.16.2022.10.22.12.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 12:13:33 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v5 9/9] ASoC: jz4740-i2s: Refactor DAI probe/remove ops as
 component ops
Date: Sat, 22 Oct 2022 20:13:08 +0100
Message-Id: <20221022191308.82348-10-aidanmacdonald.0x0@gmail.com>
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

Move most of the DAI probe/remove logic into component ops.
This makes things more consistent because the AIC clock is
now managed solely from the component side. And it makes it
easier to add codec switching support later on.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 54 +++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index ac04b17c2787..b620d4462d90 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -305,32 +305,10 @@ static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
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
 
@@ -350,7 +328,6 @@ static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
 
 static struct snd_soc_dai_driver jz4740_i2s_dai = {
 	.probe = jz4740_i2s_dai_probe,
-	.remove = jz4740_i2s_dai_remove,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
@@ -386,7 +363,6 @@ static const struct i2s_soc_info jz4760_i2s_soc_info = {
 
 static struct snd_soc_dai_driver jz4770_i2s_dai = {
 	.probe = jz4740_i2s_dai_probe,
-	.remove = jz4740_i2s_dai_remove,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
@@ -454,8 +430,38 @@ static int jz4740_i2s_resume(struct snd_soc_component *component)
 	return 0;
 }
 
+static int jz4740_i2s_probe(struct snd_soc_component *component)
+{
+	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
+	int ret;
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
2.38.1

