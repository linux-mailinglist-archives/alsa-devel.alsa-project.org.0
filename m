Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F601E569B
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 00:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 309761905;
	Sat, 26 Oct 2019 00:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 309761905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572043764;
	bh=CH9TnWiHKxuCf8UTiqF0qFBzeZFo9hXwJqpe2C/aNvs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jGAzekCxZFYlcIyvRacPMozBpqTGgHLq9f+jatkAcT/Ikh2zdtKzlNrsY5ni0zoQo
	 zMH8ycL0G/ApqI6VyREiQq2NgSNQXaZb/VvxkS+oHLTkh90MEJLGUuN7jZfUK7XNxO
	 1/gzPdW9CFSEfE72PIWexqkC7RZFu6orVmKnPav0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91616F80677;
	Sat, 26 Oct 2019 00:42:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3025F80634; Sat, 26 Oct 2019 00:41:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA674F805FC
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 00:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA674F805FC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 15:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="210458198"
Received: from archagam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.180])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 15:41:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:41:05 -0500
Message-Id: <20191025224122.7718-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 09/26] ASoC: SOF: topology: parse and store
	d0i3_compatible flag
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

From: Keyon Jie <yang.jie@linux.intel.com>

Parses the token from tplg file and store it to snd_sof_pcm_stream
d0i3_compatible flag, which can be used later for d0ix transition
management.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 121e5d6f8477..cc138ac6a8eb 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2307,6 +2307,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_stream_caps *caps;
+	struct snd_soc_tplg_private *private = &pcm->priv;
 	struct snd_sof_pcm *spcm;
 	int stream = SNDRV_PCM_STREAM_PLAYBACK;
 	int ret = 0;
@@ -2329,10 +2330,22 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	dai_drv->dobj.private = spcm;
 	list_add(&spcm->list, &sdev->pcm_list);
 
+	ret = sof_parse_tokens(scomp, spcm, stream_tokens,
+			       ARRAY_SIZE(stream_tokens), private->array,
+			       le32_to_cpu(private->size));
+	if (ret) {
+		dev_err(sdev->dev, "error: parse stream tokens failed %d\n",
+			le32_to_cpu(private->size));
+		return ret;
+	}
+
 	/* do we need to allocate playback PCM DMA pages */
 	if (!spcm->pcm.playback)
 		goto capture;
 
+	dev_vdbg(sdev->dev, "tplg: pcm %s stream tokens: playback d0i3:%d\n",
+		 spcm->pcm.pcm_name, spcm->stream[0].d0i3_compatible);
+
 	caps = &spcm->pcm.caps[stream];
 
 	/* allocate playback page table buffer */
@@ -2360,6 +2373,9 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	if (!spcm->pcm.capture)
 		return ret;
 
+	dev_vdbg(sdev->dev, "tplg: pcm %s stream tokens: capture d0i3:%d\n",
+		 spcm->pcm.pcm_name, spcm->stream[1].d0i3_compatible);
+
 	caps = &spcm->pcm.caps[stream];
 
 	/* allocate capture page table buffer */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
