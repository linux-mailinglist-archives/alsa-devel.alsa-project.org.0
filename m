Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6292D82903
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 03:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F3A16E1;
	Tue,  6 Aug 2019 03:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F3A16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565053607;
	bh=xN1Cn2pddpCh0iul4nUZIj0kvDlySKDsel2GAkYTp8k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZkNs0PeoQsR6WNrtgyk7HDdgbq19SxMrKsHYMOiWF5lsGuKdSQ0Kg6oOBqLZynVb3
	 TEstxpufRGnkJq0lcAaIcinX7X7g3PzfPzGoG7JM0VCv7+IJDbwkDmy9d/Cfda4lI0
	 XSvcTQ93H3tUlqfJGDEjIATJ32+OF6UVwysorPdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A75F9F8071C;
	Tue,  6 Aug 2019 02:55:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10077F806EF; Tue,  6 Aug 2019 02:55:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0991FF8067A
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 02:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0991FF8067A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 17:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="198153229"
Received: from sahluwal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.202.215])
 by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2019 17:55:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  5 Aug 2019 19:55:19 -0500
Message-Id: <20190806005522.22642-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, Blauciak@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH 14/17] soundwire: intel: handle disabled links
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On most hardware platforms, SoundWire interfaces are pin-muxed with
other interfaces (typically DMIC or I2S) and the status of each link
needs to be checked at boot time.

For Intel platforms, the BIOS provides a menu to enable/disable the
links separately, and the information is provided to the OS with an
Intel-specific _DSD property. The same capability will be added to
revisions of the MIPI DisCo specification.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c     | 26 ++++++++++++++++++++++----
 include/linux/soundwire/sdw.h |  2 ++
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 3f876642cb7f..e702187c0609 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -90,6 +90,8 @@
 #define SDW_ALH_STRMZCFG_DMAT		GENMASK(7, 0)
 #define SDW_ALH_STRMZCFG_CHN		GENMASK(19, 16)
 
+#define SDW_INTEL_QUIRK_MASK_BUS_DISABLE	BIT(1)
+
 enum intel_pdi_type {
 	INTEL_PDI_IN = 0,
 	INTEL_PDI_OUT = 1,
@@ -914,7 +916,7 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
 	struct sdw_master_prop *prop = &bus->prop;
 	struct fwnode_handle *link;
 	char name[32];
-	int nval, i;
+	u32 quirk_mask;
 
 	/* Find master handle */
 	snprintf(name, sizeof(name),
@@ -929,6 +931,14 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
 	fwnode_property_read_u32(link,
 				 "intel-sdw-ip-clock",
 				 &prop->mclk_freq);
+
+	fwnode_property_read_u32(link,
+				 "intel-quirk-mask",
+				 &quirk_mask);
+
+	if (quirk_mask & SDW_INTEL_QUIRK_MASK_BUS_DISABLE)
+		prop->hw_disabled = true;
+
 	return 0;
 }
 
@@ -989,6 +999,12 @@ static int intel_probe(struct platform_device *pdev)
 		goto err_master_reg;
 	}
 
+	if (sdw->cdns.bus.prop.hw_disabled) {
+		dev_info(&pdev->dev, "SoundWire master %d is disabled, ignoring\n",
+			 sdw->cdns.bus.link_id);
+		return 0;
+	}
+
 	/* Initialize shim and controller */
 	intel_link_power_up(sdw);
 	intel_shim_init(sdw);
@@ -1042,9 +1058,11 @@ static int intel_remove(struct platform_device *pdev)
 
 	sdw = platform_get_drvdata(pdev);
 
-	intel_debugfs_exit(sdw);
-	free_irq(sdw->res->irq, sdw);
-	snd_soc_unregister_component(sdw->cdns.dev);
+	if (!sdw->cdns.bus.prop.hw_disabled) {
+		intel_debugfs_exit(sdw);
+		free_irq(sdw->res->irq, sdw);
+		snd_soc_unregister_component(sdw->cdns.dev);
+	}
 	sdw_delete_bus_master(&sdw->cdns.bus);
 
 	return 0;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index b6acc436ac80..a3c7448d5817 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -380,6 +380,7 @@ struct sdw_slave_prop {
  * @err_threshold: Number of times that software may retry sending a single
  * command
  * @mclk_freq: clock reference passed to SoundWire Master, in Hz.
+ * @hw_disabled: if true, the Master is not functional, typically due to pin-mux
  */
 struct sdw_master_prop {
 	u32 revision;
@@ -395,6 +396,7 @@ struct sdw_master_prop {
 	bool dynamic_frame;
 	u32 err_threshold;
 	u32 mclk_freq;
+	bool hw_disabled;
 };
 
 int sdw_master_read_prop(struct sdw_bus *bus);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
