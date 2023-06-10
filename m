Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EE172AC49
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:28:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91999836;
	Sat, 10 Jun 2023 16:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91999836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686407317;
	bh=H4QZ1JlDK3qTIKSPU5l6iqYdiitpnjBilxeEMCjBL9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EAcaPzjQVjrTYxAemG0s435DhY+gsvsJ5ofEllRNdAOl6ryjXOvx0x1NHO5ctHnwp
	 7hyWfntsHyzvrJrMgxkHADym7Bfek0iukhFgglTJDUkQQS7TOqwQ1G+3xcTk8zJ0fA
	 yzZ88dQcrLk6HmzgjOvVx9beVvrkNLNDlhevn6Lc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E2AFF8055B; Sat, 10 Jun 2023 16:27:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14B5FF80520;
	Sat, 10 Jun 2023 16:27:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05799F80548; Sat, 10 Jun 2023 16:27:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 683B5F80544
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 16:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 683B5F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eeWHF4ar
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3551D60DF5;
	Sat, 10 Jun 2023 14:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB94FC4339B;
	Sat, 10 Jun 2023 14:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686407250;
	bh=H4QZ1JlDK3qTIKSPU5l6iqYdiitpnjBilxeEMCjBL9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eeWHF4arf+L7OL029IG5Az1nflDkm1/T5vgs51AMqTOt/D0QWZFpmHbzyFMxG+R8l
	 cq/5LCzw2xOvrTv1fzdjvDx0fzRw5pZ/h3Jt+QmjCcqud6pZcu6HYIrGIW5MnyNMM0
	 XMcOZ/yEtxdYgeSCI/p5SJWk5NcjZbaBbgUlMTvkQxCNWGdPWmtz5JvXNEVLjnrLx9
	 CramHU/7MXTELIMY9YEkZsh/aJi8o0MRMJcuCMEouFaryONG32eQqXeDjNFLDoQqJC
	 LikfT5aNp/w+PfT/Y5ybKIqHfLGEeDajqX2fHm9LQpfAz15foRR+c5oMGU4Eu4t22o
	 qvzpG9RqHNMEA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 15:27:12 +0100
Subject: [PATCH 1/8] ASoC: rt700: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-sdw-maple-v1-1-85ee50c93905@kernel.org>
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
In-Reply-To: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=970; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H4QZ1JlDK3qTIKSPU5l6iqYdiitpnjBilxeEMCjBL9w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIhJccivpduDWnBRFXw3tUoSeSrL9i0+u/QIgz0J
 eZd80M6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISISQAKCRAk1otyXVSH0PaIB/
 99lFSC1NoHq4lP/hTfZ9VEBzTIz+qgUuMTOjQL3QmmjCImudMreu8agQU47k8dH/8CCd6TWY322srV
 hLRJ9cwTePBSjLWlmX0QAoR0wynB1olw1aW1mLS2t1ZuakONa3xuweFbabRj955Lg5G+ju3uh4qwE6
 ODnKu9/ePJ7iZi2MBstW3uq88opbad04Hsp6bq/UJ17Nft2IA+K3LSBvvM2UWJ8lq+82eY0o3hhSFv
 EoTSQ9Ip4t/KZCAOwH46q1IPScNRkVnTwWonb0hOUwam5hFms9gtfKBL/NJswOsGaXi/eyfr4uHNOV
 3fH8OgGZIoj1hirAoCSRKJ2UkbczXq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: PYAAQ6FI4C5JDJ2363F55JWKHYNTOTRS
X-Message-ID-Hash: PYAAQ6FI4C5JDJ2363F55JWKHYNTOTRS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PYAAQ6FI4C5JDJ2363F55JWKHYNTOTRS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt700 can only support single register read and write operations so
does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt700-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index ba7767bee07c..8b28e47775cc 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -292,7 +292,7 @@ static const struct regmap_config rt700_regmap = {
 	.max_register = 0x755800,
 	.reg_defaults = rt700_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt700_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 	.reg_read = rt700_sdw_read,

-- 
2.30.2

