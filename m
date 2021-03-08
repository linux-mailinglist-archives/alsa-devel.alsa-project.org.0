Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A834331FAF
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 08:07:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C77A17D4;
	Tue,  9 Mar 2021 08:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C77A17D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615273626;
	bh=x23yB0wlRmaNOxrEU9vy0NvUtVHCTaKUL5u5Qy0aOUE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AoGimFMU41Kj43r09BjimTkrYm5laEPqLd/vLZVKSIsw6JDR/xl5nezZH0dBjX96A
	 JoVJyOrOUUa40J8M5SuSbn9z7Jufb1asDKM5Zbo3ZCmCeSUlVv7E3dg1HzNeIPV5za
	 AIFpUzCTuXmns7UUUt7pA5ALqThazK1ROUnlcqF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51C8BF804E2;
	Tue,  9 Mar 2021 08:02:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E3F2F801D8; Mon,  8 Mar 2021 23:31:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFB07F800ED
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 23:31:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFB07F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M+wVnP/K"
Received: by mail-lf1-x12b.google.com with SMTP id r3so15506225lfc.13
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 14:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mgVtVDJ4J9ZfP2mfzS736WoTsMup5fvgpbnXS5Fe3a8=;
 b=M+wVnP/KB8I6w466Y9xFPc5hUX+YdtfnLVnYCpM9Kp7Cw6dUrl6pRvJhajm5PjYBxT
 SfeJj6wvAM0tR+tYPY6aqBtQ9MxgQZHO5ph34MNOveLyXa+aSY2yvVB8XBLGg95SJdmI
 iVyIZB5ajJ/CNZkE8Pcvcv8bSsk8vtURxkpCGi7DFoKCcB54czUnVA3+sIAKdxQkWjR/
 FBewIzUOuhD98dNY9UMPnWC4aCfcIGj+krz6tT7KLwvwsMAnUd1halJIn32yvhAHPRqd
 UvNETUESRmdktnLcZkEHNZ2SShn+E4gmRb5M/TJ9OEA+FUWmqBG+x+UqoV2q07fcnxVR
 /UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mgVtVDJ4J9ZfP2mfzS736WoTsMup5fvgpbnXS5Fe3a8=;
 b=lEoc4MpdsLwQlSU/XUW08q9AfbsD4XMyMTEsAOyaEqxEJKU2czSa9T2h1xOFAAXAvW
 roWnhLghiljlOC1kiP2MNFiqWt5sWGayFaqrmkRj075PSRnP5EHHmiDPO94JF0SAL1RY
 CgQrr8RDZm4VuMMAtkuDYOQO4fRCijI4yKOgdbUzpEotpBf0JfSXQTwnSKipfqyTgohj
 13X3BLPmb3ChmhOEeRm8vEEFuXreFuMAW1SrdTHxrlIfsWNIyJaXNA6umDTE34M7ya4x
 fpd6l/YDw/F+n0ITywtCiZMpRQdUlQ/7r66EPTX+N8GdMLsaZefJwJirFR7224Pqebgi
 EYOg==
X-Gm-Message-State: AOAM533orr4PjDloG9cIVsBYvcKl6cV6F9vUA9YMJPuJrYKj5qE/I/gl
 b9KkfxR6+/Q6Ka0LUeeT/OQ=
X-Google-Smtp-Source: ABdhPJyI2CGVBw+yoGGPeeq2F338VAm8dTNAgH2Rp77EGChXVrzx4AfEj/iTJrw9Uv3K00xIkYVeMA==
X-Received: by 2002:a19:ef02:: with SMTP id n2mr14976923lfh.141.1615242666898; 
 Mon, 08 Mar 2021 14:31:06 -0800 (PST)
Received: from localhost.localdomain ([94.103.235.167])
 by smtp.gmail.com with ESMTPSA id p13sm1653426ljg.116.2021.03.08.14.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 14:31:06 -0800 (PST)
From: Pavel Skripkin <paskripkin@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kai.heng.feng@canonical.com
Subject: [PATCH next 2/2] sound: usb: fix use after free in
 usb_audio_disconnect
Date: Tue,  9 Mar 2021 01:30:57 +0300
Message-Id: <16da19126ff461e5e64a9aec648cce28fb8ed73e.1615242183.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615242183.git.paskripkin@gmail.com>
References: <cover.1615242183.git.paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Mar 2021 08:02:00 +0100
Cc: Pavel Skripkin <paskripkin@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

The problem was in wrong "if" placement. chip->quirk_type is freed
in snd_card_free_when_closed(), but inside if statement it's accesed.

Fixes: 9799110825db ("ALSA: usb-audio: Disable USB autosuspend properly in setup_disable_autosuspend()"
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 sound/usb/card.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 3fd1743513b5..b6f4c0848e66 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -907,6 +907,9 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 		}
 	}
 
+	if (chip->quirk_type & QUIRK_SETUP_DISABLE_AUTOSUSPEND)
+		usb_enable_autosuspend(interface_to_usbdev(intf));
+
 	chip->num_interfaces--;
 	if (chip->num_interfaces <= 0) {
 		usb_chip[chip->index] = NULL;
@@ -915,9 +918,6 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 	} else {
 		mutex_unlock(&register_mutex);
 	}
-
-	if (chip->quirk_type & QUIRK_SETUP_DISABLE_AUTOSUSPEND)
-		usb_enable_autosuspend(interface_to_usbdev(intf));
 }
 
 /* lock the shutdown (disconnect) task and autoresume */
-- 
2.25.1

