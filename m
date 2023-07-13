Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA26C751509
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:16:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 559FB843;
	Thu, 13 Jul 2023 02:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 559FB843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207372;
	bh=8ohZ1X7AV8KGhMNDSGBLEz4dloW867isYn4qGwQfdSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bqdDBYiTt/HbQdF4jSWX2wYwTlEZkgPtAke7N7RAfn1OZYSG0wN/oZAhb/LNKeCrb
	 r9uYjPQqyOuzbUZURvtruoCsnuTatrYNCaHCXWvDusdyzVNfCXhwTTrcztQ0bouFA2
	 YduFlpKE5nR1M+FpYN5YD/arj+VTAFboM2hvlOBM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEC4EF8047D; Thu, 13 Jul 2023 02:14:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE4A8F80249;
	Thu, 13 Jul 2023 02:14:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99828F8027B; Thu, 13 Jul 2023 02:14:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C251F80236
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C251F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BAhqMCRC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DDBF9619BA;
	Thu, 13 Jul 2023 00:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACD0C433CB;
	Thu, 13 Jul 2023 00:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207258;
	bh=8ohZ1X7AV8KGhMNDSGBLEz4dloW867isYn4qGwQfdSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BAhqMCRC+2nV1d57JTmK/eFyRNrWQLAGrqQgbTdBBT0cJSl/MJc0k9tnSs0n3ZXqu
	 JRk5+SSG5WVUw77TcWtyTZCqaWj1ztuy3/7geSxyAbgUCTmDXm7UmwjlQhAw7sAVSy
	 o2j5CcvEg55JjD1ZSfODo6L1LvUhEimrzwfGH+nh6EJT7x54oLU6cbADDKzXsWTLPh
	 ZlKiWWYDkciX5DopuODGR5XbFYMrPpNUO9DkyEUL3ukx4IKQfRVc0dADE9FU/0tN98
	 lSR0l+tslD+fuBlXkmXJBrHsps6hFuCN2tYM+P7fOlJISzl8ViGTycOC7dROa17B2G
	 3Ylav2thsokrg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:15 +0100
Subject: [PATCH 02/48] ASoC: cs35l41: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-2-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8ohZ1X7AV8KGhMNDSGBLEz4dloW867isYn4qGwQfdSk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GtQxPQOqxDv5bMKTlSywvq2EII34e9WwSlx
 bpQGTRx4AqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BrQAKCRAk1otyXVSH
 0Bh8B/4okseypC9+hjTC+xP1T2L3LwelZdW8WY1S/RaqYrury/RWxdNOZ7vGaYnfzqCuyyV7ouS
 llCGYcFR52Xb+u5vD9ebeqaYe7ZSas5HWBSpQPzBBv0ZLr3HnF43QeDYQxCwCySXrRgVP4WW0k9
 QqvPIgJ4uokQglyHOOVLUPnjOfQZoMoLgZ4U6rkAofeHqm4OAOGXjWe/fA4WeLznvA0G+yrS+2l
 W/bYOfNLlZUB1ulhR1h8EdlKYzyMTY9s2hKWgvyXscPko4WQm7n7WBAaAqe9vLEu/JEf3Nt43vC
 yx5Iv5H7Z5iJOAc2DCOm2HY/B/MBl9waTuefzC98UEqRrtqM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: CRPRV2BC76RNSYKGWLKH7WAB6LAOGAED
X-Message-ID-Hash: CRPRV2BC76RNSYKGWLKH7WAB6LAOGAED
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRPRV2BC76RNSYKGWLKH7WAB6LAOGAED/>
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

Update the cs35l41 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l41-lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 1e4205295a0d..ac7cc492bcb0 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -743,7 +743,7 @@ struct regmap_config cs35l41_regmap_i2c = {
 	.volatile_reg = cs35l41_volatile_reg,
 	.readable_reg = cs35l41_readable_reg,
 	.precious_reg = cs35l41_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs35l41_regmap_i2c);
 
@@ -760,7 +760,7 @@ struct regmap_config cs35l41_regmap_spi = {
 	.volatile_reg = cs35l41_volatile_reg,
 	.readable_reg = cs35l41_readable_reg,
 	.precious_reg = cs35l41_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs35l41_regmap_spi);
 

-- 
2.39.2

