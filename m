Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26449608F2F
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 21:15:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF83A842;
	Sat, 22 Oct 2022 21:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF83A842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666466136;
	bh=l/3r9HJMe9DPrdwSqBbpNLyN/ynG2+Dc9Hr6n4e5I98=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PwhkkowXhUvNX4LtcF4cxXcB+8uOiMy4v7ayViYAk5Nygke+dPfokAKhMzgT6oedM
	 jZZOWNbpYf4m8klyfcEoyCPp0qArqki68ZDYbJXJ3UpGKo/735oiPeuZTG+bGFS5Li
	 FGi212/LdTtzd9/a8cp96JsUhqvvxIu/CiuDucrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D098AF8055A;
	Sat, 22 Oct 2022 21:13:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07096F8054A; Sat, 22 Oct 2022 21:13:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3C8AF80542
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 21:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C8AF80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="igPE6EXX"
Received: by mail-wr1-x42c.google.com with SMTP id n12so9632662wrp.10
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 12:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yagE6PfAWV1c7o+BEcxE7EzZidDlQUomGLf1in/WfkM=;
 b=igPE6EXXqC7kFlmkXEmC/XA3D6fjwNngG/sJy9Ww2Pw5nOMZBTEUerkWl6cSse8UFr
 jpZJVxD4WNjPBfvwtJzGgbVEbOj0/a4CJ+vP7vJvzCPRdvXxWxLvBnilZYa+fTg2/fwx
 5MZUASlmGyWW3/FUX+gl+TsIapnG7Bg7xg0MGWjCxjzbOhP249izykhf7BQO59HzyJ02
 admKo1QbvThGk6DGFALBiTuHfmBojt1pT2nmafscQ69D6dvHUWX5Vw60Kb1moBUs9kjP
 RvDcAa8g5IyyEpHmAD1pNOo3wG93xdF8Kq6VdYQGSDzdexQP/FCxwWqWR9zfymybQr/+
 qEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yagE6PfAWV1c7o+BEcxE7EzZidDlQUomGLf1in/WfkM=;
 b=x0t4HOEW+uxNrlSSB8OawzS/XI71JJkDpfvv4sJ/9PNtu/WVZkR7W3iSq7ueciIWsG
 glVSfR8YBcn6F6qgZt8gTzmt5/o7nGE7lt9IIkqzW5Tc+AejbWrPPMIby5LQcCBLb3zM
 cCp3+Yxdqn6bPwgyFHmKyHCK8ID9AKwuZXNjCE+ChfUtF6C50spUtlrRcpu9Ehkr1Y37
 3AIqEOQtFUSWlX+wdVYItzTqp3d29W/3OtjA28jeKcWbAvkt5O5zPi4WGw2Aj6DNeRlw
 NZSfwbdafssGJOAw9aDyPbXs9mPBRWSnzKA1m/gzkMTKo8ycjQaLfSIZQvV+HapB1WQB
 koNA==
X-Gm-Message-State: ACrzQf3Lzjmez5zIjBFjoN0wsOm4pVmicHoObX6iqXwwgTe9e51YJfdn
 8bM4CcWrNMWhumz7JdcRaHM=
X-Google-Smtp-Source: AMsMyM7S/Yab6rkdTXlQtmV3AMKRUInnlygeH8fTYhv1/JEeIam1Os4D5l76uQtzpq8qkakhbMq+pA==
X-Received: by 2002:a05:6000:1f9e:b0:22e:61fa:3f1c with SMTP id
 bw30-20020a0560001f9e00b0022e61fa3f1cmr15908220wrb.546.1666466006048; 
 Sat, 22 Oct 2022 12:13:26 -0700 (PDT)
Received: from localhost (94.197.1.68.threembb.co.uk. [94.197.1.68])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a5d6acc000000b0022ae0965a8asm21417358wrw.24.2022.10.22.12.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 12:13:25 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v5 4/9] ASoC: jz4740-i2s: Use FIELD_PREP() macros in hw_params
 callback
Date: Sat, 22 Oct 2022 20:13:03 +0100
Message-Id: <20221022191308.82348-5-aidanmacdonald.0x0@gmail.com>
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

Get rid of a couple of macros and improve readability by using
FIELD_PREP() and GENMASK() for the sample size setting.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index b0bbcd025241..4767abea425f 100644
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
@@ -59,9 +60,6 @@
 #define JZ_AIC_CTRL_ENABLE_PLAYBACK BIT(1)
 #define JZ_AIC_CTRL_ENABLE_CAPTURE BIT(0)
 
-#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET 19
-#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET  16
-
 #define JZ_AIC_I2S_FMT_DISABLE_BIT_CLK BIT(12)
 #define JZ_AIC_I2S_FMT_DISABLE_BIT_ICLK BIT(13)
 #define JZ_AIC_I2S_FMT_ENABLE_SYS_CLK BIT(4)
@@ -249,8 +247,9 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
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
@@ -258,8 +257,8 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 
 		div_field = i2s->field_i2sdiv_playback;
 	} else {
-		ctrl &= ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK;
-		ctrl |= sample_size << JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET;
+		ctrl &= ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE;
+		ctrl |= FIELD_PREP(JZ_AIC_CTRL_INPUT_SAMPLE_SIZE, sample_size);
 
 		div_field = i2s->field_i2sdiv_capture;
 	}
-- 
2.38.1

