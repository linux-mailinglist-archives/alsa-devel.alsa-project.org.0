Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12755751540
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CB68E7D;
	Thu, 13 Jul 2023 02:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CB68E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689208000;
	bh=uNz4oz4LcCtiuPJSjL4Y6B6FicMszzoTpc5mth9mp3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WkWK5TPv9cLrEc8FqMxLE+JAkavPjgMgBggIxOHqyLLrRUnjaQ59odyfPKxGrhVOh
	 LLn3D1ZPm/sHimt6He9txdVrzGyXzpwj8wA4L//ACq2w4eGrtx0t1xqClkdUFnn/q5
	 ry52uIULyNNLJmhXuwALsz7pdRmnFzlreStyrK3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62515F806E9; Thu, 13 Jul 2023 02:16:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BAE5F8073C;
	Thu, 13 Jul 2023 02:16:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F361F806D9; Thu, 13 Jul 2023 02:16:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2818EF806D2
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2818EF806D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bi3eHvai
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 08E5D618FE;
	Thu, 13 Jul 2023 00:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E851CC433CB;
	Thu, 13 Jul 2023 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207371;
	bh=uNz4oz4LcCtiuPJSjL4Y6B6FicMszzoTpc5mth9mp3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bi3eHvaiS5DyZdv30rqxC47OKjEeCMreMKXgfB/aaSeU7uIbaAV/C5xXoqKXZX2GP
	 IxB1i8FXj1va98FzgecTnHzsWahgFhd+MHTndIfsGgtA17mvCVRbvSlpcIfndEMZyx
	 fdgQn7Y4B1yQxYfG+0D1n9TkY2VkKA6zCM9oStpB0OUw9CHza9vatDu8UYgUz8NjXa
	 DDgAUAgKth/IbCaTGmXfa/UJHigaCOTOeAmRVkcknRMmwLid/VMBURBTjOzjOPtoSI
	 fpcb6L/WvGEWk4YccmicCv5dmEc2GBc7ygIak1McZppQcKjPVIEWr72nEt8+Vxs75g
	 AD80my4ZpuT2Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:54 +0100
Subject: [PATCH 41/48] ASoC: wm8971: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-41-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uNz4oz4LcCtiuPJSjL4Y6B6FicMszzoTpc5mth9mp3Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HLI0yNT0SzPydClllTU5DxlM5qSK4sX3JnM
 7akj0dulcKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BywAKCRAk1otyXVSH
 0LqKB/9BMc91HsnbY6H7gztI4lbBbgYrenE8SVKDXmmRUpF61ZEwv9xCU0qmNIqnzEOFvy6U3MX
 LYP/qg5hQpkhxjwYx5+Sv6Y0IXdKVGHNqanmgvT+zSR1aWvAz8yWnk2AqnDVkigD6V0suhZ8H8L
 rRo67D7r0aaY6R5Uu2pRyiqyuyuxsWDbgw6a9BxnKyCxM5ecCFjTQfWtuB0byusmJAv6m0vjtMO
 5OAGDAD4QZiUpuCimPd/UX51wZ5cvMYn4uAGdl0dXA6ICEWN0ZGeG5DWOrVELv8t4JJtH+Rzqoh
 Y67YFy+gA8R080QkcHQ37ZmVcUXqrcJtn106opOwiKieg60T
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: KV7NJBEVM7TNNSVIANYNBWGZSIRPNAWJ
X-Message-ID-Hash: KV7NJBEVM7TNNSVIANYNBWGZSIRPNAWJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KV7NJBEVM7TNNSVIANYNBWGZSIRPNAWJ/>
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

Update the wm8971 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8971.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8971.c b/sound/soc/codecs/wm8971.c
index b22d8f0b59be..e88f323d28b2 100644
--- a/sound/soc/codecs/wm8971.c
+++ b/sound/soc/codecs/wm8971.c
@@ -668,7 +668,7 @@ static const struct regmap_config wm8971_regmap = {
 
 	.reg_defaults = wm8971_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8971_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int wm8971_i2c_probe(struct i2c_client *i2c)

-- 
2.39.2

