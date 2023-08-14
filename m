Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F17B77C3D8
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 01:17:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C41DF86F;
	Tue, 15 Aug 2023 01:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C41DF86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692055027;
	bh=R89cuCVokIDISHiW8JpqH4jQOuUTegLpxpKa407D7ME=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XdzqR555mZjfxO1gIykJJ4h0kCGPosRcJ1T8g0nnHbsFV46TABDPdrArfM8G1giTi
	 EGYNMnouAFqd/C4mv/QBSWXy4X3i/Pa3R3q3U8S0ZRklFWt2YranLyHHUirZJVprI9
	 FyGzb2mqY29xJzjdDZjdaa8h6Wz8pHp0Yqb2sOpE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22CBBF8055A; Tue, 15 Aug 2023 01:15:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9663AF80272;
	Tue, 15 Aug 2023 01:15:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96FE6F80290; Tue, 15 Aug 2023 01:15:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9948F80272
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 01:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9948F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kPXQkyqX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692054930; x=1723590930;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R89cuCVokIDISHiW8JpqH4jQOuUTegLpxpKa407D7ME=;
  b=kPXQkyqXMp6mhahYGNciGMcn2tpy6Vp+qIAyFvuOHiabrEZ10cX7hqEL
   4B8AsddUMWpZ6WOXi1MpoBp6rzBhp1yy2MmkRNoM5+YKigM/3MMocU6oK
   XG+U6YHNibNp7Goh4YEF79CW6SYEtOee4cBsSuNmwkHSsjIr9P7xbW+to
   64PItkYnPNCMkSqzgiQFtv7HvZg0hdVmA8k2GACaj4y4uEO3L1ovNq7aZ
   5zaNpJR6UawXc9TVkUaseWpozktRBPVanhxg9PAzzYJzoWig/1Q1hpscs
   h+DCthOSYQnzNOXp6iUWkb8rESPtLeev9EzhBz+ICLY8ne5E4NzGv774J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403136995"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="403136995"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="683460291"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="683460291"
Received: from dishasur-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.104.139])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:15:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Chao Song <chao.song@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: SOF: Intel: Refactor code for HDA stream creation
Date: Mon, 14 Aug 2023 18:15:19 -0500
Message-Id: <20230814231519.79051-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GJY5XEWECKCFR2S5VCTMK72KAEDF6AD2
X-Message-ID-Hash: GJY5XEWECKCFR2S5VCTMK72KAEDF6AD2
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJY5XEWECKCFR2S5VCTMK72KAEDF6AD2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

Existing HDA stream creation is split into two
for loops for capture and playback, but most of
the code in the two for loops are duplicated.

This patch refactors HDA stream creation with a
single for loop, thus remove code duplication.

No functional change in this patch.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 68 ++++----------------------------
 1 file changed, 8 insertions(+), 60 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index b13acb959653..0b0087abcc50 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -869,8 +869,8 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 		return -ENOMEM;
 	}
 
-	/* create capture streams */
-	for (i = 0; i < num_capture; i++) {
+	/* create capture and playback streams */
+	for (i = 0; i < num_total; i++) {
 		struct sof_intel_hda_stream *hda_stream;
 
 		hda_stream = devm_kzalloc(sdev->dev, sizeof(*hda_stream),
@@ -909,69 +909,17 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 		hstream->index = i;
 		sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 		hstream->sd_addr = sdev->bar[HDA_DSP_HDA_BAR] + sd_offset;
-		hstream->stream_tag = i + 1;
 		hstream->opened = false;
 		hstream->running = false;
-		hstream->direction = SNDRV_PCM_STREAM_CAPTURE;
 
-		/* memory alloc for stream BDL */
-		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
-					  HDA_DSP_BDL_SIZE, &hstream->bdl);
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: stream bdl dma alloc failed\n");
-			return -ENOMEM;
-		}
-		hstream->posbuf = (__le32 *)(bus->posbuf.area +
-			(hstream->index) * 8);
-
-		list_add_tail(&hstream->list, &bus->stream_list);
-	}
-
-	/* create playback streams */
-	for (i = num_capture; i < num_total; i++) {
-		struct sof_intel_hda_stream *hda_stream;
-
-		hda_stream = devm_kzalloc(sdev->dev, sizeof(*hda_stream),
-					  GFP_KERNEL);
-		if (!hda_stream)
-			return -ENOMEM;
-
-		hda_stream->sdev = sdev;
-
-		hext_stream = &hda_stream->hext_stream;
-
-		if (sdev->bar[HDA_DSP_PP_BAR]) {
-			hext_stream->pphc_addr = sdev->bar[HDA_DSP_PP_BAR] +
-				SOF_HDA_PPHC_BASE + SOF_HDA_PPHC_INTERVAL * i;
-
-			hext_stream->pplc_addr = sdev->bar[HDA_DSP_PP_BAR] +
-				SOF_HDA_PPLC_BASE + SOF_HDA_PPLC_MULTI * num_total +
-				SOF_HDA_PPLC_INTERVAL * i;
+		if (i < num_capture) {
+			hstream->stream_tag = i + 1;
+			hstream->direction = SNDRV_PCM_STREAM_CAPTURE;
+		} else {
+			hstream->stream_tag = i - num_capture + 1;
+			hstream->direction = SNDRV_PCM_STREAM_PLAYBACK;
 		}
 
-		hstream = &hext_stream->hstream;
-
-		/* do we support SPIB */
-		if (sdev->bar[HDA_DSP_SPIB_BAR]) {
-			hstream->spib_addr = sdev->bar[HDA_DSP_SPIB_BAR] +
-				SOF_HDA_SPIB_BASE + SOF_HDA_SPIB_INTERVAL * i +
-				SOF_HDA_SPIB_SPIB;
-
-			hstream->fifo_addr = sdev->bar[HDA_DSP_SPIB_BAR] +
-				SOF_HDA_SPIB_BASE + SOF_HDA_SPIB_INTERVAL * i +
-				SOF_HDA_SPIB_MAXFIFO;
-		}
-
-		hstream->bus = bus;
-		hstream->sd_int_sta_mask = 1 << i;
-		hstream->index = i;
-		sd_offset = SOF_STREAM_SD_OFFSET(hstream);
-		hstream->sd_addr = sdev->bar[HDA_DSP_HDA_BAR] + sd_offset;
-		hstream->stream_tag = i - num_capture + 1;
-		hstream->opened = false;
-		hstream->running = false;
-		hstream->direction = SNDRV_PCM_STREAM_PLAYBACK;
-
 		/* mem alloc for stream BDL */
 		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 					  HDA_DSP_BDL_SIZE, &hstream->bdl);
-- 
2.39.2

