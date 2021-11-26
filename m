Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C11CE45EF65
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 14:47:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC2B31941;
	Fri, 26 Nov 2021 14:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC2B31941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637934423;
	bh=Qeipo8//sazi3Vb99u42nY9V7jZB7WAXimXVDFSy5MI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BcgLoKjp9Y5jePQ/zGkpQcxSWQ/bVACybSidmzWh7XyWWgFPE9xJ4u4VvrqGd5FVt
	 I0d8jbWAoU+dCtIoASd0XNWJwnqC4QyVLirVhMbKPMAO3jD+4mLks4INmsKDFjormj
	 enFz8h9kdTRbZ3Gov24TPHQcps69rekOimUAs8XU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76476F804F1;
	Fri, 26 Nov 2021 14:45:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF96AF80132; Fri, 26 Nov 2021 14:45:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33343F80132
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 14:45:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33343F80132
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="215689419"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="215689419"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 05:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="675566588"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 26 Nov 2021 05:45:11 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 1/3] ALSA: hda: Fill gaps in NHLT endpoint-interface
Date: Fri, 26 Nov 2021 14:47:37 +0100
Message-Id: <20211126134739.1041596-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126134739.1041596-1-cezary.rojewski@intel.com>
References: <20211126134739.1041596-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Two key operations missings are: endpoint presence-check and retrieval
of matching endpoint hardware configuration (blob). Add operations for
both use cases.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/intel-nhlt.h |  37 +++++++++++---
 sound/hda/intel-nhlt.c     | 102 +++++++++++++++++++++++++++++++++++++
 2 files changed, 131 insertions(+), 8 deletions(-)

diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index d0574805865f..089a760d36eb 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -10,6 +10,14 @@
 
 #include <linux/acpi.h>
 
+enum nhlt_link_type {
+	NHLT_LINK_HDA = 0,
+	NHLT_LINK_DSP = 1,
+	NHLT_LINK_DMIC = 2,
+	NHLT_LINK_SSP = 3,
+	NHLT_LINK_INVALID
+};
+
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
 
 struct wav_fmt {
@@ -33,14 +41,6 @@ struct wav_fmt_ext {
 	u8 sub_fmt[16];
 } __packed;
 
-enum nhlt_link_type {
-	NHLT_LINK_HDA = 0,
-	NHLT_LINK_DSP = 1,
-	NHLT_LINK_DMIC = 2,
-	NHLT_LINK_SSP = 3,
-	NHLT_LINK_INVALID
-};
-
 enum nhlt_device_type {
 	NHLT_DEVICE_BT = 0,
 	NHLT_DEVICE_DMIC = 1,
@@ -132,6 +132,12 @@ void intel_nhlt_free(struct nhlt_acpi_table *addr);
 
 int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt);
 
+bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt, u8 link_type);
+struct nhlt_specific_cfg *
+intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
+			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
+			     u8 num_ch, u32 rate, u8 dir, u8 dev_type);
+
 #else
 
 struct nhlt_acpi_table;
@@ -150,6 +156,21 @@ static inline int intel_nhlt_get_dmic_geo(struct device *dev,
 {
 	return 0;
 }
+
+static inline bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt,
+						u8 link_type)
+{
+	return false;
+}
+
+static inline struct nhlt_specific_cfg *
+intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
+			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
+			     u8 num_ch, u32 rate, u8 dir, u8 dev_type)
+{
+	return NULL;
+}
+
 #endif
 
 #endif
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index e2237239d922..128476aa7c61 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -110,3 +110,105 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 	return dmic_geo;
 }
 EXPORT_SYMBOL_GPL(intel_nhlt_get_dmic_geo);
+
+bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt, u8 link_type)
+{
+	struct nhlt_endpoint *epnt;
+	int i;
+
+	if (!nhlt)
+		return false;
+
+	epnt = (struct nhlt_endpoint *)nhlt->desc;
+	for (i = 0; i < nhlt->endpoint_count; i++) {
+		if (epnt->linktype == link_type)
+			return true;
+
+		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
+	}
+	return false;
+}
+EXPORT_SYMBOL(intel_nhlt_has_endpoint_type);
+
+static struct nhlt_specific_cfg *
+nhlt_get_specific_cfg(struct device *dev, struct nhlt_fmt *fmt, u8 num_ch,
+		      u32 rate, u8 vbps, u8 bps)
+{
+	struct nhlt_fmt_cfg *cfg = fmt->fmt_config;
+	struct wav_fmt *wfmt;
+	u16 _bps, _vbps;
+	int i;
+
+	dev_dbg(dev, "Endpoint format count=%d\n", fmt->fmt_count);
+
+	for (i = 0; i < fmt->fmt_count; i++) {
+		wfmt = &cfg->fmt_ext.fmt;
+		_bps = wfmt->bits_per_sample;
+		_vbps = cfg->fmt_ext.sample.valid_bits_per_sample;
+
+		dev_dbg(dev, "Endpoint format: ch=%d fmt=%d/%d rate=%d\n",
+			wfmt->channels, _vbps, _bps, wfmt->samples_per_sec);
+
+		if (wfmt->channels == num_ch && wfmt->samples_per_sec == rate &&
+		    vbps == _vbps && bps == _bps)
+			return &cfg->config;
+
+		cfg = (struct nhlt_fmt_cfg *)(cfg->config.caps + cfg->config.size);
+	}
+
+	return NULL;
+}
+
+static bool nhlt_check_ep_match(struct device *dev, struct nhlt_endpoint *epnt,
+				u32 bus_id, u8 link_type, u8 dir, u8 dev_type)
+{
+	dev_dbg(dev, "Endpoint: vbus_id=%d link_type=%d dir=%d dev_type = %d\n",
+		epnt->virtual_bus_id, epnt->linktype,
+		epnt->direction, epnt->device_type);
+
+	if ((epnt->virtual_bus_id != bus_id) ||
+	    (epnt->linktype != link_type) ||
+	    (epnt->direction != dir))
+		return false;
+
+	/* link of type DMIC bypasses device_type check */
+	return epnt->linktype == NHLT_LINK_DMIC ||
+	       epnt->device_type == dev_type;
+}
+
+struct nhlt_specific_cfg *
+intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
+			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
+			     u8 num_ch, u32 rate, u8 dir, u8 dev_type)
+{
+	struct nhlt_specific_cfg *cfg;
+	struct nhlt_endpoint *epnt;
+	struct nhlt_fmt *fmt;
+	int i;
+
+	if (!nhlt)
+		return NULL;
+
+	dev_dbg(dev, "Looking for configuration:\n");
+	dev_dbg(dev, "  vbus_id=%d link_type=%d dir=%d, dev_type=%d\n",
+		bus_id, link_type, dir, dev_type);
+	dev_dbg(dev, "  ch=%d fmt=%d/%d rate=%d\n", num_ch, vbps, bps, rate);
+	dev_dbg(dev, "Endpoint count=%d\n", nhlt->endpoint_count);
+
+	epnt = (struct nhlt_endpoint *)nhlt->desc;
+
+	for (i = 0; i < nhlt->endpoint_count; i++) {
+		if (nhlt_check_ep_match(dev, epnt, bus_id, link_type, dir, dev_type)) {
+			fmt = (struct nhlt_fmt *)(epnt->config.caps + epnt->config.size);
+
+			cfg = nhlt_get_specific_cfg(dev, fmt, num_ch, rate, vbps, bps);
+			if (cfg)
+				return cfg;
+		}
+
+		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(intel_nhlt_get_endpoint_blob);
-- 
2.25.1

