Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2EF7A8894
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 17:39:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E681D1F6;
	Wed, 20 Sep 2023 17:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E681D1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695224394;
	bh=4gyXCBnrlqcGMYoIWPbjV5wf9sCClHXyno5V82uj9AQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=crLqZOHN2+c7qNYnKNY0OtxECth+cAdvVcS387UDv5yfcGyIKIhRII8acdrJ8oODw
	 /sluwCnyLKi2+4w9zDgkLHD1Ep5d8SknpWTteJtbhb+z0VKio/EjXSu2i/oFEPWH4d
	 iKEvu06To0Y1Q8/iDctoUc4gtzawWb9qFA9sI3bo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C7ACF80552; Wed, 20 Sep 2023 17:38:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDD09F801F5;
	Wed, 20 Sep 2023 17:38:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C401F8047D; Wed, 20 Sep 2023 17:38:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C6E6F800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 17:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C6E6F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bApCH1ld
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695224316; x=1726760316;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4gyXCBnrlqcGMYoIWPbjV5wf9sCClHXyno5V82uj9AQ=;
  b=bApCH1ldGjnv0CD49zwrIZ+pr7F44xTIpwj/p4b5IGnb30nBl1xBXxEi
   4fDzpMK+6Do9d8AKTdndBLvYLsSkJHPoSLrp+FXPhj8aVvf09eHvQMSSm
   BVxQEz4KHMpDcSDDkGJ0VUI3+/5ySKdkm4PjZnDKw972wLYFu0gENxi5M
   q5VLgBhS9NKVazdYDb/C2DaR8gQ2FaA7oniSOtY0r47npe6gRfVcTBnSD
   f1BZYN3hUBkp3fxooZaPUmqgh5/2JuODJ9SvCV9oPyuQyCbdtGCgZnbrW
   ypNtEpClKFzZrHSDLJ9b1Mf/dWZ23Ge3vggxk5Aw73HfPI6MF9QH6QF2O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370569829"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200";
   d="scan'208";a="370569829"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 08:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077485504"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200";
   d="scan'208";a="1077485504"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 08:38:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id ABFA671B; Wed, 20 Sep 2023 18:38:22 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	tiwai@suse.com,
	llvm@lists.linux.dev,
	alsa-devel@alsa-project.org,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v1 1/1] device property: Replace custom implementation of
 COUNT_ARGS()
Date: Wed, 20 Sep 2023 18:38:19 +0300
Message-Id: <20230920153819.2069869-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6OSPQFPDYDJI3JTUYQ6DEVNMF4I7ZMXL
X-Message-ID-Hash: 6OSPQFPDYDJI3JTUYQ6DEVNMF4I7ZMXL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OSPQFPDYDJI3JTUYQ6DEVNMF4I7ZMXL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace custom and non-portable implementation of COUNT_ARGS().

Fixes: e64b674bc9d7 ("software node: implement reference properties")
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Closes: https://lore.kernel.org/r/ZQoILN6QCjzosCOs@google.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/property.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index 1684fca930f7..55c2692ffa8c 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -10,6 +10,7 @@
 #ifndef _LINUX_PROPERTY_H_
 #define _LINUX_PROPERTY_H_
 
+#include <linux/args.h>
 #include <linux/bits.h>
 #include <linux/fwnode.h>
 #include <linux/stddef.h>
@@ -314,7 +315,7 @@ struct software_node_ref_args {
 #define SOFTWARE_NODE_REFERENCE(_ref_, ...)			\
 (const struct software_node_ref_args) {				\
 	.node = _ref_,						\
-	.nargs = ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1,	\
+	.nargs = COUNT_ARGS(__VA_ARGS__),			\
 	.args = { __VA_ARGS__ },				\
 }
 
-- 
2.40.0.1.gaa8946217a0b

