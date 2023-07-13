Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1472E75153D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:26:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7227BE81;
	Thu, 13 Jul 2023 02:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7227BE81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207960;
	bh=32QAqy4sciYh2rhvwNr5TWmnz/aq8Z9ODy8wTcsO83M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qkGQwreQS3aOqw6rM6xAYvRB1Sp4sLFmAb/4wFeTn/SCR3I8gwenkuWtGotmljVUV
	 ZIJ1ZtVyCmJ1yFb+s7YiFx4LQVMyL78xWsFU9WNdLxf5wiBZBASSfChvudPMTM4QPY
	 PI9FScIFNwkys+7lRR1H1BbhxEt5pA/lRL+CnUe0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD613F80720; Thu, 13 Jul 2023 02:16:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93074F80726;
	Thu, 13 Jul 2023 02:16:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAF22F806CC; Thu, 13 Jul 2023 02:16:09 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F7E4F806A6
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F7E4F806A6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LdShSqb1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52553618FE;
	Thu, 13 Jul 2023 00:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CE6C433CC;
	Thu, 13 Jul 2023 00:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207362;
	bh=32QAqy4sciYh2rhvwNr5TWmnz/aq8Z9ODy8wTcsO83M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LdShSqb1Mkw6+hLMvsT07NixvAgM26RA05pXnyu0kzyvndDHXI0C4ztTR1YWXaK6m
	 LjpQ0k65nXummCqZ5yjci4LLgM4+E4igXyJmGCrjJdWji8WQS6EJgDnUCH3rygh2a2
	 4ZgwxxRBWUgvny+m1cNQlxK5tZ8H6MDCcsBlWkArA1MvDU5h2+C/3Aoph68qwAlQj6
	 aogxmCtYe7rLPXDvtuQtcgEkDCuO5lx203GK/IHPye2rfHSMnusrdz8oLHWkWkmare
	 7zy+MUEhH1cMAdRJ4hvsi0asLYpNXXboRJw7sMUNA4R/p5h6McdsEMXjwNk8lW4Jdd
	 LwE5U8bevhxew==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:51 +0100
Subject: [PATCH 38/48] ASoC: wm8996: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-38-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=32QAqy4sciYh2rhvwNr5TWmnz/aq8Z9ODy8wTcsO83M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HJnlDXdmcrRthPIB7ojLkfAyEKfSbA7gWfZ
 wHjXp6qUECJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9ByQAKCRAk1otyXVSH
 0GaECACBsTpO1dcTW0NMo9FHQWegSMjSP0Z/2q73wwUhCXItMwa1G0kyVrBt0F3C/gCp2iAc2tM
 KamnPjElH7rw0n9MWEbyelK3AG/Se9z5Ucr/YW9FsnMm1CAZAvSKFBFdCJZFpWhzEUmcgAozKfp
 OH4Av7OLM3LlMidQlEOYklMroLfdMKfxRacw32PbxRsNtSo5EF/Tcw/B0cfgjuWZdzE7Lx/ODHW
 +o8Hnh6DaVWo5PQn++wt7bLjCBtF56j5j/RL8txCcjw867rpX907ADX+c5c/NLfBuXABUQf0VWj
 FxWnWN67gPLkRy/VMbpM9XX6ojRNnyuBkN/d9F0qfMMLoCBT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: XXZNPWTTGUYHF7E4CHJ5Q777PXJ3TOK2
X-Message-ID-Hash: XXZNPWTTGUYHF7E4CHJ5Q777PXJ3TOK2
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
Archived-At: <>
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

Update the wm8996 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index 5d0eb0ae0475..df6195778c57 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -2610,7 +2610,7 @@ static const struct regmap_config wm8996_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(wm8996_reg),
 	.volatile_reg = wm8996_volatile_register,
 	.readable_reg = wm8996_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int wm8996_probe(struct snd_soc_component *component)

-- 
2.39.2

