Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 036BE72AC4C
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:29:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 905209F6;
	Sat, 10 Jun 2023 16:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 905209F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686407362;
	bh=+++2ylXebOlFFSJTzoqpxBl6v+A4Msau/zRv+za8aDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RxUXngpA7fsgVxBpTQXgqGpOZQlZIopUxDTqy+Vjmfi71EGSHO/tfKDaIh/85lYsT
	 5bKHbbcZz1OGHI9NP5VaeO0F1CcavUFoVW5+m7RxUijR1kcpbu97YHgw83WCXSwxHZ
	 grHUpai/PEtyRfKKNdFSpcGs/iyqzY0RCOzpqzdE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BB01F805A1; Sat, 10 Jun 2023 16:27:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CE7BF8057B;
	Sat, 10 Jun 2023 16:27:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6634F80548; Sat, 10 Jun 2023 16:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9334FF80548
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 16:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9334FF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OmxH286I
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E15D60DF5;
	Sat, 10 Jun 2023 14:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF931C433D2;
	Sat, 10 Jun 2023 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686407254;
	bh=+++2ylXebOlFFSJTzoqpxBl6v+A4Msau/zRv+za8aDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OmxH286IPmExzybW4yr1oGhHn/nB7M6CKvkFgWtXncjA1PN8hV4AaArYmRJUNzt0G
	 338WxyI7xE8r798puODpfC/D1uH8G80hrfZR7FU8sWW2Ux0oc2nlHXTuRH6V3X3JFS
	 0DKwWlURSJJQFgGGmxYPJCagr2lOw6B4N2OZ3ATLo1hK6c5CplYmXet2WSDYPz9jfp
	 drypULBYuxb+PEQkEGq+GI5BlUH+5piUuKrFdSnEQwQ7dh5czNxKs76qA2pnsoGaBJ
	 TlhKQi1HfP4BRRPKShZ3oDJMLHrOja+CQwks3WR+Q1Npnawc7pf8fea/SKeXaeebiF
	 ujUQm70tpkNPQ==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 15:27:15 +0100
Subject: [PATCH 4/8] ASoC: rt715: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-sdw-maple-v1-4-85ee50c93905@kernel.org>
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
In-Reply-To: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+++2ylXebOlFFSJTzoqpxBl6v+A4Msau/zRv+za8aDU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIhM67ZpGprqmc9qbaBaryHtZbxxCUrqQk2ieeo/
 sgPTPgaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISITAAKCRAk1otyXVSH0DtMB/
 4hXJYJ142flULloteLFrqzvIP9+RbYO+YOUFWyhRiSIhgstWSMoPT0E13mOetiWZ6DkOeEZ6a8YW24
 /bPLFeG+SXuCT0YQ4zxSZBKHiObXtRW2E6YsF69cptH9udkddUO7zLIqipfSISd6pcDXmj8J/11imf
 CA2slogpd65TM5n2anhzAAOet5qLmohDjjl0O/66waJYHh2WGcSE6+hKNt/AmtxkWSNivwyZbUqhO1
 4Zf6wWC1zsLS/1TLwADkXSv7QvqiAbzY4vDG328E1W2btB7aBvfYVJDrE1k/Eh2F3mhW2oVkqHcszv
 JKmi0v++5oAqcgXsxAQKrsWdyetX10
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: XUID3YJWRHPOZXM4UMJYWHZ7Z2BQRP23
X-Message-ID-Hash: XUID3YJWRHPOZXM4UMJYWHZ7Z2BQRP23
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUID3YJWRHPOZXM4UMJYWHZ7Z2BQRP23/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt715 can only support single register read and write operations so
does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt715-sdca-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index 7e5ddce8097d..df10916bab46 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -97,7 +97,7 @@ static const struct regmap_config rt715_sdca_regmap = {
 	.max_register = 0x43ffffff,
 	.reg_defaults = rt715_reg_defaults_sdca,
 	.num_reg_defaults = ARRAY_SIZE(rt715_reg_defaults_sdca),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };
@@ -111,7 +111,7 @@ static const struct regmap_config rt715_sdca_mbq_regmap = {
 	.max_register = 0x43ffffff,
 	.reg_defaults = rt715_mbq_reg_defaults_sdca,
 	.num_reg_defaults = ARRAY_SIZE(rt715_mbq_reg_defaults_sdca),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2

