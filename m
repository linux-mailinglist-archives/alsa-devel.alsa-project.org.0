Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA19C745DF6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 15:55:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B5783B;
	Mon,  3 Jul 2023 15:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B5783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688392515;
	bh=u3/uFS/BD6PK7Y2v1f21Dr+CJPu59wRry4Ju0Ge6hAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jz2T0xlXZCewPTJE5Av9SXvvjFGSDlaKJZQbeYDcHXUNWkbxbesfwlt2ysMbDAWuL
	 m0XkGCkMetPBsFdY22UqtnpO6zblJ/w8ksR6p+63Bz6LhmNynxbH6F6mzslskcBbqE
	 X3h7ZstiVTo+HHAtsOc6akfC3Y5Ltkfgy8tW1T1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF976F80272; Mon,  3 Jul 2023 15:54:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45A7FF80104;
	Mon,  3 Jul 2023 15:54:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CBF9F80132; Mon,  3 Jul 2023 15:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABB75F80093
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 15:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABB75F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kcW4mIdd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688392358; x=1719928358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u3/uFS/BD6PK7Y2v1f21Dr+CJPu59wRry4Ju0Ge6hAY=;
  b=kcW4mIddyZ1Gs+J8h2BPPHUaJhbw5JCDXvorqAG1RcR5Omk6RgGppuj2
   6ZyN6S46VpzPBAK5ddNH+7NGKcgs1dJbhxH5UiAWdF0KW2IDN0wdGw7o1
   Lers5wLIJyLzeTcIOoVg09kmnYUNc9QVTbBk25p0HaQ6j7z47AeJYzHEY
   T4LBmIndRIxXtkISHb22NcbFRAGGQv8swrjvekc0zQQbevh7S2MPvllJ1
   +hXzGg3pMT7J0gVsnp903hHuJmeuVeHjSxEfJ62vX57N1/SZdeo2FZUCg
   jH7rSBHQPkvqLkLF3fNUhf4IWFEkS3NXucIkw+lGWoEM6y2Za9QdHXGvz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="361744818"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="361744818"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 06:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="831839501"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="831839501"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2023 06:52:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A114C17C; Mon,  3 Jul 2023 16:52:31 +0300 (EEST)
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
Subject: [PATCH v2 4/4] ASoC: nau8825: Replace copied'n'pasted intlog10()
Date: Mon,  3 Jul 2023 16:52:11 +0300
Message-Id: <20230703135211.87416-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230703135211.87416-1-andriy.shevchenko@linux.intel.com>
References: <20230703135211.87416-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VO3FGY6WDT24C47QZCSVALYPVSBFUC2W
X-Message-ID-Hash: VO3FGY6WDT24C47QZCSVALYPVSBFUC2W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VO3FGY6WDT24C47QZCSVALYPVSBFUC2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As the code even references to dvb_math.c, which is now available
as int_log.c, replace its content by the calling respective API.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Link: https://lore.kernel.org/r/20230619172019.21457-5-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/nau8825.c | 93 ++------------------------------------
 1 file changed, 3 insertions(+), 90 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 9e0e4ddf128e..5cb0de648bd3 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/init.h>
+#include <linux/int_log.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -38,7 +39,6 @@
 #define NAU_FVCO_MIN 90000000
 
 /* cross talk suppression detection */
-#define LOG10_MAGIC 646456993
 #define GAIN_AUGMENT 22500
 #define SIDETONE_BASE 207000
 
@@ -219,42 +219,6 @@ static const struct reg_sequence nau8825_regmap_patch[] = {
 	{ NAU8825_REG_MIC_BIAS, 0x0046 },
 };
 
-
-static const unsigned short logtable[256] = {
-	0x0000, 0x0171, 0x02e0, 0x044e, 0x05ba, 0x0725, 0x088e, 0x09f7,
-	0x0b5d, 0x0cc3, 0x0e27, 0x0f8a, 0x10eb, 0x124b, 0x13aa, 0x1508,
-	0x1664, 0x17bf, 0x1919, 0x1a71, 0x1bc8, 0x1d1e, 0x1e73, 0x1fc6,
-	0x2119, 0x226a, 0x23ba, 0x2508, 0x2656, 0x27a2, 0x28ed, 0x2a37,
-	0x2b80, 0x2cc8, 0x2e0f, 0x2f54, 0x3098, 0x31dc, 0x331e, 0x345f,
-	0x359f, 0x36de, 0x381b, 0x3958, 0x3a94, 0x3bce, 0x3d08, 0x3e41,
-	0x3f78, 0x40af, 0x41e4, 0x4319, 0x444c, 0x457f, 0x46b0, 0x47e1,
-	0x4910, 0x4a3f, 0x4b6c, 0x4c99, 0x4dc5, 0x4eef, 0x5019, 0x5142,
-	0x526a, 0x5391, 0x54b7, 0x55dc, 0x5700, 0x5824, 0x5946, 0x5a68,
-	0x5b89, 0x5ca8, 0x5dc7, 0x5ee5, 0x6003, 0x611f, 0x623a, 0x6355,
-	0x646f, 0x6588, 0x66a0, 0x67b7, 0x68ce, 0x69e4, 0x6af8, 0x6c0c,
-	0x6d20, 0x6e32, 0x6f44, 0x7055, 0x7165, 0x7274, 0x7383, 0x7490,
-	0x759d, 0x76aa, 0x77b5, 0x78c0, 0x79ca, 0x7ad3, 0x7bdb, 0x7ce3,
-	0x7dea, 0x7ef0, 0x7ff6, 0x80fb, 0x81ff, 0x8302, 0x8405, 0x8507,
-	0x8608, 0x8709, 0x8809, 0x8908, 0x8a06, 0x8b04, 0x8c01, 0x8cfe,
-	0x8dfa, 0x8ef5, 0x8fef, 0x90e9, 0x91e2, 0x92db, 0x93d2, 0x94ca,
-	0x95c0, 0x96b6, 0x97ab, 0x98a0, 0x9994, 0x9a87, 0x9b7a, 0x9c6c,
-	0x9d5e, 0x9e4f, 0x9f3f, 0xa02e, 0xa11e, 0xa20c, 0xa2fa, 0xa3e7,
-	0xa4d4, 0xa5c0, 0xa6ab, 0xa796, 0xa881, 0xa96a, 0xaa53, 0xab3c,
-	0xac24, 0xad0c, 0xadf2, 0xaed9, 0xafbe, 0xb0a4, 0xb188, 0xb26c,
-	0xb350, 0xb433, 0xb515, 0xb5f7, 0xb6d9, 0xb7ba, 0xb89a, 0xb97a,
-	0xba59, 0xbb38, 0xbc16, 0xbcf4, 0xbdd1, 0xbead, 0xbf8a, 0xc065,
-	0xc140, 0xc21b, 0xc2f5, 0xc3cf, 0xc4a8, 0xc580, 0xc658, 0xc730,
-	0xc807, 0xc8de, 0xc9b4, 0xca8a, 0xcb5f, 0xcc34, 0xcd08, 0xcddc,
-	0xceaf, 0xcf82, 0xd054, 0xd126, 0xd1f7, 0xd2c8, 0xd399, 0xd469,
-	0xd538, 0xd607, 0xd6d6, 0xd7a4, 0xd872, 0xd93f, 0xda0c, 0xdad9,
-	0xdba5, 0xdc70, 0xdd3b, 0xde06, 0xded0, 0xdf9a, 0xe063, 0xe12c,
-	0xe1f5, 0xe2bd, 0xe385, 0xe44c, 0xe513, 0xe5d9, 0xe69f, 0xe765,
-	0xe82a, 0xe8ef, 0xe9b3, 0xea77, 0xeb3b, 0xebfe, 0xecc1, 0xed83,
-	0xee45, 0xef06, 0xefc8, 0xf088, 0xf149, 0xf209, 0xf2c8, 0xf387,
-	0xf446, 0xf505, 0xf5c3, 0xf680, 0xf73e, 0xf7fb, 0xf8b7, 0xf973,
-	0xfa2f, 0xfaea, 0xfba5, 0xfc60, 0xfd1a, 0xfdd4, 0xfe8e, 0xff47
-};
-
 /**
  * nau8825_sema_acquire - acquire the semaphore of nau88l25
  * @nau8825:  component to register the codec private data with
@@ -368,65 +332,14 @@ static void nau8825_hpvol_ramp(struct nau8825 *nau8825,
 }
 
 /**
- * nau8825_intlog10_dec3 - Computes log10 of a value
- * the result is round off to 3 decimal. This function takes reference to
- * dvb-math. The source code locates as the following.
- * Linux/drivers/media/dvb-core/dvb_math.c
+ * nau8825_intlog10_dec3 - Computes log10 of a value, rounding the result to 3 decimal places.
  * @value:  input for log10
  *
  * return log10(value) * 1000
  */
 static u32 nau8825_intlog10_dec3(u32 value)
 {
-	u32 msb, logentry, significand, interpolation, log10val;
-	u64 log2val;
-
-	/* first detect the msb (count begins at 0) */
-	msb = fls(value) - 1;
-	/**
-	 *      now we use a logtable after the following method:
-	 *
-	 *      log2(2^x * y) * 2^24 = x * 2^24 + log2(y) * 2^24
-	 *      where x = msb and therefore 1 <= y < 2
-	 *      first y is determined by shifting the value left
-	 *      so that msb is bit 31
-	 *              0x00231f56 -> 0x8C7D5800
-	 *      the result is y * 2^31 -> "significand"
-	 *      then the highest 9 bits are used for a table lookup
-	 *      the highest bit is discarded because it's always set
-	 *      the highest nine bits in our example are 100011000
-	 *      so we would use the entry 0x18
-	 */
-	significand = value << (31 - msb);
-	logentry = (significand >> 23) & 0xff;
-	/**
-	 *      last step we do is interpolation because of the
-	 *      limitations of the log table the error is that part of
-	 *      the significand which isn't used for lookup then we
-	 *      compute the ratio between the error and the next table entry
-	 *      and interpolate it between the log table entry used and the
-	 *      next one the biggest error possible is 0x7fffff
-	 *      (in our example it's 0x7D5800)
-	 *      needed value for next table entry is 0x800000
-	 *      so the interpolation is
-	 *      (error / 0x800000) * (logtable_next - logtable_current)
-	 *      in the implementation the division is moved to the end for
-	 *      better accuracy there is also an overflow correction if
-	 *      logtable_next is 256
-	 */
-	interpolation = ((significand & 0x7fffff) *
-		((logtable[(logentry + 1) & 0xff] -
-		logtable[logentry]) & 0xffff)) >> 15;
-
-	log2val = ((msb << 24) + (logtable[logentry] << 8) + interpolation);
-	/**
-	 *      log10(x) = log2(x) * log10(2)
-	 */
-	log10val = (log2val * LOG10_MAGIC) >> 31;
-	/**
-	 *      the result is round off to 3 decimal
-	 */
-	return log10val / ((1 << 24) / 1000);
+	return intlog10(value) / ((1 << 24) / 1000);
 }
 
 /**
-- 
2.40.0.1.gaa8946217a0b

