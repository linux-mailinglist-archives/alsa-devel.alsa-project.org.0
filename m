Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 507BD751510
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:17:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E1CAA4B;
	Thu, 13 Jul 2023 02:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E1CAA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207433;
	bh=xcYzg6z0Vv0wEuoBCXIuRt3deUbwZ2sskYeGNAS0OMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aX3mDbacOBXaQSZABRYt/98IdD5sAzwoxiaPX/cBoJK8KfcRjpnaGmZvQ8iQ6cbBS
	 aYPhb+qgfQ/ni+slqSSmwd0pNwN2Xn/lPeCsXUnuqtFPqw8bTiBwWOuamqWGzbMO47
	 5cY/eZnE1b2RZXwQjcNujdqdhOXbjYp43enXPHBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CBFFF805C1; Thu, 13 Jul 2023 02:14:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F819F805BD;
	Thu, 13 Jul 2023 02:14:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1393F80551; Thu, 13 Jul 2023 02:14:33 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DC78F80249
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DC78F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VfgM0d7d
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 573DF619B0;
	Thu, 13 Jul 2023 00:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C765C433CB;
	Thu, 13 Jul 2023 00:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207269;
	bh=xcYzg6z0Vv0wEuoBCXIuRt3deUbwZ2sskYeGNAS0OMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VfgM0d7dbvn4GRVjdxKuRRdIbtDcXEkt8eeU4vEcD1Vr+VC4Zm5//1AVhVz/BZO2Y
	 OkQ5Oz+98EGl60eFTlt5X4U3R5y+XqJlNFfQgWXqA6ZuHjuFyAoJmWo39+NHjBbW8c
	 30hZEVDafUOx/M+Y8eYGgGQt6+pr5VH6iX5uBxmAFLPGJs0z20yR8hSAOimmuBeJH/
	 sQziweFsTs/wjzFXnYDkds+3rdv0Eqsw01S+XXelYzBxDY7dGIVEpkKtLgmFjoiI2I
	 pJpge5xnPj9JuSuA0SVyj6EPLNZioGPm7pHJ5ul4XlRiMwOdRzMbm+s1cdfSsSoGGq
	 1u+OxaB0/VlUA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:19 +0100
Subject: [PATCH 06/48] ASoC: cs4265: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-6-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xcYzg6z0Vv0wEuoBCXIuRt3deUbwZ2sskYeGNAS0OMk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GwcXN+fZ/ppjnwNpDPxNTnzVCh5pttcAyyz
 tMUaaN2r4mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BsAAKCRAk1otyXVSH
 0Bt2B/49dPzdvrwOLnkaMf0s+oaB2unZV5Tf2h+yNnT9QRh5S7L3woahvagDZs5IuEt4aIPd3Py
 w/vy8u56xtX6hLL9CJTbGP8s1Z4qG8MjT4iPbBWyUyZGxDcdgM/dUkthxIJqpQ918tKcLe+kHNe
 8O9E3qI7T9BXpjEvwXMGSXN7uHF/mAjDq/4BZzwb21ONze9h1uvuqWIXgvVHR9MH6wckSBCMpZ/
 3qei7r7HR1Z4tU2u1zqcOYjssIJtuqrkYgz+1jxYuEthmJVyGm9eMWJBYXTAXHxvOCtmsSfNee5
 bKSDipykOWKR+zNaRfgHsKsm4Ej7RsmEjZQoPVIs2eRjaJ4O
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: QNCXWHDMFWB77N46ANKUIN7WWP34ITH5
X-Message-ID-Hash: QNCXWHDMFWB77N46ANKUIN7WWP34ITH5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNCXWHDMFWB77N46ANKUIN7WWP34ITH5/>
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

Update the cs4265 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs4265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index 0cfc5ab36a13..1ed1e60d8e53 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -564,7 +564,7 @@ static const struct regmap_config cs4265_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(cs4265_reg_defaults),
 	.readable_reg = cs4265_readable_register,
 	.volatile_reg = cs4265_volatile_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int cs4265_i2c_probe(struct i2c_client *i2c_client)

-- 
2.39.2

