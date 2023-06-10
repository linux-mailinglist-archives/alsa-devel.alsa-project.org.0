Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8123F72AC10
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:04:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8688D3E;
	Sat, 10 Jun 2023 16:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8688D3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405847;
	bh=SxLwpNpjL3jFgnrGP2ndQWDihHgJFZHLACIEj6ktK5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nbg9+k0rST9++IiMQzxFuGko68G7DEe/Ygz32exGkxBSre9hTJaW2Oq1sjrl+fZiu
	 MvLR0/zRscul8TeluHhFJxMCl60E6o5BYBlxVITTzYkOGhO0SkW3QdaB4+CBn6L+f9
	 0GvpGVIWHDkot1nAP1kKpHLlAEJKUdgFnXIrlgyw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7018BF805D7; Sat, 10 Jun 2023 15:59:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D79F8060D;
	Sat, 10 Jun 2023 15:59:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29F79F800C8; Sat, 10 Jun 2023 15:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 284D9F80290
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 284D9F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FnRIgCGH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC82A61775;
	Sat, 10 Jun 2023 13:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670DCC4339E;
	Sat, 10 Jun 2023 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405495;
	bh=SxLwpNpjL3jFgnrGP2ndQWDihHgJFZHLACIEj6ktK5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FnRIgCGHBYK1bZyjsa0o7ChgMMDpexPFny1SWXzoskUZaThl+4pBDCJFpHaPW5Slu
	 0Pz5/2YDKRrtPUhGbaUxW0AY0WqhY88B5Abcp7zKbCF9hC7N3bzzNSmpAVOrAFmtXS
	 K0xKlhwqdcwZ6qIWQbLUMiRY8NBB2f8QxaicwULSv0yv1Lin3AB+AVtO7oDcRsOMrJ
	 pfmPJvYUMmFOi8C4Xz+Q+9ZF4jmIFmB4aGNioZA8wyW56B1WIyoR95+TFSb5Bhh9Sx
	 6IJQ46+05ghsYFWuYE9KinGd/TAK0RvTndPtsMccH1CgmyuXLfOXKRFit1ecP1TB9e
	 dwVRPW73h8H9A==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:57:53 +0100
Subject: [PATCH 07/16] ASoC: rt5631: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-7-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SxLwpNpjL3jFgnrGP2ndQWDihHgJFZHLACIEj6ktK5k=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFkPJVRZqrMzJBu6bRuLBc2qHM3/Tfz8yy+1TU+
 gOaNFF6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBZAAKCRAk1otyXVSH0H3sB/
 9wPtKLUucfpZZYCCaGWklXmuaqUAR5b24I9Y6mJe1cd31O4mMlphNFk1TQYH9kLn7JirG+qgpGgx2V
 f+t808i62eRqrd1FEKw28OJWVTsIZzFDQsRmsEXXKWxav9TvxGIm39YLqBYEG7b4V8ZAYQ1xcYr3zm
 K/78Ut4yQuFEteZ9dPnJ14jwfXHwMHgUbkOj2t6fP3aPdJOWNh6ZNG3/AvFI9BbDWwXfYMalUPa59O
 Bl/cccgT+PoLOAkx6R5Xt8ioCoF3zMLVcVCfTYYlMD1rqipU6g/8mM0EUcSyNWrMBp6RCeLuCSvr6o
 K/V0QgCsujBx1j845SQ2Aq359BPDk7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: VHPVXNC4WUZ22M2IOKK4UDAZDGV25ZHD
X-Message-ID-Hash: VHPVXNC4WUZ22M2IOKK4UDAZDGV25ZHD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHPVXNC4WUZ22M2IOKK4UDAZDGV25ZHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5631 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5631.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index 55c232413e2b..d3052e6708a3 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1693,7 +1693,7 @@ static const struct regmap_config rt5631_regmap_config = {
 	.max_register = RT5631_VENDOR_ID2,
 	.reg_defaults = rt5631_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5631_reg),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2

