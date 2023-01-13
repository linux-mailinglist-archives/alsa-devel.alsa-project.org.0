Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA356691E6
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 09:54:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1FBBA52C;
	Fri, 13 Jan 2023 09:53:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1FBBA52C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673600078;
	bh=pQv6XbL/T2VcCxt4uKNFLVlyX2iWhG7e+KCGtxPtPBk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CNIk0pCMWOvssyIbwE5UyevVma7tVmYEa9MXwetRSPp4n04Co7j0XEW6lE81WE1bD
	 mvvncl3q128rHGdBqovDfcVsSrvM99nzKBhV6bxnFhS7Hvj2R7hMnPss8TMUF5ZNYY
	 /y+6P+hW2q6UUZCp8EccNiq8biHB0eZ3wS/H+Rbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C22CF8016D;
	Fri, 13 Jan 2023 09:53:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6054F8030F; Fri, 13 Jan 2023 09:53:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 187C7F8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 09:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 187C7F8016D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=3EGV2f9y
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5F0C0A0040;
 Fri, 13 Jan 2023 09:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5F0C0A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1673600014; bh=jGsuJl4vm4qCqTHSra+gs1Jv8yGxIGLogGS7Qry5yvU=;
 h=From:To:Cc:Subject:Date:From;
 b=3EGV2f9yYQnoXJJUIN0plEBRRaFf1RBClAu8afbk03mXj4+WWKO4xsr0lb3pIlItt
 hdMRw8AWWhUBz6ZrrtI1q1fDPQmkJNk8YVkERA/ZsawBQVPxg0a9nzPTbo5Zhll/+Q
 1Wr2s/lNDb/QbQj+QO4AtgCWBwfVOUurMB4Rhpno=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 13 Jan 2023 09:53:30 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: usb-audio: Fix possible NULL pointer dereference in
 snd_usb_pcm_has_fixed_rate()
Date: Fri, 13 Jan 2023 09:53:11 +0100
Message-Id: <20230113085311.623325-1-perex@perex.cz>
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
Cc: Takashi Iwai <tiwai@suse.de>, coverity-bot <keescook@chromium.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The subs function argument may be NULL, so do not use it before the NULL check.

Fixes: 291e9da91403 ("ALSA: usb-audio: Always initialize fixed_rate in snd_usb_find_implicit_fb_sync_format()")
Reported-by: coverity-bot <keescook@chromium.org>
Link: https://lore.kernel.org/alsa-devel/202301121424.4A79A485@keescook/
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/usb/pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 1f72960d0d53..d959da7a1afb 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -160,11 +160,12 @@ find_substream_format(struct snd_usb_substream *subs,
 bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *subs)
 {
 	const struct audioformat *fp;
-	struct snd_usb_audio *chip = subs->stream->chip;
+	struct snd_usb_audio *chip;
 	int rate = -1;
 
 	if (!subs)
 		return false;
+	chip = subs->stream->chip;
 	if (!(chip->quirk_flags & QUIRK_FLAG_FIXED_RATE))
 		return false;
 	list_for_each_entry(fp, &subs->fmt_list, list) {
-- 
2.39.0
