Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7265475150B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:16:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFF3086F;
	Thu, 13 Jul 2023 02:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFF3086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207382;
	bh=UlmasQmPNsZaeQKAgTGST/YNDp9S79cLSWd1E/jlxds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p9+kofqOHdbp4ce5hK+ArbhLrvz7IHzLpUB28j+K6oXPiQla0fIXIW40fdJs3DtHj
	 xCtVkBreW0SeYc6OkkhJMd5OiPCXz5VEj8cXQJmsUYlSG2WtysXOyg5dxoMFkuiCIO
	 8ZbUsSN6PjLIvONAnr19cJFQ4zODLb737+gq07SA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DACA4F8057E; Thu, 13 Jul 2023 02:14:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EE50F8057E;
	Thu, 13 Jul 2023 02:14:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C244F8027B; Thu, 13 Jul 2023 02:14:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B5768F80236
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5768F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ql0AQTPL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82A4E619B9;
	Thu, 13 Jul 2023 00:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD54C433CD;
	Thu, 13 Jul 2023 00:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207263;
	bh=UlmasQmPNsZaeQKAgTGST/YNDp9S79cLSWd1E/jlxds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ql0AQTPL5OuojiZHV82IaqvCU6FbRn6AJMdAevSrW04sfvuFqrwMbCSiuTT7J16gC
	 32ooiy2OG7bLEkd/eUFQlXAhQtdEkjHBQVR5dqOBePb46pM6NRvTkSerjJmy+b+vEg
	 kNIfSJhplqE49HezVq/QIaliawS8lu6eNXlqv2KHpXak3/nvh5GD0Z52nCXpr0hMAD
	 mAiN8ohR9C1IRtoLOt8QeXEx7FWoURdcd/9bI8HZZC/FOwtEnMVe4u//V2ttbbH3M+
	 YzO/fzJoEYpkKp99sFHDXh6ahTyRBq+ObQ+fMbNRtJdDNvvMVyW3iHK1f0Kvrs0C2N
	 5JOTzACLeC3Ag==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:17 +0100
Subject: [PATCH 04/48] ASoC: cs35l56: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-4-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UlmasQmPNsZaeQKAgTGST/YNDp9S79cLSWd1E/jlxds=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GvgMMoiVebpLmS3DkG8knCnlAtkaiCfimdz
 b+UZFmECV+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BrwAKCRAk1otyXVSH
 0B2mB/9FbuFtrymB7rNZ7LLNjgnialurZjI4W9gdItcXrrhSfL5GYuF/Hshf2nOb0Qb1RtBFHuV
 +0aT5cI0Zz+CRhNHinLBkh7mIQorByf1j22vMt1YBqVLR5QHkafElQSlYy39i9Pdc5KOYj4OLSu
 URLE9Jvte5mSmddYa3aJJymzaTJkW1CX3BUrufiJTnvuFur8sYWFOs9g7nZjy5bzRbagiGHC/VO
 ucIVjsYLQIhnknQSOICEnUwx7U2bG0wS5qAtIwOflDqWF0Y2vtw/BdBirQyMYIqITeEnsR2R7Wt
 G85X2ynH064YmQEonmPKRWvgDo8hlfdXHQ7JTQRuiBjeSnVC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: N6NTUBAZGECBQ662AOE5ANSLBRSWKWEW
X-Message-ID-Hash: N6NTUBAZGECBQ662AOE5ANSLBRSWKWEW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6NTUBAZGECBQ662AOE5ANSLBRSWKWEW/>
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

Update the cs35l56 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l56-shared.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 60da8c75b7b9..d561fbdc12de 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -319,7 +319,7 @@ struct regmap_config cs35l56_regmap_i2c = {
 	.volatile_reg = cs35l56_volatile_reg,
 	.readable_reg = cs35l56_readable_reg,
 	.precious_reg = cs35l56_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_i2c, SND_SOC_CS35L56_SHARED);
 
@@ -336,7 +336,7 @@ struct regmap_config cs35l56_regmap_spi = {
 	.volatile_reg = cs35l56_volatile_reg,
 	.readable_reg = cs35l56_readable_reg,
 	.precious_reg = cs35l56_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_spi, SND_SOC_CS35L56_SHARED);
 
@@ -352,7 +352,7 @@ struct regmap_config cs35l56_regmap_sdw = {
 	.volatile_reg = cs35l56_volatile_reg,
 	.readable_reg = cs35l56_readable_reg,
 	.precious_reg = cs35l56_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_sdw, SND_SOC_CS35L56_SHARED);
 

-- 
2.39.2

