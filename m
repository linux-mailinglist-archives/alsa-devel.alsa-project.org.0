Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E0E72AC0F
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA8EC851;
	Sat, 10 Jun 2023 16:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA8EC851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405820;
	bh=+MO5O4knUjJK9/0Uysip7jm3z4PcwegjaKQlxmbd4QA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mZzhLvxtx3/ARsaAXpMIZDWC0OH3hFU9ec/zFiir6fuSuw5b9Kw0wRscRdoSfivHv
	 mYNR1orG6P2pqEKmybDRn5kDeMW0TtUOAaTqAv4/7p/mbnZnjBuD1rPN7JLQMjZfvz
	 s0H9sdLQPaVp1NlGshEkWAKXlKKz3ltWuaCbbKuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CFFEF80622; Sat, 10 Jun 2023 15:59:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A79E0F8060C;
	Sat, 10 Jun 2023 15:59:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D107F80494; Sat, 10 Jun 2023 15:58:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B604F80199
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B604F80199
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cO+HE/ne
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A2A961781;
	Sat, 10 Jun 2023 13:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA66C4339B;
	Sat, 10 Jun 2023 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405496;
	bh=+MO5O4knUjJK9/0Uysip7jm3z4PcwegjaKQlxmbd4QA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cO+HE/neApjVD1T1f1d9DqE118aBJ/3lQ4XDZYaFE8hBnWIMKgiMA3sE3EwwTChbL
	 qXaY/XvTCNm9m8xFA/7L3tHdiHyFkAL7XJVcNpO7Ttax/ooigz/JhDrfFHJ7DE7Vah
	 8ThRyhaFBDRdQCPcK7pZKvC8HujWD5YfHUIHmvh0AFDKNH2t7ssfm90CeUtA7i+b3s
	 A/cCzaaIc6G+Uv+sx5IAgBh5tsJmSMMB7AC3QzZ7mJZWKoTRlCgIitbEvY0uzBVrAg
	 jn1XOG28T3ZmiuYlDY5A7tTz7A89FJ3kFl3ClgK7dvWr597IaIrjdC+I3QNVfDX8u0
	 ZeogtMsfXO9ZA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:57:54 +0100
Subject: [PATCH 08/16] ASoC: rt5640: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-8-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=947; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+MO5O4knUjJK9/0Uysip7jm3z4PcwegjaKQlxmbd4QA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFlMTx32oAdBwyEx3zw9ngF9V3Agy/Dh+jlr4YV
 YuLztVaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBZQAKCRAk1otyXVSH0GohB/
 9SWiHTSthhlPd4BrrNb9oUYTXrWFh8juAwGyUhyoegcN94XMo3mMjn4EAhSrj7lCorTUeNiAAkjJYq
 ZF2nnRTNqm7eFxoPyVge88erpb2Kwz453KZtZorYJGwem+H50DYjhwwuRNn1dJGEeHubsJ3fTipD3n
 UWIe3UYKTzMaG13hYz5ReBNSu1EDJgddTaLN2w33XknMzz58s3I25RNNVzSOpL6WUBE+FnymHDtPJy
 TkLMSITmW7H2mQTJrtIdmJ19Q/Bcw79RWpWvMLPKXefkT4V1bIjBYvenB63tXb2euR0JOYgMQnxeIO
 5mD+gOQpgTAQrF0pL1SmY+EkaSlcBZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: X3QYXDVPQJCU7F3V4XZDGCP63KDM5325
X-Message-ID-Hash: X3QYXDVPQJCU7F3V4XZDGCP63KDM5325
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X3QYXDVPQJCU7F3V4XZDGCP63KDM5325/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5640 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 139257055507..ce4eace5b007 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2949,7 +2949,7 @@ static const struct regmap_config rt5640_regmap = {
 	.volatile_reg = rt5640_volatile_register,
 	.readable_reg = rt5640_readable_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt5640_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5640_reg),
 	.ranges = rt5640_ranges,

-- 
2.30.2

