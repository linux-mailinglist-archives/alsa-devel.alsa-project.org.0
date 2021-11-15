Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6B3450467
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 13:27:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EBC016C0;
	Mon, 15 Nov 2021 13:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EBC016C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636979223;
	bh=LwH9RJPEcQd2fVkvTJkdYkAiCKJXGIKc1HV868ubq+c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PNKEQQCsWgOMpTKhAe9gZ+Ok98HbWlM6E+Si677vXmw0h0twkLvuhJNzpbZQJJLHb
	 oml8nbgAcicI8PT3DSzz9HKo2dZUMtORvX01brQ3I4WkWXULl5HVjogCcPdLje/9pK
	 C2eWpOi6GEma+nfZkenVgduVo5pp7fMHnljUCj6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDCADF8051E;
	Mon, 15 Nov 2021 13:23:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 555B7F80516; Mon, 15 Nov 2021 13:23:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C7BDF804ED
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 13:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C7BDF804ED
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220639142"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="220639142"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:23:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="505899119"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:23:05 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [RESEND PATCH 08/10] ASoC: intel: sof_sdw: remove
 sof_sdw_mic_codec_mockup_init
Date: Mon, 15 Nov 2021 20:22:39 +0800
Message-Id: <20211115122241.13242-9-yung-chuan.liao@linux.intel.com>
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

Now, we set DAI link id as SDW_DMIC_DAI_ID for all DMICs.
No need to set it in sof_sdw_mic_codec_mockup_init.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 72bc7da2d21e..aac493aea002 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -429,20 +429,6 @@ static const struct snd_soc_ops sdw_ops = {
 	.shutdown = sdw_shutdown,
 };
 
-static int sof_sdw_mic_codec_mockup_init(struct snd_soc_card *card,
-					 const struct snd_soc_acpi_link_adr *link,
-					 struct snd_soc_dai_link *dai_links,
-					 struct sof_sdw_codec_info *info,
-					 bool playback)
-{
-	/*
-	 * force DAI link to use same ID as RT715 and DMIC
-	 * to reuse topologies
-	 */
-	dai_links->id = SDW_DMIC_DAI_ID;
-	return 0;
-}
-
 static struct sof_sdw_codec_info codec_info_list[] = {
 	{
 		.part_id = 0x700,
@@ -565,7 +551,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.version_id = 0,
 		.direction = {false, true},
 		.dai_name = "sdw-mockup-aif1",
-		.init = sof_sdw_mic_codec_mockup_init,
 		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 };
-- 
2.17.1

