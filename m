Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C621F2049
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 21:47:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EAE11670;
	Mon,  8 Jun 2020 21:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EAE11670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591645619;
	bh=iYnLUUoT7QjsntA8aDmigolLBVQKuYk1TXnaGMKewYk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=edMCnigd28z1CPqFyR6dv7Rp90Isqo24piElYvalD8AKtrylzo2eezNT7Y9XE6vKV
	 AJouIp+49Ha3bIu3CWAac2sOalMR+0kkMp/QYc/aKzqAN/nuAG5mpfp4rH+R2ersDb
	 7eR0Ljmf/hUdFIh6xNFEkX3/yTvUx2KufySeiYNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1094F802A7;
	Mon,  8 Jun 2020 21:44:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 934F0F802A1; Mon,  8 Jun 2020 21:44:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09700F80124
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 21:44:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09700F80124
IronPort-SDR: iy/1yviSck7gFewjsqT/KsLXsgvgH8WwANaJI1vHfrfPTi212jHa7aBpD7zRiMy5wlCi5SXWER
 r+8G3HLqhJHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 12:44:21 -0700
IronPort-SDR: njzU0ryGkkqGIbbNgi0fn6gOAL77h5n9VT5F/tRa+pGA/VvpASzKFaEz+uwJXqnQ6nJOzESrQu
 61cCjSn1GwUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; d="scan'208";a="305939478"
Received: from skarmaka-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.104.56])
 by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2020 12:44:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
Date: Mon,  8 Jun 2020 14:44:12 -0500
Message-Id: <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Recent changes in the ASoC core prevent multi-cpu BE dailinks from
being used. DPCM does support multi-cpu DAIs for BE Dailinks, but not
for FE.

Handle the FE checks first, and make sure all DAIs support the same
capabilities within the same dailink.

BugLink: https://github.com/thesofproject/linux/issues/2031
Fixes: 9b5db059366ae2 ("ASoC: soc-pcm: dpcm: Only allow playback/capture if supported")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
---
 sound/soc/soc-pcm.c | 44 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 276505fb9d50..2c114b4542ce 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2789,20 +2789,44 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	struct snd_pcm *pcm;
 	char new_name[64];
 	int ret = 0, playback = 0, capture = 0;
+	int stream;
 	int i;
 
+	if (rtd->dai_link->dynamic && rtd->num_cpus > 1) {
+		dev_err(rtd->dev,
+			"DPCM doesn't support Multi CPU for Front-Ends yet\n");
+		return -EINVAL;
+	}
+
 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
-		cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-		if (rtd->num_cpus > 1) {
-			dev_err(rtd->dev,
-				"DPCM doesn't support Multi CPU yet\n");
-			return -EINVAL;
+		if (rtd->dai_link->dpcm_playback) {
+			stream = SNDRV_PCM_STREAM_PLAYBACK;
+
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
+				if (!snd_soc_dai_stream_valid(cpu_dai,
+							      stream)) {
+					dev_err(rtd->card->dev,
+						"CPU DAI %s for rtd %s does not support playback\n",
+						cpu_dai->name,
+						rtd->dai_link->stream_name);
+					return -EINVAL;
+				}
+			playback = 1;
+		}
+		if (rtd->dai_link->dpcm_capture) {
+			stream = SNDRV_PCM_STREAM_CAPTURE;
+
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
+				if (!snd_soc_dai_stream_valid(cpu_dai,
+							      stream)) {
+					dev_err(rtd->card->dev,
+						"CPU DAI %s for rtd %s does not support capture\n",
+						cpu_dai->name,
+						rtd->dai_link->stream_name);
+					return -EINVAL;
+				}
+			capture = 1;
 		}
-
-		playback = rtd->dai_link->dpcm_playback &&
-			   snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK);
-		capture = rtd->dai_link->dpcm_capture &&
-			  snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE);
 	} else {
 		/* Adapt stream for codec2codec links */
 		int cpu_capture = rtd->dai_link->params ?
-- 
2.20.1

