Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D58751538
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:25:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 775D2E7E;
	Thu, 13 Jul 2023 02:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 775D2E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207904;
	bh=KC/GQ3Br25p5MuSafBm8be5t0MMwKzflznzovGCCEvc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZBVpAOUoC88d+sKL3E8TVXFZNCjC/UgLrjsdxduuhX/ydfoIEcZgocijjScyJ06TL
	 p/Lb9hom8FmmKH7AX7GhPSYJ7Hvzko6EnkaDdF5EEfqDPsE+unFuJ2Z72g5dWvYE8i
	 cHGhWEQD6V6NeSbijK1zXWBUYQIKyQ4bLeCPGJus=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBDB5F806E7; Thu, 13 Jul 2023 02:16:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38F25F806E5;
	Thu, 13 Jul 2023 02:16:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D1C2F806BB; Thu, 13 Jul 2023 02:15:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DE920F806B9
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE920F806B9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=trSklcyw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0FB2619AB;
	Thu, 13 Jul 2023 00:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B872BC433CB;
	Thu, 13 Jul 2023 00:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207354;
	bh=KC/GQ3Br25p5MuSafBm8be5t0MMwKzflznzovGCCEvc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=trSklcywIG2sXspdNb8jm7snMjkJyLgi9TRs5DDclpco4MEKWNCc+8s6cgUkT33TX
	 3MIGCvkW9a+7CcEpw6A2Tz0LW63I9lnt99duMS+HKmvJojpY4xkoc+RrgjnFrfERhZ
	 HhfAceCL1s+FeCbbbzvTrUXhi2PieDp58Lm1papZ/HgM7UTGW7PxqXcmpy0ov+HDGF
	 1Q519oPom2eX53HJQFQWkMCN+YsWhNXC3TJS4apocUYzhT4VkyWMboylfph+SJhK2r
	 tjrRaMmDQK8B83CAFEjrOkJYTMI8N+/UbluzgJqgyUyztTUg6ItsdHPo5b7Pl0/fOM
	 w79LqAmjyf0AA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:48 +0100
Subject: [PATCH 35/48] ASoC: wm8991: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-35-a62651831735@kernel.org>
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
 h=from:subject:message-id; bh=KC/GQ3Br25p5MuSafBm8be5t0MMwKzflznzovGCCEvc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HGv6xnlB/xEKvgotvzqob3vI+aZMEbX2p2P
 rE39f2TsYiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BxgAKCRAk1otyXVSH
 0LMtB/46Rq581Ajng49HB4Rx0jtBPq7lZJpa7v2V9qHYGgAHCkDYXQlx9EZLtBg9VUDMpzWS7Vf
 YBqLytfFJa1WiMTMWbFQrCWeTfxb9mqMpTz4Q5oIpJKyPndiSNoFL+lKlvVdUgS8TgFGNMEry5j
 hxPGptlHikfYhievU4pY+iKdzTBDLLTh3nSCM4MKxVSE+by7Jiv21UlDnmFUDoYLb8zToofiOXi
 xc2RRChHPEKS6k7wtxyPSHtMEvAXZkqhWSd0SSBl5G8uVYR8bMXn6vfSLtVu+033shIG2d8jbtO
 RCa2fHod6netmgA/Aow5iygdxu4EUa71JYZqSs3WTIoMBIBU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 6HBDV4CT3QRSBC7PD6PCQC3WWCO3R53M
X-Message-ID-Hash: 6HBDV4CT3QRSBC7PD6PCQC3WWCO3R53M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HBDV4CT3QRSBC7PD6PCQC3WWCO3R53M/>
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

Update the wm8991 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8991.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 8cb2ae829699..590318aafaea 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -1253,7 +1253,7 @@ static const struct regmap_config wm8991_regmap = {
 	.volatile_reg = wm8991_volatile,
 	.reg_defaults = wm8991_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8991_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int wm8991_i2c_probe(struct i2c_client *i2c)

-- 
2.39.2

