Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FDB118100
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 08:02:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB85916C1;
	Tue, 10 Dec 2019 08:01:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB85916C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575961325;
	bh=ZVqw1Fxmhbse6j/7FCUki3B+oz2vJCByJ3qN7VY+iKQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fv5oAcNUkhqPkHCm9O+8JDKPMvdxHK/XyW1sPNvn7wFSel5rNmLcS6rzwzXQc545/
	 IwoIOTdYwkFCVHG4D4b0MvC/6AjfPzw0xzKmY49Egg3oH3b9wBSKYF/VWlu27R1Hmq
	 YqCPBRktF8uf/GaYCNm6dCESaEcaOLeT3NY+LeWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2E3DF80436;
	Tue, 10 Dec 2019 07:37:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BF40F8033E; Tue, 10 Dec 2019 07:36:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8343F8027D
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:35:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8343F8027D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F1D33B312
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:35:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:34:36 +0100
Message-Id: <20191210063454.31603-38-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210063454.31603-1-tiwai@suse.de>
References: <20191210063454.31603-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 37/55] ALSA: via82xx: Support PCM sync_stop
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
operation, as well as removing the superfluous synchronize_irq()
call.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/via82xx.c       | 3 +--
 sound/pci/via82xx_modem.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 3009c26ea8b9..e72050a9ffdb 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -2245,7 +2245,6 @@ static int snd_via82xx_suspend(struct device *dev)
 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
 	for (i = 0; i < chip->num_devs; i++)
 		snd_via82xx_channel_reset(chip, &chip->devs[i]);
-	synchronize_irq(chip->irq);
 	snd_ac97_suspend(chip->ac97);
 
 	/* save misc values */
@@ -2376,9 +2375,9 @@ static int snd_via82xx_create(struct snd_card *card,
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
+	card->sync_irq = chip->irq;
 	if (ac97_clock >= 8000 && ac97_clock <= 48000)
 		chip->ac97_clock = ac97_clock;
-	synchronize_irq(chip->irq);
 
 	if ((err = snd_via82xx_chip_init(chip)) < 0) {
 		snd_via82xx_free(chip);
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 67614a8311e0..4e0858f8e372 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -1013,7 +1013,6 @@ static int snd_via82xx_suspend(struct device *dev)
 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
 	for (i = 0; i < chip->num_devs; i++)
 		snd_via82xx_channel_reset(chip, &chip->devs[i]);
-	synchronize_irq(chip->irq);
 	snd_ac97_suspend(chip->ac97);
 	return 0;
 }
@@ -1105,9 +1104,9 @@ static int snd_via82xx_create(struct snd_card *card,
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
+	card->sync_irq = chip->irq;
 	if (ac97_clock >= 8000 && ac97_clock <= 48000)
 		chip->ac97_clock = ac97_clock;
-	synchronize_irq(chip->irq);
 
 	if ((err = snd_via82xx_chip_init(chip)) < 0) {
 		snd_via82xx_free(chip);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
