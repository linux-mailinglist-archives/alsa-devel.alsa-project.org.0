Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED6C19326D
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:16:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF7031675;
	Wed, 25 Mar 2020 22:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF7031675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585170966;
	bh=gbgDMw2ciqH7L+yXOT7Sxpc4Em5TAq4KxpjH6v9DEvU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B1UKZCSL8FChLBi1ojxN+n6oT64CDNyGNSOdpqQlfxI4d2nsjefmBeWJtDOKUeXZ5
	 tuTxWeyHmSPFt0THcn3okTOrp2Ad8cKfAXHo7Lg3T5FviXcVCrVLuvnMBZK3f/Wrpg
	 t9jf35qaYlD66hQPna3GM/aTnjfrcxamauLmPPYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99EBEF80292;
	Wed, 25 Mar 2020 22:13:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D770F80218; Wed, 25 Mar 2020 22:12:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA680F80147
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA680F80147
IronPort-SDR: 6l2ZGxzXK8kfNPn/nf2SzpboWmlKfZyc8DfG+V3AJ7ehkIHUq3eF8DQPLdWoMREpmJdvQvZTPz
 geI619tw1Kng==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:12:45 -0700
IronPort-SDR: +Cf0mHwIWGhyZTHyEeolG490TK8KX+ztMnFP7OTHxBUoyomlwSTO2ATKV6HHcnFkZmgwRZuXC/
 eYDl9T/16JBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="357935813"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2020 14:12:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: SOF: (cosmetic) use for_each_pcm_streams() in
 sof_dai_load()
Date: Wed, 25 Mar 2020 16:12:30 -0500
Message-Id: <20200325211233.27394-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325211233.27394-1-pierre-louis.bossart@linux.intel.com>
References: <20200325211233.27394-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

Use for_each_pcm_streams() to enumerate streams in sof_dai_load()
instead of doing that manually.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 058de94fb8cf..54437caf9488 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2448,7 +2448,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	struct snd_soc_tplg_stream_caps *caps;
 	struct snd_soc_tplg_private *private = &pcm->priv;
 	struct snd_sof_pcm *spcm;
-	int stream = SNDRV_PCM_STREAM_PLAYBACK;
+	int stream;
 	int ret = 0;
 
 	/* nothing to do for BEs atm */
@@ -2460,8 +2460,9 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 		return -ENOMEM;
 
 	spcm->scomp = scomp;
-	spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id = COMP_ID_UNASSIGNED;
-	spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id = COMP_ID_UNASSIGNED;
+
+	for_each_pcm_streams(stream)
+		spcm->stream[stream].comp_id = COMP_ID_UNASSIGNED;
 
 	spcm->pcm = *pcm;
 	dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
@@ -2482,8 +2483,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	if (!spcm->pcm.playback)
 		goto capture;
 
+	stream = SNDRV_PCM_STREAM_PLAYBACK;
+
 	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: playback d0i3:%d\n",
-		 spcm->pcm.pcm_name, spcm->stream[0].d0i3_compatible);
+		 spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
 
 	caps = &spcm->pcm.caps[stream];
 
@@ -2513,7 +2516,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 		return ret;
 
 	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: capture d0i3:%d\n",
-		 spcm->pcm.pcm_name, spcm->stream[1].d0i3_compatible);
+		 spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
 
 	caps = &spcm->pcm.caps[stream];
 
-- 
2.20.1

