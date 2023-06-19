Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C69DE735CFD
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 19:22:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EADD3850;
	Mon, 19 Jun 2023 19:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EADD3850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687195342;
	bh=bEqeDD3qlJ8khKucahwjiIUNYJkrQelnvBDmHsOyzeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XWCrHqmpehz/eaiF+se3jL8mmra3VU9MYc0zRgNEyaHVfF/XhewkE3y4256YY76J7
	 IF2JCRkrosPgvdom7eOS2twHAe8ol1LrmisJaimw3pWYCifpl9IQaWGpIGAAvEdVGs
	 iJKj3yTEsY+ljjySHQh4KPlq0nP3rf9aFsK6DTj4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86A55F80558; Mon, 19 Jun 2023 19:20:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E1CF80552;
	Mon, 19 Jun 2023 19:20:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57461F80529; Mon, 19 Jun 2023 19:20:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A921F80301
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 19:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A921F80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Zs8HS7Ey
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687195227; x=1718731227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bEqeDD3qlJ8khKucahwjiIUNYJkrQelnvBDmHsOyzeg=;
  b=Zs8HS7Ey2T9l7FhzEdcju0u+QeNHT4FR0qXzFfy36n+kDBVmiDigRX62
   dOVjkOo5GoSwFRYqBwJ9JZEHA2A/u2q0unDrOYYJwh6FLD4Kl0a11QJN5
   W+6+usptL1CPIwgAuhyrl/hqIQ67L8Gz4oyLpabbG6uOUW1LHnfCvKtZI
   EKNtmXWtUBGufGhXPAh7xbPJqTEO2joSgtFqQ5Qjn3ODR3ESgrRw1DXd2
   Plyd1Wm/f/nXDhRdgF5CYJIiyL3Jay+CwUUrkeH6wmYiDpRDbE7nmOKwv
   OYx5hYz9Tjo5n5JA/f4qunBiy7NfJqfjOhgiiA4jhAROWF+4iypAcNbzU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="363105854"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400";
   d="scan'208";a="363105854"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 10:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="960482501"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400";
   d="scan'208";a="960482501"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jun 2023 10:20:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A68BE40F; Mon, 19 Jun 2023 20:20:23 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	David Lin <CTLIN0@nuvoton.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Antti Palosaari <crope@iki.fi>,
	Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Matthias Schwarzott <zzam@gentoo.org>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 2/4] lib/math/int_log: Use ARRAY_SIZE(logtable) where makes
 sense
Date: Mon, 19 Jun 2023 20:20:17 +0300
Message-Id: <20230619172019.21457-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230619172019.21457-1-andriy.shevchenko@linux.intel.com>
References: <20230619172019.21457-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BFAHBEKK55HW7YXEUOMGZ7H766BOSWCT
X-Message-ID-Hash: BFAHBEKK55HW7YXEUOMGZ7H766BOSWCT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFAHBEKK55HW7YXEUOMGZ7H766BOSWCT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use ARRAY_SIZE(logtable) where makes sense.

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

