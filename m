Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD755BCB35
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 13:56:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0434B166A;
	Mon, 19 Sep 2022 13:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0434B166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663588575;
	bh=pxEBEw1Rki9mh5QyGmKV45nWzJrpGS+jzk3fEXDNqHU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KLigbhGGEb6SWjDrG2K3Ld8SyMD76jGmFyofpJcURd/JFW84Aawpat8SQ4kZrKfCr
	 bl+BjHXTzlKO68OMQrjb2kwhzT30jgJcxHCxnvri2xjmrEel4VJCuWD8rgierWNTbE
	 TfITZM7I/+sVUWdRXPeDmL+UcYlFk9QiI5oG7iiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 580B0F80552;
	Mon, 19 Sep 2022 13:54:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB508F80551; Mon, 19 Sep 2022 13:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04E9FF804FF
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 13:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04E9FF804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U4LvRS8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663588466; x=1695124466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxEBEw1Rki9mh5QyGmKV45nWzJrpGS+jzk3fEXDNqHU=;
 b=U4LvRS8y0t03kNea0PfC026tqf5lF/7ccnqgG/nUh9LBcQsy7r8pOLi4
 swYfqHC8buu7XwSF1XxaqMLsWJjD1SCe30Okjp/W8QzQR2OlNTPNdPwx9
 l7HQxcAr0DF7gEbLegyqhLN+hS5V2sE8cTNuY6Gd0InxmzH756lRLWd/c
 e3pWfBedbztmfsAmXpBjIhJISi8ynv2V1d6u4B1ScBxNby9gpSqwkHRK8
 wOkYt/fKCY357QMitwnMERLyxrizqUB2ZPXnpkgTKMWEqenxmzhQsIMaQ
 NsCA52XvyUvAg0G8JDF8CVisIFpM2UOYk5zFWGwbTSrF6Mt21fk/W7+4/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="300198282"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="300198282"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:54:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="744086906"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:54:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/4] ALSA: hda: intel-nhlt: add intel_nhlt_ssp_mclk_mask()
Date: Mon, 19 Sep 2022 13:53:49 +0200
Message-Id: <20220919115350.43104-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919115350.43104-1-pierre-louis.bossart@linux.intel.com>
References: <20220919115350.43104-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

SOF topologies hard-code the MCLK used for SSP connections. That was a
bad idea in hindsight, this information should really come from BIOS
and/or machine driver.

This patch introduces a helper to scan all SSP endpoints connected to
a codec, and all formats to see what MCLK is used. When BIT(0) of the
mdivc offset if set in the SSP blob, MCLK0 is used, and likewise when
BIT(1) is set MCLK1 is used.

The case where both MCLKs are used is possible but has never been seen
in practice so should be treated as an error by the caller.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/intel-nhlt.h |  7 ++++
 sound/hda/intel-nhlt.c     | 79 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index 3d5cf201cd802..53470d6a28d65 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -136,6 +136,8 @@ bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt, u8 link_type);
 
 int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8 device_type);
 
+int intel_nhlt_ssp_mclk_mask(struct nhlt_acpi_table *nhlt, int ssp_num);
+
 struct nhlt_specific_cfg *
 intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
@@ -169,6 +171,11 @@ static inline int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8
 	return 0;
 }
 
+static inline int intel_nhlt_ssp_mclk_mask(struct nhlt_acpi_table *nhlt, int ssp_num)
+{
+	return 0;
+}
+
 static inline struct nhlt_specific_cfg *
 intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 13bb0ccfb36c0..2c4dfc0b7e342 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -157,6 +157,85 @@ int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8 device_type)
 }
 EXPORT_SYMBOL(intel_nhlt_ssp_endpoint_mask);
 
+#define SSP_BLOB_V1_0_SIZE		84
+#define SSP_BLOB_V1_0_MDIVC_OFFSET	19 /* offset in u32 */
+
+#define SSP_BLOB_V1_5_SIZE		96
+#define SSP_BLOB_V1_5_MDIVC_OFFSET	21 /* offset in u32 */
+#define SSP_BLOB_VER_1_5		0xEE000105
+
+#define SSP_BLOB_V2_0_SIZE		88
+#define SSP_BLOB_V2_0_MDIVC_OFFSET	20 /* offset in u32 */
+#define SSP_BLOB_VER_2_0		0xEE000200
+
+int intel_nhlt_ssp_mclk_mask(struct nhlt_acpi_table *nhlt, int ssp_num)
+{
+	struct nhlt_endpoint *epnt;
+	struct nhlt_fmt *fmt;
+	struct nhlt_fmt_cfg *cfg;
+	int mclk_mask = 0;
+	int i, j;
+
+	if (!nhlt)
+		return 0;
+
+	epnt = (struct nhlt_endpoint *)nhlt->desc;
+	for (i = 0; i < nhlt->endpoint_count; i++) {
+
+		/* we only care about endpoints connected to an audio codec over SSP */
+		if (epnt->linktype == NHLT_LINK_SSP &&
+		    epnt->device_type == NHLT_DEVICE_I2S &&
+		    epnt->virtual_bus_id == ssp_num) {
+
+			fmt = (struct nhlt_fmt *)(epnt->config.caps + epnt->config.size);
+			cfg = fmt->fmt_config;
+
+			/*
+			 * In theory all formats should use the same MCLK but it doesn't hurt to
+			 * double-check that the configuration is consistent
+			 */
+			for (j = 0; j < fmt->fmt_count; j++) {
+				u32 *blob;
+				int mdivc_offset;
+				int size;
+
+				/* first check we have enough data to read the blob type */
+				if (cfg->config.size < 8)
+					return -EINVAL;
+
+				blob = (u32 *)cfg->config.caps;
+
+				if (blob[1] == SSP_BLOB_VER_2_0) {
+					mdivc_offset = SSP_BLOB_V2_0_MDIVC_OFFSET;
+					size = SSP_BLOB_V2_0_SIZE;
+				} else if (blob[1] == SSP_BLOB_VER_1_5) {
+					mdivc_offset = SSP_BLOB_V1_5_MDIVC_OFFSET;
+					size = SSP_BLOB_V1_5_SIZE;
+				} else {
+					mdivc_offset = SSP_BLOB_V1_0_MDIVC_OFFSET;
+					size = SSP_BLOB_V1_0_SIZE;
+				}
+
+				/* make sure we have enough data for the fixed part of the blob */
+				if (cfg->config.size < size)
+					return -EINVAL;
+
+				mclk_mask |=  blob[mdivc_offset] & GENMASK(1, 0);
+
+				cfg = (struct nhlt_fmt_cfg *)(cfg->config.caps + cfg->config.size);
+			}
+		}
+		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
+	}
+
+	/* make sure only one MCLK is used */
+	if (hweight_long(mclk_mask) != 1)
+		return -EINVAL;
+
+	return mclk_mask;
+}
+EXPORT_SYMBOL(intel_nhlt_ssp_mclk_mask);
+
 static struct nhlt_specific_cfg *
 nhlt_get_specific_cfg(struct device *dev, struct nhlt_fmt *fmt, u8 num_ch,
 		      u32 rate, u8 vbps, u8 bps)
-- 
2.34.1

