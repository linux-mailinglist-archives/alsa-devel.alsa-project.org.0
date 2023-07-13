Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57575151D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:19:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 494D31F6;
	Thu, 13 Jul 2023 02:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 494D31F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207564;
	bh=3PywKAFWkwriAnChF4krGz94x7ZTY8vloSY8lWfMtIw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GEGEMeikeUjoQ11JDnEUAf/WN4DGs0u2WXxrJ1a707geCq+y/Y0XM5QhqsumYS+jC
	 EYWqH8LWCaMQ43p4Xbin7T4su3r7yTWhtKop5DOCaGlzX3mUG5rZG0XkwcNnRiqSW8
	 jD63K7mz+cDdjmJWMpJ1q7aEZJEwhDHUYtFBiM/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1626DF8061A; Thu, 13 Jul 2023 02:15:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7849FF80615;
	Thu, 13 Jul 2023 02:15:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B197EF805F9; Thu, 13 Jul 2023 02:14:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AE786F805EE
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE786F805EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bfBZyVkP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 920C361986;
	Thu, 13 Jul 2023 00:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C817FC433C8;
	Thu, 13 Jul 2023 00:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207293;
	bh=3PywKAFWkwriAnChF4krGz94x7ZTY8vloSY8lWfMtIw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bfBZyVkPjw2mINifzXkW8ZbdIpPEXSYNq5GkxwzJh0Om9rfWmiTaVPcYMfCKbe/m/
	 RfFCXEPEIDdRSpbRdoqorojLiBXGFZe+rn+3GjT4G4eSQG4hC95IlS/3bhtK+qOJ1j
	 shqVT/Jlh6mjErexCNZcesJkWlwYA6JSEbLVCX/WzrV2P2P2Sp9ZOMI/6F0nvhlp+o
	 gOLSHAHkpfpZ96ARiOGYnJgH9TuE8rN8pnEdnmm/UhWQ3tYR4wvWvlzg5Qav7dPcPK
	 8xy/w0FfVQPmfTWLGn1TM+0tB+cJbehIhCUd5tv2usmpYeQk5tkokRq/n61z5IcFgi
	 +qoDtE6jPxexg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:27 +0100
Subject: [PATCH 14/48] ASoC: wm9081: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-14-a62651831735@kernel.org>
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
 h=from:subject:message-id; bh=3PywKAFWkwriAnChF4krGz94x7ZTY8vloSY8lWfMtIw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G2HrezrlWer0LCujg9qoAygR/GodqieebYY
 ZTu2kG7GxuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BtgAKCRAk1otyXVSH
 0BFeB/0SUuVt71NVh6ny9tCg+wHFoQoANsYSCn6u3sQoq5J7nGMPUok3/67DkfNranbZc8/XHK2
 /Z6PGTOCLpRULxMNxjkbAm92n9oAOsn7zL9Zt5C9ivCOHskowMxnJregwJsd3TALZYB6SBZZyYE
 21wmVvy4PKQNGNFqWjruZGUx1T9etYK9Cz1KPQAkQDctuzgW3UuJveYEAJ8WkodY2nBHFxA0oXR
 3sCjW4vGpZSROLjGkbpK8Pe0p+BpA1UIdmkP8wPPeYViSgS6LQJ+YI27sZbrrqusY6ZEKuPd75w
 k38nGIqwhhnbjtbj8sxPx+U64i76ZViGZ7LkULJk6nXgVXWi
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 4XEVXKHVI7OV4DF5OPEKR2Q3UE2C3Z2B
X-Message-ID-Hash: 4XEVXKHVI7OV4DF5OPEKR2Q3UE2C3Z2B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XEVXKHVI7OV4DF5OPEKR2Q3UE2C3Z2B/>
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

Update the wm9081 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm9081.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9081.c b/sound/soc/codecs/wm9081.c
index 34a07db7342a..e7ec799573d3 100644
--- a/sound/soc/codecs/wm9081.c
+++ b/sound/soc/codecs/wm9081.c
@@ -1295,7 +1295,7 @@ static const struct regmap_config wm9081_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(wm9081_reg),
 	.volatile_reg = wm9081_volatile_register,
 	.readable_reg = wm9081_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int wm9081_i2c_probe(struct i2c_client *i2c)

-- 
2.39.2

