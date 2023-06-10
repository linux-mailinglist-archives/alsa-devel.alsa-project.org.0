Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6D972AC15
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30C66844;
	Sat, 10 Jun 2023 16:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30C66844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405922;
	bh=Z0hUXbKJ3fCLlOW0WvREe8KAWtPcnOGBJsfr3iqpdpk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MEIaazMKx6xzORR+QhJlLGBNHgguD8v7YVHA80yM9MrIsbxxj7aROCLmoQZpQrDm2
	 siC8B8MQp0bqYonrbQ3ph1bg7FEqZSb72NzRoZ+Gf3VWZ2L9zytFafNAJJz4bAoX3m
	 ZMXhGYVS3Nhtp+khMZYl6KNbhw0DDK9Nn0viIhwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04CFDF80673; Sat, 10 Jun 2023 15:59:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6886FF80672;
	Sat, 10 Jun 2023 15:59:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24492F80494; Sat, 10 Jun 2023 15:58:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8955F80290
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8955F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YXjUJbDT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8870361775;
	Sat, 10 Jun 2023 13:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EBCC4339C;
	Sat, 10 Jun 2023 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405498;
	bh=Z0hUXbKJ3fCLlOW0WvREe8KAWtPcnOGBJsfr3iqpdpk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YXjUJbDTfH9wBG08B1Uw8gWKf6C9PwdmCmJQEgESkihvjtYO/tA/jGxBKbV5sSF13
	 meqjU84Z5wZGlQyyMzpYdQczymyPFZM1ZMDAaK+29SbUSpvvNxSJ9f9YjoTy/OKYSZ
	 vTD9PV55c9eGoA/qXJMreipyho2pemghJ65UQcnRGkTau2tO+8QwF2Vs4lydip508B
	 O0ykr7XD8oNIBOdoO8An56e9Yl4tBjoz6OU92/6Km4LVPqYofRFMqnoRAYazKfVtM5
	 sIMX91SBpmHD1yzUsldS+wsO19eV5kWWFdQSa4Nt96W7OFJNY+mVwPH1tsv0v8vhO+
	 rAJm6AZxhs/yQ==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:57:55 +0100
Subject: [PATCH 09/16] ASoC: rt5645: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-9-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Z0hUXbKJ3fCLlOW0WvREe8KAWtPcnOGBJsfr3iqpdpk=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhpSWxjSVEz+2FvvdTer7wPfV9dPhjNzVH184rm1y51Q5WR3R
 2LO/k9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYSJAS+z+VBLFS0Q7T23xhvPn8vH
 8eMqcIqB0wV0/hvrrUJyf5puX+k0rTpM8wGi6fUayqddnZ1vKIzfWkeo+519pnlBZOv82RobD9tWa2
 h+iFrxsvToy3Fwo1YnDr8vQUvm7PGP789PvtnWbp25beevCpuOWW4bPNR8894vMxUrdu8jh7hrf4/+
 2W5Vz5hWp1ETPVRDrWOwm0z7bP5/n0vC0wIG6q6Wl+DelAKctzjr6vZIqNg6XvTFM4t/tshoGHwebO
 K4Hu1fo11XV338zcu/qj+6K2COb6z7d1Lknf2vakUsXzSWW2BOfUWSZvFbKOvtr9nHEOB++fXGVJ6X
 frX014J55t+qkpyPjEXCHfqJj1AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: RY4NBKJT54FEYXXCDOFTGVYJSTLHY5UM
X-Message-ID-Hash: RY4NBKJT54FEYXXCDOFTGVYJSTLHY5UM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RY4NBKJT54FEYXXCDOFTGVYJSTLHY5UM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5645 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5645.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 7c7cbb6362ea..5223742e70e9 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3546,7 +3546,7 @@ static const struct regmap_config rt5645_regmap = {
 	.volatile_reg = rt5645_volatile_register,
 	.readable_reg = rt5645_readable_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt5645_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5645_reg),
 	.ranges = rt5645_ranges,
@@ -3563,7 +3563,7 @@ static const struct regmap_config rt5650_regmap = {
 	.volatile_reg = rt5645_volatile_register,
 	.readable_reg = rt5645_readable_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt5650_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5650_reg),
 	.ranges = rt5645_ranges,

-- 
2.30.2

