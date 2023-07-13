Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98277751517
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:18:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEC4C93A;
	Thu, 13 Jul 2023 02:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEC4C93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207534;
	bh=dBTk2FefqnG4xin7SCS0yWDPA8l6zdKHnV8xp41BCFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BJYpstjaUVi7b5DDw4kNzO/8iC5vzNVdqIz4ujvqNP9WQuUKI6g2J4QCGc6Xoattz
	 RTziG1SJ/dmeftq2aB59Uu3usWEhgaogvcdLZxqsRyS0AuoTgPdwk0CryETnGd0HaY
	 9fVDxxzlbgXPtRPilrTP0ro2FtVTdpyQoTjfr5JM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BB11F8027B; Thu, 13 Jul 2023 02:15:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD440F805FC;
	Thu, 13 Jul 2023 02:15:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49A98F805C9; Thu, 13 Jul 2023 02:14:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EE9C9F805D5
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE9C9F805D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SPobgD/F
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4F60618FE;
	Thu, 13 Jul 2023 00:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC8FC433CA;
	Thu, 13 Jul 2023 00:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207287;
	bh=dBTk2FefqnG4xin7SCS0yWDPA8l6zdKHnV8xp41BCFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SPobgD/F0xfUFcltIsP+S5hlxYNY81Aikp41jj4tu+xDAsoseO6RrqI3hkl2s0/lL
	 +ye3bUTdJGmSOn6Q1S9i94rmosb75eSB55H+mpA4xCptw3+k+fvUVgh51KDD2cTpIt
	 4vYaaDiOBZryzQExiiwt3PpKxi0wqW323jeL4Rx/qbZ2zWkXi4AcPfVUCT9LOEhpB/
	 XmO2DXzSjYrF4Mx31sV1VZsJo32stvCWVjMDIGuOVDzr88M7/G9Yp2bCmH4nEJsqT6
	 UOSEKAjQdC84+af5lMBJeppcTfSnHoyaqbjFNZRabXFhVGkvd6R1Iq23FTYZb4u/Jj
	 Y0FYAuYexo5kQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:25 +0100
Subject: [PATCH 12/48] ASoC: wm2200: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-12-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dBTk2FefqnG4xin7SCS0yWDPA8l6zdKHnV8xp41BCFk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G18kDgxN+pJ85ZYykb1CQ4oTxrnlGBmYDEe
 f/p/z3T/hSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BtQAKCRAk1otyXVSH
 0JQbB/wLhYr5Ql8DO9f32msQd1grXk+7UuMd+/+1NWmjC3S7BaoAp4FEJSSFIcgkrCAZMppi7V4
 UOdh0qYOBICTLNLjaYgHdm/QZm7r39GN76TXfkeKE2dF+En6/7M+pJQ5hH8Bycqi96A4l7Qwrqx
 JVML7fiAlLmsHHfMHttYeC4H4Aii0OFSb8LkArzO+1WblPvaWptW+s8K5FU8r6kDPud7+FAn/Ye
 i+Ok7CGLcztGiOfWtNKQQdIdznRAiAWcU9iyhdt8d5MsmdDzW9DEt/2vZGG0LotTIYmDmoUr5Yp
 mHAThyXkSCQ135gq+i4WY1hAfWUx0k+1yhV3TKEFGgT7wrtQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: P74OTN2PMWMCBHEHVQWUHWFTVTMRGLG2
X-Message-ID-Hash: P74OTN2PMWMCBHEHVQWUHWFTVTMRGLG2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P74OTN2PMWMCBHEHVQWUHWFTVTMRGLG2/>
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

Update the wm2200 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm2200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index 277b8c468c78..36cdf97993a5 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -2151,7 +2151,7 @@ static const struct regmap_config wm2200_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(wm2200_reg_defaults),
 	.volatile_reg = wm2200_volatile_register,
 	.readable_reg = wm2200_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.ranges = wm2200_ranges,
 	.num_ranges = ARRAY_SIZE(wm2200_ranges),
 };

-- 
2.39.2

