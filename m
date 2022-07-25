Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D95804C3
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 21:51:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39B4A83A;
	Mon, 25 Jul 2022 21:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39B4A83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658778671;
	bh=FCb2kFpneo6sqFK69O9mGm79+7DzT1NcajCiS6u/eAI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lGsCR+5gqhAS6uEWUwwu+USBI8PXu5eINmiAP2ADt7ehpkaqqZlV4HP5UHYSzI/YT
	 SOF6ZqOga6FuA3UqM4oRgubS7y+ArXM3843R7458Eg/NGGo0ttGyz5Rq1EmyrkH/sg
	 TPsbEypKPR43Ex57JM3qxk/0TU5zhZMYQpYR/jcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE56FF802DF;
	Mon, 25 Jul 2022 21:49:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60A4FF80155; Mon, 25 Jul 2022 21:49:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD896F80128
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 21:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD896F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CNfP4mMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778571; x=1690314571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FCb2kFpneo6sqFK69O9mGm79+7DzT1NcajCiS6u/eAI=;
 b=CNfP4mMzxWMSAwMOMNTKwk5olHph5klge3JNa00+4yaJ6K+s6zuupssz
 P8MdtqvbZygynPs7uCQkuTqLqwlDhj95TAEwADKoMa8iLy5wrHlbQUduA
 nE4TMyTJysjxYUr89IMtu5mMpezSrhbB10dS5XzJhJOLFlADjQH7wwacd
 Wyxd3sV7yZ75wPKX3T4uWZ0HGM3+JDUOFEZ9XFEzFIy1723gGIRwLfQam
 IIHCCXjk9YUiKhtBOZZ+y/VHfpAd00sYQOxDHLbmnmXubASPoqPQHBehz
 8ncsqJbWXx1+sUvu1DPGMHvCvchM7piVDt03tm2oIxonKQFHz4X3PeuUr A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="267553899"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="267553899"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:21 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="632479429"
Received: from mbianco-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.71.159])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/10] ASoC: Intel: sof_sdw: add support for Dell SKU 0AF0
Date: Mon, 25 Jul 2022 14:49:00 -0500
Message-Id: <20220725194909.145418-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
References: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Somehow this device was not added in the initial AlderLake batch.
From the ACPI definition this looks like a standard SDCA version with
RT711 on link0, RT1316 on link1/2 and RT714 on link3.

BugLink: https://github.com/thesofproject/linux/issues/3772
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 12f243ef04bf..a49bfaab6b21 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -246,6 +246,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AF0")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2 |
+					SOF_SDW_FOUR_SPK),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.34.1

