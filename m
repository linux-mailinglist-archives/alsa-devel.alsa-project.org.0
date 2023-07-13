Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAE0751512
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:17:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 476301E7;
	Thu, 13 Jul 2023 02:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 476301E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207479;
	bh=A8vHwRzCwHS4yC+9YfVZKPZfPQI3zfXKZ0/ASIO56lk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EoGAcIKVbguqT1U2p5zhiqCz3g6kksvdasA2SRw06R+ym/WulUIzfAOfjERSiXaGy
	 M5HY4I7fHZ49HMomoh7SgcSxz0Ur2rkAhHTUNba95bKxGIz3MWNNGA3veXVTWfvlO2
	 Bx55nLVZA5DHtoEp5pGvgz9+lGD9V0QFz/grZHik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B555EF805E1; Thu, 13 Jul 2023 02:14:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27955F805DA;
	Thu, 13 Jul 2023 02:14:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B9B8F8059F; Thu, 13 Jul 2023 02:14:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BE74F8057F
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BE74F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HCnF9hna
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8944C61986;
	Thu, 13 Jul 2023 00:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EEEC433CD;
	Thu, 13 Jul 2023 00:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207276;
	bh=A8vHwRzCwHS4yC+9YfVZKPZfPQI3zfXKZ0/ASIO56lk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HCnF9hnavi0nRv1RbqnYjTLjhQ4AKaOJfVQIohAqTbVlHB9y8llHYDpGjok2qRecl
	 S/prAaDvWrSXeSdRULcq/VMKSNjc43usJjd3oi1wMApwXTOt68ua1V9ManfQsZYo2X
	 jwBK8jOLd/v5J00gN5g1Ui9w9ioNlQ36/0tfBPlRovY+9YR/ZZdGNtfcq5Idm5lR6J
	 TjW2XestGwyshxxwUYy3OYjsg9O818YbgwsA8tzugU0LUDkPNhmr8euy3wW6sfWGUA
	 zgyi5NWPsDbnQln8zEdbJOkhFYxAUf4Uoa2Mm6xnunE6WyTEh7qpbAv/eoIduI345D
	 zl6BMe7kA8i9Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:21 +0100
Subject: [PATCH 08/48] ASoC: cs42l52: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-8-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=A8vHwRzCwHS4yC+9YfVZKPZfPQI3zfXKZ0/ASIO56lk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GyAwoCfSSmmyObCfHTHiDlLDTPSJZzWD1It
 Zw+vUGOPq2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BsgAKCRAk1otyXVSH
 0KmwB/9KkQnGkf667EzoazSlLV2MAsO8AeK1uhLin7BqQc1YsclqakLyT5FuqxwZO4ntghSDfRV
 E3cDO0EqHSBGHaGOCFy5Q+IYH8sIn4LgHQekMm5Ne+UY9SVqaKlOTNP4+cIH81z4XkaMKmwJSds
 79hGEGR6DSfKh+hH8eGNfF77723n8RCFgn8Zafg+ZPTbvKQE9w7uxMtmrNUd/d7BO6rKJCrCY2C
 IoCB+80HNM8YyiM5WypbLxC/n8Epi6ERB5yGfrwDzCL7DkuccPd6gw8aobUrscJ00Dq2O4f3asa
 WTp/RNAj/Eapp5QfBYMNC666+A9S6ylvgkUOqda90Dwu3DQo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 6ULPYCY4CM5IZFDIH4LKUN3X6P5Q3B2P
X-Message-ID-Hash: 6ULPYCY4CM5IZFDIH4LKUN3X6P5Q3B2P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ULPYCY4CM5IZFDIH4LKUN3X6P5Q3B2P/>
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

Update the cs42l52 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l52.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 1f1ded0ff0ac..4fc8a6ae8d92 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -1084,7 +1084,7 @@ static const struct regmap_config cs42l52_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(cs42l52_reg_defaults),
 	.readable_reg = cs42l52_readable_register,
 	.volatile_reg = cs42l52_volatile_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int cs42l52_i2c_probe(struct i2c_client *i2c_client)

-- 
2.39.2

