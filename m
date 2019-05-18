Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB8224DE
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 22:33:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD7B1666;
	Sat, 18 May 2019 22:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD7B1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558211589;
	bh=tda56sUO7kCMe0ukoI8yp4acE+7cfH+qNNjo+IynbE4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=arA1eYCMkSUBx4wb31DIEj8bvOfmOJNtN/aah1yBv/S7+BHpz82aSJTHwjpPs0HiT
	 ZJw17mQFz0/0Giq3gn1Bpt1MC3sdq4hXqkD25NkU/h4nUYj5Jb+XPTOZH7L82oaeC2
	 R0g4kspRvzvURZjoZyMu+P0m7kfkL6S1BNZ+MiZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63996F89741;
	Sat, 18 May 2019 22:27:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7A0DF896CB; Sat, 18 May 2019 22:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68F6CF896B6
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 22:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68F6CF896B6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 13:27:25 -0700
X-ExtLoop1: 1
Received: from bmaster1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.14])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2019 13:27:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 18 May 2019 15:26:58 -0500
Message-Id: <20190518202704.7772-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
References: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 06/12] ASoC: SOF: pcm: remove warning -
	initialize workqueue on open
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

If the SOF hw_params() fail, typically with an IPC error thrown by the
firmware, the period_elapsed workqueue is not initialized, but we
still cancel it in hw_free(), which results in a kernel warning.

Move the initialization to the .open callback. Tested on Broadwell
(Samus) and IceLake.

Fixes: e2803e610ae ("ASoC: SOF: PCM: add period_elapsed work to fix
race condition in interrupt context")

GitHub issue: https://github.com/thesofproject/linux/issues/932
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index e94892053690..6dc5f97be0bc 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -211,9 +211,6 @@ static int sof_pcm_hw_params(struct snd_pcm_substream *substream,
 	/* save pcm hw_params */
 	memcpy(&spcm->params[substream->stream], params, sizeof(*params));
 
-	INIT_WORK(&spcm->stream[substream->stream].period_elapsed_work,
-		  sof_pcm_period_elapsed_work);
-
 	/* clear hw_params_upon_resume flag */
 	spcm->hw_params_upon_resume[substream->stream] = 0;
 
@@ -431,6 +428,9 @@ static int sof_pcm_open(struct snd_pcm_substream *substream)
 	dev_dbg(sdev->dev, "pcm: open stream %d dir %d\n", spcm->pcm.pcm_id,
 		substream->stream);
 
+	INIT_WORK(&spcm->stream[substream->stream].period_elapsed_work,
+		  sof_pcm_period_elapsed_work);
+
 	caps = &spcm->pcm.caps[substream->stream];
 
 	/* set any runtime constraints based on topology */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
