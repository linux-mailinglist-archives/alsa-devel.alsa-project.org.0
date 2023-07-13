Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE58A751525
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:21:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 564A0AE8;
	Thu, 13 Jul 2023 02:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 564A0AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207679;
	bh=l3ebw0XWDneVahRnEFmLn8+x/+DwVlxfRDQ4EhGXcqs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AY3VeSQiGEiY9rBJL3LI+WnFX5Wumk7+yUdV+FOEbbkjFdFDZUaz+RwBdGfTKGrOX
	 HhjH7xeyuMAND7iw9WG1/iZO+U8CFuhj4vK4EEa4nCfBorURLf1pSCYOCTrfHC1I1k
	 ljpJUQj/6cWoidq0vuxrF9nYZVxWbFkAA/amGSYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1554F80633; Thu, 13 Jul 2023 02:15:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 966BFF80675;
	Thu, 13 Jul 2023 02:15:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63F77F80620; Thu, 13 Jul 2023 02:15:18 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9427BF80619
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9427BF80619
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Wb3npYiA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80AE0618FE;
	Thu, 13 Jul 2023 00:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957D5C433D9;
	Thu, 13 Jul 2023 00:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207313;
	bh=l3ebw0XWDneVahRnEFmLn8+x/+DwVlxfRDQ4EhGXcqs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wb3npYiANGSYcJVGTIZJ+Ju9HuWc7P+9jCnCZsuXIe3zO8F5L9KV8y3Yn223FdH8C
	 C5OuegigWVe7vC4PK3DrXDg0SqTVw17byd+PcRX8dsdo62L7Fl4VbveRQPek4cZCdK
	 a5VRAXZc5Kifr0NUShM2tWwTmDOXNphvDFdbIpxBBUBH4R/vVmwsw6XcgNYZR3ZMRc
	 3FXySC7i7m+CeHRPgdnON/fUnwf6fHUxjvSxOZ7j21eSnvPSbsAsnt9JcQBAxdbLIr
	 dMNMqLNyJUgM5w9Az3qiw7ON1Wmn4Dbw5/FoA6THDFPbwfoIbHav6C3if/xIX060Zk
	 6rT/UGD/QdFHw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:34 +0100
Subject: [PATCH 21/48] ASoC: wm8731: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-21-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=broonie@kernel.org;
 h=from:subject:message-id; bh=l3ebw0XWDneVahRnEFmLn8+x/+DwVlxfRDQ4EhGXcqs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G8wR6rCNkIQC698mWPi0or8oloJzHqaNqZx
 0qyvIURlaCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BvAAKCRAk1otyXVSH
 0INMCACCmwT/H6oniKWlo9hF2VVP3/+aqEnFOdBFR9Nuw3JbH+Q4ziwgmJdv26bhkAb/QHTdpVl
 kmnSKUI0ZX6rMhU4yjmJvZAannN2CHeowurGR4wj0XAIkjeUKz9iZmX2pfBxTdrLVNcsu5K5ze1
 +xLRfjUWJg9x5d8F7LfYZnyChS+k8VvmYw59a+rUJiiaZLwhjuOiJ4LKzhndL+2J181/VuNl3LA
 yAmoh8q0JROy/kho4KFerVIe1UeTVQ/XWIMprVmXfJRhODr4iK3mOWPsys/uXbptPWHEncMLhEe
 hNEm7uVICAabCvU7x+fbzdZkXUrgcSCMVEsFZWRdGDViCJDc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: EGRC4S7RM7GKQAYZ6IWIMAF43WQJGANK
X-Message-ID-Hash: EGRC4S7RM7GKQAYZ6IWIMAF43WQJGANK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EGRC4S7RM7GKQAYZ6IWIMAF43WQJGANK/>
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

Update the wm8731 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8731.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index d5ab3ba126a6..efc160c75f40 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -642,7 +642,7 @@ const struct regmap_config wm8731_regmap = {
 	.max_register = WM8731_RESET,
 	.volatile_reg = wm8731_volatile,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8731_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8731_reg_defaults),
 };

-- 
2.39.2

