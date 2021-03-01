Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F23513280E3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 15:32:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E698167B;
	Mon,  1 Mar 2021 15:31:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E698167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614609120;
	bh=8Ysbo4BYNHLUgfYeMjkDDOcL0Tn1i8Dc5pG71pXfs/g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PsfDUle140bqQY4cSJoOvmaOXRaOpqPCijecRF/aRazI6lYdPPe4+mafgL+hXJdLm
	 oH9EkWazbVremzXi+z46w7En2E6U5wh6uwdgPWpKK1WA8VNZjAbU4yeEENnED2Fqer
	 eyeLntvD4r8WSCLMKkPSBIw7GssoXZjg3A1NI92o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2179CF800E0;
	Mon,  1 Mar 2021 15:30:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93DD5F80257; Mon,  1 Mar 2021 15:30:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E318F800E0
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 15:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E318F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U1tww+/i"
Received: by mail-wr1-x42b.google.com with SMTP id 7so16386376wrz.0
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 06:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IONZ2McWoEbOgPE/QaoBgYmPvQbpx4exLsUFq1e6wn0=;
 b=U1tww+/io/yTaLoy9kOlIK38E1WnTbSX/zhgaHV11dTh0z5W4nVG0sPqVFezv8WN4/
 zhI1lXYk6OB/Wbhoi/WmsPrKskjmiWtSnz0LxsFub0Go3aKDYKm4GS3H1A2pUAtJasVF
 cel7V3LXRvU9h4bRQ5Iw8MLFRxr/ruW4s9Esm5QgxRqAdQ923N84EM0Wo9Sg19n80DZ2
 ONy+e8BkaEMCGvi9LFGAJ58U5unNWOddr9o2tRle2J+6EjXcBTZpGEk5RTylj/Qdnlx9
 ZbNRYtwMaxIhvkk6IWaAtTZaQ3Wo0rBzYz/G7BBUPW6HLNRee8NzgpRl+soBAV6wtgWq
 NywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IONZ2McWoEbOgPE/QaoBgYmPvQbpx4exLsUFq1e6wn0=;
 b=LI3hfNHLoBbCZpS61eht5mgr15vPWetxTbW6Sgr+AGpm2V2sBVv4ovwj+Z7wgq2Zi8
 fdvK2MaUjFaDdyUEZtuON7vpM4iP+DwMQLB3NiFqEr/QmfBXtU87NS2BYUbUcQ1je2DA
 SMGMhs78xruKD4BRzvDN/92x9lgDRJJ/1ClNQyZenhfniwvCbuc+3ToaaReO34IjGaHC
 S1Xg8CbmZzRxixE9VWDGC196Ct9c4xMI2K5STHjbewZxv7FDc0bZZrPBDcXz3AUmHC58
 7BP0Hb5GKaTNgy1rPUOehinQMqhU/M6BYQ6Mm38S/GIsoOm2BuHaamLNXaNdOazWc3Bg
 mLnw==
X-Gm-Message-State: AOAM532YSYJi9J6pXiC5xHC0MJze+z30Qd00imLl6FBDkItuCeZQN58l
 VutuiCzvRmGH1Kw24DVdVxc=
X-Google-Smtp-Source: ABdhPJyQCfxXbQXDdT0H1Ro8lFO8BqUWL/Vtt84/TYUyjPye7Oqkw4LQ7MnCziErwBxE+U+PpP7W9Q==
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr17334535wrg.171.1614609020670; 
 Mon, 01 Mar 2021 06:30:20 -0800 (PST)
Received: from localhost.localdomain (176-171-138-112.abo.bbox.fr.
 [176.171.138.112])
 by smtp.googlemail.com with ESMTPSA id c11sm24991204wrs.28.2021.03.01.06.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 06:30:20 -0800 (PST)
From: Nicolas MURE <nicolas.mure2019@gmail.com>
To: tiwai@suse.de
Subject: [PATCH] ALSA: usb-audio: Fix Pioneer DJM devices URB_CONTROL request
 direction to set samplerate
Date: Mon,  1 Mar 2021 15:29:27 +0100
Message-Id: <20210301142927.14552-1-nicolas.mure2019@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nicolas MURE <nicolas.mure2019@gmail.com>, alsa-devel@alsa-project.org,
 livvy@base.nu
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

As requested in this comment :
https://mailman.alsa-project.org/pipermail/alsa-devel/2021-March/181275.html

This commit only contains the fix about the `URB_CONTROL` request
direction to set the samplerate of Pioneer DJM devices (`URB_CONTROL out`).

Signed-off-by: Nicolas MURE <nicolas.mure2019@gmail.com>
---
 sound/usb/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 9ba4682ebc48..737b2729c0d3 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1482,7 +1482,7 @@ static int pioneer_djm_set_format_quirk(struct snd_usb_substream *subs,
 	usb_set_interface(subs->dev, 0, 1);
 	// we should derive windex from fmt-sync_ep but it's not set
 	snd_usb_ctl_msg(subs->stream->chip->dev,
-		usb_rcvctrlpipe(subs->stream->chip->dev, 0),
+		usb_sndctrlpipe(subs->stream->chip->dev, 0),
 		0x01, 0x22, 0x0100, windex, &sr, 0x0003);
 	return 0;
 }
-- 
2.29.2

