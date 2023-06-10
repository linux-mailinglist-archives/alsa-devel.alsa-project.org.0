Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C13F72AC04
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:01:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB44C209;
	Sat, 10 Jun 2023 16:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB44C209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405710;
	bh=dHUFODBeyvpw04favawGFg2dW4cHep0Mu0RxQFbnQdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nvZHzwIi5Em1Rq8/F/mSTTJIfjCiIjVHj97gJT2wnLDY8yhtPxrAP+ab11IkhQTaF
	 sXvM5kSXostBSLxMY2idMoJHZsZoca0J7e0clPZf+ZsW+0nLb9fLkgUV5VnZCRHWPj
	 36M/gSm3N/4SftBrsGnwBUyPDgqw5RN6hHP98GkU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84C47F805E1; Sat, 10 Jun 2023 15:59:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D9C8F805B6;
	Sat, 10 Jun 2023 15:59:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69F23F80199; Sat, 10 Jun 2023 15:56:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29167F800C8
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29167F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N3G1t8oe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BBB7360C66;
	Sat, 10 Jun 2023 13:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E0BC4339C;
	Sat, 10 Jun 2023 13:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405412;
	bh=dHUFODBeyvpw04favawGFg2dW4cHep0Mu0RxQFbnQdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N3G1t8oemQyBvcdiVB8JDXxbP4e3K5LvC1ybsssQmDdObyzLWa+HTPl4PUVYtdq6S
	 5IZtBsPXY9esKAqD7kbqltmw6hKOy6d7y/BZkGaZN+xN667sMqU8uM6PzKPDijCEG1
	 7HzdHFVnGnyJ14q/+6DGbBDMoZBFGwSHT3BS4rPSgwkcX6x+QTHZFm4aUBzWAy9jo2
	 z2SlWfnOwWdYU1gWpbi+3szH/9C7h6eM8TTMBJslnqqBtSV8kFSfSoZP04Q137ceDj
	 yhSTQnm9O+d4G4Jc2F5ltW7hZJx/X8oZDm+Nqv82bEWC9JJozm0HDz0MG+gqZsqguz
	 iir9N213Dk9LA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:28 +0100
Subject: [PATCH 08/10] ASoC: cs42l83: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-8-b806c4cbd1d4@kernel.org>
References: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
In-Reply-To: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dHUFODBeyvpw04favawGFg2dW4cHep0Mu0RxQFbnQdY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIENzQ880nlFOURO3Abbo5ZIFnNzY5W2Wy9q/e9Q
 aNpvMzSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBDQAKCRAk1otyXVSH0O6/B/
 9nnYbVOz+alwfrmXSxRfxVnlTLF2nKRZhM22DqTT2MoKsbYFOP73kwqvX9TLyxmus/xPMxfdgdldkd
 jr3bRJ6FGyg1n8IsIhxzpr2n6tfBTszjSwroDjCZbhvqkdg8fWhz42va6aop7x+XVKeKshxRaY52EU
 BcoenD1HiEyNikV3FS8nBGC2kiVly5tQG0jUvGYr4I4yuNchLOUleWblfmUFZ2Yn1MnL8bsw2seu7X
 T4guxnkgc9T05AWWtkzgYa4A95kyvwnV3I5tqbfzVYP6iCRm25elfNersiKTEr+8K2gFipujK5+Jkd
 cspqkmtwAE5DDHkm4k712JJVjzLB8H
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 4RTSFPB6KUU5HFZR2CAMILTCQ6IUAK5A
X-Message-ID-Hash: 4RTSFPB6KUU5HFZR2CAMILTCQ6IUAK5A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RTSFPB6KUU5HFZR2CAMILTCQ6IUAK5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs42l83 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l83-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l83-i2c.c b/sound/soc/codecs/cs42l83-i2c.c
index 37629ebd90e0..3185b486e276 100644
--- a/sound/soc/codecs/cs42l83-i2c.c
+++ b/sound/soc/codecs/cs42l83-i2c.c
@@ -158,7 +158,7 @@ static const struct regmap_config cs42l83_regmap = {
 	.max_register = CS42L42_MAX_REGISTER,
 	.reg_defaults = cs42l83_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(cs42l83_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.use_single_read = true,
 	.use_single_write = true,

-- 
2.30.2

