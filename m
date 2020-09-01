Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6609C25A37F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 05:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15CEC17FC;
	Wed,  2 Sep 2020 05:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15CEC17FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599015758;
	bh=4vtGfIdZrLIc3DH2F9sGX2FuPh5mfwBxhkaD315Jjy8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qo4YzJ2VtK7iDfQBUQGynHwUzi8lnDKWH+6i8g7IyUE9NZ17Wn2uuiUnM37TxPLN9
	 5LtVS0c3ahaWXiVVcDIxpLzYMq4EC+bIu1Dr+OLWZ6pme7U1887CV/x7XyMoGmWGmi
	 GFA8O15XMagkobcq3HAZBlHyPOqyh9BnlHPKpulM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64F5CF802C3;
	Wed,  2 Sep 2020 04:59:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20372F80257; Wed,  2 Sep 2020 04:59:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29F34F80257
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 04:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29F34F80257
IronPort-SDR: 5JyI7qQzurZh0aiHSpGBE2feMUFS6W+6cYmbhO5ywLhj1nUO3bJBwWq8thBBvXqgwYQDlXZjmA
 EbiNRl2BRrUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="156570733"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="156570733"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:59:41 -0700
IronPort-SDR: X1MPTE871sdBV602QOuRg/Z+4KIzvdTh0vbysOTn9EZ6QIu/qCWFWvZsTZttAQuaUDrKxNd09Y
 e4XfPd5FfGoA==
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="283588046"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:59:37 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 00/10] soundwire: intel: add multi-link support
Date: Tue,  1 Sep 2020 23:05:46 +0800
Message-Id: <20200901150556.19432-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

This series enables multi-link support for Intel platforms.

Changes in v2:
- Remove the "soundwire: intel: Only call sdw stream APIs for the first
  cpu_dai" patch form this series. We will move the sounwdire stream
  operations to machine driver in another series.
- Update the commit message and title of "soundwire: intel: add error log
  for clock-stop invalid configs"

Pierre-Louis Bossart (10):
  soundwire: intel: disable shim wake on suspend
  soundwire: intel: ignore software command retries
  soundwire: intel: add multi-link support
  soundwire: intel: add missing support for all clock stop modes
  soundwire: bus: update multi-link definition with hw sync details
  soundwire: intel: add multi-link hw_synchronization information
  soundwire: stream: enable hw_sync as needed by hardware
  soundwire: intel: add error log for clock-stop invalid configs
  soundwire: intel: pass link_mask information to each master
  soundwire: intel: don't manage link power individually

 drivers/soundwire/intel.c      | 264 ++++++++++++++++++++++++++++-----
 drivers/soundwire/intel.h      |   2 +
 drivers/soundwire/intel_init.c |   1 +
 drivers/soundwire/stream.c     |  15 +-
 include/linux/soundwire/sdw.h  |   6 +
 5 files changed, 243 insertions(+), 45 deletions(-)

-- 
2.17.1

