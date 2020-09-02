Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5AA25A447
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 06:09:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94CBC187C;
	Wed,  2 Sep 2020 06:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94CBC187C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599019768;
	bh=RfoDALacRYcfmNG9smq3J49ESPzsHsS3+ji8L6x74Tw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jgsz2O/ks8GlchdXbPZ0XOuM2ZzyGhTasZvvc2pk36mLEjjBkZ0ajUdEv1sMj/b7r
	 xrGEETnvRkZu68RH2D8DyyMzLw6HrwvMVxK7JwZh2ChvqSESW7WYdB7jUIvWRf4lIU
	 bon6UD/r7Mq+vgP7/0VddmV54tCVy/Qdp4DwWiVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E4AF80332;
	Wed,  2 Sep 2020 06:03:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38E90F80323; Wed,  2 Sep 2020 06:03:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D84B5F80305
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 06:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D84B5F80305
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m8vKp6nv"
Received: by mail-pj1-x1043.google.com with SMTP id n3so1581419pjq.1
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 21:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4l6m+WeLDQfpIMgWVQGyj+skWIufOXW1m4ZGt68JApA=;
 b=m8vKp6nvPB2XefuOZINWLncQxz0y3mAzpjmrYSK9li46N3Vph9BM14V8QqB12uFqa+
 HzsYvpw9/6xOuJQOwotRNa4zlPMYOLNtGBe7Jl2NWdAYz8QxEsRHMHiSA0puQ0ob0cGo
 YHqrS6JOl/Z5U+4heEYf+JmNOVUkWhXKTKMPmok16m/IyJthlFCJwBxGKHZidTtPGiRm
 GDkBFIyZJmFOBHVLgh0ZhDWcR0InuZ3x0GsSmQmvPJOb+cCb/0HriQQhoim6CGOJKRFf
 pAl78TO424zg92LmAWPnNwDenQIn1UcBwIpIBHBg3RsifjJ/EGMrfoLQ44BEj1u1Kn07
 s9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4l6m+WeLDQfpIMgWVQGyj+skWIufOXW1m4ZGt68JApA=;
 b=IzQGnIem6bneVspOTNbSbe5Gtv9oLCpjmCRer2g0v9HjTQ0LkNzoRMER7MgmG7xV++
 SDj05FjoApXwr1Te+7pBuX+7ZxPX0ODTZT9f1K71aOlPLebMtEsbwuktTZScmx6tVkeS
 WSye4nAc5ChmPcCrpzf59+/OrUWKNQ++5YIEnFp/TrYFU6+RlsYcp575z6/Uy9nLoY8C
 tRzB8B6GkDT1PFd0uxtt5Ty43A+Z2QaNn3KIAfWYDN++7knaQXmatH0MF5kGRmorIAw+
 iWRD/wg+UbU1nDSS9vk/F504vZSoD8OaZ/sptNnx6P+0GH0W5EM/Z9zGKyxRzEiS7yev
 HSFw==
X-Gm-Message-State: AOAM531ZwrKAJ5LHUT//dBq2s7nzrcqvnCClwaPGVzysQ0Bi07ruPsu+
 sgabpbaHFjyywXVVacdke/Y=
X-Google-Smtp-Source: ABdhPJwC1DwKcoGWz6+j9lsx8mzgOPzq+ozMcgLqkSgO62+3fWeXeBhhScz2SGKU2OgJjUTXBHyT/A==
X-Received: by 2002:a17:90a:9a92:: with SMTP id
 e18mr443853pjp.211.1599019381319; 
 Tue, 01 Sep 2020 21:03:01 -0700 (PDT)
Received: from localhost.localdomain ([49.207.196.170])
 by smtp.gmail.com with ESMTPSA id q71sm3058350pjq.7.2020.09.01.21.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 21:03:00 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org
Subject: [PATCH v2 08/10] ASoC: txx9: convert tasklets to use new
 tasklet_setup() API
Date: Wed,  2 Sep 2020 09:32:19 +0530
Message-Id: <20200902040221.354941-9-allen.lkml@gmail.com>
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
2.25.1

