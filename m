Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF1056B76B
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 12:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED2FC1674;
	Fri,  8 Jul 2022 12:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED2FC1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657277110;
	bh=q7SGFURN6OWTFS7jV6UtMO3TG+rGiSt9rd1y7KEvRxM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D9+yJPd9zk55axeHxCrP4c9kyu4spbXbprprkasBu7Trsg2Rt1/8K5f3m0j9OsoIx
	 /opvWKjDHMOLFhborZgujInuSrNxapbk7vTj3yUYorH2LsnP9aZUO+obXzmx2hrgZJ
	 WIsum7JYF/dbMrUseiLp5WtAAqVVoyTkOTf5PX+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E91AF80578;
	Fri,  8 Jul 2022 12:42:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69074F80563; Fri,  8 Jul 2022 12:42:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6743FF80543
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 12:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6743FF80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KkicO0u2"
Received: by mail-wr1-x42a.google.com with SMTP id z12so20367148wrq.7
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 03:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rg4jRfiWMbzTLHtEYWUNXlGuNm181rxgiYhLfRcL2n4=;
 b=KkicO0u2riWbLdjNYzvFSTrCVNYwCu0SNCAyxMYI5MBgL2LZJ3dIf4y43RlBxUf70h
 /Z9JwLlonGTwxzdYvS8eQqsdMuZCWxty6hu08AQlZrxJYslrAuIQ1E6vmgUi9xa/YNem
 WM3Eyqyof9D4Jt5SLFilJ9GGIsvel0+NAl45DO92lYPigBG19lf1oJ2nKEAum17FtwHk
 UQqwYkd4YZkDheytch6fXMqLy0SfVfz7WVVWZCKeRUyf0szrY7lS4QPB5qfLRdHbv78Z
 CiEEjJxmlWzjngwfiZLZ8qm1f4h3iMlMqedUkZzidrDH/wRr/B4JwF0IzCT8HmxcKeII
 FNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rg4jRfiWMbzTLHtEYWUNXlGuNm181rxgiYhLfRcL2n4=;
 b=MkLt0GmidHZJKzdmpVP6Bt4lQ3aF4gS6+EBLsbz7fBv6AOh9/InVzdP8wKDYu7+/cf
 b0X7DQIdJbb3VcM71je+Fgrxr1b+N6eCk8NQ2YjVRPc51l6BDBzmgV+B/FlygzAGpp9T
 EXoAEoE7P6cMKx9kpjIk7rrDPkKugPIMGLQhIUrqe2/h/xW7BrzXz11f+v7kRK1AbREd
 Q0lrZy3XWizV/LyWzsLWeX7pUOJDpY3rCBAF9NKvMZrdBPQqtDghD7f3plEF0isA1xXp
 jBhqIv8H5u8HTnnFjMwC1wGDOgqh2T5AMz/11I/i9SuUH7wlp+qBaXBUYHLLY+v744im
 S9FA==
X-Gm-Message-State: AJIora9z81biGZ3WF9fsjJhx3uRg/IhEk0gG+ss8lNTMMMH6Pit48S7o
 QwsDunA46ZzcNYuKOGKUTdc=
X-Google-Smtp-Source: AGRyM1vHc8hf16D5xkMwPgK+XGc4Vp0KdP7iXGd1mjRXQ1Z+X6xDYu1EU7/2T4NIHU2GPcgz1O9q5w==
X-Received: by 2002:a05:6000:80e:b0:21b:9fb8:1b65 with SMTP id
 bt14-20020a056000080e00b0021b9fb81b65mr2768594wrb.592.1657276950872; 
 Fri, 08 Jul 2022 03:42:30 -0700 (PDT)
Received: from localhost (92.40.203.220.threembb.co.uk. [92.40.203.220])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a5d68c9000000b0021d7122ab80sm10031028wrw.110.2022.07.08.03.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 03:42:30 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 07/11] ASoC: jz4740-i2s: Make the PLL clock name
 SoC-specific
Date: Fri,  8 Jul 2022 11:43:00 +0100
Message-Id: <20220708104304.51415-8-aidanmacdonald.0x0@gmail.com>
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

