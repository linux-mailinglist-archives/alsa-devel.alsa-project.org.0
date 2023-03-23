Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D699C6C5F0B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:37:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19125EE6;
	Thu, 23 Mar 2023 06:37:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19125EE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549873;
	bh=R3GyCN8p+cJBxO9BTibcqpeTRWzFQliw1LPEGnZdocY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r+BapH8iuEMLH9ez7huS5hTxn1gC+fylXmcVux9uT0KoPJkpgqX1oSEQrlaJR2Pbm
	 wokjerR/mwfL0t714PxJB8PDPa9qFU1MNymY3249ca32FCzG/CEpmObuQN3djCF9ZH
	 ySLphNj3HjBocSD2CXnnCpbmTMgGrNyr7ygtkU4I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6041BF805B5;
	Thu, 23 Mar 2023 06:33:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2E3DF802E8; Thu, 23 Mar 2023 06:31:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 086F2F80534
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 086F2F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Quen7fE+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549445; x=1711085445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R3GyCN8p+cJBxO9BTibcqpeTRWzFQliw1LPEGnZdocY=;
  b=Quen7fE+TQ1NfCTLGol5P0FyI45o0Smww2Z3t9sEqp8nSpuATlpKsKfL
   DOMudxrRd1OGkTu7gO+j4umaO1EyzcnFaJ1bETVNpjV+rx/T+x4Njy0Iy
   YvQvMCYSh9xvxwDWpWRaD60uDM9MUdOiuBJgNm4vi1o3F4Bt6QVL/qA93
   kDobphL/4UucoGnMOzjCc0npNzQKYaP7BaHkuPmmIZDJJAXHsrxCCv1VJ
   ao3HTE57yInuk4HB5fdZN5YJPZl14YC07zwXsM8itu+xGwhCtUr0uem0E
   zyDjR+Nz9yYXY+tTcAymG+kWnuIMEZv2ru/hl3Uv2MDlsAo/1n+gBOjFr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779515"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779515"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567305"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567305"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 20/20] soundwire: intel_ace2x: add new_peripheral_assigned
 callback
Date: Thu, 23 Mar 2023 13:44:52 +0800
Message-Id: <20230323054452.1543233-21-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IHRAR2KMRDEPZ54AC25OESXODVT6HU7A
X-Message-ID-Hash: IHRAR2KMRDEPZ54AC25OESXODVT6HU7A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IHRAR2KMRDEPZ54AC25OESXODVT6HU7A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add the abstraction needed to only program the LSDIID registers for
the HDaudio extended links. It's perfectly fine to program this
register multiple times in case devices lose sync and reattach.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c     | 12 ++++++++++++
 drivers/soundwire/intel_auxdevice.c | 16 ++++++++++++++++
 include/linux/soundwire/sdw_intel.h |  3 +++
 3 files changed, 31 insertions(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index a12fee8a5bfa..65deb4345354 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -350,6 +350,16 @@ static int intel_register_dai(struct sdw_intel *sdw)
 					       dais, num_dai);
 }
 
+static void intel_program_sdi(struct sdw_intel *sdw, int dev_num)
+{
+	int ret;
+
+	ret = hdac_bus_eml_sdw_set_lsdiid(sdw->link_res->hbus, sdw->instance, dev_num);
+	if (ret < 0)
+		dev_err(sdw->cdns.dev, "%s: could not set lsdiid for link %d %d\n",
+			__func__, sdw->instance, dev_num);
+}
+
 const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
 	.debugfs_init = intel_ace2x_debugfs_init,
 	.debugfs_exit = intel_ace2x_debugfs_exit,
@@ -372,6 +382,8 @@ const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
 	.sync_go_unlocked = intel_sync_go_unlocked,
 	.sync_go = intel_sync_go,
 	.sync_check_cmdsync_unlocked = intel_check_cmdsync_unlocked,
+
+	.program_sdi = intel_program_sdi,
 };
 EXPORT_SYMBOL_NS(sdw_intel_lnl_hw_ops, SOUNDWIRE_INTEL);
 
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index b02cef4f4b66..6e02782ef211 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -60,6 +60,21 @@ static int generic_post_bank_switch(struct sdw_bus *bus)
 	return sdw->link_res->hw_ops->post_bank_switch(sdw);
 }
 
+static void generic_new_peripheral_assigned(struct sdw_bus *bus, int dev_num)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+
+	/* paranoia check, this should never happen */
+	if (dev_num < INTEL_DEV_NUM_IDA_MIN || dev_num > SDW_MAX_DEVICES)  {
+		dev_err(bus->dev, "%s: invalid dev_num %d\n", __func__, dev_num);
+		return;
+	}
+
+	if (sdw->link_res->hw_ops->program_sdi)
+		sdw->link_res->hw_ops->program_sdi(sdw, dev_num);
+}
+
 static int sdw_master_read_intel_prop(struct sdw_bus *bus)
 {
 	struct sdw_master_prop *prop = &bus->prop;
@@ -117,6 +132,7 @@ static struct sdw_master_ops sdw_intel_ops = {
 	.pre_bank_switch = generic_pre_bank_switch,
 	.post_bank_switch = generic_post_bank_switch,
 	.read_ping_status = cdns_read_ping_status,
+	.new_peripheral_assigned = generic_new_peripheral_assigned,
 };
 
 /*
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index bafc6f2554b0..1a8f32059cd8 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -399,6 +399,7 @@ struct sdw_intel;
  * @sync_go: helper for multi-link synchronization
  * @sync_check_cmdsync_unlocked: helper for multi-link synchronization
  * and bank switch - shim_lock is assumed to be locked at higher level
+ * @program_sdi: helper for codec command/control based on dev_num
  */
 struct sdw_intel_hw_ops {
 	void (*debugfs_init)(struct sdw_intel *sdw);
@@ -425,6 +426,8 @@ struct sdw_intel_hw_ops {
 	int (*sync_go_unlocked)(struct sdw_intel *sdw);
 	int (*sync_go)(struct sdw_intel *sdw);
 	bool (*sync_check_cmdsync_unlocked)(struct sdw_intel *sdw);
+
+	void (*program_sdi)(struct sdw_intel *sdw, int dev_num);
 };
 
 extern const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops;
-- 
2.25.1

