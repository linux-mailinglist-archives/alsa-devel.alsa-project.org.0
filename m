Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 113F4751597
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:54:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D51EDF0;
	Thu, 13 Jul 2023 02:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D51EDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689209686;
	bh=OAjUIJFRiwfH4uG3mrS4YPTvxHzJtkPKEVfSkFAYGxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AqouOf9br6eaJSFcjUtsJ5H23EZ/3d3QTlqs6uz5PYcY0lZJWUogOIzavvKYFIAZV
	 5UzZJ1jnSpJRweHthM3hOzkGaNmgtxZJH/SvUyCBUL91MgDQZxGovhpc+pNtAKhjHL
	 fdeEBz2WTkbxYB/m4o9FFvkcukEv+TUQiBwawlu0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2068CF80249; Thu, 13 Jul 2023 02:53:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DDF4F8024E;
	Thu, 13 Jul 2023 02:53:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EBC9F8027B; Thu, 13 Jul 2023 02:53:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAE75F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAE75F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fMVnflMz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 17F16619E5;
	Thu, 13 Jul 2023 00:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD85C433CA;
	Thu, 13 Jul 2023 00:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689209623;
	bh=OAjUIJFRiwfH4uG3mrS4YPTvxHzJtkPKEVfSkFAYGxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fMVnflMz/+0lwEA05Y/rLjbNZz5aR3zyMX5BK0KAHhFRInntQ6E/lw17Pjjo2nX5/
	 f1Cbfr0pHjRORHd+fIXpu675iG67gp1USa97BLK7khz7hiIj3jtvmwstHJCEy22e3w
	 9uevOLQVfeU6QIGYtTY6qnC4AfkrBRjWAvdZ4Ed+2PX9fHi+aYMFZ4ESCx1YtRcs9X
	 /3/SqsNE/PZy7EXYt17KRl7UjJdEomFof28f8mvFJ/tmdOxeH7mmgjKwL1M0f1Xc1G
	 Q5H5WbACap0UUByVdZf4spQB5dr5SynWpy4GMdUJJhINF8obmoqg6o65O7hETpS7GI
	 UNW/nCgPM8fEQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:49:19 +0100
Subject: [PATCH 01/11] mfd: cs47l15: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-mfd-cirrus-maple-v1-1-16dacae402a8@kernel.org>
References: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
In-Reply-To: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OAjUIJFRiwfH4uG3mrS4YPTvxHzJtkPKEVfSkFAYGxY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0sKi5ZGHZ2vvdghsQVY8c2PTT3pwO6B1qTdQ
 0/tQ1glM9aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9LCgAKCRAk1otyXVSH
 0FV7B/0RPVctooWsDmg7xE1H0aGi2Wc7+Bp4qZifOhWvLKdYHKENft3Pr2fVvIHySse9jOukw+P
 FgUzttUPAd/4lVlBnZ3W5Lv3caKlLhRKXbsEmmCTW5Q9O4hLvJB1ohXMm55Efpm83nehUCfwYpK
 8Q+eSoPTHB8Wldc/xylyWQ3CilI/nYAZ6UDR30KYIKYoPpsOBa8b/ypPqKfYfFusD61x5czzHKg
 XjA1dMN+6449Mh78ruQx2vO8yzf0YUzKZK/vsCrmnLLUPM7GCBJH5RBZfjHV0JJO2VD13ofcSaq
 4KEZytRGzv/p8SoL+30GbfwPkgo4ZCd8XA0SEAUnFI6hEvvY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: QUQLKK7QA5LCQXWZWOSQUWTD53Y36FNY
X-Message-ID-Hash: QUQLKK7QA5LCQXWZWOSQUWTD53Y36FNY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUQLKK7QA5LCQXWZWOSQUWTD53Y36FNY/>
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

Update the cs47l15 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/mfd/cs47l15-tables.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/cs47l15-tables.c b/drivers/mfd/cs47l15-tables.c
index 3c77f0a24e9b..59b005cc1e33 100644
--- a/drivers/mfd/cs47l15-tables.c
+++ b/drivers/mfd/cs47l15-tables.c
@@ -1249,7 +1249,7 @@ const struct regmap_config cs47l15_16bit_spi_regmap = {
 	.readable_reg = &cs47l15_16bit_readable_register,
 	.volatile_reg = &cs47l15_16bit_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = cs47l15_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(cs47l15_reg_default),
 };
@@ -1264,7 +1264,7 @@ const struct regmap_config cs47l15_16bit_i2c_regmap = {
 	.readable_reg = &cs47l15_16bit_readable_register,
 	.volatile_reg = &cs47l15_16bit_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = cs47l15_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(cs47l15_reg_default),
 };
@@ -1281,7 +1281,7 @@ const struct regmap_config cs47l15_32bit_spi_regmap = {
 	.readable_reg = &cs47l15_32bit_readable_register,
 	.volatile_reg = &cs47l15_32bit_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs47l15_32bit_spi_regmap);
 
@@ -1295,6 +1295,6 @@ const struct regmap_config cs47l15_32bit_i2c_regmap = {
 	.readable_reg = &cs47l15_32bit_readable_register,
 	.volatile_reg = &cs47l15_32bit_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs47l15_32bit_i2c_regmap);

-- 
2.39.2

