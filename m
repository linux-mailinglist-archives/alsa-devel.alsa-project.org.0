Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6682D756E54
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 22:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F028A4D;
	Mon, 17 Jul 2023 22:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F028A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689626107;
	bh=b4IseGb2UCJOtvGxtD0s69we2S7StSFhtsSuvhYajGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pIzREkSsfT5e2e9tqpbBzbBdT6Mu8CjUncUS70jWKAv//tRWj6Uhl/ftsZKgthwWK
	 jE9i5m2tduBhb/eeuhGFJfptKQrYTWy0X7imp5nxzHNariJ32WJ5dRd7rPsddUMmC2
	 xXxv15LRuXCZ8r4is5Rzkczq+RESC9UrGZQklMmM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39E50F80552; Mon, 17 Jul 2023 22:33:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1D17F80520;
	Mon, 17 Jul 2023 22:33:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3BC4F804DA; Mon, 17 Jul 2023 22:33:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2489FF8032D
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 22:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2489FF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bYUx7Tx+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C0B566125C;
	Mon, 17 Jul 2023 20:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7D3C433CC;
	Mon, 17 Jul 2023 20:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689625997;
	bh=b4IseGb2UCJOtvGxtD0s69we2S7StSFhtsSuvhYajGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bYUx7Tx+9t535IoOQV/4NtVlpxBG7M991N4cV4OqhNx4wRPhr5DGivfAiQryXF12n
	 pJxVGPrmIzvL/TZwHM+ndvVkxwTe5qR8ln0ERy6uxlPeS1+ZUfJ47CwqIrddBzOT50
	 +IEERnG54L7UMOCXTeF10Ur06YR1yyKMDweQDUsnv0Ht3WcwzD5Nt0zkOmfbHK6Ybr
	 s7L1jz8KoO6bU0+MLGZgJdjxjJ53yjtwb1G23Nhp66NYNgIGk2PGCgNawDN3M21BSh
	 emIahnZHgmy9xiPaE6mt+7/4Ux4zJ+XyLR99spw0xiV8YekKvK9cDQXvsKOaVIiTNB
	 oJJFlJLLGNJkA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 17 Jul 2023 21:33:04 +0100
Subject: [PATCH 2/3] regmap: Provide test for regcache_reg_present()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-regmap-cache-check-v1-2-73ef688afae3@kernel.org>
References: <20230717-regmap-cache-check-v1-0-73ef688afae3@kernel.org>
In-Reply-To: <20230717-regmap-cache-check-v1-0-73ef688afae3@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=b4IseGb2UCJOtvGxtD0s69we2S7StSFhtsSuvhYajGE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktaWGL+nsYDeQ22H29T7708cuCbVpYatWsfswB
 LsgPmEyUSSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLWlhgAKCRAk1otyXVSH
 0GQhB/9KWjFZlmAi+CPCw9ErcXaD+o+f0UjE/xjMg7gOp/EfCUE6G2TwovHElx9AmZ0pmW3Ua+H
 LLIazLhmOHiSHmoYSQ94ocWkaYUWes9LUSOfVeQsVinH+LHGFmCUy3dc1BrE+Va0wbXbohaCpO1
 lQeW9sv+UBPQRB/4cPXPd3bvfBb+ov1+mQ8TST3PqLXkkYymkJCT8W+5hxGa2H4tk1hpFJVa5Tq
 9RG4/ljJ8eZoNKAkwD9uwkMlSLpKsF4qy8V90N0wgZ+7rDLzT2zVzDGntkGFVsTdb7b4hqAuBZ0
 aac6c469KmaIBHy4OBB2ADZpICLO6aiyVzMmDOOB6lLC7f0s
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: DYDM6Z74DXKMC6AMJUNCDCK3BGG5KQVZ
X-Message-ID-Hash: DYDM6Z74DXKMC6AMJUNCDCK3BGG5KQVZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYDM6Z74DXKMC6AMJUNCDCK3BGG5KQVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Provide a KUnit test for the newly added API.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/regmap-kunit.c | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/base/regmap/regmap-kunit.c b/drivers/base/regmap/regmap-kunit.c
index 24257aa9004d..8dd96a55d976 100644
--- a/drivers/base/regmap/regmap-kunit.c
+++ b/drivers/base/regmap/regmap-kunit.c
@@ -833,6 +833,45 @@ static void cache_drop(struct kunit *test)
 	regmap_exit(map);
 }
 
+static void cache_present(struct kunit *test)
+{
+	struct regcache_types *t = (struct regcache_types *)test->param_value;
+	struct regmap *map;
+	struct regmap_config config;
+	struct regmap_ram_data *data;
+	unsigned int val;
+	int i;
+
+	config = test_regmap_config;
+	config.cache_type = t->type;
+
+	map = gen_regmap(&config, &data);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(map));
+	if (IS_ERR(map))
+		return;
+
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		data->read[i] = false;
+
+	/* No defaults so no registers cached. */
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		KUNIT_ASSERT_FALSE(test, regcache_reg_cached(map, i));
+
+	/* We didn't trigger any reads */
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		KUNIT_ASSERT_FALSE(test, data->read[i]);
+
+	/* Fill the cache */
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		KUNIT_EXPECT_EQ(test, 0, regmap_read(map, i, &val));
+
+	/* Now everything should be cached */
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		KUNIT_ASSERT_TRUE(test, regcache_reg_cached(map, i));
+
+	regmap_exit(map);
+}
+
 struct raw_test_types {
 	const char *name;
 
@@ -1172,6 +1211,7 @@ static struct kunit_case regmap_test_cases[] = {
 	KUNIT_CASE_PARAM(cache_sync_readonly, real_cache_types_gen_params),
 	KUNIT_CASE_PARAM(cache_sync_patch, real_cache_types_gen_params),
 	KUNIT_CASE_PARAM(cache_drop, sparse_cache_types_gen_params),
+	KUNIT_CASE_PARAM(cache_present, sparse_cache_types_gen_params),
 
 	KUNIT_CASE_PARAM(raw_read_defaults_single, raw_test_types_gen_params),
 	KUNIT_CASE_PARAM(raw_read_defaults, raw_test_types_gen_params),

-- 
2.39.2

