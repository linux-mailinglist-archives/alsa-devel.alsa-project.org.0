Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1656C751545
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A38ACE81;
	Thu, 13 Jul 2023 02:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A38ACE81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689208085;
	bh=TPPu/Z6W2UYe47f64BjjYuoAfWqnzRv/XtPbIpYnPcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RSEttwX4n+yYlTFkTwU+L420QMbO5bqNrKIMqO4fDMeacXxGsmbTlJqAt0J+RPUud
	 BUIXrs6ReHo8lfy7Y5ho3Y0BPirq4/EoyHFrub9IPlS4ZjjANz4XPuFdup/b5f70Q5
	 Wx4+gRBeV7ZSM5ks43lj2SpVq9L3z/T8ETLNGbBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61DB7F807D0; Thu, 13 Jul 2023 02:16:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 734A6F807A6;
	Thu, 13 Jul 2023 02:16:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1420FF80716; Thu, 13 Jul 2023 02:16:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 67E61F806E5
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67E61F806E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EptHSpE/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4337A61983;
	Thu, 13 Jul 2023 00:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CBBC433C8;
	Thu, 13 Jul 2023 00:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207385;
	bh=TPPu/Z6W2UYe47f64BjjYuoAfWqnzRv/XtPbIpYnPcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EptHSpE/fsImxglU0a3uunwPdronO4Nz2+l9gu5uLcsa6CR6/jV/j+IcUDIUwKjB4
	 dE6Um7a2v4us8h+PP7WooNIVUXeUmvDyzTm4rxuWsukjz8zDHusskJEFLO9C8pQNBY
	 KAxhH7ieKdRYmWRCV+alQ/Y/JZjtUwBReLk4odwrXEEB/Dwznletb+Ft1yNuTsx676
	 ouuYPerstON7I0QtUVKZbfD1Kc8Ep6uxyYMpxVg5vn+aIkKpbfoPMhz7Cr1zmWxqvO
	 xFGtPSwDzTtcmp9ZbwvMGY/F55lzh/RJtF6sO6Gs4xbrL40d1XOV7EpfS5mHC9FaaR
	 uDfc3kM9qivcA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:59 +0100
Subject: [PATCH 46/48] ASoC: wm9705: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-46-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TPPu/Z6W2UYe47f64BjjYuoAfWqnzRv/XtPbIpYnPcg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HPyV+NRtOSquMoV8jbXAH+gf/G1WccnnYhk
 1sUN7KCWRqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BzwAKCRAk1otyXVSH
 0H/zB/40IQZu9mPvw6TeHZzPBg0kDIuctaTQjlpWCcGiH3qhFVjWi+tU5Av2Pg6r+enfUB6/cGE
 CErl2ZRpNU5Af7T2GpOE6z3qG8hgSUzzE9WD3OvC9DkIV+kwFnqnoUHOlhvCnraZOjHbC5Ye/3b
 oyzN2ghjRNUh1JZlPGRbBn0YfuLtd47VH/NxlnVMHxgGlmsjgrcCrP2SSJhO3HW4Jz6ez33cMrB
 EDcUdQ4gXJaILTGFDovraH/uTvDlimxS/VFr6h3jOJnnoKsSCPoU3a1dLXCfCTCqrVEdf3tQ6Ra
 1VBs0dsdYStcgjUncLIG9KFBJ+E1UC0oOFc2tgfZpYqhZNS9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 464LXXAQQ7AKNYOBY5MVMPTBNT7RSTE5
X-Message-ID-Hash: 464LXXAQQ7AKNYOBY5MVMPTBNT7RSTE5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/464LXXAQQ7AKNYOBY5MVMPTBNT7RSTE5/>
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

Update the wm9705 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm9705.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9705.c b/sound/soc/codecs/wm9705.c
index d04902ef1d5f..5c6aebe29cf1 100644
--- a/sound/soc/codecs/wm9705.c
+++ b/sound/soc/codecs/wm9705.c
@@ -64,7 +64,7 @@ static const struct regmap_config wm9705_regmap_config = {
 	.reg_stride = 2,
 	.val_bits = 16,
 	.max_register = 0x7e,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = regmap_ac97_default_volatile,
 

-- 
2.39.2

