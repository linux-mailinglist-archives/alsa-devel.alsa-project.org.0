Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8180CC0C6B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 22:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA8C1673;
	Fri, 27 Sep 2019 22:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA8C1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569615094;
	bh=p2BogFlD0T6z00XXX58mcb3vK3EojrTJeUBht7FRONE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VmwY7ma9PkGT0nFRaprZMftTbubGFqUc7earD4VTapAGQYSoiMiyDm1XkV8tfz3Fj
	 +TNXWoO/qBF6SxmO6cXEgdnl3DTE74om1l+k+GfKWbZZv1V0Xm/o+Kf/RoUuBe6ugj
	 zSH6WO5+LPTegRR19QZMYUzrsGYSAvM++vZGiNfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAFC9F8063B;
	Fri, 27 Sep 2019 22:06:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85DACF805F9; Fri, 27 Sep 2019 22:06:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABBF6F80535
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 22:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABBF6F80535
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 13:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,556,1559545200"; d="scan'208";a="190444258"
Received: from wcui-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.146.136])
 by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2019 13:05:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 27 Sep 2019 15:05:30 -0500
Message-Id: <20190927200538.660-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
References: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 05/13] ASoC: SOF: pcm: fix resource leak in
	hw_free
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Fix a bug in sof_pcm_hw_free() where some cleanup actions were
skipped if STREAM_PCM_FREE IPC was already successfully sent to
DSP when the stream was stopped or suspended. This is incorrect
as hw_free should clean up also other resources, including pcm
lib page allocations, period elapsed work queue and call to
platform hw_free.

Fixes: c29d96c3b9b4 ("ASoC: SOF: reset DMA state in prepare")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index e3f6a6dc0f36..fa7769dd825c 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -244,7 +244,7 @@ static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
 		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
-	int ret;
+	int ret, err = 0;
 
 	/* nothing to do for BE */
 	if (rtd->dai_link->no_pcm)
@@ -254,26 +254,26 @@ static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
 	if (!spcm)
 		return -EINVAL;
 
-	if (!spcm->prepared[substream->stream])
-		return 0;
-
 	dev_dbg(sdev->dev, "pcm: free stream %d dir %d\n", spcm->pcm.pcm_id,
 		substream->stream);
 
-	ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+	if (spcm->prepared[substream->stream]) {
+		ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+		if (ret < 0)
+			err = ret;
+	}
 
 	snd_pcm_lib_free_pages(substream);
 
 	cancel_work_sync(&spcm->stream[substream->stream].period_elapsed_work);
 
-	if (ret < 0)
-		return ret;
-
 	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "error: platform hw free failed\n");
+		err = ret;
+	}
 
-	return ret;
+	return err;
 }
 
 static int sof_pcm_prepare(struct snd_pcm_substream *substream)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
