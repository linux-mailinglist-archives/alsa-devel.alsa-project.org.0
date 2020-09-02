Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B9625A43C
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 06:06:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 476ED1832;
	Wed,  2 Sep 2020 06:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 476ED1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599019569;
	bh=UGhPDO8nZTHSlC+t5iQKmduar695bz15zzqGFgVFn00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dl8fbDUHfwEuAoJ4wlBrC1KYHKDxO/JRU00W6se8rFzZguMG2TJtJwlDVVLag8pqw
	 2Y1ej7cLbIH6QKCeIT0t7awFBwwTlxdj1+U053dMBYjB72Jp7Q3OfdRhZzRoVbd5dP
	 /VyUympCdZnh8SVUqs3eQ3PANMcc5c8PrRbKYDzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF963F802E8;
	Wed,  2 Sep 2020 06:02:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EA84F802E3; Wed,  2 Sep 2020 06:02:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8BA8F801DA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 06:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8BA8F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Sn/i7Ze1"
Received: by mail-pg1-x541.google.com with SMTP id v15so1865354pgh.6
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 21:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SEMER0Yl1msey7jbmUcwzm9t6QF1uQ9TeT9LlResx5M=;
 b=Sn/i7Ze1olxlPUS4CFA8N0HTZF3rNAeDg2ZU06A4/M0oX+UKesuASisEf1ZaQ7JcOm
 o60W6k2JwqlO6qdhbJgu8ZFNFknpTU/fHyoyl0l97E2kSYAhUSAMDEkDm1piNHG5BQQ8
 t8IgHYSfbMlG0vSDa/QmOZ35ebqusTx+JQoibqoznLNxnrkVGKKd8LVrzb7bVCLmq/Hw
 r/mQ1dMY+0ue7WNaxLEDBZ9tw+5ACfU8mKNsc20i0g8Fq2zxhrsdwoQHktbH54MGCZVI
 p1kLqzLi66n/ZLvyZ0miQJLlcTQADnzNB7ZB0EEELrzRR2zTBYgYja3cQ+SU7N88G/fW
 NQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SEMER0Yl1msey7jbmUcwzm9t6QF1uQ9TeT9LlResx5M=;
 b=JXcoB7Bnon3dkYTt/K6LNxXQzlYihurWiclt/9rBq2ZW/ZxbKINsmml0D4TKBCKq4G
 XDdOR0OdP0ACcUXIlv44eCM0Af0dNGyuwiaN7G/EnWSsf6BM2RjUAxUn56Moe+MNhIre
 yi1vFtRJY+XwKd7Anql6jKM5AxMzBTLS7kFxJVzZwb3zwGTXM9KtE1nZPNOBmzQecfra
 lWOrRvh1IBNrToUSbstcwq8PBi28haBDpZ9uYHQhLz7MpEQbPEI35/VAR4jtQvFfJWbn
 TLcvBBpYdpIhk7ooVWBmmBqBPg0dMcqawzkT7s9dEjk7nNRR/+SubANC0sZ2xU9o+Mlh
 HpEQ==
X-Gm-Message-State: AOAM530zkxT+qOAo8Jryhh9pPuyLelLRgFzNNlVC/g4mpJopopQFTy8i
 LkjvkKiZF3ln6Wkmglgog9oRlpubflhUVA==
X-Google-Smtp-Source: ABdhPJyoZ0csDV9d0iw+4/HXNVwwWvxBetnbEL0EJPyF00/4qWM2VSm2RX+roke7pN5kih0BpidUtw==
X-Received: by 2002:a05:6a00:814:: with SMTP id
 m20mr1428346pfk.50.1599019362609; 
 Tue, 01 Sep 2020 21:02:42 -0700 (PDT)
Received: from localhost.localdomain ([49.207.196.170])
 by smtp.gmail.com with ESMTPSA id q71sm3058350pjq.7.2020.09.01.21.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 21:02:42 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org
Subject: [PATCH v2 03/10] ALSA: pci/asihpi: convert tasklets to use new
 tasklet_setup() API
Date: Wed,  2 Sep 2020 09:32:14 +0530
Message-Id: <20200902040221.354941-4-allen.lkml@gmail.com>
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
 sound/pci/asihpi/asihpi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 023c35a2a951..35e76480306e 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -921,10 +921,10 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 		add_timer(&dpcm->timer);
 }
 
-static void snd_card_asihpi_int_task(unsigned long data)
+static void snd_card_asihpi_int_task(struct tasklet_struct *t)
 {
-	struct hpi_adapter *a = (struct hpi_adapter *)data;
-	struct snd_card_asihpi *asihpi;
+	struct snd_card_asihpi *asihpi = from_tasklet(asihpi, t, t);
+	struct hpi_adapter *a = asihpi->hpi;
 
 	WARN_ON(!a || !a->snd_card || !a->snd_card->private_data);
 	asihpi = (struct snd_card_asihpi *)a->snd_card->private_data;
@@ -2871,8 +2871,7 @@ static int snd_asihpi_probe(struct pci_dev *pci_dev,
 	if (hpi->interrupt_mode) {
 		asihpi->pcm_start = snd_card_asihpi_pcm_int_start;
 		asihpi->pcm_stop = snd_card_asihpi_pcm_int_stop;
-		tasklet_init(&asihpi->t, snd_card_asihpi_int_task,
-			(unsigned long)hpi);
+		tasklet_setup(&asihpi->t, snd_card_asihpi_int_task);
 		hpi->interrupt_callback = snd_card_asihpi_isr;
 	} else {
 		asihpi->pcm_start = snd_card_asihpi_pcm_timer_start;
-- 
2.25.1

