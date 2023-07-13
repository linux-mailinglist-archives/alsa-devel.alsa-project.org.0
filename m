Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3D751514
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:18:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13DE2886;
	Thu, 13 Jul 2023 02:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13DE2886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207508;
	bh=VRXQYXa8Qxz2t7oUH72fvpxl1d0//wcuyf2srJuE27g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m1F4wGKkTIuVlfk6rmBtt1lOvUwpmPCojBwD21HENKnTxXcl3AJC1pG/3d7vG+XA6
	 j8Oo34I5EBcM/vsTCoxLhPcO1XDBHakpjOXoDbhHyUaZyutz0jQWs+3o0SxIVceGcs
	 V9AKw16Wh+lON/IBt4tx9b3RrnLsSqB9BELVUbQQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62CF8F805F6; Thu, 13 Jul 2023 02:14:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5282F805F1;
	Thu, 13 Jul 2023 02:14:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B2DF805BD; Thu, 13 Jul 2023 02:14:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 80697F805BE
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80697F805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hVi6p03d
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6FF7261986;
	Thu, 13 Jul 2023 00:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0FDC433CC;
	Thu, 13 Jul 2023 00:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207281;
	bh=VRXQYXa8Qxz2t7oUH72fvpxl1d0//wcuyf2srJuE27g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hVi6p03dKsQpA09T4kHv6dZbl0kKAcdXfDHWpKNJFTipwO2POwMR+zzuYBcWx1XXT
	 8SZoPLPSRMcJSkgu2sUHSsGSLKIFSS0a2axWvSxkM74BWksf481mJvb5AjJKK5hX9H
	 nUybjOSGBetiZq1UwOiPIE+hRrsydYDhzL8opXTSqkFJtQ258YcwEcmkhb6FyOk59W
	 Vz/QvDsuLgzbu/PGY5T58SZnW4936UKNKN3i3inndpwdWgBcbLXQYvqBHPsMdIe5gx
	 hA35zjmWKBNTOHykTb3henRpmpwpReVTyJanR4DNHFZEYarQ11VWQdmEI8/tHSGCC9
	 0e01l3mQo+bCA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:23 +0100
Subject: [PATCH 10/48] ASoC: cs42xx8: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-10-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VRXQYXa8Qxz2t7oUH72fvpxl1d0//wcuyf2srJuE27g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GzrvS/7kToxnbplx9I/PQ1ywQgQx4cLlXXs
 izUigE+IMyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BswAKCRAk1otyXVSH
 0Kd4B/9YxGHHWM7HWwKTV5tyMN3FKCXimdpw0jPbxNwNgXSvu6ZKRPrgFx7GwMU17D63Qlj9ZEG
 Mm/BNZZ/pu+uUQ/86+97f/vEO5BetD2k0QiVFBJV5mmkt9M+qVARzo0ls0Haz9ixPtzvtJGFJSa
 Mbv4x3J9VYYFI01p7xQM7Cgw9BFRFQ1GeeTix7skG+xZFfIude3fuYoKuyjBH+YP9mkfV3kAl/C
 N8aqCP2GR9S0kxmPpQc4Rh9GtOjhggudesvus6isyi3JFQQ4ake++JG71vI6aTZIQX3c56NHXP2
 DG+PhjNqJDXo91idWyX8ve8lAaAcRtQda5WgJho1mIrr8vq9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 7L6B5ZPOCQ6AF6C3TZAP5HTCNQ6WUSFS
X-Message-ID-Hash: 7L6B5ZPOCQ6AF6C3TZAP5HTCNQ6WUSFS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7L6B5ZPOCQ6AF6C3TZAP5HTCNQ6WUSFS/>
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

Update the cs42xx8 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42xx8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 4558ec38a7ac..9c44b6283b8f 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -458,7 +458,7 @@ const struct regmap_config cs42xx8_regmap_config = {
 	.num_reg_defaults = ARRAY_SIZE(cs42xx8_reg),
 	.volatile_reg = cs42xx8_volatile_register,
 	.writeable_reg = cs42xx8_writeable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs42xx8_regmap_config);
 

-- 
2.39.2

