Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2F23D5182
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 05:11:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 003701721;
	Mon, 26 Jul 2021 05:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 003701721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627269070;
	bh=6/CX/xfjhoBik9aGC0Acoc05ay1iIefUqLCQEiQ1yHE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VGIP6jPzsQwnKS69KXsP9hHfY86wSWtFHYDC1akfNYVnF16atp6fPJd9CIsa5pgLM
	 4bnrRJX5xDN0ooo8wXb8hqCD6MLvYZg0aJ/j/8dARiBr1ZJuDu97pHmwHBX6Ts+/Gu
	 pTtCDlJXCU6vkGNGsKjvXndRabzhKW0p5kPMsZA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB637F80132;
	Mon, 26 Jul 2021 05:09:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 313A4F80132; Mon, 26 Jul 2021 05:09:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80387F80130
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 05:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80387F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="GxlrnOmg"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id F0B013F244
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 03:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627268965;
 bh=qxvQwEXuDqY3xUkiMbVKvRx8zE8Yv0x+i+l7nFVyc5U=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=GxlrnOmgOrVVRVXPxdiP3B+1sRWoqFcr9vIejlMuqpbUV2RVKE0BrUFaqiUivXD+a
 0nJs7l/lpzu3CxYwtiFZnzn+G7B0kM9FNntJAutoh3k092+EsiYyAcael4h9cDn0J1
 qRW1ddIDdAPkIE9cY8LY2yYD/8hgOT2XcICBP97U49C4Nyxu7vqLs/2JazKMz8Cdms
 umTOXetyqZIexdbe4M9z4GHch4wwp3F/CBlaL87UwrBZ769vTL9oBSXdf1F78Ab7yR
 oN+qpSE3KASy9SZqskcO/GF1d5wdvys+X9PYhUquO/K3BZgmdOu0uN5LTy9fZWRUjL
 t1cgGr5p9WoUw==
Received: by mail-ed1-f71.google.com with SMTP id
 b88-20020a509f610000b02903ab1f22e1dcso3905085edf.23
 for <alsa-devel@alsa-project.org>; Sun, 25 Jul 2021 20:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qxvQwEXuDqY3xUkiMbVKvRx8zE8Yv0x+i+l7nFVyc5U=;
 b=o40piECJ9vPD3kvaDNWHuVjLT+bYwEgoOoNuvSM36ul81wPEhNP3ifewFNZqqIj37r
 G0EG113w6p9FbXi7n8cCpgLUMDatqdPwosXdBzmVYqT3mEwY92yWh9vSsry6iLIb/nS+
 WzP27CCa3YTIiYyee1NRcKuDa1RFOPkuXiRsz12Ll8/n0IfvHcITLAtNnO2sGuPG/EuT
 oQvdZTBHKm5/Cjqw5EdI+qB2PYSQkU8FYO3P9vKoN7pD2+eq4bUGbxv567pRFdpWZaP0
 sHA2CXOHYpMYVBMELQQjE00fMD6tk5aoieT8Kgmyue3TR4S95Nu/mPHzDMYX5slb+Cvc
 sJIA==
X-Gm-Message-State: AOAM531BL04HmkSxpfCeDN1ck7V+z8zAYuB1RDDUxdJQerH+wnlgVA5R
 Pw5NVUi36Hlzfl3yT7vm+oVpNMs5cwuDnYMmKAQJGT/gVu+AoCMgRpsbExdHfcBUxHlVQOFpylA
 A7If3/NKMGiZaziM0GejF0sOTh6y2ad/4zyM7jkxnyZGQx9vV3W+cI66a
X-Received: by 2002:a17:906:f0d8:: with SMTP id
 dk24mr15319545ejb.432.1627268964812; 
 Sun, 25 Jul 2021 20:09:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMM/tptxNRv8Vc4APZ1Ol0iYheYiB9QI0S2P6p8xPf12Qh5HAMOtA7LfDsZvPQQW3i7RMqeOWVVBw7e8lPgNc=
X-Received: by 2002:a17:906:f0d8:: with SMTP id
 dk24mr15319535ejb.432.1627268964613; 
 Sun, 25 Jul 2021 20:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210725102309.19607-1-tiwai@suse.de>
In-Reply-To: <20210725102309.19607-1-tiwai@suse.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 26 Jul 2021 11:09:11 +0800
Message-ID: <CAAd53p4ePYRG6iFMiWiyP+Lx0c6uyQOucCzi3E6QY6Q3r2BkFg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Fix superfluous autosuspend recovery
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>
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

On Sun, Jul 25, 2021 at 6:23 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> The change to restore the autosuspend from the disabled state uses a
> wrong check: namely, it should have been the exact comparison of the
> quirk_type instead of the logical and (&&).  Otherwise it matches
> wrongly with the other quirk types.
>
> Although re-enabling the autosuspend for the already enabled device
> shouldn't matter much, it's better to fix the unbalanced call.
>
> Fixes: 9799110825db ("ALSA: usb-audio: Disable USB autosuspend properly in setup_disable_autosuspend()")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 2f6a62416c05..a1f8c3a026f5 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -907,7 +907,7 @@ static void usb_audio_disconnect(struct usb_interface *intf)
>                 }
>         }
>
> -       if (chip->quirk_type & QUIRK_SETUP_DISABLE_AUTOSUSPEND)

It was bitwise and, not logical and...

Kai-Heng

> +       if (chip->quirk_type == QUIRK_SETUP_DISABLE_AUTOSUSPEND)
>                 usb_enable_autosuspend(interface_to_usbdev(intf));
>
>         chip->num_interfaces--;
> --
> 2.26.2
>
