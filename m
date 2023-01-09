Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F274662826
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 15:12:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74EACB0C0;
	Mon,  9 Jan 2023 15:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74EACB0C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673273569;
	bh=uHOfRESEj1MvNCfQSp/Q2fqxgAH5un2XKHWwe2HQ7kM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=uhU/UDxrGvjd+8DaTvMooFcM9WQDyu17a9gTmJb+EdL/e1IzcpgCuMkOmQIB0ppjX
	 1is8lPwBgWFmNpe/ktE9obUSIiF8PAesezkHi9RnAew/eRwL4m4zM3MSnStGjTQiOB
	 DX/g6RnvKYoEw8sBbh6lZXrCbIm1wmmcJsMG+yBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4BE3F800C7;
	Mon,  9 Jan 2023 15:11:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34D6FF8030F; Mon,  9 Jan 2023 15:11:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6A34F800C7
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 15:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6A34F800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=V7edFy/y
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 377A2A0040;
 Mon,  9 Jan 2023 15:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 377A2A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1673273506; bh=bdJQw3RjHRvPBAzXLjM89tBZKg2o+zofSE/cDoto0WU=;
 h=From:To:Cc:Subject:Date:From;
 b=V7edFy/yPIjYulHgOUsPgjvAKpum3D5VbQQeB0NZU3BIMdKzY2iLUbyGHEe8kMwrF
 lrbTQTQ4bkf5SC7ZGFCCFoYD5KpIHGCCpCcqgnjVFB7PXrtOCD6fuJ48lzAnVmyiHj
 0264FaTPNsmbwUKH/W18BHKmW+6lrhkqTZXMqfb0=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  9 Jan 2023 15:11:41 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: usb-audio: Always initialize fixed_rate in
 snd_usb_find_implicit_fb_sync_format()
Date: Mon,  9 Jan 2023 15:11:33 +0100
Message-Id: <20230109141133.335543-1-perex@perex.cz>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.de>, Dan Carpenter <error27@gmail.com>,
 stable@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Handle the fallback code path, too.

Fixes: fd28941cff1c ("ALSA: usb-audio: Add new quirk FIXED_RATE for JBL Quantum810 Wireless")
BugLink: https://lore.kernel.org/alsa-devel/Y7frf3N%2FxzvESEsN@kili/
Reported-by: Dan Carpenter <error27@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/usb/implicit.c | 3 ++-
 sound/usb/pcm.c      | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 41ac7185b42b..4727043fd745 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -471,7 +471,7 @@ snd_usb_find_implicit_fb_sync_format(struct snd_usb_audio *chip,
 	subs = find_matching_substream(chip, stream, target->sync_ep,
 				       target->fmt_type);
 	if (!subs)
-		return sync_fmt;
+		goto end;
 
 	high_score = 0;
 	list_for_each_entry(fp, &subs->fmt_list, list) {
@@ -485,6 +485,7 @@ snd_usb_find_implicit_fb_sync_format(struct snd_usb_audio *chip,
 		}
 	}
 
+ end:
 	if (fixed_rate)
 		*fixed_rate = snd_usb_pcm_has_fixed_rate(subs);
 	return sync_fmt;
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 99a66d0ef5b2..d2c652aa1385 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -163,6 +163,8 @@ bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *subs)
 	struct snd_usb_audio *chip = subs->stream->chip;
 	int rate = -1;
 
+	if (!subs)
+		return false;
 	if (!(chip->quirk_flags & QUIRK_FLAG_FIXED_RATE))
 		return false;
 	list_for_each_entry(fp, &subs->fmt_list, list) {
-- 
2.39.0
