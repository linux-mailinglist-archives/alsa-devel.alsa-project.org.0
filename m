Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 818AF75152A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:22:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC860AE8;
	Thu, 13 Jul 2023 02:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC860AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207764;
	bh=hlTWm9uzvVhLJWDvXOfLrEEeUpDCqI158rWMlFjjDDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q//PwBMigLU+qsWpR2vWQr329+58mKMJnJtmel/+DbnKTWURYPd3plynXJ3erWcEp
	 YVpIupU3AgyfWpbko4QouMMYqmB+BV9R4YP/J8AhNbg3OlxriXPUId2UJRP7qN0AlH
	 ac+SAeF9vht+JH77RW5sGtPumLbyJS9gYcAcSWIE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5241FF806AC; Thu, 13 Jul 2023 02:15:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E5B8F806A9;
	Thu, 13 Jul 2023 02:15:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09C90F80695; Thu, 13 Jul 2023 02:15:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E74FF8065A
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E74FF8065A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UHx4ltPz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D490618FE;
	Thu, 13 Jul 2023 00:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82928C433CB;
	Thu, 13 Jul 2023 00:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207327;
	bh=hlTWm9uzvVhLJWDvXOfLrEEeUpDCqI158rWMlFjjDDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UHx4ltPzUot3P5aWbLEHvziNheFIF/tvtNs+QcJQkxcL8Jba1BpkkU888DLXD/83R
	 eGdqnFPeyFCu7c7suKtmf18ycalRNCWkanMU2ci+tAg7YmCApbDyxT0NF4Vcb9DIMz
	 EQgFSv9OEy8K0p2U6y2H2iJ/FPlKsRuGU9jVV1EmjeyzsBxEgbj98o27+DXzNIseHU
	 +uc4DCpnyi3hdzTNKBG6k4tc2sXDCS/ycDpt/vTTH2AFYpBcL2443YrCXMd3qiWvlm
	 c/jq0tbEmvcKMhTBkBmOIX/sG+pS3vlc981BANi8AZjs6E6YIYkctLZew5FgdArN/L
	 h6NCgw81MoQQg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:39 +0100
Subject: [PATCH 26/48] ASoC: wm8770: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-26-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hlTWm9uzvVhLJWDvXOfLrEEeUpDCqI158rWMlFjjDDU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G/hTZZ9wwUZvjJvA9gnyujC//k5cKF/mI5z
 v4rDzAQsdCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BvwAKCRAk1otyXVSH
 0PY3B/0T1rLPp6rDWLDeCc1gUt9KPH8JaUhiYBzSCEjjbLnlo480yiBEO/VgvNbeIuhFU0k1E7b
 DW3dyljrQFVSNoWJL2zLbl7z1OMOan5Ovu9f5c+m1f3+PwFzMZknUCLB0zSm659emGA5YAEZLxs
 aTOj/ZH9SX/q47xbMl0gSDsRN+kXVGsoverbWlxslsvgBGr4k89k5ZjSWp/dgeItzyxXll8P56+
 Mp3xOHq4UuFrCo1zJ98fzpZORpShP31yw8gbmpK1MeMPHOMoGpebqLIyTYDV79DYfTR9P4Q9EXm
 3WCKbx4ZqIL35SoCM6+aX591Uv01tP92urPX5BjokMaPa3H2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: OPO45KEWP4R3RZD2GUACX2GCI57LG22A
X-Message-ID-Hash: OPO45KEWP4R3RZD2GUACX2GCI57LG22A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPO45KEWP4R3RZD2GUACX2GCI57LG22A/>
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

Update the wm8770 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8770.c b/sound/soc/codecs/wm8770.c
index e03fee8869c3..2469f4f3bea3 100644
--- a/sound/soc/codecs/wm8770.c
+++ b/sound/soc/codecs/wm8770.c
@@ -632,7 +632,7 @@ static const struct regmap_config wm8770_regmap = {
 
 	.reg_defaults = wm8770_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8770_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8770_volatile_reg,
 };

-- 
2.39.2

