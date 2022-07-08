Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CB956BD33
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 18:06:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 955AA1616;
	Fri,  8 Jul 2022 18:05:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 955AA1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657296405;
	bh=QfjpHc3E4A3ApwJy+loEtcp2+mfVz8bFvv+VSxRNjGA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o7kwW9vB4h3Nw3pSbq2q8QCodnlMgzG7DlCWYFQ4xtheFF2oh4T5i9n6BIpZufbUL
	 rS6dOoRWegsGvi9/8RGL4D/DhAQxCQCcNVdx/wytm4VhZcH1YmqHhVOmkLG0lFOSUH
	 LmIvU7yxAL3Zw6qg8aMHfLlZCFNH0A8DkLYViKHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6661F805AF;
	Fri,  8 Jul 2022 18:02:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 728EAF80589; Fri,  8 Jul 2022 18:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6524DF80579
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 18:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6524DF80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k6MRafTI"
Received: by mail-wr1-x42e.google.com with SMTP id f2so25767156wrr.6
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BZiUZmT0tfqSNYrVDB3ZIcuUNgROO7bIhmSFmAv1IU0=;
 b=k6MRafTIjLFT1JtE4D9aEJAzuM2l4LHSD4LFUev0WAz/qxJcFYLmLFPd8T3HUi+GmM
 WXPH4YdtZEsMaIroLkgE7WPNusU/6W4LjIv3aeCTx5zofkvZtLOPr65PLDW0vSWv1W3R
 rfCi3UZpFbAZkZF0LpCNYsPR0+Q+i7Qqk6jvb/c+HTCqHeURueg52FbQYt9/dyICsSY6
 6R+4aaVMXH3GUwIdxTgFW7NHadDkP7Id3PxrWR7XaixVjPIxcVzgKCOhLFizC4S6YIQ4
 8xFhUifbVMbugJSITvDtO6Wjv69aeGeK3wY8L/VxcTHvyrQTOeCNxlae3ONObLkDMS0q
 88OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BZiUZmT0tfqSNYrVDB3ZIcuUNgROO7bIhmSFmAv1IU0=;
 b=Wi7gL77Was1Bl6ddUy69kgwJygBk0Y90RA2jdxiwoxlbFLq7vJW/lkB1KyUGHBM2/I
 cQeOcMPNiNxEjcjbfS2F9Z/QrqOLUp9HqH8HI8mHW3+rRById3gDhzD1KIQxOI5fqaqS
 i9ROdfwee4Fj3ylAXzrcWZ6ajfCHejaVmtMBnofN6EOIbBSYzKUJbEyovqBBZW6yJFFW
 2xQV3SF2HZJogV8S7+W3ufBqFpdk+nBdVxAkwfQB6q8EaxHO+49W0X1nRhyMgvBvxnwI
 mLrwl7MCxhfQJQSuO8bB5on+Ku7j4ZmoTj2oTicynYSpjOyFYxrkczBvd+TASaMSFHvV
 fDRA==
X-Gm-Message-State: AJIora9nOZcHGmgr2U17IoWOoy8UGXA126gLp75ekStggsWkbS5pywu8
 uYOnwj0t9gK5V/pzF2HfpM+nri0uTtg=
X-Google-Smtp-Source: AGRyM1tuHwQHC7pZ7s1H59Nugqp3lsiCjlDeqN1LoHU5yuofAm0gZ09wOdaDS3o1h9QbDqE/CssYzw==
X-Received: by 2002:adf:979b:0:b0:21d:868a:7f2f with SMTP id
 s27-20020adf979b000000b0021d868a7f2fmr3980444wrb.409.1657296144573; 
 Fri, 08 Jul 2022 09:02:24 -0700 (PDT)
Received: from localhost (92.40.203.144.threembb.co.uk. [92.40.203.144])
 by smtp.gmail.com with ESMTPSA id
 by13-20020a056000098d00b0021b89f8662esm17612622wrb.13.2022.07.08.09.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 09:02:24 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v4 11/11] ASoC: jz4740-i2s: Refactor DAI probe/remove ops as
 component ops
Date: Fri,  8 Jul 2022 17:02:44 +0100
Message-Id: <20220708160244.21933-12-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
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
 sound/soc/jz4740/jz4740-i2s.c | 54 +++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 5db73f12efcf..d99a19bc5166 100644
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
@@ -459,8 +435,38 @@ static int jz4740_i2s_resume(struct snd_soc_component *component)
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
2.35.1

