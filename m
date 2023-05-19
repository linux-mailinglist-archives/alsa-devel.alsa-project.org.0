Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA06709346
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:33:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB5BA7F4;
	Fri, 19 May 2023 11:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB5BA7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684488819;
	bh=MIu2LVGfRc4CuyQhqDI2q2lD/1XkIJ7qQld12QKA19o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BEJKerHYZkm4Sl5r/FE1bfxsDDbyS9skJ55BShd4QYFRXqbr2QXsarADRo5BiIkuS
	 zYYIfO1LLPoHu6YDurXylt/+J3XsDpFAb22IzeL7VFdhYFlu6wVI0xgh896MDYtzzA
	 P4WtjM985ojyUI08SiMvDJ/be8eoZjmG/s45yLBM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A7D7F805C6; Fri, 19 May 2023 11:31:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92B74F805C3;
	Fri, 19 May 2023 11:31:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 510CDF8057E; Fri, 19 May 2023 11:31:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70F2FF8024E
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70F2FF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=lqHWSIdl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=chulj10a
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3A50E222CF;
	Fri, 19 May 2023 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488692;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JrvZBp3duWzOF/YKdFpWaRkynnXU2qOujSPsuLV9yfY=;
	b=lqHWSIdl/8hQndJ+5qg94TmjWd5gN6NM+ArmNHBw0UHF1SSmqlp9BeUY6h2TJQqEUQzoF0
	NwL/nfm7fq/ZBYX2HTZlgw6HfxJ2XCD99PBF0f2U+aNlyaAuLhSXPHNlHZ5+kp+Zo8diB3
	WQhLj44eMwdbmUmE8dZ2xQNSy2ByR0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JrvZBp3duWzOF/YKdFpWaRkynnXU2qOujSPsuLV9yfY=;
	b=chulj10akq9lW2XPP+dGPLfacHRdue/4BSCyNM7gXSoO43HyVw/MQCJWusChrDnmxu5Fz8
	jMH+nM7mUmw/XXCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1CBC813A12;
	Fri, 19 May 2023 09:31:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CGAtBvRBZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 04/36] ALSA: rawmidi: Skip UMP devices at
 SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE
Date: Fri, 19 May 2023 11:30:42 +0200
Message-Id: <20230519093114.28813-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ILGSWCT6X7UGBYW6TG4C4RJDTBDCT3BG
X-Message-ID-Hash: ILGSWCT6X7UGBYW6TG4C4RJDTBDCT3BG
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
Archived-At: <>
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asound.h |  1 +
 sound/core/rawmidi.c        | 57 +++++++++++++++++++++++--------------
 2 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index b001df4b335e..74bd2c297741 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -1177,6 +1177,7 @@ struct snd_ctl_tlv {
 #define SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE _IOWR('U', 0x40, int)
 #define SNDRV_CTL_IOCTL_RAWMIDI_INFO	_IOWR('U', 0x41, struct snd_rawmidi_info)
 #define SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE _IOW('U', 0x42, int)
+#define SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE	_IOWR('U', 0x43, int)
 #define SNDRV_CTL_IOCTL_POWER		_IOWR('U', 0xd0, int)
 #define SNDRV_CTL_IOCTL_POWER_STATE	_IOR('U', 0xd1, int)
 
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index ef478fcacb42..88595f54be79 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1011,6 +1011,37 @@ static long snd_rawmidi_ioctl(struct file *file, unsigned int cmd, unsigned long
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
@@ -1020,27 +1051,11 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
 
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

