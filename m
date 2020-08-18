Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4952487E7
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 16:40:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9677A1774;
	Tue, 18 Aug 2020 16:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9677A1774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597761626;
	bh=WXjVi96/Vn4YR93MivmQWoymyNJNRqmvxeW69w5zm5o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BD9ep8gQFIBIhwX4ksgmCgLe/xuGxQUotPuOfNI4uKMzIOzBxwyv52Akx/VD+Y4PA
	 pkkHelhZCN0SgIYG8tYlExIxSuu2kZcKPuHoGYAt8ODFkKTkfzmrf8IYZr8zZ5l7cZ
	 nz7Sovkz6TEI6a9QLg8jFxmHSOgVtbVgTW+zbjbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFCB5F802FD;
	Tue, 18 Aug 2020 16:35:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF3FEF802EB; Tue, 18 Aug 2020 16:35:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F452F8029A
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 16:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F452F8029A
IronPort-SDR: 6eDQ/3AI0q9pAM3kBg0E//A5A6aNmKRN6S2LoLm9+0Qz4N4jS9Q+xFAHu1+lL8Qi5+t1+Ye4c3
 JwyxPRzaIn6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219223530"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="219223530"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:39 -0700
IronPort-SDR: Nm5sXXdIiKloF9WkqN4c5PIQZLYiuslrQENHSkOpmHr6kagJ77jfHpkmRUNlSd2RYqyvt7HdB5
 OZGwBLlp9tDw==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="471830602"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 06/11] soundwire: intel: add multi-link hw_synchronization
 information
Date: Tue, 18 Aug 2020 10:41:15 +0800
Message-Id: <20200818024120.20721-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

set the flags as required by hardware implementation

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index f4441684bd7e..89a8ad1f80e8 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1400,7 +1400,14 @@ int intel_master_startup(struct platform_device *pdev)
 		dev_dbg(dev, "Multi-link is disabled\n");
 		bus->multi_link = false;
 	} else {
+		/*
+		 * hardware-based synchronization is required regardless
+		 * of the number of segments used by a stream: SSP-based
+		 * synchronization is gated by gsync when the multi-master
+		 * mode is set.
+		 */
 		bus->multi_link = true;
+		bus->hw_sync_min_links = 1;
 	}
 
 	/* Initialize shim, controller */
-- 
2.17.1

