Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39E707800
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 04:22:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0C92206;
	Thu, 18 May 2023 04:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0C92206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684376551;
	bh=hC2J1w9UVcDCukApVbW8vB9WSP4jIPusaB43jqHzChY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gn3hSou2NOuJjR0YHWl29r5JqJiHL6hkUfI4fXI896RkRakwEGIXd/JblSqK6F2zY
	 ygv8u0n3WiaYvKGSC0dhM1eppTvRZf1AixAkULThefH6IvQ6CzCNJMsNc1auxV341k
	 KYqif7turitp5S7zNY+QxYD/0u5hJ7ZUtLU6T7EE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D8EBF8057C; Thu, 18 May 2023 04:21:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 893F7F80570;
	Thu, 18 May 2023 04:20:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57984F80549; Thu, 18 May 2023 04:20:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5637AF8025A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 04:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5637AF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MNbmNaNG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684376443; x=1715912443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hC2J1w9UVcDCukApVbW8vB9WSP4jIPusaB43jqHzChY=;
  b=MNbmNaNGpXeQg0iXQRDvmGsuTZZkAnqbe5FrkWUK6vtSEzIB7kgLEsOw
   s1sNv1jGqMQun14+4fRD1XQsMTTCQSMhRK0pHdFS491DlA5iQlDMgZ1iG
   7E0CHPC5zs60ZWlyQJOw3MgqbjZt1+6iZwfNXzRHCHprCmH3gW5A1Qh0U
   dqtVoo9RFrv2FHGcSTKBwKe8FU+z8kIzAY19rk6VbY95tnc7bT4PvCfsT
   WOzI46e+Mob30T5RIomHscKMiFtjxK81Ef/+bSPX3WTVh+fP0qtWLFm6V
   q1W79EHNJjKAQLM9ppmWtv7UFknC4xe/q+hGOlzGYJFotM8uG8vxyDory
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336504782"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200";
   d="scan'208";a="336504782"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 19:20:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="826195226"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200";
   d="scan'208";a="826195226"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 19:20:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 3/3] soundwire: cadence: revisit parity injection
Date: Thu, 18 May 2023 10:41:19 +0800
Message-Id: <20230518024119.164160-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518024119.164160-1-yung-chuan.liao@linux.intel.com>
References: <20230518024119.164160-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HZ324TEJ45GXD4DO2Q54VANXPWM4WQYH
X-Message-ID-Hash: HZ324TEJ45GXD4DO2Q54VANXPWM4WQYH
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZ324TEJ45GXD4DO2Q54VANXPWM4WQYH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

We want to wait for the CONFIG_UPDATE bit to clear before doing
something else.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 58686ae50bbf..0efc1c3bee5f 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -456,9 +456,9 @@ static int cdns_parity_error_injection(void *data, u64 value)
 			CDNS_IP_MCP_CMDCTRL_INSERT_PARITY_ERR);
 
 	/* commit changes */
-	cdns_updatel(cdns, CDNS_MCP_CONFIG_UPDATE,
-		     CDNS_MCP_CONFIG_UPDATE_BIT,
-		     CDNS_MCP_CONFIG_UPDATE_BIT);
+	ret = cdns_clear_bit(cdns, CDNS_MCP_CONFIG_UPDATE, CDNS_MCP_CONFIG_UPDATE_BIT);
+	if (ret < 0)
+		goto unlock;
 
 	/* do a broadcast dummy read to avoid bus clashes */
 	ret = sdw_bread_no_pm_unlocked(&cdns->bus, 0xf, SDW_SCP_DEVID_0);
@@ -470,16 +470,17 @@ static int cdns_parity_error_injection(void *data, u64 value)
 			0);
 
 	/* commit changes */
-	cdns_updatel(cdns, CDNS_MCP_CONFIG_UPDATE,
-		     CDNS_MCP_CONFIG_UPDATE_BIT,
-		     CDNS_MCP_CONFIG_UPDATE_BIT);
+	ret = cdns_clear_bit(cdns, CDNS_MCP_CONFIG_UPDATE, CDNS_MCP_CONFIG_UPDATE_BIT);
+	if (ret < 0)
+		goto unlock;
 
+	/* Userspace changed the hardware state behind the kernel's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+unlock:
 	/* Continue bus operation with parity error injection disabled */
 	mutex_unlock(&bus->bus_lock);
 
-	/* Userspace changed the hardware state behind the kernel's back */
-	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
-
 	/*
 	 * allow Master device to enter pm_runtime suspend. This may
 	 * also result in Slave devices suspending.
-- 
2.25.1

