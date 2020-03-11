Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4C5182480
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 23:12:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6B8716A3;
	Wed, 11 Mar 2020 23:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6B8716A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583964755;
	bh=MEl6cheR04gRnsnGdPtft5w9xx8IFGiqZhngw+/fBPA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RSnjhnk8KG4U54Og2Y0ISYjaNL1Y0/BqmpJ3lEpWQTYCVTuZJW1qKCiwMG4bRlMxj
	 YoyfOzG2r0eMDQgLWxL9ofn63WtIkfoPmoRa/fE3nrExZjFrJ3CYPfGTrzmOSSN0EE
	 GPg7EsdFjTAUtq3M55VaXOEikP9mDUwmMhQ4yFFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAB97F800BE;
	Wed, 11 Mar 2020 23:10:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D8EDF800B5; Wed, 11 Mar 2020 23:10:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03D89F800B5
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 23:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D89F800B5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 15:10:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,542,1574150400"; d="scan'208";a="277550528"
Received: from fjan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.25.157])
 by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2020 15:10:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] SoundWire: intel: fix SHIM programming sequences
Date: Wed, 11 Mar 2020 17:10:19 -0500
Message-Id: <20200311221026.18174-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
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

The low-level register programming sequences contributed in
71bb8a1b059ecd ('soundwire: intel: Add Intel Master driver') do not
follow the internal documentation and recommended flows. It's anyone's
guess how the code might have worked. Fix and add all missing helpers
for clock-stop and hardware-based synchronization.

This patchset needs to be applied on top of "[PATCH 00/16] SoundWire:
cadence: add clock stop and fix programming sequences"

Reviewers might object that the code is provided without some required
initializations for mutexes and shim masks, they will be added as part
of the transition to sdw_master_device - still stuck as of 3/11.

Pierre-Louis Bossart (6):
  soundwire: intel: add helpers for link power down and shim wake
  soundwire: intel: reuse code for wait loops to set/clear bits
  soundwire: intel: add mutex to prevent concurrent access to SHIM
    registers
  soundwire: intel: add definitions for shim_mask
  soundwire: intel: introduce a helper to arm link synchronization
  soundwire: intel: introduce helper for link synchronization

Rander Wang (1):
  soundwire: intel: follow documentation sequences for SHIM registers

 drivers/soundwire/intel.c           | 342 ++++++++++++++++++++++------
 drivers/soundwire/intel.h           |   4 +
 include/linux/soundwire/sdw_intel.h |   2 +
 3 files changed, 277 insertions(+), 71 deletions(-)

-- 
2.20.1

