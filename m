Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F339E24F3
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 23:10:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3192C1681;
	Wed, 23 Oct 2019 23:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3192C1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571865046;
	bh=ZK+/6euhVwECuvsd+Wtkf5U9Nwegtg2BdDkmwuY3UjM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vQgbzeNZ6cj0x5X6IPTwpjNx0o1Sxb2EYHrX1wM94vAiBTbfQ5oDJIN87ATUD2gF5
	 ++T615KqKomG0pIrO1w4HLEf+SWQCEcMOGiAJzDCWNi7fig7QDNGLpdcf29Hgj8wbV
	 hnWiQ9Adhxk1/gKYqed6p7ptoluhMbwCvZJgAZu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B200F80610;
	Wed, 23 Oct 2019 23:07:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB753F80321; Wed, 23 Oct 2019 23:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D41B7F80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 23:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D41B7F80274
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 14:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,222,1569308400"; d="scan'208";a="201260286"
Received: from ayamada-mobl1.gar.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.95.208])
 by orsmga003.jf.intel.com with ESMTP; 23 Oct 2019 14:07:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 23 Oct 2019 16:06:53 -0500
Message-Id: <20191023210657.32440-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/4] soundwire: update ASoC interfaces
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

We need new fields in existing structures to
a) deal with race conditions on codec probe/enumeration
b) allow for multi-step ACPI scan/probe/startup on Intel plaforms

To avoid conflicts between ASoC and Soundwire trees, these 4 patches
are provided out-of-order, before the functionality enabled in these
header files is added in follow-up patch series which can be applied
separately in the ASoC and Soundwire trees (of course after Vinod and
Mark sync-up so that these patches are present in both trees).

Pierre-Louis Bossart (3):
  soundwire: sdw_slave: add new fields to track probe status
  soundwire: add enumeration_complete structure
  soundwire: intel: update interfaces between ASoC and SoundWire

Rander Wang (1):
  soundwire: intel: update stream callbacks for hwparams/free stream
    operations

 drivers/soundwire/intel.c           |  20 ++++--
 drivers/soundwire/intel.h           |  13 ++--
 drivers/soundwire/intel_init.c      |  31 +++------
 include/linux/soundwire/sdw.h       |   7 ++
 include/linux/soundwire/sdw_intel.h | 103 +++++++++++++++++++++++++---
 5 files changed, 131 insertions(+), 43 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
