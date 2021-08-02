Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D253DE2BF
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 00:55:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18CD8171F;
	Tue,  3 Aug 2021 00:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18CD8171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627944922;
	bh=D8kC3Y5B4St8HQAz8Z5ieygx8VNz8NbyIqq43x9CJaI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MJubRbzecXX1oyYdt/tnVySDofJ/c5wOtShHtKHCG0sRsFlEbolXp4nHN1tPthuic
	 mXMMhGd1POq/A8j1Zjo6rGhKCJARIJeOe2sKSwGQ5bPvaW+apEKZF5fd+6FkDEeAdz
	 p2+MY71nIsLy+2CixaPh/Va2aVQbtJSF8GlwqwCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58911F80268;
	Tue,  3 Aug 2021 00:53:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C1B3F8014D; Tue,  3 Aug 2021 00:53:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5AD0F8014D
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 00:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5AD0F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DB/uIBJx"
Received: by mail-wr1-x432.google.com with SMTP id j2so23145130wrx.9
 for <alsa-devel@alsa-project.org>; Mon, 02 Aug 2021 15:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=f6XStbR+3/dZBpwh4Gq6VDFs804yZWcR+sdlfpTwgVg=;
 b=DB/uIBJxbYHzpEZKZgP6ZhrgdyPC3Hccy+ll+rrmSds7L65imoP40EcpAyDXUosmne
 MZuue7j8P8gqb17eElU6oSLukduvJWXPnfOXvUTZWmMXzwawxN9yVxw3WQ4Z4zIMnC31
 hI2yJe8iEi6ebrWTgPQtsU08knqS0CmNtfkm3ezBVnP2uL8GFUTRDQkC3ztv5adkFGCf
 aqB4yrh1a58HIzYJtUR+lA1VuBLAm/stpzBFDl32iAdABAaZC4Ah9qM7NSdPSomgmVks
 pGeoULAok6sqXYvQsAZEsMep/Ix1anjMGQWNx3TTxsMgA6PUh+xSv6KlEpG/Um/NRFCe
 Fq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=f6XStbR+3/dZBpwh4Gq6VDFs804yZWcR+sdlfpTwgVg=;
 b=aAswLWiiJDbP66LNTaQyOYyAVW1a5vhYGdiM/MuVRg6QurBRFfZJaSW/QDWOLtbpsN
 hOS5oEaCUlXJ1sO6r7hQ6ZYa4VEqjh+rL8PCtD6LmqpKqgEPL2j2C2zASVo3iYvaM/8h
 7baWHUuCbid+IpF+6ixBBwL0lnUyL+/8416F2waQyT5PvwNw6mcxfuFq4rSrodbxweFq
 9alNs/FEFeBPsmRNjtEGB1WujChaZ9d81qCwuPCf+yN5/2/QzfLnoMWWGGa7hs7S9pRA
 PsKF4pceJerLB7T/Q8evA0kcVsR4EsKRsy0bKgpSnpW5kzPB5rdkEixNkX2IWY7Tv6PD
 gFDQ==
X-Gm-Message-State: AOAM533dUWC4LV5oPxfnBDKjhmCLZ3ykt/zcbh/vC247FuJICkUokHPt
 EoFwPn1TVGpFguvCJwJAPWM=
X-Google-Smtp-Source: ABdhPJzFQ/L/4ZUaER8RmCQGH9ygBTjFjh2WilXQX9maipYmFA7RN7EDKhIQQ/rBmlXwTyJyPoiv0Q==
X-Received: by 2002:a05:6000:10d0:: with SMTP id
 b16mr20183524wrx.332.1627944822237; 
 Mon, 02 Aug 2021 15:53:42 -0700 (PDT)
Received: from pc ([196.235.140.151])
 by smtp.gmail.com with ESMTPSA id q14sm12520389wrs.8.2021.08.02.15.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 15:53:41 -0700 (PDT)
Date: Mon, 2 Aug 2021 23:53:39 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pavel Skripkin <paskripkin@gmail.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Mark Brown <broonie@kernel.org>, Joe Perches <joe@perches.com>
Subject: [PATCH] sound: usb: get lock before calling usb_enable_autosuspend()
Message-ID: <20210802225339.GA1461793@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Based on the documentation of usb_enable_autosuspend(), the
caller must hold udev's device lock.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 sound/usb/card.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 2f6a62416c05..9290ba0acd5f 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -907,8 +907,13 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 		}
 	}
 
-	if (chip->quirk_type & QUIRK_SETUP_DISABLE_AUTOSUSPEND)
-		usb_enable_autosuspend(interface_to_usbdev(intf));
+	if (chip->quirk_type & QUIRK_SETUP_DISABLE_AUTOSUSPEND) {
+		struct usb_device *udev = interface_to_usbdev(intf);
+
+		usb_lock_device(udev);
+		usb_enable_autosuspend(udev);
+		usb_unlock_device(udev);
+	}
 
 	chip->num_interfaces--;
 	if (chip->num_interfaces <= 0) {
-- 
2.25.1

