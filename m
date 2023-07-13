Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDEE7515A9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:57:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A90EE8F;
	Thu, 13 Jul 2023 02:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A90EE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689209864;
	bh=bgb4zzrORARsttsVydsHYK2GR/dBIf7Y05nOGfBm76Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sUOrQ7dYKZFUpXFY8Ja1CBB0hFSpgI5a8YXDrJFzUHV6grdHaRvL77mtPKD+CB0BN
	 lwtjGbdj0spz8leF8UdFcf2Xq/isiTn80J4mgCArxqW9CjhcgAAhWQ7oZZ07o0Vnz0
	 mKBLI8az9GrS1agFvCQwK/blnQZ+yDtqGmxWznws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20243F805A0; Thu, 13 Jul 2023 02:56:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63D98F80563;
	Thu, 13 Jul 2023 02:56:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34225F80589; Thu, 13 Jul 2023 02:54:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C82CF80571
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C82CF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E3L0NFRr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 704C0619F3;
	Thu, 13 Jul 2023 00:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B57C433CB;
	Thu, 13 Jul 2023 00:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689209641;
	bh=bgb4zzrORARsttsVydsHYK2GR/dBIf7Y05nOGfBm76Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E3L0NFRriB2e+qQymmmDygbgT2zGzhTC3pL6IYAPKSSLS6NGAFgy7noyB5qJQSF6I
	 dt9nfEXeWjxZr76nkTjbCfMzozZdGCDN11G3Cpokycjw3Aw8NtJQ/Lo0WUvCqDWpZG
	 8cXNShcC6vK7tOX+5jEIlYvNUw7nyLDchkKI5yaAtrLsKdgrzjrFCcL5jj9mAWv0h4
	 NBdf5LAuqR6uGYJMvKXw5FELQ0XsYx1H2PtypWqtevBzFNE+rA+72xGiBfYGVRJp2M
	 rIYvRN8cmkiSW6T1hDICEAKq6A7s9Wb8utUD/IOJPgv7WbGx023NvbXurHa/OLTjPZ
	 O6Q++DhhpAA2A==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:49:27 +0100
Subject: [PATCH 09/11] mfd: wm8994: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-mfd-cirrus-maple-v1-9-16dacae402a8@kernel.org>
References: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
In-Reply-To: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bgb4zzrORARsttsVydsHYK2GR/dBIf7Y05nOGfBm76Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0sQP16X+5LO03wDeyBuSFRWgtqyxe/bYiSDo
 bVKlVemph6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9LEAAKCRAk1otyXVSH
 0JzQB/95CWvUzhmhz2JVDo4P8KEtrsoRWkifqnHg3s2q32MLacOQJgC+/ci/oNb1TcgNNzbU8hj
 8MYoK+h+RW/L0QofLHS+dip/p/hORXSRo4/oGzIDhSnWm/iA9eLZ/TX//qZxxuloyH0lEgUVIdh
 QLtOVJXJd9SPkWCCDOMp04X8erf7UDTBU2hVPnopZWrjv5B/SqnnGL8N/prP6S68vgVBx9EMkhL
 7jVNmiyroCbtWQE1JBF0CByz8Q1nz/WaE0jf1Kwv58Chkpd0PXRUAuPwzov6W9n4QN+EVQ0EAp3
 +ZhcjmSYEniPU8RoG5jZtEBhgBhxGf5H5dzyhcLEflJ1gmLA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: HOH6C4LHWNXDSCR7CBVSZMM52PQKNHIV
X-Message-ID-Hash: HOH6C4LHWNXDSCR7CBVSZMM52PQKNHIV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOH6C4LHWNXDSCR7CBVSZMM52PQKNHIV/>
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

Update the wm8994 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/mfd/wm8994-regmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/wm8994-regmap.c b/drivers/mfd/wm8994-regmap.c
index cd4fef7df336..ee2ed6773afd 100644
--- a/drivers/mfd/wm8994-regmap.c
+++ b/drivers/mfd/wm8994-regmap.c
@@ -1238,7 +1238,7 @@ struct regmap_config wm1811_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 16,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.reg_defaults = wm1811_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm1811_defaults),
@@ -1253,7 +1253,7 @@ struct regmap_config wm8994_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 16,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.reg_defaults = wm8994_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8994_defaults),
@@ -1268,7 +1268,7 @@ struct regmap_config wm8958_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 16,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.reg_defaults = wm8958_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8958_defaults),

-- 
2.39.2

