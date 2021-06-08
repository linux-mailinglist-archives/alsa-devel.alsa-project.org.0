Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D0839F875
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E87B1725;
	Tue,  8 Jun 2021 16:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E87B1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161310;
	bh=kSiooSRmE/qjfJtGinQw4i1KzyelzraLV/ZyuookvoM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RSM607y4aKkkxe5UI0JYZo6rYfWT4/WjIhWHG6nGOOnoKcF7X8xTOCpLLcU70LaeL
	 kdeLawG/50T6TWaPP1rId2H5JIuMbO9aBD1NbCTVIOR5L01SJ00Zp305lMIb2DdMyF
	 5Ky+EeWUI+Z5a092UXj/W/MfvYe4mBxRkrk6177A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2C96F8053C;
	Tue,  8 Jun 2021 16:06:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEB6DF8053A; Tue,  8 Jun 2021 16:05:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC74EF804AB
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC74EF804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="0E+0dAZE"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="YcEVVtuT"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2E1051FD56
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3I72G48i2WW+u6ZQ5B0RTg3fWJO5iEq8hsqAx7cjlXE=;
 b=0E+0dAZEgaZDznIm9Kem8+0cVHg+ukouNKbIevEWDk8vjHlq3tNADsMg7NaBIA0417Aeu8
 Koi2CPXcJBmkgYUPer4qb1S7J8dE5JOQLb7s0ep1TuzWxORiXTR+ZPk39sht4hsbZOSOeK
 qcXFO4sRdZSV1aHLubbahhjqjaAz9V4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3I72G48i2WW+u6ZQ5B0RTg3fWJO5iEq8hsqAx7cjlXE=;
 b=YcEVVtuTSGp/UkFv4oO4LNt/7qMQcQQlWPEifu0zUiucH/axA1jJF+74r9S3M2EEj16fIM
 XU4vof4M0sTWaLDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 1EFF0A3B87;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/66] ALSA: als100: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:46 +0200
Message-Id: <20210608140540.17885-13-tiwai@suse.de>
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

ISA ALS100 driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/als100.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/isa/als100.c b/sound/isa/als100.c
index bacb7a1b930c..d4597fdfe091 100644
--- a/sound/isa/als100.c
+++ b/sound/isa/als100.c
@@ -177,7 +177,8 @@ static int snd_card_als100_probe(int dev,
 		return error;
 	acard = card->private_data;
 
-	if ((error = snd_card_als100_pnp(dev, acard, pcard, pid))) {
+	error = snd_card_als100_pnp(dev, acard, pcard, pid);
+	if (error) {
 		snd_card_free(card);
 		return error;
 	}
@@ -211,12 +212,14 @@ static int snd_card_als100_probe(int dev,
 			 dma16[dev]);
 	}
 
-	if ((error = snd_sb16dsp_pcm(chip, 0)) < 0) {
+	error = snd_sb16dsp_pcm(chip, 0);
+	if (error < 0) {
 		snd_card_free(card);
 		return error;
 	}
 
-	if ((error = snd_sbmixer_new(chip)) < 0) {
+	error = snd_sbmixer_new(chip);
+	if (error < 0) {
 		snd_card_free(card);
 		return error;
 	}
@@ -245,18 +248,21 @@ static int snd_card_als100_probe(int dev,
 			snd_printk(KERN_ERR PFX "no OPL device at 0x%lx-0x%lx\n",
 				   fm_port[dev], fm_port[dev] + 2);
 		} else {
-			if ((error = snd_opl3_timer_new(opl3, 0, 1)) < 0) {
+			error = snd_opl3_timer_new(opl3, 0, 1);
+			if (error < 0) {
 				snd_card_free(card);
 				return error;
 			}
-			if ((error = snd_opl3_hwdep_new(opl3, 0, 1, NULL)) < 0) {
+			error = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
+			if (error < 0) {
 				snd_card_free(card);
 				return error;
 			}
 		}
 	}
 
-	if ((error = snd_card_register(card)) < 0) {
+	error = snd_card_register(card);
+	if (error < 0) {
 		snd_card_free(card);
 		return error;
 	}
-- 
2.26.2

