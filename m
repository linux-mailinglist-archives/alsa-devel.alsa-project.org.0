Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F3850AA0D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:36:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFDC51701;
	Thu, 21 Apr 2022 22:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFDC51701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573395;
	bh=8FOQgi2qvWqnkDlwFGQg5iWk0VwCAT3KOb5YzjZPr1I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WWXHWJGC69KXpY9vCk76NNP4vWJOLFfb8N4QW/rng0uizb59x5YJPHVS8Aqj4RLUc
	 S2k1bbQBz8AQMjlIFaebqi4rQ4N25cAXGGXwwYUhhD8xb6X346y/iUNxov8IKVQlzA
	 jahtJRx7PmAgukNUXKgoKjFwFNaiPqt/Qw48cZ4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CFBBF8055C;
	Thu, 21 Apr 2022 22:33:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81B8AF80508; Thu, 21 Apr 2022 22:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 016D9F8052E
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 016D9F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ok6b2cO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573169; x=1682109169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8FOQgi2qvWqnkDlwFGQg5iWk0VwCAT3KOb5YzjZPr1I=;
 b=Ok6b2cO78ZqYG0JDXzQwEtUqZNGbOyD1gqIVp8HiSYgQaFifGKOCvnVQ
 RV/D3j5e8QbjUkc7Bi3F/Pefzyo6JEp08Rwxbo8Caf9dNfxQswB9Tq59b
 XFE0kUFnu2tkZCbCcnCxAnUb/U0RaLZVyqYPXJgu5zV88dtBXJ6cWxY3e
 9Mvqx5iVS7Me0TlnQbIP5qzQpZRJ98FHmLVJ9kYi8jCYpMIMlHAy+Hu9d
 dgWH7Z8+/wlCToRlwnMRlfCSG7IDBHikFUnkZsMq6acsTB67vSZSaWRi5
 95H6347fM9j0l2es4IlYIieLGKpIGqqOMb3CeUcNMvXXfbgyQbOJor5HA Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047641"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047641"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455812"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/14] ASoC: SOF: Intel: hda-dai: reset dma_data and release
 stream
Date: Thu, 21 Apr 2022 15:31:59 -0500
Message-Id: <20220421203201.1550328-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
References: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The sequences are missing a call to snd_soc_dai_set_dma_data() when
the stream is cleared, as well as a release of the stream, and tests
to avoid pointer dereferences.

This fixes an underflow issue in a corner case with two streams paused
before a suspend-resume cycle. After resume, the pause_release of the
last stream causes an underflow due to an invalid sequence.

This problem probably existed since the beginning and is only see with
prototypes of a 'deep-buffer' capability, which depends on additional
ASoC fixes, so there's is no Fixes: tag and no real requirement to
backport this patch.

BugLink: https://github.com/thesofproject/linux/issues/3151
Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index dbccd75defe84..644f75081edd3 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -230,6 +230,9 @@ static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 		return -EINVAL;
 
 	dev_dbg(cpu_dai->dev, "%s: cmd=%d\n", __func__, cmd);
+	if (!hext_stream)
+		return 0;
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
@@ -243,8 +246,10 @@ static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 			stream_tag = hdac_stream(hext_stream)->stream_tag;
 			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
 		}
-
+		snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
+		snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
 		hext_stream->link_prepared = 0;
+
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		snd_hdac_ext_link_stream_clear(hext_stream);
@@ -370,7 +375,7 @@ static int ipc3_hda_dai_prepare(struct snd_pcm_substream *substream,
 	int stream = substream->stream;
 	int ret;
 
-	if (hext_stream->link_prepared)
+	if (hext_stream && hext_stream->link_prepared)
 		return 0;
 
 	dev_dbg(sdev->dev, "%s: prepare stream dir %d\n", __func__, substream->stream);
@@ -460,6 +465,8 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 
 	/* set internal flag for BE */
 	list_for_each_entry(s, &bus->stream_list, list) {
+		struct sof_intel_hda_stream *hda_stream;
+
 		hext_stream = stream_to_hdac_ext_stream(s);
 
 		/*
@@ -489,13 +496,20 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 				stream_tag = hdac_stream(hext_stream)->stream_tag;
 				snd_hdac_ext_link_clear_stream_id(link, stream_tag);
 			}
+			snd_soc_dai_set_dma_data(cpu_dai, hext_stream->link_substream, NULL);
+			snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
 			hext_stream->link_prepared = 0;
 
+			/* free the host DMA channel reserved by hostless streams */
+			hda_stream = hstream_to_sof_hda_stream(hext_stream);
+			hda_stream->host_reserved = 0;
+
 			/* for consistency with TRIGGER_SUSPEND we free DAI resources */
 			ret = hda_dai_hw_free_ipc(hdac_stream(hext_stream)->direction, cpu_dai);
 			if (ret < 0)
 				return ret;
 		}
+
 	}
 
 	return 0;
-- 
2.30.2

