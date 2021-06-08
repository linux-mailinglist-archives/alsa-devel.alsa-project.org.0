Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAE139F8E8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:21:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CB701767;
	Tue,  8 Jun 2021 16:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CB701767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162080;
	bh=SwpHOi2hGhzhjpOS7lL+aqHeVzD/HgrjJUhDl5cuW8g=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q6KYmI5XS25d1X1CMsO/GNcLyGXc2KAtjYeiy6mVeVa0i0V88/LezXgPxdaMOUQqT
	 s6z3/SRY+Xfiuad/sWjFLJWDF5w+hhcMyPiQrSb25EscJfcAJPIk9pw/lvueYdyc4W
	 qfkQkBWe7Kmwbq0oc6EpZdimlGPS/zVI983GpZzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1CBDF80506;
	Tue,  8 Jun 2021 16:07:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0FC9F80603; Tue,  8 Jun 2021 16:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE110F804F2
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE110F804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="W8Zg2v7l"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Q53fK63I"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A16341FDF5
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEaRCQtvHtSFkd8UrC/B/t4vuzYsPNzCceBREMLVJE4=;
 b=W8Zg2v7l3tBGYCQp3ftUvYmtdgp9cpCeZxIU14Eiyg9rta3yWbyLkZHCgKJF+KX9LhV4bb
 Mss5JjMoYgHTFHOLYYk/rWG/r27TGVwiSPIcB5a4/7fSq5QaqF7Fq3aBi49jmNw1hfc3D9
 f9SzEl8/dvoe9j0IhM83lH2saWlrmWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEaRCQtvHtSFkd8UrC/B/t4vuzYsPNzCceBREMLVJE4=;
 b=Q53fK63IjgVpq7Sf7WUSDNKE7sQf+l08VFlpav3m/LCNS0kVE1SAcfW5KeCra+4rsMj5CQ
 UnQTU0NuqvOIV/Dg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 92101A3B88;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 57/66] ALSA: pcmcia: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:31 +0200
Message-Id: <20210608140540.17885-58-tiwai@suse.de>
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

PCMCIA VX222 and PDAudioCF drivers contain a few assignments in if
condition, which is a bad coding style that may confuse readers and
occasionally lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pcmcia/pdaudiocf/pdaudiocf.c | 3 ++-
 sound/pcmcia/vx/vxp_mixer.c        | 6 ++++--
 sound/pcmcia/vx/vxp_ops.c          | 6 ++++--
 sound/pcmcia/vx/vxpocket.c         | 3 ++-
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf.c b/sound/pcmcia/pdaudiocf/pdaudiocf.c
index 144582350a05..8363ec08df5d 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf.c
@@ -170,7 +170,8 @@ static int snd_pdacf_assign_resources(struct snd_pdacf *pdacf, int port, int irq
 	if (err < 0)
 		return err;
 
-	if ((err = snd_card_register(card)) < 0)
+	err = snd_card_register(card);
+	if (err < 0)
 		return err;
 
 	return 0;
diff --git a/sound/pcmcia/vx/vxp_mixer.c b/sound/pcmcia/vx/vxp_mixer.c
index 0f59e4cca56d..bc2114475810 100644
--- a/sound/pcmcia/vx/vxp_mixer.c
+++ b/sound/pcmcia/vx/vxp_mixer.c
@@ -124,11 +124,13 @@ int vxp_add_mic_controls(struct vx_core *_chip)
 	/* mic level */
 	switch (_chip->type) {
 	case VX_TYPE_VXPOCKET:
-		if ((err = snd_ctl_add(_chip->card, snd_ctl_new1(&vx_control_mic_level, chip))) < 0)
+		err = snd_ctl_add(_chip->card, snd_ctl_new1(&vx_control_mic_level, chip));
+		if (err < 0)
 			return err;
 		break;
 	case VX_TYPE_VXP440:
-		if ((err = snd_ctl_add(_chip->card, snd_ctl_new1(&vx_control_mic_boost, chip))) < 0)
+		err = snd_ctl_add(_chip->card, snd_ctl_new1(&vx_control_mic_boost, chip));
+		if (err < 0)
 			return err;
 		break;
 	}
diff --git a/sound/pcmcia/vx/vxp_ops.c b/sound/pcmcia/vx/vxp_ops.c
index 45eeb0f57d59..4176abd73799 100644
--- a/sound/pcmcia/vx/vxp_ops.c
+++ b/sound/pcmcia/vx/vxp_ops.c
@@ -237,9 +237,11 @@ static int vxp_load_dsp(struct vx_core *vx, int index, const struct firmware *fw
 	switch (index) {
 	case 0:
 		/* xilinx boot */
-		if ((err = vx_check_magic(vx)) < 0)
+		err = vx_check_magic(vx);
+		if (err < 0)
 			return err;
-		if ((err = snd_vx_load_boot_image(vx, fw)) < 0)
+		err = snd_vx_load_boot_image(vx, fw);
+		if (err < 0)
 			return err;
 		return 0;
 	case 1:
diff --git a/sound/pcmcia/vx/vxpocket.c b/sound/pcmcia/vx/vxpocket.c
index 636320489805..0dfb6a943b60 100644
--- a/sound/pcmcia/vx/vxpocket.c
+++ b/sound/pcmcia/vx/vxpocket.c
@@ -183,7 +183,8 @@ static int snd_vxpocket_assign_resources(struct vx_core *chip, int port, int irq
 	chip->irq = irq;
 	card->sync_irq = chip->irq;
 
-	if ((err = snd_vx_setup_firmware(chip)) < 0)
+	err = snd_vx_setup_firmware(chip);
+	if (err < 0)
 		return err;
 
 	return 0;
-- 
2.26.2

