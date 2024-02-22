Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B95FA8603C4
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 21:41:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A0A082A;
	Thu, 22 Feb 2024 21:41:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A0A082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708634499;
	bh=jeAQTPQrhXpg49xvZysNAxqhbPsEr5aAB0AbuUICJgI=;
	h=Subject:From:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=P2pujmKRMSC2MDDd1AKFy8tepIJa7KMlEbRmvQzCKzoIUovrTZhdqPEzs3Hdhm1En
	 DxB1FyRMwZhuno+6QG24YchC2qU0YgbCR6AqausvpniFnEojqLYII+hNPaI3F/xLA5
	 3/B5zSrnL8Udq/PE6WaT4DAHfF9frtQqmaLoNyMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EE4DF80587; Thu, 22 Feb 2024 21:41:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B7CF800EE;
	Thu, 22 Feb 2024 21:41:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA4F8F804B0; Thu, 22 Feb 2024 21:41:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 199FAF800EE
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 21:40:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 199FAF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lf/ObxyX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708634455; x=1740170455;
  h=subject:from:to:cc:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jeAQTPQrhXpg49xvZysNAxqhbPsEr5aAB0AbuUICJgI=;
  b=lf/ObxyXSuSvA4tRSZ0XrNjHK9jbQwfqfqhsGnU3q9hWtdrk6/CcbIyW
   BQWyYeX78nE1u5j6UD4JaKRDwxX45tFv9A2SKuNjrsi6PQG5jz7SSzUas
   sWGuqh6+5XG/6wiCmXVMqyDi4A6JwJy/02XzBC6NXwxpgc00486CRoljk
   gTeB5X4A4ZnXrZoJse9UKc/fCr9XMewi1z9aW+jnRmpyxq5JTKJUqP4uN
   lbWby5lRQZh3nCPUgEs5LNH8Vs+iwZYBPH6OQj1bokwNIDTYKVZTUpgpN
   t7aAoidwB2Y6P/EmX+IFJz0RfM8jOcXGHcOb0hpnD6+BGZopMBa8P/bWs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="25358628"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="25358628"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 12:40:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913585365"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="913585365"
Received: from wyeh-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com)
 ([10.209.77.87])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 12:40:49 -0800
Subject: [PATCH 0/3] sysfs: Group visibility fixups
From: Dan Williams <dan.j.williams@intel.com>
To: gregkh@linuxfoundation.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Marc Herbert <marc.herbert@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-coco@lists.linux.dev, alsa-devel@alsa-project.org
Date: Thu, 22 Feb 2024 12:40:48 -0800
Message-ID: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HYR7WPJ7FIDKM3G4FSUQMQIYKMFH6GRO
X-Message-ID-Hash: HYR7WPJ7FIDKM3G4FSUQMQIYKMFH6GRO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYR7WPJ7FIDKM3G4FSUQMQIYKMFH6GRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey Greg,

Marc was able to get me a backtrace for that bootup hang scenario that
Pierre noted here [1]. A Tested-by is still pending, but I am certain
this is the issue, and it may impact more than just the one platform if
that "empty_attrs" pattern has been repeated anywhere else in the
kernel.

I also took some time to document how to use the helpers a bit better,
and introduce DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE() for cases where all
that matters is group visibility and not per attribute visibility.

[1]: http://lore.kernel.org/r/b93ec9c2-23f5-486b-a3dc-ed9b960df359@linux.intel.com

---

Dan Williams (3):
      sysfs: Fix crash on empty group attributes array
      sysfs: Document new "group visible" helpers
      sysfs: Introduce DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE()


 fs/sysfs/group.c      |    4 +-
 include/linux/sysfs.h |   85 +++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 84 insertions(+), 5 deletions(-)

base-commit: 70317fd24b419091aa0a6dc3ea3ec7bb50c37c32
