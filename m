Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 660BAB4302
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 23:25:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D83FA1672;
	Mon, 16 Sep 2019 23:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D83FA1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568669141;
	bh=0Pxuli+VmokSjOulDCzl1MnMMlkGEX3vcXzy/KP107M=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Elj1LFOVG9/vK74CwdUahXjU9gEyyyuCsHK6W2wx8/KiZaXQWkrTlNCstfRs1HOkD
	 dilfBvT6Xs1nL5CpYOayRaxxja0od81lMn3i8ZzALeF3WdzSq0+WPW2GpT4ZU7Yxrb
	 N/z3y6i+LpulDtdIu3LLvDxq/g1VbVItkCcDk6NE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E053F805A8;
	Mon, 16 Sep 2019 23:23:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6D33F80539; Mon, 16 Sep 2019 23:23:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F946F80148
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 23:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F946F80148
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 14:23:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,514,1559545200"; d="scan'208";a="201684014"
Received: from dgitin-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.142.45])
 by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2019 14:23:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 16 Sep 2019 16:23:33 -0500
Message-Id: <20190916212342.12578-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 0/9] soundwire: add Master device support,
	GreyBus style
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

The current use of platform devices leads to limitations in terms of
API and problematic reference counts flagged during the review of
sysfs patches.

As suggested by Greg KH, this patch series introduces a 'Master
device' and gets rid of platform devices. The code is inspired by
GreyBus, e.g. 'gb_hd_driver' is translated for the SoundWire context
as 'sdw_md_driver' and likewise 'gb_host_device' is translated as
'sdw_master_device'. There are differences in the way devices are
created, using device_register instead of the multiple steps used in
GreyBus.

All I know about GreyBus is that it's based on Unipro, so the
code updates are based on a first-order analysis, it could very well
be I missed concepts while trying to reverse-engineer the code in
staging/greybus/. I focused on the concepts mainly and it's also
possible that the dual-license for new files or plan-vanilla
EXPORT_SYMBOL are not appropriate for all the changes in this
series. Please don't take errors as deliberate intent to work-around
GPL but rather as an indicator of maturity of the code only developed
in the last few days.

These changes make it possible to provide new callbacks, e.g splitting
the bus startup from the initializations in probe, which is very much
desired on Intel platforms to detect the machine driver as early as
possible before the hardware is fully powered/enable. These patches
will be provided as a separate RFC later today to illustrate the
benefit of these changes.

To make the code more consistent the first series of patches are
renames. I did not rename 'sdw_slave' or 'module_sdw_driver' to avoid
compatibility issues since there are codec drivers almost ready for
integration. I don't have any specific opinion on if/when additional
renames should be done, as long as there is a means to clearly
identify what is specific to a SoundWire Master I am fine.

Feedback and reviews welcome.

Bard Liao (1):
  soundwire: add device driver to sdw_md_driver

Pierre-Louis Bossart (8):
  soundwire: renames to prepare support for master drivers/devices
  soundwire: rename dev_to_sdw_dev macro
  soundwire: rename drv_to_sdw_slave_driver macro
  soundwire: bus_type: rename sdw_drv_ to sdw_slave_drv
  soundwire: intel: rename res field as link_res
  soundwire: add support for sdw_slave_type
  soundwire: add initial definitions for sdw_master_device
  soundwire: intel: remove platform devices and provide new interface

 drivers/base/regmap/regmap-sdw.c    |   4 +-
 drivers/soundwire/Makefile          |   2 +-
 drivers/soundwire/bus.c             |   2 +-
 drivers/soundwire/bus_type.c        |  60 +++---
 drivers/soundwire/intel.c           | 117 ++++++-----
 drivers/soundwire/intel.h           |  22 +--
 drivers/soundwire/intel_init.c      | 293 +++++++++++++++++++---------
 drivers/soundwire/master.c          |  80 ++++++++
 drivers/soundwire/slave.c           |   9 +-
 include/linux/soundwire/sdw.h       |  39 +++-
 include/linux/soundwire/sdw_intel.h |  86 +++++++-
 include/linux/soundwire/sdw_type.h  |  34 +++-
 12 files changed, 551 insertions(+), 197 deletions(-)
 create mode 100644 drivers/soundwire/master.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
