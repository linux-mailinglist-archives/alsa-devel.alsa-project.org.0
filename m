Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D69C356AC2A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 21:49:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E98C166A;
	Thu,  7 Jul 2022 21:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E98C166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657223348;
	bh=dzCxSrv8ljaSGGZ6QMINaHagXiEqZqRIMpm6c/3kxqY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nvClowUWujH7gOFxUUSEPQSNELkDT37Yi5rSxLex910t/msoL4TAF6hLufpyNaA2f
	 Bmnkj7Vqj5dnRiZvhbwjngSpg1NDn934Wg7zQpapRz5p8fIi154TQcydpThXYmCSoD
	 RBCb9dxkR9UiDLfnkjK0aVWbhzfVolE2Pcpwy4fI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08B49F8055A;
	Thu,  7 Jul 2022 21:46:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D2CDF80557; Thu,  7 Jul 2022 21:46:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ED74F800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 21:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ED74F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eHPt7vqw"
Received: by mail-ej1-x635.google.com with SMTP id n4so14930312ejz.10
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 12:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=15R8fRtnipOyDZjBwDRNBD+rUnFt8ovWDJg/qvPn+8w=;
 b=eHPt7vqwXh1wCGADEJNAowKT4uYpPhdJCl2JI/BVjbITn1J6xk0YTHFOLRz2bBVMf6
 iHLttoama6OrqnbmwCIZLUndzjK9dqq9pS6rjXFfThBI4IDN38Zzqonh/DySOh5BZCp8
 oGDRgN8dVSes1DfDPXQc+0d0grg5TqfRpl1oplyx7ju1QJgxJ9QOZM9uqk9w6jnaUZ4X
 bgjrMsOeUrZ2d6W1cBJUaX6gsi69h9iTFQ6IE8Xw0TUOwi5ldLPGnwBXbdWCQ/vXCBm2
 ZSEKnl6wTO2Q5GbdnYMRpmjssovgDxmyVnfpgOqCTrg1NM4FdVhcA+6rqDXYzrAwwhDq
 jRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=15R8fRtnipOyDZjBwDRNBD+rUnFt8ovWDJg/qvPn+8w=;
 b=22qHTK+/Hc5A1W3Ax4wpf7ZvIzlBUGA3vX9La4zOo8Gc0lwC95+bo53R4pG9wd07S+
 42lcsUDJr8AwA7ouDv3JQVuqhOeYlHCPWCDWOFHu7eRZJ2tcmSKKIoNnUQuR0VXiA1ZH
 s3Riq+UzWvjAx7vINh+2n20FZ/Ufy24TZGnIpVjWSGNOdZixEJLWFpil052PjG2bU/kV
 Ue8dE5QPtfDE9kgelKlEe8rM/qs/Gw1e/Rj6jqVy7DQB6EAIrBvoGTc8Wh3vB9X0V1JR
 /RgHt2xR3NV7AQ4nAHKe9S/3cpZf6Vyu7v9Lo1FcUEe5OMWsbpp5p3t6uoDc6tb3pLU5
 /juA==
X-Gm-Message-State: AJIora/chFDvbavIIjWqRnjj0VW7yXlnuLo2jWkXdlbTREts8OagSRoo
 i4YBHGe37gMF8RGPRYe6JBc=
X-Google-Smtp-Source: AGRyM1vVBv4eichqt1pd+vj1n08RTifhwRB37lBYx7JArzeALYd899GQ5F2fkeIxJc0Jrz/wJBHNRg==
X-Received: by 2002:a17:907:1dc6:b0:72a:5e9a:91be with SMTP id
 og6-20020a1709071dc600b0072a5e9a91bemr41769203ejc.730.1657223207214; 
 Thu, 07 Jul 2022 12:46:47 -0700 (PDT)
Received: from localhost (92.40.202.166.threembb.co.uk. [92.40.202.166])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a056402000800b0043a71c376a2sm8283494edu.33.2022.07.07.12.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:46:46 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 05/11] ASoC: jz4740-i2s: Use FIELD_PREP() macros in
 hw_params callback
Date: Thu,  7 Jul 2022 20:46:49 +0100
Message-Id: <20220707194655.312892-6-aidanmacdonald.0x0@gmail.com>
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

Get rid of a couple of macros and improve readability by using
FIELD_PREP() and GENMASK() for the sample size setting.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 043f100a9cfa..d0791dfa9c7b 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -3,6 +3,7 @@
  *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
  */
 
+#include <linux/bitfield.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -42,8 +43,8 @@
 #define JZ_AIC_CONF_SYNC_CLK_MASTER BIT(1)
 #define JZ_AIC_CONF_ENABLE BIT(0)
 
-#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_MASK (0x7 << 19)
-#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK (0x7 << 16)
+#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE GENMASK(21, 19)
+#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE GENMASK(18, 16)
 #define JZ_AIC_CTRL_ENABLE_RX_DMA BIT(15)
 #define JZ_AIC_CTRL_ENABLE_TX_DMA BIT(14)
 #define JZ_AIC_CTRL_MONO_TO_STEREO BIT(11)
@@ -61,9 +62,6 @@
 #define JZ4760_AIC_CTRL_TFLUSH BIT(8)
 #define JZ4760_AIC_CTRL_RFLUSH BIT(7)
 
-#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET 19
-#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET  16
-
 #define JZ_AIC_I2S_FMT_DISABLE_BIT_CLK BIT(12)
 #define JZ_AIC_I2S_FMT_DISABLE_BIT_ICLK BIT(13)
 #define JZ_AIC_I2S_FMT_ENABLE_SYS_CLK BIT(4)
@@ -248,8 +246,9 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		ctrl &= ~JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_MASK;
-		ctrl |= sample_size << JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET;
+		ctrl &= ~JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE;
+		ctrl |= FIELD_PREP(JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE, sample_size);
+
 		if (params_channels(params) == 1)
 			ctrl |= JZ_AIC_CTRL_MONO_TO_STEREO;
 		else
@@ -257,8 +256,8 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 
 		div_field = i2s->field_i2sdiv_playback;
 	} else {
-		ctrl &= ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK;
-		ctrl |= sample_size << JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET;
+		ctrl &= ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE;
+		ctrl |= FIELD_PREP(JZ_AIC_CTRL_INPUT_SAMPLE_SIZE, sample_size);
 
 		div_field = i2s->field_i2sdiv_capture;
 	}
-- 
2.35.1

