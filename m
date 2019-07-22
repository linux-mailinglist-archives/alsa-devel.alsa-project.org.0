Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9957270250
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:27:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FC1017D5;
	Mon, 22 Jul 2019 16:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FC1017D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563805642;
	bh=qXXCELwtAd1dmH5c0GuP7fohI5Nt7muJIeZgE5ojcmI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kTd4GJ7R4UWdvS59oPaoYnLsi+wf8pQ0Mpvo6Wnhc1+xYlbXqYPqfOl7Tu2lXLwrZ
	 4KdufH7qiItd+OJq4G5lPjpL9Txqjvh+tfKxjQJ036naiz2pgrNwGgD0hIukSeOsav
	 Ay3/UEgR653t/8Jf4NL3SEKgZUY9qG145ZSnjOGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75AF4F8067A;
	Mon, 22 Jul 2019 16:14:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2870F8053A; Mon, 22 Jul 2019 16:14:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 794A2F8049B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 794A2F8049B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="192733305"
Received: from agalla-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.103.46])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2019 07:14:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 22 Jul 2019 09:13:59 -0500
Message-Id: <20190722141402.7194-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Rander Wang <rander.wang@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 18/21] ASoC: SOF: Intel: hda: fix link DMA
	config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@linux.intel.com>

For this bug, there are two capture pcm streams active, with one
stream and its related stream tag released before suspend. Later
when system suspend is done, the stream tag for the remaining
active stream is released by SOF driver. After system resume, hda
codec driver restores the stream tag for the active pcm stream,
but SOF goes to assign a new one, which now doesn't match with the
stream tag used by codec driver, and this causes DMA to fail
receiving data, leading to unrecoverable XRUN condition in FW.

For stream tag is stored in both hda codec and SOF driver, it
shouldn't be released only in SOF driver. This patch just keeps the
stream information in dma data and checks whether there is a stored
DMA data for stream resuming from S3 and restores it. And it also
removes DMA data when the stream is released.

Tested on Whiskey Lake platform.

GitHub issue: https://github.com/thesofproject/sof/issues/1594
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 15 +++++++++------
 sound/soc/sof/intel/hda-dsp.c | 10 ++++------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index a448be60f6dd..2b5e2b8c69c2 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -210,9 +210,13 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	int stream_tag;
 	int ret;
 
-	link_dev = hda_link_stream_assign(bus, substream);
-	if (!link_dev)
-		return -EBUSY;
+	/* get stored dma data if resuming from system suspend */
+	link_dev = snd_soc_dai_get_dma_data(dai, substream);
+	if (!link_dev) {
+		link_dev = hda_link_stream_assign(bus, substream);
+		if (!link_dev)
+			return -EBUSY;
+	}
 
 	stream_tag = hdac_stream(link_dev)->stream_tag;
 
@@ -316,7 +320,7 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 		/*
-		 * clear and release link DMA channel. It will be assigned when
+		 * clear link DMA channel. It will be assigned when
 		 * hw_params is set up again after resume.
 		 */
 		ret = hda_link_config_ipc(hda_stream, dai->name,
@@ -325,8 +329,6 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 			return ret;
 		stream_tag = hdac_stream(link_dev)->stream_tag;
 		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
-		snd_hdac_ext_stream_release(link_dev,
-					    HDAC_EXT_STREAM_TYPE_LINK);
 		link_dev->link_prepared = 0;
 
 		/* fallthrough */
@@ -369,6 +371,7 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 
 	stream_tag = hdac_stream(link_dev)->stream_tag;
 	snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
 	snd_hdac_ext_stream_release(link_dev, HDAC_EXT_STREAM_TYPE_LINK);
 	link_dev->link_prepared = 0;
 
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index e82ecaad1763..e38008194574 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -439,10 +439,10 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 		stream = stream_to_hdac_ext_stream(s);
 
 		/*
-		 * clear and release stream. This should already be taken care
-		 * for running streams when the SUSPEND trigger is called.
-		 * But paused streams do not get suspended, so this needs to be
-		 * done explicitly during suspend.
+		 * clear stream. This should already be taken care for running
+		 * streams when the SUSPEND trigger is called. But paused
+		 * streams do not get suspended, so this needs to be done
+		 * explicitly during suspend.
 		 */
 		if (stream->link_substream) {
 			rtd = snd_pcm_substream_chip(stream->link_substream);
@@ -452,8 +452,6 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 				return -EINVAL;
 			stream_tag = hdac_stream(stream)->stream_tag;
 			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
-			snd_hdac_ext_stream_release(stream,
-						    HDAC_EXT_STREAM_TYPE_LINK);
 			stream->link_prepared = 0;
 		}
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
