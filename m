Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7122B246336
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:24:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23D3E16B3;
	Mon, 17 Aug 2020 11:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23D3E16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597656241;
	bh=yCh40RIa80YIJbF0vIzn1RLGwSzhCzM5ZceQ9C/ZPGU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=teDisCNKEvXZ2lFEVMg/UWMPRE5qAnMcnHSeREcgf0ledUpZ3V6NIZWNBB4p9gUSW
	 cuAfklWVBcy9NfhIisegfFY9TkxGAirQuTUWmBa3d3FK4QuJW6GWOdKFsJY3h8uCLO
	 ym6Ek2w8ZbyydEX8/bgkIzjpq0WvJbQUAT7lMcgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F2EF80306;
	Mon, 17 Aug 2020 11:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2928EF80257; Mon, 17 Aug 2020 10:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C37B6F800D3
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C37B6F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P6IDOwP5"
Received: by mail-pl1-x644.google.com with SMTP id u10so7170465plr.7
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jl7zq958bvyphHRDKv4nNAmR0zSknfotUpyL6Tf/wt8=;
 b=P6IDOwP5JjvvGriwph12LdSiIuRxpIgAmAdMDNUOEdE3wlgtHweKJoc7ASfqWWFbOV
 1SCY05N0lES3ftWwuw0qEvw3kHzrei9IGR7fosnwng703pUgzzIvRYsyvraiJ/VaIpMA
 k71+8G+uSed3hr9W9FQlwtv/jvRlQi8TYx3lq5goJm6mW5TbZcyp5ew06Vj/0R+oHH0H
 wL3aGoRxbVBtWnNo0LqEQPeBeLQWUXCHOBaGbAtDhANFy802MUStNt5AsT9vr7qMCxWB
 rjEbhj3ixZnzZHJBpeZN7wkoHdNNxSDUNewjoQhY19JIehAGVzC27UkcvmMgIB59PGjG
 s35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jl7zq958bvyphHRDKv4nNAmR0zSknfotUpyL6Tf/wt8=;
 b=CIb09/m7r3nliy3/5XNS4DLtCYtCrcTlGfghATyn8DdB6dwK9JM47fz2Rxz+uYl/ok
 ugZgfVTEmk8my44rmuCe2yPq7mxTKt6oUtbUJQOj4gd53M/qbcV0YVjuz6b/C4mAtpos
 rhV1BcPxwccqgBuBr0winnL4rsG81c4AIX4uv0mWmik+GAs2IZYhkvPHHFHJjfRH71hU
 cDrO5xvI0rznfV+G8qkv6Nq61wgA9KB2sJfhGlDkaesmSBKDc61GYTDwQsYOXYDfcu4K
 89NG1xfYdON+E9YWsfJZtD5GcVD6sq9XlqG78Zv77RC8JunwtCIBgudBwzDm1KbdExn/
 PkFg==
X-Gm-Message-State: AOAM530U6/t8hw0zJkkO0Gd2XAzpuZSHyDuoI3YfSepSYOBNRGdxPVIH
 rj2KMVAcbJE6Meh+uGCNCAc=
X-Google-Smtp-Source: ABdhPJzq+K7CR467KRQ31me/jHavVenQGpsdx8Y2B5GP1GWBoaBp3308lEe+K8lDR2l6eP6TZaJOjA==
X-Received: by 2002:a17:90a:7348:: with SMTP id
 j8mr10509100pjs.137.1597654683313; 
 Mon, 17 Aug 2020 01:58:03 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:58:02 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 08/10] sound/soc: txx9: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:27:01 +0530
Message-Id: <20200817085703.25732-9-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817085703.25732-1-allen.cryptic@gmail.com>
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 11:17:21 +0200
Cc: alsa-devel@alsa-project.org, keescook@chromium.org,
 Allen Pais <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 Romain Perier <romain.perier@gmail.com>, linuxppc-dev@lists.ozlabs.org
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

From: Allen Pais <allen.lkml@gmail.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 sound/soc/txx9/txx9aclc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/txx9/txx9aclc.c b/sound/soc/txx9/txx9aclc.c
index 4b1cd4da3e36..939b33ec39f5 100644
--- a/sound/soc/txx9/txx9aclc.c
+++ b/sound/soc/txx9/txx9aclc.c
@@ -134,9 +134,9 @@ txx9aclc_dma_submit(struct txx9aclc_dmadata *dmadata, dma_addr_t buf_dma_addr)
 
 #define NR_DMA_CHAIN		2
 
-static void txx9aclc_dma_tasklet(unsigned long data)
+static void txx9aclc_dma_tasklet(struct tasklet_struct *t)
 {
-	struct txx9aclc_dmadata *dmadata = (struct txx9aclc_dmadata *)data;
+	struct txx9aclc_dmadata *dmadata = from_tasklet(dmadata, t, tasklet);
 	struct dma_chan *chan = dmadata->dma_chan;
 	struct dma_async_tx_descriptor *desc;
 	struct snd_pcm_substream *substream = dmadata->substream;
@@ -352,8 +352,7 @@ static int txx9aclc_dma_init(struct txx9aclc_soc_device *dev,
 			"playback" : "capture");
 		return -EBUSY;
 	}
-	tasklet_init(&dmadata->tasklet, txx9aclc_dma_tasklet,
-		     (unsigned long)dmadata);
+	tasklet_setup(&dmadata->tasklet, txx9aclc_dma_tasklet);
 	return 0;
 }
 
-- 
2.17.1

