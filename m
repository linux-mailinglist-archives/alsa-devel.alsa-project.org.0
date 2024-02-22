Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2218603C9
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 21:42:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62386846;
	Thu, 22 Feb 2024 21:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62386846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708634535;
	bh=r1Jpoa9EFW+a4dM8IBgDTBKhMjLnmgNWSsg+i9Enaak=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YsKU6IGiwOx24K4t/M48GvYiwjZmVvLZlxKx6vK9hKxNDj/mJzmsd/o549YB3YDNf
	 2sjy0tEOb88/7QB2QA2xpawR6n25ncRSUyGdwvedQceQv2bsF9M5aTTbCGGjszWUaH
	 NRyMe0HF+DXTLBoVevml0/4vp+8MqupPauOmDX8Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 169F2F805F6; Thu, 22 Feb 2024 21:41:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 362B1F805F4;
	Thu, 22 Feb 2024 21:41:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23309F805B1; Thu, 22 Feb 2024 21:41:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC86AF8019B
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 21:41:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC86AF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LFCE67qi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708634463; x=1740170463;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r1Jpoa9EFW+a4dM8IBgDTBKhMjLnmgNWSsg+i9Enaak=;
  b=LFCE67qi9tnj6HIQYYv4TtwjkUhLcfzYw1z002YhYaRlFX7/6RdQoAiJ
   pytaADGIQJmJHVVxSWRHmajyRDrFezWZRESpucWSxPPzAKrfSBCTAHbhB
   BrlaKc0OcDyWAy7WPzfF1onk2IthAlrL6wPFUqaN9vT9jcT97ccxEnpQN
   ZmmQINU18dRw/YVG64+tnHnfYnlulLgh1jsomcYOR7TjYe5ZRjeSZ4Uij
   DDBmJUBFOfs5IEsocrfutY/5ulkQruaLTC9giZDizuNuoWXibZs26TiV9
   QTLGWE1eP4tIsV6TJX3QcGw8xrkZ0UV2SvVYePpap5dzTWaokZOIR3Jef
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="25358672"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="25358672"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 12:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913585401"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="913585401"
Received: from wyeh-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com)
 ([10.209.77.87])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 12:41:00 -0800
Subject: [PATCH 2/3] sysfs: Document new "group visible" helpers
From: Dan Williams <dan.j.williams@intel.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-coco@lists.linux.dev, alsa-devel@alsa-project.org
Date: Thu, 22 Feb 2024 12:41:00 -0800
Message-ID: 
 <170863446065.1479840.10697164014098377292.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AEVJ6IYOBZYDJNKNN3G7QC62LGIDFC56
X-Message-ID-Hash: AEVJ6IYOBZYDJNKNN3G7QC62LGIDFC56
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AEVJ6IYOBZYDJNKNN3G7QC62LGIDFC56/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add documentation and examples for how to use
DEFINE_SYSFS_GROUP_VISIBLE() and SYSFS_GROUP_VISIBLE(). Recall that the
motivation for this work is that it is easier to reason about the
lifetime of statically defined sysfs attributes that become visible at
device_add() time rather than dynamically adding them later.
DEFINE_SYSFS_GROUP_VISIBLE() tackles one of the reasons to opt for
dynamically created attributes which did not have a facility for hiding
empty directories.

Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 include/linux/sysfs.h |   42 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index a42642b277dd..dabf7f4f3581 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -105,8 +105,42 @@ struct attribute_group {
 #define SYSFS_GROUP_INVISIBLE	020000
 
 /*
- * The first call to is_visible() in the create / update path may
- * indicate visibility for the entire group
+ * DEFINE_SYSFS_GROUP_VISIBLE(name):
+ *	A helper macro to pair with the assignment of ".is_visible =
+ *	SYSFS_GROUP_VISIBLE(name)", that arranges for the directory
+ *	associated with a named attribute_group to optionally be hidden.
+ *	This allows for static declaration of attribute_groups, and the
+ *	simplification of attribute visibility lifetime that implies,
+ *	without polluting sysfs with empty attribute directories.
+ * Ex.
+ *
+ * static umode_t example_attr_visible(struct kobject *kobj,
+ *                                   struct attribute *attr, int n)
+ * {
+ *       if (example_attr_condition)
+ *               return 0;
+ *       else if (ro_attr_condition)
+ *               return 0444;
+ *       return a->mode;
+ * }
+ *
+ * static bool example_group_visible(struct kobject *kobj)
+ * {
+ *       if (example_group_condition)
+ *               return false;
+ *       return true;
+ * }
+ *
+ * DEFINE_SYSFS_GROUP_VISIBLE(example);
+ *
+ * static struct attribute_group example_group = {
+ *       .name = "example",
+ *       .is_visible = SYSFS_GROUP_VISIBLE(example),
+ *       .attrs = &example_attrs,
+ * };
+ *
+ * Note that it expects <name>_attr_visible and <name>_group_visible to
+ * be defined.
  */
 #define DEFINE_SYSFS_GROUP_VISIBLE(name)                             \
 	static inline umode_t sysfs_group_visible_##name(            \
@@ -119,7 +153,9 @@ struct attribute_group {
 
 /*
  * Same as DEFINE_SYSFS_GROUP_VISIBLE, but for groups with only binary
- * attributes
+ * attributes. If an attribute_group defines both text and binary
+ * attributes, the group visibility is determined by the function
+ * specified to is_visible() not is_bin_visible()
  */
 #define DEFINE_SYSFS_BIN_GROUP_VISIBLE(name)                             \
 	static inline umode_t sysfs_group_visible_##name(                \

