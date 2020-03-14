Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92204185B43
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Mar 2020 09:38:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3035E1867;
	Sun, 15 Mar 2020 09:37:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3035E1867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584261526;
	bh=G0Plrdx2pxUwObjLuM2P5QifycNDaONJ4LHW53gpuq8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EDUra5Z8NHepBcb21R1bLKNfO98WuCj0BWkLwwHqerSJbmzj+k2vSWSaJXIolk2HK
	 eSkbjNl+HIyLQZfBFPiL4l663zqJY+WJXR5763GLfpkwxmVzZztI2Yy978wsXhe9d/
	 xJ33xpIbgVCCjMpQUPkgDqVb36ScLxjgo9r2ZiDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79DC0F802C3;
	Sun, 15 Mar 2020 09:33:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30831F8023F; Sat, 14 Mar 2020 17:54:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBA31F8013C;
 Sat, 14 Mar 2020 17:54:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBA31F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gwdY18rQ"
Received: by mail-qk1-x744.google.com with SMTP id p62so18519500qkb.0;
 Sat, 14 Mar 2020 09:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3FBcJuiSXp3NcoC9gmlN8BYbJ0DBoeWvz+ZRQ1q25aM=;
 b=gwdY18rQbL7FzAXeXlK7Ytu1SP6Iyk481YZZpMaSZWvgghwDKIx1JeIcwGUK2u30sA
 a0hWWx7qWWcMX7KcQYw+BbSgZP76rXHius5euKXjqbD3JVB82T7mmeogFvKMoIp+f4Fx
 I9W6C0mcR1B5N1ntu4fWqBlDSX/iNVnElgE2lrcWq+GUH0cj8E7QsLEiWKDex3qTNYch
 ElTCY6IPQ3+sUu+ZUJvClOcqSkwmD4EZQUDOcC/UbpXbdU0qjeJsQdAwb9DzbnUqVjvA
 Nb/yWmZH8buqSBxYAdh4/WK1iletoMK9+2aVfibQXPk/CuWz9IZmTK1MAfqOs0x15iF4
 6N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3FBcJuiSXp3NcoC9gmlN8BYbJ0DBoeWvz+ZRQ1q25aM=;
 b=QFw9NweDxvU4T5CS4sSrmpdXS5jjwBPr4enInQmsj7rQBTs+TrrtVlkb8zbhCOjYoR
 zRB55vtH+E/HC4It1Rc1NoEJhQQqfO5AZMnVP5+OAdc/RlYhOrT9D/VM7ZU1ZyqbVtvo
 5ARM6qIZEKIIA1AAxSlB4IS7cimznOmaWaystvX/BXWC/cNEFp7M2PdJvfThl83lSNew
 4fC4DDLBg+7gyoWAB2ntIThJraKgguwME29kMcgIwpVT8/wc6JIlk03XfhCE4h64iwJ4
 VYheaQl8efRgD6gbIsgwkG5Tf8v2QWGoonQfeTaitz8NlZ5W4ESnDxSdi15yhb+85NpF
 nZbA==
X-Gm-Message-State: ANhLgQ3ONtSVs0TVS7uHZNZxPK8+E7cJNGBuXwX1eNjTLTKKo0wKBYCl
 tX/6XT9e7eEhsFCcBBwQHpk8/Uyd
X-Google-Smtp-Source: ADFU+vtmeYLCBTr+v8bLT+LEsP+k0z04xs+BOzb9cmdnZ9o1CUzInt1Vvh4x0pEywPJcfJoMAJSdYQ==
X-Received: by 2002:a37:ad15:: with SMTP id f21mr19205108qkm.84.1584204858041; 
 Sat, 14 Mar 2020 09:54:18 -0700 (PDT)
Received: from cybertron.pseudoangel.com
 (cpe-172-101-252-194.rochester.res.rr.com. [172.101.252.194])
 by smtp.gmail.com with ESMTPSA id q24sm7969363qtk.45.2020.03.14.09.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2020 09:54:17 -0700 (PDT)
From: crwulff@gmail.com
To: patch@alsa-project.org
Subject: [PATCH Fix for Kingston HyperX Amp (0951:16d8) (Try #2) 2/2]
 snd-usb-audio: Create a registration quirk
Date: Sat, 14 Mar 2020 12:54:49 -0400
Message-Id: <20200314165449.4086-3-crwulff@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200314165449.4086-1-crwulff@gmail.com>
References: <20200314165449.4086-1-crwulff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 15 Mar 2020 09:32:59 +0100
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Chris Wulff <crwulff@gmail.com>
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

From: Chris Wulff <crwulff@gmail.com>

Create a quirk that allows special processing and/or
skipping the call to snd_card_register.

For HyperX AMP, which uses two interfaces, but only has
a capture stream in the second, this allows the capture
stream to merge with the first PCM.

Signed-off-by: Chris Wulff <crwulff@gmail.com>

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 827fb0bc8b56..16bbe2a50fb7 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -662,10 +662,14 @@ static int usb_audio_probe(struct usb_interface *intf,
 			goto __error;
 	}
 
-	/* we are allowed to call snd_card_register() many times */
-	err = snd_card_register(chip->card);
-	if (err < 0)
-		goto __error;
+	/* we are allowed to call snd_card_register() many times, but first
+	 * check to see if a device needs to skip it or do anything special
+	 */
+	if (snd_usb_registration_quirk(chip, ifnum) == 0) {
+		err = snd_card_register(chip->card);
+		if (err < 0)
+			goto __error;
+	}
 
 	if (quirk && quirk->shares_media_device) {
 		/* don't want to fail when snd_media_device_create() fails */
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 7f558f4b4520..c73da0721e30 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1756,3 +1756,17 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 		break;
 	}
 }
+
+int snd_usb_registration_quirk(struct snd_usb_audio *chip,
+			       int iface)
+{
+	switch (chip->usb_id) {
+	case USB_ID(0x0951, 0x16d8): /* Kingston HyperX AMP */
+		/* Register only when we reach interface 2 so that streams can
+		 * merge correctly into PCMs from interface 0
+		 */
+		return (iface != 2);
+	}
+	/* Register as normal */
+	return 0;
+}
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index df0355843a4c..3afc01eabc7e 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -51,4 +51,7 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 					  struct audioformat *fp,
 					  int stream);
 
+int snd_usb_registration_quirk(struct snd_usb_audio *chip,
+			       int iface);
+
 #endif /* __USBAUDIO_QUIRKS_H */
-- 
2.20.1

