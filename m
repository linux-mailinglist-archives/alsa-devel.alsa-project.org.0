Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E219872AC12
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:04:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BA35839;
	Sat, 10 Jun 2023 16:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BA35839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405876;
	bh=iqTyAZGV+sSwPaFcYVoy91OygAWFcvaLWkJ5FuX4Z7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DhffwRDiIocLTtpYPo6zy+IDnhFLZ/lgrOnhpP5dWT4HPAKK7quEHq4MxulI0VDno
	 xr/Z6PeJcVUn66V7iZvlvWR0K4tzARHicHL71gbhnJX/OHXQIDSGzQ7uzpEQ/AAbU1
	 dDsvaDJPZfOBiBM+hwzMGXfygMGDrVW92Wh6MLKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FA2CF80651; Sat, 10 Jun 2023 15:59:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2BABF8064F;
	Sat, 10 Jun 2023 15:59:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CCE8F804DA; Sat, 10 Jun 2023 15:58:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D4195F80199
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4195F80199
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DIbngDkr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F57F60A3B;
	Sat, 10 Jun 2023 13:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E977C4339E;
	Sat, 10 Jun 2023 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405502;
	bh=iqTyAZGV+sSwPaFcYVoy91OygAWFcvaLWkJ5FuX4Z7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DIbngDkrrRwHTvB6ot7LtRxd44s6lwGeVOLp4QQwExZwlhI3TqRP8tiAII5WAqJ2m
	 V9IgiBuyiXzLJe/k/BSf/2zn4Q40SVp9PeUdpyxiC5C7RcpuPglIvLUgNZROeJquQz
	 wrxN6eqoMXGLn8eAxipKAYjtT0T+Q78Z7Ghe+pytC7YFO2lTnnvAzeIJAxST6EXd8Q
	 xrOrh2db+7w/crNmPxg8BpRyHy/Hq1nt0dNsDzHkbumtTu/yEoVSEDpUJ+GmcUEmBG
	 UvEZruviGBqPrXVYIigZRl6n7hq5CWqpAwy8Raevkpko8/k5P0PBmWcLC0OHJuGKG1
	 f3ELHVEeQbhLQ==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:57:58 +0100
Subject: [PATCH 12/16] ASoC: rt5665: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-12-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iqTyAZGV+sSwPaFcYVoy91OygAWFcvaLWkJ5FuX4Z7A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFoOBzXtlGEWTaUJH0wcJ+vKyRq/U5llKgB8W8v
 zLxKr2SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBaAAKCRAk1otyXVSH0IL+B/
 9w1OQCvs9WpNOVol2J2gP8GG4xRsoBrIqMfk1wyDFgdQje2SXBmSdFddRBeNcv0UgJh7xtYQaicZXb
 MhD7yVT6L4k2xLI3+FoWnvDg8zuu9ytdW4w2d8O+9qqUBcrRpKApI503Vb6L2YGbP2L49nK/+NH+0r
 g6YQUVLqVjtgD+Pfch9oM+gUuA2xo4tp/pz7Yokx6nGNvEOEdrIuEBEAop3OQW/v22lheUqDlpejVk
 UYnqzuDVKJ+E1nz0rBJetDqLC20Dt9lcxEtg8slmkFXPdi6tcxq5SHYn9ycP4h+/rrNmBb5eI4uf+v
 D6NEa8vTUUm7XF088c1OzEMj/qAgxr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: P5ICMT2GCQIWIBEJKXYOTM6U6NU6CUA6
X-Message-ID-Hash: P5ICMT2GCQIWIBEJKXYOTM6U6NU6CUA6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5ICMT2GCQIWIBEJKXYOTM6U6NU6CUA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5663 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5663.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index f73751dbde30..ee0820a43df0 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3268,7 +3268,7 @@ static const struct regmap_config rt5663_v2_regmap = {
 	.max_register = 0x07fa,
 	.volatile_reg = rt5663_v2_volatile_register,
 	.readable_reg = rt5663_v2_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt5663_v2_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5663_v2_reg),
 };
@@ -3281,7 +3281,7 @@ static const struct regmap_config rt5663_regmap = {
 	.max_register = 0x03f3,
 	.volatile_reg = rt5663_volatile_register,
 	.readable_reg = rt5663_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt5663_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5663_reg),
 };

-- 
2.30.2

