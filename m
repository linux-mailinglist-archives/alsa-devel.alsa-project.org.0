Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E07AB751533
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:24:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E21DAE9;
	Thu, 13 Jul 2023 02:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E21DAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207856;
	bh=1jbRpI5sJeLKn9nenSrVePSD3Y2qxSI3XhNFEvhmbEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FGwJq9Lx1SlJ9I7Oq3uJKbTrmp54wH6F6kMAe30PRWO127F6hEphUm5Y50bhP33Im
	 MONNkfvRVyu1kGUHf8WRI4DI2OnLZBmvpBZe/kusbIj5oMuzOnYZT+IiXRpuxVPA4f
	 634x1yMf8BfqcoERPt9JbVVG+G2auDVOTHti7fg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA393F806D7; Thu, 13 Jul 2023 02:16:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 445F5F8055A;
	Thu, 13 Jul 2023 02:16:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBD46F806B1; Thu, 13 Jul 2023 02:15:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BE69DF806A6
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE69DF806A6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kmCDVfu8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B0DBC61986;
	Thu, 13 Jul 2023 00:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD233C433CA;
	Thu, 13 Jul 2023 00:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207345;
	bh=1jbRpI5sJeLKn9nenSrVePSD3Y2qxSI3XhNFEvhmbEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kmCDVfu8+vcIW784GFBjU7M84QonyN2cfaz26qiAmJ8BIDbRMGrgS41SMUnQSbuvo
	 +t5tNYpZtlhTvoQoU2zDb3eKLxyosBaK9iEtX0gjC1sfRDaJi8nTmcSiNZQZdwR2gb
	 wZqlNQPkIzdSk3L26QrWGbEHSsjPiLso9fF6sRv42kqj5R5AtJYIX7Zx7+iKYug/zw
	 iQVGv83SL326QHp1fAOG9mJAIBPFLIv7sVyl2P0p7DVHoljc6pPDCRKYYEuFK1MRfr
	 tW17I1xjvAR2Oc5Kz43emmghei+36Ke+cuLotyhlwzcCHrOywuj5qqH1m3fAZOAXlS
	 KqQgS8yFgjHJQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:45 +0100
Subject: [PATCH 32/48] ASoC: wm8960: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-32-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1jbRpI5sJeLKn9nenSrVePSD3Y2qxSI3XhNFEvhmbEY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HEJzDyLJTfCx/5uOgCiVf/SIO0SukOLGDNC
 WA8phrGUeeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BxAAKCRAk1otyXVSH
 0DiwB/0S2O9ovOtbT36/mpVIiM3Dcb6XR+FtGR4CUEbGG2LamWGZ41/nHADG4BeZklTQ9T6ye1s
 WqJXUR+rcxg8ttEshjquU6b51iDCCSmhpbQmNGAS/CjOnVaNDOqJdZlhqN7rSbWXEY3H2oBp0e1
 gxWgbW6F4m2kigzzf1+XsR/PwV+HHTci1EvTN9ck9HeBRZk+/Zz+8vCUgWSBCD/EneLKzpuE5R+
 wjVBJ/pabYUKJ1I/C5jUwLz+k7d81rJ+5E8j/KuLCh0udxmjx1JHvSHhHyE5A5BEhSV9n2fFNY+
 ZiZe7+Wsm2vQI8m2x06TEr/tAgwcC9FzI/xwVa1NNMvfNCcd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: AU3FBDXOSQN75NS3S4WI43V4W3Y5DNVR
X-Message-ID-Hash: AU3FBDXOSQN75NS3S4WI43V4W3Y5DNVR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AU3FBDXOSQN75NS3S4WI43V4W3Y5DNVR/>
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

Update the wm8960 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 366f5d769d6d..3a73d02cd698 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -1387,7 +1387,7 @@ static const struct regmap_config wm8960_regmap = {
 
 	.reg_defaults = wm8960_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8960_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8960_volatile,
 };

-- 
2.39.2

