Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1726AE1B2
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:07:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DCAC146F;
	Tue,  7 Mar 2023 15:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DCAC146F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678198051;
	bh=dd8IUdzPOPW/SeT5MvRw1CdybsiKdQwcr2GuBykiVHg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KbO7e/wsgGAcQQ6o+SN5/RiI3IJYIwzJVJEhyCycMd5SFQGTvL1tre/TYufS4ok69
	 D8NZQkaw9mKqRnGGFvuKKGA50+Cy6H26335xfz5T7F4c8ZOBMB7xCxAhePmLTMtVZo
	 2apsBJssw83OlU+9o9lppcK0YRG9lNbXY1udpwQs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DABF0F80564;
	Tue,  7 Mar 2023 15:04:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7176FF8042F; Tue,  7 Mar 2023 15:04:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BE72F804B1
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BE72F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RzBlXdkI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197872; x=1709733872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dd8IUdzPOPW/SeT5MvRw1CdybsiKdQwcr2GuBykiVHg=;
  b=RzBlXdkIIEsJF1cxTE7peKpgjeYoUXPio0UHl2NpEXAn0A6IToO6Tbin
   K9RQrhW5zVvSInaVMS0yqvFaP1BrQI2aPL9+NUK8xuCsdgdz2fu0cq7qH
   jTP1Z3QQMGRnwVZVfM4TmynXb9iriQmPAzZdqHczYsdJtPWncKh5VkUbr
   quW+A+49fAt66uDQwK6n4Jw+X80nuL1CbAGJXCIdAzE5GZBSyXrMVVOqS
   0b++4wnkRs+TB0+ghvmgoQniMGa5hK0rv0xRCB1oRLVUUMWdNJyJQZioR
   MnX4NXhxeECnKfwuRMpoR2ahcIongZVOtU5JDkRQoQ6qB2sh8btu2lt2v
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255241"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255241"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706959"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706959"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:28 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 06/14] ASoC: SOF: Intel: hda-dai: Use the dai argument in
 ipc4_hda_dai_trigger
Date: Tue,  7 Mar 2023 16:04:27 +0200
Message-Id: <20230307140435.2808-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F3MV4VXVZUFA3V55CYNO7PWKHNLWGFBH
X-Message-ID-Hash: F3MV4VXVZUFA3V55CYNO7PWKHNLWGFBH
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3MV4VXVZUFA3V55CYNO7PWKHNLWGFBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

No need to define a new variable and look it up again.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index e448c653cfe1..49f25e55b15d 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -426,14 +426,12 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 	struct snd_sof_widget *swidget;
 	struct snd_soc_dapm_widget *w;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai;
 	int ret;
 
 	dev_dbg(dai->dev, "cmd=%d dai %s direction %d\n", cmd,
 		dai->name, substream->stream);
 
 	rtd = asoc_substream_to_rtd(substream);
-	cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	w = snd_soc_dai_get_widget(dai, substream->stream);
@@ -478,7 +476,7 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 
 		pipeline->state = SOF_IPC4_PIPE_RESET;
 
-		ret = hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai);
+		ret = hda_link_dma_cleanup(substream, hext_stream, dai, codec_dai);
 		if (ret < 0) {
 			dev_err(sdev->dev, "%s: failed to clean up link DMA\n", __func__);
 			return ret;
-- 
2.39.2

