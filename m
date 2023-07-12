Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F79751453
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 01:16:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C29A61F1;
	Thu, 13 Jul 2023 01:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C29A61F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689203785;
	bh=kN7Q6TJPWhd01UrZwm4+vTZv1EOlCbd/ekAQgk9Q93c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bpa4XyckAgVBGtRZOG5cezxum8WR2UfO1nNsqMNvtxjmB7c7Nk4F7nOlLY1glC6KQ
	 I42Qze33PQMHURfB/Nhr7GonPluwOdmYnyPMd9OB8cGwsVVQ1FjXuIYGhyVIITPEKa
	 Q98W83NalpADFi6MHe0IsKTRbm03l+RV3Kn8Bvt8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58831F80567; Thu, 13 Jul 2023 01:14:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADA8DF80567;
	Thu, 13 Jul 2023 01:14:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D68BAF80290; Thu, 13 Jul 2023 01:14:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 44236F80249
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 01:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44236F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rWQEJEiv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3411F619A0;
	Wed, 12 Jul 2023 23:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36783C433C7;
	Wed, 12 Jul 2023 23:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689203654;
	bh=kN7Q6TJPWhd01UrZwm4+vTZv1EOlCbd/ekAQgk9Q93c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rWQEJEivsSk6CTDFC7Z+KHcYysw+oLo8b103kbDfOS9WcPySkiwbDiN5f5KSj0pGE
	 tdzLGg+Hwqyx/WwF7ZjGq+8v9qLfWDs3TXl3u9V1r5DF4WsNIc48YvNKDgf0lanl3R
	 s/gWISWZC3vDTUO7upY5zs72+XsxHn1mclnUoOj4beV5WjebF7luIyBrHkjWlP6O5B
	 W4xB8kTyhIx01q33wsGzcIY24FdvMoqnHDQpP6Vp6cUQaJ98Iq/kUUGTDfu5H2WgtV
	 wDs87BOwg0oQ9vLk6SuHMX8eT6bxcGhd3aXes0nPtgp0HYuzT4KLgxgamNBOLRuEtp
	 MZx8u3pPAgF6w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 00:13:52 +0100
Subject: [PATCH 03/10] ASoC: adau1372: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-ad-maple-v1-3-7d2f35d42b5f@kernel.org>
References: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
In-Reply-To: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kN7Q6TJPWhd01UrZwm4+vTZv1EOlCbd/ekAQgk9Q93c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrzO1KqolmtERSVYJzcgTWk3E6LU4Zkx2yQfGc
 WUADF6r8HGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK8ztQAKCRAk1otyXVSH
 0JyJB/4z9Pv2qfbbzQqA5kCF0sJCwwmsIcMbHzjeKZ1HIfSTwVaxROgcEMiob7c464mqIrfC/uM
 2LXePFR2T5h8UJzFVXChi6EWBx6vCvPOCm219+i7HLqwrTvOb7LXtWp7ChTL3aJ2ijTlxvKIUCo
 0qKi8ZWy1h+o6IHy1SoEFm29XAft+RG+2g+ehjnkd+vAo76QIR54dCxnXayQOsppg6NWRnb3/Lr
 rO5jGLIbTQvdVewdKrxrVTwd9skTPdOR5myBYe8M9wrA5Xdadw+8TrxLZd96LX14BXft6TDReci
 1zbQ477M9BrNDbtRKx+31sozssDTXxq3mWlaZI7VRHlIA+Kd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: GIJ72H52GZ3AKVS7EDUAVMSTGEDBSMMT
X-Message-ID-Hash: GIJ72H52GZ3AKVS7EDUAVMSTGEDBSMMT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GIJ72H52GZ3AKVS7EDUAVMSTGEDBSMMT/>
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

Update the adau1382 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/adau1372.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index d9bde7eb043a..98380a7ce64d 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -1056,7 +1056,7 @@ const struct regmap_config adau1372_regmap_config = {
 	.reg_defaults = adau1372_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(adau1372_reg_defaults),
 	.volatile_reg = adau1372_volatile_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(adau1372_regmap_config);
 

-- 
2.39.2

