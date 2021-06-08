Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC9739F8E3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:20:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BC6A17D1;
	Tue,  8 Jun 2021 16:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BC6A17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162052;
	bh=IlDcF1JFtA2EI5rj+5I+0ibl4kvo8BNc8D8F5ecpuhg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mmHNGrYMRrHjVyLKyWm0KZNqo2rAgYVTu7/+fjFmJ2hZO8N5y8iqGG+WxrrKoZbYP
	 9LOCdZUJ8Kki4PTsY3iF3VrZSfLK+0E50tvxpPcbzwSS2H+tMEe1Ki7ekuNOY4S5TW
	 dDSefjzAlMQseOWXPI3//eUiCXErOGV5o+XGYl2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08427F8061A;
	Tue,  8 Jun 2021 16:07:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9CD9F80600; Tue,  8 Jun 2021 16:06:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 993ACF804ED
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 993ACF804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="LK5u5R0H"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="/sJTZ5Xl"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4C7CB1FDF1
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZH4J/GOkOavmZBc/g45R3fXl8GfJRPQb9vutixjtlk=;
 b=LK5u5R0Hkjbo52f5E96q37rhAJ3zpSKzb8kFOqQkmHj0iCyzAobELloOWOIVCJaizWB76z
 epBoVh66KaGQ9CZRdQHIk6NNXGjE6Jnp9Men+xcdhWDBaIYEtidpfRAqmM4oenN5xNJdNm
 4xfcTX6qZpi9qWCyYQSn7HSr8TYKiuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZH4J/GOkOavmZBc/g45R3fXl8GfJRPQb9vutixjtlk=;
 b=/sJTZ5XlDkjrQiBS7V53LSSqZeqnbbdted82cd7876RUfeMSr3+LXX6bxDBJjg5IOXO54v
 W9MiinRW0oxLdNAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 48B61A3B88;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 51/66] ALSA: vx222: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:25 +0200
Message-Id: <20210608140540.17885-52-tiwai@suse.de>
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

PCI VX222 driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/vx222/vx222.c     | 18 ++++++++++++------
 sound/pci/vx222/vx222_ops.c | 12 ++++++++----
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/sound/pci/vx222/vx222.c b/sound/pci/vx222/vx222.c
index 2a9e1a77a81a..04c7204cb7bc 100644
--- a/sound/pci/vx222/vx222.c
+++ b/sound/pci/vx222/vx222.c
@@ -133,7 +133,8 @@ static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
 	const struct snd_vx_ops *vx_ops;
 
 	/* enable PCI device */
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 	pci_set_master(pci);
 
@@ -147,7 +148,8 @@ static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
 	vx = to_vx222(chip);
 	vx->pci = pci;
 
-	if ((err = pci_request_regions(pci, CARD_NAME)) < 0) {
+	err = pci_request_regions(pci, CARD_NAME);
+	if (err < 0) {
 		snd_vx222_free(chip);
 		return err;
 	}
@@ -164,7 +166,8 @@ static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_vx222_free(chip);
 		return err;
 	}
@@ -207,7 +210,8 @@ static int snd_vx222_probe(struct pci_dev *pci,
 			hw = &vx222_v2_hw;
 		break;
 	}
-	if ((err = snd_vx222_create(card, pci, hw, &vx)) < 0) {
+	err = snd_vx222_create(card, pci, hw, &vx);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -223,12 +227,14 @@ static int snd_vx222_probe(struct pci_dev *pci,
 	vx->core.dev = &pci->dev;
 #endif
 
-	if ((err = snd_vx_setup_firmware(&vx->core)) < 0) {
+	err = snd_vx_setup_firmware(&vx->core);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
diff --git a/sound/pci/vx222/vx222_ops.c b/sound/pci/vx222/vx222_ops.c
index a05537202738..3e7e928b24f8 100644
--- a/sound/pci/vx222/vx222_ops.c
+++ b/sound/pci/vx222/vx222_ops.c
@@ -408,9 +408,11 @@ static int vx2_load_dsp(struct vx_core *vx, int index, const struct firmware *ds
 	switch (index) {
 	case 1:
 		/* xilinx image */
-		if ((err = vx2_load_xilinx_binary(vx, dsp)) < 0)
+		err = vx2_load_xilinx_binary(vx, dsp);
+		if (err < 0)
 			return err;
-		if ((err = vx2_test_xilinx(vx)) < 0)
+		err = vx2_test_xilinx(vx);
+		if (err < 0)
 			return err;
 		return 0;
 	case 2:
@@ -972,9 +974,11 @@ static int vx2_add_mic_controls(struct vx_core *_chip)
 	vx2_set_input_level(chip);
 
 	/* controls */
-	if ((err = snd_ctl_add(_chip->card, snd_ctl_new1(&vx_control_input_level, chip))) < 0)
+	err = snd_ctl_add(_chip->card, snd_ctl_new1(&vx_control_input_level, chip));
+	if (err < 0)
 		return err;
-	if ((err = snd_ctl_add(_chip->card, snd_ctl_new1(&vx_control_mic_level, chip))) < 0)
+	err = snd_ctl_add(_chip->card, snd_ctl_new1(&vx_control_mic_level, chip));
+	if (err < 0)
 		return err;
 
 	return 0;
-- 
2.26.2

