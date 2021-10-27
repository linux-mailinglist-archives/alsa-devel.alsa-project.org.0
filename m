Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6636C43BFB8
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 04:23:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDADD16E8;
	Wed, 27 Oct 2021 04:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDADD16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635301414;
	bh=nQUSFzgiKXEYoZBrw+1NF5KzV+o3Iiau1jA2StphXK4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ScBHKVS/EqgWsPskqcuLYaZkdY/4wI0kWfNBngwAawXj2v5EZhcAXSRyHxqf+qUn6
	 sbdFpdstPLqUUopO4Rhn135Ahr9BiWwWZn537KA0exptWuA2cSAR/AcJjY+IwI0uyN
	 Jv/mnE6GjLqnwIrtfsIGzoakQgagj8KWP0pfslRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6B1AF80527;
	Wed, 27 Oct 2021 04:19:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FEACF804E6; Wed, 27 Oct 2021 04:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBC97F804E6
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 04:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBC97F804E6
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217229425"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="217229425"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="486446325"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 10/10] ASoC: intel: sof_sdw: add link adr order check
Date: Wed, 27 Oct 2021 10:18:24 +0800
Message-Id: <20211027021824.24776-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
References: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
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
---
 sound/soc/intel/boards/sof_sdw.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d9321fff4284..999ed6e80175 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -530,10 +530,11 @@ static inline int find_codec_info_acpi(const u8 *acpi_id)
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
@@ -559,6 +560,12 @@ static int get_sdw_dailink_info(const struct snd_soc_acpi_link_adr *links,
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
@@ -1067,7 +1074,7 @@ static int sof_card_dai_links_create(struct device *dev,
 	ssp_num = ssp_codec_index >= 0 ? hweight_long(ssp_mask) : 0;
 	comp_num = hdmi_num + ssp_num;
 
-	ret = get_sdw_dailink_info(mach_params->links,
+	ret = get_sdw_dailink_info(dev, mach_params->links,
 				   &sdw_be_num, &sdw_cpu_dai_num);
 	if (ret < 0) {
 		dev_err(dev, "failed to get sdw link info %d", ret);
-- 
2.17.1

