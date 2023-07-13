Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CB375159E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:56:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7214E843;
	Thu, 13 Jul 2023 02:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7214E843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689209792;
	bh=0louHWS+XXVrWGr5v4QqW9jALA5BBNUAZSluJauCqd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bMPH/UGz/mzwfv+rIZHcTd/h3k3vXp5ezX8NLP/IzxI8268fxLrQIxDPbw88gjaO8
	 ZM8vnSdHnhMXxGU3bdXReXvZA0ErTnfz7XEzeSWt8kkdVfD8bX+JmYWyZFDA2G8KMY
	 /HIQ2NsBscIisDduMeZ2hACy2UiGdeHiMynKsthk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42C6AF805B0; Thu, 13 Jul 2023 02:54:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AF2AF805B0;
	Thu, 13 Jul 2023 02:54:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55C9DF80567; Thu, 13 Jul 2023 02:53:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1E2DF80290
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1E2DF80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eHhvNSC0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0DDB861804;
	Thu, 13 Jul 2023 00:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB736C433CA;
	Thu, 13 Jul 2023 00:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689209632;
	bh=0louHWS+XXVrWGr5v4QqW9jALA5BBNUAZSluJauCqd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eHhvNSC09sshN/TRZdq0ojEkp4yvyxSjoXySGaKfDDFT8jO73InrOeQ6il4/+sPpM
	 DpozH+tTS88+QRG21HXsNc0R3sJL/x3+RASFUkJJ2j2sdg2ILsqXQYgiNr07y1PrDl
	 AKaI8/nKl43yf4isn+6b77hXYi1xiq5iVP+CrMyQMML7r9jjjxknpOVYoystRG8rWe
	 22/NhSnbA8tfDe/rjV2Cs7Mtc+gKlVGNEpPZHAvEevxSwQNVj1T0s3qZoZrjoJUnYS
	 D8UZdJ38P3v/iQQU5zyvcqDJXsTjgenZhg4T+A1cyGNQReZkHvkZ+rzzVkeC7oxcFs
	 GemDoUQtYFRLQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:49:23 +0100
Subject: [PATCH 05/11] mfd: cs47l90: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-mfd-cirrus-maple-v1-5-16dacae402a8@kernel.org>
References: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
In-Reply-To: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0louHWS+XXVrWGr5v4QqW9jALA5BBNUAZSluJauCqd0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0sNY5vw257sr3jpgkXKNHy/48m1h4uPbYXKl
 IOl8KrvhI6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9LDQAKCRAk1otyXVSH
 0Nk9B/kBmk58s/KiHnGuAwEH83uyI8cL71peREwLy8yNm5+6bZndk1AlLQwcJbXTRdaH31maxRS
 lEkt2m7ASEmUq6xUL12Or5PpL3ZxsXpFo1M6rs2PqYg/09PzxkFTs4rt8o9nxeKiynFhreITXeQ
 HCO34NjJ6CCtpNcFGaY1BvTH4YQI+4pUA+C7WPwAknBiwrrMJ9eZevXaGal86CrJTBTJKXlX+L7
 dbKZrXHKcfSMDVJ/6jpIjXUnfOdSq32RLBT9luEJ0fc8AZOwXQhkctjuaNR8/43XwgtvLoZvW5i
 g5RS+6AVhzyNJLN7j2h3y2joCxyhgHw7Q8YFEA9oJf2D3eZ3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: QNNET4FKN6GEBGZPKW752FDI44SWOIN2
X-Message-ID-Hash: QNNET4FKN6GEBGZPKW752FDI44SWOIN2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNNET4FKN6GEBGZPKW752FDI44SWOIN2/>
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

Update the cs47l90 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/mfd/cs47l90-tables.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/cs47l90-tables.c b/drivers/mfd/cs47l90-tables.c
index 7345fc09c0bb..6f9ceb36c533 100644
--- a/drivers/mfd/cs47l90-tables.c
+++ b/drivers/mfd/cs47l90-tables.c
@@ -2539,7 +2539,7 @@ const struct regmap_config cs47l90_16bit_spi_regmap = {
 	.readable_reg = cs47l90_16bit_readable_register,
 	.volatile_reg = cs47l90_16bit_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = cs47l90_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(cs47l90_reg_default),
 };
@@ -2556,7 +2556,7 @@ const struct regmap_config cs47l90_16bit_i2c_regmap = {
 	.readable_reg = cs47l90_16bit_readable_register,
 	.volatile_reg = cs47l90_16bit_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = cs47l90_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(cs47l90_reg_default),
 };
@@ -2575,7 +2575,7 @@ const struct regmap_config cs47l90_32bit_spi_regmap = {
 	.readable_reg = cs47l90_32bit_readable_register,
 	.volatile_reg = cs47l90_32bit_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs47l90_32bit_spi_regmap);
 
@@ -2591,6 +2591,6 @@ const struct regmap_config cs47l90_32bit_i2c_regmap = {
 	.readable_reg = cs47l90_32bit_readable_register,
 	.volatile_reg = cs47l90_32bit_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs47l90_32bit_i2c_regmap);

-- 
2.39.2

