Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2166C5F01
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:36:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D3EED6;
	Thu, 23 Mar 2023 06:35:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D3EED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549799;
	bh=wsFbcSJtx/AlSmGIw0DdUSJEopY6I39DINuaH9UuTy0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bsKKH5jbIviGHEm3JB3oj6aMsvpCfHeYP3AJjnV+FM9o1xmVu0iWeaEcmXJ/0xWP1
	 ObOzIEuoKIKNd2ZQScty2/oRKvgapUVJKicgqDVwVBmrzq3rx+rEtN8gbYanT2mXm3
	 SsVj/zJTgbZIrTyEgPcAUmZtK3Ex8YYo7eh1ctTU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45043F8057F;
	Thu, 23 Mar 2023 06:33:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 849CBF80527; Thu, 23 Mar 2023 06:31:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAAE6F8027B
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAAE6F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I7JNHz7O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549430; x=1711085430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wsFbcSJtx/AlSmGIw0DdUSJEopY6I39DINuaH9UuTy0=;
  b=I7JNHz7OAFWTX1kqSulDzX6OKeind0MB5jkZOkIiSUc1Qicge3C9uIhb
   fX+kPXaMOczrT0k2Vv6h33vWKtCtSD0YktF02xsFuwqOhLhrGviVwbCVO
   il4cHvqLKH5QoBsRuU0WvYVqtV6uioL/6PgRzZppA0lM70I/z3PjiSuUM
   GLrErI4jIKru9eVDcd490WZB9iw5YhCu+JAH7Z9MTOAoz09MplCPi+eZ3
   zC1Asx1HsBTGrgNUI1xBFwg9PB9Dvn6Gwb46H5aZQvy4tmbDYPUMaDpxe
   bQFDsgHRDNA0aUfyNszoeEhG5qBtEvXra/gmW8HuG2/cVJ5f4KuUk9Yjp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779462"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779462"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567197"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567197"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 15/20] soundwire: intel_ace2x: add sync_arm/sync_go helpers
Date: Thu, 23 Mar 2023 13:44:47 +0800
Message-Id: <20230323054452.1543233-16-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IG4MFUT3YCAR3EMEUFX6OX6RTLPRFPAA
X-Message-ID-Hash: IG4MFUT3YCAR3EMEUFX6OX6RTLPRFPAA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IG4MFUT3YCAR3EMEUFX6OX6RTLPRFPAA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Same functionality as before, but with the registers moved to the
HDaudio multi-link area.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index d6d5e6e070f4..20b8806f7de6 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -116,6 +116,41 @@ static int intel_link_power_down(struct sdw_intel *sdw)
 	return ret;
 }
 
+static void intel_sync_arm(struct sdw_intel *sdw)
+{
+	unsigned int link_id = sdw->instance;
+
+	mutex_lock(sdw->link_res->shim_lock);
+
+	hdac_bus_eml_sdw_sync_arm_unlocked(sdw->link_res->hbus, link_id);
+
+	mutex_unlock(sdw->link_res->shim_lock);
+}
+
+static int intel_sync_go_unlocked(struct sdw_intel *sdw)
+{
+	int ret;
+
+	ret = hdac_bus_eml_sdw_sync_go_unlocked(sdw->link_res->hbus);
+	if (ret < 0)
+		dev_err(sdw->cdns.dev, "%s: SyncGO clear failed: %d\n", __func__, ret);
+
+	return ret;
+}
+
+static int intel_sync_go(struct sdw_intel *sdw)
+{
+	int ret;
+
+	mutex_lock(sdw->link_res->shim_lock);
+
+	ret = intel_sync_go_unlocked(sdw);
+
+	mutex_unlock(sdw->link_res->shim_lock);
+
+	return ret;
+}
+
 /*
  * DAI operations
  */
@@ -283,6 +318,10 @@ const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
 
 	.link_power_up = intel_link_power_up,
 	.link_power_down = intel_link_power_down,
+
+	.sync_arm = intel_sync_arm,
+	.sync_go_unlocked = intel_sync_go_unlocked,
+	.sync_go = intel_sync_go,
 };
 EXPORT_SYMBOL_NS(sdw_intel_lnl_hw_ops, SOUNDWIRE_INTEL);
 
-- 
2.25.1

