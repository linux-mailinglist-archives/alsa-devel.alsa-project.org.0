Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ECF751515
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:18:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E9993E7;
	Thu, 13 Jul 2023 02:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E9993E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207526;
	bh=LF732ejLVHu/dBbKR19LX+OhhCn45u5YVe52e1U6Y8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rDyqg100xLWjTiWmS7upVXajrRLWTZ1epzo1Tpvuq6JlMm8ElutaTStc2LL0pztyn
	 PpAS0f1TfOdawVmccj0q2UX46nTmjDUisKaC7daV48jaNLKVH1M5v2Dc3HGNPWi/UT
	 9nb8I2lNfA0dSncKwZLsYFbA70HeaZcUn1EtDSaQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D716F805FF; Thu, 13 Jul 2023 02:15:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CA5BF805F7;
	Thu, 13 Jul 2023 02:14:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0C56F805CA; Thu, 13 Jul 2023 02:14:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B26BF805C9
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B26BF805C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nWH15L2V
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DBAB61987;
	Thu, 13 Jul 2023 00:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AAFC433D9;
	Thu, 13 Jul 2023 00:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207284;
	bh=LF732ejLVHu/dBbKR19LX+OhhCn45u5YVe52e1U6Y8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nWH15L2Vwy3athL4B9FOigRCGLjLZjUwCDCWqfrKwOmOUKbEnKZCobWdN5uLeB8gu
	 vzohQx7skZQcD1PZ0YmvXr7NkIO6ibL9lGkUUr1pS1aEKR9HQ07qGUXU9tRxmR1yst
	 htxzoDUyJ4Zxly4R4YBW3beZB0yRoMVTB/utmIbP6q1PSAfsyEKEx07aG9PhEOvx2A
	 80kBhnfJ4i6qbVzeqe5HC/3/AhvmpIVUonrXtJjTta2C6qcxd3J4nj9kKvqe6JPi9n
	 1eg6+1Krzbqy4eQKO3u7yVn0dIDaQW3Bi9lQqptNn+SuQJB9jd+bs5iDg5S9BIwIOg
	 0IXuHW4Y2PH5w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:24 +0100
Subject: [PATCH 11/48] ASoC: cs4349: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-11-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LF732ejLVHu/dBbKR19LX+OhhCn45u5YVe52e1U6Y8o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G0WUaLlpt/t4HbR5aDE5bidvBZ5MBKaKcMo
 6VDJUqhbIKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BtAAKCRAk1otyXVSH
 0F3oB/42goyDxs+262yaBy+M3jXXhWB5tRoaq8XUQ1pA/aWHZxp4fcES3EB73ifsBu5aRxHNXma
 WuTrZuajCCMAAGVt4OLq6FN9ZwHqz+dLiYNsi96X9pPpt/ktjNW2Nje03grixMdYsD11Racl+HX
 wAvgch6W6bMwak0ZwP0W6w6AYUu5IckcSIavqEw27uRVQAvFYiMWpUhilgfd356wLxyAvY1F+zu
 5Dt7D272+bFhg8lgayLLjCmrrd2f1e5EZNcYRiknUcSMsCn9qqySiAcN/pl8GSQlTwlrSxvorpc
 ueWn/nUffdX4chLMHmEj+XDkyYs6cg7EVKdF7V5lrD/Jmy4g
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 3A6P5TF6RRR55BDWK7LTIV3OVJQ2YMDZ
X-Message-ID-Hash: 3A6P5TF6RRR55BDWK7LTIV3OVJQ2YMDZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3A6P5TF6RRR55BDWK7LTIV3OVJQ2YMDZ/>
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

Update the cs4349 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs4349.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index 8365dd0ebe2a..ef08e51901b5 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -271,7 +271,7 @@ static const struct regmap_config cs4349_regmap = {
 	.num_reg_defaults	= ARRAY_SIZE(cs4349_reg_defaults),
 	.readable_reg		= cs4349_readable_register,
 	.writeable_reg		= cs4349_writeable_register,
-	.cache_type		= REGCACHE_RBTREE,
+	.cache_type		= REGCACHE_MAPLE,
 };
 
 static int cs4349_i2c_probe(struct i2c_client *client)

-- 
2.39.2

