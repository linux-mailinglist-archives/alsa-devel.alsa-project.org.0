Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AED25A3CC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 05:07:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7598A1802;
	Wed,  2 Sep 2020 05:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7598A1802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599016055;
	bh=bQ2O3tXRTtXgin0JBoVJcBbXpwywCmGbImHvQvRud6o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=shDVMdsfRwNcJQCdLt2CU/q4Zhy/n57O4uGEADi9tkFHIWeKNMSJP5KwlMPhX/xND
	 9u/rSsdBb98i9lcAhyP7V/1z3nfjs4c7YjTRw78lCDY5ga/YI4IaNlsySQdC3xpk7m
	 QqneIczixA79fxOCNItxM+bYqBspyiBfJTaJhIvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C6F2F80339;
	Wed,  2 Sep 2020 05:00:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54C7EF802BC; Wed,  2 Sep 2020 05:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2515F80276
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 05:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2515F80276
IronPort-SDR: oEBEGtRLYP3rvJQm0g2bq7KhDUKpo2kpR8dmUuxf/o6Da026Xx/2MT9frv8UxW/rw56DAHo8Lv
 /C1jhVqfXf0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="156570803"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="156570803"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 20:00:15 -0700
IronPort-SDR: 9lZj3htYvueS7CIfcd2HU7Kl1IO37BAJ9u3WUipgf473BJRT+7yMUvw+bKrIIY4Qyw+NjR5OEf
 C1wsU6uNjAnA==
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="283588236"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 20:00:11 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 09/10] soundwire: intel: pass link_mask information to each
 master
Date: Tue,  1 Sep 2020 23:05:55 +0800
Message-Id: <20200901150556.19432-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901150556.19432-1-yung-chuan.liao@linux.intel.com>
References: <20200901150556.19432-1-yung-chuan.liao@linux.intel.com>
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

While the hardware exposes independent bits to power-up each master,
the recommended sequence is to power all links or none. Idle links can
still use the clock stop mode while the master is powered.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.h      | 2 ++
 drivers/soundwire/intel_init.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 23daab9da329..76820d0b9deb 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -18,6 +18,7 @@
  * @shim_lock: mutex to handle access to shared SHIM registers
  * @shim_mask: global pointer to check SHIM register initialization
  * @clock_stop_quirks: mask defining requested behavior on pm_suspend
+ * @link_mask: global mask needed for power-up/down sequences
  * @cdns: Cadence master descriptor
  * @list: used to walk-through all masters exposed by the same controller
  */
@@ -33,6 +34,7 @@ struct sdw_intel_link_res {
 	struct mutex *shim_lock; /* protect shared registers */
 	u32 *shim_mask;
 	u32 clock_stop_quirks;
+	u32 link_mask;
 	struct sdw_cdns *cdns;
 	struct list_head list;
 };
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index add46d8fc85c..65d9b9bd2106 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -255,6 +255,7 @@ static struct sdw_intel_ctx
 		link->clock_stop_quirks = res->clock_stop_quirks;
 		link->shim_lock = &ctx->shim_lock;
 		link->shim_mask = &ctx->shim_mask;
+		link->link_mask = link_mask;
 
 		memset(&pdevinfo, 0, sizeof(pdevinfo));
 
-- 
2.17.1

