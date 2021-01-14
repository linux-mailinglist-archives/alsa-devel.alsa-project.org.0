Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 966022F614E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 13:56:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9705A16B0;
	Thu, 14 Jan 2021 13:55:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9705A16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610628972;
	bh=YyXnGp7qnHhzA2S/X1ANIY6YKUOVjQLAzHOOCCqxKBc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cRzfVIiJux/bSn63cnVlz1HdLX77sBKvlq4oOglLBY+wwgQa7xJjrx2iln8Bbbea/
	 2+aRh4TMzdfbt16yDUssVAka7TQIokkyY6rwlVkUUJaXuP0GEm1I1ZtWGWdEYK9AUy
	 9necGhdplveOVWDfl3CYaJCyldepXFD2CavSTrTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71408F8026F;
	Thu, 14 Jan 2021 13:54:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FC83F80249; Thu, 14 Jan 2021 13:54:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC708F80118
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 13:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC708F80118
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D23AEB815
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 12:54:13 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: pci: Simplify with dma_set_mask_and_coherent()
Date: Thu, 14 Jan 2021 13:54:11 +0100
Message-Id: <20210114125412.993-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114125412.993-1-tiwai@suse.de>
References: <20210114125412.993-1-tiwai@suse.de>
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

Many PCI drivers still have two explicit calls of dma_set_mask() and
dma_set_coherent_mask().

Let's simplify with dma_set_mask_and_coherent().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ad1889.c                  | 3 +--
 sound/pci/ali5451/ali5451.c         | 3 +--
 sound/pci/als300.c                  | 3 +--
 sound/pci/als4000.c                 | 3 +--
 sound/pci/au88x0/au88x0.c           | 3 +--
 sound/pci/aw2/aw2-alsa.c            | 3 +--
 sound/pci/azt3328.c                 | 3 +--
 sound/pci/ca0106/ca0106_main.c      | 3 +--
 sound/pci/cs5535audio/cs5535audio.c | 3 +--
 sound/pci/ctxfi/cthw20k1.c          | 8 ++------
 sound/pci/ctxfi/cthw20k2.c          | 8 ++------
 sound/pci/es1938.c                  | 3 +--
 sound/pci/es1968.c                  | 3 +--
 sound/pci/hda/hda_intel.c           | 8 ++------
 sound/pci/ice1712/ice1712.c         | 3 +--
 sound/pci/maestro3.c                | 3 +--
 sound/pci/sonicvibes.c              | 3 +--
 sound/pci/trident/trident_main.c    | 3 +--
 18 files changed, 21 insertions(+), 48 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index 5d42c42491bf..5d835d2af054 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -857,8 +857,7 @@ snd_ad1889_create(struct snd_card *card,
 		return err;
 
 	/* check PCI availability (32bit DMA) */
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(32)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(32)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32))) {
 		dev_err(card->dev, "error setting 32-bit DMA mask.\n");
 		pci_disable_device(pci);
 		return -ENXIO;
diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 4462375d2d82..51f24796f03f 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -2057,8 +2057,7 @@ static int snd_ali_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 31 bits */
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(31)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(31)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(31))) {
 		dev_err(card->dev,
 			"architecture does not support 31bit PCI busmaster DMA\n");
 		pci_disable_device(pci);
diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index 8d2471ea090b..1dc8c4ed0592 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -625,8 +625,7 @@ static int snd_als300_create(struct snd_card *card,
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
 
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(28)) < 0 ||
-		dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(28)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28))) {
 		dev_err(card->dev, "error setting 28bit DMA mask\n");
 		pci_disable_device(pci);
 		return -ENXIO;
diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index ba6390e9a694..2edc7455285a 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -837,8 +837,7 @@ static int snd_card_als4000_probe(struct pci_dev *pci,
 		return err;
 	}
 	/* check, if we can restrict PCI DMA transfers to 24 bits */
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(24)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(24)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(24))) {
 		dev_err(&pci->dev, "architecture does not support 24bit PCI busmaster DMA\n");
 		pci_disable_device(pci);
 		return -ENXIO;
diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
index be276fb3f5af..5dd98e6ff34b 100644
--- a/sound/pci/au88x0/au88x0.c
+++ b/sound/pci/au88x0/au88x0.c
@@ -151,8 +151,7 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci, vortex_t ** rchip)
 	// check PCI availability (DMA).
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(32)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(32)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32))) {
 		dev_err(card->dev, "error to set DMA mask\n");
 		pci_disable_device(pci);
 		return -ENXIO;
diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index f1865afedc59..43396849a01c 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -236,8 +236,7 @@ static int snd_aw2_create(struct snd_card *card,
 	pci_set_master(pci);
 
 	/* check PCI availability (32bit DMA) */
-	if ((dma_set_mask(&pci->dev, DMA_BIT_MASK(32)) < 0) ||
-	    (dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(32)) < 0)) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32))) {
 		dev_err(card->dev, "Impossible to set 32bit mask DMA\n");
 		pci_disable_device(pci);
 		return -ENXIO;
diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 77c7030ebbfa..e3ea72a2116b 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -2379,8 +2379,7 @@ snd_azf3328_create(struct snd_card *card,
 	chip->irq = -1;
 
 	/* check if we can restrict PCI DMA transfers to 24 bits */
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(24)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(24)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(24))) {
 		dev_err(card->dev,
 			"architecture does not support 24bit PCI busmaster DMA\n"
 		);
diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index c189f70c82cb..ee20f9a1aae9 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -1605,8 +1605,7 @@ static int snd_ca0106_create(int dev, struct snd_card *card,
 	err = pci_enable_device(pci);
 	if (err < 0)
 		return err;
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(32)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(32)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32))) {
 		dev_err(card->dev, "error to set 32bit mask DMA\n");
 		pci_disable_device(pci);
 		return -ENXIO;
diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
index 11ce3c4589fa..359bc6af8670 100644
--- a/sound/pci/cs5535audio/cs5535audio.c
+++ b/sound/pci/cs5535audio/cs5535audio.c
@@ -269,8 +269,7 @@ static int snd_cs5535audio_create(struct snd_card *card,
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
 
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(32)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(32)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32))) {
 		dev_warn(card->dev, "unable to get 32bit dma\n");
 		err = -ENXIO;
 		goto pcifail;
diff --git a/sound/pci/ctxfi/cthw20k1.c b/sound/pci/ctxfi/cthw20k1.c
index 108ab449c968..0cea4982ed7d 100644
--- a/sound/pci/ctxfi/cthw20k1.c
+++ b/sound/pci/ctxfi/cthw20k1.c
@@ -1901,12 +1901,8 @@ static int hw_card_start(struct hw *hw)
 		return err;
 
 	/* Set DMA transfer mask */
-	if (!dma_set_mask(&pci->dev, DMA_BIT_MASK(dma_bits))) {
-		dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(dma_bits));
-	} else {
-		dma_set_mask(&pci->dev, DMA_BIT_MASK(32));
-		dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(32));
-	}
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(dma_bits)))
+		dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32));
 
 	if (!hw->io_base) {
 		err = pci_request_regions(pci, "XFi");
diff --git a/sound/pci/ctxfi/cthw20k2.c b/sound/pci/ctxfi/cthw20k2.c
index fc1bc18caee9..a855fb8c58bd 100644
--- a/sound/pci/ctxfi/cthw20k2.c
+++ b/sound/pci/ctxfi/cthw20k2.c
@@ -2026,12 +2026,8 @@ static int hw_card_start(struct hw *hw)
 		return err;
 
 	/* Set DMA transfer mask */
-	if (!dma_set_mask(&pci->dev, DMA_BIT_MASK(dma_bits))) {
-		dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(dma_bits));
-	} else {
-		dma_set_mask(&pci->dev, DMA_BIT_MASK(32));
-		dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(32));
-	}
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(dma_bits)))
+		dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32));
 
 	if (!hw->io_base) {
 		err = pci_request_regions(pci, "XFi");
diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 09704a78d799..3b5d68ce9dd5 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1560,8 +1560,7 @@ static int snd_es1938_create(struct snd_card *card,
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
         /* check, if we can restrict PCI DMA transfers to 24 bits */
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(24)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(24)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(24))) {
 		dev_err(card->dev,
 			"architecture does not support 24bit PCI busmaster DMA\n");
 		pci_disable_device(pci);
diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index c6be14c4f311..747fa69bb1c9 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2668,8 +2668,7 @@ static int snd_es1968_create(struct snd_card *card,
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 28 bits */
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(28)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(28)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28))) {
 		dev_err(card->dev,
 			"architecture does not support 28bit PCI busmaster DMA\n");
 		pci_disable_device(pci);
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 694d95e3a46e..292d3ff44709 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1967,12 +1967,8 @@ static int azx_first_init(struct azx *chip)
 	/* allow 64bit DMA address if supported by H/W */
 	if (!(gcap & AZX_GCAP_64OK))
 		dma_bits = 32;
-	if (!dma_set_mask(&pci->dev, DMA_BIT_MASK(dma_bits))) {
-		dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(dma_bits));
-	} else {
-		dma_set_mask(&pci->dev, DMA_BIT_MASK(32));
-		dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(32));
-	}
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(dma_bits)))
+		dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32));
 
 	/* read number of streams from GCAP register instead of using
 	 * hardcoded value
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 73e1e5400506..f814dbbec2a4 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2486,8 +2486,7 @@ static int snd_ice1712_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 28 bits */
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(28)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(28)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28))) {
 		dev_err(card->dev,
 			"architecture does not support 28bit PCI busmaster DMA\n");
 		pci_disable_device(pci);
diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index f622c2a6f746..d2c2cd6006f0 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -2532,8 +2532,7 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 		return -EIO;
 
 	/* check, if we can restrict PCI DMA transfers to 28 bits */
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(28)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(28)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28))) {
 		dev_err(card->dev,
 			"architecture does not support 28bit PCI busmaster DMA\n");
 		pci_disable_device(pci);
diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index bd805e416e12..26fd1d08c179 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -1230,8 +1230,7 @@ static int snd_sonicvibes_create(struct snd_card *card,
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 24 bits */
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(24)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(24)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(24))) {
 		dev_err(card->dev,
 			"architecture does not support 24bit PCI busmaster DMA\n");
 		pci_disable_device(pci);
diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index 8d0d0d8335ec..20145143f6a6 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -3497,8 +3497,7 @@ int snd_trident_create(struct snd_card *card,
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 30 bits */
-	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(30)) < 0 ||
-	    dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(30)) < 0) {
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(30))) {
 		dev_err(card->dev,
 			"architecture does not support 30bit PCI busmaster DMA\n");
 		pci_disable_device(pci);
-- 
2.26.2

