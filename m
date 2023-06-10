Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0085F72AC0E
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:03:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58B5E10E;
	Sat, 10 Jun 2023 16:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58B5E10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405812;
	bh=Q00LQogImLoDYXQNTNyAiMaCJu6cuUXWTl6BTvaUQVU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hLrf/NTssYjBGXQ8CuZSN75x1nr7UIiooO6WThgl10sppjCyhMSzozzcOBxdlMjeF
	 wo1CRfDMzsCoIcgs7SXlXT23zrK8p8kByWsCneSC/mbO7WfCwEEVTunIjzQ16sKxfv
	 OrUFW63nkkUEWiX4cll3XYbFfE9GYOHjQsbdUxfU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 286A8F80632; Sat, 10 Jun 2023 15:59:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97F02F805FD;
	Sat, 10 Jun 2023 15:59:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3354F804DA; Sat, 10 Jun 2023 15:58:17 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C7FA4F800C8
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7FA4F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=osUBCv/g
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8437061772;
	Sat, 10 Jun 2023 13:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1386DC4339B;
	Sat, 10 Jun 2023 13:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405490;
	bh=Q00LQogImLoDYXQNTNyAiMaCJu6cuUXWTl6BTvaUQVU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=osUBCv/gCae0utS7saDATJflDvSC3eKqOomcMT2+hZ5TMvVUL1UAU8FtsHiXk8sfX
	 OKpGjvuSJoGiHCPfeNYFOSwsgY/KR/scWyKXI0EY67hf5nmyEZCc9URQJ+kl93XKlu
	 xoPAsMDzqdGTtCloLVY3fnstbW3sBOFGfoN6tNpO85/RUKuoX8bVtWW8Vxr4yzsP9l
	 jLfGpoTfxLB3EVVvLyaAdudR1b0SXzJBExK8G4qPGv+coOIT9ySxpYZ7pV3RvJM/YW
	 A24tB/JBeOHl30FALA4JI8rChfyyIAgAlEl47UexP9W3gHGJtMw0B0CqMH+KyGthXr
	 /mPUGiHHyRViw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:57:49 +0100
Subject: [PATCH 03/16] ASoC: rt1305: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-3-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=976; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Q00LQogImLoDYXQNTNyAiMaCJu6cuUXWTl6BTvaUQVU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFhF1TlZT2RGnteLf62poCOizECkYxv42uUTrK/
 +d3m9D+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBYQAKCRAk1otyXVSH0PMlB/
 wKS6NMOXZdo+RwJNG76hVuPDDcILQifPYzNuKUfwmLN6rh3oAxuYWXoEnf9SxBBDeY64NNEkmF1AYk
 GSP3AsjLowWJn5WnRaQourHaabfgiSJ3hWxqfAjTBffGicu0VCbHOz9XytMAXBzfNpca0uXYVf1k/Y
 BYEXmzSbE4hANdCbwpUg4rjMjm9ktZAmENeiL5ozqZAjKTzLDf86+dX2jqwTKj5dNZiEEIPU4VJmM9
 Iliz2jbRoM61puSxsPxQtUSSKwrk1Aw0n3nTgS9hDwNgAWoZw9BQCaziktjG2Vb8nNyGPatdetEmGr
 mMPO5vgxzTVt5KAnaYxFSnkamcpowu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: SJFS6CIAM7QJCW6SBIY7EXIXUYRNFT2X
X-Message-ID-Hash: SJFS6CIAM7QJCW6SBIY7EXIXUYRNFT2X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJFS6CIAM7QJCW6SBIY7EXIXUYRNFT2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt1305 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1305.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index 5b39a440b6dc..31063f72a04e 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -955,7 +955,7 @@ static const struct regmap_config rt1305_regmap = {
 					       RT1305_PR_SPACING),
 	.volatile_reg = rt1305_volatile_register,
 	.readable_reg = rt1305_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt1305_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt1305_reg),
 	.ranges = rt1305_ranges,

-- 
2.30.2

