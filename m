Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A87C9751547
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2272E87;
	Thu, 13 Jul 2023 02:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2272E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689208110;
	bh=eySvdiHt0nvShNYD0dPWcUpDt+Gp3/9d9uPK51mRSJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G0spoE0+MS6TUKHPGfz+WT5G+oMuyBRQTuYqPDdAPk3GUd3rjC9PFrJp58PvSaYMG
	 d9b0iQg6n3c3ijuU2/wtzxkxaekPrMSwY+TVjI63z4c0EVg9Hy4g3JaCfyEWWkBEJU
	 qxaMcllkRkFYxi3yT7HCOXEcm79TT8OvUDM8/av0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52D4AF80815; Thu, 13 Jul 2023 02:17:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7457EF80804;
	Thu, 13 Jul 2023 02:17:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72BD7F80760; Thu, 13 Jul 2023 02:16:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D8816F80724
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8816F80724
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d1Xt2Jn3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6C99619B0;
	Thu, 13 Jul 2023 00:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE45C433CC;
	Thu, 13 Jul 2023 00:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207391;
	bh=eySvdiHt0nvShNYD0dPWcUpDt+Gp3/9d9uPK51mRSJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d1Xt2Jn3aX6zpDurP2+FCcxFmaBNLqSmLS4Zgw+jUIF2roRiz2bZeegv3rSn653hN
	 JSRaGEQ8YgzZIAFpDVsum37d1Tiah+O2s+U9ZXtt5X9oyg226FEByFLT+7nnrJRlkb
	 kraJg6EZVEsmdnRvz1pJvvgpU0X8ByRTlwgJDrPvI5tKjXGUj20y9pJdh0JorMPAHF
	 rE+voyycljIKTXKEPzEZsmmiBKKhZ6Em8/rysNtbHLlm6XB8mI2CixNl3laMYmTu3u
	 wi0N81+ZR6X09Q07sAzpDNLwtOorkggInFvawhY51LIIoKhpIzc8aphVSMQPm4cj2+
	 uKkskateeZV9Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:14:01 +0100
Subject: [PATCH 48/48] ASoC: wm9713: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-48-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eySvdiHt0nvShNYD0dPWcUpDt+Gp3/9d9uPK51mRSJ4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HRShdMLpPh/QY4YGuJRmn8dfk8SMFLeNE6h
 ce5j0Ttz4qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9B0QAKCRAk1otyXVSH
 0O3JB/4qj2IcnrCuzWlGbEJKY9hEOk6cmL/fFRpYrEdvoG1cpd/vy5X8J80DZWwsAD84oW2mY1K
 VWU8C/8m5jJaA2U1wufZr5z880cBaQXCGRWTWW5L1ch0FtIyp8L5hm1zrwTytIJCSgRCa4onpYg
 Hpdvqx569cZta53hYBV80ICtdXGTNH+ewKWEwU1oTLk6v9x6DoKAUpYdy4xrrNSSX61yF2+mWOK
 P8tLhYceWRaOJsT/o75YCmeth3tWB2btGoD3IK3Sc51B4HaVayBPGQ4lETsdpi0TYoLSEklCpPO
 d4tp/+41gfiHzWGn6O4o3DIMWSEpKhHO0PXs7hzfxYW06qV2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 552LN4OQV3GX2EPPHOUOR4RMMK6FRTVW
X-Message-ID-Hash: 552LN4OQV3GX2EPPHOUOR4RMMK6FRTVW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/552LN4OQV3GX2EPPHOUOR4RMMK6FRTVW/>
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

Update the wm9713 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm9713.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index 5d2e54e06e30..64b69316e4c7 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -727,7 +727,7 @@ static const struct regmap_config wm9713_regmap_config = {
 	.reg_stride = 2,
 	.val_bits = 16,
 	.max_register = 0x7e,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.reg_defaults = wm9713_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm9713_reg_defaults),

-- 
2.39.2

