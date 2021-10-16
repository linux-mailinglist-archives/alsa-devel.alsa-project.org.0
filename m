Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 723C4430372
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Oct 2021 17:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB2EB17F2;
	Sat, 16 Oct 2021 17:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB2EB17F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634398803;
	bh=Z+zyIwx7CtTVhH1QYPNIX6+plPqCPH1jJuxGq5JuE20=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uqxfJSdd+MYyKjqPd3zvDPuQnISPrxbfzUsV42alwDRrHXXOL0Y8GwvpfCsRDn9rJ
	 G4y2BbMHhd8Ug/xNqBXgKUm46CcEFWLrN134hfGjk39KtmpWD2cO+/Vw2CWMTym3UX
	 CdLL+s4w9KzeJ175RCj8ZjHPmcd3WEgRxRnGAB6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 092ACF800E5;
	Sat, 16 Oct 2021 17:38:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12E0EF80212; Sat, 16 Oct 2021 17:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CA86F800E5
 for <alsa-devel@alsa-project.org>; Sat, 16 Oct 2021 17:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CA86F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FwrEnBKC"
Received: by mail-pf1-x433.google.com with SMTP id d9so3847407pfl.6
 for <alsa-devel@alsa-project.org>; Sat, 16 Oct 2021 08:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=mrb3i10mG/4CRPlnU6lRGOgjaoFLMgj36rIJcBGasRk=;
 b=FwrEnBKCbbbUByBI3zjYFwvsOCQ+e0c4+7z5mdwWaiT/5p1YsPFtLwR6J+xi2HbhkO
 UEsa0T26Qa4m0nRZloDhToVSzqVBydWJHnIdvvf7+B2a3Oe5UzjaFn7KfOb+WmGu5gAh
 sClTdll2+NmYFp++T/YFmQEDqVb5WatkAL5oj6KSek37wHL4XzEQDkxy26dQvgaWQBWD
 9tD2/frwUHw3NHhe4wrgHZ8yoZpZnrFjMHPSs8CW0bCtBu9sgY/wTUW7a9+yQwsl3QQa
 lNpGo4Nu/jCj45RhXLgmPsGjGYA7AncgiPXrBQr9CkizrmxnWyWvA9Z4bcCit5OSuLS7
 B79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=mrb3i10mG/4CRPlnU6lRGOgjaoFLMgj36rIJcBGasRk=;
 b=INOF5nkKVrlfHJ382L2GKumyajVJM8eFBcgJeNTWjHbiJ3txEaB0yjU6m90Ewe+B2p
 IO+9XMGUNWat7kBRyNi4iRKPelWenJ/iTX8nef5sG2tGlDOFFsHFllJhfwMy3rssa24l
 RMvcTLnVVMTHHZLVM+mtZK+u5ebVIpbxYMptqyXkx7sM5j9pjLHYchZRl8c2gJiMeuoH
 ZVHT1xGZarSf1FFE63O1yW5jMBKFXIutVZLpKTmAJfadc9Nv6gNBcUg7cVS7W5aJUwre
 AA+jXAKE7fZ0VZJoywKhO14/stK+SeMYs0RZhEhRP709wcgmWz8CYd6vsnvR119UG7nf
 iWbw==
X-Gm-Message-State: AOAM533EaTrFiR2qXjsjgN+xogjuX9oiKwKJcNkkGqtwJLf5ntVsrekh
 wFgP+mrxyEy8P2CttBdn8/gpIKJ6LwfVL8bMscQ9FYKEaMo=
X-Google-Smtp-Source: ABdhPJz6aqsPRzBFVWSIKjEOdh/OafYSXK6YA6UFctRthk3e9ibk15WoRkJeE3MN1ENLpNkawTBAXBddcOcqOlnSNpE=
X-Received: by 2002:a63:33cb:: with SMTP id
 z194mr14529124pgz.380.1634398716031; 
 Sat, 16 Oct 2021 08:38:36 -0700 (PDT)
MIME-Version: 1.0
From: Marco Giunta <giun7a@gmail.com>
Date: Sat, 16 Oct 2021 17:38:25 +0200
Message-ID: <CAE5BBpRLygys=6+W4O8eqrqDb7tP+t+RtYgUnJYOOWx6Sf_SCA@mail.gmail.com>
Subject: [PATCH v2] sound/usb : Fix mic sound on Jieli webcam
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Cc: tiwai@suse.com
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

Hi,
this is my second attempt
(https://mailman.alsa-project.org/pipermail/alsa-devel/2020-December/178361.html)
to fix mic sound on a Jieli webcam. I found that the mic works only
when ep packet size is set to wMaxPacketSize, so I've removed the
datainterval hack. I also fixed the problem with the volume control
(mixer).

Now the mic sound works (no more Minion voice) and there are no more
errors in syslog about volume range. I arbitrarily choose a resolution
value (16): I read in a comment that there should be no more than 255
levels, so 4096 (max volume) / 16 = 0-255 ;-)

Could you review this patch?

Thanks,
  Marco



Jieli Technology USB Webcam microphone needs some quirks to work.

Signed-off-by: Marco Giunta <giun7a@gmail.com>
---
 sound/usb/mixer.c  | 7 +++++++
 sound/usb/quirks.c | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 9b713b4a5..20ef12dd8 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1198,6 +1198,13 @@ static void volume_control_quirks(struct
usb_mixer_elem_info *cval,
             cval->res = 1;
         }
         break;
+    case USB_ID(0x1224, 0x2a25): /* Jieli Technology USB PHY 2.0 */
+        if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
+            usb_audio_info(chip,
+                "set resolution quirk: cval->res = 16\n");
+            cval->res = 16;
+        }
+        break;
     }
 }

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 326d1b0ea..2263e43fd 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1534,6 +1534,7 @@ bool snd_usb_get_sample_rate_quirk(struct
snd_usb_audio *chip)
     case USB_ID(0x2912, 0x30c8): /* Audioengine D1 */
     case USB_ID(0x413c, 0xa506): /* Dell AE515 sound bar */
     case USB_ID(0x046d, 0x084c): /* Logitech ConferenceCam Connect */
+    case USB_ID(0x1224, 0x2a25): /* Jieli Technology USB PHY 2.0 */
         return true;
     }

@@ -1874,6 +1875,11 @@ void
snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
          */
         fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
         break;
+    case USB_ID(0x1224, 0x2a25):  /* Jieli Technology USB PHY 2.0 */
+        /* mic works only when ep packet size is set to wMaxPacketSize */
+        fp->attributes |= UAC_EP_CS_ATTR_FILL_MAX;
+        break;
+
     }
 }

--
2.31.1
