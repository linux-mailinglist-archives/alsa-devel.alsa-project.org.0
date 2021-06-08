Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B7039F910
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:27:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 060FF1783;
	Tue,  8 Jun 2021 16:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 060FF1783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162455;
	bh=rs/dzwBvf3DAbIjciAyThWDDBPors+GZTpg4g/8QEmo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AuBcN/IFaodDy/E0brcBnF8coJl9CW99Re0u4miwqznfJ8Ure44QYpsF71LHIB9S8
	 42qOi0lFQ+Ox66jBgSe5w0zUfsibZGxCMer7TV1On9vX8PJgz9ivo1UZ7wP+KNo9b9
	 pxiuCH/jfQtRE9vbviuIWmYcdvtpgDDDR5vfujzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C6F7F806EF;
	Tue,  8 Jun 2021 16:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28CDFF80630; Tue,  8 Jun 2021 16:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7DA0F80516
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7DA0F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="k9ek5T4D"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="lZ+H4om7"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E2253219EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=di0KYIbJL9zvYtvenAUIddvZR3J+8RIpg5XvF26IWpY=;
 b=k9ek5T4DO2sqHHPvh9TPEyX93zrXpQnWQiWH18N3VfdRLGAnq50f1mq3iST4SYNbRpDFsI
 xK2HK4aHig9W2e8LoGfTvFZ9qoOC7antJWeEuIEAe2rsr1fTTkBZ3Qir9b4mrCA4Oovgd/
 ualkFTXc3yQO/ELklyi0vvBt2Z3kJic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=di0KYIbJL9zvYtvenAUIddvZR3J+8RIpg5XvF26IWpY=;
 b=lZ+H4om76O2ihfGiz6RxAhOpQVKHNScWC1JSS5GfZIHvj+/Od2gn4VyTAld/+ipEaj6rpY
 9Cmg1NuSJHvyL/Aw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id CEDB3A3B84;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 43/66] ALSA: korg1212: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:17 +0200
Message-Id: <20210608140540.17885-44-tiwai@suse.de>
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

PCI Korg1212 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 80ac3c6152ad..030e01b062e4 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -1527,7 +1527,8 @@ static int snd_korg1212_hw_params(struct snd_pcm_substream *substream,
 	        return 0;
 	}
 
-        if ((err = snd_korg1212_SetRate(korg1212, params_rate(params))) < 0) {
+	err = snd_korg1212_SetRate(korg1212, params_rate(params));
+	if (err < 0) {
                 spin_unlock_irqrestore(&korg1212->lock, flags);
                 return err;
         }
@@ -2159,7 +2160,8 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
         };
 
         * rchip = NULL;
-        if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
                 return err;
 
         korg1212 = kzalloc(sizeof(*korg1212), GFP_KERNEL);
@@ -2196,7 +2198,8 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
         for (i=0; i<kAudioChannels; i++)
                 korg1212->volumePhase[i] = 0;
 
-	if ((err = pci_request_regions(pci, "korg1212")) < 0) {
+	err = pci_request_regions(pci, "korg1212");
+	if (err < 0) {
 		kfree(korg1212);
 		pci_disable_device(pci);
 		return err;
@@ -2220,7 +2223,8 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
 		   korg1212->iomem2, iomem2_size,
 		   stateName[korg1212->cardState]);
 
-        if ((korg1212->iobase = ioremap(korg1212->iomem, iomem_size)) == NULL) {
+	korg1212->iobase = ioremap(korg1212->iomem, iomem_size);
+	if (!korg1212->iobase) {
 		snd_printk(KERN_ERR "korg1212: unable to remap memory region 0x%lx-0x%lx\n", korg1212->iomem,
                            korg1212->iomem + iomem_size - 1);
                 snd_korg1212_free(korg1212);
@@ -2360,7 +2364,8 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
 	if (rc)
 		K1212_DEBUG_PRINTK("K1212_DEBUG: Reboot Card - RC = %d [%s]\n", rc, stateName[korg1212->cardState]);
 
-        if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, korg1212, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, korg1212, &ops);
+	if (err < 0) {
                 snd_korg1212_free(korg1212);
                 return err;
         }
@@ -2385,7 +2390,8 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
                korg1212->RoutingTablePhy, LowerWordSwap(korg1212->RoutingTablePhy),
                korg1212->AdatTimeCodePhy, LowerWordSwap(korg1212->AdatTimeCodePhy));
 
-        if ((err = snd_pcm_new(korg1212->card, "korg1212", 0, 1, 1, &korg1212->pcm)) < 0)
+	err = snd_pcm_new(korg1212->card, "korg1212", 0, 1, 1, &korg1212->pcm);
+	if (err < 0)
                 return err;
 
 	korg1212->pcm->private_data = korg1212;
@@ -2436,7 +2442,8 @@ snd_korg1212_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-        if ((err = snd_korg1212_create(card, pci, &korg1212)) < 0) {
+	err = snd_korg1212_create(card, pci, &korg1212);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -2448,7 +2455,8 @@ snd_korg1212_probe(struct pci_dev *pci,
 
         K1212_DEBUG_PRINTK("K1212_DEBUG: %s\n", card->longname);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2

