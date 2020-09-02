Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 078BB25A443
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 06:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD5041860;
	Wed,  2 Sep 2020 06:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD5041860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599019667;
	bh=Hii11Vv01hJLffOFq0gh/Cpl9BEc4hK2AN5GnsqTrxc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JOgK6Wd3F7EhKxxyXJBak4dep71YGT3qjeoilE8Fw1WJG5K/THXfrJ25NBDgJBs2D
	 SD3ppehtGuW2W/Zz/ybRhAlCYF0ez2xIFanKiMRe7WKRfNtZpJ8+mmvYnrTkbmecIL
	 oDzFNC+IVJerP825hXJ1svFb8c2XoUyLsWS2zHY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79193F802F9;
	Wed,  2 Sep 2020 06:03:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25AADF802FF; Wed,  2 Sep 2020 06:03:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6C73F80212
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 06:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6C73F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fmcA5hII"
Received: by mail-pl1-x644.google.com with SMTP id c15so1659305plq.4
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 21:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=057MQRcXwBybksLEq1JjeqZlXpzUKHEjqPT9u+T+lUY=;
 b=fmcA5hIIK6NFT5wXEF/poQ1rqr35v045PQHj49YAznjGCFDbTxJL4Y1DbIoy90PXxc
 P1F7RWGwdLycks6pPj0yX8kUZM92yWHdhr8d8p3dmovUrTGDyVfZxnbkMfPo5YLgtWRE
 /HPyRo3YwFNyuKR6SnK+YzXaUXwwrcrkXuIpjVCaG9i3ZcBBKq/22Ms3j7a2YojRTmoh
 9tOHkNNcvJU9uMsTexewVTNCxuDzIxKD/AVf0juPJxvJELLqnrmsYlj2QNnhjBog7t1U
 aZZUOzBTQejbd0sYFvlu3OPrsW573Nj8A0jYgpMcuGDZH/nU/9XbaI7F6Ilrzggex4si
 N0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=057MQRcXwBybksLEq1JjeqZlXpzUKHEjqPT9u+T+lUY=;
 b=M7RJjDFMqOodpa/WKwJM2glmPHRf+ucnoTS3fAqYuFZKUenuryqwHGLl0GouvwvFSn
 GgFhSr7iTy0rVfHpi6LUPjqHvM0bOtsS7bjtKpLiF+CU2Zto3jraOW/FApAc2F8+C3uB
 BR4vM56f2TUs3KZezonoQsDeKnPUHGZzcjOQ3xvKsSEIMBzgXrX36Qp6t1f7urszGCeq
 LKjNu90laRe8qj7H+a6j8flgcNktmiGm5uIUP4rb4oni063uVzA6ETb+nzHl1mptlkxI
 yl/e8Aii3JY6z/eStiCfvmb9siqE4bQ9M8Mb9iy5as9E+bcPpvLWtEXsFKKhn16JLHqy
 k8/w==
X-Gm-Message-State: AOAM530UYrjw4QrbiCkQZYSyqmsRRZ4J/z9aips2ByabvFINTO2a7ws8
 PGinVNx5nRnZwwgaJ/XYtVROic66NrSqfg==
X-Google-Smtp-Source: ABdhPJw+0dMt2KzEOeXEwgtu8UEfC0HyjL0lr0vEA6dAFoqFRF+ayNi123BPcbRpoEKpf0t/VPx5fA==
X-Received: by 2002:a17:902:8605:: with SMTP id
 f5mr410484plo.263.1599019377817; 
 Tue, 01 Sep 2020 21:02:57 -0700 (PDT)
Received: from localhost.localdomain ([49.207.196.170])
 by smtp.gmail.com with ESMTPSA id q71sm3058350pjq.7.2020.09.01.21.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 21:02:57 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org
Subject: [PATCH v2 07/10] ASoC: siu: convert tasklets to use new
 tasklet_setup() API
Date: Wed,  2 Sep 2020 09:32:18 +0530
Message-Id: <20200902040221.354941-8-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902040221.354941-1-allen.lkml@gmail.com>
References: <20200902040221.354941-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 clemens@ladisch.de, Allen Pais <allen.lkml@gmail.com>, nicoleotsuka@gmail.com,
 Romain Perier <romain.perier@gmail.com>
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

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 sound/soc/sh/siu_pcm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sh/siu_pcm.c b/sound/soc/sh/siu_pcm.c
index bd9de77c35f3..50fc7810723e 100644
--- a/sound/soc/sh/siu_pcm.c
+++ b/sound/soc/sh/siu_pcm.c
@@ -198,9 +198,9 @@ static int siu_pcm_rd_set(struct siu_port *port_info,
 	return 0;
 }
 
-static void siu_io_tasklet(unsigned long data)
+static void siu_io_tasklet(struct tasklet_struct *t)
 {
-	struct siu_stream *siu_stream = (struct siu_stream *)data;
+	struct siu_stream *siu_stream = from_tasklet(siu_stream, t, tasklet);
 	struct snd_pcm_substream *substream = siu_stream->substream;
 	struct device *dev = substream->pcm->card->dev;
 	struct snd_pcm_runtime *rt = substream->runtime;
@@ -520,10 +520,8 @@ static int siu_pcm_new(struct snd_soc_component *component,
 		(*port_info)->pcm = pcm;
 
 		/* IO tasklets */
-		tasklet_init(&(*port_info)->playback.tasklet, siu_io_tasklet,
-			     (unsigned long)&(*port_info)->playback);
-		tasklet_init(&(*port_info)->capture.tasklet, siu_io_tasklet,
-			     (unsigned long)&(*port_info)->capture);
+		tasklet_setup(&(*port_info)->playback.tasklet, siu_io_tasklet);
+		tasklet_setup(&(*port_info)->capture.tasklet, siu_io_tasklet);
 	}
 
 	dev_info(card->dev, "SuperH SIU driver initialized.\n");
-- 
2.25.1

