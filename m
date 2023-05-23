Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B25D70D62C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 09:56:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75644828;
	Tue, 23 May 2023 09:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75644828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828567;
	bh=onLq1qk2kPtDpXRaVu1W02449ygtOesh5K96yHluOhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nJpIKSreyPhfpPYr40eami9Fz9I0oLGeVvseK59QLa+kz+E8DBnRH818K25+LmuEt
	 QSI+z1TFGILxoxKybNd2R+glH/aRoJSQM9qXkwVMciz0Y3zyKgemY99HcEOiF/ERTf
	 8di0yFUheai5iUuqhyf5W62097x+izD2QrAgLZZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72D1AF805BA; Tue, 23 May 2023 09:54:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A86F805B4;
	Tue, 23 May 2023 09:54:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5784F8058C; Tue, 23 May 2023 09:54:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35BF9F80425
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35BF9F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=s6ZDFeGW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=abwDvXzy
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 99344218F1;
	Tue, 23 May 2023 07:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=es7gmVhOF2AYk9dNSNKDgpSwT7KFsv33WXRr9YFKqFs=;
	b=s6ZDFeGWrLVWOqLrnNGqOEJluot39f0E+9I5uajQZOnL7LMRF8gozQSdzJAwCIPAM+MNrR
	bnJ2WVTglj9W00WFQKvev66AhuxhBceZaeSelhgCvnvTTS2HneNo6mxwb9PU2ALc3z/TvM
	7ParXxNC/ij5fgHZsm9WzF+5zTa+xSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828443;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=es7gmVhOF2AYk9dNSNKDgpSwT7KFsv33WXRr9YFKqFs=;
	b=abwDvXzyjmj71uPNJwhHvjSQGyyv2zYuxwcrfkGsnA5yZRUdf56OHi+UvsmrnCM8zHtvy/
	xeCv4IUmte19TDDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2082113588;
	Tue, 23 May 2023 07:54:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uKKuBRtxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/37] ALSA: rawmidi: Skip UMP devices at
 SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE
Date: Tue, 23 May 2023 09:53:25 +0200
Message-Id: <20230523075358.9672-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PT4I6Q3H5ZJ7C4YNAHNONHIRXRU2BXAH
X-Message-ID-Hash: PT4I6Q3H5ZJ7C4YNAHNONHIRXRU2BXAH
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PT4I6Q3H5ZJ7C4YNAHNONHIRXRU2BXAH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Applications may look for rawmidi devices with the ioctl
SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE.  Returning a UMP device from this
ioctl may confuse the existing applications that support only the
legacy rawmidi.

This patch changes the code to skip the UMP devices from the lookup
for avoiding the confusion, and introduces a new ioctl to look for the
UMP devices instead.

Along with this change, bump the CTL protocol version to 2.0.9.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asound.h |  3 +-
 sound/core/rawmidi.c        | 57 +++++++++++++++++++++++--------------
 2 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index b001df4b335e..1e4a21036109 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -1016,7 +1016,7 @@ struct snd_timer_tread {
  *                                                                          *
  ****************************************************************************/
 
-#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 8)
+#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 9)
 
 struct snd_ctl_card_info {
 	int card;			/* card number */
@@ -1177,6 +1177,7 @@ struct snd_ctl_tlv {
 #define SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE _IOWR('U', 0x40, int)
 #define SNDRV_CTL_IOCTL_RAWMIDI_INFO	_IOWR('U', 0x41, struct snd_rawmidi_info)
 #define SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE _IOW('U', 0x42, int)
+#define SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE	_IOWR('U', 0x43, int)
 #define SNDRV_CTL_IOCTL_POWER		_IOWR('U', 0xd0, int)
 #define SNDRV_CTL_IOCTL_POWER_STATE	_IOR('U', 0xd1, int)
 
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 6360e2239a63..9936ed282b85 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1012,6 +1012,37 @@ static long snd_rawmidi_ioctl(struct file *file, unsigned int cmd, unsigned long
 	return -ENOTTY;
 }
 
+/* ioctl to find the next device; either legacy or UMP depending on @find_ump */
+static int snd_rawmidi_next_device(struct snd_card *card, int __user *argp,
+				   bool find_ump)
+
+{
+	struct snd_rawmidi *rmidi;
+	int device;
+	bool is_ump;
+
+	if (get_user(device, argp))
+		return -EFAULT;
+	if (device >= SNDRV_RAWMIDI_DEVICES) /* next device is -1 */
+		device = SNDRV_RAWMIDI_DEVICES - 1;
+	mutex_lock(&register_mutex);
+	device = device < 0 ? 0 : device + 1;
+	for (; device < SNDRV_RAWMIDI_DEVICES; device++) {
+		rmidi = snd_rawmidi_search(card, device);
+		if (!rmidi)
+			continue;
+		is_ump = rawmidi_is_ump(rmidi);
+		if (find_ump == is_ump)
+			break;
+	}
+	if (device == SNDRV_RAWMIDI_DEVICES)
+		device = -1;
+	mutex_unlock(&register_mutex);
+	if (put_user(device, argp))
+		return -EFAULT;
+	return 0;
+}
+
 static int snd_rawmidi_control_ioctl(struct snd_card *card,
 				     struct snd_ctl_file *control,
 				     unsigned int cmd,
@@ -1021,27 +1052,11 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
 
 	switch (cmd) {
 	case SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE:
-	{
-		int device;
-
-		if (get_user(device, (int __user *)argp))
-			return -EFAULT;
-		if (device >= SNDRV_RAWMIDI_DEVICES) /* next device is -1 */
-			device = SNDRV_RAWMIDI_DEVICES - 1;
-		mutex_lock(&register_mutex);
-		device = device < 0 ? 0 : device + 1;
-		while (device < SNDRV_RAWMIDI_DEVICES) {
-			if (snd_rawmidi_search(card, device))
-				break;
-			device++;
-		}
-		if (device == SNDRV_RAWMIDI_DEVICES)
-			device = -1;
-		mutex_unlock(&register_mutex);
-		if (put_user(device, (int __user *)argp))
-			return -EFAULT;
-		return 0;
-	}
+		return snd_rawmidi_next_device(card, argp, false);
+#if IS_ENABLED(CONFIG_SND_UMP)
+	case SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE:
+		return snd_rawmidi_next_device(card, argp, true);
+#endif
 	case SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE:
 	{
 		int val;
-- 
2.35.3

