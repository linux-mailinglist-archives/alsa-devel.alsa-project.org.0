Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C1F751542
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:27:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEA54E8A;
	Thu, 13 Jul 2023 02:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEA54E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689208036;
	bh=AAwZLZ3wCUicI0cwpGlzwbb6Ss2N5VmgoHj9kKZsWMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GqumVvW10GibQtFdMFzmfyBYI8iqAPSxUcRuhkAbDkiROSBqeNmkthlvvbPv7iSxs
	 /Dp5ngBqf2GLY/0h7FSAHzjh3uDzpKac0v0A6pqqcUTFIu8EU2cBrGRWboKeIYNKn8
	 5nNcqRdmiKyNrRRVye4XsU5uMv0fxXF7Sfg55npg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EED2F80768; Thu, 13 Jul 2023 02:16:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1E71F805A8;
	Thu, 13 Jul 2023 02:16:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8477F806E1; Thu, 13 Jul 2023 02:16:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ECE9CF806E0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECE9CF806E0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e+/+Egpm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D9A15618FA;
	Thu, 13 Jul 2023 00:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186FDC433CA;
	Thu, 13 Jul 2023 00:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207377;
	bh=AAwZLZ3wCUicI0cwpGlzwbb6Ss2N5VmgoHj9kKZsWMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e+/+EgpmdCsmOm+I7w01x9NSMCFcw46wIi0JFQrwOvt2lLOzV1s8w9y2iehyTKfiZ
	 rctITfDZtlInrxBVUL5Jhn+hNSzQ+qv6MuO6Ad9f9uEfWMUGIfvzw+y9eNgaEhzMNk
	 KgKWnK7C8WtWuu/4WtfegmuOLY74ix+un1RxYW2rlQMYoJu6vcGPKLUaskQFW2R57i
	 q4eIBzQK11xC1ASqJUAoKXmReFTW+WZhy4pUTHaV6JWvg99CoG2xyGUMlMLqfZXkk3
	 MRiB7BGK07tKJv8T93r5rfJMsQ4/Fe4zLyaGCaYTy/qTdNA4IbtCe8KKA2NcmFsJIz
	 WyRGXhnCrYnQw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:56 +0100
Subject: [PATCH 43/48] ASoC: wm8983: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-43-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AAwZLZ3wCUicI0cwpGlzwbb6Ss2N5VmgoHj9kKZsWMg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HM0xllK/SOQQG+LadzL1ML9t5duL0ZGokXy
 BcVXvR9dmyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BzAAKCRAk1otyXVSH
 0JBOCACB85ybYYCw9ZUVDYq+4i8bSmmQEz40N2jsMxkBkMBmrU7rIeB42n8bHPLSRm5MewbOwIr
 Z4LguEF5O6AKrhFgkPl2L48X67a/VQ7JwM+oRmu3JbDKS0Lm/oadwBchvK1VoPDAynhLUKwomCu
 TOI/YYA83IBJSsns2ITppvOiEBuhvWYDRpbKfGFmu6+0EPkJ5XI44e8w3RD9C+Pl9BRXWTPl2gJ
 B+z2LpoiXs5FKZTJxNYJk1ccEms/7ZTdTvzDZRDpx6RAND/FjHLjuxtK7NAlt+4VnmJY0K+s4Fk
 UcsWn/CRdsSD2kEkniLYu5v5i6nmo7YR4ueJmGU2oTmgZ8QT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 3RDFNCECPVO267L6CIEVX5ESW4NR4RHZ
X-Message-ID-Hash: 3RDFNCECPVO267L6CIEVX5ESW4NR4RHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RDFNCECPVO267L6CIEVX5ESW4NR4RHZ/>
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

Update the wm8983 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8983.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8983.c b/sound/soc/codecs/wm8983.c
index 2bd26e2478d9..b26d6a68e8d2 100644
--- a/sound/soc/codecs/wm8983.c
+++ b/sound/soc/codecs/wm8983.c
@@ -995,7 +995,7 @@ static const struct regmap_config wm8983_regmap = {
 
 	.reg_defaults = wm8983_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8983_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.max_register = WM8983_MAX_REGISTER,
 
 	.writeable_reg = wm8983_writeable,

-- 
2.39.2

