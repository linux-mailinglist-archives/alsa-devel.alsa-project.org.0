Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B456940D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 23:14:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49458168D;
	Wed,  6 Jul 2022 23:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49458168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657142099;
	bh=kLxpE0u+WjAZyJl07ZiGxQAaZbYmIRFKWIjRsMl2dY8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t0mdLGlmPb1M3i+03ySF24Syg7sYxOv6n1F2a3Tb2hWt1TOUNmPfYMKhd/4A0ZuRk
	 qvjTiBr+E6Hb/ukfdnM37l3kJ4X9zZUYDYivmuzV0JN14GKtEcQRIjwLsu8aASuwOz
	 Fjh9d/qi0MBikYVY8nNvERHKpzRZYTbQKw8qiqzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0951CF80549;
	Wed,  6 Jul 2022 23:12:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D31AF80548; Wed,  6 Jul 2022 23:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8E72F8053E
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 23:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8E72F8053E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="O7h259ve"
Received: by mail-ed1-x534.google.com with SMTP id v12so8178059edc.10
 for <alsa-devel@alsa-project.org>; Wed, 06 Jul 2022 14:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fHRKwDMoPqGsmLDhEylrCYQasRxJDmsT4CqEKEyjAlE=;
 b=O7h259vepu/QVKHCbTGHl8v7N2k851FtJ1GRdrD4ta7iplL6yxvNebNDjGUPGZ7J85
 FDHdxt2gSrq2cOJ/+olkLxWUQ/nxck/pYQkQZnirpMSFJmCzxmFBXYdnDaNnhxb9JBKu
 ucB8y2H1QSFkHVlgNKrZ+xQg5y38LGPlqHDQHk388wIW6tyQKg6iRslrH19G9o+6UU63
 4zW8BFf6yWJ99yC4XpFHxXeA4KgnWW2u1IBf5kb1OnEgbeA+EIWLW5rKYvjaH1PV/PLQ
 HpivP5tivPUt615obpxrdlMvkMak9Qiop89Xah1ZW1Ar7gArAPanIJqRzBu4kJ4yvGJW
 oczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fHRKwDMoPqGsmLDhEylrCYQasRxJDmsT4CqEKEyjAlE=;
 b=e/AQLNvAYHp4lGCe55u6YNueEkqCu8AmZ31ncqxx9M0fbDAuFJxHPfNUOeqsxE6BtX
 93tTELmootTdJ6wbvxEDup+0+NRTlexOi15qtNO1ViTjYC9V9W80f7MwyQFYFjYgRp4Y
 0dUwajZ5cT0jAKG6HxN+nC+QFm5O/Gi1UVqGEhAQ3rZnQQ7BqT+Bk9SFSgmIjNjsCzLw
 ssgdCRc7EtSfhQ0z+B75DL26QNhNWJTV4WRVqba7buc0E0jvLBEMA7vJ4W/QB9kNsyeM
 SJ+/hX2PzedvnjiLCOo6VFOw9YiLSCMWYOLEeMSd8Fi+D7eD6FkCUj2hbrkJuoGMpQgX
 0fFg==
X-Gm-Message-State: AJIora87QC4ixkIXAE/sLUv3wmi9XxXxjYFaEsvhxLIZATiLcBL2Woyz
 QtL5w44kQOGyWhU89Ce6Qvg=
X-Google-Smtp-Source: AGRyM1s2f1EL28m5rxI1eGs6Sm3yWkuXRIXnOVcUfsNcnMg/sRoZmWN0UAqqKHxooyUmcQafNusmxg==
X-Received: by 2002:aa7:d5d7:0:b0:43a:6eda:464a with SMTP id
 d23-20020aa7d5d7000000b0043a6eda464amr20410276eds.193.1657141965487; 
 Wed, 06 Jul 2022 14:12:45 -0700 (PDT)
Received: from localhost (92.40.202.8.threembb.co.uk. [92.40.202.8])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a056402020d00b0043a71775903sm6131364edv.39.2022.07.06.14.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 14:12:44 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 05/11] ASoC: jz4740-i2s: Remove unused SoC version IDs
Date: Wed,  6 Jul 2022 22:13:24 +0100
Message-Id: <20220706211330.120198-6-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
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

Using version IDs makes the code hard to follow -- it's better to
describe the functional differences between SoCs instead. Remove
the IDs since they're no longer used.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index cbb89f724f64..8bb9449d13d3 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -81,15 +81,7 @@
 #define I2SDIV_IDV_SHIFT 8
 #define I2SDIV_IDV_MASK (0xf << I2SDIV_IDV_SHIFT)
 
-enum jz47xx_i2s_version {
-	JZ_I2S_JZ4740,
-	JZ_I2S_JZ4760,
-	JZ_I2S_JZ4770,
-	JZ_I2S_JZ4780,
-};
-
 struct i2s_soc_info {
-	enum jz47xx_i2s_version version;
 	struct snd_soc_dai_driver *dai;
 
 	struct reg_field field_rx_fifo_thresh;
@@ -406,7 +398,6 @@ static struct snd_soc_dai_driver jz4740_i2s_dai = {
 };
 
 static const struct i2s_soc_info jz4740_i2s_soc_info = {
-	.version = JZ_I2S_JZ4740,
 	.dai = &jz4740_i2s_dai,
 	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 12, 15),
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
@@ -415,7 +406,6 @@ static const struct i2s_soc_info jz4740_i2s_soc_info = {
 };
 
 static const struct i2s_soc_info jz4760_i2s_soc_info = {
-	.version = JZ_I2S_JZ4760,
 	.dai = &jz4740_i2s_dai,
 	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
@@ -442,7 +432,6 @@ static struct snd_soc_dai_driver jz4770_i2s_dai = {
 };
 
 static const struct i2s_soc_info jz4770_i2s_soc_info = {
-	.version = JZ_I2S_JZ4770,
 	.dai = &jz4770_i2s_dai,
 	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
@@ -451,7 +440,6 @@ static const struct i2s_soc_info jz4770_i2s_soc_info = {
 };
 
 static const struct i2s_soc_info jz4780_i2s_soc_info = {
-	.version = JZ_I2S_JZ4780,
 	.dai = &jz4770_i2s_dai,
 	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
-- 
2.35.1

