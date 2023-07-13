Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5D0751524
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:21:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AF7A852;
	Thu, 13 Jul 2023 02:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AF7A852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207667;
	bh=TiTPhvZo9N7KpTy/6yr36XNtiQICsBYSYQYcZGYusaE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oWRapOzfoLuOz0HpsZGgqYnrL5eFSjRAgJ7WA3V+HnMtOGscMnbjCmRiLyX7Wvo8L
	 QwD1Ouajcrz4sVT7ip0KuQRJkXo+AGwtEL3bADclhfvdQG2Q2Z7VK6gWjac0Ty0E5T
	 QtCJ1cv+6R2i7UAsfGx01vlUgBbIK0YKmYmg07/c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37598F80679; Thu, 13 Jul 2023 02:15:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76E68F80671;
	Thu, 13 Jul 2023 02:15:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D68E3F80620; Thu, 13 Jul 2023 02:15:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AD05AF8061F
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD05AF8061F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZLIZmFxn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9DFE0619B0;
	Thu, 13 Jul 2023 00:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B564C433C7;
	Thu, 13 Jul 2023 00:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207311;
	bh=TiTPhvZo9N7KpTy/6yr36XNtiQICsBYSYQYcZGYusaE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZLIZmFxn13T2Q4rbPZ4V1KtfDstakDp2ZZIjKMERVJh25OM8YTUiIiDBQmlBfKzoS
	 WnDelLrP7g7RDoJaz5e6QVhxlxoCbnorOwMNwZJiaHcieD2E1D2DAOm4gATKELrX0s
	 9Wf5JCsn9R9rinNmqEuIhYlLUi8bpkbmhjFuy8nuV/NSVpA7RhKGjvdDAK8oLW4P+T
	 /wxVbkxQQjEPD9Efl/RE+FvsXH9pljSAM0G4jDSYs6c7Y6cMS8bgHQ0G7z9k08T5Z3
	 Fb9Ky5XjvC0+O/Ntia3h6LWnjmiLlaPtrQJNB03WrhtC3NV0AIAjK26PV+5RgwohYA
	 mTw9Ox+5bn2mA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:33 +0100
Subject: [PATCH 20/48] ASoC: wm8728: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-20-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TiTPhvZo9N7KpTy/6yr36XNtiQICsBYSYQYcZGYusaE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G7u5BI+tJ5Ub4Xug7RQQVHSuL0cZDZUt+Jb
 9xHV/TsmjyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BuwAKCRAk1otyXVSH
 0CmlB/4unZk7Z9R7vZbdhKNIBMoupK2dVrDm2ak7Er8Gi2ATXUML2QtICoEAmhYOEFs/yBEGnWZ
 heu3LrAHz77UMTRpSGbDF+RVEZiBqdH2+o1a+O7lX4OWPNNt0iBhmVmp+pVS+qN7m53ruj1hrR4
 8q/aC9aS3InVgJhyUYpJVekzVF/fsnG/edA878GlucE6GHMP2hIajJTIA8f1p2ev8YNj9lgUWYc
 +L5Xxt0NVkymaZZwdC45YVzBgGACV9IrJQuITnvN0JkBxFlUUFxlQg4aU0ZG/q0gc1gkr5Y/VH2
 5/cJDKUWYBTGH42Lh5e3mZiu5xKgoLLvO+cACg5XlXL5Cn8T
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: X4UKKS24BYW7Z7ZUFEEJLDTA4GZBSLMV
X-Message-ID-Hash: X4UKKS24BYW7Z7ZUFEEJLDTA4GZBSLMV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4UKKS24BYW7Z7ZUFEEJLDTA4GZBSLMV/>
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

Update the wm8728 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8728.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8728.c b/sound/soc/codecs/wm8728.c
index 5ea6d8fd10f6..0c943e7d4159 100644
--- a/sound/soc/codecs/wm8728.c
+++ b/sound/soc/codecs/wm8728.c
@@ -236,7 +236,7 @@ static const struct regmap_config wm8728_regmap = {
 
 	.reg_defaults = wm8728_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8728_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 #if defined(CONFIG_SPI_MASTER)

-- 
2.39.2

