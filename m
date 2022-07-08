Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF4356B770
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 12:45:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 913CF1663;
	Fri,  8 Jul 2022 12:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 913CF1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657277159;
	bh=dIt5wKB80gwhyD3+9m8BE9Gh9K91y3ygzk5kL3tzuX4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RY8HGVBcJw0LPgfWqobcyirLdOXupM9fxJHn8oeMO4To+0PtbNQ4mrDoHZfLehX1v
	 B0xeVmmrV99hTM0PDbG45BQK9rcanltKi+9SnalLtHakhnooPYIEvAcGN8Glrt0Zpg
	 B0mAYEKbYdpHLgFvG3sPeg8aJIqq4yWhok8DECXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66ACEF805A0;
	Fri,  8 Jul 2022 12:42:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6AB8F80551; Fri,  8 Jul 2022 12:42:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F72EF80551
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 12:42:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F72EF80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="D3ZqkSti"
Received: by mail-wr1-x42a.google.com with SMTP id v16so18528081wrd.13
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 03:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97AxfpAWfhGkMoo8Yg3C7zAZZuUe0uLsnJoPG2mxaas=;
 b=D3ZqkStiVqS1hpFUXN+Wn7xde+SrRbgMqFYHp9m84rBcCoFpVRErZ7FTSWo6QmhEfs
 iUIw4mNtWhbZq3oR6B7DLLtoV4dE8C9OY7loi4b6l0v7DS0ADogsaiDw5e8U65uyohuX
 GuS722qAgbrLriIsfBFN9zY1IRv3x4TyJd2e0BfjfANuGLEmBc2rgBmH3qhmdq6jZczF
 roKN/fWIhQChEH9F+em6ntDLh3sDBrD1mTEliIPUFVX5uiLK8DF2Cg8GwFEqw0+n5GIr
 PrDCyPhdohe+kWU7JrTLRm/p8boM6a3Yxzg9XAiZnhDZvz23vK8P5XAQDkgBnKoa/3pw
 nsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97AxfpAWfhGkMoo8Yg3C7zAZZuUe0uLsnJoPG2mxaas=;
 b=mtnm856qUdJkKyplKhEmsg+RgiRLknc97Va2tG4wsf2wu/eO+6kwvIJ/FdTv0mw+Ht
 nj9zcFTm1zNjp1ZX5QBelx7WE8VFuWMXt5cH1I1k0x2qDpWKGtzjPUvG4UjHhzDGDtfy
 V/JBmpdJZXfppjqCKAbXmWvmd1mGZCK/RELDxCrN3FvwRG027EjUvo6ZQOPVONkb869S
 rdVG7WPym1hTf7b3sS6WQes8lhB/MjURoOTTli2GpUoSlqtmszDVyhEzSsih27thMz1u
 zZthcTmnQUTOPUj23f2HjL0wccy78pkXAzfpOTQ59tYeeqaS9e6tU44A9k1XZfiq4qh2
 womg==
X-Gm-Message-State: AJIora9zF6Z2qDOWFHbdaj5pcKfQgTcFZUnnkjhVwFU63OTih/CzazMh
 krEEMx/cC8QTh0EFP0wBO08=
X-Google-Smtp-Source: AGRyM1sfrmeT0XJgKKmzik5j2KlsclcdcdrBzjOdT40yzmtjkPg1p4xMWlPQjqIPDk7NPHDPfgS5eQ==
X-Received: by 2002:adf:fe81:0:b0:21a:3574:ec8e with SMTP id
 l1-20020adffe81000000b0021a3574ec8emr2659325wrr.410.1657276949273; 
 Fri, 08 Jul 2022 03:42:29 -0700 (PDT)
Received: from localhost (92.40.203.220.threembb.co.uk. [92.40.203.220])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a056000010500b00210352bf36fsm39253005wrx.33.2022.07.08.03.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 03:42:28 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 06/11] ASoC: jz4740-i2s: Align macro values and sort
 includes
Date: Fri,  8 Jul 2022 11:42:59 +0100
Message-Id: <20220708104304.51415-7-aidanmacdonald.0x0@gmail.com>
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

