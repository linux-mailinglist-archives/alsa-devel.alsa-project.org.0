Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8688603CA
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 21:42:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53C0B846;
	Thu, 22 Feb 2024 21:42:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53C0B846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708634553;
	bh=Q25YWzyNxF/3XAunjCUhzH+lE8FRgGWMvmbdobYKats=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HVlWkGrS3Ezbzq8OW8ef7pWMPaiGp1jxz8dAtAzILukrwUd0iARzREhsl4/5bK2zo
	 WtBY7rG5Kp1nLZw6wqgrAVUStbZ+kixa341xqmlflhuUyzflHf1LIlwOJTDsuFJIkS
	 /cCn179s51A2TisalEKeOiCJxS4exq+1gSOKssys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 594E8F80612; Thu, 22 Feb 2024 21:41:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F7B9F8060F;
	Thu, 22 Feb 2024 21:41:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA13EF805DA; Thu, 22 Feb 2024 21:41:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D724F805AE
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 21:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D724F805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KVV5aILe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708634469; x=1740170469;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q25YWzyNxF/3XAunjCUhzH+lE8FRgGWMvmbdobYKats=;
  b=KVV5aILen8to8hK65kwb9EKg9Z0+ZlSMmnacrTrLXVDkL/ewafAlYWGw
   3nlwBUZPWv6T7ljjjlFMhu9DwPw/CVahl6sT4zneSJzLzdgrZZgn1YJkW
   2mlcDqRLqHM4S6w6zPsGfFiAdJ98rS5Qe+3MVdfd1klbWqYu7K6c2RK+N
   AUSMlxY5KPiudgTgjNrvNGNWUjFEjTrt4sb+oYmwxTHx9pDZ0xFGB2eo5
   xlsRuGdaXPbS2P39UYkRYXpvntny99dMfTk/87TwUj9PGBCcydvjV9NbF
   5+jNVVLPtrcpg9dOtmeZJKeljJcosgyak7mDaenIvpG9VjS0Bp5amW3uq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="25358682"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="25358682"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 12:41:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913585407"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="913585407"
Received: from wyeh-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com)
 ([10.209.77.87])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 12:41:06 -0800
Subject: [PATCH 3/3] sysfs: Introduce DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE()
From: Dan Williams <dan.j.williams@intel.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-coco@lists.linux.dev, alsa-devel@alsa-project.org
Date: Thu, 22 Feb 2024 12:41:06 -0800
Message-ID: 
 <170863446625.1479840.10593839479268727913.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HOFLYZMI7LXRXK4MNV2VFV4V42EHSDKD
X-Message-ID-Hash: HOFLYZMI7LXRXK4MNV2VFV4V42EHSDKD
X-MailFrom: dan.j.williams@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOFLYZMI7LXRXK4MNV2VFV4V42EHSDKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

One of the first users of DEFINE_SYSFS_GROUP_VISIBLE() did this:

	static umode_t dp0_attr_visible(struct kobject *kobj,
					struct attribute *attr,
					int n)
	{
		struct sdw_slave *slave = dev_to_sdw_dev(kobj_to_dev(kobj));

		if (slave->prop.dp0_prop)
			return attr->mode;
		return 0;
	}

	static bool dp0_group_visible(struct kobject *kobj)
	{
		struct sdw_slave *slave = dev_to_sdw_dev(kobj_to_dev(kobj));

		if (slave->prop.dp0_prop)
			return true;
		return false;
	}
	DEFINE_SYSFS_GROUP_VISIBLE(dp0);

...i.e. the _group_visible() helper is identical to the _attr_visible()
helper. Use the "simple" helper to reduce that to:

	static bool dp0_group_visible(struct kobject *kobj)
	{
		struct sdw_slave *slave = dev_to_sdw_dev(kobj_to_dev(kobj));

		if (slave->prop.dp0_prop)
			return true;
		return false;
	}
	DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(dp0);

Remove the need to specify per attribute visibility if the goal is to
hide the entire group.

Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 include/linux/sysfs.h |   45 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index dabf7f4f3581..326341c62385 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -140,7 +140,9 @@ struct attribute_group {
  * };
  *
  * Note that it expects <name>_attr_visible and <name>_group_visible to
- * be defined.
+ * be defined. For cases where individual attributes do not need
+ * separate visibility consideration, only entire group visibility at
+ * once, see DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE().
  */
 #define DEFINE_SYSFS_GROUP_VISIBLE(name)                             \
 	static inline umode_t sysfs_group_visible_##name(            \
@@ -151,6 +153,38 @@ struct attribute_group {
 		return name##_attr_visible(kobj, attr, n);           \
 	}
 
+/*
+ * DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(name):
+ *	A helper macro to pair with SYSFS_GROUP_VISIBLE() that like
+ *	DEFINE_SYSFS_GROUP_VISIBLE() controls group visibility, but does
+ *	not require the implementation of a per-attribute visibility
+ *	callback.
+ * Ex.
+ *
+ * static bool example_group_visible(struct kobject *kobj)
+ * {
+ *       if (example_group_condition)
+ *               return false;
+ *       return true;
+ * }
+ *
+ * DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(example);
+ *
+ * static struct attribute_group example_group = {
+ *       .name = "example",
+ *       .is_visible = SYSFS_GROUP_VISIBLE(example),
+ *       .attrs = &example_attrs,
+ * };
+ */
+#define DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(name)                   \
+	static inline umode_t sysfs_group_visible_##name(         \
+		struct kobject *kobj, struct attribute *a, int n) \
+	{                                                         \
+		if (n == 0 && !name##_group_visible(kobj))        \
+			return SYSFS_GROUP_INVISIBLE;             \
+		return a->mode;                                   \
+	}
+
 /*
  * Same as DEFINE_SYSFS_GROUP_VISIBLE, but for groups with only binary
  * attributes. If an attribute_group defines both text and binary
@@ -166,6 +200,15 @@ struct attribute_group {
 		return name##_attr_visible(kobj, attr, n);               \
 	}
 
+#define DEFINE_SIMPLE_SYSFS_BIN_GROUP_VISIBLE(name)                   \
+	static inline umode_t sysfs_group_visible_##name(             \
+		struct kobject *kobj, struct bin_attribute *a, int n) \
+	{                                                             \
+		if (n == 0 && !name##_group_visible(kobj))            \
+			return SYSFS_GROUP_INVISIBLE;                 \
+		return a->mode;                                       \
+	}
+
 #define SYSFS_GROUP_VISIBLE(fn) sysfs_group_visible_##fn
 
 /*

