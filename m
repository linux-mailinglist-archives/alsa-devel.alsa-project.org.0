Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2236B72AC1A
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:05:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D9529F6;
	Sat, 10 Jun 2023 16:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D9529F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405952;
	bh=kGYIIDPPIe82bvGqgcH0T9fM32SS97ha+G1wzDbCwfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UQd86Pmau9U1fXedqMs68Ts6/lotnL9QzBfaN2qRJG2ipEcdyrwpGUrXvLaIziN3f
	 vvB3JaU19R2cH6Ohq9WSXa08I1ONmh5450i5b6cG0CZvMpQgV/YBzyeAIwki5TVH5C
	 roVH5nvfMIRZOd2duH8tjJTh7xTzKTIRLGz7VQ6s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9584F80681; Sat, 10 Jun 2023 15:59:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1170BF8061C;
	Sat, 10 Jun 2023 15:59:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C06FDF80494; Sat, 10 Jun 2023 15:58:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D3F3F80254
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D3F3F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NuM1TvGz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 329B461781;
	Sat, 10 Jun 2023 13:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7144C433EF;
	Sat, 10 Jun 2023 13:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405488;
	bh=kGYIIDPPIe82bvGqgcH0T9fM32SS97ha+G1wzDbCwfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NuM1TvGz+J4rQ5/bO+ShsBjFlEzT/yx36jp/r9MdZMt5dO+c+hgd44EH2XMXZttUu
	 7uLUhqzpZGLBE6/Mx0pj+8f9cB7qCgMOTsPH2+yJ56AcYQCGNFYMwazGicgs86+Q5f
	 lz1UEMMvBm+/6zQG3ybcw0UDD2Fz/M8ntUChjv09HlA3mne2shy5g0j4yR/hLircli
	 8p2j51gCSU7lHQe8asdmRXXs0RFaOVtEqouInQi+whx8cQiR1lfKG19XqL8qpbRwy1
	 fsenTRxfKi/A5VqUWYY6J8tzuRqeE7QPrC2BxVp4g86m/V+UeS9QcFIuaqI2gdZ6nw
	 aFa7E0KvJW2Lw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:57:48 +0100
Subject: [PATCH 02/16] ASoC: rt1019: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-2-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=953; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kGYIIDPPIe82bvGqgcH0T9fM32SS97ha+G1wzDbCwfE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFgZ4A5/RHjn43XNyHJhrd7N7JLPcUX9dE471a6
 MZfXIlSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBYAAKCRAk1otyXVSH0LhkB/
 9Ym7PqCjo1MHwur7i6bLoXpRljVQGPkyijGxkgT3Yvzjutv2MkEyWSwHSitLKdy1xB+BWmSihLy4yl
 x0ngRWmnpuThJYYDQbi0F5HIbnmdJas9TRIq4tOXVvGs5faiuNrP0DCSeOP1Uq0XpXpyob++PZ3Evl
 Xa+/thpYYQqzPrB9CeSv/myWpinaIdhe7bKwdHNMzotucWo3VmrK+KleIsEFHA4HwA9ARqHf/eSdy6
 m7WhNalAkAIkUMbK5ec5V0TEmcYc9zwp2pDmZli0Uywzm9dAFEKrtqDy+ySlHzHlijJEpwM2Awkn20
 OD1dXQL/N9pUSe6RQmOOIbEwEtEN0e
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: HS7V4E5EQQ6TWEZMGWQBZCCX6BU3NY6O
X-Message-ID-Hash: HS7V4E5EQQ6TWEZMGWQBZCCX6BU3NY6O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HS7V4E5EQQ6TWEZMGWQBZCCX6BU3NY6O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt1019 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1019.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index dff2596c81eb..0f7707a605d6 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -535,7 +535,7 @@ static const struct regmap_config rt1019_regmap = {
 	.max_register = RT1019_BEEP_2,
 	.volatile_reg = rt1019_volatile_register,
 	.readable_reg = rt1019_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt1019_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt1019_reg),
 };

-- 
2.30.2

