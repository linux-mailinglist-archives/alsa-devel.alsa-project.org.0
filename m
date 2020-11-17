Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F902B711B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 22:52:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59BE017AA;
	Tue, 17 Nov 2020 22:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59BE017AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605649930;
	bh=73qf8neFCJqVZvMxoFzBtoYE0sZNoID7fLZwvx+hdww=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mSebG+reUed9WFCptNQ7jO+TAcgdJagHBAoGWASv7O652YQN9y0WM15dTKCdA50u3
	 goElGDuUOOwOWB/nPGsqBw1mN5xym1cNp2czemvyFmmAoGoPTQc/C2M+Au+ZtzqC3w
	 6sRDlorkhFGRw2Bta760ttWL/iVcH6OojZ7HTRiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78817F801F5;
	Tue, 17 Nov 2020 22:50:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2BE8F801F5; Tue, 17 Nov 2020 22:50:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E28AF800E2
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 22:50:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E28AF800E2
IronPort-SDR: 1P5FNSYu5BlXdlQ7NLiDIgr8Kps3tShqeAkxGWdYuGkSD3pI4eLY5JwBKpTmf9IPTqucw6A7L7
 rBkk1TbgCuqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="170237276"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="170237276"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 13:50:07 -0800
IronPort-SDR: 5XZfVb5NmWTpdmj71Bu7GzE9GAba5h97qLRKyR0oGdas5g5cSQds/hD0Xat4yXRlXyvGBX7S9E
 QwySlGByouUw==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="341041499"
Received: from pchoud3-mobl1.amr.corp.intel.com (HELO
 rsridh-mobl1.localdomain) ([10.212.216.131])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 13:50:06 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: pcm: call snd_soc_dapm_stream_stop() in soc_pcm_hw_clean
Date: Tue, 17 Nov 2020 13:50:01 -0800
Message-Id: <20201117215001.163107-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kuninori.morimoto.gx@renesas.com, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

Currently, the SND_SOC_DAPM_STREAM_START event is sent during
pcm_prepare() but the SND_SOC_DAPM_STREAM_STOP event is
sent only in dpcm_fe_dai_shutdown() after soc_pcm_close().
This results in an imbalance between when the DAPM widgets
receive the PRE/POST_PMU/PMD events. So call
snd_soc_dapm_stream_stop() in soc_pcm_hw_clean() before the
snd_soc_pcm_component_hw_free() to keep the stream_stop DAPM
event balanced with the stream_start event in soc_pm_prepare().

Also, in order to prevent duplicate DAPM stream events,
remove the call for DAPM STREAM_START event in dpcm_fe_dai_prepare()
and the call for DAPM STREAM_STOP event in dpcm_fe_dai_shutdown().

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/soc-pcm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index aaab5cfe986b..5250124dc8f5 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -662,8 +662,6 @@ static int soc_pcm_clean(struct snd_pcm_substream *substream, int rollback)
 
 	soc_pcm_components_close(substream, rollback);
 
-	if (!rollback)
-		snd_soc_dapm_stream_stop(rtd, substream->stream);
 
 	mutex_unlock(&rtd->card->pcm_mutex);
 
@@ -882,6 +880,9 @@ static int soc_pcm_hw_clean(struct snd_pcm_substream *substream, int rollback)
 			snd_soc_dai_digital_mute(dai, 1, substream->stream);
 	}
 
+	/* run the stream event */
+	snd_soc_dapm_stream_stop(rtd, substream->stream);
+
 	/* free any machine hw params */
 	snd_soc_link_hw_free(substream, rollback);
 
@@ -1859,9 +1860,6 @@ static int dpcm_fe_dai_shutdown(struct snd_pcm_substream *substream)
 	/* now shutdown the frontend */
 	soc_pcm_close(substream);
 
-	/* run the stream event for each BE */
-	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_STOP);
-
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
 	return 0;
@@ -2363,8 +2361,6 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 		goto out;
 	}
 
-	/* run the stream event for each BE */
-	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_START);
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_PREPARE;
 
 out:
-- 
2.25.1

