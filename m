Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1DC7515AC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:58:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EB4FE74;
	Thu, 13 Jul 2023 02:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EB4FE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689209893;
	bh=NAAL9Cd9YIcAIGI/oTRPpfPZFpmQ19Yext7FFN1qesA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QFmZNESEpoAkPBkuxrAzMQTKUaOl+s4gRYyMiDabqeeHDMcQ+kBA47GuegO4u3dda
	 y4wqF2vJ1SQLR7JV2R/wgAn8YE5Jp6341QK+Ru0gh3ifL/MEdi1IWJTJdLd0RvdeGd
	 u4CAcY3lKjqU7YAE+o/dDyY33hm098aUhck11F9I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05EF3F805C6; Thu, 13 Jul 2023 02:56:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B921DF805C4;
	Thu, 13 Jul 2023 02:56:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74882F805AC; Thu, 13 Jul 2023 02:54:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 93903F805AC
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93903F805AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rTxrrlNQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D826618A6;
	Thu, 13 Jul 2023 00:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146BEC433CB;
	Thu, 13 Jul 2023 00:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689209645;
	bh=NAAL9Cd9YIcAIGI/oTRPpfPZFpmQ19Yext7FFN1qesA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rTxrrlNQwSPOsr3rE+iaR5ktgDSR23dH3280v54wKWZJPXAZVIZ1uWcH3ipkLka7N
	 idnpD2oVbx1/robP18bOr6kjLK0DeAr/rZ58/1WyqtCiOlFMgrPdUkWJJPSqh8+ABq
	 1Q+t3S09bz8sjd6ZpJ40ExrOIRRqZoOEUhg9uFo5VnEOOJ6wBdDbh0ofRBaOEV9q16
	 qf+W7FQNzzeP/m0PtUnKj5f/+/TgOCZfVXCqH4OH6Aa9UIAc4+0ro6ix/YbT7abR4B
	 mDV7vp1pzUlCZK9y+iMRvpSKdQ5OgIFpDF+TGFCMMuZCvdKAETsp6ej+MLy4lo2NAL
	 FyDCjo/c/pe5A==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:49:29 +0100
Subject: [PATCH 11/11] mfd: wm8998: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-mfd-cirrus-maple-v1-11-16dacae402a8@kernel.org>
References: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
In-Reply-To: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NAAL9Cd9YIcAIGI/oTRPpfPZFpmQ19Yext7FFN1qesA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0sSUK6GUm1SA77YVeouv1BM9WH7FnHOBije/
 VO+P9nAOViJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9LEgAKCRAk1otyXVSH
 0ME2B/sECtbivU8s3ZNLb/6jhWEvB13cx5Gyq8KBtvp73i4sPYrPWiizG3LkwnvUBCnnzZdjaam
 QPU0ERspR6MlM3Ekk3B2WsicAPAT/jokxi/CJ7lwcVZ3HkwJYRSJXvVJLHKXnM7X+mBN7u8CkNx
 re13PMjpK7OQUpmWbqLTHloL5U2duhYJ0qGwAiAAQRhCm24sygRteeD3VBx8ZZ45jO9xR9Hp5aV
 RjZQ9i4gsTXQqsoJzgv9GWZyvsZzkiYdb/JEzlHST9G3XRIlFErz0naMfD8M7fUT5kU3M+1rAFG
 8203RJ7yo8wR6TwXXhU19MFPkiwsTPeLj2bJV3aJMHAaM8Uy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 2GTKBCBNPXTPXXTMUORPAS55CW6JU33O
X-Message-ID-Hash: 2GTKBCBNPXTPXXTMUORPAS55CW6JU33O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GTKBCBNPXTPXXTMUORPAS55CW6JU33O/>
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

Update the wm8998 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/mfd/wm8998-tables.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm8998-tables.c b/drivers/mfd/wm8998-tables.c
index 9b34a6d76094..b3e6e85bee89 100644
--- a/drivers/mfd/wm8998-tables.c
+++ b/drivers/mfd/wm8998-tables.c
@@ -1556,7 +1556,7 @@ const struct regmap_config wm8998_i2c_regmap = {
 	.readable_reg = wm8998_readable_register,
 	.volatile_reg = wm8998_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8998_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(wm8998_reg_default),
 };

-- 
2.39.2

