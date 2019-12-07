Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4584115FB9
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Dec 2019 23:51:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 243321660;
	Sat,  7 Dec 2019 23:51:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 243321660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575759113;
	bh=xjbhafPc0BkWLpWgdkpicBNvC+NDK46kqTLbMYHFa1c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f/diiHW7+qeiqaErD3HQesufelO38nYjAz1/Cq3b6bonIz2P41Sq6c2jFAS/WfNIL
	 lz3Muu+yA5KwauBDL8riC0WnRVc4xVwVwBQVeUFpgg1vqYJVEqWsGkl2Y5SrTXxNSr
	 jebT37ouMG1/hp9NeNDD2BNq3+yA43abWd5iilDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81FA8F801F8;
	Sat,  7 Dec 2019 23:50:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA5EAF801F7; Sat,  7 Dec 2019 23:50:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69949F80108
 for <alsa-devel@alsa-project.org>; Sat,  7 Dec 2019 23:50:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69949F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="DwhmzTgc"
Received: by mail-pg1-x544.google.com with SMTP id x7so5151434pgl.11
 for <alsa-devel@alsa-project.org>; Sat, 07 Dec 2019 14:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=lL+1PRskYMs2R8IhafHrkXHNGmWtEsk3V5MLoBd8+zY=;
 b=DwhmzTgcKmnOBPVF0IjpaSQlVwQ4sIrkmeLbE3VWvbZ97Tkj0feHuKEpNuI0VsvcSD
 KaA6vhX0ftaetj1cNLOJN6vBeWR+t3PqP6r6HGxlDpdQwnoIAO+VcY/fT4o+v8wpQaER
 WVBnWDGG82IuOKQDh7VsUblhCG44KUfpdiGPfPMKDAzmThmKScGWDvs8MAI4l1ep33WP
 ty6SDX5JzDO3+dkxfieBloSXg3wg5uJ5tW4OcDfpsZE/E41kef6PxCewCvQdmz+Lm+dL
 0zVtmLx191aByueJrGeEjyxQT/YwUF2Fl8lV7QdFXIStWJLKfxM2OSTx8CddO6iyYpap
 XkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lL+1PRskYMs2R8IhafHrkXHNGmWtEsk3V5MLoBd8+zY=;
 b=YZk6SeTscf+4n+e2+1exylT2q4Cal+B1dV4f+geFt6lzmwqGiLlSM8+Z2Ai6xM78Qd
 yT4IjM4qT6V7cnMRbOGeAhrqqCnglzZ+ePk1NZn0p0ZAy520DL/jeqL2BEssyB9gU3wz
 oYFlbZVUqsA3DsEG8IPIw/u8I1qGKhQxdqPGpIbet7SVwbW0Ge68Iit+pdwTV8pL4ieP
 7X5DQDtj1QABpapGJ335Xy6/DIVOpoH3Qi44jndPhheb/BBe1h/LHjQv3UScKKbfR4OG
 vVKR1TfWyEPi7bhps1M7ggHW39GNlnJjVz5OV7IBCTrsassTOUsFXs6Opaqk97G7ZLum
 mKoQ==
X-Gm-Message-State: APjAAAVE74CSLv3KERlPq158iGsGQNKnyp4kTwGf1gBceTQ+99Cd8OTk
 e1YcHIP8zmYOmDUAnYupAyWiYw==
X-Google-Smtp-Source: APXvYqwGQDo739d6dIOpL5JSCvp4GW1cBrkgeXp/wmM8/PMERqSFA/jOs/yhBO6I0yrKn0/7RPqhQw==
X-Received: by 2002:a63:5221:: with SMTP id g33mr11340616pgb.68.1575759000761; 
 Sat, 07 Dec 2019 14:50:00 -0800 (PST)
Received: from rip.lixom.net (99-152-116-91.lightspeed.sntcca.sbcglobal.net.
 [99.152.116.91])
 by smtp.gmail.com with ESMTPSA id s11sm19995747pgo.85.2019.12.07.14.49.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 Dec 2019 14:49:59 -0800 (PST)
From: Olof Johansson <olof@lixom.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Date: Sat,  7 Dec 2019 14:49:53 -0800
Message-Id: <20191207224953.25944-1-olof@lixom.net>
X-Mailer: git-send-email 2.11.0
Cc: Olof Johansson <olof@lixom.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: echoaudio: simplify get_audio_levels
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The loop optimizer seems to go astray here, and produces some warnings
that don't seem valid.

Still, the code can be simplified -- just clear the whole array at the
beginning, and fill in whatever values are valid on the platform.

Warnings before this change (GCC 8.2.0 ARM allmodconfig):

In file included from ../sound/pci/echoaudio/gina24.c:115:
../sound/pci/echoaudio/echoaudio.c: In function 'snd_echo_vumeters_get':
../sound/pci/echoaudio/echoaudio_dsp.c:647:9: warning: iteration 1073741824 invokes undefined behavior [-Waggressive-loop-optimizations]
In file included from ../sound/pci/echoaudio/layla24.c:112:
../sound/pci/echoaudio/echoaudio.c: In function 'snd_echo_vumeters_get':
../sound/pci/echoaudio/echoaudio_dsp.c:658:9: warning: iteration 1073741824 invokes undefined behavior [-Waggressive-loop-optimizations]
../sound/pci/echoaudio/echoaudio_dsp.c:647:9: warning: iteration 1073741824 invokes undefined behavior [-Waggressive-loop-optimizations]

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 sound/pci/echoaudio/echoaudio_dsp.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio_dsp.c b/sound/pci/echoaudio/echoaudio_dsp.c
index 50d4a87a6bb34..f02f5b1568dee 100644
--- a/sound/pci/echoaudio/echoaudio_dsp.c
+++ b/sound/pci/echoaudio/echoaudio_dsp.c
@@ -635,36 +635,30 @@ This function assumes there are no more than 16 in/out busses or pipes
 Meters is an array [3][16][2] of long. */
 static void get_audio_meters(struct echoaudio *chip, long *meters)
 {
-	int i, m, n;
+	unsigned int i, m, n;
 
-	m = 0;
-	n = 0;
-	for (i = 0; i < num_busses_out(chip); i++, m++) {
+	for (i = 0 ; i < 96; i++)
+		meters[i] = 0;
+
+	for (m = 0, n = 0, i = 0; i < num_busses_out(chip); i++, m++) {
 		meters[n++] = chip->comm_page->vu_meter[m];
 		meters[n++] = chip->comm_page->peak_meter[m];
 	}
-	for (; n < 32; n++)
-		meters[n] = 0;
 
 #ifdef ECHOCARD_ECHO3G
 	m = E3G_MAX_OUTPUTS;	/* Skip unused meters */
 #endif
 
-	for (i = 0; i < num_busses_in(chip); i++, m++) {
+	for (n = 32, i = 0; i < num_busses_in(chip); i++, m++) {
 		meters[n++] = chip->comm_page->vu_meter[m];
 		meters[n++] = chip->comm_page->peak_meter[m];
 	}
-	for (; n < 64; n++)
-		meters[n] = 0;
-
 #ifdef ECHOCARD_HAS_VMIXER
-	for (i = 0; i < num_pipes_out(chip); i++, m++) {
+	for (n = 64, i = 0; i < num_pipes_out(chip); i++, m++) {
 		meters[n++] = chip->comm_page->vu_meter[m];
 		meters[n++] = chip->comm_page->peak_meter[m];
 	}
 #endif
-	for (; n < 96; n++)
-		meters[n] = 0;
 }
 
 
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
