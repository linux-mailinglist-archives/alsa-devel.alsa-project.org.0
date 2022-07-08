Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE57256B769
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 12:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B7791661;
	Fri,  8 Jul 2022 12:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B7791661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657277082;
	bh=CPeGqfIO9VeV6nr8ZtCs5eDlJI7htp0uQrtF3hJDK/A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YwmuYYHMswJ9a9JP7qJ0TQV234y7It7/1k7buB+AGkVnBSkqpD2BNVSD6DAY78E0F
	 oGi9q/35BBj/ChjFDTjsfHtIcohtmJytqORf2tJMBs3v/JjkJjBUfOr5MSECvLeVjB
	 y67fQE54doMgZk3dbRxVeX7fJ2OJnNAAQ3eH6C+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB60EF80539;
	Fri,  8 Jul 2022 12:42:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACF78F80548; Fri,  8 Jul 2022 12:42:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C63D5F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 12:42:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C63D5F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d0CT5v9G"
Received: by mail-wr1-x435.google.com with SMTP id b26so30001155wrc.2
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VXKGG9javDrFOkKmb7ryKLnUNvKA3TX1Nnby1SaWrZk=;
 b=d0CT5v9GVPujeVt5PUq/xQYx3qqrk6D4bEfkOEXl2+Md06XbgbpnHLHzgDgk3nZdff
 NjsGXkOwHaWyd7ZJxFyHfFOFWFZ66BYElyTMtqQga4SLFOddCLfWYgJWt/MhvqdPXDbD
 x6eXNkhYuYsUqLYKdSfxQuFynDTEGz/8PGEhl95SEHGCjBywRGZGgCIAc6aHPS+8zFIr
 VuGT6Fc67O8HV9zj8ZL+PW4yP5ofn6rqa3NtyajnPpcQmj3tgVmpZLHsbqSFi32l26lQ
 H0VClyAO8kWFPiGYn+GS4xgKM9lWMiEx9TrMMIFDAesw7qnOKPLHgWxtAZMRXlud8VTs
 S7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VXKGG9javDrFOkKmb7ryKLnUNvKA3TX1Nnby1SaWrZk=;
 b=yYe5l+Q522/BqnzDirXs+Vu+texsxPkGe5WP2P+CX6CsR0ZOUqkC4Wxj860pgp7c45
 87XcVukMhDFDSevHz/7lLGYC66jRJ0zwqJn9EAil7teIDS0an2u40QPBIR3MrC9dpNIc
 1bDgYXaUO1rNGGzi2FUB/wplzgKMgbXajJhxfoikuxjO1AiGcx1sB6G7eKRLk4fu1pdN
 eAWPfXbv256gOq4rcJGxvAR+VXW2hZhbRk0O3QwxCzUOfOv7vBa0IEFrj/YfbPmXDPL3
 6SjvoHjp9ev3qgCpAN7LaV8S/vDdJu+nQIXz4LLNwAPBoWYRx2yuqD1tMqoJLc50Ac5y
 QYiQ==
X-Gm-Message-State: AJIora9y9Xh8Zk7S3RS5ZWry6iTNyAkB6Sa3wuqswN090T19dYDv6jrE
 hpNa9ReKMDT228OyZJV1V/8=
X-Google-Smtp-Source: AGRyM1uExfuSG9lo/9syog0G3veln7Cn5ZFTwN/VpalC5tcDH0uvjAQ4vKGMG/n9g9TnbnUhWjFKuA==
X-Received: by 2002:a05:6000:1f02:b0:21d:7760:d0ca with SMTP id
 bv2-20020a0560001f0200b0021d7760d0camr2647096wrb.694.1657276946002; 
 Fri, 08 Jul 2022 03:42:26 -0700 (PDT)
Received: from localhost (92.40.203.220.threembb.co.uk. [92.40.203.220])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056000108500b002167efdd549sm12806848wrw.38.2022.07.08.03.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 03:42:25 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 04/11] ASoC: jz4740-i2s: Handle independent FIFO flush bits
Date: Fri,  8 Jul 2022 11:42:57 +0100
Message-Id: <20220708104304.51415-5-aidanmacdonald.0x0@gmail.com>
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

On the JZ4740, there is a single bit that flushes (empties) both
the transmit and receive FIFO. Later SoCs have independent flush
bits for each FIFO, which allows us to flush the right FIFO when
starting up a stream.

This also fixes a bug: since we were only setting the JZ4740's
flush bit, which corresponds to the TX FIFO flush bit on other
SoCs, other SoCs were not having their RX FIFO flushed at all.

Fixes: 967beb2e8777 ("ASoC: jz4740: Add jz4780 support")
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index bd73427b837e..043f100a9cfa 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -58,6 +58,9 @@
 #define JZ_AIC_CTRL_ENABLE_PLAYBACK BIT(1)
 #define JZ_AIC_CTRL_ENABLE_CAPTURE BIT(0)
 
+#define JZ4760_AIC_CTRL_TFLUSH BIT(8)
+#define JZ4760_AIC_CTRL_RFLUSH BIT(7)
+
 #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET 19
 #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET  16
 
@@ -75,6 +78,8 @@ struct i2s_soc_info {
 	struct reg_field field_tx_fifo_thresh;
 	struct reg_field field_i2sdiv_capture;
 	struct reg_field field_i2sdiv_playback;
+
+	bool shared_fifo_flush;
 };
 
 struct jz4740_i2s {
@@ -100,10 +105,26 @@ static int jz4740_i2s_startup(struct snd_pcm_substream *substream,
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	int ret;
 
+	/*
+	 * When we can flush FIFOs independently, only flush the
+	 * FIFO that is starting up.
+	 */
+	if (!i2s->soc_info->shared_fifo_flush) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, JZ4760_AIC_CTRL_TFLUSH);
+		else
+			regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, JZ4760_AIC_CTRL_RFLUSH);
+	}
+
 	if (snd_soc_dai_active(dai))
 		return 0;
 
-	regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_FLUSH);
+	/*
+	 * When there is a shared flush bit for both FIFOs we can
+	 * only flush the FIFOs if no other stream has started.
+	 */
+	if (i2s->soc_info->shared_fifo_flush)
+		regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_FLUSH);
 
 	ret = clk_prepare_enable(i2s->clk_i2s);
 	if (ret)
@@ -382,6 +403,7 @@ static const struct i2s_soc_info jz4740_i2s_soc_info = {
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
 	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
+	.shared_fifo_flush	= true,
 };
 
 static const struct i2s_soc_info jz4760_i2s_soc_info = {
-- 
2.35.1

