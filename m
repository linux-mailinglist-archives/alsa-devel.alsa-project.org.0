Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A83387DF6
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 18:55:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4BDD177C;
	Tue, 18 May 2021 18:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4BDD177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621356918;
	bh=ea7GlRaPfexv/Mhcq3F8U9ELi4iedYARXiutIlt7e4Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K1EchoZNvx6kKA2TmDtXnJooCc64HMPwWTLMFzxSK795RiZCdFZpDECkiuN3bwg9j
	 p9cL86ZPQSJO+ApeH+48sCnP20ObqSjD4FEPPIBl3X7u7NuFUNUOd1iMOsXdMK2v9/
	 iwA6wPmygql2SN3MKojSOJ2Z2EBazw+Qd2vNdPsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 868C8F804AD;
	Tue, 18 May 2021 18:52:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6548DF8042F; Tue, 18 May 2021 18:52:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFD51F80229
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 18:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD51F80229
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D18EB1B1;
 Tue, 18 May 2021 16:52:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/7] ALSA: control: Drop superfluous snd_power_wait() calls
Date: Tue, 18 May 2021 18:51:57 +0200
Message-Id: <20210518165201.24376-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210518165201.24376-1-tiwai@suse.de>
References: <20210518165201.24376-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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

Now the card power state is checked in the common ioctl handler, drop
the same redundant checks in each ioctl.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c        | 11 -----------
 sound/core/control_compat.c |  9 ---------
 2 files changed, 20 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index c22c3fad0c64..799d91ddccb0 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1042,9 +1042,6 @@ static int snd_ctl_elem_info_user(struct snd_ctl_file *ctl,
 
 	if (copy_from_user(&info, _info, sizeof(info)))
 		return -EFAULT;
-	result = snd_power_wait(ctl->card, SNDRV_CTL_POWER_D0);
-	if (result < 0)
-		return result;
 	result = snd_ctl_elem_info(ctl, &info);
 	if (result < 0)
 		return result;
@@ -1113,10 +1110,6 @@ static int snd_ctl_elem_read_user(struct snd_card *card,
 	if (IS_ERR(control))
 		return PTR_ERR(control);
 
-	result = snd_power_wait(card, SNDRV_CTL_POWER_D0);
-	if (result < 0)
-		goto error;
-
 	down_read(&card->controls_rwsem);
 	result = snd_ctl_elem_read(card, control);
 	up_read(&card->controls_rwsem);
@@ -1183,10 +1176,6 @@ static int snd_ctl_elem_write_user(struct snd_ctl_file *file,
 		return PTR_ERR(control);
 
 	card = file->card;
-	result = snd_power_wait(card, SNDRV_CTL_POWER_D0);
-	if (result < 0)
-		goto error;
-
 	result = snd_ctl_elem_write(card, file, control);
 	if (result < 0)
 		goto error;
diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index d5b562ff237b..57b73ab57506 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -96,9 +96,6 @@ static int snd_ctl_elem_info_compat(struct snd_ctl_file *ctl,
 	if (get_user(data->value.enumerated.item, &data32->value.enumerated.item))
 		goto error;
 
-	err = snd_power_wait(ctl->card, SNDRV_CTL_POWER_D0);
-	if (err < 0)
-		goto error;
 	err = snd_ctl_elem_info(ctl, data);
 	if (err < 0)
 		goto error;
@@ -298,9 +295,6 @@ static int ctl_elem_read_user(struct snd_card *card,
 	if (err < 0)
 		goto error;
 
-	err = snd_power_wait(card, SNDRV_CTL_POWER_D0);
-	if (err < 0)
-		goto error;
 	err = snd_ctl_elem_read(card, data);
 	if (err < 0)
 		goto error;
@@ -326,9 +320,6 @@ static int ctl_elem_write_user(struct snd_ctl_file *file,
 	if (err < 0)
 		goto error;
 
-	err = snd_power_wait(card, SNDRV_CTL_POWER_D0);
-	if (err < 0)
-		goto error;
 	err = snd_ctl_elem_write(card, file, data);
 	if (err < 0)
 		goto error;
-- 
2.26.2

