Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 709EC20A5CA
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:29:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 134A21ADC;
	Thu, 25 Jun 2020 21:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 134A21ADC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593113364;
	bh=I4uUcja2Hm3siBw68PgEixKwaRg9vL5ZFEzAapyR91w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IPDIO9lvxNHB3s3ymP0hkLJ/CnYlFjKQbEA0nS6qYZT+gG+ILxoEI+rc0JrcRGeCu
	 F0NZAQPeJgsXgTshw55r/lH1oDlyuEhDVD5Nn6xqQqhIPNOBIycJHDRwWFxKSHLwio
	 D0M1kc72WizloTdouHFcBOi8u4CreqXVDR7P29AM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA058F802BD;
	Thu, 25 Jun 2020 21:27:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EFF2F80249; Thu, 25 Jun 2020 21:27:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46231F802A9
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46231F802A9
IronPort-SDR: igCatUId7NBlf8OnLGnA76yozX8XYW1UrO47JpPmjf5dJaov/g8EcXKrsTxoVZbRNe3gM5GU+z
 Imjz79PQryMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="144124523"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="144124523"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:27:18 -0700
IronPort-SDR: XrHROTF4gQSIavbYUoDJzMm6iRTKbaTh/wa1tldlNWFjHQXyV4LVLFPjwdpps0Im1EvCCcGU/O
 ZWLX2KSt/8CQ==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="311198256"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:27:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/17] ASoC: Intel: common: add match table for TGL MAX98373 +
 RT5682 SoundWire driver
Date: Thu, 25 Jun 2020 14:27:08 -0500
Message-Id: <20200625192708.4416-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Naveen Manohar <naveen.m@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Naveen Manohar <naveen.m@intel.com>

RT5682 is in Soundwire mode on Link0 & 2x MAX98373 on link1.

Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-tgl-match.c   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 5a56f4359479..2ffa608d987d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -56,6 +56,19 @@ static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device mx8373_1_adr[] = {
+	{
+		.adr = 0x000123019F837300,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+	},
+	{
+		.adr = 0x000127019F837300,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt5682_0_adr[] = {
 	{
 		.adr = 0x000021025D568200,
@@ -93,6 +106,11 @@ static const struct snd_soc_acpi_link_adr tgl_chromebook_base[] = {
 		.num_adr = ARRAY_SIZE(rt5682_0_adr),
 		.adr_d = rt5682_0_adr,
 	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(mx8373_1_adr),
+		.adr_d = mx8373_1_adr,
+	},
 	{}
 };
 
@@ -139,6 +157,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-rt711-rt1308.tplg",
 	},
+	{
+		.link_mask = 0x3, /* rt5682 on link0 & 2xmax98373 on link 1 */
+		.links = tgl_chromebook_base,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-tgl.ri",
+		.sof_tplg_filename = "sof-tgl-sdw-max98373-rt5682.tplg",
+	},
 	{
 		.link_mask = 0x1, /* this will only enable rt5682 for now */
 		.links = tgl_chromebook_base,
-- 
2.20.1

