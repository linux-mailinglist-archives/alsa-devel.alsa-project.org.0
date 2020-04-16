Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 394071AD921
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 10:52:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D4971662;
	Fri, 17 Apr 2020 10:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D4971662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587113543;
	bh=AnBqVMs/T56dUeYhkKoeHJAMkOZDFEa4F17BumJcxiI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V3voztHBYe0lkiCQ6ACWcJNbpGrtC9womsyuEcK39G0Yh4mk0grTSWYwBH7QlA2Vl
	 8bkazCqj0lbie08mQnH7dBFy5aftjI/7KnxdgmtdxN6vjNgkelLddFoy6UaUKx86DK
	 RiEDZbYTK7OycY6DXl7xV9Z0M/ZtvObvdVxzZotE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69898F8025F;
	Fri, 17 Apr 2020 10:50:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EB11F80264; Fri, 17 Apr 2020 10:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68B34F800AB
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 10:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68B34F800AB
IronPort-SDR: J2qcCc0tXFBQkPpX8cjlTIQc/rWRThUAM9e3HoGhmsF2AQByxuJbFeO01trpLKaT0WSqBlOanY
 CLxt+ZyfkPYw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 01:50:29 -0700
IronPort-SDR: petqKNauugCtt8HtiFFVMtSL1QAAiUZUx0Oxs6ih4y3gSqYZKe8UywgZ1+HzkwbT+VAz5jxjCR
 dMgwdcBpmPLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; d="scan'208";a="454661427"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 17 Apr 2020 01:50:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RFC 0/5] soundwire: create master device and use it
Date: Fri, 17 Apr 2020 04:55:19 +0800
Message-Id: <20200416205524.2043-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com
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

This series adds sdw master devices and use it instead of platform devices.

An open needs to be addressed is that should we use differrent bus type for
sdw master and slave devices?

Pierre-Louis Bossart (4):
  soundwire: bus_type: add sdw_master_device support
  soundwire: qcom: fix error handling in probe
  soundwire: qcom: add sdw_master_device support
  soundwire: intel: transition to sdw_master_device

Srinivas Kandagatla (1):
  soundwire: master: use device node pointer from master device

 drivers/soundwire/Makefile         |   2 +-
 drivers/soundwire/bus.h            |   2 +
 drivers/soundwire/bus_type.c       |  19 +-
 drivers/soundwire/intel.c          |  98 ++++++----
 drivers/soundwire/intel.h          |   8 +-
 drivers/soundwire/intel_init.c     | 293 ++++++++++++++++++++++-------
 drivers/soundwire/master.c         | 168 +++++++++++++++++
 drivers/soundwire/qcom.c           |  59 ++++--
 drivers/soundwire/slave.c          |   8 +-
 include/linux/soundwire/sdw.h      |  60 ++++++
 include/linux/soundwire/sdw_type.h |  10 +-
 11 files changed, 601 insertions(+), 126 deletions(-)
 create mode 100644 drivers/soundwire/master.c

-- 
2.17.1

