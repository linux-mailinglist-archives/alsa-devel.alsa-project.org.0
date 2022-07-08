Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A58F56BD23
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 18:03:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD326850;
	Fri,  8 Jul 2022 18:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD326850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657296225;
	bh=LYIab9mj8whj30bXw74HuFvTfiSaYe2F74hMoYOskFU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XI8geSkcOgJiIoGkKBNnSLcR9KMy3t9BM9FLPyZzV7agQJd/xxma1uqFlszCGJBAu
	 ZFhQM+80hbpP3w2HYxDwtcR4VdQCMs6M1KEiuW8TPwrby0bP0VZMtoLGOdaP6iy9ws
	 NQqb7r21p9njm6wy2j5J7igHq7jm0RyzZsoUvQ3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61599F80539;
	Fri,  8 Jul 2022 18:02:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63C22F80166; Fri,  8 Jul 2022 18:02:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86619F80166
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 18:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86619F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pQFUEDbM"
Received: by mail-wr1-x42e.google.com with SMTP id f2so25766106wrr.6
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 09:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7O7dcwFHYK3zVnrgMRZvSesH1TPKQsF0Od7N+Uo6U2s=;
 b=pQFUEDbMcj/8a5jdZTvaeOgwRdD2gs9EObkREWqU4LBKpbj7QEhGaE9dGdlWzihi6r
 Z/gTwtMgDP8kTv4OF0IaEgSDrDjPyXWW9YKUjAWOF7f3tg5s3+XK+FwlLQV4xHYhT2Ii
 LtVaKzX4qV09kfLIXaHRFtqR9YYNDdUKQsMUAN1AawjOD5WBSi7D67q23DmrGr/yxnkW
 qEpD1xEjsLNysDNGdWR5qELGIf8oAV4lYOBIk/6cHz5RgNdPi1HdOP1W8CQJT5tRnqTb
 7+I5vMYCnmN7UXcvzrVASXPlxnAYgDBJzJ2kbg+I7E+aF4N4cLcawdY7AyUoMCSq7c9o
 s5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7O7dcwFHYK3zVnrgMRZvSesH1TPKQsF0Od7N+Uo6U2s=;
 b=Jwjuy8T5QL9/ubokW5OzBOycintQIetH/ofZn9WwnD6p4E0MSxbwGkpxj9VpLK/BEI
 hyEQk05MD6B38CznDMniUHFnts/WyKUnWMBWI/E4iBgQwM37dMqAKIoOqs4DbN01/U3g
 wp282Rkwnzw2xydToQhtSupoLl61PWZk9Mb0T951sD0PLAL+tCep8Z2G7uylYS0BCpOy
 STS02lXEflSdM6G7tGHcOamB9fqEckLZ9sjZ9noWcH03iDHAt/+5iHNzbWHiZRLJreDX
 wzCUMZvWoEfueUtOIzN/OoFhIPhdOGcDNslOjvdLgOnQaTs1TTDpJyfD9ENHCGMYTnpD
 HrKA==
X-Gm-Message-State: AJIora97eoPirwdWZNsa2o6Kj79QRHsmt+puOB7LLfrLBcT1ZQGJEFBm
 zRBmrqLD8K8Jcxk63gu2MnU=
X-Google-Smtp-Source: AGRyM1vX22rHAyjzjPUccF592wy9Ee0LYlejzqTSRp9IzSAnTDc5sDSxM8Xfpn0AZOYHP+YmHLAICQ==
X-Received: by 2002:adf:fd02:0:b0:21d:6f22:7857 with SMTP id
 e2-20020adffd02000000b0021d6f227857mr4110818wrr.633.1657296127225; 
 Fri, 08 Jul 2022 09:02:07 -0700 (PDT)
Received: from localhost (92.40.203.144.threembb.co.uk. [92.40.203.144])
 by smtp.gmail.com with ESMTPSA id
 c189-20020a1c35c6000000b003a046549a85sm2532546wma.37.2022.07.08.09.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 09:02:06 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v4 01/11] ASoC: jz4740-i2s: Handle independent FIFO flush bits
Date: Fri,  8 Jul 2022 17:02:34 +0100
Message-Id: <20220708160244.21933-2-aidanmacdonald.0x0@gmail.com>
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
 sound/soc/jz4740/jz4740-i2s.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index ecd8df70d39c..576f31f9d734 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -64,6 +64,9 @@
 #define JZ_AIC_CTRL_ENABLE_PLAYBACK BIT(1)
 #define JZ_AIC_CTRL_ENABLE_CAPTURE BIT(0)
 
+#define JZ4760_AIC_CTRL_TFLUSH BIT(8)
+#define JZ4760_AIC_CTRL_RFLUSH BIT(7)
+
 #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET 19
 #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET  16
 
@@ -90,6 +93,8 @@ enum jz47xx_i2s_version {
 struct i2s_soc_info {
 	enum jz47xx_i2s_version version;
 	struct snd_soc_dai_driver *dai;
+
+	bool shared_fifo_flush;
 };
 
 struct jz4740_i2s {
@@ -124,12 +129,33 @@ static int jz4740_i2s_startup(struct snd_pcm_substream *substream,
 	uint32_t conf, ctrl;
 	int ret;
 
+	/*
+	 * When we can flush FIFOs independently, only flush the
+	 * FIFO that is starting up.
+	 */
+	if (!i2s->soc_info->shared_fifo_flush) {
+		ctrl = jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
+
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			ctrl |= JZ4760_AIC_CTRL_TFLUSH;
+		else
+			ctrl |= JZ4760_AIC_CTRL_RFLUSH;
+
+		jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
+	}
+
 	if (snd_soc_dai_active(dai))
 		return 0;
 
-	ctrl = jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
-	ctrl |= JZ_AIC_CTRL_FLUSH;
-	jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
+	/*
+	 * When there is a shared flush bit for both FIFOs we can
+	 * only flush the FIFOs if no other stream has started.
+	 */
+	if (i2s->soc_info->shared_fifo_flush) {
+		ctrl = jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
+		ctrl |= JZ_AIC_CTRL_FLUSH;
+		jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
+	}
 
 	ret = clk_prepare_enable(i2s->clk_i2s);
 	if (ret)
@@ -444,6 +470,7 @@ static struct snd_soc_dai_driver jz4740_i2s_dai = {
 static const struct i2s_soc_info jz4740_i2s_soc_info = {
 	.version = JZ_I2S_JZ4740,
 	.dai = &jz4740_i2s_dai,
+	.shared_fifo_flush = true,
 };
 
 static const struct i2s_soc_info jz4760_i2s_soc_info = {
-- 
2.35.1

