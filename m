Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9840E39F907
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:26:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31EC216DB;
	Tue,  8 Jun 2021 16:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31EC216DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162378;
	bh=TrymA9aTa5VtU2ZPa1othmTktLRP7nVSp2vdJXAPiVU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGlStItpSvdSzQDVyxyCKqI9L2KtQ16TB3BSrIaKgJtu8V3Fz0qkJjgORGjfvirYY
	 vJnMKANQfL258m5k1znJ2qVoNZma1mcTf6y0j1f3kXnUjTN5l7M1vadlYK8BtmaNsw
	 eDu6/vuksotDBZkf6EP2KGKLcM6iKhRp0bbaFDiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15BE6F80524;
	Tue,  8 Jun 2021 16:07:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73B19F8061D; Tue,  8 Jun 2021 16:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCC25F8050F
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCC25F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Hh0tAhfA"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="7Ly3tKeW"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6CC05219F5
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40jNcmkFdBARhuXoBSJlvuDNhXJc00YvU0hr0bAMNCE=;
 b=Hh0tAhfA8jQaSbT/2NOaHCFD/JZ6Pc9VsZnGZ0jH7etIL1VWNoJVpIFr/rlDFs2u/nkVPJ
 6MBPFqKuYt0+rUC4O4ebKhCcWgEBWjnN5dNQC9K38X19Jyp1+aDKh35eBrjKCRtZP/Amlg
 BYb8r0t8DUq8AknyJ0KwAObyGvrGf8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40jNcmkFdBARhuXoBSJlvuDNhXJc00YvU0hr0bAMNCE=;
 b=7Ly3tKeWKoUMiaLeM2njC0AXIaW1H24FyVEm3dbrihWTu2XEDk8UA8EAHZPM8m6XZPFVaI
 dlzxm03sQPKfXRBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 5C47AA3B84;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 53/66] ALSA: core: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:27 +0200
Message-Id: <20210608140540.17885-54-tiwai@suse.de>
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

There are a few places doing assignments in if condition in ALSA core
code, which is a bad coding style that may confuse readers and
occasionally lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/hwdep.c     |  6 ++++--
 sound/core/info_oss.c  |  3 ++-
 sound/core/init.c      | 12 ++++++++----
 sound/core/sound.c     |  3 ++-
 sound/core/sound_oss.c |  3 ++-
 5 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index 264b8ea64bc2..e95fa275c289 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -195,7 +195,8 @@ static int snd_hwdep_dsp_status(struct snd_hwdep *hw,
 		return -ENXIO;
 	memset(&info, 0, sizeof(info));
 	info.dsp_loaded = hw->dsp_loaded;
-	if ((err = hw->ops.dsp_status(hw, &info)) < 0)
+	err = hw->ops.dsp_status(hw, &info);
+	if (err < 0)
 		return err;
 	if (copy_to_user(_info, &info, sizeof(info)))
 		return -EFAULT;
@@ -500,7 +501,8 @@ static void __init snd_hwdep_proc_init(void)
 {
 	struct snd_info_entry *entry;
 
-	if ((entry = snd_info_create_module_entry(THIS_MODULE, "hwdep", NULL)) != NULL) {
+	entry = snd_info_create_module_entry(THIS_MODULE, "hwdep", NULL);
+	if (entry) {
 		entry->c.text.read = snd_hwdep_proc_read;
 		if (snd_info_register(entry) < 0) {
 			snd_info_free_entry(entry);
diff --git a/sound/core/info_oss.c b/sound/core/info_oss.c
index 83900485dd8c..1ba887c7954e 100644
--- a/sound/core/info_oss.c
+++ b/sound/core/info_oss.c
@@ -31,7 +31,8 @@ int snd_oss_info_register(int dev, int num, char *string)
 		return -ENXIO;
 	mutex_lock(&strings);
 	if (string == NULL) {
-		if ((x = snd_sndstat_strings[num][dev]) != NULL) {
+		x = snd_sndstat_strings[num][dev];
+		if (x) {
 			kfree(x);
 			x = NULL;
 		}
diff --git a/sound/core/init.c b/sound/core/init.c
index 228faf9369dc..1490568efdb0 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -770,7 +770,8 @@ int snd_card_register(struct snd_card *card)
 		card->registered = true;
 	}
 
-	if ((err = snd_device_register_all(card)) < 0)
+	err = snd_device_register_all(card);
+	if (err < 0)
 		return err;
 	mutex_lock(&snd_card_mutex);
 	if (snd_cards[card->number]) {
@@ -813,7 +814,8 @@ static void snd_card_info_read(struct snd_info_entry *entry,
 
 	for (idx = count = 0; idx < SNDRV_CARDS; idx++) {
 		mutex_lock(&snd_card_mutex);
-		if ((card = snd_cards[idx]) != NULL) {
+		card = snd_cards[idx];
+		if (card) {
 			count++;
 			snd_iprintf(buffer, "%2i [%-15s]: %s - %s\n",
 					idx,
@@ -837,7 +839,8 @@ void snd_card_info_read_oss(struct snd_info_buffer *buffer)
 
 	for (idx = count = 0; idx < SNDRV_CARDS; idx++) {
 		mutex_lock(&snd_card_mutex);
-		if ((card = snd_cards[idx]) != NULL) {
+		card = snd_cards[idx];
+		if (card) {
 			count++;
 			snd_iprintf(buffer, "%s\n", card->longname);
 		}
@@ -859,7 +862,8 @@ static void snd_card_module_info_read(struct snd_info_entry *entry,
 
 	for (idx = 0; idx < SNDRV_CARDS; idx++) {
 		mutex_lock(&snd_card_mutex);
-		if ((card = snd_cards[idx]) != NULL)
+		card = snd_cards[idx];
+		if (card)
 			snd_iprintf(buffer, "%2i %s\n",
 				    idx, card->module->name);
 		mutex_unlock(&snd_card_mutex);
diff --git a/sound/core/sound.c b/sound/core/sound.c
index af89e51dd44a..df5571d98629 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -357,7 +357,8 @@ static void snd_minor_info_read(struct snd_info_entry *entry, struct snd_info_bu
 
 	mutex_lock(&sound_mutex);
 	for (minor = 0; minor < SNDRV_OS_MINORS; ++minor) {
-		if (!(mptr = snd_minors[minor]))
+		mptr = snd_minors[minor];
+		if (!mptr)
 			continue;
 		if (mptr->card >= 0) {
 			if (mptr->device >= 0)
diff --git a/sound/core/sound_oss.c b/sound/core/sound_oss.c
index 610f317bea9d..7ed0a2a91035 100644
--- a/sound/core/sound_oss.c
+++ b/sound/core/sound_oss.c
@@ -217,7 +217,8 @@ static void snd_minor_info_oss_read(struct snd_info_entry *entry,
 
 	mutex_lock(&sound_oss_mutex);
 	for (minor = 0; minor < SNDRV_OSS_MINORS; ++minor) {
-		if (!(mptr = snd_oss_minors[minor]))
+		mptr = snd_oss_minors[minor];
+		if (!mptr)
 			continue;
 		if (mptr->card >= 0)
 			snd_iprintf(buffer, "%3i: [%i-%2i]: %s\n", minor,
-- 
2.26.2

