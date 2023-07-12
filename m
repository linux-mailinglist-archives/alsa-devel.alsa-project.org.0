Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0015C7510B7
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 20:46:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0023D852;
	Wed, 12 Jul 2023 20:45:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0023D852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689187601;
	bh=eUsngsu1vt4OVmBdpgxro71+wi0EoT6VyaMY5Nk5j2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MXRa06vHg0tDdLivrps+7Wsy28zTWK/I7do6TXF4+2hibtpHCa6MbF7tE1aNDjwaB
	 WnLa7HP5OONzpRgrU8RLUsWd4ELlaRnQo0ejnNoeSLZ0mfonBmucaD650phspVSfQa
	 qPDbqiCiVjjTKpbjYt9zR1vlmpU/KZXmCfQTDrig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C323F8057C; Wed, 12 Jul 2023 20:44:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0D50F8027B;
	Wed, 12 Jul 2023 20:44:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E66F3F80249; Wed, 12 Jul 2023 20:44:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DCF06F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 20:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCF06F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JMFLQEg2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6FAF4618D7;
	Wed, 12 Jul 2023 18:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1675FC433CA;
	Wed, 12 Jul 2023 18:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689187483;
	bh=eUsngsu1vt4OVmBdpgxro71+wi0EoT6VyaMY5Nk5j2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JMFLQEg2BiqAH6sRWX6fRprFfhs1V7EvI81ddk68g6FUvKgU1psE1GMsM8IWAVBbi
	 FvAyCGtE9x02xfSgwS09lVobobJXJVlNnxoiREwXb0cEGwQbB2Y+plqsgmDMV48zp2
	 D8xOJoGdUG36vgPWeKspj7fIzyCTRXutn2yUvgGsRVHjB/fbw9ohD3fUm2KhrZe8hB
	 t75SSb54Jy27I4JS7m/B+AUwWn/YxCVQ3uMcfP69TgehQQ1yYQFRsPg5fEQs28BRUq
	 dTVIRd6DO25yr8rSESbn24eadPf4VuOdYbuna6WlpS8UUbWFGmmrPa2NVky73qoxfv
	 ygn8brCRzzfPw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Jul 2023 19:44:28 +0100
Subject: [PATCH 2/5] ASoC: sta350: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230712-asoc-st-maple-v1-2-46eab2c0ce23@kernel.org>
References: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
In-Reply-To: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eUsngsu1vt4OVmBdpgxro71+wi0EoT6VyaMY5Nk5j2c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrvSTj6bgWLnKpBttDtXQsJsuRQVDrrSQuuh+h
 XK3ZhtjjfWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK70kwAKCRAk1otyXVSH
 0AoNB/9sNEpRapVKmkYjlvuPJE0TS/ckFmOM1vRccLdmkXcHlhxZI3lphO9QtvhQWd4MZYgEtnP
 U4jvWQZ3nHGRII6grZrR4K6tJrHXs2akQ/Rv3G6JZJp83Zp1rkyNo5G02Bltke8rI5u6Zoo0FT7
 KpF2coJgtalaGLHgrzW1Dxt2mIVgtxncL0F+czieRFg39hnZgnjTihN0KrzzOy4FHHofuBUT+xm
 QxBEG+rfs0kh/eX3U5JooMgxHBsgRuRA++f7iRKfRi3GTpRWZsef80r26ZVQ5wL/btnHcblt+zf
 HHWXjj7c9WHKN0uxT6sZGCzey9HcddUxZjVhkxakor7oG7Dc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: ZV2Q5U6V74MP2R2N2Q42YFAWFU4AWI5N
X-Message-ID-Hash: ZV2Q5U6V74MP2R2N2Q42YFAWFU4AWI5N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZV2Q5U6V74MP2R2N2Q42YFAWFU4AWI5N/>
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

Update the sta350 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sta350.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index d05f3fd57661..e4a9e9241c60 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -1065,7 +1065,7 @@ static const struct regmap_config sta350_regmap = {
 	.max_register =		STA350_MISC2,
 	.reg_defaults =		sta350_regs,
 	.num_reg_defaults =	ARRAY_SIZE(sta350_regs),
-	.cache_type =		REGCACHE_RBTREE,
+	.cache_type =		REGCACHE_MAPLE,
 	.wr_table =		&sta350_write_regs,
 	.rd_table =		&sta350_read_regs,
 	.volatile_table =	&sta350_volatile_regs,

-- 
2.39.2

