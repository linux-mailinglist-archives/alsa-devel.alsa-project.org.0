Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434E70D62D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 09:56:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98552839;
	Tue, 23 May 2023 09:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98552839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828568;
	bh=DbpU+rbdJkAT5qKgMi4+HaKaHkwa8ODYiocpf69dxtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WFd3i4eb9xgvu4AY7oDo5+Az8ks9ISjwWcZGc0knUMzZZ20FS1mA7Il2SoYsyswnQ
	 +XfLhcTBAe+6QPIHzT8/XGnRrKkENpEmRqesNxhVSIWj5bTsckY8HHN+k0dYhgJLcc
	 ou8WvNOmQjmH2SiZI6H7GpzwS0nlSyoE546+QUUc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83073F80587; Tue, 23 May 2023 09:54:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD372F805B4;
	Tue, 23 May 2023 09:54:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54944F805C1; Tue, 23 May 2023 09:54:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E49EF8053D
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E49EF8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=aPH7OmYK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=c6k2oPCv
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E323A218F6;
	Tue, 23 May 2023 07:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpcAAE3E4+YS/NXc11uNo67NAO9/YDf8hhSiZWIao78=;
	b=aPH7OmYKZu8BQQkdToCuu48NDoKzcKQjlgkw3HNaUK7AIxeKSliXjH9ehE1zUkm/o5pRek
	PlJQTagEc4URt3nlPdwV59STvRB4xeQ/tzIMQohGU1ZpM6SdbEHOo737PZAGFAm2Aq7Hfq
	wJB1s6cuOJ8m9CvFE0lJXTBGi3oI8Zk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828443;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpcAAE3E4+YS/NXc11uNo67NAO9/YDf8hhSiZWIao78=;
	b=c6k2oPCvgn3Eye7b7y7Caz/kTQVqr43clil4WgHn17wzsGG5Q0mqV/Ae3fFVHYi6MpWdxr
	occ8/bQsThCrkQCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8285113A24;
	Tue, 23 May 2023 07:54:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mLFHHhtxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/37] ALSA: ump: Add ioctls to inquiry UMP EP and Block
 info via control API
Date: Tue, 23 May 2023 09:53:26 +0200
Message-Id: <20230523075358.9672-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XTHDPZ63UNBQAIEYSNCSTD2CAWCS5IVK
X-Message-ID-Hash: XTHDPZ63UNBQAIEYSNCSTD2CAWCS5IVK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XTHDPZ63UNBQAIEYSNCSTD2CAWCS5IVK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It'd be convenient to have ioctls to inquiry the UMP Endpoint and UMP
Block information directly via the control API without opening the
rawmidi interface, just like SNDRV_CTL_IOCTL_RAWMIDI_INFO.

This patch extends the rawmidi ioctl handler to support those; new
ioctls, SNDRV_CTL_IOCTL_UMP_ENDPOINT_INFO and
SNDRV_CTL_IOCTL_UMP_BLOCK_INFO, return the snd_ump_endpoint and
snd_ump_block data that is specified by the device field,
respectively.

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asound.h |  2 ++
 sound/core/rawmidi.c        | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 1e4a21036109..5c5f41dd4001 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -1178,6 +1178,8 @@ struct snd_ctl_tlv {
 #define SNDRV_CTL_IOCTL_RAWMIDI_INFO	_IOWR('U', 0x41, struct snd_rawmidi_info)
 #define SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE _IOW('U', 0x42, int)
 #define SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE	_IOWR('U', 0x43, int)
+#define SNDRV_CTL_IOCTL_UMP_ENDPOINT_INFO _IOWR('U', 0x44, struct snd_ump_endpoint_info)
+#define SNDRV_CTL_IOCTL_UMP_BLOCK_INFO	_IOWR('U', 0x45, struct snd_ump_block_info)
 #define SNDRV_CTL_IOCTL_POWER		_IOWR('U', 0xd0, int)
 #define SNDRV_CTL_IOCTL_POWER_STATE	_IOR('U', 0xd1, int)
 
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 9936ed282b85..ffb5b58105f4 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1043,6 +1043,28 @@ static int snd_rawmidi_next_device(struct snd_card *card, int __user *argp,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_UMP)
+/* inquiry of UMP endpoint and block info via control API */
+static int snd_rawmidi_call_ump_ioctl(struct snd_card *card, int cmd,
+				      void __user *argp)
+{
+	struct snd_ump_endpoint_info __user *info = argp;
+	struct snd_rawmidi *rmidi;
+	int device, ret;
+
+	if (get_user(device, &info->device))
+		return -EFAULT;
+	mutex_lock(&register_mutex);
+	rmidi = snd_rawmidi_search(card, device);
+	if (rmidi && rmidi->ops && rmidi->ops->ioctl)
+		ret = rmidi->ops->ioctl(rmidi, cmd, argp);
+	else
+		ret = -ENXIO;
+	mutex_unlock(&register_mutex);
+	return ret;
+}
+#endif
+
 static int snd_rawmidi_control_ioctl(struct snd_card *card,
 				     struct snd_ctl_file *control,
 				     unsigned int cmd,
@@ -1056,6 +1078,10 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
 #if IS_ENABLED(CONFIG_SND_UMP)
 	case SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE:
 		return snd_rawmidi_next_device(card, argp, true);
+	case SNDRV_CTL_IOCTL_UMP_ENDPOINT_INFO:
+		return snd_rawmidi_call_ump_ioctl(card, SNDRV_UMP_IOCTL_ENDPOINT_INFO, argp);
+	case SNDRV_CTL_IOCTL_UMP_BLOCK_INFO:
+		return snd_rawmidi_call_ump_ioctl(card, SNDRV_UMP_IOCTL_BLOCK_INFO, argp);
 #endif
 	case SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE:
 	{
-- 
2.35.3

