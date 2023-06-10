Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EEF72AC16
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:05:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1644D850;
	Sat, 10 Jun 2023 16:04:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1644D850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405925;
	bh=TgZ/XcI0B7PIf6yRiA3WNK9+MrAYADijA4aYVK9bGks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R3Gw8qz5B8AKqEIlkFpZPpur70oGyxQ+4xc6pXAgDUWucvSl6UxQ/991y7RIWpuol
	 x6GhoDfzRg9Bsc+V2lbnPynoW7y88fY+qKcgU2yfQziMYTe+DGI4BOsqHT18ImhGf6
	 rwlFyQJHh09nHFEugriuuFKbK7tWOCBX0g2++cac=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCE0BF80686; Sat, 10 Jun 2023 15:59:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1589F8061B;
	Sat, 10 Jun 2023 15:59:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4198F80494; Sat, 10 Jun 2023 15:58:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 31435F800C8
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31435F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lc/NXDp8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E3D9861781;
	Sat, 10 Jun 2023 13:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEDCC433D2;
	Sat, 10 Jun 2023 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405499;
	bh=TgZ/XcI0B7PIf6yRiA3WNK9+MrAYADijA4aYVK9bGks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lc/NXDp8nuYUP21eJFWC3bCmtLlaJMukRVGAnk7PUmRiSNRUd2u+ck4t36FzdAtM7
	 aQBcNE+kuMAqnV2F0mGdQnC2FhHv7yO7u7a6Q2msqWi04ujeTWbrbjXLsSVODK3ug6
	 nAa3+iLrEQH+XN6LBhhzfq4VI8RF3nx01I/kC/G309pVnCd7QgtcoWVkjoHem4N/RI
	 4HjIQsJQeKBz0pMtLcAygFoRWXkTxzllhKBkypjsb8QjBWrp3GgOUQHPYkXVrNlJLx
	 S0McQGMANiZdyUOXbZx+bj3IBmC4oAD6WPsO62WYKxYVmypSlNethQ+BjQXthcyG0c
	 tfryNQeDqls2A==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:57:56 +0100
Subject: [PATCH 10/16] ASoC: rt5651: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-10-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=947; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TgZ/XcI0B7PIf6yRiA3WNK9+MrAYADijA4aYVK9bGks=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFnx65irtGT3dMx0lqtTh7lEi7EXBF23Yrc5BTh
 9yq0+w6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBZwAKCRAk1otyXVSH0FhiB/
 9VhoD/ja2BEDTT3SNU7xPpp2tsMrIeMKgbR8nToSFKv+Jk+7VskCn+f2A5JW6fr49VEAduIXGPrnYR
 sajNHhcfIZRbJQDs961utYUdPGKXugua+hjjg4yEm1BGZDGtP1rbH+QtQleXGicpt1ZJINg5ADNNK6
 PwzaC3FDZYKY6hQCAgv/SeylS7xnUIsQimWeOUDlYkdrc/ZgmXez7nI+/++ClnL33sFk9E0OarkzgD
 MtjfD2q2dzNg3B/l1RP1CBhKkuHFl/3IByvw9iEG5zkgYmi2tZA8rQzWA4dc7tx66biLkw6unDSHtS
 R5lXbyLJD0NcVMIbYweCUh66blBA28
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: XSQX6Z6EBG2DWWC5RF3H7YFYVMBYHZ7W
X-Message-ID-Hash: XSQX6Z6EBG2DWWC5RF3H7YFYVMBYHZ7W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XSQX6Z6EBG2DWWC5RF3H7YFYVMBYHZ7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5651 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5651.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index df90af906563..bf98fdb66cea 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -2172,7 +2172,7 @@ static const struct regmap_config rt5651_regmap = {
 	.volatile_reg = rt5651_volatile_register,
 	.readable_reg = rt5651_readable_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt5651_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5651_reg),
 	.ranges = rt5651_ranges,

-- 
2.30.2

