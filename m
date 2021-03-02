Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B8232955C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 01:04:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D7D9167F;
	Tue,  2 Mar 2021 01:03:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D7D9167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614643444;
	bh=QpdJFayF9gMrD2kv9J7zHpHx/+7zX7Be9tOgS62PCks=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eWyVxYy3fKin/NAWbFhS6ZjIfQ3kJ5LgvC3/rt3A4mr+fRPsT3HwqqEImhU8Fx2+H
	 sAela1M3UV3gwRLufS5neeeKzmK62+MJoBo2WaUM8SsSjfSi7//RfXVr9Mf1bldiTz
	 4dNjB4XleWZwn88tZC5kdOcM71M1/hBSC8F8HMtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56BEAF8010B;
	Tue,  2 Mar 2021 01:02:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9960EF8025E; Tue,  2 Mar 2021 01:02:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D27FF800E0
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 01:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D27FF800E0
IronPort-SDR: E6LDGa62/Bq9BuR3wjp9uilCACKfrZA3Pp3tNzNEymNWEG+SRr2shDeS+JIe2xcj8Z0OcQz5D7
 /7n2WZJcuBUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="185960088"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="185960088"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:02:11 -0800
IronPort-SDR: oeep4Keda/T5vJPrSumhEflJKQqunJLa+b4Te4JCmkJL68nBM6uMWOnDyZu64t5IUT19CDFxT8
 bnz9tKwqbwaQ==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="599480473"
Received: from josemrod-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.215.233])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:02:10 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: intel-nhlt: verify config type
Date: Mon,  1 Mar 2021 18:01:46 -0600
Message-Id: <20210302000146.1177770-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>
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

Multiple bug reports report issues with the SOF and SST drivers when
dealing with single microphone cases.

We currently read the DMIC array information unconditionally but we
don't check that the configuration type is actually a mic array.

When the DMIC link does not rely on a mic array configuration, the
recommendation is to check the format information to infer the maximum
number of channels, and map this to the number of microphones.

This leaves a potential for a mismatch between actual microphones
available in hardware and what the ACPI table contains, but we have no
other source of information.

Note that single microphone configurations can alternatively be
handled with a 'mic array' configuration along with a 'vendor-defined'
geometry.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=201251
BugLink: https://github.com/thesofproject/linux/issues/2725
Fixes: 7a33ea70e1868 ('ALSA: hda: intel-nhlt: handle NHLT VENDOR_DEFINED DMIC geometry')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/intel-nhlt.h |  5 ++++
 sound/hda/intel-nhlt.c     | 54 +++++++++++++++++++++++++++++++-------
 2 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index 743c2f442280..d0574805865f 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -112,6 +112,11 @@ struct nhlt_vendor_dmic_array_config {
 	/* TODO add vendor mic config */
 } __packed;
 
+enum {
+	NHLT_CONFIG_TYPE_GENERIC = 0,
+	NHLT_CONFIG_TYPE_MIC_ARRAY = 1
+};
+
 enum {
 	NHLT_MIC_ARRAY_2CH_SMALL = 0xa,
 	NHLT_MIC_ARRAY_2CH_BIG = 0xb,
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 059aaf04f536..d053beccfaec 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -31,18 +31,44 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 	struct nhlt_endpoint *epnt;
 	struct nhlt_dmic_array_config *cfg;
 	struct nhlt_vendor_dmic_array_config *cfg_vendor;
+	struct nhlt_fmt *fmt_configs;
 	unsigned int dmic_geo = 0;
-	u8 j;
+	u16 max_ch = 0;
+	u8 i, j;
 
 	if (!nhlt)
 		return 0;
 
-	epnt = (struct nhlt_endpoint *)nhlt->desc;
+	for (j = 0, epnt = nhlt->desc; j < nhlt->endpoint_count; j++,
+	     epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length)) {
 
-	for (j = 0; j < nhlt->endpoint_count; j++) {
-		if (epnt->linktype == NHLT_LINK_DMIC) {
-			cfg = (struct nhlt_dmic_array_config  *)
-					(epnt->config.caps);
+		if (epnt->linktype != NHLT_LINK_DMIC)
+			continue;
+
+		cfg = (struct nhlt_dmic_array_config  *)(epnt->config.caps);
+		fmt_configs = (struct nhlt_fmt *)(epnt->config.caps + epnt->config.size);
+
+		/* find max number of channels based on format_configuration */
+		if (fmt_configs->fmt_count) {
+			dev_dbg(dev, "%s: found %d format definitions\n",
+				__func__, fmt_configs->fmt_count);
+
+			for (i = 0; i < fmt_configs->fmt_count; i++) {
+				struct wav_fmt_ext *fmt_ext;
+
+				fmt_ext = &fmt_configs->fmt_config[i].fmt_ext;
+
+				if (fmt_ext->fmt.channels > max_ch)
+					max_ch = fmt_ext->fmt.channels;
+			}
+			dev_dbg(dev, "%s: max channels found %d\n", __func__, max_ch);
+		} else {
+			dev_dbg(dev, "%s: No format information found\n", __func__);
+		}
+
+		if (cfg->device_config.config_type != NHLT_CONFIG_TYPE_MIC_ARRAY) {
+			dmic_geo = max_ch;
+		} else {
 			switch (cfg->array_type) {
 			case NHLT_MIC_ARRAY_2CH_SMALL:
 			case NHLT_MIC_ARRAY_2CH_BIG:
@@ -59,13 +85,23 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 				dmic_geo = cfg_vendor->nb_mics;
 				break;
 			default:
-				dev_warn(dev, "undefined DMIC array_type 0x%0x\n",
-					 cfg->array_type);
+				dev_warn(dev, "%s: undefined DMIC array_type 0x%0x\n",
+					 __func__, cfg->array_type);
+			}
+
+			if (dmic_geo > 0) {
+				dev_dbg(dev, "%s: Array with %d dmics\n", __func__, dmic_geo);
+			}
+			if (max_ch > dmic_geo) {
+				dev_dbg(dev, "%s: max channels %d exceed dmic number %d\n",
+					__func__, max_ch, dmic_geo);
 			}
 		}
-		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
 	}
 
+	dev_dbg(dev, "%s: dmic number %d max_ch %d\n",
+		__func__, dmic_geo, max_ch);
+
 	return dmic_geo;
 }
 EXPORT_SYMBOL_GPL(intel_nhlt_get_dmic_geo);
-- 
2.25.1

