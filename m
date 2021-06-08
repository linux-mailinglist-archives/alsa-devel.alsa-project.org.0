Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A01B39F8BA
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F4741745;
	Tue,  8 Jun 2021 16:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F4741745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161701;
	bh=lqVTr0kMYdoM9HWWlZguyB1AL6lT2cLE/ZntE4QJZeI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kclRZUPFbeju/FhhjMnDj0CqUQm1XGsAIjQq3FkC6lW1Um85Z6AaRanz98Pp1z+yH
	 iO3/e5x3WLneHTtHWv1oJ7Vuef6DDx1vncQbcjZmWEh9DbMyFpMae0Jhg+cgGGMz1e
	 Mc9SHa5tx1telP2ZKWIifsGcSureukIq30kZ/T8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE36F804DF;
	Tue,  8 Jun 2021 16:06:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09A9CF805B0; Tue,  8 Jun 2021 16:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3592CF804D0
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3592CF804D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="0vlB7AJ8"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="OsN92iY0"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2FCE51FDE6
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNiDMcHoMZXzTJB/qlYNdmgfB1huSxhHlYx/hJAGtDY=;
 b=0vlB7AJ8gbZQC/YjFt+mLt6qSWVRG27vjbz29/QGwFJ/fsIrbbiEWiQGXskg0qUD3SM0ZN
 FhNpnJEVS73r+lzOFoKVmdaIXVHjejJ+LJ7PgdFOmdxsu1SndQJSZHmt6cwvZDMqJLJIdm
 nKHGX1Li4hgEVaRrvhLad/onhSejwKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNiDMcHoMZXzTJB/qlYNdmgfB1huSxhHlYx/hJAGtDY=;
 b=OsN92iY099aqxoBAac5olEAJNxW54eL/WG3omeqXVMU61ZPXkEO05xCOTY1hkRrUyHWLff
 M/LD4bCADkpLl4Cg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 2042FA3B84;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 30/66] ALSA: rme32: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:04 +0200
Message-Id: <20210608140540.17885-31-tiwai@suse.de>
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

PCI RME32 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes (except for a slight
refactoring about AutoSync rate check, only systematic conversions),
no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme32.c | 76 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 28 deletions(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 54f3e39f97f5..b5b357853c94 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -668,18 +668,24 @@ snd_rme32_playback_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	spin_lock_irq(&rme32->lock);
-	if ((rme32->rcreg & RME32_RCR_KMODE) &&
-	    (rate = snd_rme32_capture_getrate(rme32, &dummy)) > 0) {
+	rate = 0;
+	if (rme32->rcreg & RME32_RCR_KMODE)
+		rate = snd_rme32_capture_getrate(rme32, &dummy);
+	if (rate > 0) {
 		/* AutoSync */
 		if ((int)params_rate(params) != rate) {
 			spin_unlock_irq(&rme32->lock);
 			return -EIO;
 		}
-	} else if ((err = snd_rme32_playback_setrate(rme32, params_rate(params))) < 0) {
-		spin_unlock_irq(&rme32->lock);
-		return err;
+	} else {
+		err = snd_rme32_playback_setrate(rme32, params_rate(params));
+		if (err < 0) {
+			spin_unlock_irq(&rme32->lock);
+			return err;
+		}
 	}
-	if ((err = snd_rme32_setformat(rme32, params_format(params))) < 0) {
+	err = snd_rme32_setformat(rme32, params_format(params));
+	if (err < 0) {
 		spin_unlock_irq(&rme32->lock);
 		return err;
 	}
@@ -723,15 +729,18 @@ snd_rme32_capture_hw_params(struct snd_pcm_substream *substream,
 	rme32->wcreg |= RME32_WCR_AUTOSYNC;
 	writel(rme32->wcreg, rme32->iobase + RME32_IO_CONTROL_REGISTER);
 
-	if ((err = snd_rme32_setformat(rme32, params_format(params))) < 0) {
+	err = snd_rme32_setformat(rme32, params_format(params));
+	if (err < 0) {
 		spin_unlock_irq(&rme32->lock);
 		return err;
 	}
-	if ((err = snd_rme32_playback_setrate(rme32, params_rate(params))) < 0) {
+	err = snd_rme32_playback_setrate(rme32, params_rate(params));
+	if (err < 0) {
 		spin_unlock_irq(&rme32->lock);
 		return err;
 	}
-	if ((rate = snd_rme32_capture_getrate(rme32, &isadat)) > 0) {
+	rate = snd_rme32_capture_getrate(rme32, &isadat);
+	if (rate > 0) {
                 if ((int)params_rate(params) != rate) {
 			spin_unlock_irq(&rme32->lock);
                         return -EIO;                    
@@ -854,8 +863,10 @@ static int snd_rme32_playback_spdif_open(struct snd_pcm_substream *substream)
 		runtime->hw.rates |= SNDRV_PCM_RATE_64000 | SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000;
 		runtime->hw.rate_max = 96000;
 	}
-	if ((rme32->rcreg & RME32_RCR_KMODE) &&
-	    (rate = snd_rme32_capture_getrate(rme32, &dummy)) > 0) {
+	rate = 0;
+	if (rme32->rcreg & RME32_RCR_KMODE)
+		rate = snd_rme32_capture_getrate(rme32, &dummy);
+	if (rate > 0) {
 		/* AutoSync */
 		runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
 		runtime->hw.rate_min = rate;
@@ -895,7 +906,8 @@ static int snd_rme32_capture_spdif_open(struct snd_pcm_substream *substream)
 		runtime->hw.rates |= SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000;
 		runtime->hw.rate_max = 96000;
 	}
-	if ((rate = snd_rme32_capture_getrate(rme32, &isadat)) > 0) {
+	rate = snd_rme32_capture_getrate(rme32, &isadat);
+	if (rate > 0) {
 		if (isadat) {
 			return -EIO;
 		}
@@ -932,8 +944,10 @@ snd_rme32_playback_adat_open(struct snd_pcm_substream *substream)
 		runtime->hw = snd_rme32_adat_fd_info;
 	else
 		runtime->hw = snd_rme32_adat_info;
-	if ((rme32->rcreg & RME32_RCR_KMODE) &&
-	    (rate = snd_rme32_capture_getrate(rme32, &dummy)) > 0) {
+	rate = 0;
+	if (rme32->rcreg & RME32_RCR_KMODE)
+		rate = snd_rme32_capture_getrate(rme32, &dummy);
+	if (rate > 0) {
                 /* AutoSync */
                 runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
                 runtime->hw.rate_min = rate;
@@ -955,7 +969,8 @@ snd_rme32_capture_adat_open(struct snd_pcm_substream *substream)
 		runtime->hw = snd_rme32_adat_fd_info;
 	else
 		runtime->hw = snd_rme32_adat_info;
-	if ((rate = snd_rme32_capture_getrate(rme32, &isadat)) > 0) {
+	rate = snd_rme32_capture_getrate(rme32, &isadat);
+	if (rate > 0) {
 		if (!isadat) {
 			return -EIO;
 		}
@@ -1307,10 +1322,12 @@ static int snd_rme32_create(struct rme32 *rme32)
 	rme32->irq = -1;
 	spin_lock_init(&rme32->lock);
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
-	if ((err = pci_request_regions(pci, "RME32")) < 0)
+	err = pci_request_regions(pci, "RME32");
+	if (err < 0)
 		return err;
 	rme32->port = pci_resource_start(rme32->pci, 0);
 
@@ -1334,9 +1351,9 @@ static int snd_rme32_create(struct rme32 *rme32)
 	pci_read_config_byte(pci, 8, &rme32->rev);
 
 	/* set up ALSA pcm device for S/PDIF */
-	if ((err = snd_pcm_new(rme32->card, "Digi32 IEC958", 0, 1, 1, &rme32->spdif_pcm)) < 0) {
+	err = snd_pcm_new(rme32->card, "Digi32 IEC958", 0, 1, 1, &rme32->spdif_pcm);
+	if (err < 0)
 		return err;
-	}
 	rme32->spdif_pcm->private_data = rme32;
 	rme32->spdif_pcm->private_free = snd_rme32_free_spdif_pcm;
 	strcpy(rme32->spdif_pcm->name, "Digi32 IEC958");
@@ -1363,11 +1380,10 @@ static int snd_rme32_create(struct rme32 *rme32)
 		rme32->adat_pcm = NULL;
 	}
 	else {
-		if ((err = snd_pcm_new(rme32->card, "Digi32 ADAT", 1,
-				       1, 1, &rme32->adat_pcm)) < 0)
-		{
+		err = snd_pcm_new(rme32->card, "Digi32 ADAT", 1,
+				  1, 1, &rme32->adat_pcm);
+		if (err < 0)
 			return err;
-		}		
 		rme32->adat_pcm->private_data = rme32;
 		rme32->adat_pcm->private_free = snd_rme32_free_adat_pcm;
 		strcpy(rme32->adat_pcm->name, "Digi32 ADAT");
@@ -1410,9 +1426,9 @@ static int snd_rme32_create(struct rme32 *rme32)
 
 
 	/* init switch interface */
-	if ((err = snd_rme32_create_switches(rme32->card, rme32)) < 0) {
+	err = snd_rme32_create_switches(rme32->card, rme32);
+	if (err < 0)
 		return err;
-	}
 
 	/* init proc interface */
 	snd_rme32_proc_init(rme32);
@@ -1855,7 +1871,9 @@ static int snd_rme32_create_switches(struct snd_card *card, struct rme32 * rme32
 	struct snd_kcontrol *kctl;
 
 	for (idx = 0; idx < (int)ARRAY_SIZE(snd_rme32_controls); idx++) {
-		if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_rme32_controls[idx], rme32))) < 0)
+		kctl = snd_ctl_new1(&snd_rme32_controls[idx], rme32);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			return err;
 		if (idx == 1)	/* IEC958 (S/PDIF) Stream */
 			rme32->spdif_ctl = kctl;
@@ -1899,7 +1917,8 @@ snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	rme32->pci = pci;
         if (fullduplex[dev])
 		rme32->fullduplex_mode = 1;
-	if ((err = snd_rme32_create(rme32)) < 0) {
+	err = snd_rme32_create(rme32);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -1919,7 +1938,8 @@ snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	sprintf(card->longname, "%s (Rev. %d) at 0x%lx, irq %d",
 		card->shortname, rme32->rev, rme32->port, rme32->irq);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2

