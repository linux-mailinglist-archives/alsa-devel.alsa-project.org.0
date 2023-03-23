Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A06286C5F09
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:37:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D473BEDB;
	Thu, 23 Mar 2023 06:36:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D473BEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549855;
	bh=gtkWDGGprYUCa/NujUo+nrfpqYowlmMRMlh2EJAtBoc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=btyr03yke8troxxxE8gtzEp+CZvxmPbtE2Rj1fQDYzokfCaIr96su+F9FlucxILQa
	 UlUp3lQHEUgQP7kOzGriP2t8zxnViCp9Gcz+qTySZCJ9DapJH9ko/penavzoW7GIVH
	 QbLPIEBdxgHu8NRlCSQ4gvEN6UPY69XpiT1xYJzM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 561BEF805B1;
	Thu, 23 Mar 2023 06:33:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C64CF80482; Thu, 23 Mar 2023 06:31:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91C14F804B1
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91C14F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EZ2GdjCx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549443; x=1711085443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gtkWDGGprYUCa/NujUo+nrfpqYowlmMRMlh2EJAtBoc=;
  b=EZ2GdjCx92Qbq9M3HBUqNoc+geZTyCCKBg51rRY+soxSFBv2gALVPHJi
   mXb3sxuJqh2QWEOmP0BVqSbCdfz6yTKksRVD1nYE3v5ORkx4KS7w58+Gl
   cUittRpFQEVo4t9QPpYwfI/BY92ICXb6ha9aVB4oSLhV4WBr9cYi5Vir6
   nk0LyJk/xwVnmH5RM/5CcU5tY7avrOMy27wZX4zFPN0ndVcz5JFnSVArz
   lvBJmJV+cVRfoJoTGq7wpGjvDjTcPJRKaNzZsu3yFlFpKh+ZmvabZtDz5
   2s+SEbbhuJHjr2HDorSA4oi3MQcQtN0hM1cTQ4AfOvObZ/9XSlcM8kKeN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779507"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779507"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567269"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567269"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 19/20] soundwire: bus: add new manager callback to deal with
 peripheral enumeration
Date: Thu, 23 Mar 2023 13:44:51 +0800
Message-Id: <20230323054452.1543233-20-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQI5L32IEAWYUNMZYHFI3SPXUKKL45V5
X-Message-ID-Hash: ZQI5L32IEAWYUNMZYHFI3SPXUKKL45V5
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQI5L32IEAWYUNMZYHFI3SPXUKKL45V5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

When a peripheral reports as ATTACHED, the manager may need to follow
a programming sequence, e.g. to assign DMA resources and/or assign a
command queue for that peripheral.

This patch adds an optional callback, which will be invoked every time
the peripheral attaches. This might be overkill in some scenarios, and
one could argue that this should be invoked only on the first
attachment. The bus does not however track this first attachment with
any existing state-mirroring variable, and using dev_num_sticky would
not work across suspend-resume cycles.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c       | 3 +++
 include/linux/soundwire/sdw.h | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index b6aca59c3130..35f49bcc53e5 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -716,6 +716,9 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 	/* After xfer of msg, restore dev_num */
 	slave->dev_num = slave->dev_num_sticky;
 
+	if (bus->ops && bus->ops->new_peripheral_assigned)
+		bus->ops->new_peripheral_assigned(bus, dev_num);
+
 	return 0;
 }
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index ef645de13ae9..c076a3f879b3 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -846,6 +846,7 @@ struct sdw_defer {
  * @post_bank_switch: Callback for post bank switch
  * @read_ping_status: Read status from PING frames, reported with two bits per Device.
  * Bits 31:24 are reserved.
+ * @new_peripheral_assigned: Callback to handle enumeration of new peripheral.
  */
 struct sdw_master_ops {
 	int (*read_prop)(struct sdw_bus *bus);
@@ -860,7 +861,7 @@ struct sdw_master_ops {
 	int (*pre_bank_switch)(struct sdw_bus *bus);
 	int (*post_bank_switch)(struct sdw_bus *bus);
 	u32 (*read_ping_status)(struct sdw_bus *bus);
-
+	void (*new_peripheral_assigned)(struct sdw_bus *bus, int dev_num);
 };
 
 /**
-- 
2.25.1

