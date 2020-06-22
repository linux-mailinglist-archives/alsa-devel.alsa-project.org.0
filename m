Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC611204DBA
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 11:19:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B9E416EB;
	Tue, 23 Jun 2020 11:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B9E416EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592903980;
	bh=ZegUwqEElg3gKK8dy86QT0vutIMwXLEPuZ4RTQcSksk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UMtpkid+CqQEks2P68Il4a7cjLdL64f7N9hzT6mMGiug652fnr3Da4/P0OoxZ2tBS
	 /isjx4ylASDGMCK4aQLzSPwzUll4ArH7tNMMUPaUomFRVVQ2cWTykXYfhbOJQ3uVGa
	 vtPhQtVo3BnHoBoXRuc0yCCBG1OAkg32AJ4k4xo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D99BF80218;
	Tue, 23 Jun 2020 11:17:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADD78F8023E; Tue, 23 Jun 2020 11:17:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E404F8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 11:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E404F8012F
IronPort-SDR: O31I2DveV3Ic48R2NBO7VR4/x2iv9mRqvDRwX0tBPtwZE+PtI1NKXevFgwct4Ad2Tv8cXXlqlk
 x4NWFbwvfLqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="145508111"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="145508111"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 02:17:44 -0700
IronPort-SDR: 2kj/eADqW2B3uTAOl55PSr3BlU1DyZYy+sucwVHhVgIPMgaibb7jrUZB/V9eiQCu6+oLcdebpP
 25C/lwg++/xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="293141959"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga002.jf.intel.com with ESMTP; 23 Jun 2020 02:17:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/5] soundwire: handle stream at the dailink level
Date: Tue, 23 Jun 2020 05:23:27 +0800
Message-Id: <20200622212332.16277-1-yung-chuan.liao@linux.intel.com>
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

Currently, stream is handled at the dai level. But we have to handle
stream at the dailink level in the multi-cpu dailink usage.

Pierre-Louis Bossart (5):
  soundwire: intel: implement get_sdw_stream() operations
  soundwire: stream: add helper to startup/shutdown streams
  soundwire: intel: remove stream allocation/free
  soundwire: cadence: allocate/free dma_data in set_sdw_stream
  soundwire: intel: don't free dma_data in DAI shutdown

 drivers/soundwire/cadence_master.c | 52 ++++++++++++-----
 drivers/soundwire/intel.c          | 82 +++++++--------------------
 drivers/soundwire/stream.c         | 90 ++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw.h      |  2 +
 4 files changed, 149 insertions(+), 77 deletions(-)

-- 
2.17.1

