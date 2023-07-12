Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CAE751458
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 01:17:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2849FAE8;
	Thu, 13 Jul 2023 01:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2849FAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689203849;
	bh=maeyk8niWnAULCMV0FtXrXZznstBI6OwjQVjqc4uEYk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mnKN89KYG59pBqQlx/eOvhhpCfymUU2pTaw9iMBeE9CgazSk5dSGFpYxyVg8qgafl
	 5RA+p5bLd7c3S2o0rKiFdWiEemPmCzu0b1XVsvVZZD9A4IoNdbUoqVZT793bTmzNPK
	 j0D7WlpMu7wpWwzg48EmfyzclBSpenN4wI/6aWCk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D103EF805C4; Thu, 13 Jul 2023 01:14:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 422C2F805C4;
	Thu, 13 Jul 2023 01:14:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F10AF8057C; Thu, 13 Jul 2023 01:14:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B1580F80568
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 01:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1580F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mfPSQfri
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9477B61987;
	Wed, 12 Jul 2023 23:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5C4C433C8;
	Wed, 12 Jul 2023 23:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689203663;
	bh=maeyk8niWnAULCMV0FtXrXZznstBI6OwjQVjqc4uEYk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mfPSQfriX5rZDjSOqd+inssI9AYvJXrlboAL80eucCDW32Hw4Q2YeY2Wcr7svsb4r
	 bKrnM/X0a0ftZBpLH0KefzpkGqmGlXGhD2TDpcYWeGjrfn5CG3U4gn47bK6ZImXqqm
	 /ZVIy5yGbw57oKhDRBYjLXQO0I8nYvejoWDgK0hCzLnw30iPcCr0v82g4q+7nm89dX
	 BTQPU3ZilWPR7OUqmA1xDcEI9eFZ6BRpuMHnQ27vHRvkoo8l6GeDybkRuHWaTsbu7a
	 uP1QgNwFaWvrlJmJ8tLXd5WRbT6d0BMUZOInmTQTu9MZvlsNuSDP+cV2TnEadceWHv
	 YKQnagZVbPrHQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 00:13:56 +0100
Subject: [PATCH 07/10] ASoC: adau1781: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-ad-maple-v1-7-7d2f35d42b5f@kernel.org>
References: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
In-Reply-To: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=maeyk8niWnAULCMV0FtXrXZznstBI6OwjQVjqc4uEYk=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhpT1xjuapwooPA3U2swTbvvmtOAWvpuVmaKHthQIHObvq
 dzEY9HayWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBMpPEOB0Ojd8hD7bwc0Sm9
 yvXmnZ8YXPpqTTwT/A9ZrncUYxbMudi3+tGzL8lMj0OnX0iKnLQh+b6OaNj32zdPrQheqf7+zGT
 HvdcETrtXCPQyzdka27+Dyay41vu9bFvy3sDcIr3wb2s2OnmsDZ2wre/cpvIFHEwlV+6F5m82V2
 hKunEnrpnx9FKePPutnxKnfPD7vsLnx/kcXZa/dzN6Lvd+TMj3S304X9v63f5ws70sm8yOBIvuO
 rJwzcrHvDcSJgp7+bUu6q538efjbtTU1nb/cKRgV8eK+Q2N7yt4VRb5uD4qucxinSBdUtyt6C7p
 1SAXGF/6dXdFdI/k4xCtUA3NuFd+javfNVoJRhfr6lYBAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 4Q5TEX6SFPUUHVD4EN7B7R4A56IT6U3J
X-Message-ID-Hash: 4Q5TEX6SFPUUHVD4EN7B7R4A56IT6U3J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4Q5TEX6SFPUUHVD4EN7B7R4A56IT6U3J/>
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

Update the adau1781 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/adau1781.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adau1781.c b/sound/soc/codecs/adau1781.c
index ff6be24863bf..faad2f9f8dd2 100644
--- a/sound/soc/codecs/adau1781.c
+++ b/sound/soc/codecs/adau1781.c
@@ -472,7 +472,7 @@ const struct regmap_config adau1781_regmap_config = {
 	.readable_reg		= adau1781_readable_register,
 	.volatile_reg		= adau17x1_volatile_register,
 	.precious_reg		= adau17x1_precious_register,
-	.cache_type		= REGCACHE_RBTREE,
+	.cache_type		= REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(adau1781_regmap_config);
 

-- 
2.39.2

