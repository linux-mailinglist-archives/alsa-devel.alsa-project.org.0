Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA8C2FFD08
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 08:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 497E01AAB;
	Fri, 22 Jan 2021 08:06:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 497E01AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611299256;
	bh=tWKneUxYJkSM1u0rWOK1pKsWdt7p2csPClnmdcplUI0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b5Z9rzZr6PLC5fFISupC92zytVwseSdQpknLWvnaP6EtwZpc8C05GY2xpdS7GnVIp
	 BBYLAPC63OY7ltQpGnwuNePzDVik/G5KVDnkX+8vPtOm8IWsUDQZjeKvDWwhMmkaUY
	 ZrORGfYMtwHDkI839xaVPtCc7rdqOHdeD4ooRzZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49E80F80290;
	Fri, 22 Jan 2021 08:06:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8FF7F80218; Fri, 22 Jan 2021 08:06:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C6B3F80166
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 08:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C6B3F80166
IronPort-SDR: TbHb1SnSX+1WYAXOWQU9VjHvYEiVGuOk69yaeq4ICPSM1PtWliD1Z3LqW2mnj4mgLl41TdFGD0
 PBDsIGcri0vw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="167079270"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="167079270"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 23:06:30 -0800
IronPort-SDR: 7I9kylbZRSajNoXgdDKC9QMSqWPgHqgn1nduawS4rEEdTyaF+74oryPAQLfEFZFGB+j/W/Gq2s
 DdAaOaRhaFNw==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="427863354"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 23:06:27 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH v2 0/9] soundwire/regmap: use _no_pm routines
Date: Fri, 22 Jan 2021 15:06:25 +0800
Message-Id: <20210122070634.12825-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
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

When a Slave device is resumed, it may resume the bus and restart the
enumeration. And Slave drivers will wait for initialization_complete
complete in their resume function, however initialization_complete will
complete after sdw_update_slave_status function is finished and codec
driver usually call some IO functions in the update_status callback
function.
It will become a deadlock if we use regular read/write routines during
the resuming process.

This series touches both soundwire and regmap trees.
commit fb5103f9d6ce ("regmap/SoundWire: sdw: add support for SoundWire 1.2 MBQ")
is needed for soundwire tree to complie.
On the other hands,
commit 6e06a85556f9 ("soundwire: bus: add comments to explain interrupt loop filter")
to
commit 47b8520997a8 ("soundwire: bus: only clear valid DPN interrupts")
are needed for regmap tree.

v2:
 - Separate commits according to maintainer's comments.

Bard Liao (4):
  soundwire: export sdw_write/read_no_pm functions
  regmap: sdw: use _no_pm functions in regmap_read/write
  regmap: sdw: use no_pm routines for SoundWire 1.2 MBQ
  regmap: sdw-mbq: use MODULE_LICENSE("GPL")

Pierre-Louis Bossart (5):
  soundwire: bus: use sdw_update_no_pm when initializing a device
  soundwire: bus: use sdw_write_no_pm when setting the bus scale
    registers
  soundwire: bus: use no_pm IO routines for all interrupt handling
  soundwire: bus: fix confusion on device used by pm_runtime
  soundwire: bus: clarify dev_err/dbg device references

 drivers/base/regmap/regmap-sdw-mbq.c |  10 +-
 drivers/base/regmap/regmap-sdw.c     |   4 +-
 drivers/soundwire/bus.c              | 136 +++++++++++++++------------
 include/linux/soundwire/sdw.h        |   2 +
 4 files changed, 85 insertions(+), 67 deletions(-)

-- 
2.17.1

