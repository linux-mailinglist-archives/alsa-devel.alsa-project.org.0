Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F5725BFAE
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:52:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E6C71921;
	Thu,  3 Sep 2020 12:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E6C71921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599130374;
	bh=eRHpZuCxIVA6yeGoa53RyRYHdcVj5E3jOrooxzgFHWA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ch9c5saDwqmNUj5sTKT42lyyMAQBwuPZYskFEPXeorqAvj5GDl1+Nfzj61WpUg9/0
	 7yzqNrmlEJclXlTM2EM37pNruLoVFBltsYhT2WdyuaJLb/cl6ouI5lVXogLHmRAjhs
	 EKk/ah/TK5J2IfNl8xyQJXr441sx21nvAZNVYE58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A97BF802E8;
	Thu,  3 Sep 2020 12:48:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C3B4F802E1; Thu,  3 Sep 2020 12:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBC7DF8025F
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBC7DF8025F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 95907B148;
 Thu,  3 Sep 2020 10:47:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: sh: Replace tasklet with work
Date: Thu,  3 Sep 2020 12:47:48 +0200
Message-Id: <20200903104749.21435-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200903104749.21435-1-tiwai@suse.de>
References: <20200903104749.21435-1-tiwai@suse.de>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>
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

The tasklet is an old API that should be deprecated, usually can be
converted to another decent API.  In ASoC SH SIU driver, a tasklet is
still used for offloading the hardware reset function.  It can be
achieved gracefully with a work queued, too.

This patch replaces the tasklet usage in SH SIU driver with a simple
work.  The conversion is fairly straightforward.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sh/siu.h     |  2 +-
 sound/soc/sh/siu_pcm.c | 21 +++++++++++----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sh/siu.h b/sound/soc/sh/siu.h
index 63a508fdfe78..6201840f1bc0 100644
--- a/sound/soc/sh/siu.h
+++ b/sound/soc/sh/siu.h
@@ -96,7 +96,7 @@ struct siu_info {
 };
 
 struct siu_stream {
-	struct tasklet_struct		tasklet;
+	struct work_struct		work;
 	struct snd_pcm_substream	*substream;
 	snd_pcm_format_t		format;
 	size_t				buf_bytes;
diff --git a/sound/soc/sh/siu_pcm.c b/sound/soc/sh/siu_pcm.c
index 50fc7810723e..45c4320976ab 100644
--- a/sound/soc/sh/siu_pcm.c
+++ b/sound/soc/sh/siu_pcm.c
@@ -70,7 +70,7 @@ static int siu_pcm_stmwrite_start(struct siu_port *port_info)
 	siu_stream->rw_flg = RWF_STM_WT;
 
 	/* DMA transfer start */
-	tasklet_schedule(&siu_stream->tasklet);
+	queue_work(system_highpri_wq, &siu_stream->work);
 
 	return 0;
 }
@@ -93,7 +93,7 @@ static void siu_dma_tx_complete(void *arg)
 		siu_stream->cur_period * siu_stream->period_bytes,
 		siu_stream->buf_bytes, siu_stream->cookie);
 
-	tasklet_schedule(&siu_stream->tasklet);
+	queue_work(system_highpri_wq, &siu_stream->work);
 
 	/* Notify alsa: a period is done */
 	snd_pcm_period_elapsed(siu_stream->substream);
@@ -198,9 +198,10 @@ static int siu_pcm_rd_set(struct siu_port *port_info,
 	return 0;
 }
 
-static void siu_io_tasklet(struct tasklet_struct *t)
+static void siu_io_work(struct work_struct *work)
 {
-	struct siu_stream *siu_stream = from_tasklet(siu_stream, t, tasklet);
+	struct siu_stream *siu_stream = container_of(work, struct siu_stream,
+						     work);
 	struct snd_pcm_substream *substream = siu_stream->substream;
 	struct device *dev = substream->pcm->card->dev;
 	struct snd_pcm_runtime *rt = substream->runtime;
@@ -253,7 +254,7 @@ static int siu_pcm_stmread_start(struct siu_port *port_info)
 	/* during stmread flag set */
 	siu_stream->rw_flg = RWF_STM_RD;
 
-	tasklet_schedule(&siu_stream->tasklet);
+	queue_work(system_highpri_wq, &siu_stream->work);
 
 	return 0;
 }
@@ -519,9 +520,9 @@ static int siu_pcm_new(struct snd_soc_component *component,
 
 		(*port_info)->pcm = pcm;
 
-		/* IO tasklets */
-		tasklet_setup(&(*port_info)->playback.tasklet, siu_io_tasklet);
-		tasklet_setup(&(*port_info)->capture.tasklet, siu_io_tasklet);
+		/* IO works */
+		INIT_WORK(&(*port_info)->playback.work, siu_io_work);
+		INIT_WORK(&(*port_info)->capture.work, siu_io_work);
 	}
 
 	dev_info(card->dev, "SuperH SIU driver initialized.\n");
@@ -534,8 +535,8 @@ static void siu_pcm_free(struct snd_soc_component *component,
 	struct platform_device *pdev = to_platform_device(pcm->card->dev);
 	struct siu_port *port_info = siu_ports[pdev->id];
 
-	tasklet_kill(&port_info->capture.tasklet);
-	tasklet_kill(&port_info->playback.tasklet);
+	cancel_work_sync(&port_info->capture.work);
+	cancel_work_sync(&port_info->playback.work);
 
 	siu_free_port(port_info);
 
-- 
2.16.4

