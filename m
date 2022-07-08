Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F7356BD2C
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 18:05:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC1A486E;
	Fri,  8 Jul 2022 18:04:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC1A486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657296307;
	bh=dIt5wKB80gwhyD3+9m8BE9Gh9K91y3ygzk5kL3tzuX4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/Hw4fb0fVMgCSBGvDXWVra6INOqZm2S9EChFMKZ5H2E9LqfdqAS2Yl7hC0RzZ4GQ
	 1ALTJM7CK39J9Tw5vV4ketI8pPQnX28b7re//y6t8V63VJZBhKzRDO3Rr3CCwGVg5a
	 49lStMtWr5MHk4priymlwk3kUJH5qvDXfcsP+sgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67EC5F8053E;
	Fri,  8 Jul 2022 18:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1400AF80571; Fri,  8 Jul 2022 18:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAEE9F8054A
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 18:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAEE9F8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Tgd4//j0"
Received: by mail-wm1-x32e.google.com with SMTP id
 o16-20020a05600c379000b003a02eaea815so1141134wmr.0
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 09:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97AxfpAWfhGkMoo8Yg3C7zAZZuUe0uLsnJoPG2mxaas=;
 b=Tgd4//j03OaTHomdF+WtWzypzyJB/34J5Xsqnb96pe2bH2TdwiPfNqkWT/iFDIfca/
 fm58KtjobLqgUx0Xubk23MLW8iLqUNJ6tJiDfrQfCnWyC21nHX128F778sLkBThS9LtV
 8+JyGzdq69VkT74h7fEYbCP76au9u/at3iZ/3hA9KLO0vZsSYbPmP07jHZbs8XpPtUZd
 HRnmwDXA+MPtfliEtPiVjuPgxmqUL1w0ENFopP4LONj71l197cEf5LBgfsE/pixwe6hr
 eu/U5g/5cgXprBezuPXxLBg1Rh0y771j7wU5HfocR2XZLy4BOWXhl1XZD2aaLwwX9E29
 1ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97AxfpAWfhGkMoo8Yg3C7zAZZuUe0uLsnJoPG2mxaas=;
 b=h9StQA5dFv25FyBmj6FgwnjH1dsiZj4XPswqkA/ebLp0ahsnfGy65VC0EnGUNcys6h
 0kHIDLB24QnMHqo5gJPB2/F1VKi+ZDgOjkFPAMi4x1BIzVSwPfjfuwVVkjaOriO+zvn0
 VXvOK+Rpq5ADwZLkpzDzarY5wdUDRsIdLbShqAtIVbgqX8h/ymbib56Xz4693JSrOVkI
 FUMwen7aGt5i8fchHgMwh5/9Z7fi0sXb6CGVAH6SgLDqJWi+EqfZd6F13cJhpnbu1Z0p
 GwSur3Mq58Rtrgs+wHv/GlVMlNRm1H2T7DVHo6ZnFKV8HxNKv4LHPmBeXumxADqwoM13
 QXaw==
X-Gm-Message-State: AJIora9C9xzaAN70uMncC8BN1TXW808Z5o0FdADrk9yV4yyCUu3i8mdN
 EUWqmi2rrgd4YZf/1FiNBvY=
X-Google-Smtp-Source: AGRyM1vlzAQGxkZNFHZozdQtoXTKp82jiQsoc64vAtb+Xac9hNMj0jxwZUwAIuY2oCKLhuDJSpTvIQ==
X-Received: by 2002:a7b:c4d3:0:b0:3a1:8fbf:f03f with SMTP id
 g19-20020a7bc4d3000000b003a18fbff03fmr557728wmk.172.1657296136011; 
 Fri, 08 Jul 2022 09:02:16 -0700 (PDT)
Received: from localhost (92.40.203.144.threembb.co.uk. [92.40.203.144])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c339300b0039c4506bd25sm2898287wmp.14.2022.07.08.09.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 09:02:15 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v4 06/11] ASoC: jz4740-i2s: Align macro values and sort
 includes
Date: Fri,  8 Jul 2022 17:02:39 +0100
Message-Id: <20220708160244.21933-7-aidanmacdonald.0x0@gmail.com>
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

Some purely cosmetic changes: line up all the macro values to
make things easier to read and sort the includes alphabetically.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 72 +++++++++++++++++------------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index d0791dfa9c7b..0dcc658b3784 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -4,6 +4,9 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -13,11 +16,6 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
-#include <linux/clk.h>
-#include <linux/delay.h>
-
-#include <linux/dma-mapping.h>
-
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -35,39 +33,39 @@
 #define JZ_REG_AIC_CLK_DIV	0x30
 #define JZ_REG_AIC_FIFO		0x34
 
-#define JZ_AIC_CONF_OVERFLOW_PLAY_LAST BIT(6)
-#define JZ_AIC_CONF_INTERNAL_CODEC BIT(5)
-#define JZ_AIC_CONF_I2S BIT(4)
-#define JZ_AIC_CONF_RESET BIT(3)
-#define JZ_AIC_CONF_BIT_CLK_MASTER BIT(2)
-#define JZ_AIC_CONF_SYNC_CLK_MASTER BIT(1)
-#define JZ_AIC_CONF_ENABLE BIT(0)
-
-#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE GENMASK(21, 19)
-#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE GENMASK(18, 16)
-#define JZ_AIC_CTRL_ENABLE_RX_DMA BIT(15)
-#define JZ_AIC_CTRL_ENABLE_TX_DMA BIT(14)
-#define JZ_AIC_CTRL_MONO_TO_STEREO BIT(11)
-#define JZ_AIC_CTRL_SWITCH_ENDIANNESS BIT(10)
-#define JZ_AIC_CTRL_SIGNED_TO_UNSIGNED BIT(9)
+#define JZ_AIC_CONF_OVERFLOW_PLAY_LAST	BIT(6)
+#define JZ_AIC_CONF_INTERNAL_CODEC	BIT(5)
+#define JZ_AIC_CONF_I2S			BIT(4)
+#define JZ_AIC_CONF_RESET		BIT(3)
+#define JZ_AIC_CONF_BIT_CLK_MASTER	BIT(2)
+#define JZ_AIC_CONF_SYNC_CLK_MASTER	BIT(1)
+#define JZ_AIC_CONF_ENABLE		BIT(0)
+
+#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE	GENMASK(21, 19)
+#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE	GENMASK(18, 16)
+#define JZ_AIC_CTRL_ENABLE_RX_DMA	BIT(15)
+#define JZ_AIC_CTRL_ENABLE_TX_DMA	BIT(14)
+#define JZ_AIC_CTRL_MONO_TO_STEREO	BIT(11)
+#define JZ_AIC_CTRL_SWITCH_ENDIANNESS	BIT(10)
+#define JZ_AIC_CTRL_SIGNED_TO_UNSIGNED	BIT(9)
 #define JZ_AIC_CTRL_FLUSH		BIT(8)
-#define JZ_AIC_CTRL_ENABLE_ROR_INT BIT(6)
-#define JZ_AIC_CTRL_ENABLE_TUR_INT BIT(5)
-#define JZ_AIC_CTRL_ENABLE_RFS_INT BIT(4)
-#define JZ_AIC_CTRL_ENABLE_TFS_INT BIT(3)
-#define JZ_AIC_CTRL_ENABLE_LOOPBACK BIT(2)
-#define JZ_AIC_CTRL_ENABLE_PLAYBACK BIT(1)
-#define JZ_AIC_CTRL_ENABLE_CAPTURE BIT(0)
-
-#define JZ4760_AIC_CTRL_TFLUSH BIT(8)
-#define JZ4760_AIC_CTRL_RFLUSH BIT(7)
-
-#define JZ_AIC_I2S_FMT_DISABLE_BIT_CLK BIT(12)
-#define JZ_AIC_I2S_FMT_DISABLE_BIT_ICLK BIT(13)
-#define JZ_AIC_I2S_FMT_ENABLE_SYS_CLK BIT(4)
-#define JZ_AIC_I2S_FMT_MSB BIT(0)
-
-#define JZ_AIC_I2S_STATUS_BUSY BIT(2)
+#define JZ_AIC_CTRL_ENABLE_ROR_INT	BIT(6)
+#define JZ_AIC_CTRL_ENABLE_TUR_INT	BIT(5)
+#define JZ_AIC_CTRL_ENABLE_RFS_INT	BIT(4)
+#define JZ_AIC_CTRL_ENABLE_TFS_INT	BIT(3)
+#define JZ_AIC_CTRL_ENABLE_LOOPBACK	BIT(2)
+#define JZ_AIC_CTRL_ENABLE_PLAYBACK	BIT(1)
+#define JZ_AIC_CTRL_ENABLE_CAPTURE	BIT(0)
+
+#define JZ4760_AIC_CTRL_TFLUSH		BIT(8)
+#define JZ4760_AIC_CTRL_RFLUSH		BIT(7)
+
+#define JZ_AIC_I2S_FMT_DISABLE_BIT_CLK	BIT(12)
+#define JZ_AIC_I2S_FMT_DISABLE_BIT_ICLK	BIT(13)
+#define JZ_AIC_I2S_FMT_ENABLE_SYS_CLK	BIT(4)
+#define JZ_AIC_I2S_FMT_MSB		BIT(0)
+
+#define JZ_AIC_I2S_STATUS_BUSY		BIT(2)
 
 struct i2s_soc_info {
 	struct snd_soc_dai_driver *dai;
-- 
2.35.1

