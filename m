Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A432D3AA0
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 06:36:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 112F116DA;
	Wed,  9 Dec 2020 06:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 112F116DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607492216;
	bh=tWKneUxYJkSM1u0rWOK1pKsWdt7p2csPClnmdcplUI0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kI/UN3PBTLKOkwuD8Rga7NwbjxyaJs9Y3p0fa13qekIn/Q+b3HttquFvRfE8b1lXF
	 /27q4WxxCbiA2l2SI9Zfc8mKy1EouqJCcTDQJq5OBCGcQ0d53SGXFhI5ZrWPZjosYC
	 fdlffsKhEJMAuml11/e63ZD8oFLmHbiOSXn8ZiQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 710BAF80227;
	Wed,  9 Dec 2020 06:35:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F970F80217; Wed,  9 Dec 2020 06:35:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15F42F800EF
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 06:35:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15F42F800EF
IronPort-SDR: Gg1j4tRY71gwnR/mvcMp7T9IgXl+RkhGDBiPFgchlUnj0ZWRPyigJuUo4MrY4x111lTae4eBvs
 3/JCekxaENyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="153258974"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="153258974"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:35:09 -0800
IronPort-SDR: 9BujQTugYI4F6TxRMgLypp+yg5AquOmJmtBNYa8+psoQM10SUE7R/27xy3kOR51Ps0LlZ5beao
 dZhZd2We/tUg==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="363989360"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:35:06 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/9] soundwire/regmap: use _no_pm routines
Date: Wed,  9 Dec 2020 13:34:50 +0800
Message-Id: <20201209053459.5515-1-yung-chuan.liao@linux.intel.com>
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

