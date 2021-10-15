Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A3542F86F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 18:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6B791848;
	Fri, 15 Oct 2021 18:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6B791848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634316028;
	bh=vBv8h08pcv0K3Ul+JXhrfgjcDY7YInmhghYlhZraNZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vMckA0UqDrWRrVUgst7oZmEvCc58VunNJ+2bKjOpu15nck1332KO74jKwr5rK/0yU
	 h/gpA2uF+Ag05kx5vWGqYQkG/kMpJ9DoAMpThn4mCRgB+ovya2rVcRCqGveN4I3r+h
	 Ck3lVuDvQaMpWbLYbVyYzCnpOm5z5nzBRREodAt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A435DF804EB;
	Fri, 15 Oct 2021 18:38:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C077FF8025B; Fri, 15 Oct 2021 18:38:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8E9EF8025B
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 18:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8E9EF8025B
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="251395136"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="251395136"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 09:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="593028326"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 15 Oct 2021 09:38:23 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ALSA: hda: Fill gaps in NHLT endpoint-interface
Date: Fri, 15 Oct 2021 18:40:45 +0200
Message-Id: <20211015164047.44492-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015164047.44492-1-cezary.rojewski@intel.com>
References: <20211015164047.44492-1-cezary.rojewski@intel.com>
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
---
 include/sound/intel-nhlt.h | 20 ++++++++
 sound/hda/intel-nhlt.c     | 99 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index b7eec4b3ca01..2cd3f27b7a72 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -132,6 +132,12 @@ void intel_nhlt_free(struct acpi_table_nhlt *addr);
 
 int intel_nhlt_get_dmic_geo(struct acpi_table_nhlt *nhlt);
 
+bool intel_nhlt_has_endpoint_type(struct acpi_table_nhlt *nhlt, u8 link_type);
+struct nhlt_specific_cfg *
+intel_nhlt_get_endpoint_blob(struct acpi_table_nhlt *nhlt,
+			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
+			     u8 num_ch, u32 rate, u8 dir, u8 dev_type);
+
 #else
 
 struct acpi_table_nhlt;
@@ -149,6 +155,20 @@ static inline int intel_nhlt_get_dmic_geo(struct acpi_table_nhlt *nhlt)
 {
 	return 0;
 }
+
+bool intel_nhlt_has_endpoint_type(struct acpi_table_nhlt *nhlt, u8 link_type)
+{
+	return false;
+}
+
+struct nhlt_specific_cfg *
+intel_nhlt_get_endpoint_blob(struct acpi_table_nhlt *nhlt,
+			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
+			     u8 num_ch, u32 rate, u8 dir, u8 dev_type)
+{
+	return NULL;
+}
+
 #endif
 
 #endif
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index c41d20e1b349..d97fe57a7ef2 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -112,3 +112,102 @@ int intel_nhlt_get_dmic_geo(struct acpi_table_nhlt *nhlt)
 	return dmic_geo;
 }
 EXPORT_SYMBOL_GPL(intel_nhlt_get_dmic_geo);
+
+bool intel_nhlt_has_endpoint_type(struct acpi_table_nhlt *nhlt, u8 link_type)
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
+nhlt_get_specific_cfg(struct nhlt_fmt *fmt, u8 num_ch, u32 rate, u8 vbps, u8 bps)
+{
+	struct nhlt_fmt_cfg *cfg = fmt->fmt_config;
+	struct wav_fmt *wfmt;
+	u16 _bps, _vbps;
+	int i;
+
+	pr_debug("Endpoint format count=%d\n", fmt->fmt_count);
+
+	for (i = 0; i < fmt->fmt_count; i++) {
+		wfmt = &cfg->fmt_ext.fmt;
+		_bps = wfmt->bits_per_sample;
+		_vbps = cfg->fmt_ext.sample.valid_bits_per_sample;
+
+		pr_debug("Endpoint format: ch=%d fmt=%d/%d rate=%d\n",
+			 wfmt->channels, _vbps, _bps, wfmt->samples_per_sec);
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
+static bool nhlt_check_ep_match(struct nhlt_endpoint *epnt,
+				u32 bus_id, u8 link_type, u8 dir, u8 dev_type)
+{
+	pr_debug("Endpoint: vbus_id=%d link_type=%d dir=%d dev_type = %d\n",
+		 epnt->virtual_bus_id, epnt->linktype,
+		 epnt->direction, epnt->device_type);
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
+intel_nhlt_get_endpoint_blob(struct acpi_table_nhlt *nhlt,
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
+	pr_debug("Looking for configuration:\n");
+	pr_debug("  vbus_id=%d link_type=%d dir=%d, dev_type=%d\n",
+		 bus_id, link_type, dir, dev_type);
+	pr_debug("  ch=%d fmt=%d/%d rate=%d\n", num_ch, vbps, bps, rate);
+	pr_debug("Endpoint count=%d\n", nhlt->endpoint_count);
+
+	epnt = (struct nhlt_endpoint *)nhlt->desc;
+	for (i = 0; i < nhlt->endpoint_count; i++) {
+		if (nhlt_check_ep_match(epnt, bus_id, link_type, dir, dev_type)) {
+			fmt = (struct nhlt_fmt *)(epnt->config.caps + epnt->config.size);
+			cfg = nhlt_get_specific_cfg(fmt, num_ch, rate, vbps, bps);
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

