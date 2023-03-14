Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3036B87AB
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A8D10F4;
	Tue, 14 Mar 2023 02:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A8D10F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678758129;
	bh=x2HDUBm4iNL4Ux/CxNLLfqxMzPTBD5JMWpg7L8l7OyQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AsrB8sHI5EVNal1+QXBUfYS6ZyeDQRH9iqgsRbhCdIIs2PiionuaHAt8N0DmTTXn7
	 W5nRuRpTP2mrPMJXqbImBbv0jHCGwI2BlM9X2Z+Kyc7BIzoAaBeEyfUcyjv9GWZ6LR
	 2ci5GeRXnUylaCQZRLlwwRhXuYmLeuymQ5+WaXjg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78C1DF804FE;
	Tue, 14 Mar 2023 02:41:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D943F80425; Tue, 14 Mar 2023 02:41:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99424F800C9
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:41:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99424F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hL60OIfm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758070; x=1710294070;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x2HDUBm4iNL4Ux/CxNLLfqxMzPTBD5JMWpg7L8l7OyQ=;
  b=hL60OIfm7z69tUI20CXcooU1RZ8oiYGKeExmwGoJAVsj+Y+uZ9DI3pYW
   We/epnQw/vF1e+p+fJZjRqQpvJi7Igr300/9H5DoVms9A5Yt2P5C8O3Ln
   8AJ9mrIk3ksTZBTEc5lTT8AMXaPttA9Ndtf01QAyZwg+D0u4ERRKXwV/F
   4l0FEAYRKYCBIoEk447dXaeYJfJpUai6NaPBtTCfGZad9+dvhjrGYtaQV
   cLLfXdoy8GGSoL9BT6vfG16hizLd6XcsGJrGIGLBijpZkDDYdUMztK/l9
   llsAuMz+LeQRS0hFOcgzK9GjDN4BsQtkPygGt5DvscG7UCKjmLRN3CHKq
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316949198"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="316949198"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711327315"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="711327315"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:05 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 00/16] soundwire: updates before LunarLake introduction
Date: Tue, 14 Mar 2023 09:53:54 +0800
Message-Id: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V6HPZS52KV5V4QMRRHFGUZJWKGYLZUSJ
X-Message-ID-Hash: V6HPZS52KV5V4QMRRHFGUZJWKGYLZUSJ
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6HPZS52KV5V4QMRRHFGUZJWKGYLZUSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series provides a set of cleanups and new abstractions needed for the
introduction of LunarLake support.

For now this is an iso-functionality change, with changes on the Intel and
Cadence sides. The low-level support for LunarLake will be introduced in a
follow-up series that depends on HDaudio multi-link extensions.

Pierre-Louis Bossart (16):
  soundwire: intel: move common definitions to header file
  soundwire: intel: remove stale/misleading comment
  soundwire: intel: remove PDI-level restrictions on rates and formats
  soundwire: intel: remove useless abstraction
  soundwire: intel: simplify sync_go sequence
  soundwire: intel: add sync_arm/sync_go to ops
  soundwire: intel: use indirection before moving bus start/stop
    sequences
  soundwire: intel: move bus common sequences to different file
  soundwire: intel: add abstraction for cmdsync check
  soundwire: intel: move bank switch routine to common
    intel_bus_common.c
  soundwire: cadence: remove CDNS_MCP_CONFIG_SSPMOD
  soundwire: cadence: add helpers to access IP_MCP registers
  soundwire: cadence: split access to IP_MCP_CONFIG fields
  soundwire: cadence: split access to IP_MCP_CONTROL fields
  soundwire: cadence: split access to IP_MCP_CMDCTRL fields
  soundwire: cadence: change access to IP_MCP_CMD_BASE

 drivers/soundwire/Makefile           |   3 +-
 drivers/soundwire/cadence_master.c   | 139 +++++++-----
 drivers/soundwire/cadence_master.h   |   3 +
 drivers/soundwire/intel.c            | 325 ++-------------------------
 drivers/soundwire/intel.h            |  67 ++++++
 drivers/soundwire/intel_bus_common.c | 259 +++++++++++++++++++++
 include/linux/soundwire/sdw_intel.h  |  11 +
 7 files changed, 444 insertions(+), 363 deletions(-)
 create mode 100644 drivers/soundwire/intel_bus_common.c

-- 
2.25.1

