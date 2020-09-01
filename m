Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0068925A35D
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 04:58:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D6AC17B6;
	Wed,  2 Sep 2020 04:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D6AC17B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599015497;
	bh=KSMnZ+viPucbSV27h/KuEaROiGdoWMO72mdrwFI3oec=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oNsRIXQtFCmQ7zKfujyHHf86GbET7ijMFM6XJLNGBL9kjkvpt4EgB+2mrS+WR1umK
	 kswgsYoLDmrUY8zlCPHnjsQIpEjpzwsToa7z2NWwTQoOeje69Por9ZvWHWyX3kb7St
	 nLQ7i+CcObYLLZkMwYvagY+K+6HMSD7ZOVqQiWj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 843EFF80276;
	Wed,  2 Sep 2020 04:56:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47A27F80257; Wed,  2 Sep 2020 04:56:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 494C2F800F3
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 04:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 494C2F800F3
IronPort-SDR: jd/ZtT+k5fBjvmU3Utqy7PpDouyCEWw7+1R04rRPBmslRGrQ/YZg4ITLQa9vJJ5ZzT/w3jouBO
 8hDNfSg1teJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="158305740"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="158305740"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:56:23 -0700
IronPort-SDR: jBgxsSqL2oXJ/4EVq/a9gAZ4Edsb+NYd7YoMISZkZS6tdjBfayU4rHaIkvU+ySPF7v5UTEbSGS
 w5UMrrgpw8VA==
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="477457229"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:56:19 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/7] ASoC: soundwire: Move sdw stream operations to
Date: Tue,  1 Sep 2020 23:02:33 +0800
Message-Id: <20200901150240.19288-1-yung-chuan.liao@linux.intel.com>
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

sdw stream operation APIs can be called once per stream. dailink
callbacks are good places to call these APIs.

Pierre-Louis Bossart (7):
  ASoC: soc-dai: clarify return value for get_sdw_stream()
  soundwire: stream: fix NULL/IS_ERR confusion
  soundwire: intel: fix NULL/ERR_PTR confusion
  ASOC: Intel: sof_sdw: add dailink .trigger callback
  ASOC: Intel: sof_sdw: add dailink .prepare and .hw_free callback
  soundwire: intel: remove .trigger operation
  soundwire: intel: remove stream handling from .prepare and .hw_free

 drivers/soundwire/intel.c        | 60 ++++-------------------
 drivers/soundwire/stream.c       |  2 +-
 include/sound/soc-dai.h          |  3 +-
 sound/soc/intel/boards/sof_sdw.c | 81 ++++++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+), 54 deletions(-)

-- 
2.17.1

