Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B18AF1EB9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 20:26:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE3F61675;
	Wed,  6 Nov 2019 20:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE3F61675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573068406;
	bh=i2Zl3ZLytGT1IclXOnc/lLe4vdwavyrMiMX6HY682nM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ehYgm+utpm5kvYFS1o2U3JqLwIFI91EeJRlmWm2fqvG0nDAKNBEM6buu/LlsCEP3M
	 fedIHvN/yaeKBBua7cGyL5qNEabt9EIyRAlu/3/3psbn8smlbsfocMTVjr63+ke5c3
	 m71XhDbffspQBDnoZEb5UfAMvqVFgDBaawFISpRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34628F8060D;
	Wed,  6 Nov 2019 20:22:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66736F8060F; Wed,  6 Nov 2019 20:22:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B62EDF805FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 20:22:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B62EDF805FE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 11:22:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="403835062"
Received: from vidhipat-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.33.70])
 by fmsmga006.fm.intel.com with ESMTP; 06 Nov 2019 11:22:27 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 13:22:04 -0600
Message-Id: <20191106192223.6003-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 00/19] soundwire: code hardening and
	suspend-resume support
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

this patchset applies on top of "[PATCH v2 00/14] soundwire: intel:
implement new ASoC interfaces".

It implements a series of improvements for:
a) interrupt handling on Intel platforms in MSI mode
b) race conditions on codec probe and enumeration
c) suspend-resume issues (clock-stop mode not supported for now)
d) underflow handling
e) updates to the stream state machine which did not support valid
ALSA transitions.

These patches were tested extensively on 4 different platforms and are
viewed as required for any sort of SoundWire-based product.

Changes since v1: (no feedback received since October 23)
added support for initialization_complete, integration with Realtek
codecs exposed an additional race condition between the resume
operation and restoration of settings in separate thread triggered by
Slave status change.
No other functional change

Bard Liao (3):
  soundwire: intel/cadence: fix timeouts in MSI mode
  soundwire: stream: only prepare stream when it is configured.
  soundwire: intel: reinitialize IP+DSP in .prepare()

Pierre-Louis Bossart (16):
  soundwire: fix race between driver probe and update_status callback
  soundwire: bus: add PM/no-PM versions of read/write functions
  soundwire: bus: write Slave Device Number without runtime_pm
  soundwire: intel: add helpers for link power down and shim wake
  soundwire: intel: Add basic power management support
  soundwire: intel: add pm_runtime support
  soundwire: intel: reset pm_runtime status during system resume
  soundwire: bus: add helper to reset Slave status to UNATTACHED
  soundwire: intel: call helper to reset Slave states on resume
  soundwire: bus: check first if Slaves become UNATTACHED
  soundwire: add enumeration_complete signaling
  soundwire: bus: add initialization_complete signaling
  soundwire: intel: disable pm_runtime when removing a master
  soundwire: bus: disable pm_runtime in sdw_slave_delete
  soundwire: stream: update state machine and add state checks
  soundwire: stream: do not update parameters during DISABLED-PREPARED
    transition

 Documentation/driver-api/soundwire/stream.rst |  63 +++-
 drivers/soundwire/bus.c                       | 165 +++++++--
 drivers/soundwire/bus.h                       |   3 +
 drivers/soundwire/bus_type.c                  |   5 +
 drivers/soundwire/cadence_master.c            |  17 +-
 drivers/soundwire/cadence_master.h            |   4 +
 drivers/soundwire/intel.c                     | 328 ++++++++++++++++--
 drivers/soundwire/intel.h                     |   2 +
 drivers/soundwire/intel_init.c                |  45 ++-
 drivers/soundwire/slave.c                     |   4 +
 drivers/soundwire/stream.c                    |  64 +++-
 include/linux/soundwire/sdw.h                 |   1 +
 include/linux/soundwire/sdw_intel.h           |   2 +
 13 files changed, 632 insertions(+), 71 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
