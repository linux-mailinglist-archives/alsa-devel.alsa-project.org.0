Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E614D2172
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:28:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75F141898;
	Tue,  8 Mar 2022 20:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75F141898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767734;
	bh=7aEi+ev1LAZnnatkTM38uBcSHka2wqOlb1eNtSgSHCg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BOqAhkb2xF8kuOYaapAHpHnyd4XvAGIL/XA723sSe/s70EX6QTJPCnjdR6O+7oLO7
	 yOwkKotzjf3/7Pom76mO51hVd6IvZanhewvrB/w3tNnV2xB564ducsnvjqF4PcqVZP
	 oLjt5SjQ1Uuts0+AePAV1HiLSxMMkecG1imQKnwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED6B5F80279;
	Tue,  8 Mar 2022 20:26:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C4CEF80518; Tue,  8 Mar 2022 20:26:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 805A9F8026D
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 805A9F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WLNkHnD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767604; x=1678303604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7aEi+ev1LAZnnatkTM38uBcSHka2wqOlb1eNtSgSHCg=;
 b=WLNkHnD3rMWsUccatVJJmp1VK7oo7SrDb5i6yU82TqfsZqiNqn03Qlxe
 WFbgj6n7va/zx0hJPS7PIobVy7wWQUzPo58ofqD9jynO4UqcGPbmAeFTD
 rRJ+63TqbhfKEmopq86eA8ve/0TQIIaGj1Tt8qTZPd1bSXuWNqfa0df3b
 xBmmtn0GHoF8MCFJaVziPMtOdIymA7ez6jijaQ9sQDCWz+ALvvt01Tif+
 2M+SjvA4+XNBT1k4LWV1FMTrGgXaHe/3qVdtjJXFBYmRIxAnHVwXN3gtX
 MKSQPNo4sSgC7XmJiGGCnCzNE34g2mQkYvqjclh3FgTr6fwOkP9A7duOl g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363683"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363683"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:40 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573943"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:39 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/20] ALSA: intel-nhlt: add helper to detect SSP link mask
Date: Tue,  8 Mar 2022 13:25:54 -0600
Message-Id: <20220308192610.392950-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The NHLT information can be used to figure out which SSPs are enabled
in a platform.

The 'SSP' link type is too broad for machine drivers, since it can
cover the Bluetooth sideband and the analog audio codec connections,
so this helper exposes a parameter to filter with the device
type (DEVICE_I2S refers to analog audio codec in NHLT parlance).

The helper returns a mask, since more than one SSP may be used for
analog audio, e.g. the NHLT spec describes the use of SSP0 for
amplifiers and SSP1 for headset codec. Note that if more than one bit
is set, it's impossible to determine which SSP is connected to what
external component. Additional platform-specific information based on
e.g. DMI quirks would still be required in the machine driver to
configure the relevant dailinks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/intel-nhlt.h | 22 +++++++++++++++-------
 sound/hda/intel-nhlt.c     | 22 ++++++++++++++++++++++
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index 089a760d36eb..6fb2d5e378fd 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -18,6 +18,13 @@ enum nhlt_link_type {
 	NHLT_LINK_INVALID
 };
 
+enum nhlt_device_type {
+	NHLT_DEVICE_BT = 0,
+	NHLT_DEVICE_DMIC = 1,
+	NHLT_DEVICE_I2S = 4,
+	NHLT_DEVICE_INVALID
+};
+
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
 
 struct wav_fmt {
@@ -41,13 +48,6 @@ struct wav_fmt_ext {
 	u8 sub_fmt[16];
 } __packed;
 
-enum nhlt_device_type {
-	NHLT_DEVICE_BT = 0,
-	NHLT_DEVICE_DMIC = 1,
-	NHLT_DEVICE_I2S = 4,
-	NHLT_DEVICE_INVALID
-};
-
 struct nhlt_specific_cfg {
 	u32 size;
 	u8 caps[];
@@ -133,6 +133,9 @@ void intel_nhlt_free(struct nhlt_acpi_table *addr);
 int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt);
 
 bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt, u8 link_type);
+
+int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8 device_type);
+
 struct nhlt_specific_cfg *
 intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
@@ -163,6 +166,11 @@ static inline bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt,
 	return false;
 }
 
+static inline int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8 device_type)
+{
+	return 0;
+}
+
 static inline struct nhlt_specific_cfg *
 intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 128476aa7c61..4063da378283 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -130,6 +130,28 @@ bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt, u8 link_type)
 }
 EXPORT_SYMBOL(intel_nhlt_has_endpoint_type);
 
+int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8 device_type)
+{
+	struct nhlt_endpoint *epnt;
+	int ssp_mask = 0;
+	int i;
+
+	if (!nhlt || (device_type != NHLT_DEVICE_BT && device_type != NHLT_DEVICE_I2S))
+		return 0;
+
+	epnt = (struct nhlt_endpoint *)nhlt->desc;
+	for (i = 0; i < nhlt->endpoint_count; i++) {
+		if (epnt->linktype == NHLT_LINK_SSP && epnt->device_type == device_type) {
+			/* for SSP the virtual bus id is the SSP port */
+			ssp_mask |= BIT(epnt->virtual_bus_id);
+		}
+		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
+	}
+
+	return ssp_mask;
+}
+EXPORT_SYMBOL(intel_nhlt_ssp_endpoint_mask);
+
 static struct nhlt_specific_cfg *
 nhlt_get_specific_cfg(struct device *dev, struct nhlt_fmt *fmt, u8 num_ch,
 		      u32 rate, u8 vbps, u8 bps)
-- 
2.30.2

