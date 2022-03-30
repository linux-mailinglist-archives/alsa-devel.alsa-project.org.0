Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1714EC2E8
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 14:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 722BF1A4D;
	Wed, 30 Mar 2022 14:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 722BF1A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641795;
	bh=nRX1Wu2/+YAtMyzPMZeE+GdOQkX46HrpTm9oLo9V1w0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ApN5Hu38YesgXjdSsI92zEV4ZHzujzyNs2OtpHIoRH4+6BBmNXcx9AB1gliM/b5AQ
	 4o2OcB43gu1mlN1mwbKfUxjRP4bcPGaVk12w6z9HDrcTCtEJSUJZu2IQK6ASC45At1
	 +6v+SRtgq9YgO0SEUzgg+3DHffmQrFhx6OaliedI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 939B0F8055C;
	Wed, 30 Mar 2022 13:51:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 752F4F8055B; Wed, 30 Mar 2022 13:51:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E223F8055C
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E223F8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AjwBBGKv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11A65B81C39;
 Wed, 30 Mar 2022 11:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F38C340F2;
 Wed, 30 Mar 2022 11:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648641092;
 bh=nRX1Wu2/+YAtMyzPMZeE+GdOQkX46HrpTm9oLo9V1w0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AjwBBGKvZSCnzMO+A44u2PdX8ccmgZjACboL8OASXRH2Gwqm0eB94267fgZRYpBO+
 xVSrvFvSflFDz1vwb7pPKc7UVQVRY1nwAlSiHhn08gPRtC5XpKWs+vwW81umsMPbXa
 I+OV6pWwPVtQs2aPJLbZR5L1cap70HBYj1yD9M/iLovx2l85LEmy1jcxCUbTA9Jr30
 Nf7GcVEXWP7kXs258aqtPcvZaFlwSdOu9Cwhl3dOmlgWO9yOPRhScihmlYWj4raDkL
 r5R/oaFIFS+KS7TieiDaaRqAja7ejon48i013YHleHLtfBBY3Ga8ysUzJuvZjxux2z
 9GgsuWtkqf1Yw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 05/37] ASoC: SOF: Intel: hda: Remove link
 assignment limitation
Date: Wed, 30 Mar 2022 07:50:50 -0400
Message-Id: <20220330115122.1671763-5-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330115122.1671763-1-sashal@kernel.org>
References: <20220330115122.1671763-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 lgirdwood@gmail.com, tiwai@suse.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

[ Upstream commit 2ce0d008dcc59f9c01f43277b9f9743af7b01dad ]

The limitation to assign a link DMA channel for a BE iff the
corresponding host DMA channel is assigned to a connected FE is only
applicable if the PROCEN_FMT_QUIRK is set. So, remove it for platforms
that do not enable the quirk.

Complements: a792bfc1c2bc ("ASoC: SOF: Intel: hda-stream: limit PROCEN workaround")
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20220128130017.28508-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda-dai.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index ef316311e959..99e62cb3a051 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -58,6 +58,8 @@ static struct hdac_ext_stream *
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct sof_intel_hda_stream *hda_stream;
+	const struct sof_intel_dsp_desc *chip;
+	struct snd_sof_dev *sdev;
 	struct hdac_ext_stream *res = NULL;
 	struct hdac_stream *stream = NULL;
 
@@ -76,9 +78,20 @@ static struct hdac_ext_stream *
 			continue;
 
 		hda_stream = hstream_to_sof_hda_stream(hstream);
+		sdev = hda_stream->sdev;
+		chip = get_chip_info(sdev->pdata);
 
 		/* check if link is available */
 		if (!hstream->link_locked) {
+			/*
+			 * choose the first available link for platforms that do not have the
+			 * PROCEN_FMT_QUIRK set.
+			 */
+			if (!(chip->quirks & SOF_INTEL_PROCEN_FMT_QUIRK)) {
+				res = hstream;
+				break;
+			}
+
 			if (stream->opened) {
 				/*
 				 * check if the stream tag matches the stream
-- 
2.34.1

