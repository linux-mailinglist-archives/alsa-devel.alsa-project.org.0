Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF71D7515A4
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:57:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CCA2E7D;
	Thu, 13 Jul 2023 02:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CCA2E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689209820;
	bh=95pu5KtU1qvko6ANn17Zzddb4bi+7mdKGglwZE81sFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qEry6KtLbqUP5g2nBaNWOEz64Wfwe+7gdBMKfvvHFWmKhlZYUAlxAcElbqHZHsPNV
	 GVVKuUQilUGrlAZlmYDi1zaCTzcNz0r+uWe5/Kp66ftdX6eXmapIkp48YUnIj/AivW
	 ln0uzNgCCtr/VhNKqnMey3dBFizhJEtL+tu8wZyg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D99EEF80549; Thu, 13 Jul 2023 02:55:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C986F8027B;
	Thu, 13 Jul 2023 02:55:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7F13F80571; Thu, 13 Jul 2023 02:54:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A494F80153
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A494F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IRp7m2DA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 77666619F6;
	Thu, 13 Jul 2023 00:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8EBC433CD;
	Thu, 13 Jul 2023 00:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689209636;
	bh=95pu5KtU1qvko6ANn17Zzddb4bi+7mdKGglwZE81sFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IRp7m2DAOLJTEcnzK5Q7PLljnm2417bbQK7brDkNKV0eis+MfNuPpBq3luiBOInae
	 1K7VtbVwChNrtZldcPbRLIYmMYCDANlm5ZabBmHwA2QxjCyzts7NdS+GaM8/Dpnhi+
	 L5WZs3D0ZhEsKr8E7tqCoJYjq+p0SX/y1yD+SglBdrmy5s67OdYfjJsY7ZpIO04749
	 8Z48UQSIxxPQa8MSlVUieb0CPulc4cFFSBL+0rFFu22I1XMmgD+2Lywh/XNcnt5dL+
	 xYtKCd7bW+kvhW/KFMbEjOXAOrer1LztBB+9ZcvxnPOWGVxEi+hIzjU0ac/LrNAo54
	 PzWBOKaZvK/ag==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:49:25 +0100
Subject: [PATCH 07/11] mfd: wm5102: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-mfd-cirrus-maple-v1-7-16dacae402a8@kernel.org>
References: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
In-Reply-To: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=95pu5KtU1qvko6ANn17Zzddb4bi+7mdKGglwZE81sFk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0sPblkrzYbrwYToT5l1Ba2l7wQxPCc32XIwt
 uXq7i7TFS6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9LDwAKCRAk1otyXVSH
 0CiGB/9fyppNpRfbFJ2O74l9AFTriTVFkczyDHpjyA0MYh6Lc5aOB9TmQ9UprTUK68onBvIERdi
 wFM6L0LVs0/Wfo6R7dH1BW6dSlXqNvvREln3b/bXbQqN0nNbEUyjVSpeuI3wT89XqUUV4x2Mxhd
 mf+a1D1EnmU2qO788dEs/RYbPS8w7W3CLNxu4k5VhvqIVyiCpdFS8JlRzooCNO2Ca7rD7YY72oP
 HJOTTBuk5epV9fMbpq49hxMIqAMYyO7wn3rUzgjYcC+6rlWYLBN+FXogyKPQkborm6CfXpZtnw3
 EjQk/nNlggKuLfeHCi/Qdo/I94CR7zb1sC7LeWPgKQvB52xX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: YY4AJBT2XBCIXQCDPKDNIVKZMEU2GOFH
X-Message-ID-Hash: YY4AJBT2XBCIXQCDPKDNIVKZMEU2GOFH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YY4AJBT2XBCIXQCDPKDNIVKZMEU2GOFH/>
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

Update the wm5102 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/mfd/wm5102-tables.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm5102-tables.c b/drivers/mfd/wm5102-tables.c
index 6bba39657991..f77ecc635b6f 100644
--- a/drivers/mfd/wm5102-tables.c
+++ b/drivers/mfd/wm5102-tables.c
@@ -1938,7 +1938,7 @@ const struct regmap_config wm5102_i2c_regmap = {
 	.readable_reg = wm5102_readable_register,
 	.volatile_reg = wm5102_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm5102_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(wm5102_reg_default),
 };

-- 
2.39.2

