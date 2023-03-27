Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF15C6CA26F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:31:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39BAC825;
	Mon, 27 Mar 2023 13:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39BAC825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916717;
	bh=crp3rBgrJAHr8/NVFw0xsDYD6SYIaAZFzC729BQTE/c=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=clM646hxSY6ezEQGfa9kTNWBJzSW6I7mbxnTo1nUDfuYLcr7vxrC6/hk0HPv97kmb
	 P9U3QxcuPPj3Anl+A9Z3z6hvPiw1gm1Gj/W/gozq6IVuuo0FiXKNqp/uaIPKsBNNM2
	 /N0XyEKEn2f32xzwlaqWATSRjU6IIPXjq0VXv0Og=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40DACF80549;
	Mon, 27 Mar 2023 13:29:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DA76F80568; Mon, 27 Mar 2023 13:29:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1590F80495
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1590F80495
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Bqk1eSGt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916560; x=1711452560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=crp3rBgrJAHr8/NVFw0xsDYD6SYIaAZFzC729BQTE/c=;
  b=Bqk1eSGtIMjj0WxfJeA2DKM5t14CItY/5SRrmHh2FyWwlHvw9KZYcK1Y
   Yrr32pOmbB+NyLox1E7Y1sFuMal30kDiA+7Wn4AEwBoZ5A4tIDPFyovO+
   YjtNLPYTxCMw2efpZmFhTEYhF1ViOL5l0pyKl2ZCZNFK1YYTnB+MvSaXr
   0ZxPdRBp/cmGbBl/+sZo6IIg81pP6f0SMRJP6O9lrFA6Qw3v30m3oNDQH
   alPwXf9osecqAMnS8v4/NRa3p6GHg8YMZNtB+dOj+ng9qOESFFkWLSUae
   7nMx4MNNHOn0F57AOIDrf1JBgDpI7Es6pxrq0wd4QD96o1y/FLbFmKxHx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367986944"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367986944"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620419"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620419"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:16 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 06/18] ASoC: SOF: Intel: hda-mlink: add structures to parse
 ALT links
Date: Mon, 27 Mar 2023 14:29:19 +0300
Message-Id: <20230327112931.23411-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NESSQVJJCJ2NHTX72ZW3A7KCMAWQH4P2
X-Message-ID-Hash: NESSQVJJCJ2NHTX72ZW3A7KCMAWQH4P2
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NESSQVJJCJ2NHTX72ZW3A7KCMAWQH4P2/>
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
 sound/soc/sof/intel/hda-mlink.c | 217 +++++++++++++++++++++++++++++++-
 1 file changed, 214 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index fbf86f2350fb..cc944311a671 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -14,14 +14,221 @@
 #include <sound/hda_register.h>
 #include <sound/hda-mlink.h>
 
+#include <linux/bitfield.h>
 #include <linux/module.h>
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_MLINK)
 
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
+{
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
+	return 0;
+}
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
 int hda_bus_ml_get_capabilities(struct hdac_bus *bus)
 {
-	if (bus->mlcap)
-		return snd_hdac_ext_bus_get_ml_capabilities(bus);
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
 	return 0;
 }
 EXPORT_SYMBOL_NS(hda_bus_ml_get_capabilities, SND_SOC_SOF_HDA_MLINK);
@@ -29,13 +236,17 @@ EXPORT_SYMBOL_NS(hda_bus_ml_get_capabilities, SND_SOC_SOF_HDA_MLINK);
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
-- 
2.40.0

