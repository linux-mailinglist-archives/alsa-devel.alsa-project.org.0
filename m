Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 439AA56AC2F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 21:49:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDC2E1683;
	Thu,  7 Jul 2022 21:48:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDC2E1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657223375;
	bh=CPeGqfIO9VeV6nr8ZtCs5eDlJI7htp0uQrtF3hJDK/A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UlsiWCgUNNhD0m7Y7HTk9CI6alZNAXs0JcUUCeq0Jkj64quFW6+zcQHXbxHYNrFRl
	 0eRL5uuShyuRx+bjyt5JCOOQFGRQ9Bbf7Z2ri9/EHwahmvj/QG2wQ2w53CcJ4HIIkO
	 XuIWfPb+EVD+PxvjWxtzqRcb+hdHfzpGoBEEQnmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFCD9F80544;
	Thu,  7 Jul 2022 21:47:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6997F8055B; Thu,  7 Jul 2022 21:46:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AFFDF80552
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 21:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AFFDF80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="n4Y5f97i"
Received: by mail-ed1-x532.google.com with SMTP id e15so3504033edj.2
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 12:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VXKGG9javDrFOkKmb7ryKLnUNvKA3TX1Nnby1SaWrZk=;
 b=n4Y5f97i3NIfTU7jXusYevNsremu+bzSJxGsQhqkaTWbVr5A43Ya9I82QJ0xnvbvyU
 OjpU6n96YZdMKX98GAE/eqOyzk4hW8kYp6PqIKy+rSs+51Cw6JJG5RwwClxUfOsXme5g
 ZdQEiUIXd+0HtOaSDo8jPwacMQ0M6G/rgnQgbd7KqP3TSrW0Xw6bm7RQC7AaEIXOtyFr
 kOlYvWt3jNntG3bGbJRa/wBWdsjOu+RgETf8y1Q0Qp4eQQveaZDUuZwOs84vV1NTUQ/g
 QtxNVwYpi+vpzxaM+49jZrDlS//l5PVrJWUqAL4TxKBgsl8WFU8CSooCNOdu4wXXKpI8
 ZRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VXKGG9javDrFOkKmb7ryKLnUNvKA3TX1Nnby1SaWrZk=;
 b=qneGRaSXCxfUKCNKd9KfhkybAeI/WWh1zuwyFMiuKFPmLM3uSRbzNSpBZbnBna99ZU
 wTP63RpjSVDJaddWTDd2+BRvKpBuQ4NHyvxRnUVWmbFwEkIBp/wltzCwTRkO5JoMXCWK
 2IjMSnBWgusTLbfr9ALZ32AWCp/NveSyAvcfCAalpB4lJQtd7jqBc0//cOWCH+V12i1U
 7cG1Z39IeCOWhz1Dkjs083Sy9VVcKFOV4xa79KmLqtdxBN4uiP3hbRUdkDgQz2aDLaHL
 AkoW3yCzJ9CqVaC/vyb7oqwHMx1qok0ilx7+hx7KlgOlSoJUwIqJy4prfLtb4VfsNLjT
 jb4A==
X-Gm-Message-State: AJIora+YS6QGPnT0KCqhePUzBnzbHeQnCSMmGFrVNgGXRoZOakwAEB2Y
 8IFO4x8WYUa94fUPb7QhLwg=
X-Google-Smtp-Source: AGRyM1t5YHGaAXCFYhFbkUmZfS61A+phs798Naq0MTaMYMF1qfI/f4QbXo/kslRdhgJz08bZi9NqbQ==
X-Received: by 2002:aa7:d80a:0:b0:43a:6f95:62a0 with SMTP id
 v10-20020aa7d80a000000b0043a6f9562a0mr26783800edq.284.1657223205729; 
 Thu, 07 Jul 2022 12:46:45 -0700 (PDT)
Received: from localhost (92.40.202.166.threembb.co.uk. [92.40.202.166])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a1709064d4700b0070f6855b90bsm19448053ejv.170.2022.07.07.12.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:46:45 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 04/11] ASoC: jz4740-i2s: Handle independent FIFO flush bits
Date: Thu,  7 Jul 2022 20:46:48 +0100
Message-Id: <20220707194655.312892-5-aidanmacdonald.0x0@gmail.com>
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

