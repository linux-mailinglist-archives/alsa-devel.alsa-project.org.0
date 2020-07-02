Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85D212A11
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 18:48:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA76316F4;
	Thu,  2 Jul 2020 18:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA76316F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593708498;
	bh=8Np9EgR4rKTrYTtJCjl9ZDQYyC41kZj2nXl5JDe2Mno=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oVbNc+zYJSIpMKZW2TmdGBcjjLvl9DnovwEURFapnVdgUwSq2K7jdtdDT3lfwMdMm
	 XqtI03IRHhtPST6GjigsQcwS3TBl7WfWEHgOuRGxcnhVHUilJXMbLookT8QgrEIHLa
	 ODT2rbzcW9YCs/wY+a5OMX3ky2hTzcN5xhQcOLuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF323F802DF;
	Thu,  2 Jul 2020 18:45:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3E2AF802BC; Thu,  2 Jul 2020 18:45:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB12AF800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 18:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB12AF800ED
IronPort-SDR: sPVrCNLRofYhokMsG9QGVpS/H3NGeqCGxPRIKqIB9eggMTuO25f7wu1daDa4vSaspSXKBzMnEO
 dPMD6HX/2t9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="144470179"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="144470179"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:44:51 -0700
IronPort-SDR: i3NhLhGla1TLJtx6cdRU3Gq7NArPh6JUpM2jI3nUGE5l9kemQJdcJlo5Ac32g69IgxCRcyiq/k
 5moSeOZZNEqQ==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="426011059"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:44:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/6] ASoC: amd: raven: acp3x-pcm-dma: fix 'set but not used'
 warning
Date: Thu,  2 Jul 2020 11:44:30 -0500
Message-Id: <20200702164433.162815-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702164433.162815-1-pierre-louis.bossart@linux.intel.com>
References: <20200702164433.162815-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 broonie@kernel.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>
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

Fix W=1 warning. the card variable is useless here.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 5bd458e0fe31..1f0fe5aaab1d 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -302,14 +302,12 @@ static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
 					   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *prtd;
-	struct snd_soc_card *card;
 	struct i2s_stream_instance *rtd;
 	u32 pos;
 	u32 buffersize;
 	u64 bytescount;
 
 	prtd = substream->private_data;
-	card = prtd->card;
 	rtd = substream->runtime->private_data;
 
 	buffersize = frames_to_bytes(substream->runtime,
-- 
2.25.1

