Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3904316F41
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 04:54:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA6351819;
	Wed,  8 May 2019 04:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA6351819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557284044;
	bh=4+/RiXH2aziBiAKz0uPMOdSmQbTwKmJ9bJF1PWbvc4Y=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lu3Zr7wWR8rQhzD2HkgDr9YFMgnDWewiANd8vMFpcvcLaqbUKOLGuxhFigMW3spMc
	 vdlhNWE7UvT9SdcPLK4bkNtvobf5xY/Djp1fiOkBXcVw84d5Jnb/kt/JGq7T3duI6u
	 iyphQBBxYxG+vPFrh3FjIHcyPTNsF4LiFFkuzjyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEA27F896E6;
	Wed,  8 May 2019 04:52:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48E37F896F0; Wed,  8 May 2019 04:52:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E4DFF8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 04:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E4DFF8075E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 19:52:04 -0700
X-ExtLoop1: 1
Received: from younglee-svr.sh.intel.com ([10.239.159.31])
 by orsmga003.jf.intel.com with ESMTP; 07 May 2019 19:52:02 -0700
From: libin.yang@intel.com
To: alsa-devel@alsa-project.org
Date: Wed,  8 May 2019 10:32:41 +0800
Message-Id: <1557282761-26146-1-git-send-email-libin.yang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Libin Yang <libin.yang@intel.com>, tiwai@suse.de,
 ranjani.sridharan@intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, broonie@kernel.org
Subject: [alsa-devel] [PATCH V2] ASoC: soc-pcm: BE dai needs prepare when
	pause release after resume
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Libin Yang <libin.yang@intel.com>

If playback/capture is paused and system enters S3, after system returns
from suspend, BE dai needs to call prepare() callback when playback/capture
is released from pause if RESUME_INFO flag is not set.

Currently, the dpcm_be_dai_prepare() function will block calling prepare()
if the pcm is in SND_SOC_DPCM_STATE_PAUSED state. This will cause the
following test case fail if the pcm uses BE:

playback -> pause -> S3 suspend -> S3 resume -> pause release

The playback may exit abnormally when pause is released because the BE dai
prepare() is not called.

This patch allows dpcm_be_dai_prepare() to call dai prepare() callback in
SND_SOC_DPCM_STATE_PAUSED state.

Signed-off-by: Libin Yang <libin.yang@intel.com>
---
 sound/soc/soc-pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index d2aa560..0888995 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2471,7 +2471,8 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream)
 
 		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
 		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
-		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_SUSPEND))
+		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_SUSPEND) &&
+		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 			continue;
 
 		dev_dbg(be->dev, "ASoC: prepare BE %s\n",
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
