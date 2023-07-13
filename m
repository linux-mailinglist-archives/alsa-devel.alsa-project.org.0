Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2995F751523
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:21:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DB45DEE;
	Thu, 13 Jul 2023 02:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DB45DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207663;
	bh=S0FMra/NIwtgrsf52A0Jq6twDcNgq2AIqWYgXwNT5Sw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YqqqnexLFBilBBjrAeJ/o4LTQU6GHq42IBlYL65jDnZY/9vBCAhGKm5Vwj84Q1Oic
	 mn5TYRRoAZiCKy3qxpWwRVG0s5WocxbPvq6XV3B65uHx8tiU4Kmsw4opL7tyW+sqmi
	 tOk3vRprc3/0ia1JUbip3WPfIXPUuoxhKXKXFUKk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E69DDF80656; Thu, 13 Jul 2023 02:15:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E1C9F80635;
	Thu, 13 Jul 2023 02:15:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBD5EF80621; Thu, 13 Jul 2023 02:15:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 96123F80617
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96123F80617
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rD/goXWd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8810A618FE;
	Thu, 13 Jul 2023 00:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A0EC433C8;
	Thu, 13 Jul 2023 00:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207308;
	bh=S0FMra/NIwtgrsf52A0Jq6twDcNgq2AIqWYgXwNT5Sw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rD/goXWdT9Jim5bxZF1Tfr1xnCLuMibprK9tREVRRw514WcDyGbqJcz9di6MwJx7z
	 c0+lzDgnrjtgASvmVdJFoDfwVbSC9CDJWVa46Gl0AxTIpJxoo6EA0xdxGbSxoI/3ZE
	 cxTwmH0WZM0dAnlXvMz4vF/EgRPBwCpsGYx4MWP5uluT0kCVN4GjMoXak+aMGbyOFB
	 IWRnCtbJoUmkI0I1sFgPDBtXjz5r3v/L17K+wL9OJUe6z5sTZcARaKPR8eY6Ewo7jk
	 aEGki26Pm0B3cxqba0GJGjKzmXwEwiNdmltqI7lJkLYiyAfrGMn6q0NIJYgonWn1Bg
	 jeaawXHzbCxhw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:32 +0100
Subject: [PATCH 19/48] ASoC: wm8711: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-19-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=broonie@kernel.org;
 h=from:subject:message-id; bh=S0FMra/NIwtgrsf52A0Jq6twDcNgq2AIqWYgXwNT5Sw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G6u/Tcxc04uR9CQjEvI2X0H8LkB4yzDCJoZ
 vq4UtoNrBCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BugAKCRAk1otyXVSH
 0MZhB/4z/7bEJfQxifWv4Q1yhC2r+TvTqpuJV1pGam3rXDU+n//kVHVj3xoTHKXsi8pKCP+XDf5
 bNQaiXO8BEvV7rGOoG4NSMi78slEX/kTYaAUUHJtPR89LZUPQq7E2lzth696q16IJHa1rlLPO2c
 TrLF06aVRNvX+TTyc+uty6oVkxJNIS9EE0vkcfDb25pf9yuFPSNwYPxw+NH81L84A1bPeMAq6Jw
 IFWZoYTDV/7UbSMdai2zKujg2USFb1bMNIht2zXad5xkLAp/5qIrf1y+Qa0Xls6ZwWUXAwtrIxd
 wygODI4g4WTZ+d0vLIJO/ydOAm6vQxPzvL8+5OCUcOhuHJKp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: MNOIPOLIRRX2JAGWG64X6WHGNMCVC3DP
X-Message-ID-Hash: MNOIPOLIRRX2JAGWG64X6WHGNMCVC3DP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNOIPOLIRRX2JAGWG64X6WHGNMCVC3DP/>
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

Update the wm8711 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8711.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8711.c b/sound/soc/codecs/wm8711.c
index 903a0147d584..916f297164de 100644
--- a/sound/soc/codecs/wm8711.c
+++ b/sound/soc/codecs/wm8711.c
@@ -393,7 +393,7 @@ static const struct regmap_config wm8711_regmap = {
 
 	.reg_defaults = wm8711_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8711_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8711_volatile,
 };

-- 
2.39.2

