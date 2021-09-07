Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B26402649
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 11:41:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 720E4172B;
	Tue,  7 Sep 2021 11:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 720E4172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631007682;
	bh=g6ZD+HQXQ2JQeNE/1i9CW41Q+hiQM1kUaWDx8ldvl0A=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qS+kpf25G8zuMOGaDKbkzW+qn1u6LPzVJ6XWM/Br+y01e9qM14PSdCaHuW0LW+REH
	 VSWilB6PxYwprYhp10+/i7fq5E7xmGXspogtJOWrBw76a24Ib3e2uXKDjUmajKax/H
	 SwQBEs3Z4agvcA751SlD5rbh4F3cRtNzeMAv9R1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44770F80431;
	Tue,  7 Sep 2021 11:39:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32196F80224; Tue,  7 Sep 2021 11:39:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C092F800BC
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 11:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C092F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="J2IWR68Z"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="uU+RWd/B"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 3E2071FE69
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 09:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631007572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rd+dOGX0HnI7KD6y5cN8/vxCRVYAg7VCLfnbvNem+fA=;
 b=J2IWR68ZDxLaNeXHl412Bm+TqtTozoo4CTD5CdPfsfnpOxfp4+AXNGX38MYd1bflqxnyRW
 VVI/6WvUo4b1C62D7TeTRdZTFY+HlmZMYwYPEEzqBA6IggFqhhQQjfYliwhd1kvvTU+ysu
 bNeZBhmzK8LdpPvMPK70JzEw6AnBjC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631007572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rd+dOGX0HnI7KD6y5cN8/vxCRVYAg7VCLfnbvNem+fA=;
 b=uU+RWd/B3wOJsmjo18TL2bCiwH9qsDS4rwOvvH9iMtrchkAYrncHeBQu9GwNiESy4w4Uue
 8olH5MKPVGmzCBBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 2D661A3B8B;
 Tue,  7 Sep 2021 09:39:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: gus: Fix repeated probe for ISA interwave card
Date: Tue,  7 Sep 2021 11:39:30 +0200
Message-Id: <20210907093930.29009-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210907093930.29009-1-tiwai@suse.de>
References: <20210907093930.29009-1-tiwai@suse.de>
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

The legacy ISA probe tries to probe the card repeatedly, and this
would conflict with the refactoring using devres.  Put the card
creation out of the loop and only probe GUS object repeatedly.

Fixes: 5b88da3c800f ("ALSA: gus: Allocate resources with device-managed APIs")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/interwave.c | 61 ++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
index 20f490e9d563..a04a9d3253f8 100644
--- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -618,12 +618,19 @@ static int snd_interwave_card_new(struct device *pdev, int dev,
 	return 0;
 }
 
-static int snd_interwave_probe(struct snd_card *card, int dev)
+static int snd_interwave_probe_gus(struct snd_card *card, int dev,
+				   struct snd_gus_card **gusp)
+{
+	return snd_gus_create(card, port[dev], -irq[dev], dma1[dev], dma2[dev],
+			      0, 32, pcm_channels[dev], effect[dev], gusp);
+}
+
+static int snd_interwave_probe(struct snd_card *card, int dev,
+			       struct snd_gus_card *gus)
 {
 	int xirq, xdma1, xdma2;
 	struct snd_interwave *iwcard = card->private_data;
 	struct snd_wss *wss;
-	struct snd_gus_card *gus;
 #ifdef SNDRV_STB
 	struct snd_i2c_bus *i2c_bus;
 #endif
@@ -634,14 +641,6 @@ static int snd_interwave_probe(struct snd_card *card, int dev)
 	xdma1 = dma1[dev];
 	xdma2 = dma2[dev];
 
-	err = snd_gus_create(card,
-			     port[dev],
-			     -xirq, xdma1, xdma2,
-			     0, 32,
-			     pcm_channels[dev], effect[dev], &gus);
-	if (err < 0)
-		return err;
-
 	err = snd_interwave_detect(iwcard, gus, dev
 #ifdef SNDRV_STB
 				   , &i2c_bus
@@ -757,22 +756,6 @@ static int snd_interwave_probe(struct snd_card *card, int dev)
 	return 0;
 }
 
-static int snd_interwave_isa_probe1(int dev, struct device *devptr)
-{
-	struct snd_card *card;
-	int err;
-
-	err = snd_interwave_card_new(devptr, dev, &card);
-	if (err < 0)
-		return err;
-
-	err = snd_interwave_probe(card, dev);
-	if (err < 0)
-		return err;
-	dev_set_drvdata(devptr, card);
-	return 0;
-}
-
 static int snd_interwave_isa_match(struct device *pdev,
 				   unsigned int dev)
 {
@@ -788,6 +771,8 @@ static int snd_interwave_isa_match(struct device *pdev,
 static int snd_interwave_isa_probe(struct device *pdev,
 				   unsigned int dev)
 {
+	struct snd_card *card;
+	struct snd_gus_card *gus;
 	int err;
 	static const int possible_irqs[] = {5, 11, 12, 9, 7, 15, 3, -1};
 	static const int possible_dmas[] = {0, 1, 3, 5, 6, 7, -1};
@@ -814,19 +799,31 @@ static int snd_interwave_isa_probe(struct device *pdev,
 		}
 	}
 
+	err = snd_interwave_card_new(pdev, dev, &card);
+	if (err < 0)
+		return err;
+
 	if (port[dev] != SNDRV_AUTO_PORT)
-		return snd_interwave_isa_probe1(dev, pdev);
+		err = snd_interwave_probe_gus(card, dev, &gus);
 	else {
 		static const long possible_ports[] = {0x210, 0x220, 0x230, 0x240, 0x250, 0x260};
 		int i;
 		for (i = 0; i < ARRAY_SIZE(possible_ports); i++) {
 			port[dev] = possible_ports[i];
-			err = snd_interwave_isa_probe1(dev, pdev);
+			err = snd_interwave_probe_gus(card, dev, &gus);
 			if (! err)
 				return 0;
 		}
-		return err;
 	}
+	if (err < 0)
+		return err;
+
+	err = snd_interwave_probe(card, dev, gus);
+	if (err < 0)
+		return err;
+
+	dev_set_drvdata(pdev, card);
+	return 0;
 }
 
 static struct isa_driver snd_interwave_driver = {
@@ -844,6 +841,7 @@ static int snd_interwave_pnp_detect(struct pnp_card_link *pcard,
 {
 	static int dev;
 	struct snd_card *card;
+	struct snd_gus_card *gus;
 	int res;
 
 	for ( ; dev < SNDRV_CARDS; dev++) {
@@ -860,7 +858,10 @@ static int snd_interwave_pnp_detect(struct pnp_card_link *pcard,
 	res = snd_interwave_pnp(dev, card->private_data, pcard, pid);
 	if (res < 0)
 		return res;
-	res = snd_interwave_probe(card, dev);
+	res = snd_interwave_probe_gus(card, dev, &gus);
+	if (res < 0)
+		return res;
+	res = snd_interwave_probe(card, dev, gus);
 	if (res < 0)
 		return res;
 	pnp_set_card_drvdata(pcard, card);
-- 
2.26.2

