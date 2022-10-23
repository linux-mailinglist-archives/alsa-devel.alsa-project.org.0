Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C356093F8
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Oct 2022 16:34:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D80DD8DDF;
	Sun, 23 Oct 2022 16:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D80DD8DDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666535697;
	bh=TW9orPK0tganjHhjW2iPHSFSw7/H4dtvPiOlkAQ+J9o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AyVVL5r35AtXtMvUZE/H+EWKYbFUcvhSo/HieadQOp6dbyyQBbsohvygcAGfwpFsO
	 c0XNxB+T1uZUJ71fd9Xj6oqzJnXqv1XzFUkRx9G9B6A2jgTLXPUApV68l90DBbvGiJ
	 rrbxecbrXfMM60oyIy1oHbWy6LqFTYtg+tkpPYDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2394CF8053D;
	Sun, 23 Oct 2022 16:33:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C67AF801D5; Sun, 23 Oct 2022 16:33:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF5E2F801D5
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 16:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF5E2F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a4R41X2e"
Received: by mail-wr1-x433.google.com with SMTP id n12so11805604wrp.10
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UT0ZSJttMO+IN7qAwXeIN59Jy0agrsi51doQcQVju30=;
 b=a4R41X2eIL3ukRmoZio82gBdHf1RipQIToHH1XoKU3wVW61b9R8bZ2B9FnJPaaMC+N
 EYBvlP5agU5pbx5jgmaT3golS5rSSFTKyRns8NvC5zP2DonVnHtoGe6eTgKPlW+ZnaJr
 tCBTXCM2niXy3frrsfQ9vUIvFUR/oe3QWesIB5EyJc1QvACAyzfz1j9LHiHeiiessVZm
 Uxr1n1nd+3eKlDfP7YvuOq6gEG+FkWXoaxdp7Azn6v9v32FT33VCFdJ8auptHYDlHHWT
 DfdY0z4B9rMKPX39CPMoj0vv4wQKNISpojmcLGTyhgTYu6NS8T828O1hptghMVlieq8u
 OjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UT0ZSJttMO+IN7qAwXeIN59Jy0agrsi51doQcQVju30=;
 b=OaxbI+UsDgb1bM6r3dqponGn9bvKdMHSgZRnL4QETNVdpnMXBwV0Ud55+Jv44p5P4b
 XtePqegDNxnT/NyH9dRG5EcacRs1KUo2pUHxBeNFyBCtR7J0cdSdZIW5TOWWxhCOwKJO
 cHX1kqYkMHTfUAAOAD3PVZJ/c/vyIbyyi5c2L8OljoOhldYt6zMsRc7IG6icmXBwnHx/
 N71Kh4U+NEMCOEbK3hsdThGh15nS9ZhByZWYPvQX63kJIdODckjNyloAzHmtME0sfM1I
 qkGbcLOWnerHExfc1IshxpSYA6Xgb8jrkp+GCcSquq0GPUfVSxqR0l/HPoqs8MR6iaYA
 2XJQ==
X-Gm-Message-State: ACrzQf3OfOiKobbZeq+koQkfFY7/b5ct09sqy2ObfsVMC5t1GCpxRUT3
 N+c+9ZE0tIgNZtX18AIZ2ss=
X-Google-Smtp-Source: AMsMyM4b1TfpWpauU5EEm47KOxNOzxuoX31aAUHykGuhBW0PTbFZhN5faExd22+r1cuOe4l2UjJkVg==
X-Received: by 2002:a05:6000:4084:b0:22e:5b99:4c4a with SMTP id
 da4-20020a056000408400b0022e5b994c4amr19057178wrb.538.1666535612756; 
 Sun, 23 Oct 2022 07:33:32 -0700 (PDT)
Received: from localhost (94.197.10.75.threembb.co.uk. [94.197.10.75])
 by smtp.gmail.com with ESMTPSA id
 c1-20020adfed81000000b00226dba960b4sm24235577wro.3.2022.10.23.07.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 07:33:32 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v6 1/9] ASoC: jz4740-i2s: Handle independent FIFO flush bits
Date: Sun, 23 Oct 2022 15:33:20 +0100
Message-Id: <20221023143328.160866-2-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221023143328.160866-1-aidanmacdonald.0x0@gmail.com>
References: <20221023143328.160866-1-aidanmacdonald.0x0@gmail.com>
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

On the JZ4740, there is a single bit that flushes (empties) both
the transmit and receive FIFO. Later SoCs have independent flush
bits for each FIFO.

Independent FIFOs can be flushed before the snd_soc_dai_active()
check because it won't disturb other active streams. This ensures
that the FIFO we're about to use is always flushed before starting
up. With shared FIFOs we can't do that because if another substream
is active, flushing its FIFO would cause underrun errors.

This also fixes a bug: since we were only setting the JZ4740's
flush bit, which corresponds to the TX FIFO flush bit on other
SoCs, other SoCs were not having their RX FIFO flushed at all.

Fixes: 967beb2e8777 ("ASoC: jz4740: Add jz4780 support")
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Cc: stable@vger.kernel.org
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
v5 -> v6: Cc'd stable.

 sound/soc/jz4740/jz4740-i2s.c | 39 ++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index c4c1e89b47c1..83cb81999c6f 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -55,7 +55,8 @@
 #define JZ_AIC_CTRL_MONO_TO_STEREO BIT(11)
 #define JZ_AIC_CTRL_SWITCH_ENDIANNESS BIT(10)
 #define JZ_AIC_CTRL_SIGNED_TO_UNSIGNED BIT(9)
-#define JZ_AIC_CTRL_FLUSH		BIT(8)
+#define JZ_AIC_CTRL_TFLUSH		BIT(8)
+#define JZ_AIC_CTRL_RFLUSH		BIT(7)
 #define JZ_AIC_CTRL_ENABLE_ROR_INT BIT(6)
 #define JZ_AIC_CTRL_ENABLE_TUR_INT BIT(5)
 #define JZ_AIC_CTRL_ENABLE_RFS_INT BIT(4)
@@ -90,6 +91,8 @@ enum jz47xx_i2s_version {
 struct i2s_soc_info {
 	enum jz47xx_i2s_version version;
 	struct snd_soc_dai_driver *dai;
+
+	bool shared_fifo_flush;
 };
 
 struct jz4740_i2s {
@@ -116,19 +119,44 @@ static inline void jz4740_i2s_write(const struct jz4740_i2s *i2s,
 	writel(value, i2s->base + reg);
 }
 
+static inline void jz4740_i2s_set_bits(const struct jz4740_i2s *i2s,
+	unsigned int reg, uint32_t bits)
+{
+	uint32_t value = jz4740_i2s_read(i2s, reg);
+	value |= bits;
+	jz4740_i2s_write(i2s, reg, value);
+}
+
 static int jz4740_i2s_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *dai)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	uint32_t conf, ctrl;
+	uint32_t conf;
 	int ret;
 
+	/*
+	 * When we can flush FIFOs independently, only flush the FIFO
+	 * that is starting up. We can do this when the DAI is active
+	 * because it does not disturb other active substreams.
+	 */
+	if (!i2s->soc_info->shared_fifo_flush) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			jz4740_i2s_set_bits(i2s, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_TFLUSH);
+		else
+			jz4740_i2s_set_bits(i2s, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_RFLUSH);
+	}
+
 	if (snd_soc_dai_active(dai))
 		return 0;
 
-	ctrl = jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
-	ctrl |= JZ_AIC_CTRL_FLUSH;
-	jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
+	/*
+	 * When there is a shared flush bit for both FIFOs, the TFLUSH
+	 * bit flushes both FIFOs. Flushing while the DAI is active would
+	 * cause FIFO underruns in other active substreams so we have to
+	 * guard this behind the snd_soc_dai_active() check.
+	 */
+	if (i2s->soc_info->shared_fifo_flush)
+		jz4740_i2s_set_bits(i2s, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_TFLUSH);
 
 	ret = clk_prepare_enable(i2s->clk_i2s);
 	if (ret)
@@ -443,6 +471,7 @@ static struct snd_soc_dai_driver jz4740_i2s_dai = {
 static const struct i2s_soc_info jz4740_i2s_soc_info = {
 	.version = JZ_I2S_JZ4740,
 	.dai = &jz4740_i2s_dai,
+	.shared_fifo_flush = true,
 };
 
 static const struct i2s_soc_info jz4760_i2s_soc_info = {
-- 
2.38.1

