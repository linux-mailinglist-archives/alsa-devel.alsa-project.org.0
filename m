Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A98E77515A3
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:56:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFEEAE88;
	Thu, 13 Jul 2023 02:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFEEAE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689209815;
	bh=fh6MWW5xM6TIC1bWh50RDviYmRNKAyHpmR3q/bXKhDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z4vjvDKR+xMx66fMKQbv05cF8eJcExZjz6/IDB9aPKNk2eHAUy29FA0S6JQ3Mxs1/
	 yi4iIkynS+pqRUAt2wCGQQ59Vtd+Wmx4Vgi/NNT++Oma73Cx+HmcztUsb5rk5W9uiH
	 VHfDyO2cq+UMXMZnJie0aOXdWgWc3m4PHq57GIfg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47CA2F800E4; Thu, 13 Jul 2023 02:55:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EABA4F80236;
	Thu, 13 Jul 2023 02:55:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BE1BF8057B; Thu, 13 Jul 2023 02:54:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67EADF8055A
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67EADF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FTuivQKQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3118C619E4;
	Thu, 13 Jul 2023 00:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057FFC433CB;
	Thu, 13 Jul 2023 00:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689209634;
	bh=fh6MWW5xM6TIC1bWh50RDviYmRNKAyHpmR3q/bXKhDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FTuivQKQBdt9UEsyx3/KpaT+faJpV+JSsnAAwPop5YbJJYWUkWn/K4QpSk04+p20u
	 aFcmRSQGqyVZjTwCWyj33IYTru5TLRdrcJlODIdMwZ6I/TjL+J1O7GkMrKKJkPvgvq
	 uwJhZanwGJmFbLmMzYzWQcj6YRwcBbd0/zHNUvVWtXeA+vISR9B9fw6wTIq7b531bC
	 Zylttd3FFis7CwFQLQvooiCj8OpOnbe/itPpz16AwdJXPh30hpA+MP55EbsYigBtpm
	 MsMXNMzwrEUNxfnGDEgZ6h1D33Puwpj+tzgxkzKUJhZCYm8iBMM5C1LgXyecAbRjje
	 9iNnXxM8wR5Dg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:49:24 +0100
Subject: [PATCH 06/11] mfd: cs47l92: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-mfd-cirrus-maple-v1-6-16dacae402a8@kernel.org>
References: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
In-Reply-To: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fh6MWW5xM6TIC1bWh50RDviYmRNKAyHpmR3q/bXKhDU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0sON5sQREXOfKHsvrHnNJcEcMKpCwbhosYs8
 g5ElL14lkWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9LDgAKCRAk1otyXVSH
 0OHKB/9UmALu5xfiHKHx2GCR8b42sDK88pzDGhSp5VuvDZXe7Ow2s4KY3YVMU1Bv4cYvmbkUGRW
 KUoMeLFpCijKt0BSTIDlxQJqgEPpAvnyKznAmjf89d+pXiozENzEKja4Q3YITNkDsic3OtXFl2u
 7fS0m6LoSLV338UYq/8AdF8w1qpBJIFdsUMgbvtEfOcA6GsshfkgzCRcHCTPsuhuqWRqXKw6qQc
 oo2+BkYUly/Kja62upqHODZnYo+ZQUmA+fW3+GLtH+NmIYaVJSCyv4fx1TY5/jyMRZnRbb8roVx
 nPG1eIIMlTkf0hOesZpPI1PDGpUk+Hywph9oBAtgwpOLzycZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: XJO57CENUBKYIGMVZCBDTDIKC2PHZ74Z
X-Message-ID-Hash: XJO57CENUBKYIGMVZCBDTDIKC2PHZ74Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJO57CENUBKYIGMVZCBDTDIKC2PHZ74Z/>
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

Update the cs47l92 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/mfd/cs47l92-tables.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/cs47l92-tables.c b/drivers/mfd/cs47l92-tables.c
index f296e355df4d..4d9ba865aaf6 100644
--- a/drivers/mfd/cs47l92-tables.c
+++ b/drivers/mfd/cs47l92-tables.c
@@ -1890,7 +1890,7 @@ const struct regmap_config cs47l92_16bit_spi_regmap = {
 	.readable_reg = &cs47l92_16bit_readable_register,
 	.volatile_reg = &cs47l92_16bit_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = cs47l92_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(cs47l92_reg_default),
 };
@@ -1907,7 +1907,7 @@ const struct regmap_config cs47l92_16bit_i2c_regmap = {
 	.readable_reg = &cs47l92_16bit_readable_register,
 	.volatile_reg = &cs47l92_16bit_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = cs47l92_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(cs47l92_reg_default),
 };
@@ -1926,7 +1926,7 @@ const struct regmap_config cs47l92_32bit_spi_regmap = {
 	.readable_reg = &cs47l92_32bit_readable_register,
 	.volatile_reg = &cs47l92_32bit_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs47l92_32bit_spi_regmap);
 
@@ -1942,6 +1942,6 @@ const struct regmap_config cs47l92_32bit_i2c_regmap = {
 	.readable_reg = &cs47l92_32bit_readable_register,
 	.volatile_reg = &cs47l92_32bit_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs47l92_32bit_i2c_regmap);

-- 
2.39.2

