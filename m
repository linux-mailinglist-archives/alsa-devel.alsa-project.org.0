Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E1E72ABFC
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:00:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88A44204;
	Sat, 10 Jun 2023 15:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88A44204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405637;
	bh=Za2cyBMUuA1TAYgnG9w/LwpL7m7UWoUBLi8tRJvPKCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JgtNLjfhxV9inGAlqPEDFdFPEjKbe0pWDlV43xrY6m/E7S3PpE0i/S53u8kRTZT/v
	 hZrfMGzCggtdZIyfU9WauBJSzfXFHnLkMvWODxAmrEONNaH/hOnSEXnQCwi9lOnVCJ
	 iFakr7raTYgJiGSUB+1IRc+csEepVoffIS1V4ITA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65141F80553; Sat, 10 Jun 2023 15:58:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB3A6F80548;
	Sat, 10 Jun 2023 15:58:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 566BDF80494; Sat, 10 Jun 2023 15:56:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A4661F8016C
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4661F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S8inbyXw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4BFA661344;
	Sat, 10 Jun 2023 13:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BEEC4339C;
	Sat, 10 Jun 2023 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405398;
	bh=Za2cyBMUuA1TAYgnG9w/LwpL7m7UWoUBLi8tRJvPKCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S8inbyXwrj+mv3lT4MDIM8AfPL4oly/SmYQOX/N0S2d7sd0mSOsdiCmk3kfAIubsY
	 ZSJzCgzr8GwVzzw26BJE1b295Cx41vEq0Py1bFFjHAVmiYnBN5yot4C//eLI2Ay/dj
	 Eh1c9bLKNfELwlicbbGxzkJ8NquEgaRlUaH7OioDBNKUs3ubmqNy5G8yx40VE+U07+
	 Oyww6j8bCEJ9p7a5k2nDkns5kdP5kV5Y7WY8Rf8dDwQG29dlZjsMyOkB7HSdLwzTv/
	 56ECdqcvWTMtWpOLMZX7CKgD9SZCsYCKn0QmsqVZDhCmaTGPatCjeXOo0MLNED+dup
	 5igynaCZmQNaw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:22 +0100
Subject: [PATCH 02/10] ASoC: cs35l33: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-2-b806c4cbd1d4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=955; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Za2cyBMUuA1TAYgnG9w/LwpL7m7UWoUBLi8tRJvPKCQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIEI338w4n502vW1+kcHSt+CHpXs7cSU3/BMizZX
 ItU9C3+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBCAAKCRAk1otyXVSH0GWXB/
 sFHwgaWr0gscKPJV+LUpVWEZkreiVnu1kY29d5gfpX7e4+vS8dAUUxBxR1U27Tmo5/Uh0Ithjvx7aU
 iYCYHIUAxGBc7lC4Ynd73pWssiL+/NVZ+eYlhV7hEVltlk+sn5qXAs5ti2Cs4qGIHZRH4Baa0Cn+Ua
 JFT16gSAUlriSa1vEPq7gKlQi3i6UpBWy2NzZu7vFW3fLzhALRQas9t1LHDqjf/2n4+e8YWUiOGmNN
 NgDgXuK94CQRttw8iLiLEu+ggVt/ajQPiVN8XTGFEMMCqtdNGa1VXZvzvsxh6swTAehV5YGtO4dt06
 eeyfjNWA0PJCt1hnCGptIPf5LjguEb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: JSVQKOCMIILMPML2L6MWIUAKP4SLE25X
X-Message-ID-Hash: JSVQKOCMIILMPML2L6MWIUAKP4SLE25X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JSVQKOCMIILMPML2L6MWIUAKP4SLE25X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs35l33 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l33.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index 15e79168d256..fde3196bfe1c 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -852,7 +852,7 @@ static const struct regmap_config cs35l33_regmap = {
 	.volatile_reg = cs35l33_volatile_register,
 	.readable_reg = cs35l33_readable_register,
 	.writeable_reg = cs35l33_writeable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2

