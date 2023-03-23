Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5286C5EF9
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:34:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D600DED9;
	Thu, 23 Mar 2023 06:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D600DED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549689;
	bh=+/puymD/Mrlt+6NzEm6hJ2HiO/2wdXeQEMmwt5RGD7o=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MlFLiSfq550cb4s+xh9IKGlsFIPTczljlNiQUOvQMoetKbgRRGcKV4i46A0BvKkUR
	 ehT9ddhXvBlI4mnIXBks65Ec+cFRymF+61A9iSVFA45qrx0GuG3JnXBL+3mnR3IKQr
	 iz30zCMIMoG6aXWF5tUxZqAZ+HCu4JcZWLp7EWPg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 233E2F80542;
	Thu, 23 Mar 2023 06:32:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8D50F80551; Thu, 23 Mar 2023 06:30:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B0D7F804B1
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B0D7F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JbhM58KN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549422; x=1711085422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+/puymD/Mrlt+6NzEm6hJ2HiO/2wdXeQEMmwt5RGD7o=;
  b=JbhM58KNhf1bMzfHJPfl0O7/2zzDrOrhsFO4F64DMiIIth1E4hdqb/YI
   WxXc6hGzdxY15X2kGEMaVX14FLltlsZ0v4ifzoAnEKGmzl6hF6h5/4AQ3
   5p0J+L20am5FOK3WIVsrbqKxhkaCyeo1DA2jR0fTfNlwbP9GcNwd/WtFb
   hnRTAgPUSpv71h6h0eclz668tSEPHH0q170777veyKynFhLEUg59wXHmi
   K28e792yqou4DpQBKFcQxrIPqs8kKrgfFxAd7rdUsnqIG7yVFTqaWwHv5
   TcYK5U0nCVlvwV2/tqPZNYOTp5v7BWR/H53olLFXDzh3R2ggjexV9kvcE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779322"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779322"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567014"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567014"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 05/20] soundwire: intel/cadence: set ip_offset at run-time
Date: Thu, 23 Mar 2023 13:44:37 +0800
Message-Id: <20230323054452.1543233-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2Q43KA2WT56A3ZOPNWDD2GR5WAHXHZ7Y
X-Message-ID-Hash: 2Q43KA2WT56A3ZOPNWDD2GR5WAHXHZ7Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2Q43KA2WT56A3ZOPNWDD2GR5WAHXHZ7Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Select relevant ip-offset depending on hardware version. This offset
is used to access MCP_ or IP_MCP_ registers with a fixed offset.

For existing platforms, the offset is exactly zero. Starting with
LunarLake, the offset is 0x4000.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.h  | 2 ++
 drivers/soundwire/intel.h           | 2 ++
 drivers/soundwire/intel_auxdevice.c | 1 +
 drivers/soundwire/intel_init.c      | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index b653734085d9..b0f0bf90640b 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -14,6 +14,8 @@
  */
 #define CDNS_MCP_IP_MAX_CMD_LEN		32
 
+#define SDW_CADENCE_MCP_IP_OFFSET	0x4000
+
 /**
  * struct sdw_cdns_pdi: PDI (Physical Data Interface) instance
  *
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 51aa42a5a824..1b23292bb8be 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -10,6 +10,7 @@
  * @hw_ops: platform-specific ops
  * @mmio_base: mmio base of SoundWire registers
  * @registers: Link IO registers base
+ * @ip_offset: offset for MCP_IP registers
  * @shim: Audio shim pointer
  * @shim_vs: Audio vendor-specific shim pointer
  * @alh: ALH (Audio Link Hub) pointer
@@ -28,6 +29,7 @@ struct sdw_intel_link_res {
 
 	void __iomem *mmio_base; /* not strictly needed, useful for debug */
 	void __iomem *registers;
+	u32 ip_offset;
 	void __iomem *shim;
 	void __iomem *shim_vs;
 	void __iomem *alh;
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 5021be0f4158..b02cef4f4b66 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -144,6 +144,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
 	sdw->link_res = &ldev->link_res;
 	cdns->dev = dev;
 	cdns->registers = sdw->link_res->registers;
+	cdns->ip_offset = sdw->link_res->ip_offset;
 	cdns->instance = sdw->instance;
 	cdns->msg_count = 0;
 
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index e0023af9e0e1..43d339c6bcee 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -66,10 +66,12 @@ static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *
 	if (!res->ext) {
 		link->registers = res->mmio_base + SDW_LINK_BASE
 			+ (SDW_LINK_SIZE * link_id);
+		link->ip_offset = 0;
 		link->shim = res->mmio_base + res->shim_base;
 		link->alh = res->mmio_base + res->alh_base;
 	} else {
 		link->registers = res->mmio_base + SDW_IP_BASE(link_id);
+		link->ip_offset = SDW_CADENCE_MCP_IP_OFFSET;
 		link->shim = res->mmio_base +  SDW_SHIM2_GENERIC_BASE(link_id);
 		link->shim_vs = res->mmio_base + SDW_SHIM2_VS_BASE(link_id);
 	}
-- 
2.25.1

