Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B67624DD8
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 23:57:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6309E1652;
	Thu, 10 Nov 2022 23:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6309E1652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668121023;
	bh=VGlH5GhfLEic8kRjr4021dFEJa7G0hebO9wt5hfWNiI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WziqGuXgRHjMv0D24h4WypnBtNnz6IENsIGSzJqqcKFDydMxiXDU/QrxwXEOBWkxL
	 fg7mQqxyxCmBktLnBTzKsoPEGuwf9z1FtCpRtTFjPKsFbYL4KI3L9IH4eOHu0SUrIB
	 TS0jYl94MktE6gxtmPKd/F1biIF6HKUP5Yt4tHaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A3DCF80568;
	Thu, 10 Nov 2022 23:55:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F8A9F8055A; Thu, 10 Nov 2022 23:55:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D5C5F80548
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 23:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D5C5F80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nqxqHyw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668120914; x=1699656914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VGlH5GhfLEic8kRjr4021dFEJa7G0hebO9wt5hfWNiI=;
 b=nqxqHyw3W5gdEDPHNX+/2rbnoPWkJOKv8IgWLtICe/6R73vfk3Q3H5L1
 jhhiux1S7mq7lszcF0aEkYkYGdoWycVkGii3bUPXNbHFWx8nADORhrd1N
 WR2NaA8LdH360vu7nHyJrCS9/4w/8CjiflPTTet33nUnHo4Nii8PGIM96
 bH0G354uYSnn4dxINe0lD2zhOK9MCsE/HdQjIK/rfC/DJy9gTkUOdMV1C
 GFIRA18ge2NhygOMYw5r0fADrOCBTOXTDC3XVLTv2BztjdQCeOmYCE4XC
 Ddu9+IYewnlO6d5AEjwDDA+zyMldP3prwCHQV4RsuNURKlCS1QSCX2CkT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="373588041"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="373588041"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 14:55:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670533797"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="670533797"
Received: from tleibov-mobl.ger.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.214.199.216])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 14:55:08 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: Intel: sof_sdw: Add support for SKU 0C40 product
Date: Thu, 10 Nov 2022 16:54:30 -0600
Message-Id: <20221110225432.144184-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110225432.144184-1-pierre-louis.bossart@linux.intel.com>
References: <20221110225432.144184-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Gongjun Song <gongjun.song@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
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

From: Gongjun Song <gongjun.song@intel.com>

SKU 0C40 product supports a SoundWire headset codec, SoundWire
capture from local microphones and two SoundWire amplifiers.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index ed4ca10b67104..47f743debc72c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -366,6 +366,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					SOF_SDW_FOUR_SPK),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C40")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2 |
+					SOF_SDW_FOUR_SPK),
+	},
 	/* MeteorLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.34.1

