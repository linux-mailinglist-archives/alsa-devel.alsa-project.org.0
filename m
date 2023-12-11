Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEEE80CCDD
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 15:04:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 812C7E97;
	Mon, 11 Dec 2023 15:04:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 812C7E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702303480;
	bh=2+ABJjwi2rtcImLzfvGNWYJkqy4ofmwTcTdjHO4769E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ecTZvt1Dhg/R6R5PAnvZSEb/RY2YztRLrC45Fib7H2hhFRrWwD/YYKnqtWb54bMR/
	 m0gYLy+K0Es6uzpXbCBTcYp7ij/IZITAuUfwb7PaObTA9fS51A6M8/MsA40BY8DG7W
	 OVB8BMvS3193tuunWcWJN/rDEAU9l3sK6FNauFwA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21C59F80611; Mon, 11 Dec 2023 15:03:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89C40F80613;
	Mon, 11 Dec 2023 15:03:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66CB3F805F9; Mon, 11 Dec 2023 15:03:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7230AF805EE
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 15:03:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7230AF805EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F/gpGUw7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9B20BCE11FD;
	Mon, 11 Dec 2023 14:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAAFC433C9;
	Mon, 11 Dec 2023 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702303380;
	bh=2+ABJjwi2rtcImLzfvGNWYJkqy4ofmwTcTdjHO4769E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F/gpGUw7MIh8dKZHv6mRhiEW37+3BrbswOzImibqjslh0Fxoy7exDBlqf9gX9buPD
	 TMjsPAE9mLP6oKohFuUQEd5RmERBFOyGzvaSnZTRqJzNBaIJ39+kvWIENwB3dbAYMM
	 j0Q1lCyqiEcmxMp1k9gCdkrwlJfvwGKbDP9TNV8no44S4U5BMFIrhTLIvlVA0B8Z76
	 z9MmLMJATMC1PCHj6kmhPB3hPP95ksfeD60mLMCP0Vi//FFs8Z1AO4rbhfFHbi3KnB
	 dCmTfTMdn0Kcmw3jhtjFQCJkmyXwz1Ml17okJeABkjFzeFKINw6JljX9j09cHx6+1Q
	 aOcbdxQzh45Kw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 2/7] ASoC: cs43130: Fix the position of const
 qualifier
Date: Mon, 11 Dec 2023 09:02:45 -0500
Message-ID: <20231211140254.392656-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211140254.392656-1-sashal@kernel.org>
References: <20231211140254.392656-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.301
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6KZOPWUZD7XY2FQO6PL6NI2ODDXO5GG6
X-Message-ID-Hash: 6KZOPWUZD7XY2FQO6PL6NI2ODDXO5GG6
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6KZOPWUZD7XY2FQO6PL6NI2ODDXO5GG6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

[ Upstream commit e7f289a59e76a5890a57bc27b198f69f175f75d9 ]

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20231117141344.64320-2-mstrozek@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs43130.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index cf29dec28b5e3..95060ae7dbb40 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1686,7 +1686,7 @@ static ssize_t cs43130_show_dc_r(struct device *dev,
 	return cs43130_show_dc(dev, buf, HP_RIGHT);
 }
 
-static u16 const cs43130_ac_freq[CS43130_AC_FREQ] = {
+static const u16 cs43130_ac_freq[CS43130_AC_FREQ] = {
 	24,
 	43,
 	93,
@@ -2365,7 +2365,7 @@ static const struct regmap_config cs43130_regmap = {
 	.use_single_rw		= true, /* needed for regcache_sync */
 };
 
-static u16 const cs43130_dc_threshold[CS43130_DC_THRESHOLD] = {
+static const u16 cs43130_dc_threshold[CS43130_DC_THRESHOLD] = {
 	50,
 	120,
 };
-- 
2.42.0

