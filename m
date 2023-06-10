Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB37F72AC0B
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76B4184A;
	Sat, 10 Jun 2023 16:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76B4184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405764;
	bh=B6nPBDONyZ9MC1pqIGSQpiK8HM/GBsALeAgOY1bK8Yg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z6Tim48twJCuPIxMrWNL5P9SlAtdN5GoxGOs+Cc40YyQ/SAq9yvi4lHvRaO1fo9nC
	 4g/HSXBOMsSe/jukkI1+2vfc8A8k48ceL/6VYa7MUjUYqYcuKVhkI75U+fUH6JxZKK
	 zulYznpNIJw8nLtK8pHSwZa/xqHI0qEyZEeB8swE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA143F80606; Sat, 10 Jun 2023 15:59:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9504F805F0;
	Sat, 10 Jun 2023 15:59:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FD9CF804DA; Sat, 10 Jun 2023 15:58:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74CAAF80199
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74CAAF80199
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mAptJ1yl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D3C1C6177B;
	Sat, 10 Jun 2023 13:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66956C4339C;
	Sat, 10 Jun 2023 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405487;
	bh=B6nPBDONyZ9MC1pqIGSQpiK8HM/GBsALeAgOY1bK8Yg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mAptJ1yl1/WFCPaWRXclgx8ynfSo4IN9JFdVKd8i1z4P9MwBUEwb4KbHR+rSseghW
	 AVzLlacA4xBV1D9CMmfflEzgv6IC1YoGhezQmiq4cexYCz1nrQf4PQ7x1k23nIu/GA
	 zxRTZzo9YhsL9pu1LldyYsr/8hTnIF/oNthiIToQAA7vrjlUTDS/+i1i23sO5rFI8h
	 kXw5h0ATwITetnONWWrJuNdyYiHJAAPOgWJAmC13YEsj7X/swjrWlQhAirkadQlgF8
	 9UB+TZtQOz1Yjc4uoy92uQZgsEIFDWnlZ56So0XwIi82OiU6s8c/WH+A/9G3L60xuw
	 9HLDlxj+B0AMw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:57:47 +0100
Subject: [PATCH 01/16] ASoC: rt1011: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-1-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=983; i=broonie@kernel.org;
 h=from:subject:message-id; bh=B6nPBDONyZ9MC1pqIGSQpiK8HM/GBsALeAgOY1bK8Yg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFgK2v+e4HgAkWzO4SYARr1x6lT2dnRc6eUnZ4K
 EtC7Dh+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBYAAKCRAk1otyXVSH0BQhB/
 wL98IilIUI94YRhai7cr1M5bqCTEOG2xEaFEiVtmAzW4/KbYwzUxSYmoTxosL9dZ7OsJfXdGwjYaGY
 ck5n0DVUdZocQ7SY89YFmchkeIMrug/7fa81IC5R3FpeWWk2XqE3yLY+0306pjb+MzAofo6URGVNmM
 ItOExqQRNa2bkvcTZ5TFhFNi8ZkK/gNBp1g2nI+il6bJ4TtTQ1IH6RQn9NZM6hGcaloJc4RNDFfEtl
 3qfSSVjhISyyCTzltqRQTWuDvFsX9mNkVHUXL5LxOLnMCmakMFa6vVFPpNJG8HFTJSBUhtO0WsykgG
 OAhoFNrT/LGpO90ctKac4P6JTUFI2b
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: BP7CTOOBAMH23K5YRE2NIXWM5OF247TQ
X-Message-ID-Hash: BP7CTOOBAMH23K5YRE2NIXWM5OF247TQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BP7CTOOBAMH23K5YRE2NIXWM5OF247TQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt1011 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1011.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index c1568216126e..443d2f66a4f4 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2184,7 +2184,7 @@ static const struct regmap_config rt1011_regmap = {
 	.max_register = RT1011_MAX_REG + 1,
 	.volatile_reg = rt1011_volatile_register,
 	.readable_reg = rt1011_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt1011_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt1011_reg),
 	.use_single_read = true,

-- 
2.30.2

