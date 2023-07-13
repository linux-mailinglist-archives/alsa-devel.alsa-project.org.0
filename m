Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7793275152E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:23:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9203E0F;
	Thu, 13 Jul 2023 02:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9203E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207806;
	bh=ouZk4wc+f1PIp4ij66/IcUE3AAmg7eKbHKCNGiU5Pf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qTqCCDrSrNY/l5kvx99IAu/ReUO4xLM49rAxL2GajCLLJCuu23phX4JwKz0hvok8N
	 USJQThaNKA0XWweKUJvUoUCHRasFtuxmK5Q7byjoqOXu7QhXwQpnoECRQbk/YbYgs2
	 7sFfB8KFPzvz0G/XX0PkVvQgIPTs3M4gQFtPJeVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DB39F806BA; Thu, 13 Jul 2023 02:16:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1385F80588;
	Thu, 13 Jul 2023 02:16:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8287DF806A2; Thu, 13 Jul 2023 02:15:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A4E2F80682
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A4E2F80682
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tqKj5fDT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 121CC619AB;
	Thu, 13 Jul 2023 00:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C8AC433CA;
	Thu, 13 Jul 2023 00:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207333;
	bh=ouZk4wc+f1PIp4ij66/IcUE3AAmg7eKbHKCNGiU5Pf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tqKj5fDTQBC8Ah4pEQBT/mQQ2KiWaWYkzp2sGBAWcxfGPUgLXIxJt7iK0xgGpj2I6
	 i3zxAzqH9JXJtZO9PpMxTpgxqyNw5bhaAzr0Dy5F8RIeWRLHkKrevgGCXRNfW6QcS0
	 gPzFc7Z/lXLe+GOftQceEeJVV/JPHqLbZY3bK25nslGD11+Xv1kNg7NU3Tu5LxnQTp
	 KNWTJVjCbGLA+AJW/d0QbHnThijStlol+SltE2DsC8f82S5696P9jx7/ZGN1VA3Slo
	 Q0AdZUbhvIpjIDGVNtGmNixg2rUJpnf6I2tZHsHwDLkjW79urJCIs6vFCac2Sxg3lC
	 T5D7oVaJ7GeDw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:41 +0100
Subject: [PATCH 28/48] ASoC: wm8804: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-28-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ouZk4wc+f1PIp4ij66/IcUE3AAmg7eKbHKCNGiU5Pf8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HBjo/wcEmoFBcXY1w6KGWDknQfgXgkwG280
 HMfK8DrVDSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BwQAKCRAk1otyXVSH
 0MazB/9JXh/xnUzb4zBWrVG91FWymTWN5gYMKLCKMfvqibV6rRSDJD0StgawIlWSgtLBpKbfKNq
 imx6b1ahZN94vi4i7O9QJn3J3K/2q40+lGUO3SICpa0Bplu8d46Qra5P1VtzxsMliepEyRGCLqZ
 uQtaTKGb8YqkU1YUh6J0rkcKnwpbbSWeNmJvXwJjrw5qvvhNhkDbW0hN5BetihW+MebW2/R7veh
 wgHY03k2d2pAXr9voLS9EJF/kaf3yvJYb2o7eteSnGfo6TiY87O3nih05rCiCLithViwr1n/dfq
 e0aCyHUOT0xr5t7tMbIPuAH9wcF1IecpfBJ5zphVPoDcICIU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 5FMJKQQOYTSI5THISI3QFH7R2THGECOC
X-Message-ID-Hash: 5FMJKQQOYTSI5THISI3QFH7R2THGECOC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FMJKQQOYTSI5THISI3QFH7R2THGECOC/>
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

Update the wm8804 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8804.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8804.c b/sound/soc/codecs/wm8804.c
index 0b234bae480e..bbb4b6e3b41c 100644
--- a/sound/soc/codecs/wm8804.c
+++ b/sound/soc/codecs/wm8804.c
@@ -555,7 +555,7 @@ const struct regmap_config wm8804_regmap_config = {
 	.max_register = WM8804_MAX_REGISTER,
 	.volatile_reg = wm8804_volatile,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8804_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8804_reg_defaults),
 };

-- 
2.39.2

