Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F23214F66A
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Feb 2020 05:22:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 050F415F9;
	Sat,  1 Feb 2020 05:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 050F415F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580530937;
	bh=VS3Ub+8yE6hKVPMWNQ/bERhRiLiU3wMIei+evs7Jkd0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gMbs10oMspxwTyLaMOhAyFe99UoUkneXjs3SfoawLVG4Gqi5YihWauMu91l2aih+J
	 XoZ6kU3RFaEXNX4FcaNAPvxh1XqNiKzVsqr1R0/YV5MeoZH2omjzU069sGTUyk6lzv
	 WCsfpVqu6SeBUQEZ+UMqb6nUbEp/h9Y6rdzarVBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95ED4F801A3;
	Sat,  1 Feb 2020 05:20:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51EC3F801F7; Sat,  1 Feb 2020 05:20:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C55D2F800D3
 for <alsa-devel@alsa-project.org>; Sat,  1 Feb 2020 05:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C55D2F800D3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 20:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,388,1574150400"; d="scan'208";a="218805370"
Received: from ydowling-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.199.23])
 by orsmga007.jf.intel.com with ESMTP; 31 Jan 2020 20:20:22 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 31 Jan 2020 22:20:09 -0600
Message-Id: <20200201042011.5781-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 0/2] soundwire: add master_device/driver
	support
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

The SoundWire master representation needs to evolve to take into account:

a) a May 2019 recommendation from Greg KH to remove platform devices

b) the need on Intel platforms to support hardware startup only once
the power rail dependencies are settled. The SoundWire master is not
an independent IP at all.

c) the need to deal with external wakes handled by the PCI subsystem
in specific low-power modes

In case it wasn't clear, the SoundWire subsystem is currently unusable
with v5.5 on devices hitting the shelves very soon (race conditions,
power management, suspend/resume, etc). v5.6 will only provide
interface changes and no functional improvement. We've circled on the
same concepts since September 2019, and I hope this direction is now
aligned with the suggestions from Vinod Koul and that we can target
v5.7 as the 'SoundWire just works(tm)' version.

This series is provided as an RFC since it depends on patches already
for review.

Pierre-Louis Bossart (2):
  soundwire: bus_type: add master_device/driver support
  soundwire: intel: transition to sdw_master_device/driver support

 drivers/soundwire/Makefile         |   2 +-
 drivers/soundwire/bus_type.c       | 141 +++++++++++++-
 drivers/soundwire/intel.c          |  96 ++++++----
 drivers/soundwire/intel.h          |   8 +-
 drivers/soundwire/intel_init.c     | 283 ++++++++++++++++++++++-------
 drivers/soundwire/master.c         | 119 ++++++++++++
 drivers/soundwire/slave.c          |   7 +-
 include/linux/soundwire/sdw.h      |  83 +++++++++
 include/linux/soundwire/sdw_type.h |  36 +++-
 9 files changed, 662 insertions(+), 113 deletions(-)
 create mode 100644 drivers/soundwire/master.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
