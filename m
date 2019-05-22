Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF3E2682E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 18:26:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5BF61667;
	Wed, 22 May 2019 18:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5BF61667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558542377;
	bh=2kIMrWTAvWfdbuY/8k/vNJa8cVExg2y0DoB7BaNhjG8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HXBPApH4t/iNU+2LeCnHsP3kiNRmjz06N1YRYHx9cvneT88g4XjHjblhZM96C0/E1
	 TyjtqcFjKwPCoalO2hhL5Q4AYsPneDbCyAD7BFygtd3mn80qfJ2r6Vige6ZRwsrsxM
	 E5oJYshdS2Vp+EYdllPYI+7vBBu5qMbfaT5sZ2xA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7823EF89737;
	Wed, 22 May 2019 18:22:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 301D9F8972E; Wed, 22 May 2019 18:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8145F89625
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 18:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8145F89625
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 09:21:53 -0700
X-ExtLoop1: 1
Received: from avcaesar-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.140.52])
 by fmsmga001.fm.intel.com with ESMTP; 22 May 2019 09:21:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 May 2019 11:21:35 -0500
Message-Id: <20190522162142.11525-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Libin Yang <libin.yang@intel.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 05/12] ASoC: SOF: pcm: clear
	hw_params_upon_resume flag correctly
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

From: Libin Yang <libin.yang@intel.com>

sof_pcm_hw_params() can only be called once to setup the FW hw_params.
So after calling sof_pcm_hw_params(), hw_params_upon_resume flag must
be cleared to avoid multiple invoking sof_pcm_hw_params() by prepare.

For example, after resume, there is an xrun happened, prepare() will
be called. As the hw_params_upon_resume flag is not cleared,
sof_pcm_hw_params() will be called and this will cause IPC timeout.

This patch fixes such issues.

Fixes: 868bd00f495 ("ASoC: SOF: Add PCM operations support")
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 4f536c0de0a5..e94892053690 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -214,6 +214,9 @@ static int sof_pcm_hw_params(struct snd_pcm_substream *substream,
 	INIT_WORK(&spcm->stream[substream->stream].period_elapsed_work,
 		  sof_pcm_period_elapsed_work);
 
+	/* clear hw_params_upon_resume flag */
+	spcm->hw_params_upon_resume[substream->stream] = 0;
+
 	return ret;
 }
 
@@ -428,9 +431,6 @@ static int sof_pcm_open(struct snd_pcm_substream *substream)
 	dev_dbg(sdev->dev, "pcm: open stream %d dir %d\n", spcm->pcm.pcm_id,
 		substream->stream);
 
-	/* clear hw_params_upon_resume flag */
-	spcm->hw_params_upon_resume[substream->stream] = 0;
-
 	caps = &spcm->pcm.caps[substream->stream];
 
 	/* set any runtime constraints based on topology */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
