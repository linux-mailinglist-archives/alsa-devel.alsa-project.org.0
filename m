Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3A07510B6
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 20:46:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BB43847;
	Wed, 12 Jul 2023 20:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BB43847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689187596;
	bh=qkCExCaGBIGvLsAX3lQaHwTQziAm62Ha9pkgyNzgqFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WwHzr8n9iD9X+/kaHmS6/8vEzG9aj0Lm2QvAXRFxW+A6qial4U9FLGOmBv7sn10Bu
	 TTilDSXv1hvwjo5ouZmaifDJuN5MoSut66nwAOeRfxC3KNbO8X3VQALV2DCeMQq4NQ
	 bIxo2zgBsCu0TB6A7otndd+R+G3yW7EBMNvuc3EE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92A4AF80093; Wed, 12 Jul 2023 20:44:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73E97F80535;
	Wed, 12 Jul 2023 20:44:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36E61F8024E; Wed, 12 Jul 2023 20:44:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 77DDBF80236
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 20:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77DDBF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LoyXUnDw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24712618D6;
	Wed, 12 Jul 2023 18:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF8BC433C9;
	Wed, 12 Jul 2023 18:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689187482;
	bh=qkCExCaGBIGvLsAX3lQaHwTQziAm62Ha9pkgyNzgqFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LoyXUnDwST7X3OwukHcwOV054JxPAkRgfFV9ucKwEfe7PoBRQDY/7EQJjjvRuKjv6
	 HbVjK2nyTqGF/RzA3fYReXGWUzAYvio3uG27cySkXs/ZEhDGWCf5XR3SC+RydOPMPr
	 qkj1qWmegygPeQRUUQVYRDH0CgZ6OwPBDFo29BiaBti0ikLIPB97Zu9UppjKkmytq9
	 YlDY6pOhn4T7fLGf7mWonMuucEoMO1v9TqDMVnQaK1AYtIVSiJ4hJPvvAU1wyWBOHM
	 PKLMXry1+ZGE1npuFB1Vz623J/fn5SG72STqHj094vAN3HPJed6xpBRvwBG8p/Y9HX
	 SaxJL2660Bufg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Jul 2023 19:44:27 +0100
Subject: [PATCH 1/5] ASoC: sta32x: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230712-asoc-st-maple-v1-1-46eab2c0ce23@kernel.org>
References: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
In-Reply-To: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qkCExCaGBIGvLsAX3lQaHwTQziAm62Ha9pkgyNzgqFQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrvSS6pnp8TJf3DmUbGnqXW1F15EnUJCk+AIW7
 wDlxpEON4KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK70kgAKCRAk1otyXVSH
 0Cb0B/9jPsvkkCStJaYi4asEA1fmcpRPEYLbx3ARbkSs9EU5/Ofe4jCCqq+zFDpCvWez2E5uvRs
 5j0qipOetRFnvJcmpY5PYBFDTwdYbw7pg1DvyHmf1KDsIFJe2Ivo6Uz6e7wlmRJUQWPrCw9r8eq
 E3B5wKd3ZC7WviaCbRuMifmUQmg6XixnBZAz6kFhc2ENqPfaHLIvdgoCL0bI/aGdXVmxRXGlm+W
 G4uIUZN9kwN1rpMvJfbNTyGM5yB3bm+10zySLnJ2bog9CYfKVOVd1rG+NNCAFRfNbtepIDmkP+i
 foOBFxjjQ01f8h555Ig4+fDqr83EnsOEoBiXTUxaualgxIZk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: P5YHAG2HGXPYOE6UNJZCUAMSIP7ARJ65
X-Message-ID-Hash: P5YHAG2HGXPYOE6UNJZCUAMSIP7ARJ65
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5YHAG2HGXPYOE6UNJZCUAMSIP7ARJ65/>
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

Update the sta32x driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sta32x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 4a694d0bfd68..34ffd32ab9dc 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -1022,7 +1022,7 @@ static const struct regmap_config sta32x_regmap = {
 	.max_register =		STA32X_FDRC2,
 	.reg_defaults =		sta32x_regs,
 	.num_reg_defaults =	ARRAY_SIZE(sta32x_regs),
-	.cache_type =		REGCACHE_RBTREE,
+	.cache_type =		REGCACHE_MAPLE,
 	.wr_table =		&sta32x_write_regs,
 	.rd_table =		&sta32x_read_regs,
 	.volatile_table =	&sta32x_volatile_regs,

-- 
2.39.2

