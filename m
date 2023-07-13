Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D77751530
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:24:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B7D283E;
	Thu, 13 Jul 2023 02:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B7D283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207839;
	bh=0SngACP7G86bgdtRUTJfpix055BqdmD2JOX0dxB5Tgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QfZYE7Ay0Wlx/wvHG+w+jnI/vj55Twtb2Xv26XaV5yhJXlnAtOjc9qO+Q3BF6lubG
	 XU32FQ9LJEQQ52gx577JfXA5PEzPcx0jfA5Q7D8sc/vWxLV+liz8uy45Cypiqvyhtm
	 +j87nGrGC4/RkbFye3SCeRl/KyIYdJAkHyaoJfoM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1F52F806CD; Thu, 13 Jul 2023 02:16:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F0D9F806C1;
	Thu, 13 Jul 2023 02:16:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA249F806AA; Thu, 13 Jul 2023 02:15:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E2C6F8068D
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E2C6F8068D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u9NphqT/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3093F618FE;
	Thu, 13 Jul 2023 00:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C132C433C7;
	Thu, 13 Jul 2023 00:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207339;
	bh=0SngACP7G86bgdtRUTJfpix055BqdmD2JOX0dxB5Tgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u9NphqT/c9iJjVtJqvS/wPKX4/ycQu/NOxJNf/pW2uGtGBUPoAV7t30ZwCKq+6Q52
	 uDViy7DG8tPi3VVyIOCmkB/t58WFUlFbeCR2P71bwTdxP7tIVuhAIofM0i34PCJ8PZ
	 OTtMvTyOJVS9a1gIhTGO1a5TtTbZDFEBY1MgpCr2DZDDSIncFketvWv5rfb5jZqhXE
	 TImbnMYmDkVD8L8zIwUG16hjvByvdYPM1S8oJarzSXvmM3mRurpPZG65Y77zYZsE4i
	 BjKWI1lvM+xOnK9ujK0Mp/sBWd5x4hy88a1bML6RhMf0tJHG9uNgoi/6O9iqe/Rsnx
	 rjMJEu1LlBTAA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:43 +0100
Subject: [PATCH 30/48] ASoC: wm8903: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-30-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0SngACP7G86bgdtRUTJfpix055BqdmD2JOX0dxB5Tgc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HDpV3QSYXA7giN1SO29fAxH6D5tXu7MQzzV
 QvGFELEidGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BwwAKCRAk1otyXVSH
 0GH4B/98YCbgiKkNunwijVDO9MlSEFllfzqTf+FSonckqwGOW31THFG1TnO04ZFpw547rRsq9jw
 Uz879o2FX7w0TuBLqSgMRwhOjOdtBuL98RDKV1hdz4Wq1JamdxljXzTHECSTtvuNHtf3ILZVcbs
 zP6g6eu0YSds8g4OWKpryR2yWN5s0C/DC06ZHAkPBZW5rctDR5UXbtXaTyhzI8zUcEk8AeCbHxL
 xvRiekBIn/ymwx7vF1schB1V7aupYSZ2kW41El0TIvFFXkJl78bjwEkYf7NDWKd7YlliLM3F8aD
 BJjnd7hgCLoyjOtQJ0IBzuMpqXkZKWUpCognFvtJ71kakpt9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: T2UCKUDF4ED5QSSJFVD35DLL26UXTRGW
X-Message-ID-Hash: T2UCKUDF4ED5QSSJFVD35DLL26UXTRGW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2UCKUDF4ED5QSSJFVD35DLL26UXTRGW/>
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

Update the wm8903 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8903.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 901b65ef8de5..84ae1102ac88 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1902,7 +1902,7 @@ static const struct regmap_config wm8903_regmap = {
 	.volatile_reg = wm8903_volatile_register,
 	.readable_reg = wm8903_readable_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8903_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8903_reg_defaults),
 };

-- 
2.39.2

