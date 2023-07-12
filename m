Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E8D751460
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 01:18:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45C4485D;
	Thu, 13 Jul 2023 01:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45C4485D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689203896;
	bh=vDBcrA6q2CExjQvp42DqVJKk0OGqX6PpLRTDdxJCbwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b2DDOyKn2bkWjONmbMAXYRyMJWhYEEJrtcE9H2B+0uwVkVCAYkfXwYj+cftlO5Szr
	 0QR5rO1ZBx5tQVWuTceVepk5fX+B76/2A0cs0xStH+vWUfXZywF04P4/fCnH+GsY+n
	 AJbr2qTgYBQ8cZnwiXAseJ6USfwHcmDRwI1e0i4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70ED7F805F0; Thu, 13 Jul 2023 01:14:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2644EF805EB;
	Thu, 13 Jul 2023 01:14:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15D81F805AC; Thu, 13 Jul 2023 01:14:34 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AB6B7F805AB
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 01:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB6B7F805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ARdopTNA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 93D676198A;
	Wed, 12 Jul 2023 23:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0EEC433CA;
	Wed, 12 Jul 2023 23:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689203670;
	bh=vDBcrA6q2CExjQvp42DqVJKk0OGqX6PpLRTDdxJCbwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ARdopTNAcWM/NNIJZ3LTT96ygwdFwKVyBVsmobVzrYZwFsSveItR3E7zCJoqi0tgD
	 VatPjLUt0kLuHlmczLT+G6WA6xdDCl7Fwl4NHRRtOa/lE3xN0u3po5uVfipmFHLops
	 JpEoAlMBY2pHTcsNIlCUF7HwqRwGkJN2B0NQ2Vckmt0k/nt8JEhzl9rQuasN0sniZx
	 v9dFA00LI78DtIVwZVZCRF9+dG4GCuryr/M74Y5hFjBswxQDUdQOYKff8LwPzHKn3n
	 p30qI9elKTcsWibVyPR0pPs1mMAcOIE2OxN3j29QmKT2ekpIaWQjcdd3zLAUBgfGOy
	 70Te4YiAoiIYA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 00:13:59 +0100
Subject: [PATCH 10/10] ASoC: adav80x: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-ad-maple-v1-10-7d2f35d42b5f@kernel.org>
References: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
In-Reply-To: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vDBcrA6q2CExjQvp42DqVJKk0OGqX6PpLRTDdxJCbwM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrzO7sJU5dzf1eAMBUPXLS148Wf6DRGDJHDPjO
 1ZV+xB/CY2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK8zuwAKCRAk1otyXVSH
 0KfDB/0ctGixzbARn4y/5pfQgFkcjN850hAn8rIc9ZG2bYTJHjQXh8y7lHBXqOTyIY8Ftmj9FsW
 x7P9HfY5O69mNXGiQzMOuOjfIRUa/GqNMwCQCXcaibI+fDVgVBKJx8Z13FMcUR5NvLERPVsr+6W
 rPPr5gIlWZ85U17hkoVA5HS7I5mkkzXkEa3HCHzYrQ2h/hTmzCN5ZJZFJJdo8Y0u0cy8EIZDmkS
 qFjPGaP3kO9LSVk1WsLi6xumOHrU/xXXdsrmrhzSYkCU4JczgWYzSMfMsXmEkFDf/uMpLGWZwyW
 xvHQYiNjP+FgX9/xv5ekMm7NqwcaPOHV9fUQU7tn3xZHR7ZR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: OU33FJCSMTRWB3JUBA2X46LFAQIIGG7Z
X-Message-ID-Hash: OU33FJCSMTRWB3JUBA2X46LFAQIIGG7Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OU33FJCSMTRWB3JUBA2X46LFAQIIGG7Z/>
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

Update the adav80x driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/adav80x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index fcff35f26cec..bb08969c5917 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -870,7 +870,7 @@ const struct regmap_config adav80x_regmap_config = {
 
 	.max_register = ADAV80X_PLL_OUTE,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = adav80x_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(adav80x_reg_defaults),
 };

-- 
2.39.2

