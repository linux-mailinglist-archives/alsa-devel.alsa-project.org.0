Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30D72AC0C
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:02:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CCC1868;
	Sat, 10 Jun 2023 16:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CCC1868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405770;
	bh=5/rHy0GpU8Dv14HxPIUA83YpgJHGyedM9hr4Hsou56I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EkVT+gBD1oQlrlHMH6JyyPsV62AX0sYMwhsXyYs93rEj5mxeMg94pOJEQjMU2dW5N
	 iZxOml5LpWn5ADzVRZf5J25SbSbm9TVaDocOJWq5kQBqo7a/bmdO7xMv0rFUZ+YeYr
	 KCiym8Ekv8cAM7c87Lf3G/RU0pxEo+fyOujpAx4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78ABFF805D3; Sat, 10 Jun 2023 15:59:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A56CF805F8;
	Sat, 10 Jun 2023 15:59:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88A2DF804DA; Sat, 10 Jun 2023 15:58:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 23FE8F80290
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23FE8F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nSDHeFKa
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D66546177B;
	Sat, 10 Jun 2023 13:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660B9C4339C;
	Sat, 10 Jun 2023 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405491;
	bh=5/rHy0GpU8Dv14HxPIUA83YpgJHGyedM9hr4Hsou56I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nSDHeFKa3A+yQOKw+8hS9G9IzksMzH7NE9R1dKCdJM6Z4C9Biy4QNJqBRwjmnGMWf
	 ESISRUD04mikT/Vd0EpqhSJtSEyC1cig/DN/er2Xa6GG/mHAbkKBrrBDm2uISjnpi1
	 jm2l7D40EQUeaJglQF+Gr2T/c3+UbStpyES7V7jWW34T3JhXCSeszLdLezuprMsNwi
	 plTFVI60T/JvNBDAmJpTt/DcW4Mm5wr6TXsVia41XL4GfUZFUF0B6OQn94th5IevZS
	 3zjO63Xxo2vrMORd583sAMC2Q6hrBg3JL5KGIdLPgI1RfofxyJmnEJQoY3U6oGDr1A
	 HqaW+vcUyzN5A==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:57:50 +0100
Subject: [PATCH 04/16] ASoC: rt1308: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-4-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=977; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5/rHy0GpU8Dv14HxPIUA83YpgJHGyedM9hr4Hsou56I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFivDohRXNVB2bEbv03N7y8x3AhSedhRAl9kxmq
 Y8s/miuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBYgAKCRAk1otyXVSH0O1XB/
 4kuIqeye9Us8qfz1uYLx3LWR8YfNAnLq8lnWaYjXwvCMLp5pyilc3U2I0j2RM7sx26lfg+huBhDP4f
 Ly5eM+MlviaAlbBEH4pgk7OFCSYUOkI2lpJJvE/ZGdJJO/U9gB9/b5DUaTVKVX0TMSgncsRmwMyzia
 pI8D2lgJ+jX5MLMARidCZDSh2q1y7pJHWmiV14zdBg31e9vPTNPpWSiMXQ+dQC/p4NlXkxC2m1NZnz
 oioTg9bnztLt27H+sB0H/aehGVjkdTmEoN4dLNP2qA5EGGw6wY2Rs3UryH1dtbfNU3YfzLeNfioax6
 oGZgOBWwFiFxIqNQtScc9wR4stZI5L
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: AJI3TDMKYEGAVM5XRZZIM57U7GB54VGH
X-Message-ID-Hash: AJI3TDMKYEGAVM5XRZZIM57U7GB54VGH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJI3TDMKYEGAVM5XRZZIM57U7GB54VGH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt1308 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1308.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index d2a8e9fe3e23..c7da8f5459d4 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -773,7 +773,7 @@ static const struct regmap_config rt1308_regmap = {
 	.max_register = RT1308_MAX_REG,
 	.volatile_reg = rt1308_volatile_register,
 	.readable_reg = rt1308_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt1308_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt1308_reg),
 	.use_single_read = true,

-- 
2.30.2

