Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56F39F8C4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:16:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54F641768;
	Tue,  8 Jun 2021 16:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54F641768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161817;
	bh=kohkaMvKxFCfPN6+6oaZUelEM6P0kOBsmnSrjgndRSM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=songlHXqZatDeGgQQYBDe4RSLrKoZuCEpza4mrpZhQXRJALBtWIRVpvRgQu22lx//
	 FJKETVGLBj2eTzxm5Hl4E648Mk9iBsnL7bhNUmKcgFoBUG9nxUKxISFvyaxY+0DeaJ
	 NSNuik1gt05PWUs3x3E6Av+9JrfW14rFRmhZE2FA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20082F805F3;
	Tue,  8 Jun 2021 16:06:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75233F805C9; Tue,  8 Jun 2021 16:06:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54353F804E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54353F804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="VX86Ju5h"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="vQ8MvBpr"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 43CE71FDE7
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4m48LyFI1/8yO7SlVjCdEFdj5aKfo9N0XNR4L3Z8r0=;
 b=VX86Ju5hCPQ1HCfhWqgSCkzlWrJqzf1tM0qIWQsIQvfyT5RP13Ti3iO69IuKPg0BLt23ax
 8waVG/twsdL39dy7KWyHFJs9CAqwoiUS/anVFirC4FQ1yI+KPNP935FNLaQcEG1Ml9YYtV
 TNF6Sud/hbuNLf2n1Znde+4UPzDuuJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4m48LyFI1/8yO7SlVjCdEFdj5aKfo9N0XNR4L3Z8r0=;
 b=vQ8MvBpr9jQlQ+itxAYcv2sPskdF6ualxp64nGkZrbUT+Zbhov/o26YQXbkK0oaGKaDdba
 usXSgz+f9sOKEXDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 339F2A3B89;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 32/66] ALSA: sonicvibes: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:06 +0200
Message-Id: <20210608140540.17885-33-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

PCI sonicvibes driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/sonicvibes.c | 67 ++++++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index 7de10997775f..03a48da897e3 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -852,7 +852,8 @@ static int snd_sonicvibes_pcm(struct sonicvibes *sonic, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(sonic->card, "s3_86c617", device, 1, 1, &pcm)) < 0)
+	err = snd_pcm_new(sonic->card, "s3_86c617", device, 1, 1, &pcm);
+	if (err < 0)
 		return err;
 	if (snd_BUG_ON(!pcm))
 		return -EINVAL;
@@ -1093,7 +1094,9 @@ static int snd_sonicvibes_mixer(struct sonicvibes *sonic)
 	strcpy(card->mixername, "S3 SonicVibes");
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_sonicvibes_controls); idx++) {
-		if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_sonicvibes_controls[idx], sonic))) < 0)
+		kctl = snd_ctl_new1(&snd_sonicvibes_controls[idx], sonic);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			return err;
 		switch (idx) {
 		case 0:
@@ -1226,7 +1229,8 @@ static int snd_sonicvibes_create(struct snd_card *card,
 
 	*rsonic = NULL;
 	/* enable PCI device */
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 24 bits */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(24))) {
@@ -1246,7 +1250,8 @@ static int snd_sonicvibes_create(struct snd_card *card,
 	sonic->pci = pci;
 	sonic->irq = -1;
 
-	if ((err = pci_request_regions(pci, "S3 SonicVibes")) < 0) {
+	err = pci_request_regions(pci, "S3 SonicVibes");
+	if (err < 0) {
 		kfree(sonic);
 		pci_disable_device(pci);
 		return err;
@@ -1289,14 +1294,16 @@ static int snd_sonicvibes_create(struct snd_card *card,
 	pci_write_config_dword(pci, 0x40, dmaa);
 	pci_write_config_dword(pci, 0x48, dmac);
 
-	if ((sonic->res_dmaa = request_region(dmaa, 0x10, "S3 SonicVibes DDMA-A")) == NULL) {
+	sonic->res_dmaa = request_region(dmaa, 0x10, "S3 SonicVibes DDMA-A");
+	if (!sonic->res_dmaa) {
 		snd_sonicvibes_free(sonic);
 		dev_err(card->dev,
 			"unable to grab DDMA-A port at 0x%x-0x%x\n",
 			dmaa, dmaa + 0x10 - 1);
 		return -EBUSY;
 	}
-	if ((sonic->res_dmac = request_region(dmac, 0x10, "S3 SonicVibes DDMA-C")) == NULL) {
+	sonic->res_dmac = request_region(dmac, 0x10, "S3 SonicVibes DDMA-C");
+	if (!sonic->res_dmac) {
 		snd_sonicvibes_free(sonic);
 		dev_err(card->dev,
 			"unable to grab DDMA-C port at 0x%x-0x%x\n",
@@ -1358,7 +1365,8 @@ static int snd_sonicvibes_create(struct snd_card *card,
 #endif
 	sonic->revision = snd_sonicvibes_in(sonic, SV_IREG_REVISION);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, sonic, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, sonic, &ops);
+	if (err < 0) {
 		snd_sonicvibes_free(sonic);
 		return err;
 	}
@@ -1405,9 +1413,11 @@ static int snd_sonicvibes_midi(struct sonicvibes *sonic,
 	mpu->private_data = sonic;
 	mpu->open_input = snd_sonicvibes_midi_input_open;
 	mpu->close_input = snd_sonicvibes_midi_input_close;
-	for (idx = 0; idx < ARRAY_SIZE(snd_sonicvibes_midi_controls); idx++)
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_sonicvibes_midi_controls[idx], sonic))) < 0)
+	for (idx = 0; idx < ARRAY_SIZE(snd_sonicvibes_midi_controls); idx++) {
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_sonicvibes_midi_controls[idx], sonic));
+		if (err < 0)
 			return err;
+	}
 	return 0;
 }
 
@@ -1439,10 +1449,11 @@ static int snd_sonic_probe(struct pci_dev *pci,
 			return -ENODEV;
 		}
 	}
-	if ((err = snd_sonicvibes_create(card, pci,
-					 reverb[dev] ? 1 : 0,
-					 mge[dev] ? 1 : 0,
-					 &sonic)) < 0) {
+	err = snd_sonicvibes_create(card, pci,
+				    reverb[dev] ? 1 : 0,
+				    mge[dev] ? 1 : 0,
+				    &sonic);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -1455,30 +1466,35 @@ static int snd_sonic_probe(struct pci_dev *pci,
 		(unsigned long long)pci_resource_start(pci, 1),
 		sonic->irq);
 
-	if ((err = snd_sonicvibes_pcm(sonic, 0)) < 0) {
+	err = snd_sonicvibes_pcm(sonic, 0);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_sonicvibes_mixer(sonic)) < 0) {
+	err = snd_sonicvibes_mixer(sonic);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_mpu401_uart_new(card, 0, MPU401_HW_SONICVIBES,
-				       sonic->midi_port,
-				       MPU401_INFO_INTEGRATED |
-				       MPU401_INFO_IRQ_HOOK,
-				       -1, &midi_uart)) < 0) {
+	err = snd_mpu401_uart_new(card, 0, MPU401_HW_SONICVIBES,
+				  sonic->midi_port,
+				  MPU401_INFO_INTEGRATED |
+				  MPU401_INFO_IRQ_HOOK,
+				  -1, &midi_uart);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 	snd_sonicvibes_midi(sonic, midi_uart);
-	if ((err = snd_opl3_create(card, sonic->synth_port,
-				   sonic->synth_port + 2,
-				   OPL3_HW_OPL3_SV, 1, &opl3)) < 0) {
+	err = snd_opl3_create(card, sonic->synth_port,
+			      sonic->synth_port + 2,
+			      OPL3_HW_OPL3_SV, 1, &opl3);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_opl3_hwdep_new(opl3, 0, 1, NULL)) < 0) {
+	err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -1489,7 +1505,8 @@ static int snd_sonic_probe(struct pci_dev *pci,
 		return err;
 	}
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2

