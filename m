Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBC375153A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CA3BDF3;
	Thu, 13 Jul 2023 02:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CA3BDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207939;
	bh=gJSZbPwrJrao2cx93fqYL1L6cp2CuH4ruhKdl+1SL3Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SL55MXQpIsA3Li8MlXoj7tQXJvZZZ9RG6Fl3LG80Pn14Jd/iZ8S4LOjBd99l9j2hW
	 Rc6LWKkFXeD75pVY3ELk+iJ67q4ccFdiUry048BVEleBoc59dnGGH3Gj/slevv0RT+
	 dXovS+Dea+uA7kPlCXEhgqhOuUnbCowzeHePbfvU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FFD2F8071F; Thu, 13 Jul 2023 02:16:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3DFFF8070D;
	Thu, 13 Jul 2023 02:16:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64FEBF80588; Thu, 13 Jul 2023 02:16:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8031DF806A6
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8031DF806A6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CfR9mk4A
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 723EB618FE;
	Thu, 13 Jul 2023 00:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8672C433D9;
	Thu, 13 Jul 2023 00:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207359;
	bh=gJSZbPwrJrao2cx93fqYL1L6cp2CuH4ruhKdl+1SL3Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CfR9mk4AmA0qccMYh0uuf3+xssDtD9ehXKmZB3wBcjyatNTzBlXVx/1U7o+RNDuBg
	 NpXy5V5xqWnI/7SHI6b8l983FBHDoTx3/j4CUqZH4FL0Woz4zFvvWhTE2DiIa6cYTv
	 N4SIh/zttepNAEb+8skfe28AR7VKKroe8yjmTo3yXwV213A2hY/PXPBqfes46PPQoy
	 Pvh5BS8Wd/uudDlbXJVsYHASFx+DBNlC/P7hjTAmllFaF9N0X7O+bXfjRaRVwdwKsR
	 CgwgQ/nf49CJa5MCT080nSfgQDcSuFsyDKNxDDw0Z3jyMYNsZO9/LaomX5/JeLDnbF
	 Got1z2mH46jpg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:50 +0100
Subject: [PATCH 37/48] ASoC: wm8995: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-37-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gJSZbPwrJrao2cx93fqYL1L6cp2CuH4ruhKdl+1SL3Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HIF3Nslj5oL4RwImE9COdmH9ewFRvmG9Nbl
 0yQalS/D3uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9ByAAKCRAk1otyXVSH
 0APRB/4lkJ7B71pUa83AzY89Z/4qGfcOYDGrONX5sea074UxuMgmWyG7m5RW7o6Rb1wvgwlW3YX
 t5oOCYKRTFD2UrTYg/kwwwTnCVVLbwrPPZm/awfgJbLc/7M9FkNcuqrFsxWo1aiSJOgrE6AVL4b
 7PPuaf/fijSC5NWJZ1dVt4yJJo6A3UuFLZxZL2rt1QHq1hIZp3XDJ9QLYoJxAdh62EhhcjMan2y
 tWMoc4+nxpntKKRDJbp9cjStpV0hP3iuVa7eEBKR8NI2g921nGueB2mCfzFNdqoU2SsfUEYTmDy
 WHtRcS/xqhv1XMrcxoSx26UDUplH9/EW+/HjTmXv8pUm2nw7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: USNAR2W2K2XX4FTLKFT5PRLNITXON2LP
X-Message-ID-Hash: USNAR2W2K2XX4FTLKFT5PRLNITXON2LP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/USNAR2W2K2XX4FTLKFT5PRLNITXON2LP/>
List-Archive: <>
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

Update the wm8995 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8995.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index 90588614edcc..4ffa1896faab 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -2193,7 +2193,7 @@ static const struct regmap_config wm8995_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(wm8995_reg_defaults),
 	.volatile_reg = wm8995_volatile,
 	.readable_reg = wm8995_readable,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 #if defined(CONFIG_SPI_MASTER)

-- 
2.39.2

