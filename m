Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAD71742ED
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Feb 2020 00:20:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7173A16EC;
	Sat, 29 Feb 2020 00:19:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7173A16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582932043;
	bh=EBUe3yqBPk997DHwdIX9iAR5szU79onmILzbvoZSPgg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tmmetK8vZIIpUX+P/Wshl7wLI/hfOSnFeHpdufZ6hsjitOaprdV9TdxD0lt9FMFZH
	 cno1AnypTBXipmCtTyurge64SKyFzgYNS8IAub1CuF3TY36NDGf1jffMnGw+jdGa1B
	 +OtxIjNYnMTHYgyR9mDlez/o60MpRE9IcaNvHJ3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01283F80213;
	Sat, 29 Feb 2020 00:19:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05FCBF80246; Sat, 29 Feb 2020 00:19:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41F09F8014D
 for <alsa-devel@alsa-project.org>; Sat, 29 Feb 2020 00:18:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41F09F8014D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2020 15:18:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,497,1574150400"; d="scan'208";a="272826526"
Received: from billycla-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.95.100])
 by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2020 15:18:53 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: SOF: pcm: skip DMA buffer pre-allocation
Date: Fri, 28 Feb 2020 17:18:47 -0600
Message-Id: <20200228231850.9226-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228231850.9226-1-pierre-louis.bossart@linux.intel.com>
References: <20200228231850.9226-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
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

From: Keyon Jie <yang.jie@linux.intel.com>

As discussion in ALSA https://patchwork.kernel.org/patch/11336023/, it
is suggested to skip DMA buffer pre-allocation with passing size=0 when
calling snd_pcm_set_managed_buffer(), to make the full buffer_bytes
range configured in topology file selectable from user space, here do
the corresponding change in SOF PCM driver to implement it.

This change doesn't have dependency to the change that Takashi will do
in the ALSA core by adding total_pcm_alloc_bytes limitation to the
struct snd_card, it passes tests both with or without Takashi's coming
change on SOF CML platform.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index b239bbff4b5c..f4769e19965a 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -601,8 +601,7 @@ static int sof_pcm_new(struct snd_soc_component *component,
 
 	snd_pcm_set_managed_buffer(pcm->streams[stream].substream,
 				   SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
-				   le32_to_cpu(caps->buffer_size_min),
-				   le32_to_cpu(caps->buffer_size_max));
+				   0, le32_to_cpu(caps->buffer_size_max));
 capture:
 	stream = SNDRV_PCM_STREAM_CAPTURE;
 
@@ -624,8 +623,7 @@ static int sof_pcm_new(struct snd_soc_component *component,
 
 	snd_pcm_set_managed_buffer(pcm->streams[stream].substream,
 				   SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
-				   le32_to_cpu(caps->buffer_size_min),
-				   le32_to_cpu(caps->buffer_size_max));
+				   0, le32_to_cpu(caps->buffer_size_max));
 
 	return 0;
 }
-- 
2.20.1

