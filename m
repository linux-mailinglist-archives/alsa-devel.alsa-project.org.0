Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D846172AC1D
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:06:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47D25DEF;
	Sat, 10 Jun 2023 16:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47D25DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405991;
	bh=e+DtzPUmvllzECVwTp+EmnSjRpcHckSRHFrm3kUKz9E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vnapJO1xHWaJyvj5et8TcI9rKU5rb2JQXsGBJ5QFHGsWuFJSH5ZJfPqJbn/9bYlYq
	 eshRuJYeUCSCEl8VBKU6FDc0Av2ketlQtcTrBM/+vQLx2oaRxOm6UIfqnTAI12hxZM
	 QeUvxQB1IR4ZF36zPXA92Af9yQUViCCbjEKhMrZc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80BE9F80685; Sat, 10 Jun 2023 15:59:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9F69F805FF;
	Sat, 10 Jun 2023 15:59:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C4FDF80290; Sat, 10 Jun 2023 15:58:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75A6BF8016C
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75A6BF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nr5+u5tr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 366A56178F;
	Sat, 10 Jun 2023 13:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF604C4339E;
	Sat, 10 Jun 2023 13:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405504;
	bh=e+DtzPUmvllzECVwTp+EmnSjRpcHckSRHFrm3kUKz9E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nr5+u5tr/vJLv5uPpWROnP22QxIAFEpj0PZCwLsJsl86bexOR+tGHOEFFnx1vTml7
	 JrGYVUNMjcnpBr0q3VDr9Ix3YHKXjev8yp8caRiNeJljsfMOq5YJcO+pM8giIg2ZPA
	 BYdOAG5/U+1Qt/XmG99Ae+ZMsV9NAfIc9c/el0Ojzcv/PgaoxM6ZKi1S9T+Y8ka17Z
	 1QGJC/sTL2zqQY4Dr4IYFy16xPHpIzSu+Qnvbf8ggSLHn4UibOEo25ItUoIjGtLP4P
	 DqbpTj8xOOzfBoPri6JrDvxwZ8nYBlhyRnImfS6ItUKJ9n2us/hZ/069Y3ZHiTcEcD
	 joN6JT9evmfLg==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:58:00 +0100
Subject: [PATCH 14/16] ASoC: rt5668: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-14-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=broonie@kernel.org;
 h=from:subject:message-id; bh=e+DtzPUmvllzECVwTp+EmnSjRpcHckSRHFrm3kUKz9E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFqPGpEMuNa+rj2FpljpR+VmzYxghieNj6mNSWC
 euoi8S2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBagAKCRAk1otyXVSH0OLMB/
 9pFy4jFYs9oYrGrib3NiHdt3xXrwD+Ul6rcUxK52fD5mURHfXGNImnBat5nBGPWvoqdK1ElKp2LHa2
 RMtlA0rSPDzuf2laR6dYYP0vZQwwti+NC/mrhwsgtcjbrxsBGjXy8C5Mej2UQv1PpvcqUeck/wj0mM
 DPc0jgTVX9OJX1b358qOhGlIlkFPnTqsouch3jtboPXqIBleKSB/veWLu+/qJDiAAumwNFwMs4PajL
 v6FnmYvnfSiRtXa6JS+bCxa2hUwFIvzKNDhO+1JEDP6Gh/73FmdLI676tMhSL6nRyWNV30jCXcKzaO
 kzsalGlWclINfAIeT0gkQtr7juyTkG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: D5ID6CSEYVNZZO53M7B4U5TQPUXQMWWD
X-Message-ID-Hash: D5ID6CSEYVNZZO53M7B4U5TQPUXQMWWD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5ID6CSEYVNZZO53M7B4U5TQPUXQMWWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5668 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5668.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index ecf3b0527dbe..e2025c9f76a6 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2370,7 +2370,7 @@ static const struct regmap_config rt5668_regmap = {
 	.max_register = RT5668_I2C_MODE,
 	.volatile_reg = rt5668_volatile_register,
 	.readable_reg = rt5668_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt5668_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5668_reg),
 	.use_single_read = true,

-- 
2.30.2

