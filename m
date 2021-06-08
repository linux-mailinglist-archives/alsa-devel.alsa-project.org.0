Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F0F39F8F7
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A03B1841;
	Tue,  8 Jun 2021 16:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A03B1841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162275;
	bh=qb5KpQKULGkCQ0KTNVj8iSeRxKoGCeB3+hroGIsqmS4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qplAyBKLkWLULNtRnVTy5nSdSiAb7cZFAgDUw3droXqqiWqI/5nX1awm4cAMBn4rH
	 1ZW5QJPlaufjfeJKjjeHIhNSOUhWslKQx66MYo8w0mj2jz1WhqXgOgJM7ZieSTWlfq
	 Z5+AWH2HJkgMBKRJEOJfmQiQPQO0CPgE5ulG9Scw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C6BDF8051C;
	Tue,  8 Jun 2021 16:07:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB0EBF80614; Tue,  8 Jun 2021 16:07:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1A12F804FC
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1A12F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="xajC1/GG"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="T2XuTzzH"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0618C1FDF8
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nJFTD0gHOknziS1n7jxybqCEtKQfBolVx/wxrqk1is=;
 b=xajC1/GGP9fezIee/GU6b8zWhlrDhxon5CsSTY5cqAIXtzg3I8ilPHwLLxgvGpD3DdCBN5
 iq/eMFBesUcNKlWFelMphAkiScBDTGQhPzrPSHVZafIxdClJ0QWrzWI3aiytWGMQjbiFbe
 64dPc+nd9RBYUcR9t3q6k3FBHYvEc6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nJFTD0gHOknziS1n7jxybqCEtKQfBolVx/wxrqk1is=;
 b=T2XuTzzHVUKFL5rLMTFgOcf/vswjTekGEVt424SQOf7GYs97Z9ZireFDJ5Hk3/VDgXWcNF
 wUl5RL46RKFHJcAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id EA4C6A3B84;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 65/66] ALSA: i2c: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:39 +0200
Message-Id: <20210608140540.17885-66-tiwai@suse.de>
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

ALSA I2C helper drivers contain a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/i2c/cs8427.c       | 24 ++++++++++++++++--------
 sound/i2c/other/ak4114.c |  3 ++-
 sound/i2c/other/ak4117.c |  3 ++-
 sound/i2c/tea6330t.c     | 24 ++++++++++++++++--------
 4 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/sound/i2c/cs8427.c b/sound/i2c/cs8427.c
index 8634d4f466b3..65012af6a36e 100644
--- a/sound/i2c/cs8427.c
+++ b/sound/i2c/cs8427.c
@@ -50,7 +50,8 @@ int snd_cs8427_reg_write(struct snd_i2c_device *device, unsigned char reg,
 
 	buf[0] = reg & 0x7f;
 	buf[1] = val;
-	if ((err = snd_i2c_sendbytes(device, buf, 2)) != 2) {
+	err = snd_i2c_sendbytes(device, buf, 2);
+	if (err != 2) {
 		snd_printk(KERN_ERR "unable to send bytes 0x%02x:0x%02x "
 			   "to CS8427 (%i)\n", buf[0], buf[1], err);
 		return err < 0 ? err : -EIO;
@@ -65,12 +66,14 @@ static int snd_cs8427_reg_read(struct snd_i2c_device *device, unsigned char reg)
 	int err;
 	unsigned char buf;
 
-	if ((err = snd_i2c_sendbytes(device, &reg, 1)) != 1) {
+	err = snd_i2c_sendbytes(device, &reg, 1);
+	if (err != 1) {
 		snd_printk(KERN_ERR "unable to send register 0x%x byte "
 			   "to CS8427\n", reg);
 		return err < 0 ? err : -EIO;
 	}
-	if ((err = snd_i2c_readbytes(device, &buf, 1)) != 1) {
+	err = snd_i2c_readbytes(device, &buf, 1);
+	if (err != 1) {
 		snd_printk(KERN_ERR "unable to read register 0x%x byte "
 			   "from CS8427\n", reg);
 		return err < 0 ? err : -EIO;
@@ -108,7 +111,8 @@ static int snd_cs8427_send_corudata(struct snd_i2c_device *device,
 
 	if (!memcmp(hw_data, ndata, count))
 		return 0;
-	if ((err = snd_cs8427_select_corudata(device, udata)) < 0)
+	err = snd_cs8427_select_corudata(device, udata);
+	if (err < 0)
 		return err;
 	memcpy(hw_data, ndata, count);
 	if (udata) {
@@ -209,7 +213,8 @@ int snd_cs8427_init(struct snd_i2c_bus *bus,
 		goto __fail;
 	/* send initial values */
 	memcpy(chip->regmap + (initvals1[0] & 0x7f), initvals1 + 1, 6);
-	if ((err = snd_i2c_sendbytes(device, initvals1, 7)) != 7) {
+	err = snd_i2c_sendbytes(device, initvals1, 7);
+	if (err != 7) {
 		err = err < 0 ? err : -EIO;
 		goto __fail;
 	}
@@ -217,11 +222,13 @@ int snd_cs8427_init(struct snd_i2c_bus *bus,
 	memset(buf, 0, 7);
 	/* from address 9 to 15 */
 	buf[0] = 9;	/* register */
-	if ((err = snd_i2c_sendbytes(device, buf, 7)) != 7)
+	err = snd_i2c_sendbytes(device, buf, 7);
+	if (err != 7)
 		goto __fail;
 	/* send transfer initialization sequence */
 	memcpy(chip->regmap + (initvals2[0] & 0x7f), initvals2 + 1, 3);
-	if ((err = snd_i2c_sendbytes(device, initvals2, 4)) != 4) {
+	err = snd_i2c_sendbytes(device, initvals2, 4);
+	if (err != 4) {
 		err = err < 0 ? err : -EIO;
 		goto __fail;
 	}
@@ -383,7 +390,8 @@ static int snd_cs8427_qsubcode_get(struct snd_kcontrol *kcontrol,
 	int err;
 
 	snd_i2c_lock(device->bus);
-	if ((err = snd_i2c_sendbytes(device, &reg, 1)) != 1) {
+	err = snd_i2c_sendbytes(device, &reg, 1);
+	if (err != 1) {
 		snd_printk(KERN_ERR "unable to send register 0x%x byte "
 			   "to CS8427\n", reg);
 		snd_i2c_unlock(device->bus);
diff --git a/sound/i2c/other/ak4114.c b/sound/i2c/other/ak4114.c
index 2ce0a97957ab..c0cffe28989b 100644
--- a/sound/i2c/other/ak4114.c
+++ b/sound/i2c/other/ak4114.c
@@ -97,7 +97,8 @@ int snd_ak4114_create(struct snd_card *card,
 	chip->rcs0 = reg_read(chip, AK4114_REG_RCS0) & ~(AK4114_QINT | AK4114_CINT);
 	chip->rcs1 = reg_read(chip, AK4114_REG_RCS1);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_CODEC, chip, &ops)) < 0)
+	err = snd_device_new(card, SNDRV_DEV_CODEC, chip, &ops);
+	if (err < 0)
 		goto __fail;
 
 	if (r_ak4114)
diff --git a/sound/i2c/other/ak4117.c b/sound/i2c/other/ak4117.c
index 905be2d0780b..1bc43e927d82 100644
--- a/sound/i2c/other/ak4117.c
+++ b/sound/i2c/other/ak4117.c
@@ -86,7 +86,8 @@ int snd_ak4117_create(struct snd_card *card, ak4117_read_t *read, ak4117_write_t
 	chip->rcs1 = reg_read(chip, AK4117_REG_RCS1);
 	chip->rcs2 = reg_read(chip, AK4117_REG_RCS2);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_CODEC, chip, &ops)) < 0)
+	err = snd_device_new(card, SNDRV_DEV_CODEC, chip, &ops);
+	if (err < 0)
 		goto __fail;
 
 	if (r_ak4117)
diff --git a/sound/i2c/tea6330t.c b/sound/i2c/tea6330t.c
index 08eb6a873768..742d0f724375 100644
--- a/sound/i2c/tea6330t.c
+++ b/sound/i2c/tea6330t.c
@@ -115,7 +115,8 @@ static int snd_tea6330t_put_master_volume(struct snd_kcontrol *kcontrol,
 		bytes[count++] = tea->regs[TEA6330T_SADDR_VOLUME_RIGHT] = tea->mright;
 	}
 	if (count > 0) {
-		if ((err = snd_i2c_sendbytes(tea->device, bytes, count)) < 0)
+		err = snd_i2c_sendbytes(tea->device, bytes, count);
+		if (err < 0)
 			change = err;
 	}
 	snd_i2c_unlock(tea->bus);
@@ -160,7 +161,8 @@ static int snd_tea6330t_put_master_switch(struct snd_kcontrol *kcontrol,
 	bytes[0] = TEA6330T_SADDR_VOLUME_LEFT;
 	bytes[1] = tea->regs[TEA6330T_SADDR_VOLUME_LEFT];
 	bytes[2] = tea->regs[TEA6330T_SADDR_VOLUME_RIGHT];
-	if ((err = snd_i2c_sendbytes(tea->device, bytes, 3)) < 0)
+	err = snd_i2c_sendbytes(tea->device, bytes, 3);
+	if (err < 0)
 		change = err;
 	snd_i2c_unlock(tea->bus);
 	return change;
@@ -207,7 +209,8 @@ static int snd_tea6330t_put_bass(struct snd_kcontrol *kcontrol,
 	change = tea->regs[TEA6330T_SADDR_BASS] != val1;
 	bytes[0] = TEA6330T_SADDR_BASS;
 	bytes[1] = tea->regs[TEA6330T_SADDR_BASS] = val1;
-	if ((err = snd_i2c_sendbytes(tea->device, bytes, 2)) < 0)
+	err = snd_i2c_sendbytes(tea->device, bytes, 2);
+	if (err < 0)
 		change = err;
 	snd_i2c_unlock(tea->bus);
 	return change;
@@ -254,7 +257,8 @@ static int snd_tea6330t_put_treble(struct snd_kcontrol *kcontrol,
 	change = tea->regs[TEA6330T_SADDR_TREBLE] != val1;
 	bytes[0] = TEA6330T_SADDR_TREBLE;
 	bytes[1] = tea->regs[TEA6330T_SADDR_TREBLE] = val1;
-	if ((err = snd_i2c_sendbytes(tea->device, bytes, 2)) < 0)
+	err = snd_i2c_sendbytes(tea->device, bytes, 2);
+	if (err < 0)
 		change = err;
 	snd_i2c_unlock(tea->bus);
 	return change;
@@ -287,7 +291,8 @@ int snd_tea6330t_update_mixer(struct snd_card *card,
 	tea = kzalloc(sizeof(*tea), GFP_KERNEL);
 	if (tea == NULL)
 		return -ENOMEM;
-	if ((err = snd_i2c_device_create(bus, "TEA6330T", TEA6330T_ADDR, &device)) < 0) {
+	err = snd_i2c_device_create(bus, "TEA6330T", TEA6330T_ADDR, &device);
+	if (err < 0) {
 		kfree(tea);
 		return err;
 	}
@@ -327,18 +332,21 @@ int snd_tea6330t_update_mixer(struct snd_card *card,
 	bytes[0] = TEA6330T_SADDR_VOLUME_LEFT;
 	for (idx = 0; idx < 6; idx++)
 		bytes[idx+1] = tea->regs[idx];
-	if ((err = snd_i2c_sendbytes(device, bytes, 7)) < 0)
+	err = snd_i2c_sendbytes(device, bytes, 7);
+	if (err < 0)
 		goto __error;
 
 	strcat(card->mixername, ",TEA6330T");
-	if ((err = snd_component_add(card, "TEA6330T")) < 0)
+	err = snd_component_add(card, "TEA6330T");
+	if (err < 0)
 		goto __error;
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_tea6330t_controls); idx++) {
 		knew = &snd_tea6330t_controls[idx];
 		if (tea->treble == 0 && !strcmp(knew->name, "Tone Control - Treble"))
 			continue;
-		if ((err = snd_ctl_add(card, snd_ctl_new1(knew, tea))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(knew, tea));
+		if (err < 0)
 			goto __error;
 	}
 
-- 
2.26.2

