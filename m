Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C73D439F903
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:25:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630B517D9;
	Tue,  8 Jun 2021 16:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630B517D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162337;
	bh=LNtU1Vh0pSQMZhFauIWutxt/Dk7458NywzPRpUftMC8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QoI1X0Rq9tR9BwPQoOgjyDu3dxrIRuGKzBmqsEzFUnVCs0w4cRhtl5oGTOg8y6RAS
	 VV25Oney5sSlC7EWK4OwJvNGDNhGx9q0lfmoWht3XgRIolTEAukUM5X0jk+/zahSpB
	 e815Yro1PuNKODXFgwjOiKk5pT20s2ohtZa30al0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D866F8067C;
	Tue,  8 Jun 2021 16:07:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D96C5F800FD; Tue,  8 Jun 2021 16:07:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6466AF800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6466AF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="VcvXzWKj"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="QiXe6DOk"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CC571219E3
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dsp6UJORx2NRUtPhNePgc1n7hTkUyK0ugx+jinxDQw=;
 b=VcvXzWKjSkTxScbIWaSx6yIiZnyOabFRrVYBI4+u/g7RRkFzPuF1H+smAdMdGkNmUD5xfz
 HDoNCAaTPMCwLtlH/TTTJn58fC0SR0Jv3z4KifHqcbD5RhhkPai/dT6tjrXtcCFEbAcCL7
 mYnmJRflgAFjnVXpBM5NoT5EK39HsM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dsp6UJORx2NRUtPhNePgc1n7hTkUyK0ugx+jinxDQw=;
 b=QiXe6DOkSiST4+iAUnJwfdy/h2diNsrSof9lDP9pGPcX69mbNGy+Foi2KGCd4spStNPgnM
 HEzgF0i/JVyq4EBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id BD00BA3B84;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 24/66] ALSA: ens137x: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:58 +0200
Message-Id: <20210608140540.17885-25-tiwai@suse.de>
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

PCI ENS137x driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ens1370.c | 45 ++++++++++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 3ccccdbc0029..728b69dad21b 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -672,7 +672,8 @@ static unsigned short snd_es1371_codec_read(struct snd_ac97 *ac97,
 			}
 			/* now wait for the stinkin' data (RDY) */
 			for (t = 0; t < POLL_COUNT; t++) {
-				if ((x = inl(ES_REG(ensoniq, 1371_CODEC))) & ES_1371_CODEC_RDY) {
+				x = inl(ES_REG(ensoniq, 1371_CODEC));
+				if (x & ES_1371_CODEC_RDY) {
 					if (is_ev1938(ensoniq)) {
 						for (t = 0; t < 100; t++)
 							inl(ES_REG(ensoniq, CONTROL));
@@ -1594,7 +1595,8 @@ static int snd_ensoniq_1371_mixer(struct ensoniq *ensoniq,
 		.wait = snd_es1371_codec_wait,
 	};
 
-	if ((err = snd_ac97_bus(card, 0, &ops, NULL, &pbus)) < 0)
+	err = snd_ac97_bus(card, 0, &ops, NULL, &pbus);
+	if (err < 0)
 		return err;
 
 	memset(&ac97, 0, sizeof(ac97));
@@ -1602,7 +1604,8 @@ static int snd_ensoniq_1371_mixer(struct ensoniq *ensoniq,
 	ac97.private_free = snd_ensoniq_mixer_free_ac97;
 	ac97.pci = ensoniq->pci;
 	ac97.scaps = AC97_SCAP_AUDIO;
-	if ((err = snd_ac97_mixer(pbus, &ac97, &ensoniq->u.es1371.ac97)) < 0)
+	err = snd_ac97_mixer(pbus, &ac97, &ensoniq->u.es1371.ac97);
+	if (err < 0)
 		return err;
 	if (has_spdif > 0 ||
 	    (!has_spdif && es1371_quirk_lookup(ensoniq, es1371_spdif_present))) {
@@ -1722,7 +1725,8 @@ static int snd_ensoniq_1370_mixer(struct ensoniq *ensoniq)
 	ak4531.write = snd_es1370_codec_write;
 	ak4531.private_data = ensoniq;
 	ak4531.private_free = snd_ensoniq_mixer_free_ak4531;
-	if ((err = snd_ak4531_mixer(card, &ak4531, &ensoniq->u.es1370.ak4531)) < 0)
+	err = snd_ak4531_mixer(card, &ak4531, &ensoniq->u.es1370.ak4531);
+	if (err < 0)
 		return err;
 	for (idx = 0; idx < ES1370_CONTROLS; idx++) {
 		err = snd_ctl_add(card, snd_ctl_new1(&snd_es1370_controls[idx], ensoniq));
@@ -2038,7 +2042,8 @@ static int snd_ensoniq_create(struct snd_card *card,
 	};
 
 	*rensoniq = NULL;
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 	ensoniq = kzalloc(sizeof(*ensoniq), GFP_KERNEL);
 	if (ensoniq == NULL) {
@@ -2050,7 +2055,8 @@ static int snd_ensoniq_create(struct snd_card *card,
 	ensoniq->card = card;
 	ensoniq->pci = pci;
 	ensoniq->irq = -1;
-	if ((err = pci_request_regions(pci, "Ensoniq AudioPCI")) < 0) {
+	err = pci_request_regions(pci, "Ensoniq AudioPCI");
+	if (err < 0) {
 		kfree(ensoniq);
 		pci_disable_device(pci);
 		return err;
@@ -2095,7 +2101,8 @@ static int snd_ensoniq_create(struct snd_card *card,
 
 	snd_ensoniq_chip_init(ensoniq);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, ensoniq, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, ensoniq, &ops);
+	if (err < 0) {
 		snd_ensoniq_free(ensoniq);
 		return err;
 	}
@@ -2286,7 +2293,8 @@ static int snd_ensoniq_midi(struct ensoniq *ensoniq, int device)
 	struct snd_rawmidi *rmidi;
 	int err;
 
-	if ((err = snd_rawmidi_new(ensoniq->card, "ES1370/1", device, 1, 1, &rmidi)) < 0)
+	err = snd_rawmidi_new(ensoniq->card, "ES1370/1", device, 1, 1, &rmidi);
+	if (err < 0)
 		return err;
 	strcpy(rmidi->name, CHIP_NAME);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_ensoniq_midi_output);
@@ -2357,33 +2365,39 @@ static int snd_audiopci_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	if ((err = snd_ensoniq_create(card, pci, &ensoniq)) < 0) {
+	err = snd_ensoniq_create(card, pci, &ensoniq);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 	card->private_data = ensoniq;
 
 #ifdef CHIP1370
-	if ((err = snd_ensoniq_1370_mixer(ensoniq)) < 0) {
+	err = snd_ensoniq_1370_mixer(ensoniq);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 #endif
 #ifdef CHIP1371
-	if ((err = snd_ensoniq_1371_mixer(ensoniq, spdif[dev], lineio[dev])) < 0) {
+	err = snd_ensoniq_1371_mixer(ensoniq, spdif[dev], lineio[dev]);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 #endif
-	if ((err = snd_ensoniq_pcm(ensoniq, 0)) < 0) {
+	err = snd_ensoniq_pcm(ensoniq, 0);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_ensoniq_pcm2(ensoniq, 1)) < 0) {
+	err = snd_ensoniq_pcm2(ensoniq, 1);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_ensoniq_midi(ensoniq, 0)) < 0) {
+	err = snd_ensoniq_midi(ensoniq, 0);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -2399,7 +2413,8 @@ static int snd_audiopci_probe(struct pci_dev *pci,
 		ensoniq->port,
 		ensoniq->irq);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2

