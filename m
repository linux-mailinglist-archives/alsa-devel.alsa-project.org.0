Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 559196C5EDA
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:31:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4462CEB9;
	Thu, 23 Mar 2023 06:30:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4462CEB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549475;
	bh=9WAW0zepnYSbfRRjixmplrT7V+yloxeDYYdsHsolz/4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=N5jUH/sw+uDYg4tZePlyEmc7Ya9VrDIM6D0uDqvSF7U+ZvAa+zI9zc6q2omGDlZeF
	 QbtoPxjb88SqMRNHtEUBEXTvslnsDf2PSPZCqGqgkZFz7mpgLIM9awi55eBwpWkQ/Q
	 aojjfGiRibE9iHraeW4/zFd3xOQ7ZSufO4d4XcXc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70B23F80520;
	Thu, 23 Mar 2023 06:30:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA202F80482; Thu, 23 Mar 2023 06:30:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 207DFF80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:29:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 207DFF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LlyMGkLZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549396; x=1711085396;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9WAW0zepnYSbfRRjixmplrT7V+yloxeDYYdsHsolz/4=;
  b=LlyMGkLZruc9ECAeabrkE8dp57F39D8UlUZ8aZUiJT4FLnwRSHM93xoB
   0yEEeUbiDSF3+l6zHwqPgV5kepVyLtnnPRP5IZOqP9TRuhysmG+7978il
   xdYw6kUZD8Vwlbsz6F5qYXs4518gJDyy5AJylmvbkReNj2wDH18qklK/0
   Ktg8Fny0vMefBnnWRFSXpz5YMaBFFS1bSbjX96HT8+JqA7yndS6HnNZta
   8JbTQdjc9A6sUdDGsBVgA7eBNTifUTx8GTV55veIehxRfcike+K3Bw+rz
   AZ+8r38/LSV5X4HEZB6VREze+clPBosc68ah7sVBzE3Pj/H8VptyGe7BI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779267"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779267"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675566983"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675566983"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:29:48 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 00/20] ASoC/soundwire: add support for ACE2.x
Date: Thu, 23 Mar 2023 13:44:32 +0800
Message-Id: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UFAONDYB5MSLA26VUG2CEQ5MH2Z7NKPZ
X-Message-ID-Hash: UFAONDYB5MSLA26VUG2CEQ5MH2Z7NKPZ
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series uses the abstraction added in past kernel cycles to provide
support for the ACE2.x integration. The existing SHIM and Cadence
registers are now split in 3 (SHIM, IP, SHIM vendor-specific), with some
parts also moved to the HDaudio Extended Multi link structures. Nothing
fundamentally different except for the register map.

This series only provides the basic mechanisms to expose SoundWire-based
DAIs. The PCI parts and DSP management will be contributed later, and the
DAI ops are now empty as well.

The change is mainly on SoundWire. It would be better to go through
SoundWire tree.

Pierre-Louis Bossart (20):
  ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used in LunarLake
  soundwire: intel: add ACE2.x SHIM definitions
  soundwire: intel_ace2x: add empty new ops for LunarLake
  soundwire/ASOC: Intel: update offsets for LunarLake
  soundwire: intel/cadence: set ip_offset at run-time
  ASoC/soundwire: intel: pass hdac_bus pointer for link management
  soundwire: intel: add eml_lock in the interface for new platforms
  ASoC: SOF: Intel: hda: retrieve SoundWire eml_lock and pass pointer
  soundwire: intel_init: use eml_lock parameter
  soundwire: intel_ace2x: add debugfs support
  soundwire: intel_ace2x: add link power-up/down helpers
  soundwire: intel_ace2x: set SYNCPRD before powering-up
  soundwire: intel_ace2x: configure link PHY
  soundwire: intel_ace2x: add DAI registration
  soundwire: intel_ace2x: add sync_arm/sync_go helpers
  soundwire: intel_ace2x: use common helpers for bus start/stop
  soundwire: intel_ace2x: enable wake support
  soundwire: intel_ace2x: add check_cmdsync_unlocked helper
  soundwire: bus: add new manager callback to deal with peripheral
    enumeration
  soundwire: intel_ace2x: add new_peripheral_assigned callback

 drivers/soundwire/Makefile              |   3 +-
 drivers/soundwire/bus.c                 |   3 +
 drivers/soundwire/cadence_master.h      |   2 +
 drivers/soundwire/intel.h               |  16 +
 drivers/soundwire/intel_ace2x.c         | 390 ++++++++++++++++++++++++
 drivers/soundwire/intel_ace2x_debugfs.c | 147 +++++++++
 drivers/soundwire/intel_auxdevice.c     |  17 ++
 drivers/soundwire/intel_init.c          |  21 +-
 include/linux/soundwire/sdw.h           |   3 +-
 include/linux/soundwire/sdw_intel.h     |  88 ++++++
 sound/soc/sof/intel/hda.c               |  31 +-
 sound/soc/sof/intel/shim.h              |   1 +
 12 files changed, 711 insertions(+), 11 deletions(-)
 create mode 100644 drivers/soundwire/intel_ace2x.c
 create mode 100644 drivers/soundwire/intel_ace2x_debugfs.c

-- 
2.25.1

