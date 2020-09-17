Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC3B26E030
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 18:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8522416D2;
	Thu, 17 Sep 2020 18:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8522416D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600358549;
	bh=m5Oyj+O3xXlkJQiOofPYHaEzshYYinxIc0RDLpBeSHc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a39XvI4QJpwjnXKaRsYUwesyZdC5u/CARdW81BJA7uQ+wtuquQJEX6VgBTqcZeRTo
	 bJgIHLCXHR/K+0SMBzg3ieXjD/To5cVoHu/tcp6XT2RCi+1vKWJHDvB2efbV4n5Otx
	 Mcrizy/Rmx/LlwqohJSVC8FxbBcXvfIciaDHMV6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83362F801EC;
	Thu, 17 Sep 2020 18:00:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C2EAF80212; Thu, 17 Sep 2020 18:00:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BB25F800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 18:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BB25F800E8
IronPort-SDR: zlKfIb7317+QEKq5fHOFRb4exTJ9B59MFeUMjc/g4Zm12sBaxzU3VLEuiXwHJfsiURbJW5aTKL
 diiGhsKd1zZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="159030320"
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="159030320"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 09:00:21 -0700
IronPort-SDR: jfQt4XDJ/hWvVmSfzXoAZZG3lGrX2JjZLIKcTgEPL2uCFRSuh/OVnZ/JXU8ibfOAtKs25tMD5Z
 5yo/OdNUby4g==
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="483800845"
Received: from apauly-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.96.60])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 09:00:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH v2 0/2] soundwire: sysfs: expose device number and status
Date: Thu, 17 Sep 2020 11:00:05 -0500
Message-Id: <20200917160007.153106-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
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

This patchset combines three contributions:

Srinivas Kandagalta suggested creating a device even it's detected on
the bus but not described in platform firmware. I suggested adding the
device number and status to show the difference with 'ghost' devices,
described in firmware but not physically present. Vinod suggested a
simpler way to report the status.

I did not keep Vinod's patch separate since it was using the same
group attribute as the other properties, which prevents status and
device number from being reported if there is no firmware and no
driver.

These patches were tested on Qualcomm and Intel platforms.

v2: as suggested by GregKH, add attribute group by default by setting
the groups pointer at the device level.

Pierre-Louis Bossart (1):
  soundwire: sysfs: add slave status and device number before probe

Srinivas Kandagatla (1):
  soundwire: bus: add enumerated Slave device to device list

 .../ABI/testing/sysfs-bus-soundwire-slave     | 18 ++++++
 drivers/soundwire/bus.c                       |  9 +++
 drivers/soundwire/bus.h                       |  2 +
 drivers/soundwire/bus_type.c                  |  9 +++
 drivers/soundwire/slave.c                     |  6 +-
 drivers/soundwire/sysfs_local.h               |  4 ++
 drivers/soundwire/sysfs_slave.c               | 59 ++++++++++++++++++-
 7 files changed, 104 insertions(+), 3 deletions(-)

-- 
2.25.1

