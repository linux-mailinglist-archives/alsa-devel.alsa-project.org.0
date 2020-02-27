Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B91AB172B5C
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 23:34:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5056316CD;
	Thu, 27 Feb 2020 23:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5056316CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582842851;
	bh=KGxfTye5lWPcHThXnEVDdFI2mHdpJ+vrkJvTUgimxCw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=njrlJrQq48UNGCFSiQLvBPo7Nrc39JHJvBPCDwcVu2EEdVk+NGQ+/ABsDWdzgK161
	 8vNx7TS7LnqlmYx0S8cDg7I+AZMQ2xoBvHYAsnKabDSrcyByM538PcHT4hdw+a3By4
	 kG3Um+lMb3FMluz+wvDFT1MkZveovw3mtcTBxr6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53E4FF8025E;
	Thu, 27 Feb 2020 23:32:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47125F8015D; Thu, 27 Feb 2020 23:32:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A4ACF80089
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 23:32:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A4ACF80089
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 14:32:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="411194785"
Received: from azeira-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.147.250])
 by orsmga005.jf.intel.com with ESMTP; 27 Feb 2020 14:32:18 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/8] soundwire: remove platform devices, add SOF interfaces
Date: Thu, 27 Feb 2020 16:31:58 -0600
Message-Id: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The first two patches were already reviewed by Greg KH in an earlier
RFC. Since I only cleaned-up the error handling flow and removed an
unnecessary wrapper, I took the liberty of adding Greg's Reviewed-by
tag for these two patches.

The rest of the patches implement the interfaces required for the SOF
driver (interrupts handled with a single handler, PCI wakes and
sharing of _ADR information to select a machine driver).

When this patchset is merged, a tag will need to be shared with Mark
Brown so that we can provide the SOF patches to the ASoC tree and
enable SoundWire in builds for Intel platforms.

Bard Liao (2):
  soundwire: intel/cadence: merge Soundwire interrupt handlers/threads
  soundwire: intel_init: save Slave(s) _ADR info in sdw_intel_ctx

Pierre-Louis Bossart (5):
  soundwire: bus_type: add master_device/driver support
  soundwire: intel: transition to sdw_master_device/driver support
  soundwire: intel_init: add implementation of sdw_intel_enable_irq()
  soundwire: intel_init: use EXPORT_SYMBOL_NS
  soundwire: intel: add helpers for link power down and shim wake

Rander Wang (1):
  soundwire: intel: add wake interrupt support

 drivers/soundwire/Makefile         |   2 +-
 drivers/soundwire/bus_type.c       | 141 ++++++++++-
 drivers/soundwire/cadence_master.c |  18 +-
 drivers/soundwire/cadence_master.h |   4 +
 drivers/soundwire/intel.c          | 182 +++++++++++---
 drivers/soundwire/intel.h          |  12 +-
 drivers/soundwire/intel_init.c     | 365 +++++++++++++++++++++++------
 drivers/soundwire/master.c         | 100 ++++++++
 drivers/soundwire/slave.c          |   7 +-
 include/linux/soundwire/sdw.h      |  76 ++++++
 include/linux/soundwire/sdw_type.h |  36 ++-
 11 files changed, 819 insertions(+), 124 deletions(-)
 create mode 100644 drivers/soundwire/master.c

-- 
2.20.1

