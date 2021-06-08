Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F14939F8E9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:21:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 385DB17BE;
	Tue,  8 Jun 2021 16:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 385DB17BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162101;
	bh=EWe65DrJ+mok7gl+MS1STeOR88hzkgdehmJQgEaPlho=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RrAcsAVgmIc+H6AjHPJSbyVre5wpS1U8BTYu8HokwOQtrp3nIhPHqYJvxzmcdGuny
	 W4GXoQr1tPsT8vdTcfOfXUniYRLwQLLWjuEO+A7EUVoZVhPS7Mc4fEiGYhUmkq9ZJg
	 OGdFg0zueYHozC1KuPLmOmLqxdQSnqMUxGx9K3fE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F2A7F80517;
	Tue,  8 Jun 2021 16:07:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1774DF80536; Tue,  8 Jun 2021 16:06:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEA26F804FA
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEA26F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="F+1nRDn6"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="MCAz7O9C"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C6FD21FDF6
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxL6ygppRuVuRIOnySsCavdhCCSMQyjQk/4Dot3lGZE=;
 b=F+1nRDn6PfJF54hvEuSc7rzmk5nMwSxpbaFA0P/o+RC7WgDbKStuCblGP/m1mK3gJWxvmp
 fVpRr1hpuvJJGQHHWhFff6D7nw24m0Jg0G1hrLLQ33+2+HaIylFXLmfrql+dPyzSREemz0
 qPHsXz6g8ZS5Gv0mwMInSUWCn5zKdks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxL6ygppRuVuRIOnySsCavdhCCSMQyjQk/4Dot3lGZE=;
 b=MCAz7O9CV5v3mcv4SNKbVcWkmgDrGY04yHkRt0+prgT/ttMdFIg5z8ragirsYQNEdCitpd
 zh7OktYzUbmHdbDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B77F8A3B84;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 61/66] ALSA: opl3: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:35 +0200
Message-Id: <20210608140540.17885-62-tiwai@suse.de>
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

OPL3 helper code contains a few assignments in if condition, which is
a bad coding style that may confuse readers and occasionally lead to
bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/opl3/opl3_lib.c | 42 ++++++++++++++++++++++-------------
 sound/drivers/opl3/opl3_oss.c |  6 +++--
 sound/drivers/opl3/opl3_seq.c |  9 +++++---
 3 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/sound/drivers/opl3/opl3_lib.c b/sound/drivers/opl3/opl3_lib.c
index 9259522483c8..6c1f1cc092d8 100644
--- a/sound/drivers/opl3/opl3_lib.c
+++ b/sound/drivers/opl3/opl3_lib.c
@@ -243,7 +243,8 @@ static int snd_opl3_timer1_init(struct snd_opl3 * opl3, int timer_no)
 	tid.card = opl3->card->number;
 	tid.device = timer_no;
 	tid.subdevice = 0;
-	if ((err = snd_timer_new(opl3->card, "AdLib timer #1", &tid, &timer)) >= 0) {
+	err = snd_timer_new(opl3->card, "AdLib timer #1", &tid, &timer);
+	if (err >= 0) {
 		strcpy(timer->name, "AdLib timer #1");
 		timer->private_data = opl3;
 		timer->hw = snd_opl3_timer1;
@@ -263,7 +264,8 @@ static int snd_opl3_timer2_init(struct snd_opl3 * opl3, int timer_no)
 	tid.card = opl3->card->number;
 	tid.device = timer_no;
 	tid.subdevice = 0;
-	if ((err = snd_timer_new(opl3->card, "AdLib timer #2", &tid, &timer)) >= 0) {
+	err = snd_timer_new(opl3->card, "AdLib timer #2", &tid, &timer);
+	if (err >= 0) {
 		strcpy(timer->name, "AdLib timer #2");
 		timer->private_data = opl3;
 		timer->hw = snd_opl3_timer2;
@@ -348,7 +350,8 @@ int snd_opl3_new(struct snd_card *card,
 	spin_lock_init(&opl3->reg_lock);
 	spin_lock_init(&opl3->timer_lock);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_CODEC, opl3, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_CODEC, opl3, &ops);
+	if (err < 0) {
 		snd_opl3_free(opl3);
 		return err;
 	}
@@ -396,19 +399,23 @@ int snd_opl3_create(struct snd_card *card,
 	int err;
 
 	*ropl3 = NULL;
-	if ((err = snd_opl3_new(card, hardware, &opl3)) < 0)
+	err = snd_opl3_new(card, hardware, &opl3);
+	if (err < 0)
 		return err;
 	if (! integrated) {
-		if ((opl3->res_l_port = request_region(l_port, 2, "OPL2/3 (left)")) == NULL) {
+		opl3->res_l_port = request_region(l_port, 2, "OPL2/3 (left)");
+		if (!opl3->res_l_port) {
 			snd_printk(KERN_ERR "opl3: can't grab left port 0x%lx\n", l_port);
 			snd_device_free(card, opl3);
 			return -EBUSY;
 		}
-		if (r_port != 0 &&
-		    (opl3->res_r_port = request_region(r_port, 2, "OPL2/3 (right)")) == NULL) {
-			snd_printk(KERN_ERR "opl3: can't grab right port 0x%lx\n", r_port);
-			snd_device_free(card, opl3);
-			return -EBUSY;
+		if (r_port != 0) {
+			opl3->res_r_port = request_region(r_port, 2, "OPL2/3 (right)");
+			if (!opl3->res_r_port) {
+				snd_printk(KERN_ERR "opl3: can't grab right port 0x%lx\n", r_port);
+				snd_device_free(card, opl3);
+				return -EBUSY;
+			}
 		}
 	}
 	opl3->l_port = l_port;
@@ -423,7 +430,8 @@ int snd_opl3_create(struct snd_card *card,
 		break;
 	default:
 		opl3->command = &snd_opl2_command;
-		if ((err = snd_opl3_detect(opl3)) < 0) {
+		err = snd_opl3_detect(opl3);
+		if (err < 0) {
 			snd_printd("OPL2/3 chip not detected at 0x%lx/0x%lx\n",
 				   opl3->l_port, opl3->r_port);
 			snd_device_free(card, opl3);
@@ -449,11 +457,14 @@ int snd_opl3_timer_new(struct snd_opl3 * opl3, int timer1_dev, int timer2_dev)
 {
 	int err;
 
-	if (timer1_dev >= 0)
-		if ((err = snd_opl3_timer1_init(opl3, timer1_dev)) < 0)
+	if (timer1_dev >= 0) {
+		err = snd_opl3_timer1_init(opl3, timer1_dev);
+		if (err < 0)
 			return err;
+	}
 	if (timer2_dev >= 0) {
-		if ((err = snd_opl3_timer2_init(opl3, timer2_dev)) < 0) {
+		err = snd_opl3_timer2_init(opl3, timer2_dev);
+		if (err < 0) {
 			snd_device_free(opl3->card, opl3->timer1);
 			opl3->timer1 = NULL;
 			return err;
@@ -477,7 +488,8 @@ int snd_opl3_hwdep_new(struct snd_opl3 * opl3,
 
 	/* create hardware dependent device (direct FM) */
 
-	if ((err = snd_hwdep_new(card, "OPL2/OPL3", device, &hw)) < 0) {
+	err = snd_hwdep_new(card, "OPL2/OPL3", device, &hw);
+	if (err < 0) {
 		snd_device_free(card, opl3);
 		return err;
 	}
diff --git a/sound/drivers/opl3/opl3_oss.c b/sound/drivers/opl3/opl3_oss.c
index c82c7c1c0714..7645365eec89 100644
--- a/sound/drivers/opl3/opl3_oss.c
+++ b/sound/drivers/opl3/opl3_oss.c
@@ -136,7 +136,8 @@ static int snd_opl3_open_seq_oss(struct snd_seq_oss_arg *arg, void *closure)
 	if (snd_BUG_ON(!arg))
 		return -ENXIO;
 
-	if ((err = snd_opl3_synth_setup(opl3)) < 0)
+	err = snd_opl3_synth_setup(opl3);
+	if (err < 0)
 		return err;
 
 	/* fill the argument data */
@@ -144,7 +145,8 @@ static int snd_opl3_open_seq_oss(struct snd_seq_oss_arg *arg, void *closure)
 	arg->addr.client = opl3->oss_chset->client;
 	arg->addr.port = opl3->oss_chset->port;
 
-	if ((err = snd_opl3_synth_use_inc(opl3)) < 0)
+	err = snd_opl3_synth_use_inc(opl3);
+	if (err < 0)
 		return err;
 
 	opl3->synth_mode = SNDRV_OPL3_MODE_SYNTH;
diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index cd2a01b5e2e1..75de1299c3dc 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -92,7 +92,8 @@ static int snd_opl3_synth_use(void *private_data, struct snd_seq_port_subscribe
 	struct snd_opl3 *opl3 = private_data;
 	int err;
 
-	if ((err = snd_opl3_synth_setup(opl3)) < 0)
+	err = snd_opl3_synth_setup(opl3);
+	if (err < 0)
 		return err;
 
 	if (use_internal_drums) {
@@ -107,7 +108,8 @@ static int snd_opl3_synth_use(void *private_data, struct snd_seq_port_subscribe
 	}
 
 	if (info->sender.client != SNDRV_SEQ_CLIENT_SYSTEM) {
-		if ((err = snd_opl3_synth_use_inc(opl3)) < 0)
+		err = snd_opl3_synth_use_inc(opl3);
+		if (err < 0)
 			return err;
 	}
 	opl3->synth_mode = SNDRV_OPL3_MODE_SEQ;
@@ -227,7 +229,8 @@ static int snd_opl3_seq_probe(struct device *_dev)
 	if (client < 0)
 		return client;
 
-	if ((err = snd_opl3_synth_create_port(opl3)) < 0) {
+	err = snd_opl3_synth_create_port(opl3);
+	if (err < 0) {
 		snd_seq_delete_kernel_client(client);
 		opl3->seq_client = -1;
 		return err;
-- 
2.26.2

