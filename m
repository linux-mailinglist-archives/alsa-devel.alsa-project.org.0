Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8917510B8
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 20:46:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D45A84B;
	Wed, 12 Jul 2023 20:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D45A84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689187610;
	bh=UoXubORJ5yn/aSNS+OJ9O9xDFbo29xnIP5/VE5fSvxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Oere/UJY3qgly9HcpoTGHxpbqzz3hhipVmPNbsnj0jLRK8X9Mmmf8pTweosCHkGjT
	 RcTf2/t00QamVezlsDRjAWw5SPUjmlScy23Ya/NEkdIUlSH+EP85c0SHbKgRoNgswm
	 lGPAYfFcp20l8G3p3d7J93a1XM4Otc4ZAmS2sHKg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF628F80579; Wed, 12 Jul 2023 20:44:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5264F8057B;
	Wed, 12 Jul 2023 20:44:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C84CFF80535; Wed, 12 Jul 2023 20:44:52 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 052AEF80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 20:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 052AEF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iqKWETCA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ACF37618D8;
	Wed, 12 Jul 2023 18:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F534C433C9;
	Wed, 12 Jul 2023 18:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689187485;
	bh=UoXubORJ5yn/aSNS+OJ9O9xDFbo29xnIP5/VE5fSvxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iqKWETCAd4I2XrKCJwX/Y2MNCQk3n+sPobNizNYrgKhd0OL/ktyiitzJOslCamEFb
	 fGYU1WxBN8q9rsGoSHxnDPEzS4IIlB33I7dIYwggGMj52PlssNqhHq4asndB99ldZN
	 BNjowo+3+uUNnBCwPuEALM6ewcekSaUiHV7rQmTLoWf7tY/LDc9/iVYfswLvcxHeDt
	 0H8nWyvOz/3Q+ZXcDyzLiUzYEeGqbofek2nTMdhQ/ZZmH+vTeHDw9qn64SCIJDVCHc
	 XxCqXz2Lc/2FaBAJTHJbLMX3vfDoUzA7hz94ZSW2WHrVnenTdBzwrNYo0mTFBfZxrk
	 vrud5FPjs+jAQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Jul 2023 19:44:29 +0100
Subject: [PATCH 3/5] ASoC: sta529: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230712-asoc-st-maple-v1-3-46eab2c0ce23@kernel.org>
References: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
In-Reply-To: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UoXubORJ5yn/aSNS+OJ9O9xDFbo29xnIP5/VE5fSvxY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrvSUR5PHdB/Wfvqs5e8WLFN4QP3Q7P5+WQMF4
 XtXLQ84jvaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK70lAAKCRAk1otyXVSH
 0GEbB/9YjQM+CjIvcA4vHjc93iY4HnA/4jEvHE5Yv9axb+uhX89Em2pO9t1DgLj6c98PsHVrisK
 MyQLOuMYQklvdDWuJ4DH4JLzWCCQUsW5qRCbxnZW7JEPe3o0hyX+pdr9QqNe1fmJ22vJtwNWeGc
 u6mFRVAaUQXEDaf53Dc1ts6WNhbVmFwpXFKNP2m5rxwff8EeiK1aftxoUShW0QFLHWzNFRmxq0c
 1p0nc1ZwRj+KgU35fZn85pyposo8yKIGpbWbFHx2izzTzhrwnRxYUVDOcPm67YHQdrbJOaQsphw
 gm6acPB7x7jl9gXcSLmQ/SYTMcgU4Onu6mv+bynW3Hmb/hVr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: GMW2DDMGXPM6E6BHZFW34URQGXWAYPE3
X-Message-ID-Hash: GMW2DDMGXPM6E6BHZFW34URQGXWAYPE3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMW2DDMGXPM6E6BHZFW34URQGXWAYPE3/>
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

Update the sta529 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sta529.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sta529.c b/sound/soc/codecs/sta529.c
index 0ac08478ddac..eedafef775e5 100644
--- a/sound/soc/codecs/sta529.c
+++ b/sound/soc/codecs/sta529.c
@@ -331,7 +331,7 @@ static const struct regmap_config sta529_regmap = {
 	.max_register = STA529_MAX_REGISTER,
 	.readable_reg = sta529_readable,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = sta529_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(sta529_reg_defaults),
 };

-- 
2.39.2

