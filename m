Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A265740D7
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 03:12:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2ADF175D;
	Thu, 14 Jul 2022 03:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2ADF175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657761161;
	bh=64zHAd0VO/In2o8u2a2F5KFDhUcSaQ7u0ws37chHb6o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fspjUYGvlnZw6VkzNFKUFyTm3GxJyyfR0wbyw1KpaRB7X/lLAgRaUGgknu4xILdq4
	 kHaoxRYMk2uc27oPsn02nJSpKDaMRQmfNgmMd76RMt3uQB64AeyzLJwN5Zp33v3ce0
	 KHlNeK6rtVbX22rtYaO0LVe3Vtze+qmoPXx4LTI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0C6EF80254;
	Thu, 14 Jul 2022 03:11:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C52BF80544; Thu, 14 Jul 2022 03:11:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 446EFF80254
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 03:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 446EFF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="d+tHlUmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657761059; x=1689297059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=64zHAd0VO/In2o8u2a2F5KFDhUcSaQ7u0ws37chHb6o=;
 b=d+tHlUmi5Gb7ai7+q9B4mFddh9IC+6KpRvW1+RZJngby2nJnVUxVh3V5
 mlPhipO7V8eFKJFvYoQ2cCpYsG0oWN9wm66Sa4CFDu8zcrW7Zu19BJbaB
 +Wg7R0BvdBWGx/Do8l50AytXp1EzrYa3pl1CzWFPN6VjtvK5r7qn2bDHm
 PTlwwzx6nL11tHfK8Ko5MlxyoWFbzcquI4tQaTp1aPkByd1o3SR+ZvGkq
 edwAya8UmCkMKFhZeX1eOZ3S/gx7I+YgHZgg6cBRS/Htzde8wvAd8YBVE
 96C2fdWsTQF9eVHKTqXrHyMXsZxDAMtF1C9gkFlRN7VSflMAhbtl7uhXp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="347066132"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="347066132"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:10:54 -0700
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="593192522"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:10:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/4] soundwire: intel/cadence: expose PING status in manager
 ops
Date: Thu, 14 Jul 2022 09:10:41 +0800
Message-Id: <20220714011043.46059-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
References: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, bard.liao@intel.com
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

Simple indirection to existing register.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 8 ++++++++
 drivers/soundwire/cadence_master.h | 2 ++
 drivers/soundwire/intel.c          | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 4fbb19557f5e..615b0b63a3e1 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -756,6 +756,14 @@ cdns_reset_page_addr(struct sdw_bus *bus, unsigned int dev_num)
 }
 EXPORT_SYMBOL(cdns_reset_page_addr);
 
+u32 cdns_read_ping_status(struct sdw_bus *bus)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+
+	return cdns_readl(cdns, CDNS_MCP_SLAVE_STAT);
+}
+EXPORT_SYMBOL(cdns_read_ping_status);
+
 /*
  * IRQ handling
  */
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 595d72c15d97..ca9e805bab88 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -177,6 +177,8 @@ enum sdw_command_response
 cdns_xfer_msg_defer(struct sdw_bus *bus,
 		    struct sdw_msg *msg, struct sdw_defer *defer);
 
+u32 cdns_read_ping_status(struct sdw_bus *bus);
+
 int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params);
 
 int cdns_set_sdw_stream(struct snd_soc_dai *dai,
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 25b27cd1be1d..e1e943396e36 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1255,6 +1255,7 @@ static struct sdw_master_ops sdw_intel_ops = {
 	.set_bus_conf = cdns_bus_conf,
 	.pre_bank_switch = intel_pre_bank_switch,
 	.post_bank_switch = intel_post_bank_switch,
+	.read_ping_status = cdns_read_ping_status,
 };
 
 static int intel_init(struct sdw_intel *sdw)
-- 
2.25.1

