Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F9439F916
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:28:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E9CB189F;
	Tue,  8 Jun 2021 16:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E9CB189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162518;
	bh=VpaI09EeFYkszWjq7dpJWu8AACADuPf8I197Ayr0+vo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lEnrPJdk3ktQJSumEgIwLtNRXdPZLLW3Hw62C3zny2Csyj6kVnXojfoomy68tElOD
	 dez3qAMmmYGVBDvsxfPVc6Taefomf7qxrsM6ac15mMREOXNGdurI+aa9GMA0W6qWvZ
	 BWxYz5LLjw/VZciwly59Fm+hWcO4GkaFd6T9Cieo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D1DF80529;
	Tue,  8 Jun 2021 16:07:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73D95F80634; Tue,  8 Jun 2021 16:07:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0937BF80519
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0937BF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="VUx5N/fM"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ZgWbH6fE"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D04CB219EB
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=si8FrI+trMYo24TA6jRWRcLvD22WVLvHwzu3gDyH8ww=;
 b=VUx5N/fMw1A1JR+D1YkNgZ2Xmf9dzeglm3yCtZSQNzpFJFc35EFJLhZfsaQfEeIDB/pMbq
 DH3tKjxnA5hWzfPVW6sEHtqntk9LSMosKe4gPN58B01d1u2DbnqBYMtl3V4E77zHprHJup
 yQy/nfepVOd5qNQNwYSpmrL4cfaPrgM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=si8FrI+trMYo24TA6jRWRcLvD22WVLvHwzu3gDyH8ww=;
 b=ZgWbH6fEw2v1yZxTpIImR5RZmGtKTC1I5M7zAC98BcoRKLtq7eU7BmI923X2TPqMDG5k0t
 GspBJSUd5epb5oAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C1047A3B88;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 42/66] ALSA: ice1712: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:16 +0200
Message-Id: <20210608140540.17885-43-tiwai@suse.de>
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

PCI ICE1712 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/delta.c |  6 ++++--
 sound/pci/ice1712/ews.c   | 24 ++++++++++++++++--------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/sound/pci/ice1712/delta.c b/sound/pci/ice1712/delta.c
index 1d2a0287284b..08adf4dd1303 100644
--- a/sound/pci/ice1712/delta.c
+++ b/sound/pci/ice1712/delta.c
@@ -676,13 +676,15 @@ static int snd_ice1712_delta_init(struct snd_ice1712 *ice)
 	case ICE1712_SUBDEVICE_DELTA1010LT:
 	case ICE1712_SUBDEVICE_VX442:
 	case ICE1712_SUBDEVICE_DELTA66E:
-		if ((err = snd_i2c_bus_create(ice->card, "ICE1712 GPIO 1", NULL, &ice->i2c)) < 0) {
+		err = snd_i2c_bus_create(ice->card, "ICE1712 GPIO 1", NULL, &ice->i2c);
+		if (err < 0) {
 			dev_err(ice->card->dev, "unable to create I2C bus\n");
 			return err;
 		}
 		ice->i2c->private_data = ice;
 		ice->i2c->ops = &ap_cs8427_i2c_ops;
-		if ((err = snd_ice1712_init_cs8427(ice, CS8427_BASE_ADDR)) < 0)
+		err = snd_ice1712_init_cs8427(ice, CS8427_BASE_ADDR);
+		if (err < 0)
 			return err;
 		break;
 	case ICE1712_SUBDEVICE_DELTA1010:
diff --git a/sound/pci/ice1712/ews.c b/sound/pci/ice1712/ews.c
index 3794308313bf..8bb86b3c894e 100644
--- a/sound/pci/ice1712/ews.c
+++ b/sound/pci/ice1712/ews.c
@@ -442,7 +442,8 @@ static int snd_ice1712_ews_init(struct snd_ice1712 *ice)
 	ice->spec = spec;
 
 	/* create i2c */
-	if ((err = snd_i2c_bus_create(ice->card, "ICE1712 GPIO 1", NULL, &ice->i2c)) < 0) {
+	err = snd_i2c_bus_create(ice->card, "ICE1712 GPIO 1", NULL, &ice->i2c);
+	if (err < 0) {
 		dev_err(ice->card->dev, "unable to create I2C bus\n");
 		return err;
 	}
@@ -483,7 +484,8 @@ static int snd_ice1712_ews_init(struct snd_ice1712 *ice)
 		if (err < 0)
 			return err;
 		/* Check if the front module is connected */
-		if ((err = snd_ice1712_ews88mt_chip_select(ice, 0x0f)) < 0)
+		err = snd_ice1712_ews88mt_chip_select(ice, 0x0f);
+		if (err < 0)
 			return err;
 		break;
 	case ICE1712_SUBDEVICE_EWS88D:
@@ -498,12 +500,14 @@ static int snd_ice1712_ews_init(struct snd_ice1712 *ice)
 	/* set up SPDIF interface */
 	switch (ice->eeprom.subvendor) {
 	case ICE1712_SUBDEVICE_EWX2496:
-		if ((err = snd_ice1712_init_cs8427(ice, CS8427_BASE_ADDR)) < 0)
+		err = snd_ice1712_init_cs8427(ice, CS8427_BASE_ADDR);
+		if (err < 0)
 			return err;
 		snd_cs8427_reg_write(ice->cs8427, CS8427_REG_RECVERRMASK, CS8427_UNLOCK | CS8427_CONF | CS8427_BIP | CS8427_PAR);
 		break;
 	case ICE1712_SUBDEVICE_DMX6FIRE:
-		if ((err = snd_ice1712_init_cs8427(ice, ICE1712_6FIRE_CS8427_ADDR)) < 0)
+		err = snd_ice1712_init_cs8427(ice, ICE1712_6FIRE_CS8427_ADDR);
+		if (err < 0)
 			return err;
 		snd_cs8427_reg_write(ice->cs8427, CS8427_REG_RECVERRMASK, CS8427_UNLOCK | CS8427_CONF | CS8427_BIP | CS8427_PAR);
 		break;
@@ -853,7 +857,8 @@ static int snd_ice1712_6fire_control_get(struct snd_kcontrol *kcontrol, struct s
 	int invert = (kcontrol->private_value >> 8) & 1;
 	int data;
 	
-	if ((data = snd_ice1712_6fire_read_pca(ice, PCF9554_REG_OUTPUT)) < 0)
+	data = snd_ice1712_6fire_read_pca(ice, PCF9554_REG_OUTPUT);
+	if (data < 0)
 		return data;
 	data = (data >> shift) & 1;
 	if (invert)
@@ -869,7 +874,8 @@ static int snd_ice1712_6fire_control_put(struct snd_kcontrol *kcontrol, struct s
 	int invert = (kcontrol->private_value >> 8) & 1;
 	int data, ndata;
 	
-	if ((data = snd_ice1712_6fire_read_pca(ice, PCF9554_REG_OUTPUT)) < 0)
+	data = snd_ice1712_6fire_read_pca(ice, PCF9554_REG_OUTPUT);
+	if (data < 0)
 		return data;
 	ndata = data & ~(1 << shift);
 	if (ucontrol->value.integer.value[0])
@@ -896,7 +902,8 @@ static int snd_ice1712_6fire_select_input_get(struct snd_kcontrol *kcontrol, str
 	struct snd_ice1712 *ice = snd_kcontrol_chip(kcontrol);
 	int data;
 	
-	if ((data = snd_ice1712_6fire_read_pca(ice, PCF9554_REG_OUTPUT)) < 0)
+	data = snd_ice1712_6fire_read_pca(ice, PCF9554_REG_OUTPUT);
+	if (data < 0)
 		return data;
 	ucontrol->value.integer.value[0] = data & 3;
 	return 0;
@@ -907,7 +914,8 @@ static int snd_ice1712_6fire_select_input_put(struct snd_kcontrol *kcontrol, str
 	struct snd_ice1712 *ice = snd_kcontrol_chip(kcontrol);
 	int data, ndata;
 	
-	if ((data = snd_ice1712_6fire_read_pca(ice, PCF9554_REG_OUTPUT)) < 0)
+	data = snd_ice1712_6fire_read_pca(ice, PCF9554_REG_OUTPUT);
+	if (data < 0)
 		return data;
 	ndata = data & ~3;
 	ndata |= (ucontrol->value.integer.value[0] & 3);
-- 
2.26.2

