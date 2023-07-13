Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB7875152F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:23:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 221BEA4C;
	Thu, 13 Jul 2023 02:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 221BEA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207826;
	bh=KtuApyPLDWlsikDsmqUopTiXx1qbWI9HY40NRsytM+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gtz9tGBrrVy0cq+G0P41kwnzM73jOZwdAXLd472UlWqdTkVweSRf1+QkxyeL1VDYe
	 GCtU2iRla1nSsCUm7RHx5ys05KSJjVelE8+sEPn2zGLLHYyqqXXrLhe+tJ6u27vm7Q
	 7ec1PfNudKzaZyZsg+WZ/9/Ihf8kri8niaHzJ5Es=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43B4CF80557; Thu, 13 Jul 2023 02:16:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C06BFF806C5;
	Thu, 13 Jul 2023 02:16:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0F16F806A9; Thu, 13 Jul 2023 02:15:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DDC34F80696
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDC34F80696
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VdzM/JhX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0C2A61987;
	Thu, 13 Jul 2023 00:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B62EC433C8;
	Thu, 13 Jul 2023 00:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207342;
	bh=KtuApyPLDWlsikDsmqUopTiXx1qbWI9HY40NRsytM+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VdzM/JhXeT/mB1DHhbW7okqDgS8QkO2+IooD9cUkfUcKflIN315Vv5ZcYEx/2Wrie
	 EIQm+hkvCR/NsbnjRraiYLC/ZwuFsJQWnM0/ri4OD4C1ABYLNBMWBX9aS3ldDH6Qgp
	 wtgrJ+i9goCgrsZHBXXLvpJpIc+y3BUUFJKUKiC4Oaz7uTlqrsHS6qIKx9T7SpuLqv
	 HKxac3pTAFVnE/zq4VRbJsrg1TqCTMwFl34L5PZk0rmQNDmYI61FLsHiabQVZuZnjU
	 GWZgRxkqdcvkZLdB2OZwXjdSanqvZIbzN4R8KCk0n/KGfTc7XZaXdy1J4VQmDwKus7
	 A966Om7iXxqUw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:44 +0100
Subject: [PATCH 31/48] ASoC: wm8904: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-31-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KtuApyPLDWlsikDsmqUopTiXx1qbWI9HY40NRsytM+c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HDxHJ+1BJgeFQohGSx/DAhAdjb9gHeERPtr
 If7iD5X9FuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BwwAKCRAk1otyXVSH
 0K64B/4uhCReUlYY7dziXuF2h86HgT+E6xCfVaCdjI9J5DVxnRCYjKPAR1l2qK51ld0tpUv92Bq
 OXfcMO3KD9EhO9oLY2KlOZWLUBRA5fJEOY6qZwthnir/DcJfCq6J4gLA7RoDStZEKMFDgOjCdcx
 dXP8FPsnsRetdSuLEeyKryu7sogl67Dz1wHx38UUR1gQNJsGrvmwr3T8M2xi9rnt/0IfFEBW8iK
 GiLeCqdOAkjhWewrwJX6EpIpphFWHPLA+rHy8j+f4SfLmGr/NDlzpUQYW2h1doXHw6QjZVuaUS1
 ovPy2n71q5s9dByEn/TytqPTKdAcsAcTiZ/PfdOqHdbGT8Ag
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: QSFTWI32TKAUICBN6X4N73C6NWM5ABTF
X-Message-ID-Hash: QSFTWI32TKAUICBN6X4N73C6NWM5ABTF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSFTWI32TKAUICBN6X4N73C6NWM5ABTF/>
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

Update the wm8904 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8904.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 068e610b1b4c..ac4e1654a967 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -2148,7 +2148,7 @@ static const struct regmap_config wm8904_regmap = {
 	.volatile_reg = wm8904_volatile_register,
 	.readable_reg = wm8904_readable_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8904_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8904_reg_defaults),
 };

-- 
2.39.2

