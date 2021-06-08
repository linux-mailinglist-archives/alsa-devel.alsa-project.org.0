Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DB739F873
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:08:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 183A5170C;
	Tue,  8 Jun 2021 16:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 183A5170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161298;
	bh=RWJFlBLHzCdFL0YlJCkn4WMXPWv/4rgsvP2Lz6A8Xw0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSoIAdGE3MnTq0CHVRfJ+cuUR2V5xMUqS7CrwB3HALJIiOId0u7ZjjpX/Or0MpWau
	 lhjLHvCKVzKbKgWKSghB14zgNyD2mSz1Nx6HPOdDoNmqksXU2qnEuuYbjtMxnby8+i
	 zJee+t3xecLVyc+34K0whZIe4rgCvOhC/Sk6RsG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67C62F80537;
	Tue,  8 Jun 2021 16:06:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97E6AF8053B; Tue,  8 Jun 2021 16:05:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F57FF8019B
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F57FF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="bRKfHFA/"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="HeyUg1/L"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id E5F931FD52
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGMzkt8vSK0YPPYgHa31aB9+Ht6tmNKGrb93PFlJg8U=;
 b=bRKfHFA/cgV8By9sIdkdN6+YPcappRt8R0Bu4knGnzk0moZ7K8fgmCs8ANPeJMz6+z+A+u
 UJaUnr2BqY0z8AScuGmfu+8LHQexKZ6vZYgeZdwa2W37xkVeUpXJzs/BrYhfXF1iQJs1vb
 CW+fFDkkKEVVlyXLt+Jlp5IqJuPW4rA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGMzkt8vSK0YPPYgHa31aB9+Ht6tmNKGrb93PFlJg8U=;
 b=HeyUg1/L+ynyxiSlehVyZPRc5aHxmR8ZEDO/DoSePpHYrdFs/1sKO21mzoWnr0C4FxAQaS
 bgKX3XkaiiE7B+Bg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D5802A3B84;
 Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/66] ALSA: cs423x:  Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:41 +0200
Message-Id: <20210608140540.17885-8-tiwai@suse.de>
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

ISA CS423x driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cs423x/cs4236.c     | 21 ++++++++++++++-------
 sound/isa/cs423x/cs4236_lib.c | 12 ++++++++----
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/sound/isa/cs423x/cs4236.c b/sound/isa/cs423x/cs4236.c
index 186d7d4db45e..0b7fd17f8ecc 100644
--- a/sound/isa/cs423x/cs4236.c
+++ b/sound/isa/cs423x/cs4236.c
@@ -339,11 +339,13 @@ static int snd_cs423x_probe(struct snd_card *card, int dev)
 	int err;
 
 	acard = card->private_data;
-	if (sb_port[dev] > 0 && sb_port[dev] != SNDRV_AUTO_PORT)
-		if ((acard->res_sb_port = request_region(sb_port[dev], 16, IDENT " SB")) == NULL) {
+	if (sb_port[dev] > 0 && sb_port[dev] != SNDRV_AUTO_PORT) {
+		acard->res_sb_port = request_region(sb_port[dev], 16, IDENT " SB");
+		if (!acard->res_sb_port) {
 			printk(KERN_ERR IDENT ": unable to register SB port at 0x%lx\n", sb_port[dev]);
 			return -EBUSY;
 		}
+	}
 
 	err = snd_cs4236_create(card, port[dev], cport[dev],
 			     irq[dev],
@@ -393,7 +395,8 @@ static int snd_cs423x_probe(struct snd_card *card, int dev)
 				    OPL3_HW_OPL3_CS, 0, &opl3) < 0) {
 			printk(KERN_WARNING IDENT ": OPL3 not detected\n");
 		} else {
-			if ((err = snd_opl3_hwdep_new(opl3, 0, 1, NULL)) < 0)
+			err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
+			if (err < 0)
 				return err;
 		}
 	}
@@ -444,7 +447,8 @@ static int snd_cs423x_isa_probe(struct device *pdev,
 	err = snd_cs423x_card_new(pdev, dev, &card);
 	if (err < 0)
 		return err;
-	if ((err = snd_cs423x_probe(card, dev)) < 0) {
+	err = snd_cs423x_probe(card, dev);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -538,7 +542,8 @@ static int snd_cs423x_pnpbios_detect(struct pnp_dev *pdev,
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_cs423x_probe(card, dev)) < 0) {
+	err = snd_cs423x_probe(card, dev);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -592,13 +597,15 @@ static int snd_cs423x_pnpc_detect(struct pnp_card_link *pcard,
 	res = snd_cs423x_card_new(&pcard->card->dev, dev, &card);
 	if (res < 0)
 		return res;
-	if ((res = snd_card_cs423x_pnpc(dev, card->private_data, pcard, pid)) < 0) {
+	res = snd_card_cs423x_pnpc(dev, card->private_data, pcard, pid);
+	if (res < 0) {
 		printk(KERN_ERR "isapnp detection failed and probing for " IDENT
 		       " is not supported\n");
 		snd_card_free(card);
 		return res;
 	}
-	if ((res = snd_cs423x_probe(card, dev)) < 0) {
+	res = snd_cs423x_probe(card, dev);
+	if (res < 0) {
 		snd_card_free(card);
 		return res;
 	}
diff --git a/sound/isa/cs423x/cs4236_lib.c b/sound/isa/cs423x/cs4236_lib.c
index 52f05adb1870..63957aea456b 100644
--- a/sound/isa/cs423x/cs4236_lib.c
+++ b/sound/isa/cs423x/cs4236_lib.c
@@ -1030,12 +1030,14 @@ int snd_cs4236_mixer(struct snd_wss *chip)
 	if (chip->hardware == WSS_HW_CS4235 ||
 	    chip->hardware == WSS_HW_CS4239) {
 		for (idx = 0; idx < ARRAY_SIZE(snd_cs4235_controls); idx++) {
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_cs4235_controls[idx], chip))) < 0)
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_cs4235_controls[idx], chip));
+			if (err < 0)
 				return err;
 		}
 	} else {
 		for (idx = 0; idx < ARRAY_SIZE(snd_cs4236_controls); idx++) {
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_cs4236_controls[idx], chip))) < 0)
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_cs4236_controls[idx], chip));
+			if (err < 0)
 				return err;
 		}
 	}
@@ -1058,13 +1060,15 @@ int snd_cs4236_mixer(struct snd_wss *chip)
 		kcontrol = NULL;
 	}
 	for (idx = 0; idx < count; idx++, kcontrol++) {
-		if ((err = snd_ctl_add(card, snd_ctl_new1(kcontrol, chip))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(kcontrol, chip));
+		if (err < 0)
 			return err;
 	}
 	if (chip->hardware == WSS_HW_CS4237B ||
 	    chip->hardware == WSS_HW_CS4238B) {
 		for (idx = 0; idx < ARRAY_SIZE(snd_cs4236_iec958_controls); idx++) {
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_cs4236_iec958_controls[idx], chip))) < 0)
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_cs4236_iec958_controls[idx], chip));
+			if (err < 0)
 				return err;
 		}
 	}
-- 
2.26.2

