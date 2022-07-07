Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616056AC2D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 21:49:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD0211676;
	Thu,  7 Jul 2022 21:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD0211676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657223359;
	bh=q7SGFURN6OWTFS7jV6UtMO3TG+rGiSt9rd1y7KEvRxM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X1jxZ1XsySNtLhGfLWhkrgquOt3F2Qtd2jlZ/EAAuvelWUMtRRA1zw9mD0aOYZ6Fs
	 2Z0z+U527eIpRgvQfT1pAIFgh+AIIxBhHP3vCpXXf2t2wfsH/erERSSJbcv9zaca5V
	 GdO8YVldosZq31hynkjebneG2qnmBsnL7UiPH5ZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05113F80552;
	Thu,  7 Jul 2022 21:47:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E661F8055C; Thu,  7 Jul 2022 21:46:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9B7DF80551
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 21:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9B7DF80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GZODA6os"
Received: by mail-ej1-x62b.google.com with SMTP id os14so3968862ejb.4
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 12:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rg4jRfiWMbzTLHtEYWUNXlGuNm181rxgiYhLfRcL2n4=;
 b=GZODA6os0O0k/RDmnN1YoESrEawU4kNIwY17jbWZHv4lTvy56NzD/La48Z6KsvMgMr
 Fb72xC0X6pvV2FIjLO8TUWnqMz9tvGrGf5OZVvRZ5ZGpuA7NNMZOh9EjC0RLkc0VHXRE
 hZnC4H6bnsCpqniYov2JBKX4QWKb8n9PslzsNlKLwvHBq22SY0xjRcsqdV98xrTwGHSX
 CEU3Ca44FlbbHoazhW7Bqe/vG0P7n80g0TVBiqqkfz6eQ4usxsRnCAkiRBHan7jVS2ZC
 tG96hGLwkY0GDKM9CaoJee+/FpXxc1OUl4FYWL7epUX16mcnhtKewkzwTnYCwNzcmm7+
 9OSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rg4jRfiWMbzTLHtEYWUNXlGuNm181rxgiYhLfRcL2n4=;
 b=yknR/wNhhdZmnDLVCk2Bcgr2FNztyk62GQdK6B4l8XmwaEPLTRIjmI8ftrMkbMj+gW
 R0rx/WtKhKkvDeV+m8il3kRI3vyEWenkb6bB97UO8G6S//CijviHpsmiRqXFa7GhRMol
 DHF+F9onncY+xKKLC5oNtmHoGU4JMdYuzx5ni0aEs0sSdo99FcqD5a49fG6K2VHfHGpG
 WsjOpBwhhMwQF0E2gedbHmueLnd9hgixmUe3/Od0HxYAG6jGC33fTfRVK6yhFFSrKoDv
 lmlItbH3McUamYcyqGVI7FfJYTaKGLQcgX/tYqnvZ/7uMQscYvpN9jgrVk6XTPHMA4H1
 s+xw==
X-Gm-Message-State: AJIora+7aFmxx6QpcF7RW38RVScGDyX5x+Xg8eKE8VryqIxiVnWqpnEp
 UCGV2yl/YPNS+axnQFjcjAQ=
X-Google-Smtp-Source: AGRyM1vqherMkkYjnDGn1qFz1siMjpXjfmuUweFSfcTPlPUxypppZhncBKQpkBZOG/p+YMc0VDcjeg==
X-Received: by 2002:a17:906:9b09:b0:72b:d70:32a6 with SMTP id
 eo9-20020a1709069b0900b0072b0d7032a6mr5090889ejc.723.1657223210437; 
 Thu, 07 Jul 2022 12:46:50 -0700 (PDT)
Received: from localhost (92.40.202.166.threembb.co.uk. [92.40.202.166])
 by smtp.gmail.com with ESMTPSA id
 rl4-20020a170907216400b0071cef6c53aesm19258336ejb.0.2022.07.07.12.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:46:49 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 07/11] ASoC: jz4740-i2s: Make the PLL clock name
 SoC-specific
Date: Thu,  7 Jul 2022 20:46:51 +0100
Message-Id: <20220707194655.312892-8-aidanmacdonald.0x0@gmail.com>
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

On some Ingenic SoCs, such as the X1000, there is a programmable
divider used to generate the I2S system clock from a PLL, rather
than a fixed PLL/2 clock. It doesn't make much sense to call the
clock "pll half" on those SoCs, so the clock name should really be
a SoC-dependent value.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 0dcc658b3784..a41398c24d0e 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -75,6 +75,8 @@ struct i2s_soc_info {
 	struct reg_field field_i2sdiv_capture;
 	struct reg_field field_i2sdiv_playback;
 
+	const char *pll_clk_name;
+
 	bool shared_fifo_flush;
 };
 
@@ -281,7 +283,7 @@ static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 		clk_set_parent(i2s->clk_i2s, parent);
 		break;
 	case JZ4740_I2S_CLKSRC_PLL:
-		parent = clk_get(NULL, "pll half");
+		parent = clk_get(NULL, i2s->soc_info->pll_clk_name);
 		if (IS_ERR(parent))
 			return PTR_ERR(parent);
 		clk_set_parent(i2s->clk_i2s, parent);
@@ -400,6 +402,7 @@ static const struct i2s_soc_info jz4740_i2s_soc_info = {
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
 	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
+	.pll_clk_name		= "pll half",
 	.shared_fifo_flush	= true,
 };
 
@@ -409,6 +412,7 @@ static const struct i2s_soc_info jz4760_i2s_soc_info = {
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
 	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
+	.pll_clk_name		= "pll half",
 };
 
 static struct snd_soc_dai_driver jz4770_i2s_dai = {
@@ -435,6 +439,7 @@ static const struct i2s_soc_info jz4770_i2s_soc_info = {
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
 	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
+	.pll_clk_name		= "pll half",
 };
 
 static const struct i2s_soc_info jz4780_i2s_soc_info = {
@@ -443,6 +448,7 @@ static const struct i2s_soc_info jz4780_i2s_soc_info = {
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
 	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
+	.pll_clk_name		= "pll half",
 };
 
 static const struct snd_soc_component_driver jz4740_i2s_component = {
-- 
2.35.1

