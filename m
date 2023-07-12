Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F3075190A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 08:47:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92BEC3E7;
	Thu, 13 Jul 2023 08:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92BEC3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689230868;
	bh=c/i8enrq6cezEUQfQvzd9HWY5GpAOY8Zf0YXfgTpu3A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XpKcYEzwND6KgSaHO4cvgcCM8aNeunLAQHPTnXp0hz5A3mqWUVWKu0WcH9dLEK2w5
	 d4sHVqmlArQAmNn0DnOs2LwJuLh4wyPCGek9BYZr7TbQlreC6oce2Kd+2fBLI+tHzp
	 hPkNdPNpJHZJzxACC0K6L3c7alLdWVkO3HZrJiMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15936F8047D; Thu, 13 Jul 2023 08:46:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43B51F80236;
	Thu, 13 Jul 2023 08:46:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 676ACF80249; Wed, 12 Jul 2023 17:12:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 375D6F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 17:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 375D6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=RIGQGajl
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-55bc29a909dso3649277a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jul 2023 08:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689174746; x=1691766746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ECiLeGJkNprLw+g0X3L1cAWQ/zU6I6t8+jDfAyzLBrU=;
        b=RIGQGajl4x6HG/JpHEe5LWkWl3o6uSi4Cjg3mnn+4o9OXlDmdtt2UqZzyDHc+xAdT4
         oQNrjXrGz2nMqkeH2CaT4iSnqTWd8KrEjetpDXUq757pdI1PKkChxJs21v3IvoWL3kIc
         MrDVlIST/yShOiyGSgJSotztHQWCPuddqhasHwpsnUrZEfp+8C3s+wasATRGtRN4Rq7B
         0Y2wnQ9qirTjN8v0GspYswf7TvHxggmPmFIWPxqijq1ha+BFK/rxa7iKtCV61YBhY3tu
         gFfWei7//QnJuS1grZSJrRTq1XxG9QWjgqYV1tNDq4QTgW1BPPONZY1KW4nTR9HfpetI
         5kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689174746; x=1691766746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECiLeGJkNprLw+g0X3L1cAWQ/zU6I6t8+jDfAyzLBrU=;
        b=Lh7ogt53jf0oLnVRN4aqdLIkR35Ka+oJO86wjGTjxoVTrhgfSQn1hjZcHzJes8Wkqt
         tcMp8ZOLle0//R9x2G6oOPy07yBh7S3M6uVE+b5hRM+0MzXKnMMAYNNpbstypDwaBbSv
         lzd9BCQWKJupf5aKGYS11iebjlJ8fV0wVLOyVfgdOmtLcQ7GOEIBS2cmZ2CHJXoHcZD7
         XUe/bseJZRu5QAMwYwitmH9SwmVlTbh31twlmvmIBt8VZ/KazM6PS5U9uobgZTewUD+R
         N3F/JZbq18rINFaY8ejkTe0adE/v+vdTe0r2pEl+tEoYKPa6jPLvbEq0LmVlnvEZ/0Hq
         c1Qw==
X-Gm-Message-State: ABy/qLYfh6C/eCFBUagQo2I7Jf6gviz+OSR0XyQ9Z8BK0B83gSFseak0
	vlZQbtr2oUMoQKcfh8aMJqI=
X-Google-Smtp-Source: 
 APBJJlEz3x4C9lBqp+zKUm5wncQq7Aa5uekWuoz+qkfaXGKTS3GMvF34BoJ/i79KeHAkK42zScjy7g==
X-Received: by 2002:a17:902:c246:b0:1b6:ba60:77f0 with SMTP id
 6-20020a170902c24600b001b6ba6077f0mr15260373plg.10.1689174745620;
        Wed, 12 Jul 2023 08:12:25 -0700 (PDT)
Received: from localhost.localdomain ([113.103.7.132])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170902869600b001b9cea4e8a2sm4064711plo.293.2023.07.12.08.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 08:12:25 -0700 (PDT)
From: Guiting Shen <aarongt.shen@gmail.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	sboyd@kernel.org,
	mripard@kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Guiting Shen <aarongt.shen@gmail.com>
Subject: [PATCH] ASoC: tlv320aic32x4: Fix the divide by zero
Date: Wed, 12 Jul 2023 23:11:58 +0800
Message-Id: <20230712151158.20378-1-aarongt.shen@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: aarongt.shen@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EMAXHLEAV6UEQ7NSASCOV4MJ64IZ4A7A
X-Message-ID-Hash: EMAXHLEAV6UEQ7NSASCOV4MJ64IZ4A7A
X-Mailman-Approved-At: Thu, 13 Jul 2023 06:46:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EMAXHLEAV6UEQ7NSASCOV4MJ64IZ4A7A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The value of register(NDAC,MDAC,NADC,MADC,BCLKN) maybe zero lead to
divide by zero in clk_aic32x4_div_recalc_rate().And the rate should be
divide by 128 if the value was zero in this function according to the
datasheet.
Add the macro AIC32X4_DIV_MAX to present the 128 and return 0 if failing
to read the value of register.

Signed-off-by: Guiting Shen <aarongt.shen@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 16 +++++++++++-----
 sound/soc/codecs/tlv320aic32x4.h     |  5 +++--
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index c116e82f712d..5c0a76a4a106 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -321,7 +321,7 @@ static int clk_aic32x4_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	u8 divisor;
 
 	divisor = DIV_ROUND_UP(parent_rate, rate);
-	if (divisor > 128)
+	if (divisor > AIC32X4_DIV_MAX)
 		return -EINVAL;
 
 	return regmap_update_bits(div->regmap, div->reg,
@@ -334,7 +334,7 @@ static int clk_aic32x4_div_determine_rate(struct clk_hw *hw,
 	unsigned long divisor;
 
 	divisor = DIV_ROUND_UP(req->best_parent_rate, req->rate);
-	if (divisor > 128)
+	if (divisor > AIC32X4_DIV_MAX)
 		return -EINVAL;
 
 	req->rate = DIV_ROUND_UP(req->best_parent_rate, divisor);
@@ -345,12 +345,18 @@ static unsigned long clk_aic32x4_div_recalc_rate(struct clk_hw *hw,
 						unsigned long parent_rate)
 {
 	struct clk_aic32x4 *div = to_clk_aic32x4(hw);
-
 	unsigned int val;
+	int err;
+
+	err = regmap_read(div->regmap, div->reg, &val);
+	if (err)
+		return 0;
 
-	regmap_read(div->regmap, div->reg, &val);
+	val &= AIC32X4_DIV_MASK;
+	if (!val)
+		val = AIC32X4_DIV_MAX;
 
-	return DIV_ROUND_UP(parent_rate, val & AIC32X4_DIV_MASK);
+	return DIV_ROUND_UP(parent_rate, val);
 }
 
 static const struct clk_ops aic32x4_div_ops = {
diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
index 4de5bd9e8cc5..d6101ce73f80 100644
--- a/sound/soc/codecs/tlv320aic32x4.h
+++ b/sound/soc/codecs/tlv320aic32x4.h
@@ -223,8 +223,9 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
 #define AIC32X4_REFPOWERUP_120MS	0x07
 
 /* Common mask and enable for all of the dividers */
-#define AIC32X4_DIVEN           BIT(7)
-#define AIC32X4_DIV_MASK        GENMASK(6, 0)
+#define AIC32X4_DIVEN			BIT(7)
+#define AIC32X4_DIV_MASK		GENMASK(6, 0)
+#define AIC32X4_DIV_MAX			128
 
 /* Clock Limits */
 #define AIC32X4_MAX_DOSR_FREQ		6200000
-- 
2.25.1

