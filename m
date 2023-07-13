Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FE875152D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:23:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77289DE5;
	Thu, 13 Jul 2023 02:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77289DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207796;
	bh=c3tkK1xfT+JxgIXVfAzXWyvgXZjJXs9r4NWOTBzuNSQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o6IC0Eskszh39AOQezetLj8Vs5H3fyCmzwKWC02VtdJMcI/hL0BkHitFI9J+r6e1K
	 XjXRz4GOohpWkqUV+mZmqtXxKjhXvEuHZOLGpvaFN8mBYRmiwiZ+I02jTy5o3GXUkW
	 MDXLQY6+yNTO0A6BIm6Sm13ZS1ZetnP3smDZ5ysc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5401BF806B7; Thu, 13 Jul 2023 02:15:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EB16F80588;
	Thu, 13 Jul 2023 02:15:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CB16F80690; Thu, 13 Jul 2023 02:15:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 54DA5F80654
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54DA5F80654
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z2SNBncI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 45D90618FE;
	Thu, 13 Jul 2023 00:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499F0C433CC;
	Thu, 13 Jul 2023 00:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207330;
	bh=c3tkK1xfT+JxgIXVfAzXWyvgXZjJXs9r4NWOTBzuNSQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z2SNBncIlYx/gcHXllMMPYo+rtVhGmdpkAfSEAuihcL9+3l4s+yYRIn+oRgmFVfCu
	 540x4h5fVamzBZPLOROW0xT0eEgWxuAyCCtPx+/bzYkTQ+xrIaFshxTnr0xPr952wj
	 xM7J1pzg842e09QT7k+EYj3fR1dHfej0PWrXtGCIq2z06lflLAUIH+tTjWXRk+US2L
	 2XDh5oJZ+bLS5gIXUOsjjRQkSmbLj/V5ZmSvw+DeWow3gG9OY42d2jp8+2f5LiJb1p
	 bPq4OGkcC8btOnuHXnErmRLbber3NlUtRXgRSaVm3GHx9HgAKGgrRFTb1iC0iCT7jh
	 +fWohmchKIY0A==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:40 +0100
Subject: [PATCH 27/48] ASoC: wm8776: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-27-a62651831735@kernel.org>
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
 h=from:subject:message-id; bh=c3tkK1xfT+JxgIXVfAzXWyvgXZjJXs9r4NWOTBzuNSQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HAtCsCipw1BeA6iMT+ZzemVcZnx2cafvtkv
 oI/x9opIcWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BwAAKCRAk1otyXVSH
 0NuWB/9Sr+eHImBhO1j21cQ91Hf1HbyJdJKXS84yRrjmzNHABIT8Rk1xX/dj64Wud/ETg577h2d
 to8aZvkM4YemduAIobURJ7AsROtmofGualZvupfIEGd/yuieblcB9JkJiHmjPOCSJFPJX5tUBbe
 2CtgfvGVC5IeNU9ZlJ7zgSbD69G1Xaacqvf/sVbVjQWks2S32N+g7ID6t7VVBEcOg8eAlb5G7OU
 +yDxIKfMIbvDeCqq+ro9U9yM+/u5C93VY7RpK0CfqVfKjjm90p9OCJXAHzVvIwxaTVH7MxzpZKV
 YZXqUa0j/kH8DCbAnUWN04FO+v3JBZHhG/llYLcOEjXodHKP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 3EHZPN7ZID2DLA5OJEIX5ZKKLY4MVOQ3
X-Message-ID-Hash: 3EHZPN7ZID2DLA5OJEIX5ZKKLY4MVOQ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3EHZPN7ZID2DLA5OJEIX5ZKKLY4MVOQ3/>
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

Update the wm8776 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8776.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8776.c b/sound/soc/codecs/wm8776.c
index 212224a68006..0673bbd32bab 100644
--- a/sound/soc/codecs/wm8776.c
+++ b/sound/soc/codecs/wm8776.c
@@ -451,7 +451,7 @@ static const struct regmap_config wm8776_regmap = {
 
 	.reg_defaults = wm8776_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8776_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8776_volatile,
 };

-- 
2.39.2

