Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D913AAFB
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:27:23 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B06E2D74;
	Tue, 14 Jan 2020 09:41:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B06E2D74
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 138D2F80171;
	Tue, 14 Jan 2020 09:40:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBA78F8014E; Tue, 14 Jan 2020 09:40:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F43FF800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 09:40:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F43FF800B9
Received: by mail-lj1-f194.google.com with SMTP id a13so13315465ljm.10
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 00:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zm6dxfwwxxsUgoQx/Ixs6f65hoaWz7f2fI6es/3Ijns=;
 b=I48lflIKnL1dA84jDugYX/1FVmCiNXwcLRr5SIHEIJnqjSfVClpgIOYo2OJpRksdTl
 N/P3poAHbd7aNGd5VrwncZu1Wgqay1ANjxHx0HECWTrg/fZ8s605LmRaLMSRx5rpWN0u
 YBvl8TTvvLnh5CEAPzuaNLG8KB258XrBimOXYb4XELOOoi0PxLp+wVBDjsR4NFAKjyKW
 u4kCBZUhELh5eS+zMUk0jN74qmxAN3Hs510IHgr5/Tr1C7eo51exAEfJBq1aPnVHM2gA
 eu+kLYXKvO/JQS8Ec8LfxX3BS+7Q1plgm2Xxaj0vvDltcbsXFk6p0KDars1reWSjz375
 lsVA==
X-Gm-Message-State: APjAAAW5OgngPikSYkiHKQlqVsSXFdtSw0lgIURhJC1wrdH9MgSdh+oN
 fAfw8Y93i8zTMUDfEx+owV4=
X-Google-Smtp-Source: APXvYqxK2dS7w47TFeRL1ZrMAWZXamRgxsgmqFsDFdxveqSAiv1L06WR5SP8UeZYWuXxDExwsvy0yQ==
X-Received: by 2002:a2e:910b:: with SMTP id m11mr12819480ljg.213.1578991208043; 
 Tue, 14 Jan 2020 00:40:08 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.184.20])
 by smtp.gmail.com with ESMTPSA id b14sm6840893lff.68.2020.01.14.00.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 00:40:07 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@xi.terra>)
 id 1irHk7-0000Ia-26; Tue, 14 Jan 2020 09:40:07 +0100
From: Johan Hovold <johan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Date: Tue, 14 Jan 2020 09:39:53 +0100
Message-Id: <20200114083953.1106-1-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: fix sync-ep altsetting sanity
	check
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The altsetting sanity check in set_sync_ep_implicit_fb_quirk() was
checking for there to be at least one altsetting but then went on to
access the second one, which may not exist.

This could lead to random slab data being used to initialise the sync
endpoint in snd_usb_add_endpoint().

Fixes: c75a8a7ae565 ("ALSA: snd-usb: add support for implicit feedback")
Fixes: ca10a7ebdff1 ("ALSA: usb-audio: FT C400 sync playback EP to capture EP")
Fixes: 5e35dc0338d8 ("ALSA: usb-audio: add implicit fb quirk for Behringer UFX1204")
Fixes: 17f08b0d9aaf ("ALSA: usb-audio: add implicit fb quirk for Axe-Fx II")
Fixes: 103e9625647a ("ALSA: usb-audio: simplify set_sync_ep_implicit_fb_quirk")
Cc: stable <stable@vger.kernel.org>     # 3.5
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/usb/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index a11c8150af58..0e4eab96e23e 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -370,7 +370,7 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 add_sync_ep_from_ifnum:
 	iface = usb_ifnum_to_if(dev, ifnum);
 
-	if (!iface || iface->num_altsetting == 0)
+	if (!iface || iface->num_altsetting < 2)
 		return -EINVAL;
 
 	alts = &iface->altsetting[1];
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
