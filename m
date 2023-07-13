Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B4751543
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33F18E86;
	Thu, 13 Jul 2023 02:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33F18E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689208042;
	bh=gr4V194GM9AwbQLZw3o0fLR+mQvArlDQoQoKogOSANs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A5//o2ndyGyo865b15V6sk2on4VV0+SzHPoCLdnWMp+mOifKcUc9xQ+qWfPeY5VIq
	 QhBIgPTJmSMuNvf9nNoQNYCz/4TdQMV8TVIRWCyo8+xZ5RXoHXEM8KTl94V00SxmvJ
	 21nNriAp7AgOXRuKNLzlqjD4EIFGVGMNMwrgztno=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6CE5F80791; Thu, 13 Jul 2023 02:16:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D20F8076B;
	Thu, 13 Jul 2023 02:16:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25863F806EF; Thu, 13 Jul 2023 02:16:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DC8D8F806E2
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC8D8F806E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dhA+Sa53
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCF9F619B2;
	Thu, 13 Jul 2023 00:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35D1C433CB;
	Thu, 13 Jul 2023 00:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207380;
	bh=gr4V194GM9AwbQLZw3o0fLR+mQvArlDQoQoKogOSANs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dhA+Sa53eG3z9t9R7aP6+n4zI9DTfFv/trh+Az2G3MDbZt/3d+B3TDv1tiAHZOH6C
	 nSnnyb6LDAAlV8YmTxCPypdRqIzrwh5uL4/u17hM7KofNN7N7K6Qf6Ke4PWqBQoRyT
	 F2OP0SrV0UUMGPn+A2KLjFG0crnz4MwEethKmZtxQSADLSqw8tIOaMdXp00uHyFhgF
	 7oYRddL+JJAGmj6h+A7dFXdjPw5/7SWAtfjkTcyoKlyjqhaSPNAEfJqtr8Bf4ZjMIB
	 DKmb3KiU6/aU15SF9H+AsHOHQTfYCEEdvPUQj32MHJPJy0mLBzrdu5ndC1VgQFU87m
	 uSDqcz93fKfvQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:57 +0100
Subject: [PATCH 44/48] ASoC: wm8985: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-44-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gr4V194GM9AwbQLZw3o0fLR+mQvArlDQoQoKogOSANs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HNyjBeY0MLXJ17MeRNMLBj6D9Qtz10Wi3SW
 K9pGhm0N+uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BzQAKCRAk1otyXVSH
 0Cn+B/9BdyNtMZoPnoGfWYJeMbbTwlJ53OkQeiwqJvob3AiMyDZ0f4vciGLJWbY0U1iih7ucq9d
 LwuIXCgVnLU/OAp/15a714l8a5KW9KgUF/BpDd/4C0VM0sPzMSM7fX4yYwfaPmaEklpX4xobjUb
 kj6yHvOs1bwzdajvz5PvtyAJfNbdQAzu9b5+6J8TiE6Z79cNND42Evbu/waPn+oXneNAac7lqp1
 5r2T9UzHAvZBmUvlwaWCZcrK9Fzqho7PM97pVrBNhXP+3wPyLIckxZLWEG+eOy1VFYFt3p136mE
 JgyGljx0Ty6fH7iNOoijpWifVcfx6mgtxciiu8y69eM9e/eY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: EHEOIMTOW33SQOPWR77VBHYIN7ZROHHC
X-Message-ID-Hash: EHEOIMTOW33SQOPWR77VBHYIN7ZROHHC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EHEOIMTOW33SQOPWR77VBHYIN7ZROHHC/>
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

Update the wm8985 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8985.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index c0816bcfa294..8606e0752a60 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -1125,7 +1125,7 @@ static const struct regmap_config wm8985_regmap = {
 	.max_register = WM8985_MAX_REGISTER,
 	.writeable_reg = wm8985_writeable,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8985_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8985_reg_defaults),
 };

-- 
2.39.2

