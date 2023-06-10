Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 757C772AC13
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:05:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A08EA4A;
	Sat, 10 Jun 2023 16:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A08EA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405901;
	bh=34DJvJwCJ6RKCwvwPivXe9/DPo1bQ8SVcA0z4ZUfzKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cf1LNJwV3+vuN3xjKZIjf5KWwpktLoxvZxkzIbPG4YpsqAlOz667vNzl1GCkIHlX9
	 xHyk2+7oMuERA1sE9APs8kwu9Wf4K+L1QaBtTh252Buib2B6KGgrpaGA2t9l/roOz3
	 jiWUtklmHWxPI6+nRBJlCxz8RAqAsxkvQfe2bg1o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9042AF8067C; Sat, 10 Jun 2023 15:59:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F366DF80651;
	Sat, 10 Jun 2023 15:59:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1967F804DA; Sat, 10 Jun 2023 15:58:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E5E5F800C8
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E5E5F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ht09s/KI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E29AE61780;
	Sat, 10 Jun 2023 13:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7B8C433D2;
	Sat, 10 Jun 2023 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405503;
	bh=34DJvJwCJ6RKCwvwPivXe9/DPo1bQ8SVcA0z4ZUfzKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ht09s/KI7UjjQcIYU0xew2UylYXEPnGB94ntK3WkzwYK0R08+OdOHw0u4jSrsueP0
	 q9M6mbZEkrmYPNXZWBRoab8oEEx/tWrfq+xRAVte6oSO2wqjDlJAVBbHFnzC+vh1Jq
	 yk7qeW4/nIJaTxX/hWcx46EPmpVijYdA/0EnW+qcweCXVX2XVsMxgEiiywnSVm9dNE
	 HYXA/+wbiSgGR+3tLPvW1Wml5LHP0MHD88Fl4hr0Pjd5erDDHvLN2Q05av1x/FACl+
	 kAXrPuhRWDkAqEEuSlNLGg6Ks3LW83xDVuhaL2IcNdnBHDvaUg7BzBpp6LIStzelTI
	 ugIOJbRaI63Zg==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:57:59 +0100
Subject: [PATCH 13/16] ASoC: rt5665: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-13-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=broonie@kernel.org;
 h=from:subject:message-id; bh=34DJvJwCJ6RKCwvwPivXe9/DPo1bQ8SVcA0z4ZUfzKI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFpm5h2LD0gU9rZQ/18xkeLzKaBMg4CRo5zln4B
 G5KZ9oCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBaQAKCRAk1otyXVSH0BhMB/
 9UvUgM+D4f+gGiZ9rYz/z8agjTJ5aG2mZ6m6UDDvOsTznEZnR8Yh2GyZlSYqzLlFOi3B5loWAMmYwE
 0RiFkFXBm97C+lzHYu7b7dizgfV7/O++EGo21AeHGWBjbf5YjB0RqsRpmkklsZsNxFfRlaWv6NE2VM
 MOUrjen+YSwZEdFc+KOIoRoedr4NeGi0v/PBZTqdcpEuRge/JQ+XBYllLzoApJ0UqT+E6kfJzB0uBT
 CQBTq/xVMh7DDeNiYUnlSkrVMOq0bA+ZzUuL6vZBVd92GEC8FyUoG5VJq809e/GGAMLQvvOuoVbv4i
 St8OjCIjoBPms96Z6Xrv/5PnAIBTvr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: QKSZE23VCNL42SOLRAKAQUPG4JVNTAXT
X-Message-ID-Hash: QKSZE23VCNL42SOLRAKAQUPG4JVNTAXT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKSZE23VCNL42SOLRAKAQUPG4JVNTAXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5665 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5665.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 17afaef85c77..8301452058fd 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4626,7 +4626,7 @@ static const struct regmap_config rt5665_regmap = {
 	.max_register = 0x0400,
 	.volatile_reg = rt5665_volatile_register,
 	.readable_reg = rt5665_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt5665_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5665_reg),
 	.use_single_read = true,

-- 
2.30.2

