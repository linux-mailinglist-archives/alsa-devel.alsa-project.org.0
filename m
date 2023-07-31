Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A077690AC
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 10:47:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43B2B83B;
	Mon, 31 Jul 2023 10:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43B2B83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690793240;
	bh=ARAOO1pyps6zAaRXGz2FOsZTdJ2x3fTJifVNqOAkVq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jvqMyva79IsQlMIK+t+y1zbLXgFinUFEfa+F09tU3yqdmSmM2miVXeime4ofUbVQX
	 h1vKnxkGbhgsmWMuTKNi9EINzNtXUAXcicY7JRKcjRJ+EIUW0qrxgf7zlRQFPzmTom
	 0k25NRbmLabKbxjUjnhzoHhn12nruLSnSviO4wdc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5BC5F80568; Mon, 31 Jul 2023 10:45:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EA68F80551;
	Mon, 31 Jul 2023 10:45:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A99BF8025A; Mon, 31 Jul 2023 10:45:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A520F8016D
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 10:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A520F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CgmnW0Vk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690793129; x=1722329129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ARAOO1pyps6zAaRXGz2FOsZTdJ2x3fTJifVNqOAkVq0=;
  b=CgmnW0VkpWCQ595A3dxoFRka3nRuTZTGHTNImQ5FNvljIGntLeuJaerK
   +AHlTUGstHLqbYdvMxBEacKecPVA++QCibcW71TyeKs0dvlqBJoLPWizZ
   5thM/+vZD2X2KsXhoyvMG8vDSdNK0GjwChl5lqm6MJhf3WeWKXOK1zVWl
   +g5sZWlI8J0O7k2a424arzWL0FF/WDrpmHIsrYUyshPni0+0u3pcTT3EP
   1Hl2TOkMmiHh9caF68BGbMAhDjKAkGbEbIUuhbeb1XNVX/qCb0NV7W72f
   DOX73bXbLsqU+XWeGvE9pdIuJ5xP3hOT+JSvH+yJpesNhKP6fotrtN0rU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="348557446"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200";
   d="scan'208";a="348557446"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 01:45:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="678232265"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200";
   d="scan'208";a="678232265"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 01:45:21 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 1/3] soundwire: extend parameters of
 new_peripheral_assigned() callback
Date: Mon, 31 Jul 2023 17:13:31 +0800
Message-Id: <20230731091333.3593132-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731091333.3593132-1-yung-chuan.liao@linux.intel.com>
References: <20230731091333.3593132-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4OU66GPQA2YR7X2XSR26XE6UEYGEKT3V
X-Message-ID-Hash: 4OU66GPQA2YR7X2XSR26XE6UEYGEKT3V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OU66GPQA2YR7X2XSR26XE6UEYGEKT3V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The parameters are only the bus and the device number, manager ops may
need additional details on the type of peripheral connected, such as
whether it is wake-capable or not.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c             | 2 +-
 drivers/soundwire/intel_auxdevice.c | 4 +++-
 include/linux/soundwire/sdw.h       | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index dba920ec88f6..bdd0fed45a8d 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -781,7 +781,7 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 	slave->dev_num = slave->dev_num_sticky;
 
 	if (bus->ops && bus->ops->new_peripheral_assigned)
-		bus->ops->new_peripheral_assigned(bus, dev_num);
+		bus->ops->new_peripheral_assigned(bus, slave, dev_num);
 
 	return 0;
 }
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 0daa6ca9a224..cb2f199f4f97 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -60,7 +60,9 @@ static int generic_post_bank_switch(struct sdw_bus *bus)
 	return sdw->link_res->hw_ops->post_bank_switch(sdw);
 }
 
-static void generic_new_peripheral_assigned(struct sdw_bus *bus, int dev_num)
+static void generic_new_peripheral_assigned(struct sdw_bus *bus,
+					    struct sdw_slave *slave,
+					    int dev_num)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f523ceabd059..94676a3fd0b5 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -862,7 +862,9 @@ struct sdw_master_ops {
 	int (*pre_bank_switch)(struct sdw_bus *bus);
 	int (*post_bank_switch)(struct sdw_bus *bus);
 	u32 (*read_ping_status)(struct sdw_bus *bus);
-	void (*new_peripheral_assigned)(struct sdw_bus *bus, int dev_num);
+	void (*new_peripheral_assigned)(struct sdw_bus *bus,
+					struct sdw_slave *slave,
+					int dev_num);
 };
 
 /**
-- 
2.25.1

