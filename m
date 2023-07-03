Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26674745DF7
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 15:55:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AD75950;
	Mon,  3 Jul 2023 15:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AD75950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688392518;
	bh=yiDh5WIcW2KT2120kFMdLbZdsriKf6EVEQj+JVu7p4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RHgWnTSwhCwHPRC2qOM954ylKykGdyPvGeM3bcSMRiQK3o97j8UAJUT7y+d+Zewh+
	 EXiBjO8GRixltbiuEAgn6Ghp7KCO7N9JKZlyflD4CPoVRQKQub3tTNfxB0cpPtqLPk
	 pOVSegVWyLujSuQmcS0c8E8JH6+y0D/Ls4xMCeQk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ACB9F80568; Mon,  3 Jul 2023 15:54:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C3D5F80551;
	Mon,  3 Jul 2023 15:54:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68918F80100; Mon,  3 Jul 2023 15:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2930F80125
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 15:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2930F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nMMY/33n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688392357; x=1719928357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yiDh5WIcW2KT2120kFMdLbZdsriKf6EVEQj+JVu7p4Q=;
  b=nMMY/33nYehmA3cfveYUp9G5CYRBi2WlqxBVNUnpXEQcYhc8NkABlXEl
   ja20GuZ9R88goipz/yAXHjG9rG8z7NqS5/WbOlvgYW6cYVqj6PpBvGB93
   p5qsjlFuWTHZTXpHAWSWBTMhjUS/2m83ia0bxIYm3K4jbCUfk8lX5qvnV
   BY7sYSzRUN8c2jenbjvG/ScZVeutSDRE0Gk0k5h94bSyqY7moT2v8nVon
   72XtZ+A8ihzjmGqjkTwMqKRvnGPmXeISVO8q1aijyQx/GZAZKrn+bT2MD
   LuHQ94lGZQI4bsTl/dAhtzqfwPnUK4Z/C5O/YfCbX0Q9yGbikcmYAFqDY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="347673031"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="347673031"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 06:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="863093278"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="863093278"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2023 06:52:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E5C3C177; Mon,  3 Jul 2023 16:52:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	David Lin <CTLIN0@nuvoton.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Antti Palosaari <crope@iki.fi>,
	Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Matthias Schwarzott <zzam@gentoo.org>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 2/4] lib/math/int_log: Use ARRAY_SIZE(logtable) where makes
 sense
Date: Mon,  3 Jul 2023 16:52:09 +0300
Message-Id: <20230703135211.87416-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230703135211.87416-1-andriy.shevchenko@linux.intel.com>
References: <20230703135211.87416-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5H64MMTNWSDB2VN7XHYYXKOTP4UR4EBV
X-Message-ID-Hash: 5H64MMTNWSDB2VN7XHYYXKOTP4UR4EBV
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5H64MMTNWSDB2VN7XHYYXKOTP4UR4EBV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use ARRAY_SIZE(logtable) where makes sense.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Link: https://lore.kernel.org/r/20230619172019.21457-3-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 lib/math/int_log.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/math/int_log.c b/lib/math/int_log.c
index 322df25a22d6..ea98fc0b3fe2 100644
--- a/lib/math/int_log.c
+++ b/lib/math/int_log.c
@@ -91,7 +91,7 @@ unsigned int intlog2(u32 value)
 	 *	so we would use the entry 0x18
 	 */
 	significand = value << (31 - msb);
-	logentry = (significand >> 23) & 0xff;
+	logentry = (significand >> 23) % ARRAY_SIZE(logtable);
 
 	/**
 	 *	last step we do is interpolation because of the
@@ -109,7 +109,7 @@ unsigned int intlog2(u32 value)
 	 *	logtable_next is 256
 	 */
 	interpolation = ((significand & 0x7fffff) *
-			((logtable[(logentry + 1) & 0xff] -
+			((logtable[(logentry + 1) % ARRAY_SIZE(logtable)] -
 			  logtable[logentry]) & 0xffff)) >> 15;
 
 	/* now we return the result */
-- 
2.40.0.1.gaa8946217a0b

