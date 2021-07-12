Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E21D3C4639
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 11:20:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E159167E;
	Mon, 12 Jul 2021 11:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E159167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626081642;
	bh=fZ+PEx2bON+R6l0/wj+ujiTZuFj4sOD2Xi3dv4ZzpYE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qpjpqzioq9ngrk1ys3rnae2cYzcy4ShzVv4ChG726MNL8RXwmFxUyIfpCDSrQkAeQ
	 2PTl/0BSB3s5Fo3gK9ZKBRRn/Qoz2hYC/IUf48ikX/v4Aa0w9s8Mz6RvKXt9BvPdoh
	 TxvqAaZzVYlHq5Ck6LMsvQMF9Hi8v6UaOmexI8b0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74549F80254;
	Mon, 12 Jul 2021 11:19:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AE61F80253; Mon, 12 Jul 2021 11:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 537A7F80083
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 11:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 537A7F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="iyEpllKe"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="LEgjnrUm"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0BBAF1FF65
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626081546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wwa+sWj0zJorfRbqNSspMxfBYx9QQZBym6NSEB4mnS8=;
 b=iyEpllKeu74G2nj4DQi0BKRHSV8Sh8c3a/uZ5Yq1g2MLkaK0VmkbJ5/Vt0H/nIkSzrUdjx
 AJ7oj0NYAQyuiS3smdNdjU1WiqdXlzfvxojiJpMqgGq8YNlQQwVO15kd9A8AWvVs4XENWG
 PK1UKqjKEFG9VAjo48mC5v5FUZWvzLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626081546;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wwa+sWj0zJorfRbqNSspMxfBYx9QQZBym6NSEB4mnS8=;
 b=LEgjnrUmoudQMvUCCTNNUpev91/ERWsA2svWXrnJmMRs6PVwK/Kc7hPqNSnks9q1GgYXA1
 zFsLaVUzjkMXN1DA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id EFB8BA3B84;
 Mon, 12 Jul 2021 09:19:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ice1724: Remove superfluous loop over model table
Date: Mon, 12 Jul 2021 11:19:04 +0200
Message-Id: <20210712091904.28022-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

The ice1724 driver looks for the matching card_info entry twice, once
at reading EEPROM and another for the rest tasks in the probe call.
Reduce the second one by referring to the already assigned card_info
entry.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/ice1724.c | 42 +++++++++++++------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index ef2367d86148..8052d7cb8925 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2150,13 +2150,6 @@ static const struct snd_kcontrol_new snd_vt1724_mixer_pro_peak = {
 	.get = snd_vt1724_pro_peak_get
 };
 
-/*
- *
- */
-
-static const struct snd_ice1712_card_info no_matched;
-
-
 /*
   ooAoo cards with no controls
 */
@@ -2574,7 +2567,7 @@ static int snd_vt1724_probe(struct pci_dev *pci,
 	struct snd_card *card;
 	struct snd_ice1712 *ice;
 	int pcm_dev = 0, err;
-	const struct snd_ice1712_card_info * const *tbl, *c;
+	const struct snd_ice1712_card_info *c;
 
 	if (dev >= SNDRV_CARDS)
 		return -ENODEV;
@@ -2600,27 +2593,20 @@ static int snd_vt1724_probe(struct pci_dev *pci,
 	/* field init before calling chip_init */
 	ice->ext_clock_count = 0;
 
-	for (tbl = card_tables; *tbl; tbl++) {
-		for (c = *tbl; c->name; c++) {
-			if ((model[dev] && c->model &&
-			     !strcmp(model[dev], c->model)) ||
-			    (c->subvendor == ice->eeprom.subvendor)) {
-				strcpy(card->shortname, c->name);
-				if (c->driver) /* specific driver? */
-					strcpy(card->driver, c->driver);
-				if (c->chip_init) {
-					err = c->chip_init(ice);
-					if (err < 0) {
-						snd_card_free(card);
-						return err;
-					}
-				}
-				goto __found;
+	c = ice->card_info;
+	if (c) {
+		strcpy(card->shortname, c->name);
+		if (c->driver) /* specific driver? */
+			strcpy(card->driver, c->driver);
+		if (c->chip_init) {
+			err = c->chip_init(ice);
+			if (err < 0) {
+				snd_card_free(card);
+				return err;
 			}
 		}
 	}
-	c = &no_matched;
-__found:
+
 	/*
 	* VT1724 has separate DMAs for the analog and the SPDIF streams while
 	* ICE1712 has only one for both (mixed up).
@@ -2688,7 +2674,7 @@ static int snd_vt1724_probe(struct pci_dev *pci,
 		}
 	}
 
-	if (c->build_controls) {
+	if (c && c->build_controls) {
 		err = c->build_controls(ice);
 		if (err < 0) {
 			snd_card_free(card);
@@ -2696,7 +2682,7 @@ static int snd_vt1724_probe(struct pci_dev *pci,
 		}
 	}
 
-	if (!c->no_mpu401) {
+	if (!c || !c->no_mpu401) {
 		if (ice->eeprom.data[ICE_EEP2_SYSCONF] & VT1724_CFG_MPU401) {
 			struct snd_rawmidi *rmidi;
 
-- 
2.26.2

