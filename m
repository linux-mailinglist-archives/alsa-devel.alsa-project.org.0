Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E34845046D
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 13:27:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDB2116B8;
	Mon, 15 Nov 2021 13:26:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDB2116B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636979268;
	bh=hw/zwd0vk6VJmIq+J8g31oZHknhIfUlWEtMDkWirOSQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VPHUro38vrYC2n5w3s5T4CU3v9jH9MHnifUMmRkJBIueoog5mvTYy70bSw3K1zbOq
	 damtpCnwfSYEiM+Z0ix3fGnBavUn6Mi22oVkp+MuiUYtrnfnbekAmDaAtWob1ImhkS
	 HeHJrXFc7c9kedEj2LCmaYysSmlpuQG0Uxp1RJag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CAF7F80539;
	Mon, 15 Nov 2021 13:23:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24171F80520; Mon, 15 Nov 2021 13:23:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2CF5F804F3
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 13:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2CF5F804F3
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220639153"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="220639153"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:23:11 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="505899138"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:23:09 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [RESEND PATCH 10/10] ASoC: intel: sof_sdw: add link adr order check
Date: Mon, 15 Nov 2021 20:22:41 +0800
Message-Id: <20211115122241.13242-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115122241.13242-1-yung-chuan.liao@linux.intel.com>
References: <20211115122241.13242-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

We assume the adr order described in a snd_soc_acpi_link_adr array is
jack -> amp -> mic. We follow the same order to implement the topology.
We will need a special topology if we configure a snd_soc_acpi_link_adr
array with different order. Adding a check and a warning message can
remind people to keep the order when adding a new snd_soc_acpi_link_adr
array.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index df29f7b478a4..de303a980879 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -599,10 +599,11 @@ static inline int find_codec_info_acpi(const u8 *acpi_id)
  * Since some sdw slaves may be aggregated, the CPU DAI number
  * may be larger than the number of BE dailinks.
  */
-static int get_sdw_dailink_info(const struct snd_soc_acpi_link_adr *links,
+static int get_sdw_dailink_info(struct device *dev, const struct snd_soc_acpi_link_adr *links,
 				int *sdw_be_num, int *sdw_cpu_dai_num)
 {
 	const struct snd_soc_acpi_link_adr *link;
+	int _codec_type = SOF_SDW_CODEC_TYPE_JACK;
 	bool group_visited[SDW_MAX_GROUPS];
 	bool no_aggregation;
 	int i;
@@ -628,6 +629,12 @@ static int get_sdw_dailink_info(const struct snd_soc_acpi_link_adr *links,
 		if (codec_index < 0)
 			return codec_index;
 
+		if (codec_info_list[codec_index].codec_type < _codec_type)
+			dev_warn(dev,
+				 "Unexpected address table ordering. Expected order: jack -> amp -> mic\n");
+
+		_codec_type = codec_info_list[codec_index].codec_type;
+
 		endpoint = link->adr_d->endpoints;
 
 		/* count DAI number for playback and capture */
@@ -1136,7 +1143,7 @@ static int sof_card_dai_links_create(struct device *dev,
 	ssp_num = ssp_codec_index >= 0 ? hweight_long(ssp_mask) : 0;
 	comp_num = hdmi_num + ssp_num;
 
-	ret = get_sdw_dailink_info(mach_params->links,
+	ret = get_sdw_dailink_info(dev, mach_params->links,
 				   &sdw_be_num, &sdw_cpu_dai_num);
 	if (ret < 0) {
 		dev_err(dev, "failed to get sdw link info %d", ret);
-- 
2.17.1

