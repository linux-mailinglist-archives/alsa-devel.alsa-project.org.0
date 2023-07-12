Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2FA751451
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 01:16:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4716483E;
	Thu, 13 Jul 2023 01:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4716483E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689203765;
	bh=+Z6ywkEJvnphopT/QGsfd/IJAkbLCsUDhcJqjaaKGG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LbPeYEtENeSvl+LsxkeR3Wb/n15XUDFyt1sWrexv33ijiyUVeLUM740FQXbAmJx1a
	 wX35qoam7ON7RuEUYFNSS+tJS4gm0Ito1HUWrhRnvCyXAOl8OlLDFDK4HpbmGIEEbf
	 jotWkU6ZFcfODhwltuI2TMSzmmg311r4AT3hhP/4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF7F6F80553; Thu, 13 Jul 2023 01:14:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D47FF8047D;
	Thu, 13 Jul 2023 01:14:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2069AF8027B; Thu, 13 Jul 2023 01:14:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E2360F80236
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 01:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2360F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Li3s5/6L
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A38C6198C;
	Wed, 12 Jul 2023 23:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12058C433C8;
	Wed, 12 Jul 2023 23:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689203651;
	bh=+Z6ywkEJvnphopT/QGsfd/IJAkbLCsUDhcJqjaaKGG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Li3s5/6LQTS2OZN0nGWiN4kCc7iwbuY8owtzce2OJvfe5xH+IfiGQ0WiNbnnGiQO2
	 ylHkjwE9Te/6a0HE3r0qUvPbEbMegOFzBakihXlF+59JtKda7T8k1nH+eI+TowxenA
	 yCfoc+bRCigHhtoXaTNvmswUXJ4JE06buj3OH3XWH9I8djXn5JQOOctzDaG8r9WQHI
	 Gz3wYDX3VM4QizMoYmWKDdy7CX3Z/Va0zDyyBs3epObOtfdOEsV474bXpSLChmmc3X
	 wiTGLuAOAANjP+ssUCkx/miMF0kSxqi4rPhI3vE+jBOqz7PY2F42HNr+mADsxKpcth
	 t7L9ovHHjw22g==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 00:13:51 +0100
Subject: [PATCH 02/10] ASoC: ad1980: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-ad-maple-v1-2-7d2f35d42b5f@kernel.org>
References: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
In-Reply-To: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+Z6ywkEJvnphopT/QGsfd/IJAkbLCsUDhcJqjaaKGG4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrzO1WTlQ0/4e8YXAZI6/9T6m8yzgdXs7P47mf
 vMa4rv1jZKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK8ztQAKCRAk1otyXVSH
 0G8SB/9ENzzCSc2z19fXPMWn4wVI/GzE+Ukwx4isxQcyPEBdZ49FvLl+10ETpw+NHz8833i5lIV
 6418+YUqJEv0GDbmI0qeUhs7VuFvOn+KL9GmZpgMAfT+lH6OgCsTz/WQPj2zJ3s3JBeZDB3VYXY
 oedtQOn0B14Xzgcw6/mmHrdNsuZ7dPGynsoq9gabOGtV3VSAtoutPTVeVV1FEVeWT8bnheFl4wW
 Gq6jpxLwqslgjacbx1LELl4KtfLyjCrdg9eQr8/+sPyY0FEwkkk64vvJvKS9Vd6GtFF4OtIrA5o
 7YgIzvBowqvBqq3Au9nif9NjPKqfua14H8XyWZPaXHbkVsSJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: YVLLRS4UMDGUAGDARBGWBBDMHJQVQ3BN
X-Message-ID-Hash: YVLLRS4UMDGUAGDARBGWBBDMHJQVQ3BN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVLLRS4UMDGUAGDARBGWBBDMHJQVQ3BN/>
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

Update the ad1980 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ad1980.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ad1980.c b/sound/soc/codecs/ad1980.c
index 5e777d7fd5d9..3c1ae13c1aae 100644
--- a/sound/soc/codecs/ad1980.c
+++ b/sound/soc/codecs/ad1980.c
@@ -92,7 +92,7 @@ static const struct regmap_config ad1980_regmap_config = {
 	.reg_stride = 2,
 	.val_bits = 16,
 	.max_register = 0x7e,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = regmap_ac97_default_volatile,
 	.readable_reg = ad1980_readable_reg,

-- 
2.39.2

