Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A7775145C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 01:17:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6B0884C;
	Thu, 13 Jul 2023 01:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6B0884C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689203877;
	bh=INOLWtSToHrSdR0d68H0vHbV+e4cnTe0UnhEvs1cRNU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HxxCt2d3m+GJ+Qa+F+rghihs1j9TFrCXETKpg4LVkr29DbXz5pjuLFKgBwsGWxsr+
	 1GhbQfCKLr7aAbZG/HJ7mX08jX1vKQXQzfqCFwHs/bNoBZpgj2AAM7483asgSevdp9
	 Kn7R+ybzrs3RQ/Tfk4CmWr0Rb7NWVCajMtXyLzKQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09694F805E6; Thu, 13 Jul 2023 01:14:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7090DF805E2;
	Thu, 13 Jul 2023 01:14:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F22D2F805AD; Thu, 13 Jul 2023 01:14:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 63D88F8057D
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 01:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63D88F8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S7i3nAbT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 550136199A;
	Wed, 12 Jul 2023 23:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C6FC433C7;
	Wed, 12 Jul 2023 23:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689203667;
	bh=INOLWtSToHrSdR0d68H0vHbV+e4cnTe0UnhEvs1cRNU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S7i3nAbTaS0qxqlBrDX5gCCLhiSp8jTbSmApHwNN/xwHzWe5hABUzfKm8/rQWwXWD
	 Dzm//gELj3so8KsHseg1HT8eUTrp1EZVso3gUtW/+xZAANcRwToRfmDVIlALfiImbx
	 N5ffJcN4taSO1MlLHg0cGHuCgH2wlZ9K1B25ATyqPQjIbZnUPGx33X8em3OziMFpPK
	 DjeYHQRp5XN+76KP7tlfN+9mWNK4NPZhPh3Uj3Al+a532xaJ8H02B2r1ubFkG9b4lA
	 9obu9ykGtbXELnH9qdNqArESWEMlrIhUfSTWhF49xcZ5GK/XrzWL2X23qXHm2IpU5Y
	 cGMMNmR8B50Xw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 00:13:58 +0100
Subject: [PATCH 09/10] ASoC: adau7118: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-ad-maple-v1-9-7d2f35d42b5f@kernel.org>
References: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
In-Reply-To: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=broonie@kernel.org;
 h=from:subject:message-id; bh=INOLWtSToHrSdR0d68H0vHbV+e4cnTe0UnhEvs1cRNU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrzO66e+ErUPMUubnMQp3MGfOu2lKyGKd2EY/A
 Q/AMlEP21OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK8zugAKCRAk1otyXVSH
 0DVWB/4y/0GTcVUUSDakdRgl0oIJjsSeWvfzUvmf8Rho6SlJfeOFBd5Cl2ZRrbp21QN1MLIW04f
 FpKdKyFXz3xGII0L0kHRQRSHAesb6Web6ff+tG9Aobe2QVtgF1da3/3OIjlM4GeFl9rJsPDFSYP
 Pxyi7BileEbU8Y9Wgp6s9IK0yZVRRsBQhO5dLBxPmxqjEgt5GYEakDU01/TbSSs2x1I4SobnTry
 znzp3biG6Drsfg06F+xZ3V7NN+BK/MXp0wBLWuhI5AAw0aGz3t0OMziJaG6ymd0LdHLEtH28mka
 Ho0q+uA0AZlzp11SxdN73VcIlQwsr65QnUEQxxYEomA54+HR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: XUBMYNCBGMT5UOAQJ5MIRLCL2V3NXK6Z
X-Message-ID-Hash: XUBMYNCBGMT5UOAQJ5MIRLCL2V3NXK6Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUBMYNCBGMT5UOAQJ5MIRLCL2V3NXK6Z/>
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

Update the adau7118 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/adau7118-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adau7118-i2c.c b/sound/soc/codecs/adau7118-i2c.c
index 73f181f7757e..b302b28eca7c 100644
--- a/sound/soc/codecs/adau7118-i2c.c
+++ b/sound/soc/codecs/adau7118-i2c.c
@@ -43,7 +43,7 @@ static const struct regmap_config adau7118_regmap_config = {
 	.val_bits = 8,
 	.reg_defaults = adau7118_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(adau7118_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.max_register = ADAU7118_REG_RESET,
 	.volatile_reg = adau7118_volatile,
 };

-- 
2.39.2

