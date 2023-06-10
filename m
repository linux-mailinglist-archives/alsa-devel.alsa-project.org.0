Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A072AC51
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D13A6DF1;
	Sat, 10 Jun 2023 16:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D13A6DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686407414;
	bh=t9bf/VlmKYWvWf73Nu/RwUIvGE5Ts25lReClws6ApQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kb6NRfN1tp8EbU6T2ri2iIwAJXsFHqlNlB5W89pnqT8zPHuXav2kLb3TiI3mNBy5E
	 uYIk3bZOD0zltAzdVzdT8nEM4n/mWRfxGlxf/e7qXQDG2A9tBz4HMTkI2GK70PqKH3
	 jBX6eglWAQG3wZCD52rS2cliLc8E1VdNiYqabvAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6F60F805C8; Sat, 10 Jun 2023 16:27:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6436AF805C2;
	Sat, 10 Jun 2023 16:27:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A7D2F80494; Sat, 10 Jun 2023 16:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E02AF8016C
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 16:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E02AF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m2Jf7SqE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C429F60B7A;
	Sat, 10 Jun 2023 14:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582A8C433EF;
	Sat, 10 Jun 2023 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686407257;
	bh=t9bf/VlmKYWvWf73Nu/RwUIvGE5Ts25lReClws6ApQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m2Jf7SqE1LcKRnX7ttp7oL4adYo2uhuBzK723hLgddmnkyCuBAufDdTucIdVBcW8Q
	 NpNlhXYn+qfEifpaDCBWcW3P3Q4OF7oiMdcj3vd7KRCrGPjqGMdHiaIk9KI+Je6SE3
	 5eW92wUrbetbpxb+iJoT4u/H6PLNgw8lEMnKaf6SLsnBZj5ZZHUoK9XgEpev+UOTUa
	 XxI1KFHD/0MoRofnF7Mpz7N9U+al6CIMnI5iIuuqq7bcQJ0Zg3Hbp1PoNyR38sYfk3
	 uAHDUIFfHz393gZU6hwhqbPC+3wC0Cgl43o27eKf2zEFkxfC5l+PCrx2e8ri13tI3v
	 s5Lxeaja7fM0g==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 15:27:17 +0100
Subject: [PATCH 6/8] ASoC: rt1308: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-sdw-maple-v1-6-85ee50c93905@kernel.org>
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
In-Reply-To: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=953; i=broonie@kernel.org;
 h=from:subject:message-id; bh=t9bf/VlmKYWvWf73Nu/RwUIvGE5Ts25lReClws6ApQY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIhNdhcIhnt1CZtbbuGr3F3Y+14xT3IL4wfDLAwE
 wYbsin+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISITQAKCRAk1otyXVSH0PX1B/
 0RIMJDAivEvkdhiqPT7tdRY18KBuSp8lZ2IzIgm1iLGNalfHIpC6SJelQATknDvn2c8FZzTecHjBA7
 vXrJtpFozqC2mfRbTvdusIsPYuN2S5KQjjAJcxEk5AE/40THEEQUEcbMdEItusQG9vg3gv1A27cNWk
 WYatwHjDV/T05J83QnR7O8P9DMvqVc989R/FrQHqnZY1AMSsL3zfGg8BbplfALnF+Uin1kaJICjLu8
 Q9B85kghc8lzVu3jf9qXLQdMm4qVL4X+imTjRqPT7NxNYtQq/RhqQ+P24ESTVPtPqwJnl0hggdivzt
 RitOTivpxBWfqu/JhoDm2+p0lpYieq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: NWANOTJNECINL72YCWWMRCEXUYWBR3L6
X-Message-ID-Hash: NWANOTJNECINL72YCWWMRCEXUYWBR3L6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWANOTJNECINL72YCWWMRCEXUYWBR3L6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt1308 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1308-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 313e97c94532..f43520ca3187 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -68,7 +68,7 @@ static const struct regmap_config rt1308_sdw_regmap = {
 	.max_register = 0xcfff,
 	.reg_defaults = rt1308_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt1308_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2

