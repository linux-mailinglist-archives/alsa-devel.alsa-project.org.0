Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4308603C7
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 21:41:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46A6311C;
	Thu, 22 Feb 2024 21:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46A6311C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708634519;
	bh=VU7eFjyMMwj2wha596144IVFoZku7WK0IDQNMvyYawg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WRVnPmafJkTB2G9PENCs5tq3wkMfdLBePCFnOpus0b5esOkanPh8h1kWdgYOpHj+r
	 jvyTl+RDF4dEJNJdwRYQx04Zjp5gFp4broaOivgr4oMC9/KIQualjSL7ylDiwIAG/f
	 mh6Lr+v3p1H2FQff6o2a72ubVisMt3gP22NpHqN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EEE7F805D7; Thu, 22 Feb 2024 21:41:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E023F805C4;
	Thu, 22 Feb 2024 21:41:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F7F4F804B0; Thu, 22 Feb 2024 21:41:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DDC8F8047D
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 21:40:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DDC8F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PqBj5cdl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708634458; x=1740170458;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VU7eFjyMMwj2wha596144IVFoZku7WK0IDQNMvyYawg=;
  b=PqBj5cdlp4lBm/3rp4dyDNdEV24xrC6pK4m2vp5pMsqkmHBzUOASMip0
   mtK1k/4yYlUCGQ3nTCdN1qQyqhrIRekqBD4saPCroiciTDpQaQ8KN04Pe
   79u3dSaYmUX0n55osg3Bmq8FrrT/3XUZ7KRo3tEA3jdiMV9uEp8NZKPfv
   UaA5c5tJDFlndpP+ztzfbOndG92gMYrsaOP4RnElaC33i3/OGH8RkSP52
   YDPgmF96ZFat/GQTFbyurjr0D4ONGaJddtLVBlYSNEeFHCiXcrdAPPzxp
   dOgZn2QZMD+A/hx7oOQhgNsoRu5JVKC8iLkmR0dSUycPhavUjtTHMqSfN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="25358650"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="25358650"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 12:40:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913585389"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="913585389"
Received: from wyeh-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com)
 ([10.209.77.87])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 12:40:55 -0800
Subject: [PATCH 1/3] sysfs: Fix crash on empty group attributes array
From: Dan Williams <dan.j.williams@intel.com>
To: gregkh@linuxfoundation.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Marc Herbert <marc.herbert@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-coco@lists.linux.dev, alsa-devel@alsa-project.org
Date: Thu, 22 Feb 2024 12:40:54 -0800
Message-ID: 
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RVRBVNKKO2XANNJLF3XFOIN3J6VZFEUL
X-Message-ID-Hash: RVRBVNKKO2XANNJLF3XFOIN3J6VZFEUL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVRBVNKKO2XANNJLF3XFOIN3J6VZFEUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It turns out that arch/x86/events/intel/core.c makes use of "empty"
attributes.

	static struct attribute *empty_attrs;

	__init int intel_pmu_init(void)
	{
	        struct attribute **extra_skl_attr = &empty_attrs;
	        struct attribute **extra_attr = &empty_attrs;
	        struct attribute **td_attr    = &empty_attrs;
	        struct attribute **mem_attr   = &empty_attrs;
	        struct attribute **tsx_attr   = &empty_attrs;
		...

That breaks the assumption __first_visible() that expects that if
grp->attrs is set then grp->attrs[0] must also be set and results in
backtraces like:

    BUG: kernel NULL pointer dereference, address: 00rnel mode
    #PF: error_code(0x0000) - not-present ] PREEMPT SMP NOPTI
    CPU: 1 PID: 1 Comm: swapper/IP: 0010:exra_is_visible+0x14/0x20
     ? exc_page_fault+0x68/0x190
     internal_create_groups+0x42/0xa0
     pmu_dev_alloc+0xc0/0xe0
     perf_event_sysfs_init+0x580000000000 ]---
    RIP: 0010:exra_is_visible+0x14/0

Check for non-empty attributes array before calling is_visible().

Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Closes: https://github.com/thesofproject/linux/pull/4799#issuecomment-1958537212
Fixes: 70317fd24b41 ("sysfs: Introduce a mechanism to hide static attribute_groups")
Cc: Marc Herbert <marc.herbert@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 fs/sysfs/group.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index ccb275cdabcb..8c63ba3cfc47 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -33,10 +33,10 @@ static void remove_files(struct kernfs_node *parent,
 
 static umode_t __first_visible(const struct attribute_group *grp, struct kobject *kobj)
 {
-	if (grp->attrs && grp->is_visible)
+	if (grp->attrs && grp->attrs[0] && grp->is_visible)
 		return grp->is_visible(kobj, grp->attrs[0], 0);
 
-	if (grp->bin_attrs && grp->is_bin_visible)
+	if (grp->bin_attrs && grp->bin_attrs[0] && grp->is_bin_visible)
 		return grp->is_bin_visible(kobj, grp->bin_attrs[0], 0);
 
 	return 0;

