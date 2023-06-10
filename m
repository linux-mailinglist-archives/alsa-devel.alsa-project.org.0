Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A1C72AC18
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:05:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B9E783A;
	Sat, 10 Jun 2023 16:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B9E783A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405934;
	bh=N74st48OY2D0E7V6bc8ANO+5ptrPPDRUx4dMmlqujvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PCzdt9nEayK2EYqEBqwfV/Ec6LKB2Xx+oiRJ/KUv9ecXqwDIZzO+GQz4+pRfLnpT0
	 1wf4RR8vsgugOhlBfx4lu5kt8qif6rdx57J1yEjq95eFlaSpc20FyE7vy8XRkxkJ8H
	 5m7UzhEXtXTKzMN+vWoJ7ykPUvZU0Vdqpsohym0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB0BAF80637; Sat, 10 Jun 2023 15:59:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38828F80637;
	Sat, 10 Jun 2023 15:59:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7438F80494; Sat, 10 Jun 2023 15:58:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DBDDF80155
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DBDDF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ya9W6Boy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C59161775;
	Sat, 10 Jun 2023 13:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE8DC433EF;
	Sat, 10 Jun 2023 13:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405500;
	bh=N74st48OY2D0E7V6bc8ANO+5ptrPPDRUx4dMmlqujvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ya9W6BoyzPehpxgVpkZg4egFN4yzpxZyxI1IgFGWBjQyrtkllSSZRtyFzcTcmnQ2M
	 C54EfB6g/tDEsj1etALFLM2j4FhvDJ+bn9DNIVPpPKVg2JG85jIol4gFzd1ibFolUS
	 sHEndxmRidKZnSr0CEZCm9R/kr0lYojIuqW3idf29Y9zQNGyQaYxykKWAYiMiMnC1t
	 rJ2/u+i5gFxiII8qN9ILU8KW/27T6yZfPPmg2WoSIbWng1ExTdDqAa58d/zrwr28xN
	 etC0Layn9KBKf+pcC6tocevu7IH5URF21OKr2I6lavUOMYkurqdUnt2WwK7WgX1qSa
	 HqlLHgvHGmH8A==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:57:57 +0100
Subject: [PATCH 11/16] ASoC: rt5660: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-11-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=947; i=broonie@kernel.org;
 h=from:subject:message-id; bh=N74st48OY2D0E7V6bc8ANO+5ptrPPDRUx4dMmlqujvY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFoZvJiqcno8UeI4CtAGO52roEYi6qmADHJtF4n
 ULLnvV6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBaAAKCRAk1otyXVSH0PplB/
 4obQxrxUmQqvkaTuKxJWG1CHB69N4rBf3ks3oT2q+RqtNJOlco/vZ8+SKITdozd78HIOn7V8g2Ivg1
 /U0gEhu3h32ZrDmfW1XEFP5Vkf+oYfQV2r5VweAZk7tABx1Tli0wv0SNALtQYSZIANMIbcHHQdqxLI
 1dseY4XqelPGYFbDRi0jQIrTJci7KIXAeuKmkMhOw1bT+8ZrveYrK2SoGvQctb3dMsKzlb/6WlLLM0
 Sso20uvFmbFJArojdUofJ7kA1Cf4chD0eNSZQHRpGTQALhUhrwdt2uk3rAXw4mVyM9A6WGQjBr1Jna
 0HUX81u1l5NyU5wup+FAYU8bXhyr0E
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: XYMNCJDEA5Z356FFTR6GV5IXGMLIRNIJ
X-Message-ID-Hash: XYMNCJDEA5Z356FFTR6GV5IXGMLIRNIJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYMNCJDEA5Z356FFTR6GV5IXGMLIRNIJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5660 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5660.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 341baa29fdb1..96551cda4ad4 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1221,7 +1221,7 @@ static const struct regmap_config rt5660_regmap = {
 	.volatile_reg = rt5660_volatile_register,
 	.readable_reg = rt5660_readable_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt5660_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5660_reg),
 	.ranges = rt5660_ranges,

-- 
2.30.2

