Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0977372AC14
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2800820C;
	Sat, 10 Jun 2023 16:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2800820C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405922;
	bh=C7jIfvgcvrDx5UoNN24pZLUrFgvmK+efg22MQSL43fg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HTJgCkZiR0appYdx9tA9G2wqIK43m0JzlokQRXwPXfY3xWKLk5SlZzTDspftkncmy
	 IxwRXJ8bhWmhhG908JbjI3exPK/75v8au6lXL+DWML4Q6yyO3el+5bgAS2vBTzqbC9
	 nghCpe4Jp+mwaXkGDFhHhw9ZMaTxX8zmMyqVVXTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DBDAF806A2; Sat, 10 Jun 2023 15:59:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 447A4F80638;
	Sat, 10 Jun 2023 15:59:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66F0EF8016C; Sat, 10 Jun 2023 15:58:33 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D12CEF80254
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D12CEF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tFevUma3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9096D61780;
	Sat, 10 Jun 2023 13:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF67C433A1;
	Sat, 10 Jun 2023 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405506;
	bh=C7jIfvgcvrDx5UoNN24pZLUrFgvmK+efg22MQSL43fg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tFevUma3j5avmm1txQ+1p2+N6IpRNispMkl4nLzUQn/5PcEDpLUSPL9409EsadL/+
	 EACXt3qokUx50xIuzqAsXx/6+els9yVtnCen76AqmqCnIkya4Pg+jTMQO/YEvrV5wn
	 3xYmGLD1hvCeC+LHbSuLga5d7TyE3LIrOS7puqxeWYufW0I1+TluSDz3NfAb0Xq1kU
	 fjQwYXZ7HJdPT7eIW/5N0sB8+208bfGXhXBBu+RFuJSW/6buYAgKM0/EjLj/5jdCgH
	 ZAO3uSo892tbkBt+1jxUs+/jU68CP3fCXki6llW/jsONaCVDSlchKyUMggAzu9NXHS
	 7j9nULO8y64kA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:58:01 +0100
Subject: [PATCH 15/16] ASoC: rt5670: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-maple-v1-15-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=broonie@kernel.org;
 h=from:subject:message-id; bh=C7jIfvgcvrDx5UoNN24pZLUrFgvmK+efg22MQSL43fg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFrT9kkaCpji0MOnyV+J4p2aGN6vLkVaIchsFCo
 zzUfgYSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBawAKCRAk1otyXVSH0LJ6B/
 4qO+HwWz3lQt5KoXOfZHnPsJX+X4yp/IcOBZFs3q2jWXNdYCD4RbLt/S2+3z9XtALOuFQvjZNlevFj
 cNR7ESCpO8CV8UQgzyqa3qIFy7M3FY4MAI0XtCbO9n0EjNZ25tc1BYjhG4OuvY+h4zgw1ZRuYw5WKn
 n2oBWJwtWUYUUr3uVcvGbQnBP//vPjzdQNJRo7lg/AcOhwBVrr2JCrVRUrJrXTMOOWCG5PIrKrJ2az
 HiERQzN7vbc8XRrVgWnYMhq22Byih165Nb4saFo4juykYpyOjQx+rHBt4KVeAbtkAH9YL4cNpWsbAW
 WU/o+B2wgQHSsFUN7XGsgouKNdTAdp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: LSKISYPAUQOQMUR6EDWSGH5QR2PTSYWV
X-Message-ID-Hash: LSKISYPAUQOQMUR6EDWSGH5QR2PTSYWV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSKISYPAUQOQMUR6EDWSGH5QR2PTSYWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5670 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5670.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index a230f441559a..ae0cfc857c57 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -2863,7 +2863,7 @@ static const struct regmap_config rt5670_regmap = {
 					       RT5670_PR_SPACING),
 	.volatile_reg = rt5670_volatile_register,
 	.readable_reg = rt5670_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = rt5670_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5670_reg),
 	.ranges = rt5670_ranges,

-- 
2.30.2

