Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7359751089
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 20:31:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E25084A;
	Wed, 12 Jul 2023 20:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E25084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689186711;
	bh=Yi+sAb3AUcr+rzeCFuKWfBtZBXLt+YKwOAZ1mGigjB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bnqgcatMLeTGn9zMygXnqGJiqW0IFbhVSUTl8PEjrr6kkVCiIpoaLXXjTiVN6UhxN
	 +xGQIaMVeu7LuRd87ZJ4zU4aeuIiKVd4J1hzzxU3bp5KKh7bh+u0Rt9qkLvlOLV5DE
	 BaYt4o9VOtEe1qX0rKFdAj0V8/bA02jFJbYFE4VY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4231EF8056F; Wed, 12 Jul 2023 20:30:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD6BEF80563;
	Wed, 12 Jul 2023 20:30:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D5B2F80551; Wed, 12 Jul 2023 20:30:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C003F8024E
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 20:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C003F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gOZSsUBJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3BC0C618BF;
	Wed, 12 Jul 2023 18:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BF0C433C9;
	Wed, 12 Jul 2023 18:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689186595;
	bh=Yi+sAb3AUcr+rzeCFuKWfBtZBXLt+YKwOAZ1mGigjB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gOZSsUBJvcFvXH/bVjRq+KhDTtlf949bf6coTAiH6nyCFJGw+hiDDb64YzV3G6hSt
	 OBaUK6cusCLC4/oFeFzL2GKJWn7O/7v5r+H+9zvT24BWOCNLE2U/7A3WFQ25GfxuHG
	 soczblLYCzr1lgx/nuCljUgWuNCP2myZf2M0cQ7aWLuxDdKk80qVhganPAmIwjhn+f
	 j3WxyL52OeiAibIYfv0qlD3jQcEwsLrzP7dlSvSXYIzdH3JQODHamJeLMy8ALrUoJm
	 7Ba6v3owAt8iubvsArva2XJJpHW5iRYTvVbWQlV4OjAqQBrXZ6IW546JTG8CCx3sgu
	 IUVnOyWqUlqnQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Jul 2023 19:29:34 +0100
Subject: [PATCH 3/4] ASoC: wsa881x: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230712-asoc-qcom-maple-v1-3-15f8089664b9@kernel.org>
References: <20230712-asoc-qcom-maple-v1-0-15f8089664b9@kernel.org>
In-Reply-To: <20230712-asoc-qcom-maple-v1-0-15f8089664b9@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Yi+sAb3AUcr+rzeCFuKWfBtZBXLt+YKwOAZ1mGigjB4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrvEZIQvEvY0XXjd4HOMqjlyy+CL3W8WtrpMAi
 7SDeDeP3iiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK7xGQAKCRAk1otyXVSH
 0PnFB/0UcDrgvnx2YLqAbbV4KWZYy3iPKSpyn+S5czA+j59Gn+tvkwid5EUxHAQ9Khxk1TwVw57
 MGfCxa2IVIpSTPM1Noqjd5iau2HH6dDwi3ZcTvvfyf1gr06pjeVMkVVPvOj1ecegr50Cr2Z3iTP
 6sGgyBRU8YrBlu36w4ROnQI7yGmkMyw9oNECMFaMSolWavTm+IF3i2k9DwIS42VjuRAYuRH4Ya3
 rNnkSRI60GOv+cE5QRFioYDuqtwVwMN11ao25I378WX+XwTX3p7Gvwbyh2yg+hIjOrsUw+BeVub
 lhMg6y9/q2+VgiNYOhAcO/VKJit9Vcu0pqNzbS9mXe9f3wr/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: HVNO7QLYBVNP6TKAKE3Y2SKOPQ2VCWAN
X-Message-ID-Hash: HVNO7QLYBVNP6TKAKE3Y2SKOPQ2VCWAN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVNO7QLYBVNP6TKAKE3Y2SKOPQ2VCWAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wsa881x driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wsa881x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 97f6873a0a8c..3c025dabaf7a 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -637,7 +637,7 @@ static bool wsa881x_volatile_register(struct device *dev, unsigned int reg)
 static struct regmap_config wsa881x_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 8,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wsa881x_defaults,
 	.max_register = WSA881X_SPKR_STATUS3,
 	.num_reg_defaults = ARRAY_SIZE(wsa881x_defaults),

-- 
2.39.2

