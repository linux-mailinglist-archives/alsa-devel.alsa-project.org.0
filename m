Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C9364D0C
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 23:28:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DBE81684;
	Mon, 19 Apr 2021 23:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DBE81684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618867717;
	bh=//6M3SriGQ7EaVp0t47a6TBbVkWK4Pfu1b4Hmp6YCJE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L6ryrDvRtoodN1MYBIwcdUwge9HqM7r3S9sIz+XQ0pVgd6C3vFcOAPMH28mN9uGeB
	 6b+BMU+BieolGORGMbQhXU8FErzLGJWmPR0vYdSLTbX9sSbS2DWXtLhZhjLGHo0nT4
	 okgID2Fk1iPJ5HdgbucEEjfoju/TEKa58CpN8xRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB51BF80256;
	Mon, 19 Apr 2021 23:27:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ED15F80227; Mon, 19 Apr 2021 23:27:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CC06F8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 23:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CC06F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G+AsokGj"
Received: by mail-qt1-x836.google.com with SMTP id h7so27278191qtx.3
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 14:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zv68vfJs0NPPJj+iDIqiCw1oDhnn9vLhcwIjI1DpUZY=;
 b=G+AsokGjj7O8YdlW35vE9btBlsZxN3pxN+35jLnh/UDiidC1JEUuwU+/bYMshEBYIA
 aD5WhzwGX+X6AN1et+SGySLJ2YAH1Ne9gS13cvZ7Oj760OEheVkpg9esVAvClRBUwc1C
 P4uioV6viFYo/DaTpzYtUO74MatLWnhLYTfvPG2ur7MUxqhxUzqri7nxJ3yWAz4GSm0N
 1UCcyENYxKs5zZ9fBNjV1WpFt+riaTKolfCiIads0jjICgWTTR1iuddRv/VnG2609NpS
 0AEGBlyh6KY/zXj9HO+iGiKICnrfqhxxv+0RoRjQVRnZsHCN4oNTHD/u/ei4492tiqce
 U3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zv68vfJs0NPPJj+iDIqiCw1oDhnn9vLhcwIjI1DpUZY=;
 b=HWwXlF+1JKP5exFHJT6QYXPk322kGOPLokJ6Iaemej2+krQP7vi66KSaGe1bUSdvcd
 1OH5T3hPaA1zEaivoC5ccyNPc4xITt2XEe1zbtyZVuzy8AWMhzxyh9hgqUi0+b66Ygtt
 27KoEQ1La3edFvyHfCYfhhcNFpxjnNC/xOFBwiHZVd6KCW0Jqe9WVWhKCEC9l9jvulXi
 aZ1p/ZtrpsCG+1yKSgrnvYfAT07+H6PLqlubicIKkuLY/t8gRlzJ/13D985dMLMn3dd7
 WIGVJEF4i0r1fuul/Ib8UoNEr96iuiIgC+iQlhyu6/EzIBJVPG6W1x05XjHEZ6aZWXxw
 p0hA==
X-Gm-Message-State: AOAM531l2xUUlfZ2rsZ2Rb0Q1rxMGD1Wo0urQXs/Ge4hqX/dCJeYu+VB
 oKii/NjTTlyAsFELbaticNk6k+0GMULrKwOfdvw=
X-Google-Smtp-Source: ABdhPJxSCQzGnignjTPvIwKzwJlHiPOFaTtF47i2MUifis3G0ke5dBzjc/hfxp7w+pWjhrv5FPjiUoA8hwmL9KY3fMU=
X-Received: by 2002:ac8:502:: with SMTP id u2mr13551253qtg.218.1618867617337; 
 Mon, 19 Apr 2021 14:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210419153918.450-1-tiwai@suse.de>
In-Reply-To: <20210419153918.450-1-tiwai@suse.de>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Mon, 19 Apr 2021 18:31:42 -0300
Message-ID: <CAEsQvcuNCrsTb7NDiACCFOH4mgEq0UvnKCFDa8CUTkpubgLRVg@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: usb-audio: Re-apply implicit feedback mode to
 Pioneer devices
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Thanks, Dr. Iwai! Applied manually on top of 5.12-rc8 and seems to be
working. My JACK transport is rolling and I have some vinyl spinning on
Mixxx passthrough mode. Will let it spin for a few hours just to be sure.

Em Seg, 19 de abr de 2021 12:41, Takashi Iwai <tiwai@suse.de> escreveu:

> Pioneer devices are supposed to be working with the implicit feedback
> mode, but so far the attempt to apply the implicit feedback caused
> issues, hence we explicitly skipped the implicit feedback mode for
> them.  Recently, Geraldo discovered that the device actually works if
> you skip the generic matching of the sync EPs for the capture stream.
> That is, we should apply the implicit feedback setup for the playback
> like other similar devices, while we need to return 1 from
> audioformat_capture_quirk() so that no further matching will be done.
>
> And, later on, Olivia reported later that the fiddling with the
> capture quirk alone doesn't suffice for the test with speaker-test
> program.  This seems to be a similar case like the recently fixed BOSS
> devices.  Indeed, the problem could be addressed by setting
> playback_first flag, which indicates that the playback URBs have to be
> sent out at first even in the implicit feedback mode.
>
> This patch implements the application of the implicit feedback to
> Pioneer devices as described in the above.  The former
> skip_pioneer_sync_ep() was dropped, and instead we provide
> is_pioneer_implicit_fb() to check the Pioneer devices that need the
> implicit feedback.  In the audioformat_implicit_fb_quirk(), simply
> apply the implicit fb for playback and set chip->playback_first flag
> if matching, and in audioformat_capture_quirk()(), it returns 1 for
> skipping the generic EP sync handling.
>
> Reported-by: Geraldo <geraldogabriel@gmail.com>
> Tested-by: Olivia Mackintosh <livvy@base.nu>
> Link: https://lore.kernel.org/r/s5ha6pygqfz.wl-tiwai@suse.de
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/implicit.c | 42 +++++++++++++++++++++++++++---------------
>  1 file changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
> index 428e3a449f5d..77ffcea294dd 100644
> --- a/sound/usb/implicit.c
> +++ b/sound/usb/implicit.c
> @@ -230,18 +230,27 @@ static int add_roland_implicit_fb(struct
> snd_usb_audio *chip,
>                                        ifnum, alts);
>  }
>
> -/* Playback and capture EPs on Pioneer devices share the same
> iface/altset,
> - * but they don't seem working with the implicit fb mode well, hence we
> - * just return as if the sync were already set up.
> +/* Playback and capture EPs on Pioneer devices share the same iface/altset
> + * for the implicit feedback operation
>   */
> -static int skip_pioneer_sync_ep(struct snd_usb_audio *chip,
> -                               struct audioformat *fmt,
> -                               struct usb_host_interface *alts)
> +static bool is_pioneer_implicit_fb(struct snd_usb_audio *chip,
> +                                  struct usb_host_interface *alts)
> +
>  {
>         struct usb_endpoint_descriptor *epd;
>
> +       if (USB_ID_VENDOR(chip->usb_id) != 0x2b73 &&
> +           USB_ID_VENDOR(chip->usb_id) != 0x08e4)
> +               return false;
> +       if (alts->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC)
> +               return false;
>         if (alts->desc.bNumEndpoints != 2)
> -               return 0;
> +               return false;
> +
> +       epd = get_endpoint(alts, 0);
> +       if (!usb_endpoint_is_isoc_out(epd) ||
> +           (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=
> USB_ENDPOINT_SYNC_ASYNC)
> +               return false;
>
>         epd = get_endpoint(alts, 1);
>         if (!usb_endpoint_is_isoc_in(epd) ||
> @@ -250,8 +259,9 @@ static int skip_pioneer_sync_ep(struct snd_usb_audio
> *chip,
>              USB_ENDPOINT_USAGE_DATA &&
>              (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
>              USB_ENDPOINT_USAGE_IMPLICIT_FB))
> -               return 0;
> -       return 1; /* don't handle with the implicit fb, just skip sync EP
> */
> +               return false;
> +
> +       return true;
>  }
>
>  static int __add_generic_implicit_fb(struct snd_usb_audio *chip,
> @@ -367,12 +377,12 @@ static int audioformat_implicit_fb_quirk(struct
> snd_usb_audio *chip,
>         }
>
>         /* Pioneer devices with vendor spec class */
> -       if (attr == USB_ENDPOINT_SYNC_ASYNC &&
> -           alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
> -           (USB_ID_VENDOR(chip->usb_id) == 0x2b73 || /* Pioneer */
> -            USB_ID_VENDOR(chip->usb_id) == 0x08e4    /* Pioneer */)) {
> -               if (skip_pioneer_sync_ep(chip, fmt, alts))
> -                       return 1;
> +       if (is_pioneer_implicit_fb(chip, alts)) {
> +               chip->playback_first = 1;
> +               return add_implicit_fb_sync_ep(chip, fmt,
> +                                              get_endpoint(alts,
> 1)->bEndpointAddress,
> +                                              1,
> alts->desc.bInterfaceNumber,
> +                                              alts);
>         }
>
>         /* Try the generic implicit fb if available */
> @@ -394,6 +404,8 @@ static int audioformat_capture_quirk(struct
> snd_usb_audio *chip,
>         if (p && (p->type == IMPLICIT_FB_FIXED || p->type ==
> IMPLICIT_FB_BOTH))
>                 return add_implicit_fb_sync_ep(chip, fmt, p->ep_num, 0,
>                                                p->iface, NULL);
> +       if (is_pioneer_implicit_fb(chip, alts))
> +               return 1; /* skip the quirk, also don't handle generic
> sync EP */
>         return 0;
>  }
>
> --
> 2.26.2
>
>
