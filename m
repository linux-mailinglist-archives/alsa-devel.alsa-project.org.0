Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7133C751529
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C072AE10;
	Thu, 13 Jul 2023 02:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C072AE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207745;
	bh=K+uHgFpOwUEUeSWZyVu7FZjBmFPpYsmD1WRCwpLgioU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BUvl9vxsC27OPvdRkr+cBBH99pwXcBLSJoGHZzAEfYoiXuMs9GKuaklZsPlpTkHok
	 hJfIveESdEXleL3/g4I0Ead3ScjFjaE4a3GBHmk8YUhWXKwlAZlih0jd+If1zf9e5m
	 2Uey9f5GWZN1cbQwF1CXEJClkybvIb4s1a1I214Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58C9DF806A7; Thu, 13 Jul 2023 02:15:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B2BAF806A1;
	Thu, 13 Jul 2023 02:15:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD09DF8065B; Thu, 13 Jul 2023 02:15:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B1A1F80638
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B1A1F80638
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JK8l8xD1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71165619AB;
	Thu, 13 Jul 2023 00:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A053C433CD;
	Thu, 13 Jul 2023 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207324;
	bh=K+uHgFpOwUEUeSWZyVu7FZjBmFPpYsmD1WRCwpLgioU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JK8l8xD1Su/+cepOW5n8t+segnkh/RSqkV+7A9kmAdMO2mYUK6QpjnruWZRtx689q
	 kScBkvb2+Nsz/Vx8RUwl5CxZWlFH9ULqykmr59EViOe2xPvNmG2R30YFRHt42wafeB
	 EWuyivp6rUwsP9Z2wdrDFgBFamSUUy53F3rjjArHCUrHDUzxeE9B+X6QjadOuTulEa
	 CUlMOczOjL0Kt7kgjzL+3dRT3ad+HjXdlQMTXoQIn7vk+QT+aYFLR/Epo/v9hbyZfc
	 1Xm9w9hFDjB8WsrQRq4VGVNaG16aSg3zOyBsRJT2mdSyYkPz6CIJVh+cUAnO3QJuox
	 ruTTNxNoyPHhQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:38 +0100
Subject: [PATCH 25/48] ASoC: wm8753: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-25-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=broonie@kernel.org;
 h=from:subject:message-id; bh=K+uHgFpOwUEUeSWZyVu7FZjBmFPpYsmD1WRCwpLgioU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G/nNhAICAzKig/CE7nseQNQw603NThB9swz
 9/06yP5cgWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BvwAKCRAk1otyXVSH
 0I3LB/9NyMDeRz2oozNI185rVAiG01nXWsOfZ1mL0BsehUqhJtqiueCjSBF1nauHDwznOB93UyI
 e0ue5ighYatcq3GuB6z6ivU0HUEcEFHpuAGbw8cLH2vbf/ce1jj4bllm/CcZ3FprG8HFU2Usyik
 Z+1IuzayDrCDuQbcXCTOvk6mN96Aw9F0a7oFFzLe9QMTxui4D0oyTwTTs2frECEKdlR/7zIh7rS
 WJ6m99MC7LV/OgI/Nn28sOTeAQR1I0c4G0WYD5PhL0eZZbFbaKmFAvWNpUaYv9tE7OSSiiEYA90
 A81Iqnosu2N7hVUfoa1bJeh3+BdJA5If1mnjNNeydCRt+/iJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: CLX4UU6576YDFZFCSRQQ65JDGEXQFYCA
X-Message-ID-Hash: CLX4UU6576YDFZFCSRQQ65JDGEXQFYCA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLX4UU6576YDFZFCSRQQ65JDGEXQFYCA/>
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

Update the wm8753 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8753.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
index 5e8a8eb41b2b..b5d8290c37d9 100644
--- a/sound/soc/codecs/wm8753.c
+++ b/sound/soc/codecs/wm8753.c
@@ -1507,7 +1507,7 @@ static const struct regmap_config wm8753_regmap = {
 	.max_register = WM8753_ADCTL2,
 	.volatile_reg = wm8753_volatile,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8753_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8753_reg_defaults),
 };

-- 
2.39.2

