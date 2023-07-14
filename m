Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BBA754EB7
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 15:00:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 287C8E11;
	Sun, 16 Jul 2023 14:59:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 287C8E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689512401;
	bh=jNcBCjfgpKFqqYeQOT7ZSvB8g0ejk/brWSi//NaBOYY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YupGGDNfXjbEluwAVLcM+mVQ+LaZIQu8zBRplokRhPMMsT0cnunEyJoNkBD9PRAHT
	 HCiyZX7GltgdrOm8SL/gZdKhhdAYMD2ny++vRcHRaoVFCUsiT1AD8mvvkxJepkowIK
	 +7syR10Cd2+noSofz+0WGKv5A1ATgx1XL7g9o0ts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60A77F805AD; Sun, 16 Jul 2023 14:57:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F369EF805AB;
	Sun, 16 Jul 2023 14:57:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62D50F80249; Fri, 14 Jul 2023 12:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40908F800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 12:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40908F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hQ41dI2n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689330662; x=1720866662;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jNcBCjfgpKFqqYeQOT7ZSvB8g0ejk/brWSi//NaBOYY=;
  b=hQ41dI2nB6cyFzPpAJdlu++O+fIkwzzVXPiwxCCzh1GDz3Ua7bLpfE/+
   502f+GEmNG0RzOOm3P/wdAo7aWSBW4pMvT5HiK/mXvXDu3Zp03FHdwB1A
   3j/91VIoEwaR7yVh+dkFNkz7tyRN3sIahsfZekBtHUQrxJu7BAmVM+upM
   L6IxJHVPHF4gyJNH/EPovXVPZUYUJlZy3PeV1RTaXXSwakKRBNucya5B+
   kViyrR1Z1QDwoTyebsUTPvMc+TvM2sqoBMs5EBo9fRZgeDIViKIjPfhe7
   mJnaiL46IGw7g/yZ7IasVN/4TDZjUB0StRmrR1vmxnTF4CkSWzeo5RlHl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429206317"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="429206317"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 03:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="751992057"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="751992057"
Received: from silpixa00400294.ir.intel.com ([10.237.222.100])
  by orsmga008.jf.intel.com with ESMTP; 14 Jul 2023 03:30:37 -0700
From: Wojciech Ziemba <wojciech.ziemba@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	qat-linux@intel.com,
	Wojciech Ziemba <wojciech.ziemba@intel.com>
Subject: [PATCH] lib: Introduce KUnit tests for minmax
Date: Fri, 14 Jul 2023 11:23:53 +0100
Message-Id: <20230714102353.27814-1-wojciech.ziemba@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Organization: Intel Research and Development Ireland Ltd - Co. Reg. #308263 -
 Collinstown Industrial Park, Leixlip, County Kildare - Ireland
Content-Transfer-Encoding: 8bit
X-MailFrom: wojciech.ziemba@intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JUQYGIDF6GFXAAGTAJL3AULO7PZQEX6X
X-Message-ID-Hash: JUQYGIDF6GFXAAGTAJL3AULO7PZQEX6X
X-Mailman-Approved-At: Sun, 16 Jul 2023 12:57:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUQYGIDF6GFXAAGTAJL3AULO7PZQEX6X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds KUnit coverage for minmax_array() macros from
<linux/minmax.h>. It assures that these macros compile correctly
and work as expected when different types are used. The test cases
exercise types: s8, u8, s16, u16, s32, u32, s64, u64 with arrays
of random numbers.

Signed-off-by: Wojciech Ziemba <wojciech.ziemba@intel.com>
---
 lib/Kconfig.debug  |  12 +++++
 lib/Makefile       |   1 +
 lib/minmax_kunit.c | 132 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 lib/minmax_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index fbc89baf7de6..e845876482fb 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2777,6 +2777,18 @@ config SIPHASH_KUNIT_TEST
 	  This is intended to help people writing architecture-specific
 	  optimized versions.  If unsure, say N.
 
+config MINMAX_KUNIT_TEST
+	tristate "KUnit test for minmax" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Builds KUnit tests module for minmax.
+
+	  For more information on KUnit and unit tests in general please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 config TEST_UDELAY
 	tristate "udelay test driver"
 	help
diff --git a/lib/Makefile b/lib/Makefile
index 42d307ade225..950a3f388e6f 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -396,6 +396,7 @@ obj-$(CONFIG_FORTIFY_KUNIT_TEST) += fortify_kunit.o
 obj-$(CONFIG_STRCAT_KUNIT_TEST) += strcat_kunit.o
 obj-$(CONFIG_STRSCPY_KUNIT_TEST) += strscpy_kunit.o
 obj-$(CONFIG_SIPHASH_KUNIT_TEST) += siphash_kunit.o
+obj-$(CONFIG_MINMAX_KUNIT_TEST) += minmax_kunit.o
 
 obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
 
diff --git a/lib/minmax_kunit.c b/lib/minmax_kunit.c
new file mode 100644
index 000000000000..00ec175156d6
--- /dev/null
+++ b/lib/minmax_kunit.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Intel Corporation
+ *
+ * KUnit test cases for minmax.
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <kunit/test.h>
+
+#include <linux/kernel.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#define MINMAX_ARR_TEST(type, op, expected)				\
+	static const type expected_##op##_##type = expected;		\
+static void op##_array_##type##_test(struct kunit *test)		\
+{									\
+	type value = op##_array(test_vector_##type,			\
+				  ARRAY_SIZE(test_vector_##type));	\
+	KUNIT_EXPECT_EQ(test, value, expected_##op##_##type);		\
+}
+
+/* type 's8' */
+static const s8 test_vector_s8[] = {
+	1, 85, -112, -61, 6, 0, 117, -55, 68, -55, 23, 1, -100, 55, -118
+};
+
+MINMAX_ARR_TEST(s8, min, -118)
+MINMAX_ARR_TEST(s8, max, 117)
+
+/* type 'u8' */
+static const u8 test_vector_u8[] = {
+	209, 145, 131, 180, 88, 97, 240, 170, 148, 158, 35, 226, 14, 244, 2
+};
+
+MINMAX_ARR_TEST(u8, min, 2)
+MINMAX_ARR_TEST(u8, max, 244)
+
+/* type 's16' */
+static const s16 test_vector_s16[] = {
+	2641, 30296, -15090, 11371, 13995, 28244, 27482, -7239, -9036, -3147,
+	22065, 2097, -26854, -8633, 13366
+};
+
+MINMAX_ARR_TEST(s16, min, -26854)
+MINMAX_ARR_TEST(s16, max, 30296)
+
+/* type 'u16' */
+static const u16 test_vector_u16[] = {
+	50102, 58387, 42350, 33531, 32109, 65525, 25985, 31889, 14772, 7296,
+	48242, 53340, 33594, 19856, 45544
+};
+
+MINMAX_ARR_TEST(u16, min, 7296)
+MINMAX_ARR_TEST(u16, max, 65525)
+
+/* type 's32' */
+static const s32 test_vector_s32[] = {
+	979885732L, 885950778L, -1450966230L, -1624192399L, -1753023734L,
+	530868381L, 656215973L, 630677997L, 391000329L, 1253640357L,
+	438040531L, -993355872L, 585127620L, -1068766240L, 147051568L
+};
+
+MINMAX_ARR_TEST(s32, min, -1753023734L)
+MINMAX_ARR_TEST(s32, max, 1253640357L)
+
+/* type 'u32' */
+static const u32 test_vector_u32[] = {
+	2161504111UL, 1183092838UL, 1728689175UL, 2309150449UL, 3735269177UL,
+	1550306875UL, 2147576091UL, 4187089172UL, 545942284UL, 1969608375UL,
+	2624877400UL, 3029665375UL, 1293120185UL, 3801307680UL, 1161238802UL
+};
+
+MINMAX_ARR_TEST(u32, min, 545942284UL)
+MINMAX_ARR_TEST(u32, max, 4187089172UL)
+
+/* type 's64' */
+static const s64 test_vector_s64[] = {
+	-8438490804591620000LL, 8025377321703520000LL, 3208690154945970000LL,
+	-2321767394263770000LL, -1278489889635390000LL, 2190470827346570000LL,
+	-2022822382784580000LL, 6599789147713410000LL, 3949996236706410000LL,
+	-8261935734503760000LL, 661645293834217000LL, 8346383784731440000LL,
+	-3443819189603500000LL, 7985744187902840000LL, 5083298007916820000LL
+};
+
+MINMAX_ARR_TEST(s64, min, -8438490804591620000LL)
+MINMAX_ARR_TEST(s64, max, 8346383784731440000LL)
+
+/* type 'u64' */
+static const u64 test_vector_u64[] = {
+	8249683091780880000ULL, 13192984997103100000ULL, 17673970905507700000ULL,
+	11101419446779000000ULL, 7059417167478820000ULL, 17488355550255500000ULL,
+	1592214570100350000ULL, 4324504718429290000ULL, 9233486922226120000ULL,
+	17205873265072200000ULL, 15951973546886800000ULL, 8694358874973410000ULL,
+	11857168979503600000ULL, 15015693759541800000ULL, 4758196429468010000ULL
+};
+
+MINMAX_ARR_TEST(u64, min, 1592214570100350000ULL)
+MINMAX_ARR_TEST(u64, max, 17673970905507700000ULL)
+#undef MINMAX_ARR_TEST
+
+static struct kunit_case minmax_array_test_cases[] = {
+	KUNIT_CASE(min_array_s8_test),
+	KUNIT_CASE(max_array_s8_test),
+	KUNIT_CASE(min_array_u8_test),
+	KUNIT_CASE(max_array_u8_test),
+	KUNIT_CASE(min_array_s16_test),
+	KUNIT_CASE(max_array_s16_test),
+	KUNIT_CASE(min_array_u16_test),
+	KUNIT_CASE(max_array_u16_test),
+	KUNIT_CASE(min_array_s32_test),
+	KUNIT_CASE(max_array_s32_test),
+	KUNIT_CASE(min_array_u32_test),
+	KUNIT_CASE(max_array_u32_test),
+	KUNIT_CASE(min_array_s64_test),
+	KUNIT_CASE(max_array_s64_test),
+	KUNIT_CASE(min_array_u64_test),
+	KUNIT_CASE(max_array_u64_test),
+	{}
+};
+
+static struct kunit_suite minmax_test_suite = {
+	.name = "minmax_array",
+	.test_cases = minmax_array_test_cases,
+};
+kunit_test_suite(minmax_test_suite);
+
+MODULE_AUTHOR("Intel");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit test module for minmax");
-- 
2.38.1

