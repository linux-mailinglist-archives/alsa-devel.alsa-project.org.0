Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C99784AC09E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 15:07:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64CB317EF;
	Mon,  7 Feb 2022 15:06:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64CB317EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644242853;
	bh=rCcsH6TuR9fkG5Ythz+wA2JNsI+ErlMTUMNeDYwyspk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CV+yX5raOuFPjM82dcAokHh5+fIZW+D7EvXIlG815yOMwD+aerxD4JQD84syxB8EP
	 koPHHTlGyTUtMhGhqF2LrhPJghwGkz0uBtx+sI/AltE24PXr9flmO0FXatfemDyUgd
	 9Y8RpDXoraaS7C7akRzXArBe7n1ThHnycP9gUMEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C893BF80246;
	Mon,  7 Feb 2022 15:06:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E44C2F800E1; Mon,  7 Feb 2022 15:06:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E440CF800E1
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 15:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E440CF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dXHUkHHH"
Received: by mail-wr1-x42c.google.com with SMTP id r29so7049727wrr.13
 for <alsa-devel@alsa-project.org>; Mon, 07 Feb 2022 06:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tBKWnS+g7You4oahdBZV1moenSdw6O464+uIoP4Ehfw=;
 b=dXHUkHHHLQVcF081BhnShtt/ILiXpVb0T3NzyCo3i0nakhqxWs2EPz9K/tIrOG4t/q
 ZmJBv6zMZ9oe2EmWqrcUsw0RWxqGsxtBSS4T4i2UE1VGygzOS0q5+qq1slHJLFk61oua
 32mR5gFhRVh0FEPZ8PCqrbEPsdeUVImaqnqPUkg2cYvsF55RNOzS7L/8Bl9l/pljVxiV
 Tc8pb7VPlg5FpOF2bd6lqh7OJ7EpRKlboqsn/+n+WB8gl5tuYmx6b8XTa6k97x7IPPxt
 q7Mvq5E2Hi7r8q6eIWDyZ0jZ+gnBR4HFiHWwyOlmMbRQeGVbu6rIxc85DNgUrhocF6eh
 OF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tBKWnS+g7You4oahdBZV1moenSdw6O464+uIoP4Ehfw=;
 b=scOHXtpi9t5s9CnYH3R4H/c48BOZ9qNlg0ynfIZ6pGrd0s06R73Y3TttIZJfldGUst
 42ZR0BVdaFpH1WXyw8h/5P3FoHgcozTagXYkYFXIzQfHkeEwgIEgRhIzOVZi3LYZS8PV
 Do9IvETOBlFJyPui2lirOA5DX64SejynJZLG1wnNEDS8pK7pr3tP2U4NeOHECGehQaxr
 BbAoptvLscy1qPlp5AdQvI3oYgaGGpP4lruoxEgaJhhMGjv/e4WwR8FXZY7Jx0LBMWwk
 NaH9pa3YumePXgs+x/76KrEQnKSHSl9J3116eTZZNbWuPY2BWag93jI9/7OAkdsFvVd0
 HKbw==
X-Gm-Message-State: AOAM532ar1xtOzdMx4x0OtUKaFJ4EQTwdBderddVPLof8wL5gS2Z0vRO
 vh+Hrrg7DOGDmDfKBgvVFXY=
X-Google-Smtp-Source: ABdhPJyKet9Uuh60UU/p6hDZJIyCF7NM/ixYXuVRcY9k1xOZeokpEzA36xzaIhpdpjAHmboNRpfbrw==
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr10140333wri.309.1644242778904; 
 Mon, 07 Feb 2022 06:06:18 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id n10sm4140786wrt.93.2022.02.07.06.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 06:06:18 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: remove redundant assignment to variable c
Date: Mon,  7 Feb 2022 14:06:17 +0000
Message-Id: <20220207140617.341172-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

The variable c is being initialized in an outer for-loop and also
re-initialized inside an inner for-loop. The first initialization
is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/usb/mixer_s1810c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index 0255089c9efb..fac4bbc6b275 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -221,7 +221,7 @@ static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
 	e = 0xbc;
 	for (n = 0; n < 2; n++) {
 		off = n * 18;
-		for (b = off, c = 0; b < 18 + off; b++) {
+		for (b = off; b < 18 + off; b++) {
 			/* This channel to all outputs ? */
 			for (c = 0; c <= 8; c++) {
 				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
-- 
2.34.1

