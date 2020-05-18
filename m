Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E4E1D9210
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 10:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56E2A16FC;
	Tue, 19 May 2020 10:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56E2A16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589877150;
	bh=tkvS0ACiGyIXss2D+wMx49+42JxqKkROQNZHy/WumKk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kSejzu37mQplXCiRBA8/mvb8OWzcwXXqPPbxXIvjCFt1stzaS5DK06/rbLnO+h/LE
	 svKpjvLuV/2RZHsB1tFnRm3atHP0BGUde7w3rC+qIRZWt7xNCc66005nfL6y+ksFRK
	 0PT8dRCkVNkqZ7w8cvUEnJIZ1LoyfZKXNHIMX2vs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A339F80110;
	Tue, 19 May 2020 10:30:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B66EF801F8; Tue, 19 May 2020 10:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4477F80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 10:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4477F80110
IronPort-SDR: NlUJBrJBxnUNOOPbikgN6Mje/PD7EyHat/qh6mVUDoudh9osxHz9V3q0GeEuVhYduPDt+GlLzP
 WxXWAtWvYXDA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 01:30:36 -0700
IronPort-SDR: AQXqWabIG9YUNyN4LGq+DhgjSEPaAgzGHICFr/3PQwdOW1dL8+SZBpRnXzNjZGDuIWULwX77r9
 VgF0wrEZVgOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; d="scan'208";a="264233977"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga003.jf.intel.com with ESMTP; 19 May 2020 01:30:31 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/3] soundwire: add sysfs support
Date: Tue, 19 May 2020 04:35:48 +0800
Message-Id: <20200518203551.2053-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

Add soundwire sysfs support.

Pierre-Louis Bossart (3):
  soundwire: disco: s/ch/channels/
  soundwire: master: add sysfs support
  soundwire: add Slave sysfs support

 .../ABI/testing/sysfs-bus-soundwire-master    |  23 ++
 .../ABI/testing/sysfs-bus-soundwire-slave     |  91 ++++++
 drivers/soundwire/Makefile                    |   3 +-
 drivers/soundwire/bus.c                       |   1 +
 drivers/soundwire/bus.h                       |   1 +
 drivers/soundwire/bus_type.c                  |   9 +-
 drivers/soundwire/master.c                    |  84 +++++
 drivers/soundwire/mipi_disco.c                |  11 +-
 drivers/soundwire/sysfs_local.h               |  14 +
 drivers/soundwire/sysfs_slave.c               | 215 +++++++++++++
 drivers/soundwire/sysfs_slave_dpn.c           | 300 ++++++++++++++++++
 include/linux/soundwire/sdw.h                 |   8 +-
 12 files changed, 748 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-soundwire-master
 create mode 100644 Documentation/ABI/testing/sysfs-bus-soundwire-slave
 create mode 100644 drivers/soundwire/sysfs_local.h
 create mode 100644 drivers/soundwire/sysfs_slave.c
 create mode 100644 drivers/soundwire/sysfs_slave_dpn.c

-- 
2.17.1

