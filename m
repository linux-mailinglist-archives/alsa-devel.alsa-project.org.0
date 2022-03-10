Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6453A4D5031
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 18:25:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F28231A6A;
	Thu, 10 Mar 2022 18:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F28231A6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646933130;
	bh=17dMKMpGWFKh9fHXrqAUix47ZJF5Rmo5OBIssjvwsWM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gkMAKJTF1DkoGiIWWkFVuk/vW6J+3dO9tC/JaQz7Y78U841oaPqJl7V2wTxkA8EHV
	 ILbaFEA8SrCc2MEtwIAiLcniDKQLaUX4mMJMaZif0zJKqnkij+H5cGVgfB/io8yaMW
	 h4YnKsUiGBv7jf429bDUwGrmnMaUafJ/I5TP+i3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 837CEF80527;
	Thu, 10 Mar 2022 18:23:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50FA6F8051D; Thu, 10 Mar 2022 18:22:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54845F8013C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 18:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54845F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZkY3ThfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646932971; x=1678468971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=17dMKMpGWFKh9fHXrqAUix47ZJF5Rmo5OBIssjvwsWM=;
 b=ZkY3ThfE5rwPWLdk3i93eD3AtC0VfV7NDiKc+KzS39UMFudwN+HC742f
 uxlELjR5qagAQq8mSo1dyYqpsMEcM9kbyOwAAmcJo0S43aQ/CGP21ygyr
 dyatmNB9bnghXcyBEfKt1DTd4bV/tdlggZFvXhCYw6Slr7Xsw1Ddba2gt
 mEf4GlIF7ACja9BraUI52geTitXf0XYamsgRurL3cdbWudjFZj6USEWSY
 +QGPrieSkf4jQB4wwSW4JqWz5jfU8W+vmW3gmmam92KjQQhG0wHlD6X9/
 ivVcEi8MY4mYHgVjeDer9B4pTbCvguuvBkGc5rj8MJDOpq+61D3wVCU9n A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="235918923"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="235918923"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 09:22:42 -0800
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="554738649"
Received: from maxdorn-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.77.185])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 09:22:41 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: Intel: soc-acpi: Add entry for rt711-sdca-sdw in
 ADL match table
Date: Thu, 10 Mar 2022 11:16:51 -0600
Message-Id: <20220310171651.249385-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220310171651.249385-1-pierre-louis.bossart@linux.intel.com>
References: <20220310171651.249385-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 broonie@kernel.org, Muralidhar Reddy <muralidhar.reddy@intel.com>,
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

From: Muralidhar Reddy <muralidhar.reddy@intel.com>

RT711 sdca sdw is added with SDW0 link for ADL-PS platform.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Muralidhar Reddy <muralidhar.reddy@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 7c89a974b59f..8bfe7070b84a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -359,6 +359,15 @@ static const struct snd_soc_acpi_link_adr adl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr adlps_rvp[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr adl_chromebook_base[] = {
 	{
 		.mask = BIT(0),
@@ -529,6 +538,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt711.tplg",
 	},
+	{
+		.link_mask = 0x1, /* link0 required */
+		.links = adlps_rvp,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-rt711.tplg",
+	},
 	{
 		.link_mask = 0x5, /* rt5682 on link0 & 2xmax98373 on link 2 */
 		.links = adl_chromebook_base,
-- 
2.30.2

