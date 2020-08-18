Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CEE2487D6
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 16:38:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6EEC176B;
	Tue, 18 Aug 2020 16:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6EEC176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597761480;
	bh=LjamWxOg98vcSqJtuYJhXzStZ7dX77gIUQ7V4UJ9rvI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NV/4eGiBKx/wJbtkUNZxZgm8XaPMJSdls4aLyCs5stYQutYQPvlCZPQGCnIo7ngNF
	 aNghBNcsjieqUZeigu38mECG82hHCguHcPTpMnzS1yrlQZC2CjbykOMNKvWQGPElj+
	 1Q9JsC6NeK+JPnq6/G2Zmu2gFNpCnOWYqC+AiW8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2C0CF80114;
	Tue, 18 Aug 2020 16:35:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D1D3F802C3; Tue, 18 Aug 2020 16:35:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02D03F80273
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 16:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02D03F80273
IronPort-SDR: Q8JrK5rRk9rfr9GZZs9Vbrvd/ykmv0L/rxQ/9BR6J1O7On1o/DtgNkXK8Q40892NOHFG46ljM5
 0Ylxzh01eUsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219223479"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="219223479"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:22 -0700
IronPort-SDR: mJdXbCWdxOR7a6Q4QjeYKaPcZxbFWdVEEGC0RP0aoEQ+EeiHREsNbOYHR2uyrXUIg5KeDuAppf
 QcCeS+6DyOqw==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="471830344"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 02/11] soundwire: intel: ignore software command retries
Date: Tue, 18 Aug 2020 10:41:11 +0800
Message-Id: <20200818024120.20721-3-yung-chuan.liao@linux.intel.com>
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

with multiple links synchronized in hardware, retrying commands in
software is not recommended.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index fe9b92fd48db..c9ba706e20c6 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1355,6 +1355,11 @@ static int intel_master_probe(struct platform_device *pdev)
 		dev_info(dev,
 			 "SoundWire master %d is disabled, will be ignored\n",
 			 bus->link_id);
+	/*
+	 * Ignore BIOS err_threshold, it's a really bad idea when dealing
+	 * with multiple hardware synchronized links
+	 */
+	bus->prop.err_threshold = 0;
 
 	return 0;
 }
-- 
2.17.1

