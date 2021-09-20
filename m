Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D219F411D99
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 19:20:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5264E16D2;
	Mon, 20 Sep 2021 19:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5264E16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632158441;
	bh=U5nWWXgpvdeVHJSwPY/H4Xj9ud7K605pCDhCejVMIA4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fxchmuFfi3YrE6N5FYfAsOIOBKKzbQJ4bgxp9YwxYxu60DX2PoNpM4p4xMYxDQCvO
	 4u2pJe4lc/smxJZCXA+Xbdg/JDZ0ssMEUhclwX9lm3e05WxOiihKpETbRPvO8xV+Zy
	 hdNjFjPljeOop2lwMYbqPlQ9wL0Ed6zkBcn9fGwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEF9AF80279;
	Mon, 20 Sep 2021 19:19:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 234C0F8025D; Mon, 20 Sep 2021 19:19:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 842EBF80124
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 19:19:10 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A0D26A003F;
 Mon, 20 Sep 2021 19:19:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A0D26A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1632158349; bh=XmUVQPaOBC1QAFDDKkeAwE2fGcNGPc+yCSGpokeuGsM=;
 h=From:To:Cc:Subject:Date:From;
 b=3VMBBkBUGZqH2aMKVTdfpyVYR25V7/furf0ZyOqvbIb3Y3Or4E0f6ck6FdoZI9SF2
 DD9VAu0S2pMhi8aJB6Q96OtzBXb4VY6r1K4mSWUaPiqJ8l16lcL0Om+yJyL+eKV1C0
 vG6+m2O3HLofUcsdznLOp8+Zj3vfjCX98lv7S7Ic=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 20 Sep 2021 19:19:04 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH v2] ALSA: rawmidi: introduce SNDRV_RAWMIDI_IOCTL_USER_PVERSION
Date: Mon, 20 Sep 2021 19:18:50 +0200
Message-Id: <20210920171850.154186-1-perex@perex.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, David Henningsson <coding@diwic.se>,
 stable@vger.kernel.org
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

The new framing mode causes the user space regression, because
the alsa-lib code does not initialize the reserved space in
the params structure when the device is opened.

This change adds SNDRV_RAWMIDI_IOCTL_USER_PVERSION like we
do for the PCM interface for the protocol acknowledgment.

Cc: David Henningsson <coding@diwic.se>
Cc: <stable@vger.kernel.org>
Fixes: 08fdced60ca0 ("ALSA: rawmidi: Add framing mode")
BugLink: https://github.com/alsa-project/alsa-lib/issues/178
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/sound/rawmidi.h     | 1 +
 include/uapi/sound/asound.h | 1 +
 sound/core/rawmidi.c        | 9 +++++++++
 3 files changed, 11 insertions(+)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 989e1517332d..7a08ed2acd60 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -98,6 +98,7 @@ struct snd_rawmidi_file {
 	struct snd_rawmidi *rmidi;
 	struct snd_rawmidi_substream *input;
 	struct snd_rawmidi_substream *output;
+	unsigned int user_pversion;	/* supported protocol version */
 };
 
 struct snd_rawmidi_str {
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 1d84ec9db93b..5859ca0a1439 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -784,6 +784,7 @@ struct snd_rawmidi_status {
 
 #define SNDRV_RAWMIDI_IOCTL_PVERSION	_IOR('W', 0x00, int)
 #define SNDRV_RAWMIDI_IOCTL_INFO	_IOR('W', 0x01, struct snd_rawmidi_info)
+#define SNDRV_RAWMIDI_IOCTL_USER_PVERSION _IOW('W', 0x02, int)
 #define SNDRV_RAWMIDI_IOCTL_PARAMS	_IOWR('W', 0x10, struct snd_rawmidi_params)
 #define SNDRV_RAWMIDI_IOCTL_STATUS	_IOWR('W', 0x20, struct snd_rawmidi_status)
 #define SNDRV_RAWMIDI_IOCTL_DROP	_IOW('W', 0x30, int)
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 6c0a4a67ad2e..6f30231bdb88 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -873,12 +873,21 @@ static long snd_rawmidi_ioctl(struct file *file, unsigned int cmd, unsigned long
 			return -EINVAL;
 		}
 	}
+	case SNDRV_RAWMIDI_IOCTL_USER_PVERSION:
+		if (get_user(rfile->user_pversion, (unsigned int __user *)arg))
+			return -EFAULT;
+		return 0;
+
 	case SNDRV_RAWMIDI_IOCTL_PARAMS:
 	{
 		struct snd_rawmidi_params params;
 
 		if (copy_from_user(&params, argp, sizeof(struct snd_rawmidi_params)))
 			return -EFAULT;
+		if (rfile->user_pversion < SNDRV_PROTOCOL_VERSION(2, 0, 2)) {
+			params.mode = 0;
+			memset(params.reserved, 0, sizeof(params.reserved));
+		}
 		switch (params.stream) {
 		case SNDRV_RAWMIDI_STREAM_OUTPUT:
 			if (rfile->output == NULL)
-- 
2.31.1
