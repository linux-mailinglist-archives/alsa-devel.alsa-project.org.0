Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F81072ABFD
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:00:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91398829;
	Sat, 10 Jun 2023 15:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91398829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405639;
	bh=aO6l7W2k8vRVp8UXQjs9XEtX/vGIVtPaT2lmFllEag0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YT43kIJ9rTVT1hk5Gse41TS2hvpLpP0PCCN0UxyL5c9GCxfktYD/QUVhcfIrQCA3d
	 TNEOJsTWb6He7Es5fgUMqdkle63s5YsA6MFdQwjJrxf1zhpTaXKatYSgXHa43hDAlf
	 cWo1ZppVa96OLseDng2IoWULXWW+RQXNQC7KM2T4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B78BF80571; Sat, 10 Jun 2023 15:58:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AA15F8055B;
	Sat, 10 Jun 2023 15:58:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6CB6F80553; Sat, 10 Jun 2023 15:56:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07FBEF800C8
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07FBEF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jGy8t2KK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA4C2616E0;
	Sat, 10 Jun 2023 13:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F8DC4339E;
	Sat, 10 Jun 2023 13:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405405;
	bh=aO6l7W2k8vRVp8UXQjs9XEtX/vGIVtPaT2lmFllEag0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jGy8t2KK6l/pxkmWIgxgMJqTE5CVzXNYZIk/kLDw2qXfS+qDQjwWJhT2jl2AY3WFf
	 t12kKJcp1D9pEyzVrTTeQf9YtC94VgrJexndfnhqeUlkTHNHtcLawv3yg0HO4+ZdUV
	 J3WsPHybTt3VLXDZ7PEWaQtUQp9Rh5HwQ0LLwB4TrbgYft1kEKg/rugITuzxDtjBqd
	 mqRXWJvJnKVmgbfzOV2jkfB+hqBji3byiXfjJUlt8aFeeeZ8J/y8VWH9oBYe2u1+UV
	 5E53GSWKy+4gCvJgT9rk0/gqDVj/YjcC9MWW77nI24zvrElBT/Ia4JmCAOHVgXOAAA
	 NtLYjZ5tGETHg==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:25 +0100
Subject: [PATCH 05/10] ASoC: cs4234: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-5-b806c4cbd1d4@kernel.org>
References: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
In-Reply-To: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aO6l7W2k8vRVp8UXQjs9XEtX/vGIVtPaT2lmFllEag0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIELwTk3nTZC+g8HKkLZPUQYUQFymN+RjhtnLbwN
 pNi+5Q6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBCwAKCRAk1otyXVSH0Jt7B/
 4kIsBkFWcGaOkB5VUBzvnBDoU7ZW2ON1seKWImWVEOIMXoru/wMZ4VAKBK4qzz+AWDsd54qfz1N6V2
 349MTORrK+anNqjcT0hQkDSKAF/h5MEMIPRbCEnlH8xAhn+bPLni32zezlZ7jZviUZWjy6PPEYzLhe
 MfEahYrNuKLVxtxx9vs5vLMAxwfDJoc5YRNudjEiLGbmATi+JBVmS2Kp2pgrp5vatAgZ5vhrMwArZd
 K+9p1VlAdzRfdh8dSQidEnqEMJKDxuLGMwnrqryMSICsvuwns0VeOgBp5KEGQoVQ18kAW+efvsVP4A
 9xPGNmrm4SUHDecKSdJzs9E7mSGvFr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: BH6ALMXDXGZCQQYUHXHIKJWENNILI4FV
X-Message-ID-Hash: BH6ALMXDXGZCQQYUHXHIKJWENNILI4FV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BH6ALMXDXGZCQQYUHXHIKJWENNILI4FV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs4234 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs4234.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index dee1a6662c2e..e1d64e0f28fe 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -675,7 +675,7 @@ static const struct regmap_config cs4234_regmap = {
 	.writeable_reg = cs4234_writeable_register,
 	.reg_defaults = cs4234_default_reg,
 	.num_reg_defaults = ARRAY_SIZE(cs4234_default_reg),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2

