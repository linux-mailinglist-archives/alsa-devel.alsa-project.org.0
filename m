Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A873751526
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:21:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB74D868;
	Thu, 13 Jul 2023 02:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB74D868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207702;
	bh=p9SLiWNYubnGrtWlIFYl6cE2PiPcU8xCW7b12JzI6uM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X/MZN/k9pndchn9GFT4/oN8JdJPMpUn6jGqvmtIX54QYdCTpKdBEu0KWWh/paYB9v
	 wg13xnK3xvvDfm90cCMa6k7TDDhfdXFFGIKDT6RpWWOZaZRb8y/SKuksVZKgC3qKo7
	 a8aGbKdjehb2mmZQbM4y2FeOZ5V5dABAMBDhRLXI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 951D1F80677; Thu, 13 Jul 2023 02:15:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EA64F80680;
	Thu, 13 Jul 2023 02:15:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33946F8061F; Thu, 13 Jul 2023 02:15:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 30EE4F80548
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30EE4F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k4z2Lxjf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 263C261986;
	Thu, 13 Jul 2023 00:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E1FC43397;
	Thu, 13 Jul 2023 00:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207316;
	bh=p9SLiWNYubnGrtWlIFYl6cE2PiPcU8xCW7b12JzI6uM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k4z2Lxjf/3ypfENrAAa7cOVOqeE+LSWlLO/e683k7MVhMvnBOlUoNKVjaiTJ1s4MU
	 qmKcNzoW5b/rSvx4VwhIHeQAZFFyLVsrfrOCDQUrRtYl8/1I1UfAUl0T7nCpeBPzUe
	 4j0+RBWhQyrb+4Zs3nzyD2wZTJfZPqq5KiZB6qFIhPtQIOoaXuNW/ajGZoZEJPQw/a
	 PqsK5li6twVFjVZbro1galG3quDU3f9y3SJkUf7lPTxQJWh3kk23XkLpQPn1Z7r+S1
	 pdxRgA2Zm948J3jyNElkfQu2ebQNGxzqtAobb7T+XR3hjDk3KuXDsaNHBWrriRi1OY
	 oOJjoRu61/mPQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:35 +0100
Subject: [PATCH 22/48] ASoC: wm8737: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-22-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=broonie@kernel.org;
 h=from:subject:message-id; bh=p9SLiWNYubnGrtWlIFYl6cE2PiPcU8xCW7b12JzI6uM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G8vGXaHi2LNujgmogYUKImWYUkQ6VPBE0FH
 JXcNRsj8zKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BvAAKCRAk1otyXVSH
 0EdPB/wKipM6cpFPWDPT/zUco7EGxN0THYKQQfJEu0cDl2h4BeSOuOBAdShsdesfGcajI1hInDL
 Z0LRp9NHSAPd4e4ZmFUAyelkVXiwWVwS/9apxLsAV90gPD2flR6ATQU7Phh/voFMuoADEI3n+kQ
 XZBXnvU31+Gl9cqYBom7l0lXWk6vr65Si5n5yR0uc51pTkcd2V2oIEVGr1LSfdDqNMjoLWYxMTR
 MKQo6rORQrhG3ut5zgU5FdT+ZOoCcH9/xB1UJdQOd5dG8Y/CgbWOTNkotgvpbRVDvCuokmc7pqD
 vgvdbGcHjQYKB+y8//zt2yoP/FDhNAl2BJLs12ykg+vwOut0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: K54MP34EMQGFBB3FGH7OKZXXQKHYO7DA
X-Message-ID-Hash: K54MP34EMQGFBB3FGH7OKZXXQKHYO7DA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K54MP34EMQGFBB3FGH7OKZXXQKHYO7DA/>
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

Update the wm8737 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8737.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index 9f4e372e90ea..0d231c289ef3 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -599,7 +599,7 @@ static const struct regmap_config wm8737_regmap = {
 
 	.reg_defaults = wm8737_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8737_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8737_volatile,
 };

-- 
2.39.2

