Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 527672B11A7
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 23:36:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D84A816A4;
	Thu, 12 Nov 2020 23:35:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D84A816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605220592;
	bh=ECv6jTHH1ZemTw9ELycVYfTP7rSnblzR23ZVhrrY+YM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pD65aNundzfUj5GPAIz64dwp9rEEpOb2ggpqqrvbkc24ZmA2+8Q3noBhn5TddnNMh
	 GcoL2udKE8G0EaHnpyI2c6/hjnQQUgEEhHXktGRMxpBf5icPumbKjllvzcTHNHSGq4
	 Gb/gEmimPrwehVie10MsKlq6zHChf6r7I7HnlCvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FD95F80161;
	Thu, 12 Nov 2020 23:35:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8FB6F801D5; Thu, 12 Nov 2020 23:34:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DAD6F800D1
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 23:34:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DAD6F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ifh4X+mD"
Received: by mail-lj1-x242.google.com with SMTP id s9so8169937ljo.11
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 14:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JXWupUZCS4kOpQRUmxizQOtGxBMhjGpIiVMmRfTsRYY=;
 b=Ifh4X+mD9d6hFc9WUD3a3Kw0/xNxV4f4afULPstMMZSpsPjnQNVIo6e7si8coxOSg2
 zV5g0kXCluViphC+Hhwl3bBWcimMPR5BPCGhaomNp8Pj7mHdt73NEzLubFBd3yFqcj19
 pVdWeIE/WIO8ZfwtNpFd01l8K7F8oDPf+ZzGv3DHhab/gawP8eMfYC5GvegRXwFPATr+
 tFteH3XPk3Vamd4t6MHA8TCWzuEFljXsVvb1jq5jS/hRt4QHfgJBiaFrLYNClA6brIfL
 JWdH/DLcYDenVwrIpoj8zbOZw0RDdvkcftMv4hfwkAAUSziF4ayrEnhhEYxSU7j+5rIQ
 8cSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JXWupUZCS4kOpQRUmxizQOtGxBMhjGpIiVMmRfTsRYY=;
 b=sIg9wKXkjiDL20SQk6OGchHlNTUGQ0jt/kNAUbjouzWzrd7TuCJaytauRCauflyq0+
 XauyGrol5Rkl9PrQF0YCk6S/FKJnwGdQsBEDEJNG3IEmoT78yKVlpm+0XFfvEccfYbyG
 7bnXaGR6wIjzmTDVR3JD+NPos5bpx6ohoyRnZus7OhiRUh+QebJZY4XWrKmgrCikgOTV
 7+MjkjCwS76J6v2294WkXyBvEyDpELWWx4BGfTleQFE3BpJzsZXc038iEzsqvkgQV8W4
 nHqQHD1+4QMRTTGdr++ifuPQoWkUptIEETHwXPyCBLd7leS+HCt76niw5zfTtidEzHSJ
 Z9wg==
X-Gm-Message-State: AOAM532hatZMVyjmxWdQKzlY6Smnm7DbOdUwUPwRgT/mVk2xVkZAThga
 NmzmXQeSf61X8Br9UmFpJZc=
X-Google-Smtp-Source: ABdhPJyRTGC45an6R4UH/AGQkpH/uhYWBA/t6SQvHcdqa2aao7JAWwhV0HZTboV/2+zl/17Lc6r0vg==
X-Received: by 2002:a2e:9f55:: with SMTP id v21mr706246ljk.423.1605220492027; 
 Thu, 12 Nov 2020 14:34:52 -0800 (PST)
Received: from localhost ([80.64.86.40])
 by smtp.gmail.com with ESMTPSA id w13sm1002511lfq.72.2020.11.12.14.34.51
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Thu, 12 Nov 2020 14:34:51 -0800 (PST)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: perex@perex.cz
Subject: [PATCH] [RFC] alsaloop: add feedback frequency control support for
 UAC2 gadgets
Date: Fri, 13 Nov 2020 00:34:42 +0200
Message-Id: <1605220482-28487-1-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 gschmottlach@gmail.com
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

Add support of special "PCM Feedback Frequency Hz"
UAC2 Gadget mixer control that is designed to notify
host about real sampling frequency of the gadget so
it can adjust number of samples that hosts sends to
the gadget.

This is useful if both host and gadget has its own
internal freerunning clock, so host can adjust
number of samples sent, preventing overrun/underrun
conditions.

This patch reuses logic of the "PCM Rate Shift 100000"
control used in case of in-kernel ALSA loopback
driver. The only difference is alsaloop reports not
rate shift but frequency in Hz

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 alsaloop/alsaloop.h |  1 +
 alsaloop/pcmjob.c   | 35 +++++++++++++++++++++++++----------
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/alsaloop/alsaloop.h b/alsaloop/alsaloop.h
index c4aa618..9a50a42 100644
--- a/alsaloop/alsaloop.h
+++ b/alsaloop/alsaloop.h
@@ -122,6 +122,7 @@ struct loopback_handle {
 	unsigned int ctl_pollfd_count;
 	snd_ctl_elem_value_t *ctl_notify;
 	snd_ctl_elem_value_t *ctl_rate_shift;
+	snd_ctl_elem_value_t *ctl_fback_freq;
 	snd_ctl_elem_value_t *ctl_active;
 	snd_ctl_elem_value_t *ctl_format;
 	snd_ctl_elem_value_t *ctl_rate;
diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
index 6a9aff4..b3802a8 100644
--- a/alsaloop/pcmjob.c
+++ b/alsaloop/pcmjob.c
@@ -1058,15 +1058,22 @@ static int set_notify(struct loopback_handle *lhandle, int enable)
 
 static int set_rate_shift(struct loopback_handle *lhandle, double pitch)
 {
-	int err;
+	int err = 0;
 
-	if (lhandle->ctl_rate_shift == NULL)
-		return 0;
-	snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 0, pitch * 100000);
-	err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_rate_shift);
-	if (err < 0) {
-		logit(LOG_CRIT, "Cannot set PCM Rate Shift element for %s: %s\n", lhandle->id, snd_strerror(err));
-		return err;
+	if (lhandle->ctl_rate_shift) {
+		snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 0, pitch * 100000);
+		err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_rate_shift);
+		if (err < 0) {
+			logit(LOG_CRIT, "Cannot set PCM Rate Shift element for %s: %s\n", lhandle->id, snd_strerror(err));
+			return err;
+		}
+	} else if (lhandle->ctl_fback_freq) {
+		snd_ctl_elem_value_set_integer(lhandle->ctl_fback_freq, 0, lhandle->rate * (2.0 - pitch));
+		err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_fback_freq);
+		if (err < 0) {
+			logit(LOG_CRIT, "Cannot set PCM Feedback Frequency element for %s: %s\n", lhandle->id, snd_strerror(err));
+			return err;
+		}
 	}
 	return 0;
 }
@@ -1195,6 +1202,7 @@ static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
 	int err;
 
 	lhandle->ctl_rate_shift = NULL;
+	lhandle->ctl_fback_freq = NULL;
 	if (lhandle->loopback->play == lhandle) {
 		if (lhandle->loopback->controls)
 			goto __events;
@@ -1204,6 +1212,8 @@ static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
 			&lhandle->ctl_notify);
 	openctl_elem(lhandle, device, subdevice, "PCM Rate Shift 100000",
 			&lhandle->ctl_rate_shift);
+	openctl_elem(lhandle, device, subdevice, "PCM Feedback Frequency Hz",
+			&lhandle->ctl_fback_freq);
 	set_rate_shift(lhandle, 1);
 	openctl_elem(lhandle, device, subdevice, "PCM Slave Active",
 			&lhandle->ctl_active);
@@ -1289,6 +1299,9 @@ static int closeit(struct loopback_handle *lhandle)
 	if (lhandle->ctl_rate_shift)
 		snd_ctl_elem_value_free(lhandle->ctl_rate_shift);
 	lhandle->ctl_rate_shift = NULL;
+	if (lhandle->ctl_fback_freq)
+		snd_ctl_elem_value_free(lhandle->ctl_fback_freq);
+	lhandle->ctl_fback_freq = NULL;
 	if (lhandle->ctl)
 		err = snd_ctl_close(lhandle->ctl);
 	lhandle->ctl = NULL;
@@ -1334,9 +1347,11 @@ int pcmjob_init(struct loopback *loop)
 	snprintf(id, sizeof(id), "%s/%s", loop->play->id, loop->capt->id);
 	id[sizeof(id)-1] = '\0';
 	loop->id = strdup(id);
-	if (loop->sync == SYNC_TYPE_AUTO && loop->capt->ctl_rate_shift)
+	if (loop->sync == SYNC_TYPE_AUTO && (loop->capt->ctl_rate_shift ||
+			loop->capt->ctl_fback_freq))
 		loop->sync = SYNC_TYPE_CAPTRATESHIFT;
-	if (loop->sync == SYNC_TYPE_AUTO && loop->play->ctl_rate_shift)
+	if (loop->sync == SYNC_TYPE_AUTO && (loop->play->ctl_rate_shift ||
+			loop->play->ctl_fback_freq))
 		loop->sync = SYNC_TYPE_PLAYRATESHIFT;
 #ifdef USE_SAMPLERATE
 	if (loop->sync == SYNC_TYPE_AUTO && loop->src_enable)
-- 
1.9.1

