Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ADF751544
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90F07E79;
	Thu, 13 Jul 2023 02:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90F07E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689208061;
	bh=OBMjeVDhDXKWHzZfgbwshvDo8AsqyDiTCFal21Yjztc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OsheFwu0s3Bb54FPmIvddx1zhwePsDSn7jLlGe13urV8TKY2CgjqeoOtr7JBfmz2C
	 ztmXH+u/j96nGUDUkOgYtf3kB6r5aFWBPj4PBDn2ho8TU2g8xNRUhtp4kVCGqTd/0U
	 3HJQg8vo8uAszwDSmOt0jVtfB6yGJeJn+6IcdCcg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ABFDF807B6; Thu, 13 Jul 2023 02:16:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1D0AF80794;
	Thu, 13 Jul 2023 02:16:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C153F806F7; Thu, 13 Jul 2023 02:16:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E0CAF806EF
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E0CAF806EF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r5FzIOk/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80741619B2;
	Thu, 13 Jul 2023 00:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32A8C433D9;
	Thu, 13 Jul 2023 00:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207382;
	bh=OBMjeVDhDXKWHzZfgbwshvDo8AsqyDiTCFal21Yjztc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r5FzIOk/kWG8596XgnBj9K+QzVgfaD2fswIJDzb7LcuVIx2a1B4+4o7loyMf4qItp
	 j1RR6wMqAvygCwgrxlcs9oXXvnxxJdiHDnZwWz6l744pX3IFXJB7GcnhRMr2F0PbJ2
	 rAhGZsTbFCDDJRYruJk3qwphEN/nDLI06UL5wjO0ORQ9eyw75YJ7VKUgoTLeOIiVTZ
	 qhDTmmx+ThLGcUCJvgwOkg8PfcZNrdArI9M7vr58UTFSsc2Es+kgJGMtsIaIm1jKaH
	 ApHdTjySLttQx7+OEvSShECNUTtAxZopS2FUhnJfiBc8OAObWk+RfPTMRZSQ2ZORTt
	 tI03lbG16MFBg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:58 +0100
Subject: [PATCH 45/48] ASoC: wm8988: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-45-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OBMjeVDhDXKWHzZfgbwshvDo8AsqyDiTCFal21Yjztc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HOvww25edrHXfa+LcppsTzggje7K45sb1zV
 J/ITqHpgqCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BzgAKCRAk1otyXVSH
 0DhZB/49okZYlTziW/QDavueJEALX4dYlWUgnTf1m+Nuq0FracHNpFAdOVlI/wX1cR0TapSUnxd
 npuMMXVba7WIA9e14l4vvyTVU7BrkfUvaRiH4Ku+Cu2aELSESS1KQkXvinS84zIG2JrRn4Y2yzv
 Zyve5MZbYxbvuN+ZXpUPt3LZ0P5n4GVSXZfl/2wLFevTbrb+Xko/tRCPZBlOZJNW42ZAvReSlfQ
 Qe4PxYrE/g4rpE04dlGc8gvI80Qah3TE7+Q+mYsNaPh3pigUlWubrK8exsRxis4MzpJfIyv68yi
 m/ey4HLIL7Y5S/t9OOG+ckJhzzLapvA5pSqN2Pe64/ERb2n1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 3E4TID4DBZRJIQACL7KWT5LNSJHWJN3N
X-Message-ID-Hash: 3E4TID4DBZRJIQACL7KWT5LNSJHWJN3N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3E4TID4DBZRJIQACL7KWT5LNSJHWJN3N/>
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

Update the wm8988 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8988.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8988.c b/sound/soc/codecs/wm8988.c
index b440719cca7d..76f214f12ce0 100644
--- a/sound/soc/codecs/wm8988.c
+++ b/sound/soc/codecs/wm8988.c
@@ -832,7 +832,7 @@ static const struct regmap_config wm8988_regmap = {
 	.max_register = WM8988_LPPB,
 	.writeable_reg = wm8988_writeable,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8988_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8988_reg_defaults),
 };

-- 
2.39.2

