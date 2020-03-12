Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C94871833BE
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 15:51:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BE86172F;
	Thu, 12 Mar 2020 15:50:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BE86172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584024689;
	bh=EsUMLGp1bW4ci6OpCD9hakqz1xwHUacWL4Amx4pNY4E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nW+889oUdvEYV1HNLjCry9UCy0gHJz7/puThWieTP+2hclu3eFiEKAYppw36mv7lP
	 glDvFCYqiXSA4cDJ3h6hqfTxYXOfdfFbTWKgbqZg40I2g+yAFrzkLiZa/ScTcQfbwl
	 YuqxVYIvp/1Vpe3SlLskU7hf9oyLkW/3WLp2zWVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48C9DF8032A;
	Thu, 12 Mar 2020 15:45:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD6F7F802DD; Thu, 12 Mar 2020 15:45:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A152F80290;
 Thu, 12 Mar 2020 15:44:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A152F80290
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 07:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="443957603"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.40.3])
 by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:44:43 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/14] ASoC: SOF: fix uninitialised "work" with VirtIO
Date: Thu, 12 Mar 2020 15:44:23 +0100
Message-Id: <20200312144429.17959-9-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
References: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 sound-open-firmware@alsa-project.org
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

In the VirtIO case the sof_pcm_open() function isn't called on the
host during guest streaming, which then leaves "work" structures
uninitialised. However it is then used to handle position update
messages from the DSP. Move their initialisation to immediately after
allocation of the containing structure.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/pcm.c      | 2 --
 sound/soc/sof/topology.c | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index f4769e1..cd77796 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -475,8 +475,6 @@ static int sof_pcm_open(struct snd_soc_component *component,
 	dev_dbg(component->dev, "pcm: open stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
 
-	INIT_WORK(&spcm->stream[substream->stream].period_elapsed_work,
-		  sof_pcm_period_elapsed_work);
 
 	caps = &spcm->pcm.caps[substream->stream];
 
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9f4f886..16ee748 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2459,6 +2459,11 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id = COMP_ID_UNASSIGNED;
 	spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id = COMP_ID_UNASSIGNED;
 
+	INIT_WORK(&spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].period_elapsed_work,
+		  sof_pcm_period_elapsed_work);
+	INIT_WORK(&spcm->stream[SNDRV_PCM_STREAM_CAPTURE].period_elapsed_work,
+		  sof_pcm_period_elapsed_work);
+
 	spcm->pcm = *pcm;
 	dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
 
-- 
1.9.3

