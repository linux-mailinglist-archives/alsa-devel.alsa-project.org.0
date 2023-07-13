Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0C4751511
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:17:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCF5886F;
	Thu, 13 Jul 2023 02:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCF5886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207457;
	bh=IBNC+v7RMLGIksUTsABHCIbFxxoeRBCa//WWLfSosN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YE61+qJSRMWGnciNFpv0vcGj6xSM75A8184EGtzsBdaPj4Xlxf7Ye/Lm2MLSYwtcX
	 yRvQvLNkzG00bt4449d9dR1gldZJjqthifR9qY8G+a52pom7m3aPW0r/0icvoGYErQ
	 QlJU8UVLfGkWuhLAOPcaN8470+hRuVXZcmT9ovEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0350F805C8; Thu, 13 Jul 2023 02:14:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34FAFF805C9;
	Thu, 13 Jul 2023 02:14:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52E1EF80567; Thu, 13 Jul 2023 02:14:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BED8F80567
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BED8F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EMmd1eix
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C49A61987;
	Thu, 13 Jul 2023 00:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52790C433CA;
	Thu, 13 Jul 2023 00:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207272;
	bh=IBNC+v7RMLGIksUTsABHCIbFxxoeRBCa//WWLfSosN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EMmd1eixNwv6KWkoHx9z4i+iDmH5deWJ2rQKc1+s9qPGohWPtnUdJeWOUJuZH5Wwq
	 HM5UZCDyfvaKS8yFOVVEhJoF3sSsh/7d0NprxSiqYFOz+5VzJ9Hqk8zc579+PrKGW4
	 2vBw9Fejta6PDW4sR6T7qBqTz7MYmXpneUGZI6sn0gzkgJfC1g7h+4ibrGJ8MVCFZX
	 h4fUXEXl/RVLCiyZg/wZzXpuezvWb26XlXFsoJjQuLr7fbNZ8YLikgrvyWCtmttPAB
	 153cZBfVp8an+PpP/pexs8MmPtVxpaPxDz/S8hWJc8GEPKzCbL6tPiRi+XZ8bcMABr
	 wrhfS6oggMBPg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:20 +0100
Subject: [PATCH 07/48] ASoC: cs4270: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-7-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IBNC+v7RMLGIksUTsABHCIbFxxoeRBCa//WWLfSosN4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0Gxf/SXAbSQasBLaKdb1fjAWqgMiSrK6A8bZ
 x8Azllv38aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BsQAKCRAk1otyXVSH
 0Gc2B/98jB6JhpdLevDwwfKetvGbC4fSEKfcKcqqxABC7XhCBW5SGrvcs4BmzBPBp1pqKYm/NYg
 YztJW5wf14yCnD3rySWapsSM+siCoKXSYKoND7dWP6Dmi8OHJ1rWG6ENfd/vEVbm2URV952+CXu
 YhSEe67hkXooenfhZ/X9F3ciRxF8zcfXpApQeNiOBLYalfkpYWwk/K1FwGBSasi4fwxb7QwT8nu
 qI+vSm3a0xluonVHQ8pz+QJsUhJHv24ehFI7HStGql54U/pIheYVTekYWn25f/xZhMbbjDCvuAb
 FmTgMVlX8Aj2xB4dt5eUJviwWKSW7B85yMepEqhy/k1QrKNY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: EPJTDEEOPLJYQPXFBTIDW7DJXRS4564D
X-Message-ID-Hash: EPJTDEEOPLJYQPXFBTIDW7DJXRS4564D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPJTDEEOPLJYQPXFBTIDW7DJXRS4564D/>
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

Update the cs4270 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs4270.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index ab32f15e3b44..3df567214952 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -636,7 +636,7 @@ static const struct regmap_config cs4270_regmap = {
 	.max_register =		CS4270_LASTREG,
 	.reg_defaults =		cs4270_reg_defaults,
 	.num_reg_defaults =	ARRAY_SIZE(cs4270_reg_defaults),
-	.cache_type =		REGCACHE_RBTREE,
+	.cache_type =		REGCACHE_MAPLE,
 	.write_flag_mask =	CS4270_I2C_INCR,
 
 	.readable_reg =		cs4270_reg_is_readable,

-- 
2.39.2

