Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A44569413
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 23:16:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9921116A9;
	Wed,  6 Jul 2022 23:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9921116A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657142179;
	bh=hsgav2VjKvNGjLkOeBMggU5lngwNbFlHXQyu8RfVKLs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lgzCQ7ut4k6vjfJaH5EbUDi5wn2OCEEbDShKJ+N7VdQyxxAifPGWSk7xcWD7WleRn
	 u+rjTndT/EZ3inxNco2426nW6W1hf/nb0Yh+KYxmuLIhCNav/IPDcZf9N/R594KgyQ
	 7hfx2VPoQJ6L6YB/jS7Pu+ZHvJwdL8mk5QHD+TEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74E37F8057D;
	Wed,  6 Jul 2022 23:13:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E92DF80566; Wed,  6 Jul 2022 23:12:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18EB5F80542
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 23:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18EB5F80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Bie/rkw0"
Received: by mail-ej1-x62b.google.com with SMTP id u12so29133492eja.8
 for <alsa-devel@alsa-project.org>; Wed, 06 Jul 2022 14:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=we08VGkVJJS9erZ+xZEURv2knz+tCGYmdx4Fvbq08aw=;
 b=Bie/rkw0fZJCM4o17/trs/tRZNbAbnduk8j+HDM6c0Qw+dP+OKpnuZ5Tyd7+6aEyq8
 0/XE+WCynGervG526QuZBQk4yWg614mWBN24qSedFh8uj8OgHc+MZv8qBXXeStErrUXf
 5E2zG8d/sF/Su+y3ryO6B5wVLu8P/Q7WUKnDZ/wb9k+X3UhbjtN8q/G+kPTIiDyTJSjc
 CFcf7efQotPQ00EMa8lczD4xwtkIxD3iaQVWLWfM+GYc+M/bGJy6QAguxUnlB983R91M
 0FdVcsCk2mIFrfSJ6wOVJsKaauQDnSr2thEUXaWbCC+mH7ZcO7g+yFHMxoCypRPfoZL5
 qsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=we08VGkVJJS9erZ+xZEURv2knz+tCGYmdx4Fvbq08aw=;
 b=wqVN7r0skReOQtjEPvHqF+5BnmH51emcbKoZGV0beSYdZzVo/k6jxvZkbXoOH/XZmO
 qmtxtQi05zOuYuX5BN+HZnTsq1MEMJJFmPDAlK/T8+ibQizwsjepWtbhkaf1gQK8Ho1A
 aT/FpxsKcntmTahmx4AjB80pEV35hsOxEU+Ke+eB5WIZ5PXbdQI18sa3LRF45ivV9kZh
 n8qMoBz6OWEAM2q03ghehnZF5JV6MaYP2yM+NNjYXp+mI2lAuU46wtCEVcVJDUUFUZ1Z
 Fg68Bcis5IrYLgTDaoyvex0yHZ4qLUXaQy12l07r+yhUZrXBSc1VsSVhGYVEsCCifcO7
 azwQ==
X-Gm-Message-State: AJIora9j7vELmWLZJ7jQVwBYxqGY+4VH0eI+f0JGOtEe6wMygYWdIdqu
 FlyvfPiZWhQZWqnaY7wM/qo=
X-Google-Smtp-Source: AGRyM1uHBO2y9EEWc2OBKCoKBWs/OWH1CuCPvILePBbd1nLqVoWD4UCdzMYiiv872nfgNeZ9S3U0og==
X-Received: by 2002:a17:906:9756:b0:722:ec43:9252 with SMTP id
 o22-20020a170906975600b00722ec439252mr42473586ejy.299.1657141968933; 
 Wed, 06 Jul 2022 14:12:48 -0700 (PDT)
Received: from localhost (92.40.202.8.threembb.co.uk. [92.40.202.8])
 by smtp.gmail.com with ESMTPSA id
 v17-20020aa7dbd1000000b0043586bee560sm26103857edt.68.2022.07.06.14.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 14:12:48 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 07/11] ASoC: jz4740-i2s: Remove some unused macros
Date: Wed,  6 Jul 2022 22:13:26 +0100
Message-Id: <20220706211330.120198-8-aidanmacdonald.0x0@gmail.com>
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

These macros are unused and can be dropped; the information is now
encoded in regmap fields.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 3c3cf78bf848..b8d2723c5f90 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -35,8 +35,6 @@
 #define JZ_REG_AIC_CLK_DIV	0x30
 #define JZ_REG_AIC_FIFO		0x34
 
-#define JZ_AIC_CONF_FIFO_RX_THRESHOLD_MASK (0xf << 12)
-#define JZ_AIC_CONF_FIFO_TX_THRESHOLD_MASK (0xf <<  8)
 #define JZ_AIC_CONF_OVERFLOW_PLAY_LAST BIT(6)
 #define JZ_AIC_CONF_INTERNAL_CODEC BIT(5)
 #define JZ_AIC_CONF_I2S BIT(4)
@@ -45,11 +43,6 @@
 #define JZ_AIC_CONF_SYNC_CLK_MASTER BIT(1)
 #define JZ_AIC_CONF_ENABLE BIT(0)
 
-#define JZ_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 12
-#define JZ_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 8
-#define JZ4760_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 24
-#define JZ4760_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 16
-
 #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE GENMASK(21, 19)
 #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE GENMASK(18, 16)
 #define JZ_AIC_CTRL_ENABLE_RX_DMA BIT(15)
@@ -73,12 +66,6 @@
 
 #define JZ_AIC_I2S_STATUS_BUSY BIT(2)
 
-#define JZ_AIC_CLK_DIV_MASK 0xf
-#define I2SDIV_DV_SHIFT 0
-#define I2SDIV_DV_MASK (0xf << I2SDIV_DV_SHIFT)
-#define I2SDIV_IDV_SHIFT 8
-#define I2SDIV_IDV_MASK (0xf << I2SDIV_IDV_SHIFT)
-
 struct i2s_soc_info {
 	struct snd_soc_dai_driver *dai;
 
-- 
2.35.1

