Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E04F8326964
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 22:27:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7603A169B;
	Fri, 26 Feb 2021 22:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7603A169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614374834;
	bh=Nh9vcwo71BjraOCmyohPTTe1vaMsO9Ht468c1hGqW+E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bEl6wwnDqThtwyJWRbu86IxqkdXBX/8TX3cmD41XvFvwAmv4XZyX5W9d3EREK0E/E
	 nXdymRI7REmlm4R2/zcmAVNABO/+eBtsMRSpI446N3RRQ9MRYHZg3UcV5b3kkiDDEp
	 q/xTENEwH+22pblQirJIvmgSTvVqcyEurznLHrf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE0DCF80159;
	Fri, 26 Feb 2021 22:25:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59E1DF8016C; Fri, 26 Feb 2021 22:25:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D6D9F80154
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 22:25:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D6D9F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=george-graphics-co-uk.20150623.gappssmtp.com
 header.i=@george-graphics-co-uk.20150623.gappssmtp.com header.b="x5TesxhG"
Received: by mail-pg1-x534.google.com with SMTP id o38so6959487pgm.9
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 13:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=george-graphics-co-uk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NlWMLWhxZMu4ySEeDP2fa+9dxkabBQGlKANZO0dxadc=;
 b=x5TesxhGQAcUy+Ho3TA2HZgoc55dKXVbJz6h6A9cWXxOvjGCja7x1K8zm0wSmGTcmb
 w1oNEZjTgnqjSMft+468Oi9Pf4tA4DFmlMJUZ1Sj01SCs2zwnVNy0BpIaKv1BEUs6qLn
 OlDcXQ9WHAKhav3PnKDGbNBKcuMaxZGkscPoBbVQis13nKokugdTelTBE6fxW7vdahS1
 9JtPLpyIABZiXzoZKjZSb3QMoLEO4Mjk0tl+WqC5YIWnznWDa3LxP2pqKBlsWM3BaWVK
 3sjEI5W3IQdMZJnp1YWnp743RZp3vQEchSOyirJ9j/2CB0SDGT0jafdCVPuF4zX1Z8l8
 WtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NlWMLWhxZMu4ySEeDP2fa+9dxkabBQGlKANZO0dxadc=;
 b=TPbVjA5VdTCMIdoq7B7iJocWblmgeTj48j0NZ5m29OZOvRUl/hhdHXXMswLBeho4dy
 pvyDrQrTm1Rzd20KasX4e7R5s1agpfaATndognymZ18uON//yeLv0veH611pBMmeg09R
 zxLGAUFzE5WoOjJYcGLyl09PoK3YsgHK3vLXI7J/t2nufiK19cXa/SCiw1xEmCA/rEE/
 K2JQqithaJLx2F0ygcavHhmZgxY9E4af3tTSFYFVYAZFoO3WHWaTy7JhD6Ju8yFVTJvA
 3rTvZmySrkeWkz7TaQCAlZtN6TmfPfceWJdP1sMETOAookYjBI+lusSLLhjYI8V5Zb5v
 NXlw==
X-Gm-Message-State: AOAM5312PFFFxIKLwY58OKMAhrDFTmjAchvtvKiPVNBUHd71xlBqyLlj
 AL40/mwQ5PnpR90mR91sfqPLcQ==
X-Google-Smtp-Source: ABdhPJyjjgYgu5zlTQCwgMXEkrFWh7Y+XgmWZTjJvNpBKmcrMDtdxy/QCaEdCk2OZSTSUMptc8AhPw==
X-Received: by 2002:a65:4141:: with SMTP id x1mr4503126pgp.421.1614374732569; 
 Fri, 26 Feb 2021 13:25:32 -0800 (PST)
Received: from sequencer.hsd1.wa.comcast.net
 ([2601:602:8000:181:df1d:64b5:575f:9598])
 by smtp.gmail.com with ESMTPSA id u129sm10317695pfu.219.2021.02.26.13.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 13:25:31 -0800 (PST)
From: George Harker <george@george-graphics.co.uk>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/2] use usb headers rather than define structs locally
Date: Fri, 26 Feb 2021 21:24:56 +0000
Message-Id: <20210226212457.24538-1-george@george-graphics.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <s5hczwpucd3.wl-tiwai@suse.de>
References: <s5hczwpucd3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, George Harker <george@george-graphics.co.uk>,
 Clemens Ladisch <clemens@ladisch.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

Use struct definitions from linux/usb/midi.h rather than locally define
the structs in sound/usb/midi.c .

Signed-off-by: George Harker <george@george-graphics.co.uk>
---
 sound/usb/midi.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 0c23fa6d8..610cf54ee 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -47,6 +47,7 @@
 #include <linux/usb.h>
 #include <linux/wait.h>
 #include <linux/usb/audio.h>
+#include <linux/usb/midi.h>
 #include <linux/module.h>
 
 #include <sound/core.h>
@@ -77,23 +78,6 @@ MODULE_AUTHOR("Clemens Ladisch <clemens@ladisch.de>");
 MODULE_DESCRIPTION("USB Audio/MIDI helper module");
 MODULE_LICENSE("Dual BSD/GPL");
 
-
-struct usb_ms_header_descriptor {
-	__u8  bLength;
-	__u8  bDescriptorType;
-	__u8  bDescriptorSubtype;
-	__u8  bcdMSC[2];
-	__le16 wTotalLength;
-} __attribute__ ((packed));
-
-struct usb_ms_endpoint_descriptor {
-	__u8  bLength;
-	__u8  bDescriptorType;
-	__u8  bDescriptorSubtype;
-	__u8  bNumEmbMIDIJack;
-	__u8  baAssocJackID[];
-} __attribute__ ((packed));
-
 struct snd_usb_midi_in_endpoint;
 struct snd_usb_midi_out_endpoint;
 struct snd_usb_midi_endpoint;
@@ -1875,7 +1859,7 @@ static int snd_usbmidi_get_ms_info(struct snd_usb_midi *umidi,
 	    ms_header->bDescriptorType == USB_DT_CS_INTERFACE &&
 	    ms_header->bDescriptorSubtype == UAC_HEADER)
 		dev_dbg(&umidi->dev->dev, "MIDIStreaming version %02x.%02x\n",
-			    ms_header->bcdMSC[1], ms_header->bcdMSC[0]);
+			    ((uint8_t *)&ms_header->bcdMSC)[1], ((uint8_t *)&ms_header->bcdMSC)[0]);
 	else
 		dev_warn(&umidi->dev->dev,
 			 "MIDIStreaming interface descriptor not found\n");
-- 
2.20.1

