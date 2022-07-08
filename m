Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D47A56BD30
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 18:06:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CEDB83E;
	Fri,  8 Jul 2022 18:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CEDB83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657296369;
	bh=q7SGFURN6OWTFS7jV6UtMO3TG+rGiSt9rd1y7KEvRxM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kNWFs4UxcvddhqtFvDDbaqjyFq/Z2g1uoEVQ3GkGFmMuxdWP3H/9LTmSEByV5g9u/
	 s4EPzq9gPK7K2TNTQXBsFWnypkjQHz03dLsl++hBSg6RJwNAepUHOiUUfEdpqW9tZL
	 P145xUVyYArAz8+lQK99iS7r7zpaS3gQNMiJGDWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A66DF805A8;
	Fri,  8 Jul 2022 18:02:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EF6CF80589; Fri,  8 Jul 2022 18:02:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C51BCF8054A
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 18:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C51BCF8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nBnzGJVn"
Received: by mail-wr1-x433.google.com with SMTP id a5so16463435wrx.12
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 09:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rg4jRfiWMbzTLHtEYWUNXlGuNm181rxgiYhLfRcL2n4=;
 b=nBnzGJVnF8VfPc14Lp2+tlCpzGcrxDvhdocQ6Thabc7Aaq2qMXuR1wGvg9HCEN7hk3
 aFIb/h4i2HbqEET9ZJSXh4YCIbzazxCAPX30a7xk2RlCTZ3uXOz9CXRR4wWh+3OHaLop
 D1fcwJAtwpz2mzUCF2zmiWMcOp4hLLMs4730MQVXkm36Whjj4s6eXaEMwPCG10GMCMw6
 Og8HDeSXqC7tQZaXx1XCZt6hbbQyvMchIFJfOO9MlLg6HeHbEPO0c9CZLpoZpEzMXZpi
 8AUJtV1zxeFiobNlM2bdiNjX9BRHrStJ6Zy6sVRrzgpKdWda5hmW7evnO6sOAQmzRV9u
 jV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rg4jRfiWMbzTLHtEYWUNXlGuNm181rxgiYhLfRcL2n4=;
 b=Jvr66/AchO+oholhT3zalBfLRmqHuf62b3jq7lfv1P2bwAsS+bT/mfsitqu2E+L+bS
 aACAhjUIWrpfXE+FxJRoDBPapY8wULJ5Dfqz1v7EgqgEpmPtNa2DRw5xKsl406gKNfBk
 GZcMvgK7RT2SnTLCaO8DlJ/EuReoYCGtcUhaag9wiRkUXTWYH1dUMnofVPT9UVplgzpA
 nFzHaQg3reHLwF8jwypGeIGCzSQNndtneZlAANssb+3IR0KBN7tHL7C1f+UwC1yO0Snx
 ZPq0d+PMvPPIojN4OHoOmzbMkIdthtIkGexVTEbCgQQjirAE3ABI53XUGmJsq2rQyjB1
 bZCw==
X-Gm-Message-State: AJIora+S9xdX92zIDkbV10Xj/Kr+37L8GwHRDdjSRGDly3d7z6Zv8uMa
 QWbHtVpenjMwA6MOZMwvAFE=
X-Google-Smtp-Source: AGRyM1sCcUelm0/FngZamMpPaDw2OctQX3wTWsua5zS3txHup3WL01Xq8hlPY2i65HUJekLQfphAIw==
X-Received: by 2002:a05:6000:1848:b0:21d:8e3f:f8c0 with SMTP id
 c8-20020a056000184800b0021d8e3ff8c0mr4036901wri.158.1657296137581; 
 Fri, 08 Jul 2022 09:02:17 -0700 (PDT)
Received: from localhost (92.40.203.144.threembb.co.uk. [92.40.203.144])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c511100b003a2de511598sm365729wms.12.2022.07.08.09.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 09:02:17 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v4 07/11] ASoC: jz4740-i2s: Make the PLL clock name
 SoC-specific
Date: Fri,  8 Jul 2022 17:02:40 +0100
Message-Id: <20220708160244.21933-8-aidanmacdonald.0x0@gmail.com>
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

