Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EA7751521
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:20:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 814DD1F6;
	Thu, 13 Jul 2023 02:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 814DD1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207628;
	bh=YyEnQIX2JWZLzjew7wfYcn0E6NOzr1V02Gn3KHhT3fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FrplI6jY6wSbUo+mVuSx/susa3wYL98C6YNhR2FKK3JbPxcnwlyMCq4P9ps3nipat
	 YNy/pjSHZBig4pJqDDfJ8ElQYnC1PihnSOGdflmRoUMEGLPZs+2hMXQPSk6PaIfcXd
	 9ix70GutYsVBUYCrkEH+3+IpDgaYf9ioWt+SunFg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED5C9F8063D; Thu, 13 Jul 2023 02:15:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D06F4F80631;
	Thu, 13 Jul 2023 02:15:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 127CFF80617; Thu, 13 Jul 2023 02:15:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DBFAF80615
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DBFAF80615
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MrN1se74
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D164619CB;
	Thu, 13 Jul 2023 00:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39FFC433CC;
	Thu, 13 Jul 2023 00:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207305;
	bh=YyEnQIX2JWZLzjew7wfYcn0E6NOzr1V02Gn3KHhT3fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MrN1se748SuGocddHkC58K5Jx+cdnv9USqHpV/6v/UxxkrbIqtJgoj3pEyuXspNr3
	 aB61HoWAraIxlwe5VpqZIn3eUkSvqT/DNeZY3DSN9OnmsAG8g9qGbD2cJkfh9soce2
	 O10Uz+dhlGu1iZbPX3wzJwebBzS5XonLO1Yb+pDd6HSyAb+f/QahF74Gk/V7oKiJ4B
	 QxNu+Ijry+mSDqapdGIoMMjm4xfcak6FZbNPXyQvNuDmx+MrSmrxueNGKfp17LyjSr
	 okCbGle0lTsARFYvjgLK1ydgycbS7S/YjYry9SIDMLOmexqAY9BTR2wb3q4m+KV7Po
	 ySZpnlAkjvRyA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:31 +0100
Subject: [PATCH 18/48] ASoC: wm8580: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-18-a62651831735@kernel.org>
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
 h=from:subject:message-id; bh=YyEnQIX2JWZLzjew7wfYcn0E6NOzr1V02Gn3KHhT3fw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G5OtVudBY8FAVSDPctPkPgoFU4kyJ6gNmXO
 qPhHvcI74KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BuQAKCRAk1otyXVSH
 0CAhB/sHcdUm8GWaq2evgAhsi/FSjfUZoYWag6s+Tfh22CjyGu7nYuuH6KQwW60RI28lERm1h+O
 WYNVqgDNlc9xMqdiN6D2o6uZIODetDuDBrdXKC55GesLTxTiK+rwSLnROQgfKOHb1d+fziSlZGw
 YBkMW/ebFlUbaHUkMrGKrDEUy0OWW5E975g6+Tbt6o/SeYd3yZFgveS69aS4JfW8CVoGZunoTD6
 KA5b3NPqiBt0SvZdoL+8NmXPGABWqzPtKyyAgWQvV/vrI78WkNLmeoRpUYNjGUoUGb8naylDAjx
 105csON5nNu2gLhyX6rtBbC6eAfNNVHal6vxeINOjsO219pf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 5OCKCEC224HFSFFQ6WEBLYHHA442XLD2
X-Message-ID-Hash: 5OCKCEC224HFSFFQ6WEBLYHHA442XLD2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5OCKCEC224HFSFFQ6WEBLYHHA442XLD2/>
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

Update the wm8580 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8580.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 34ae7fe05398..6d22f7d40ec2 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -975,7 +975,7 @@ static const struct regmap_config wm8580_regmap = {
 
 	.reg_defaults = wm8580_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8580_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8580_volatile,
 };

-- 
2.39.2

