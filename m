Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F3FE255A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 23:30:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B6841616;
	Wed, 23 Oct 2019 23:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B6841616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571866231;
	bh=L+3K3BsoAps1ChdJyMttFHiJ4tugB1+5zoRL/IDNdBg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uhX+My2Qk9ZX7heLxDsc4MVoveEDvUhoz2ZycWYQUfEeLi4eey9BoZtmuzXzv9HaH
	 rG09OpoZnhYqp7hr020GDsDbJ1dvFWmkKlXMu0Y+UuUXlkbRwB0icVTMSqvd0QfDnA
	 A7P4lGATtwyuMXEg9VVwofAMWtfcQNA8PsMRcgRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B389F8058C;
	Wed, 23 Oct 2019 23:28:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 614EEF803A6; Wed, 23 Oct 2019 23:28:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7652F80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 23:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7652F80274
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 14:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,222,1569308400"; d="scan'208";a="399541151"
Received: from ayamada-mobl1.gar.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.95.208])
 by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2019 14:28:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 23 Oct 2019 16:28:09 -0500
Message-Id: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 00/14] soundwire: intel: implement new ASoC
	interfaces
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

this patchset applies on top of the series "[PATCH 0/4] soundwire:
update ASoC interfaces" and previously submitted cleanups "[PATCH v3
0/5] soundwire: intel/cadence: better initialization"

The changes are essentially a removal of the platform devices and the
implementation of the new interfaces required to scan the ACPI tables,
probe the links and start them.

The missing prepare, trigger and setup ASoC callbacks are also
implemented. The hw_params and free callbacks use the new interfaces
as well.

While there are quite a few lines of code changed, this is mostly
about interface changes. The next series will contain more functional
changes and deal with race conditions on probe, enumeration and
suspend/resume issues.

Bard Liao (1):
  soundwire: add device driver to sdw_md_driver

Pierre-Louis Bossart (10):
  soundwire: renames to prepare support for master drivers/devices
  soundwire: rename dev_to_sdw_dev macro
  soundwire: rename drv_to_sdw_slave_driver macro
  soundwire: bus_type: rename sdw_drv_ to sdw_slave_drv
  soundwire: intel: rename res field as link_res
  soundwire: add support for sdw_slave_type
  soundwire: add initial definitions for sdw_master_device
  soundwire: intel: remove platform devices and provide new interface
  soundwire: intel: free all resources on hw_free()
  soundwire: intel_init: add implementation of sdw_intel_enable_irq()

Rander Wang (3):
  soundwire: intel: add prepare support in sdw dai driver
  soundwire: intel: add trigger support in sdw dai driver
  soundwire: intel: add sdw_stream_setup helper for .startup callback

 drivers/base/regmap/regmap-sdw.c   |   4 +-
 drivers/soundwire/Makefile         |   2 +-
 drivers/soundwire/bus.c            |   2 +-
 drivers/soundwire/bus_type.c       |  60 +++---
 drivers/soundwire/intel.c          | 280 ++++++++++++++++++++++-----
 drivers/soundwire/intel.h          |   8 +-
 drivers/soundwire/intel_init.c     | 300 ++++++++++++++++++++++-------
 drivers/soundwire/master.c         |  64 ++++++
 drivers/soundwire/slave.c          |   9 +-
 include/linux/soundwire/sdw.h      |  39 +++-
 include/linux/soundwire/sdw_type.h |  34 +++-
 11 files changed, 642 insertions(+), 160 deletions(-)
 create mode 100644 drivers/soundwire/master.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
