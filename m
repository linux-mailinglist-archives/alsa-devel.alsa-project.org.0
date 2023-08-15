Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 251E377CBB2
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 13:29:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 406A81F1;
	Tue, 15 Aug 2023 13:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 406A81F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692098952;
	bh=c0UQwalrepMpq1VW/SpIyUAEXIcvIN5UafwiPH6RW2c=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=clbOkkFDxVKD0HHh0ucPOqCdaPA85n7hKEOjOaVg8evnBXkv10JTAAVvC1WVqTVql
	 EsY6GQoM/CyYLNYnhyWAUGM5SL0uIUNFJtUgwqVKGU0Dm0woRA5oCOwHkhELfivrjg
	 Q2TSqYvWVyU4g9agQPvaU3RjNY7LmM/qCuYwao5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13B75F80027; Tue, 15 Aug 2023 13:28:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9502FF8016A;
	Tue, 15 Aug 2023 13:28:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7DDBF8016D; Tue, 15 Aug 2023 13:27:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD4A7F80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 13:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD4A7F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M0rloIC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692098869; x=1723634869;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c0UQwalrepMpq1VW/SpIyUAEXIcvIN5UafwiPH6RW2c=;
  b=M0rloIC2yvsyZJ1xCUrOxI46eCpJ08Lvj/Ee4f7kcYDmLVezbMHROk8F
   pkK0wyIL4GmgqK/mFqYI9kY4OPBjzQCzl/25nqBbBGArp7RdJTutHVjNg
   NZ8GkE6G0j7HvzxKSVtK/GKpMT51QK7T/NFujG9eMUK7pG+eB1N6P4Nuf
   sdR1qY1vx/ElNTKi4DJGX7tNXKR4OqCs/6u/bA1HMHgmZZZ93qDdqJBeB
   b7MbITDV72jpYN9vMsWk4m46mLlVDkf5+iPym4EdA/p2a70cfnWo8lDdq
   DspIvl0YBeVOYhJZ8mZwHTHGJSqeoI0qiWN4LNo3dQ3eNgKZcK5ElMPeo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="351844541"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="351844541"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 04:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="980338041"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="980338041"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 15 Aug 2023 04:27:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3C520350; Tue, 15 Aug 2023 14:35:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org
Subject: [PATCH v1 1/1] minmax: Deduplicate __unconst_integer_typeof()
Date: Tue, 15 Aug 2023 14:35:34 +0300
Message-Id: <20230815113534.10592-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M3PW4Q54MYU4E5FPIIPJXOIK55RN7JPH
X-Message-ID-Hash: M3PW4Q54MYU4E5FPIIPJXOIK55RN7JPH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3PW4Q54MYU4E5FPIIPJXOIK55RN7JPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It appears that compiler_types.h already have an implementation
of the __unconst_integer_typeof() called __unqual_scalar_typeof().
Use it instead of the copy.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

As the initial code is in Linux Next via ASoC tree, it's assumed
to go via that tree as well.

 include/linux/minmax.h | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 83aebc244cba..69bbe987fa87 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_MINMAX_H
 #define _LINUX_MINMAX_H
 
+#include <linux/compiler_types.h>
 #include <linux/const.h>
 #include <linux/types.h>
 
@@ -134,27 +135,6 @@
  */
 #define max_t(type, x, y)	__careful_cmp((type)(x), (type)(y), >)
 
-/*
- * Remove a const qualifier from integer types
- * _Generic(foo, type-name: association, ..., default: association) performs a
- * comparison against the foo type (not the qualified type).
- * Do not use the const keyword in the type-name as it will not match the
- * unqualified type of foo.
- */
-#define __unconst_integer_type_cases(type)	\
-	unsigned type:  (unsigned type)0,	\
-	signed type:    (signed type)0
-
-#define __unconst_integer_typeof(x) typeof(			\
-	_Generic((x),						\
-		char: (char)0,					\
-		__unconst_integer_type_cases(char),		\
-		__unconst_integer_type_cases(short),		\
-		__unconst_integer_type_cases(int),		\
-		__unconst_integer_type_cases(long),		\
-		__unconst_integer_type_cases(long long),	\
-		default: (x)))
-
 /*
  * Do not check the array parameter using __must_be_array().
  * In the following legit use-case where the "array" passed is a simple pointer,
@@ -169,13 +149,13 @@
  * 'int *buff' and 'int buff[N]' types.
  *
  * The array can be an array of const items.
- * typeof() keeps the const qualifier. Use __unconst_integer_typeof() in order
+ * typeof() keeps the const qualifier. Use __unqual_scalar_typeof() in order
  * to discard the const qualifier for the __element variable.
  */
 #define __minmax_array(op, array, len) ({				\
 	typeof(&(array)[0]) __array = (array);				\
 	typeof(len) __len = (len);					\
-	__unconst_integer_typeof(__array[0]) __element = __array[--__len]; \
+	__unqual_scalar_typeof(__array[0]) __element = __array[--__len];\
 	while (__len--)							\
 		__element = op(__element, __array[__len]);		\
 	__element; })
-- 
2.40.0.1.gaa8946217a0b

