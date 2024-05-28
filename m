Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B034C8D24A0
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 21:30:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09FCB84C;
	Tue, 28 May 2024 21:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09FCB84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716924633;
	bh=4ERwcxQsvUfNv1qgUK6eoCOJi5v1+dTD+vRdxYfmqls=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZDLSWkLY7clhPSKWpygBHVSXWFm+TYek114i9qLmdjJjEgq8sM2kr9yA5c60xrjFA
	 yFaZqEZLERTgTaEiOWqM4oRp/ihRtf/Ihr5xwVQNRrs+HUad/sinJXZdxk3Nkh5Ue6
	 iEpCeq2lG/MyOM8V2Xy17h/sVY51pj4qKdirK4X0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ECF5F805AF; Tue, 28 May 2024 21:30:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED73CF8058C;
	Tue, 28 May 2024 21:30:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1A4FF80494; Tue, 28 May 2024 21:30:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28C78F800BA
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 21:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28C78F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nhzFxSeF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716924598; x=1748460598;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4ERwcxQsvUfNv1qgUK6eoCOJi5v1+dTD+vRdxYfmqls=;
  b=nhzFxSeFdO9CBzv52DRynJP47J4EY5NBZH0yfCHGtf/Gl4gojP4TITi7
   t1GI1s9ALJSbYqBIOvtiVWUFMyHABAvKBVQmTqs87GvPOjqHiS5Y8ZAzW
   U1PDljugwHqFjWT5ceQr9d5WVDk6SOgj2OCFtYF9c5jc3HTqJxFK7SPNH
   We8XAZY+MiXKDWKY/PRA8Iu1EsywwWNAuia9xfOiiM7Q6BUgKvCZiuasD
   VmsICQP6i1IbwU8caHONiLdQ/muBt2kP68d2O5zRYeNxmDcvJoaIVlIcX
   w+m0PAb0jDpby+UzTq4VV75CiFX0uyIYbzdcf4/Dsnu8A7PEwuEQx6Vz0
   A==;
X-CSE-ConnectionGUID: ZBe3/7bWSEySO5K0lPbOJQ==
X-CSE-MsgGUID: xSU15tkYSminArUbnHtF6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24711836"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000";
   d="scan'208";a="24711836"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 12:29:52 -0700
X-CSE-ConnectionGUID: qzfW3SnHSfGbj7LOEBqI4w==
X-CSE-MsgGUID: DJY626KCTJu6p6jlLXTKbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000";
   d="scan'208";a="35246716"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.237])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 12:29:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	rafael@kernel.org,
	vkoul@kernel.org,
	andriy.shevchenko@linux.intel.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/3] ACPI/ALSA/soundwire: add acpi_get_local_u64_address()
 helper
Date: Tue, 28 May 2024 14:29:32 -0500
Message-ID: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q6XCKRH6EYGN7IBA5JSBMGMRPMR7FEEF
X-Message-ID-Hash: Q6XCKRH6EYGN7IBA5JSBMGMRPMR7FEEF
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6XCKRH6EYGN7IBA5JSBMGMRPMR7FEEF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The acpi_get_local_address() helper assumes a 32-bit ADR is used. If
we want to use this helper for SoundWire/SDCA ASoC codecs, we need an
extension where the native 64-bits are used. This patchset suggests a
new helper, acpi_get_local_address() may be renamed if desired in a
folow-up patch.

The path of least resistance would be to merge this patchset in the
ASoC tree, since I have additional changes for ASoC/SDCA (SoundWire
Device Class) that depend on the new helper.

Pierre-Louis Bossart (3):
  ACPI: utils: introduce acpi_get_local_u64_address()
  soundwire: slave: simplify code with acpi_get_local_u64_address()
  ALSA: hda: intel-sdw-acpi: use acpi_get_local_u64_address()

 drivers/acpi/utils.c       | 22 ++++++++++++++++------
 drivers/soundwire/slave.c  | 13 ++++---------
 include/linux/acpi.h       |  1 +
 sound/hda/intel-sdw-acpi.c |  6 +++---
 4 files changed, 24 insertions(+), 18 deletions(-)

-- 
2.43.0

