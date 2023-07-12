Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B957510BE
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 20:47:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB71F83A;
	Wed, 12 Jul 2023 20:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB71F83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689187639;
	bh=ZMLlxAfnaNtv+Q585v9EcbZ69GExEQ3H7KYTriom1N0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ayg8K/xNTgwjQc38ywwapLl2QUJEEabpof7qsuYVMqOxIZR/H6NAcqBcaaBv3lRN3
	 ggL0Gmy2xr3LAruzZ8FZFG7XYB8Jv0TEg6bDK6zxXP4UXC8dUid4d3U6qjGAEUSYxM
	 9nTQYW/gp5v2QT6gfTYhxjjUdGEqJy1PTGSlIFG4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45CEDF805A1; Wed, 12 Jul 2023 20:45:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E00ADF805A1;
	Wed, 12 Jul 2023 20:45:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5AD1F8055C; Wed, 12 Jul 2023 20:44:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 40B73F80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 20:44:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40B73F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oWf16j9v
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C574618CF;
	Wed, 12 Jul 2023 18:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11F1C433C8;
	Wed, 12 Jul 2023 18:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689187486;
	bh=ZMLlxAfnaNtv+Q585v9EcbZ69GExEQ3H7KYTriom1N0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oWf16j9vlgQPPSAHCjm7vx67bzGhzPEvfxEJOe3qfSy8iw3fAOXQYXXWhKQy9y52J
	 ZyGqE3/BFKOIFf9RycQccHAfkQf8yw9lvQcL+DSs4eQ7ZbqrIxp3J2YCV0NjQpQaAU
	 mPrYNXVxgb9puiDApJb+oNCRH8ASE9WbXMo6hC4SYF1neIGaPI/soAX5DLqxqMnZjr
	 /Fs9YfbmHH7LPOmXvrUFOmuA+KwBzbXOkeMq7UuVHvcK+o2gdRGZigqFPcYiVyeXub
	 Duth6pge1OTe4sMkpLtAzYYugqywdtSbGZUce3WAYCfKx4Hy69iEEpiO9oGRnbigaC
	 TCstXJeLQqohA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Jul 2023 19:44:30 +0100
Subject: [PATCH 4/5] ASoC: stac9766: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230712-asoc-st-maple-v1-4-46eab2c0ce23@kernel.org>
References: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
In-Reply-To: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1060; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZMLlxAfnaNtv+Q585v9EcbZ69GExEQ3H7KYTriom1N0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrvSVM29+Ay6IKP5bIxavUj+efmao4dtu0d/Di
 ab+xXdJixaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK70lQAKCRAk1otyXVSH
 0HmdB/0e0jdK53O/XUCXXGjQoAvY3qfl0DXwYexWCD2oP9vA8U15zi4oejkq3elJ005ix7fAdKP
 WqEN1QZuKdfPXpg0ghi90xCaU44ZgAjbAqpOTPSiRhFkYxMSl7czlC7MUgCzfCgr3m9c5dLWgMh
 roBODvH4x5VMyvuK40l90TGCJ18yG5ulxAbIvpuwLPocGYBWE+j69hbwkvIPCQL5v1gpCnb28Cz
 nY1EDujNRM6MJKYwV5V+Xh0tsjOIH95xMrpd/zRhTCmMPN8FmMs7+7+nUoHvk0Zal50GVcvP+TX
 b4YHNhgIN0AMDsxict1HAPXLlLgO3FYqBfc6/OPPdOrnWLPu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: TWGJVJEIH2BS7NQYN5M2Z45BUSCDEVZB
X-Message-ID-Hash: TWGJVJEIH2BS7NQYN5M2Z45BUSCDEVZB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWGJVJEIH2BS7NQYN5M2Z45BUSCDEVZB/>
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

Update the stac9766 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/stac9766.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/stac9766.c b/sound/soc/codecs/stac9766.c
index 1824a71fe053..2f9f10a4dfed 100644
--- a/sound/soc/codecs/stac9766.c
+++ b/sound/soc/codecs/stac9766.c
@@ -67,7 +67,7 @@ static const struct regmap_config stac9766_regmap_config = {
 	.reg_stride = 2,
 	.val_bits = 16,
 	.max_register = 0x78,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = regmap_ac97_default_volatile,
 

-- 
2.39.2

