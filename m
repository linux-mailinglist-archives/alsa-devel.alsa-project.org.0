Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D4F751541
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:26:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 693DEE93;
	Thu, 13 Jul 2023 02:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 693DEE93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689208016;
	bh=xtGOnDRcTXT8WVLfFDqPlV+MGAGMWphSd3kDQNybOQ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ggv/LkFo1NSJT9whTI+gvyGuYHGjH3CcnJ/F9vBL+E5OtYs+VwvRdEsyFxJDfvSG8
	 oiPYW7NWg3/R7bf8x2gLQZygUuuS7wIUwz9VPyk+ZJ7P8D0ZNE1CQEZiLy0+Q+XBdq
	 aCV8TaOa/22wuvveoPxnePf0BuCL34SplMZCmFbY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE649F805C5; Thu, 13 Jul 2023 02:16:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57EEBF8059F;
	Thu, 13 Jul 2023 02:16:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 038A3F806D9; Thu, 13 Jul 2023 02:16:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CDCDF8055A
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CDCDF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AlYOc7Iz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1FBA5619B2;
	Thu, 13 Jul 2023 00:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087CCC433CC;
	Thu, 13 Jul 2023 00:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207374;
	bh=xtGOnDRcTXT8WVLfFDqPlV+MGAGMWphSd3kDQNybOQ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AlYOc7IziRhvD4r7rvKt62HpfVzb8lht5hxhozx9xFPf+CLc/xYs7LvstXxjxVxgE
	 cyhenyqhrKt/9oP+ZYfx5D+QJAAqZiHr+RbGl8sqtSLJAFWRBnfpvj76vh1NrGqHRO
	 0nnqZognlMnmm05D3hwxQ0v/IHtsf5o8+bkjnUpxtWxJBzRc7XUsU9/jGD3O89o0ti
	 +eV+psDe/NmiPP72JYLahiX2FFF5Wr+c5+gjKeTSWEX2EabwUF14jWyWN2Cy3RlXE/
	 V2w5lm9IE4O9Bq/0tTOZFD1r7gVdB3cBWNVhpM3SqA6tQy6twqZMKBRgq6ro8gMTqC
	 nhNG2Bg+LuhhA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:55 +0100
Subject: [PATCH 42/48] ASoC: wm8978: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-42-a62651831735@kernel.org>
References: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
In-Reply-To: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xtGOnDRcTXT8WVLfFDqPlV+MGAGMWphSd3kDQNybOQ8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HMz/ygkyJNys6xhWQ09l+GhBkjtC+IURWor
 4l4Quim9oOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BzAAKCRAk1otyXVSH
 0JahB/9K/b1CqDk1bv/wGg7ndgddwmueeW8z5Qip7okcomLl5nGNjRgbnQQ9FaiRJsJAWtoQBus
 //7Ugfbo2mbN5SbtagDJBJu8vnaO1vC4Z4yHFJ316O/TaQWCKZLfb30meHHxMirhth3FGjSCcEp
 uoh/Yji2Sqxw/8OnM0RyZ/lKkvQPC3olXoabkc/euoPwYMwJXNvBhvVB/gumr1Ep8/HapepPt/i
 EihiAmU0RYX8ukYQdnSoYUUbRVB7vcnbkJmLc5vhqAeC9EF9ihCEXZR9J23qzSZAE8mIi6Gux69
 wMKkVL80mrLVEhfjJ+FHV7WVxVHySC2RAp7zLhr6gWiicbmz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: URU55E4BZGEINH5XVKJCIEWMWRHD4BOP
X-Message-ID-Hash: URU55E4BZGEINH5XVKJCIEWMWRHD4BOP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/URU55E4BZGEINH5XVKJCIEWMWRHD4BOP/>
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

Update the wm8978 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8978.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 5c829301cf4c..718bfef302cc 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -1014,7 +1014,7 @@ static const struct regmap_config wm8978_regmap_config = {
 	.max_register = WM8978_MAX_REGISTER,
 	.volatile_reg = wm8978_volatile,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8978_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8978_reg_defaults),
 };

-- 
2.39.2

