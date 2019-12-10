Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FF61180F3
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:58:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31F401709;
	Tue, 10 Dec 2019 07:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31F401709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575961085;
	bh=/78U8PlWUwERfrqSYj/2+4wH9FZMxrSSDI8hbmlLZLA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dPbhggLgjVGpiXv5zafg+slQ5jB1EqF2EkcKC4PqMCPwUBi0EWYR2FnxesEMXI3/n
	 SVDP8SCzsb+/3FtM7SUeQn1X307rJSJQsf25f3JSdgzvKuXIQkhesX8dCuURH/hWic
	 951bxKvm4klVYItgLd7AzSvbZCgAf6jrodwYVq5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 126FCF803BE;
	Tue, 10 Dec 2019 07:37:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14E83F80336; Tue, 10 Dec 2019 07:36:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCB8BF80276
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCB8BF80276
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C0394B2F4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:35:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:34:32 +0100
Message-Id: <20191210063454.31603-34-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210063454.31603-1-tiwai@suse.de>
References: <20191210063454.31603-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 33/55] ALSA: rme9652: Support PCM sync_stop
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

The driver invokes snd_pcm_period_elapsed() simply from the interrupt
handler.  Set card->sync_irq for enabling the missing sync_stop PCM
operation.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdsp.c    | 1 +
 sound/pci/rme9652/hdspm.c   | 1 +
 sound/pci/rme9652/rme9652.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index cd20af465d8e..87e60dd13066 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -5233,6 +5233,7 @@ static int snd_hdsp_create(struct snd_card *card,
 	}
 
 	hdsp->irq = pci->irq;
+	card->sync_irq = hdsp->irq;
 	hdsp->precise_ptr = 0;
 	hdsp->use_midi_tasklet = 1;
 	hdsp->dds_value = 0;
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 75c06a7cc779..56ae14c90a2c 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6613,6 +6613,7 @@ static int snd_hdspm_create(struct snd_card *card,
 	dev_dbg(card->dev, "use IRQ %d\n", pci->irq);
 
 	hdspm->irq = pci->irq;
+	card->sync_irq = hdspm->irq;
 
 	dev_dbg(card->dev, "kmalloc Mixer memory of %zd Bytes\n",
 		sizeof(*hdspm->mixer));
diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index ef5c2f8e17c7..6fda027d28a4 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -2479,6 +2479,7 @@ static int snd_rme9652_create(struct snd_card *card,
 		return -EBUSY;
 	}
 	rme9652->irq = pci->irq;
+	card->sync_irq = rme9652->irq;
 	rme9652->precise_ptr = precise_ptr;
 
 	/* Determine the h/w rev level of the card. This seems like
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
