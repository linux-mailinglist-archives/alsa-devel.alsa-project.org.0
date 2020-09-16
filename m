Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C44226CADD
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 22:17:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9F9A1663;
	Wed, 16 Sep 2020 22:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9F9A1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600287439;
	bh=SEykqkMlbf7jK5NYdJvHRQyrJEk3Tiqkcd/67RXlUpI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GRYw+bWuv29i+vcBVKiWP4diKgIqQlG/ol6ds7AFzLrkO9rYdeRf7ZfJ6ZXh0M/tD
	 TrVyBWlp384PZAJd3agRcATZTz+8Z9xWgv2/EY9frfYJhFq2jRVMqaEzAkYZxURWQM
	 8WqQrBLRrDT/7/gCk6YfbThxTn+4VNz2ChnDNMeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8CA1F800E8;
	Wed, 16 Sep 2020 22:15:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D68BF8015D; Wed, 16 Sep 2020 22:15:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91A15F800F1
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 22:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91A15F800F1
IronPort-SDR: 0GTOp+IKWaqXWKykUfmFj6WSHZLQPXxEGR/YhDOxZLIkfgZsDuOlibiZpwm+Zays05yWxTYPG6
 wqk28Zw25QMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139567006"
X-IronPort-AV: E=Sophos;i="5.76,434,1592895600"; d="scan'208";a="139567006"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 13:15:16 -0700
IronPort-SDR: vcuJccrSuourtg6/yoYe6ZtG1kk/SHflrPGOtYIQiLSgZuF4XdAltUgaG2mjpRj/rVul69lA0w
 fZxSQ1v8o0Hw==
X-IronPort-AV: E=Sophos;i="5.76,434,1592895600"; d="scan'208";a="451997714"
Received: from yipengwa-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.60.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 13:15:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH 0/2] soundwire: sysfs: expose device number and status
Date: Wed, 16 Sep 2020 15:15:02 -0500
Message-Id: <20200916201504.52211-1-pierre-louis.bossart@linux.intel.com>
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

Srinivas Kandagalta suggested creating a device when it's detected on
the bus but not described in platform firmware. I suggested adding the
device number and status to show the difference with 'ghost' devices,
described in firmware but not physically present. Vinod suggested a
simpler way to report the status.

I did not keep Vinod's patch separate since it was using the same
group attribute as the other properties, which prevents status and
device number from being reported if there is no firmware and no
driver.

These patches provide a nice addition for integrators/tests and were
tested on Qualcomm and Intel platforms. Thanks Srinivas for the
initial idea!

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
 drivers/soundwire/sysfs_slave.c               | 64 ++++++++++++++++++-
 7 files changed, 109 insertions(+), 3 deletions(-)

-- 
2.25.1

