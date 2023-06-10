Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB72C72AC1E
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:06:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26BD7850;
	Sat, 10 Jun 2023 16:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26BD7850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686406003;
	bh=DhVDaTfblExbkMNV2iDIh8CKEpndJ7oN6SFkWHjdpa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QMmYjH758p3SGvwZiPcJIIGVtbCgT0ud3XqjfXzVsGblqT8YkMWIkUCvUDV3ji9cV
	 rhDUZdYZj9UO7Tgj6gpcc1HICuWQ8MJyBFYz910sOUSF1+EdtWmqnfu/ls50kR6rwb
	 Bx9of3in7LFih1y9NhyTf6EILxnWuj2hWdLeHF34=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93124F806A0; Sat, 10 Jun 2023 15:59:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88A54F80681;
	Sat, 10 Jun 2023 15:59:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 616D2F80199; Sat, 10 Jun 2023 15:58:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1930F80155
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1930F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mYP8B3W2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7FC8C61931;
	Sat, 10 Jun 2023 13:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C777C43445;
	Sat, 10 Jun 2023 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405507;
	bh=DhVDaTfblExbkMNV2iDIh8CKEpndJ7oN6SFkWHjdpa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mYP8B3W2QBL7GXK3QRQ18eXCB9OfuLlHvSIvuUHuPCsjt7V7ZBeSvGm6tdrgO/0Nq
	 o8qh52NpXlLr1m4XmxuJB58zcAtJ+Rajt/US76YX63/qx6bCA1Vl0g9SqVRC998hiA
	 ZsPtmNVuJgC14x8xhtcpMGG2e0iYuMXQeM7lfEU0YfsMpQhnvhzdQpCnxjCVydExFC
	 aXrv43h0xNysNeyxoeLrXeQ9TjFSYqy0U+Ji4HmnmTZEqUBfYs7MUDEjxvDiGahgZv
	 ia4clN/jOSgAZpYQGwb9r98D4SyouAZIPhHGolGLYA0M6Kg30zKq3C1MWSB9DWYtPB
	 2DvJ3asIx5YMw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:58:02 +0100
Subject: [PATCH 16/16] ASoC: rt5682: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-16-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DhVDaTfblExbkMNV2iDIh8CKEpndJ7oN6SFkWHjdpa8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFsNB7nX+e2eJ9bCFD83mz18KNzy/AOAYdl8sN+
 6R9QC1CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBbAAKCRAk1otyXVSH0PR3B/
 9IlrXE78RrmGAVjjcrhKwP0jFqRVa0Q3G6qZotfwDdJfsgiAjEHseMl6d/+gyWtx+Dy8t0q65czDoN
 vFkv84oDAR3dLVtKKxmUGP0XOal4ksLrncvVadz6B9sVV9CUyFpPFVpZ1sWO/qiAlqq/F+dbpTkgZ3
 qeFH5mPYoFZ4dLAJJwp6qwzb+65z5AjhUi7wh/9lw9zdu/nSGJgLnNYfpOpPBDjgwyNuEGGC1ywZ4v
 h3VfDT2ykk2e4x6EA+SZORgetr+TmsU+vkGaCLa+esUn4fWM6MZIBCvj8rhknJSq7b99ypfTwXBiCe
 TdAB3ohnNOPY6hU/F+P1uCJEZFnfgZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 4P7LIIORIPAKXH5EBY7JPWWCZRXIDQSS
X-Message-ID-Hash: 4P7LIIORIPAKXH5EBY7JPWWCZRXIDQSS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4P7LIIORIPAKXH5EBY7JPWWCZRXIDQSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5682 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5682-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 5bc46b041786..00ee5019bcfc 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -47,7 +47,7 @@ static const struct regmap_config rt5682_regmap = {
 	.max_register = RT5682_I2C_MODE,
 	.volatile_reg = rt5682_volatile_register,
 	.readable_reg = rt5682_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt5682_reg,
 	.num_reg_defaults = RT5682_REG_NUM,
 	.use_single_read = true,

-- 
2.30.2

