Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A065B72AC52
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:30:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4BCEA4C;
	Sat, 10 Jun 2023 16:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4BCEA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686407429;
	bh=fTKQXqtpN8YKKJEqPomBy9FOaA0QaabwLou0I77GuPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cIcRuUzlj0545e1v0mX5cYTFYiCCXPavf8EV3TEr+nlwJiwugJczsKqF0Gjkaqe5c
	 oqSPauFv9aJo2cHEELBxaOfVYHeymonYpSd8s4pq0lz+519pnjCZB6sbJA6izdMq9+
	 sXihXa70/5MxfjSjpns+x+1kykyKIkx99EXEqUfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1838F805D7; Sat, 10 Jun 2023 16:27:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30930F805D2;
	Sat, 10 Jun 2023 16:27:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A051F80567; Sat, 10 Jun 2023 16:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE99BF800ED
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 16:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE99BF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qi9S6Xg2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6FDE560DE8;
	Sat, 10 Jun 2023 14:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B7CC4339B;
	Sat, 10 Jun 2023 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686407259;
	bh=fTKQXqtpN8YKKJEqPomBy9FOaA0QaabwLou0I77GuPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qi9S6Xg23Qeq2NApl8/wIfPM8ulOKvlIWsOGiwS47c4mA1gBw506KpDAHkTW1rEN+
	 LR3OlJitlyV6FdRjoWiOwMN+us6/1OVwlopd5y+pIpkgM/McrJ+dt1Zlq4ego1uLty
	 HqOYt5732e+wnWlroPXg9V+xJ4kSofwhORzBi+EPUA6HGiP9+pqzlm6qZ3e9i26LYn
	 hCq64HyI2asGiwboNaPNMfiM4EpSOQsygvgpExrXT0DESpzJTbRkiAk5go0dhAA8NQ
	 NXKgYIROefYUQZ0GDQjfAhBgtIVYhsC9qYvvUNk1yh3iTm3MhP5FTVlBLGimLkiP3B
	 wdZbkIeee6ilg==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 15:27:19 +0100
Subject: [PATCH 8/8] ASoC: rt1318: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-sdw-maple-v1-8-85ee50c93905@kernel.org>
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
In-Reply-To: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fTKQXqtpN8YKKJEqPomBy9FOaA0QaabwLou0I77GuPM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIhPrdGKajvs08vpH43GbVlPUp60YhBhdwUzTdWT
 vglVYqKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISITwAKCRAk1otyXVSH0GU5B/
 9WofWh59qmCdRG2ez12Eo6I/VfHZBXLvWYEjSRXF8Q3hRINDvS9yPkgRkJ3FP5jllKCLYPEToqTvVZ
 /pacUXeYcGsXkkh2j+dR4BSaDugnJeO80Q1TbI18PyrwW6PNnoYrQp9zKzaucqhXZumhg6K3/BISR9
 bcyRTG9+LV6Y3aGtTn17N9r4dj+4UrQhNEUyKnCOdlbSjkokFsYKCv6fpbSn2kfu5MHAY2/TzdBQX8
 FPxTM5PuXoU9ZTLicRVPMJl6ivnp2FCilecNUlXbAvHwQjXj6CZgwg50CVnFay8GOLNpa4VoDqH34C
 H6WJV3X5Yo0zyNlnfgg0rVct55oy6B
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: UBM5KT3BETEFWQ2N5LHCW2WI43YWMNX7
X-Message-ID-Hash: UBM5KT3BETEFWQ2N5LHCW2WI43YWMNX7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UBM5KT3BETEFWQ2N5LHCW2WI43YWMNX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt1318 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1318-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index 3751d923611c..16d750102c8c 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -337,7 +337,7 @@ static const struct regmap_config rt1318_sdw_regmap = {
 	.max_register = 0x41081488,
 	.reg_defaults = rt1318_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt1318_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2

