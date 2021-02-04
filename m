Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 035FB30FECA
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:51:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 972001665;
	Thu,  4 Feb 2021 21:50:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 972001665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612471889;
	bh=o7X8NX2FTMz+6G4kKvSg5ojVZlE228oLzc3yg+ypjY8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h6WpNgFDCkNJcW8YgCg3GEN2hBFAV6ls3OLocg05VWEWGbbfa6Zgxx+0M9PVIFNmJ
	 bL9VMbN64plVh1aiwISIP0dlNA3MOf8dgtYxwKsYSgoHVd96eBXudUK3U+9YfzhKq/
	 fiO285E2TwiwuiV6GPMODc0rL9OfkxxjKgJ+28n0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D517BF802A0;
	Thu,  4 Feb 2021 21:49:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAEF9F8025D; Thu,  4 Feb 2021 21:49:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1A7AF80171
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:48:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1A7AF80171
IronPort-SDR: cEqkijP2/bMbjas3frJAdGC1WyXUW3vuou9JgmRusFp99e05wGzTttBRc2kpc9wkqusULKClaM
 O910wXx7ptjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="168443578"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="168443578"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:48:56 -0800
IronPort-SDR: bFsOU9ei1WGaxcMSH/4DJHi/V9enSeFO48vus9tjkKTnpx0SgCCKBozfZHtuKT7d1tpj4rxA+X
 11utcWmLBWkg==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="415504501"
Received: from zyi-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.188.47])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:48:54 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH 2/2] soundwire: slave: add DMI quirk for Dell SKU 0A3E
Date: Thu,  4 Feb 2021 14:48:37 -0600
Message-Id: <20210204204837.27876-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204204837.27876-1-pierre-louis.bossart@linux.intel.com>
References: <20210204204837.27876-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

We've been handling ACPI issues on early versions of the product with
a local ACPI initrd override but now that we have the possibility of a
kernel quirk let's get rid of the initrd override. This helps make
sure that the kernel will support all versions of the BIOS, with or
without updates.

Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
---
 drivers/soundwire/slave.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index abdc1ae94e9c..e3c4cf252cb7 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -114,6 +114,28 @@ static const struct adr_remap hp_spectre_360[] = {
 	{}
 };
 
+/*
+ * The initial version of the Dell SKU 0A3E did not expose the devices on the correct links.
+ */
+static const struct adr_remap dell_sku_0A3E[] = {
+	/* rt715 on link0 */
+	{
+		0x00020025d071100,
+		0x00021025d071500
+	},
+	/* rt711 on link1 */
+	{
+		0x000120025d130800,
+		0x000120025d071100,
+	},
+	/* rt1308 on link2 */
+	{
+		0x000220025d071500,
+		0x000220025d130800
+	},
+	{}
+};
+
 static const struct dmi_system_id adr_remap_quirk_table[] = {
 	{
 		.matches = {
@@ -122,6 +144,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)hp_spectre_360,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A3E")
+		},
+		.driver_data = (void *)dell_sku_0A3E,
+	},
 	{}
 };
 
-- 
2.25.1

