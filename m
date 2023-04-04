Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA586D5DCB
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:44:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BB54200;
	Tue,  4 Apr 2023 12:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BB54200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605043;
	bh=9FE5qsyGqhZQe2Ck/LaTajUSxrhodAUoM+GZsU0tj6A=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bmWRETLJFVTR6MQuiKbGHjbu0xCvJ7lFdtAZR+wxTcZULGnuvqIqR9KcyojG+Yfiy
	 9B6gNkyuomrCcAuhEJh2CrJB6w+p333mEsAz8nwHgCMHan0HteRSWv+p72RsYOqPbJ
	 1lvKpazHuVE8weWFicqO6L1vFPaB8sMtZtw63VUo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC0EEF80552;
	Tue,  4 Apr 2023 12:41:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37B2CF80579; Tue,  4 Apr 2023 12:41:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73A37F80495
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73A37F80495
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CipJc23N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604875; x=1712140875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9FE5qsyGqhZQe2Ck/LaTajUSxrhodAUoM+GZsU0tj6A=;
  b=CipJc23Nw69vc/MOuF4NWTdZ/65aehm9C1X7WcwTYCSiTpxHuib9bBqm
   nQOxR6U5NhscidikwCLRgEJLKXVTIkiY68Lw0jIg/6+WVMYYwajuNkhbj
   AKaUAhybXVe7v4labAHoMOUO8DA1qlU7jXdFfZBwFydK/gyEAqYIopYfR
   eGuABAeymT2qPOBIRMsxSAXI5k0tvEezj4KuLFdm8hc+7FSD/ry5W/6Q/
   DlUY3Oll+6ZODDoKp0Ej2EV+mwQRq+dSwjVqIh1Fk6fDdAkhxe9r4TOLQ
   iiDL97QDekL9N5liu+4bXtntIBj2Y4BtJykgT/d6OQce7Q3fyjZfJEXHT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340877991"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340877991"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930144"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930144"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 06/18] ASoC: SOF: Intel: hda-mlink: add structures to parse
 ALT links
Date: Tue,  4 Apr 2023 13:41:15 +0300
Message-Id: <20230404104127.5629-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ONAGSWROL6CHU6XXR3DYOOVQ2VIZISTV
X-Message-ID-Hash: ONAGSWROL6CHU6XXR3DYOOVQ2VIZISTV
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, amadeuszx.slawinski@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONAGSWROL6CHU6XXR3DYOOVQ2VIZISTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Extend hdac_ext_link to store information needed for ALT
links. Follow-up patches will include more functional patches for
power-up and down.

Note that this patch suggests the use of an 'eml_lock' to serialize
access to shared registers. SoundWire-specific sequence require the
lock to be taken at a higher level, as a result the helpers added in
follow-up patches will provide 'unlocked' versions when needed.

Also note that the low-level sequences with the 'hdaml_' prefix are
taken directly from the hardware specifications - naming conventions
included. The code will be split in two, with locking and linked-list
management handled separately to avoid mixing required hardware setup
and Linux-based resource management.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       |   4 +-
 sound/soc/sof/intel/hda-mlink.c | 221 +++++++++++++++++++++++++++++++-
 sound/soc/sof/intel/hda.c       |   2 +-
 3 files changed, 219 insertions(+), 8 deletions(-)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index beef5f509e47..8048bf01c133 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -10,7 +10,7 @@ struct hdac_bus;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_MLINK)
 
-int hda_bus_ml_get_capabilities(struct hdac_bus *bus);
+int hda_bus_ml_init(struct hdac_bus *bus);
 void hda_bus_ml_free(struct hdac_bus *bus);
 void hda_bus_ml_put_all(struct hdac_bus *bus);
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
@@ -20,7 +20,7 @@ int hda_bus_ml_suspend(struct hdac_bus *bus);
 #else
 
 static inline int
-hda_bus_ml_get_capabilities(struct hdac_bus *bus) { return 0; }
+hda_bus_ml_init(struct hdac_bus *bus) { return 0; }
 
 static inline void hda_bus_ml_free(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index fbf86f2350fb..e6b20182f099 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -14,28 +14,239 @@
 #include <sound/hda_register.h>
 #include <sound/hda-mlink.h>
 
+#include <linux/bitfield.h>
 #include <linux/module.h>
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_MLINK)
 
-int hda_bus_ml_get_capabilities(struct hdac_bus *bus)
+/**
+ * struct hdac_ext2_link - HDAudio extended+alternate link
+ *
+ * @hext_link:		hdac_ext_link
+ * @alt:		flag set for alternate extended links
+ * @intc:		boolean for interrupt capable
+ * @ofls:		boolean for offload support
+ * @lss:		boolean for link synchronization capabilities
+ * @slcount:		sublink count
+ * @elid:		extended link ID (AZX_REG_ML_LEPTR_ID_ defines)
+ * @elver:		extended link version
+ * @leptr:		extended link pointer
+ * @eml_lock:		mutual exclusion to access shared registers e.g. CPA/SPA bits
+ * in LCTL register
+ * @base_ptr:		pointer to shim/ip/shim_vs space
+ * @instance_offset:	offset between each of @slcount instances managed by link
+ * @shim_offset:	offset to SHIM register base
+ * @ip_offset:		offset to IP register base
+ * @shim_vs_offset:	offset to vendor-specific (VS) SHIM base
+ */
+struct hdac_ext2_link {
+	struct hdac_ext_link hext_link;
+
+	/* read directly from LCAP register */
+	bool alt;
+	bool intc;
+	bool ofls;
+	bool lss;
+	int slcount;
+	int elid;
+	int elver;
+	u32 leptr;
+
+	struct mutex eml_lock; /* prevent concurrent access to e.g. CPA/SPA */
+
+	/* internal values computed from LCAP contents */
+	void __iomem *base_ptr;
+	u32 instance_offset;
+	u32 shim_offset;
+	u32 ip_offset;
+	u32 shim_vs_offset;
+};
+
+#define hdac_ext_link_to_ext2(h) container_of(h, struct hdac_ext2_link, hext_link)
+
+#define AZX_REG_SDW_INSTANCE_OFFSET			0x8000
+#define AZX_REG_SDW_SHIM_OFFSET				0x0
+#define AZX_REG_SDW_IP_OFFSET				0x100
+#define AZX_REG_SDW_VS_SHIM_OFFSET			0x6000
+
+/* only one instance supported */
+#define AZX_REG_INTEL_DMIC_SHIM_OFFSET			0x0
+#define AZX_REG_INTEL_DMIC_IP_OFFSET			0x100
+#define AZX_REG_INTEL_DMIC_VS_SHIM_OFFSET		0x6000
+
+#define AZX_REG_INTEL_SSP_INSTANCE_OFFSET		0x1000
+#define AZX_REG_INTEL_SSP_SHIM_OFFSET			0x0
+#define AZX_REG_INTEL_SSP_IP_OFFSET			0x100
+#define AZX_REG_INTEL_SSP_VS_SHIM_OFFSET		0xC00
+
+/* only one instance supported */
+#define AZX_REG_INTEL_UAOL_SHIM_OFFSET			0x0
+#define AZX_REG_INTEL_UAOL_IP_OFFSET			0x100
+#define AZX_REG_INTEL_UAOL_VS_SHIM_OFFSET		0xC00
+
+/* HDAML section - this part follows sequences in the hardware specification,
+ * including naming conventions and the use of the hdaml_ prefix.
+ * The code is intentionally minimal with limited dependencies on frameworks or
+ * helpers. Locking and scanning lists is handled at a higher level
+ */
+
+static int hdaml_lnk_enum(struct device *dev, struct hdac_ext2_link *h2link,
+			  void __iomem *ml_addr, int link_idx)
 {
-	if (bus->mlcap)
-		return snd_hdac_ext_bus_get_ml_capabilities(bus);
+	struct hdac_ext_link *hlink = &h2link->hext_link;
+	u32 base_offset;
+
+	hlink->lcaps  = readl(ml_addr + AZX_REG_ML_LCAP);
+
+	h2link->alt = FIELD_GET(AZX_ML_HDA_LCAP_ALT, hlink->lcaps);
+
+	/* handle alternate extensions */
+	if (!h2link->alt) {
+		h2link->slcount = 1;
+
+		/*
+		 * LSDIID is initialized by hardware for HDaudio link,
+		 * it needs to be setup by software for alternate links
+		 */
+		hlink->lsdiid = readw(ml_addr + AZX_REG_ML_LSDIID);
+
+		dev_dbg(dev, "Link %d: HDAudio - lsdiid=%d\n",
+			link_idx, hlink->lsdiid);
+
+		return 0;
+	}
+
+	h2link->intc = FIELD_GET(AZX_ML_HDA_LCAP_INTC, hlink->lcaps);
+	h2link->ofls = FIELD_GET(AZX_ML_HDA_LCAP_OFLS, hlink->lcaps);
+	h2link->lss = FIELD_GET(AZX_ML_HDA_LCAP_LSS, hlink->lcaps);
+
+	/* read slcount (increment due to zero-based hardware representation */
+	h2link->slcount = FIELD_GET(AZX_ML_HDA_LCAP_SLCOUNT, hlink->lcaps) + 1;
+	dev_dbg(dev, "Link %d: HDAudio extended - sublink count %d\n",
+		link_idx, h2link->slcount);
+
+	/* find IP ID and offsets */
+	h2link->leptr = readl(hlink->ml_addr + AZX_REG_ML_LEPTR);
+
+	h2link->elid = FIELD_GET(AZX_REG_ML_LEPTR_ID, h2link->leptr);
+
+	base_offset = FIELD_GET(AZX_REG_ML_LEPTR_PTR, h2link->leptr);
+	h2link->base_ptr = hlink->ml_addr + base_offset;
+
+	switch (h2link->elid) {
+	case AZX_REG_ML_LEPTR_ID_SDW:
+		h2link->shim_offset = AZX_REG_SDW_SHIM_OFFSET;
+		h2link->ip_offset = AZX_REG_SDW_IP_OFFSET;
+		h2link->shim_vs_offset = AZX_REG_SDW_VS_SHIM_OFFSET;
+		dev_dbg(dev, "Link %d: HDAudio extended - SoundWire alternate link, leptr.ptr %#x\n",
+			link_idx, base_offset);
+		break;
+	case AZX_REG_ML_LEPTR_ID_INTEL_DMIC:
+		h2link->shim_offset = AZX_REG_INTEL_DMIC_SHIM_OFFSET;
+		h2link->ip_offset = AZX_REG_INTEL_DMIC_IP_OFFSET;
+		h2link->shim_vs_offset = AZX_REG_INTEL_DMIC_VS_SHIM_OFFSET;
+		dev_dbg(dev, "Link %d: HDAudio extended - INTEL DMIC alternate link, leptr.ptr %#x\n",
+			link_idx, base_offset);
+		break;
+	case AZX_REG_ML_LEPTR_ID_INTEL_SSP:
+		h2link->shim_offset = AZX_REG_INTEL_SSP_SHIM_OFFSET;
+		h2link->ip_offset = AZX_REG_INTEL_SSP_IP_OFFSET;
+		h2link->shim_vs_offset = AZX_REG_INTEL_SSP_VS_SHIM_OFFSET;
+		dev_dbg(dev, "Link %d: HDAudio extended - INTEL SSP alternate link, leptr.ptr %#x\n",
+			link_idx, base_offset);
+		break;
+	case AZX_REG_ML_LEPTR_ID_INTEL_UAOL:
+		h2link->shim_offset = AZX_REG_INTEL_UAOL_SHIM_OFFSET;
+		h2link->ip_offset = AZX_REG_INTEL_UAOL_IP_OFFSET;
+		h2link->shim_vs_offset = AZX_REG_INTEL_UAOL_VS_SHIM_OFFSET;
+		dev_dbg(dev, "Link %d: HDAudio extended - INTEL UAOL alternate link, leptr.ptr %#x\n",
+			link_idx, base_offset);
+		break;
+	default:
+		dev_err(dev, "Link %d: HDAudio extended - Unsupported alternate link, leptr.id=%#02x value\n",
+			link_idx, h2link->elid);
+		return -EINVAL;
+	}
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_bus_ml_get_capabilities, SND_SOC_SOF_HDA_MLINK);
+
+/* END HDAML section */
+
+static int hda_ml_alloc_h2link(struct hdac_bus *bus, int index)
+{
+	struct hdac_ext2_link *h2link;
+	struct hdac_ext_link *hlink;
+	int ret;
+
+	h2link  = kzalloc(sizeof(*h2link), GFP_KERNEL);
+	if (!h2link)
+		return -ENOMEM;
+
+	/* basic initialization */
+	hlink = &h2link->hext_link;
+
+	hlink->index = index;
+	hlink->bus = bus;
+	hlink->ml_addr = bus->mlcap + AZX_ML_BASE + (AZX_ML_INTERVAL * index);
+
+	ret = hdaml_lnk_enum(bus->dev, h2link, hlink->ml_addr, index);
+	if (ret < 0) {
+		kfree(h2link);
+		return ret;
+	}
+
+	mutex_init(&h2link->eml_lock);
+
+	list_add_tail(&hlink->list, &bus->hlink_list);
+
+	/*
+	 * HDaudio regular links are powered-on by default, the
+	 * refcount needs to be initialized.
+	 */
+	if (!h2link->alt)
+		hlink->ref_count = 1;
+
+	return 0;
+}
+
+int hda_bus_ml_init(struct hdac_bus *bus)
+{
+	u32 link_count;
+	int ret;
+	int i;
+
+	if (!bus->mlcap)
+		return 0;
+
+	link_count = readl(bus->mlcap + AZX_REG_ML_MLCD) + 1;
+
+	dev_dbg(bus->dev, "HDAudio Multi-Link count: %d\n", link_count);
+
+	for (i = 0; i < link_count; i++) {
+		ret = hda_ml_alloc_h2link(bus, i);
+		if (ret < 0) {
+			hda_bus_ml_free(bus);
+			return ret;
+		}
+	}
+	return 0;
+}
+EXPORT_SYMBOL_NS(hda_bus_ml_init, SND_SOC_SOF_HDA_MLINK);
 
 void hda_bus_ml_free(struct hdac_bus *bus)
 {
 	struct hdac_ext_link *hlink, *_h;
+	struct hdac_ext2_link *h2link;
 
 	if (!bus->mlcap)
 		return;
 
 	list_for_each_entry_safe(hlink, _h, &bus->hlink_list, list) {
 		list_del(&hlink->list);
-		kfree(hlink);
+		h2link = hdac_ext_link_to_ext2(hlink);
+
+		mutex_destroy(&h2link->eml_lock);
+		kfree(h2link);
 	}
 }
 EXPORT_SYMBOL_NS(hda_bus_ml_free, SND_SOC_SOF_HDA_MLINK);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index ac61233029b7..89eaad02686b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -864,7 +864,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	hda_bus_ml_get_capabilities(bus);
+	hda_bus_ml_init(bus);
 
 	/* scan SoundWire capabilities exposed by DSDT */
 	ret = hda_sdw_acpi_scan(sdev);
-- 
2.40.0

