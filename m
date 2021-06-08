Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C8A39F926
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:29:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EC0417A1;
	Tue,  8 Jun 2021 16:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EC0417A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162592;
	bh=gQc1AJriJ4g6lzt6P9heVQIlfoE7c9ANAwAK7F/1Sjo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aaW1LA/Hrdj4WKRUj0iTiXxBauDBwS693MkPQFP5RnwA52WSDFoyVjJ4j67t4hXCI
	 yrNiWS06ccHgFrqoQPDyS1Hmu/PU/+wmPaGsswtW7nrAQWF8Jap9unNZdiHGnQNRi7
	 Xgx4vZ3x7fg/IGZc7h4KJzWsPD9aVLnWranHcJM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 025E2F80735;
	Tue,  8 Jun 2021 16:07:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8210AF80678; Tue,  8 Jun 2021 16:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31B37F8051C
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31B37F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="OU8jziCZ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ArkkkIH0"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B2A38219F9
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qh9LAZq//7GSYNBdWHtUNmduwIdvjHSGrxW3y85YVFU=;
 b=OU8jziCZl95wvwKV9VhfHJvK5jytGWTT0FOm0XqRoJ6i3Su1k56pFC7wDXtO5WJ5MCFC/V
 GgAHCc5fZ4cDqLCuxZLGLdeduOG/gzWx+PhcBnWRPVA50HgY9dmLmFGqwShGnbUxw1/Bqn
 vEQ4s7qcA7DVyPZyy/LneyjVBSM6yok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qh9LAZq//7GSYNBdWHtUNmduwIdvjHSGrxW3y85YVFU=;
 b=ArkkkIH0n2xfiKae0LtMhdFB9stOOecFVn9vbH0adSAusEAFDF9W5qmtGHMPDr61ow5Eiv
 2WEgkuW32PKTtJDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id AD658A3B88;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 59/66] ALSA: mpu401: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:33 +0200
Message-Id: <20210608140540.17885-60-tiwai@suse.de>
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

MPU401 driver code contains a few assignments in if condition, which
is a bad coding style that may confuse readers and occasionally lead
to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/mpu401/mpu401.c      |  9 ++++++---
 sound/drivers/mpu401/mpu401_uart.c | 19 +++++++++++++------
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/sound/drivers/mpu401/mpu401.c b/sound/drivers/mpu401/mpu401.c
index 8c552e25805a..d0b55dbb411a 100644
--- a/sound/drivers/mpu401/mpu401.c
+++ b/sound/drivers/mpu401/mpu401.c
@@ -104,7 +104,8 @@ static int snd_mpu401_probe(struct platform_device *devptr)
 	err = snd_mpu401_create(&devptr->dev, dev, &card);
 	if (err < 0)
 		return err;
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -182,7 +183,8 @@ static int snd_mpu401_pnp_probe(struct pnp_dev *pnp_dev,
 		err = snd_mpu401_create(&pnp_dev->dev, dev, &card);
 		if (err < 0)
 			return err;
-		if ((err = snd_card_register(card)) < 0) {
+		err = snd_card_register(card);
+		if (err < 0) {
 			snd_card_free(card);
 			return err;
 		}
@@ -227,7 +229,8 @@ static int __init alsa_card_mpu401_init(void)
 {
 	int i, err;
 
-	if ((err = platform_driver_register(&snd_mpu401_driver)) < 0)
+	err = platform_driver_register(&snd_mpu401_driver);
+	if (err < 0)
 		return err;
 
 	for (i = 0; i < SNDRV_CARDS; i++) {
diff --git a/sound/drivers/mpu401/mpu401_uart.c b/sound/drivers/mpu401/mpu401_uart.c
index 65982d6babfc..f435b9b4ae24 100644
--- a/sound/drivers/mpu401/mpu401_uart.c
+++ b/sound/drivers/mpu401/mpu401_uart.c
@@ -271,8 +271,11 @@ static int snd_mpu401_uart_input_open(struct snd_rawmidi_substream *substream)
 	int err;
 
 	mpu = substream->rmidi->private_data;
-	if (mpu->open_input && (err = mpu->open_input(mpu)) < 0)
-		return err;
+	if (mpu->open_input) {
+		err = mpu->open_input(mpu);
+		if (err < 0)
+			return err;
+	}
 	if (! test_bit(MPU401_MODE_BIT_OUTPUT, &mpu->mode)) {
 		if (snd_mpu401_do_reset(mpu) < 0)
 			goto error_out;
@@ -293,8 +296,11 @@ static int snd_mpu401_uart_output_open(struct snd_rawmidi_substream *substream)
 	int err;
 
 	mpu = substream->rmidi->private_data;
-	if (mpu->open_output && (err = mpu->open_output(mpu)) < 0)
-		return err;
+	if (mpu->open_output) {
+		err = mpu->open_output(mpu);
+		if (err < 0)
+			return err;
+	}
 	if (! test_bit(MPU401_MODE_BIT_INPUT, &mpu->mode)) {
 		if (snd_mpu401_do_reset(mpu) < 0)
 			goto error_out;
@@ -524,8 +530,9 @@ int snd_mpu401_uart_new(struct snd_card *card, int device,
 		info_flags |= MPU401_INFO_INPUT | MPU401_INFO_OUTPUT;
 	in_enable = (info_flags & MPU401_INFO_INPUT) ? 1 : 0;
 	out_enable = (info_flags & MPU401_INFO_OUTPUT) ? 1 : 0;
-	if ((err = snd_rawmidi_new(card, "MPU-401U", device,
-				   out_enable, in_enable, &rmidi)) < 0)
+	err = snd_rawmidi_new(card, "MPU-401U", device,
+			      out_enable, in_enable, &rmidi);
+	if (err < 0)
 		return err;
 	mpu = kzalloc(sizeof(*mpu), GFP_KERNEL);
 	if (!mpu) {
-- 
2.26.2

