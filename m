Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BA372AC4B
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:29:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 764A584D;
	Sat, 10 Jun 2023 16:28:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 764A584D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686407358;
	bh=j0LWrHQC1RiK2PN22Dm4lsYps9XSolCwbi3u09Q6VBQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AkluCaGf9O9oxsN4NDQo6b2cNtR/296YLfyELlDq423T3OA0JibJsI6YiZshBsxBq
	 bbmv214Of3qBgubZTcTcluw4WHlQpqSnQRHMIBGt172r51j/HTjC4e5FWXonFd99Zs
	 JWYJjkDYBphdhj3Yet32WOw9WhK/9/BWp2eg8h40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BA48F80580; Sat, 10 Jun 2023 16:27:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF5A3F80578;
	Sat, 10 Jun 2023 16:27:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5E8DF80548; Sat, 10 Jun 2023 16:27:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10993F80254
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 16:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10993F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KQ0kMEYw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D11A860DFE;
	Sat, 10 Jun 2023 14:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62539C4339B;
	Sat, 10 Jun 2023 14:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686407253;
	bh=j0LWrHQC1RiK2PN22Dm4lsYps9XSolCwbi3u09Q6VBQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KQ0kMEYw0Jv/nv2/dzz05xzuVNYaSdFluyXCkPQX4CEbBpTPfQVBDgJiFwu4ON/aK
	 j4qWRAc7iJ4T/uPLIYQFrQUNzKweX0CnLsfXn59bNhNk7rZ/8bYJ3WOKtWmMfSWdEd
	 NQPjtnLmhTEwgKVt41Ph2xSSM9ANL36uFg1jmYOmMIcQmQVQaERjTIHXu+KFS0076G
	 pXTA1qjWpGGA/aeZlja6WpvM5mvDQPdnl207+Dyaokvy34FpfIQMwDkQmPuZS15uTy
	 eMw6YvUYVY6cMCvP+ktUH8G6XaE96MWJpWIypblItjvyL4lvVypd3KVwlqCUHgL6Ab
	 Yi+9V31E2qibA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 15:27:14 +0100
Subject: [PATCH 3/8] ASoC: rt712: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-sdw-maple-v1-3-85ee50c93905@kernel.org>
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
In-Reply-To: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=2310; i=broonie@kernel.org;
 h=from:subject:message-id; bh=j0LWrHQC1RiK2PN22Dm4lsYps9XSolCwbi3u09Q6VBQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIhLYTxXA1XO4lZ+YOnVHhB8Lpv/1uQ8y9CFwaGD
 NNlVjrSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISISwAKCRAk1otyXVSH0AW6B/
 4337fuTJ1M8i7ZCXT4+HHPbTXBKJ/Wpt9SGNkF1NGY+oMBuHoKHAatXQHWXi+mXpEEv9mzWhifiwpx
 BBxxhyj5JIIepzXcBc4pEcjxp8Qeb8bHYyemZTQtqC1tM6y3BV1bzbdaAjy191/BfgY7eAeZzW8un4
 EzC/xpLPeWOm+et9hD7iyvI+OK3gI0x2a0baxNHCWjxG6P+IH/gzaJTygLtUCsYB5Ezk5WW7EiG/D0
 8+mjcC3I1ydJgipjYSb3RHbtZwpr0Ai8oEnftTr4SStzP8qqj6yfqjC9gIsXz3jiHcE5xTrkFoDgaI
 M73Q89jN5f3/cyWP9ztPZQpa76iupQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: EWYCD3IE5NB2NYS732MYZH2BOD7I6BPY
X-Message-ID-Hash: EWYCD3IE5NB2NYS732MYZH2BOD7I6BPY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWYCD3IE5NB2NYS732MYZH2BOD7I6BPY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt712 can only support single register read and write operations so
does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt712-sdca-dmic.c | 4 ++--
 sound/soc/codecs/rt712-sdca-sdw.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index 847198e6c07e..869cc7bfd178 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -110,7 +110,7 @@ static const struct regmap_config rt712_sdca_dmic_regmap = {
 	.max_register = 0x40981300,
 	.reg_defaults = rt712_sdca_dmic_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt712_sdca_dmic_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };
@@ -124,7 +124,7 @@ static const struct regmap_config rt712_sdca_dmic_mbq_regmap = {
 	.max_register = 0x40800f14,
 	.reg_defaults = rt712_sdca_dmic_mbq_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt712_sdca_dmic_mbq_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };
diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 8f65516e7562..ad06267b0ea0 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -116,7 +116,7 @@ static const struct regmap_config rt712_sdca_regmap = {
 	.max_register = 0x44ffffff,
 	.reg_defaults = rt712_sdca_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt712_sdca_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };
@@ -130,7 +130,7 @@ static const struct regmap_config rt712_sdca_mbq_regmap = {
 	.max_register = 0x41000312,
 	.reg_defaults = rt712_sdca_mbq_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt712_sdca_mbq_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2

