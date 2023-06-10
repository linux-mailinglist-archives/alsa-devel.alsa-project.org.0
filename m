Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B13B072AC11
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3EEE843;
	Sat, 10 Jun 2023 16:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3EEE843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405867;
	bh=/46iLTdkoaLNzLmFd+hJGrua05+YTBwwzT2tol9bnZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZXG1wZvWMQLKA79V2PgFmB0UfxpeZiVP8eAIYdtuJPuhPPvZNIxBvC4SSv7Q0hl3L
	 ADy6eReIobRP+5BYkxOsQf91DZxUbo7rFr/dThXJK13bf5ljEjr9/NLczET8nOJ96b
	 GEujW9Ayz/CVA0/PwzN2XSUJ0SVUqkZwK7CXNVik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32287F8067B; Sat, 10 Jun 2023 15:59:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EEAEF805F6;
	Sat, 10 Jun 2023 15:59:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56854F804DA; Sat, 10 Jun 2023 15:58:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C72CEF8016C
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C72CEF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CsWljFJQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 86AD861772;
	Sat, 10 Jun 2023 13:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1724EC4339B;
	Sat, 10 Jun 2023 13:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405494;
	bh=/46iLTdkoaLNzLmFd+hJGrua05+YTBwwzT2tol9bnZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CsWljFJQrMJjQIZlGLdLKQWQK61wBepu7zIZPGknS9JgEeT387cGeFRKJkXPfl7Eo
	 tfcp9Y4UyNlcKvOdna+sNbcjRBjMrQSzMBXHLpyuNtqy/Nb3qZf7lH84A1qAm7JrAU
	 HwsvtjW/w20sGOn9JnBDauPEIyyC/mT3gJ2levrjovEY1RaQdO4K6walm38P5I5MoA
	 KWmPuUZPWAUBdRLPIgd8hjBK/LcCZrUGtOmKHV38eUSepb/Np0FviVnfOIpTvqTi20
	 GbaaePYtCGmzSIyabDpqjvYHkdTIahs3W7mXBYRCnPpkTCMAPmuYWrtV8hPecWhs4D
	 M6l0vE5DiPrag==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:57:52 +0100
Subject: [PATCH 06/16] ASoC: rt5616: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-6-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/46iLTdkoaLNzLmFd+hJGrua05+YTBwwzT2tol9bnZ0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFkT/zaaDIOzbSgN1hi89Bhb9imYcpPiGWb4Cbl
 nhfUsr+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBZAAKCRAk1otyXVSH0KHmB/
 4784/34CXUh3VBqXf9cVrIeFYrxyQMC7FbDsviX/eSz1NX/W66VMRAH0cJEoL+lTkZf8AISqZ59LX3
 SByw0yVkzcdUnXQ+8kmWstnIYSdNCbhNfVPGYs5FbsLRFbgOUm0Z1UJ8muNjsxYO+/FcvWTpkdxXZc
 7qcgEq7bdjihCv3JdLucito4iUzMGB+oswAzn/stIHJ7VxPi9pczRzfLcm2G22jDR0qZLcCHojbHV2
 GXtOIwWm2a0RMq/+xeZNDdL27zgdrFAwlaJRXxgoA2hSz5+CjV/GaiThuqSWKQSeKBIxsYzijHfAQs
 lTlJ+JhnNwiF0pRcDZGhaUSZiif3kn
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: REBOTU7XCAZRROFDAYEGZSTQXGQ77AHJ
X-Message-ID-Hash: REBOTU7XCAZRROFDAYEGZSTQXGQ77AHJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/REBOTU7XCAZRROFDAYEGZSTQXGQ77AHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5616 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5616.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index 948abde10463..6009a401620c 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1315,7 +1315,7 @@ static const struct regmap_config rt5616_regmap = {
 					       RT5616_PR_SPACING),
 	.volatile_reg = rt5616_volatile_register,
 	.readable_reg = rt5616_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt5616_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5616_reg),
 	.ranges = rt5616_ranges,

-- 
2.30.2

