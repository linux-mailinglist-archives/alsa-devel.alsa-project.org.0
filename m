Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2D472AC02
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:01:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32AAE846;
	Sat, 10 Jun 2023 16:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32AAE846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405667;
	bh=LSuAZN2UmXFoESHPF//ikbcEsQdLM0vjlljLSX2NsLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hmxp854aO/Zzb/D0HfEckAmbnFIZAuJoRDBWNZVnosqXz4HeDPdWmMVBwsAmjLXJ1
	 YpSbJKSuGIm7kxvjVogFwOTBnTUyiUrNeqJBdzR4MB3W2tqXqOTiR5Bbxmq0xk7pSQ
	 23CHAC+KAlQRSIPtr8NW637qsdudf/tfLTfVPbBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ED6FF805C1; Sat, 10 Jun 2023 15:59:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4AA9F8057F;
	Sat, 10 Jun 2023 15:59:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39BB3F80551; Sat, 10 Jun 2023 15:56:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92348F8016C
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92348F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SxC5XgNE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8038D612A4;
	Sat, 10 Jun 2023 13:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298BBC4339B;
	Sat, 10 Jun 2023 13:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405410;
	bh=LSuAZN2UmXFoESHPF//ikbcEsQdLM0vjlljLSX2NsLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SxC5XgNE9LvTLu1oWCXbxmr1bI6BIIBjWzQDzuQIpDud7sA0JBkQ45WLUIB/7y9MN
	 yIIvafiVxOscII3PGQ2/SbQQ8nHpM2AYMpH9Z8Z6UILGqb27NSTBPs1uJStkS/Qmjo
	 JVBh+/el1cRPj2XR2fYGlFPujhCkv1rxDtBZEQdLCwYo99g6SzlnSiujQa5OH0acE8
	 f33yTWM0mFoFmQmwS0huIkvWS0oz7Abgeo05W8lizhCGZVCueLgJFOSbH1GWp2OZfF
	 yEfZjZToNyfuEScwX1WjWtTXK0dzD2DJ2xwp1nPeGXHs6fZCrudsX0gl/i8/xs9S90
	 ZvA01nJoINMHg==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:27 +0100
Subject: [PATCH 07/10] ASoC: cs42l73: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-7-b806c4cbd1d4@kernel.org>
References: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
In-Reply-To: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LSuAZN2UmXFoESHPF//ikbcEsQdLM0vjlljLSX2NsLM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIEMJpaVv8G7s5lqYvfkl+FBTppjBmMPrprJsO+G
 ZosCFX+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBDAAKCRAk1otyXVSH0OQpB/
 4+bPC+T+V9lkBzNK6qKxeaWyVibu6RjN3RUXLCzXSmbe5quZ9Tq6IQ4ZaZ9EOXajveXlK3lpvu5x0f
 278n5jf/cumkg6D11qOg4F+4PpQLNbr1p2Gh1xS5kbjm7BtAhawSGYbZ6+sBLFotbRQ5gCJjZO1eYY
 04lPO4Nspug51bcvnCTbNlpzgRTihTGBt1+T2YIOnbkCVyI4lplQR5AP1Go6lLvpSNYUkCGJKCfbbE
 mx7tEY+GRimMLvLjf6MDCFVVdMyLc9M7YHz/lGIzTObsE5trHgfXXJ7FTPKovElmW4F5Kz4n4Dn2kb
 PJ3vYDXm6McOW4z/+cOJDAKGWMPeUZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: MSJUCGDVZK2ZWJLNVGTTLT6GJ6HGPDWP
X-Message-ID-Hash: MSJUCGDVZK2ZWJLNVGTTLT6GJ6HGPDWP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSJUCGDVZK2ZWJLNVGTTLT6GJ6HGPDWP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs42l73 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l73.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index 0a146319755a..d08ccd4627d9 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -1267,7 +1267,7 @@ static const struct regmap_config cs42l73_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(cs42l73_reg_defaults),
 	.volatile_reg = cs42l73_volatile_register,
 	.readable_reg = cs42l73_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.use_single_read = true,
 	.use_single_write = true,

-- 
2.30.2

