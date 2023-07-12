Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0437510BF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 20:47:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C98E886F;
	Wed, 12 Jul 2023 20:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C98E886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689187652;
	bh=g8Z30w/a5B5ziAMdSQXrexKfQd2K53zred6XaKJely4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PQsNVNednoqfcoNQSXD+dhzf89LyU3FJOK4SW//KQ9Cwd9oNQHWXmmvy0gk0Z0ddH
	 eoP5VAnHJOPA41BY8WpGhHf9FM8gkY7CqzbJtyVTvqigLym9HKSE3HN5ouefPv/c3m
	 FuIDxMHy3j3fpiVTOmzRIIQWzrySfDX9uqhHD2TA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9111FF805BA; Wed, 12 Jul 2023 20:45:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADC92F805B0;
	Wed, 12 Jul 2023 20:45:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3308F80571; Wed, 12 Jul 2023 20:44:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A39CAF8027B
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 20:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A39CAF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SmPkgIQ0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E5DA618D5;
	Wed, 12 Jul 2023 18:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FFEC433C7;
	Wed, 12 Jul 2023 18:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689187487;
	bh=g8Z30w/a5B5ziAMdSQXrexKfQd2K53zred6XaKJely4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SmPkgIQ0fvq5VqBjgG+OgzmsyR3o9mquWIj8VOM2+VA69WlJGIdGMrJHb6gdU0UAd
	 eOT4tzRM4pTZXCXcSd9CBnyNIqEoldqYR+QbnYyCnWFvziEG/OZm9TcEw2dE+a2JVy
	 auY9oRqmZCgDAcQ3BmRB00ES81YkxsENY0Po3+EobrC6yAi9gkrcm/S/Q696asFTRx
	 +za5gzOlZHL/L/FpVRx04nQSFrYkAKi+ydKbrgh6zuHNI6cc+N/q5nvSPoXq/2jc2K
	 fxvX5XY0HamhbALQsGpSlcq4lVnXkSdyKslbiPbCK12VjZSOKX7XFIvAWFrUwHFylF
	 rjorshoSkBs3w==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Jul 2023 19:44:31 +0100
Subject: [PATCH 5/5] ASoC: sti-sas: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230712-asoc-st-maple-v1-5-46eab2c0ce23@kernel.org>
References: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
In-Reply-To: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=g8Z30w/a5B5ziAMdSQXrexKfQd2K53zred6XaKJely4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrvSV4VSwMPNHfYqvZAeo+aRCUrd/jUSAq5IrT
 GvtnK8yn/uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK70lQAKCRAk1otyXVSH
 0CyOB/9qOzd9IiDmWoLXBBai8amztM/CH7VPxYvzSVoFZ9rbzZfJWqnB7k97Sfi4r3CBLrX60s0
 voL5tcZtCb9K/UaSYtSGek959QvYEMu8yTVO9OIPHXq3PJq42VAR9FtqEeMdEogRePHkkulWdAL
 fjZJ504Nyr6Epro41Jecs3+4JfyiCLTXRKpiT2kIOnL8gU0Ajm453pV2VQ26/NBiRmp8sSRg8gI
 BWAK6L717g5ovV0ql/+t8E9cErOOLN68/M45vwuJc/Bz4pFekeGf9VtlZeD1rragG7gvo1n3pZt
 u34GtkROxzCu03BppnQFufZy15LJCJGvj+uetJRO7d/26KvK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: ZMLRX7M2LTDX643XBK6SJTBFQ7JE43JB
X-Message-ID-Hash: ZMLRX7M2LTDX643XBK6SJTBFQ7JE43JB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMLRX7M2LTDX643XBK6SJTBFQ7JE43JB/>
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

Update the sti-sas driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sti-sas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sti-sas.c b/sound/soc/codecs/sti-sas.c
index 99545bcb2ba9..c421906a0694 100644
--- a/sound/soc/codecs/sti-sas.c
+++ b/sound/soc/codecs/sti-sas.c
@@ -316,7 +316,7 @@ static const struct regmap_config stih407_sas_regmap = {
 	.reg_defaults = stih407_sas_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(stih407_sas_reg_defaults),
 	.volatile_reg = sti_sas_volatile_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_read = sti_sas_read_reg,
 	.reg_write = sti_sas_write_reg,
 };

-- 
2.39.2

