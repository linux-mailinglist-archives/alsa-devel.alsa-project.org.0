Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 847D636871B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 21:22:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA7F3E;
	Thu, 22 Apr 2021 21:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA7F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619119331;
	bh=kG/MRsN95Y37/qXehKl9TK2WBlApgSYwv4MH/XBoJI4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I0PI9DuqOokfj0Jg8kjDrn3KiHAeU3n+dcCawFeSom3IGOy3N2KuxmM/p8TuEbXMa
	 uRLjc3tJ94sc9lciJ5grhpmBFMtBjSpKXubdUwavqbHtq3mhxq13eun65oUvlgJMfS
	 Cdp77WBgns9QLttZU0KUduR4NqI5K7giPTnLSQSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A5E7F80059;
	Thu, 22 Apr 2021 21:20:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31ECDF80253; Thu, 22 Apr 2021 21:20:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB709F80134
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 21:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB709F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="mlfzDeQl"
Received: by mail-ej1-x633.google.com with SMTP id w3so70490862ejc.4
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 12:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2layFt6xnLwK6FIO/1i++Ew52dYAPxxFv2lqmRZTkN4=;
 b=mlfzDeQl6hKMHuFvTp4QXd3T2O2mIUb2iNTfj933NjYoiBRe6CKhEJhVPKuYU1HNzG
 SeHbsfNgqw2r2tsiltHXh3iIvS/rXWMnSJmp3rUGDAc/SAHK2zKYwmkWsp6jnSY2RDqE
 JDpkg8X6bGEnJft5Eo9xzCRtn/oupV+gviBaEJNF0xj1EuuQ83jA6Px3C7idoPktSXTQ
 xUrhVpT1MN1dtQ6lziCuVKYqd6xm9GlHnT8oMcVm2nsxJezZVp0n6V+MhjUsuF6t1B0B
 KDPOs1d/51NZQw7/PPN02m3RVhvB9Zjxs0Cx4QqindBGJbewOg+IUwOAnHKCAQJnJm/3
 rnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2layFt6xnLwK6FIO/1i++Ew52dYAPxxFv2lqmRZTkN4=;
 b=Jtxvuvr3XN2smWS2O+RfDklUSVIpV49Rl3d0MfDJfbsLGxkpDvXKW5m6d0VVULDeb9
 z1Vlor5hBJkHXEvChGab2tFFOTNWTzcLVE3dmIHY6fWLS3zbVrbKV9DNoWrREw3HUV8H
 Vvb19AkKTcZFK0KiQRF7Wvv6BLZ3/AOZHnYG3TvVKYZEHGOVy3xUj6vltCI+FTd2qkkD
 fO9CKm0+ZeG+p7VWAdsd/c8gzc60MU7Y+av2mXxLakN+C4BHruAhD0TdyYtdTF8IsdzF
 CIAp78aFolxHy1Wc3GSnycIKrh+Adt4cvYYoA76gz2c0KLpbStxpjeUfGN8E4Km4aMgU
 o2dw==
X-Gm-Message-State: AOAM531vskhs1CQsklpttOSYyDSjFdRG6ti0geF4yir+5VI1fXrYLXv8
 k0Utdjm4iokaA64XTJJsVQ7ZMCd9Ka8LYBjV55+EvQ==
X-Google-Smtp-Source: ABdhPJxj2vsPB5uo4TGBKNjXNnqtrA7T6BkBJreKJa6+kkveH7g8lU7YZ2nXDhyyFb0Ar8XRco/D4/67epJvqTx240I=
X-Received: by 2002:a17:906:d795:: with SMTP id
 pj21mr248714ejb.102.1619119231520; 
 Thu, 22 Apr 2021 12:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210422120413.457-1-tiwai@suse.de>
 <20210422120413.457-2-tiwai@suse.de>
In-Reply-To: <20210422120413.457-2-tiwai@suse.de>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Thu, 22 Apr 2021 12:20:19 -0700
Message-ID: <CAHXb3bcKvPSceMuvrq-X8dUyxdrH6iAHTHq_RgTXoAAiXygwUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Generic application of implicit fb
 to Roland/BOSS devices
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Lucas Endres <jaffa225man@gmail.com>, alsa-devel@alsa-project.org,
 "Keith A . Milner" <maillist@superlative.org>
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

I had wondered whether the hardcoded endpoints were necessary (or always
accurate).

This method seems much cleaner, and I can report that it is working as
expected (playback-only, record-only, and full duplex) on the BOSS GT-1.

Mike

On Thu, Apr 22, 2021 at 5:04 AM Takashi Iwai <tiwai@suse.de> wrote:

> Through the examinations and experiments with lots of Roland and BOSS
> USB-audio devices, we found out that the recently introduced
> full-duplex operations with the implicit feedback mode work fine for
> quite a few devices, while the others need only the capture-side quirk
> to enforce the full-duplex mode.  The recent commit d86f43b17ed4
> ("ALSA: usb-audio: Add support for many Roland devices' implicit
> feedback quirks") tried to add such quirk entries manually in the
> lists, but this turned out to be too many and error-prone, hence it
> was reverted again.
>
> This patch is another attempt to cover those missing Roland/BOSS
> devices but in a more generic way.  It matches the devices with the
> vendor ID 0x0582, and checks whether they are with both ASYNC sync
> types or ASYNC is only for capture device.  In the former case, it's
> the device with the implicit feedback mode, and applies accordingly.
> In both cases, the capture stream requires always the full-duplex
> mode, and we apply the known capture quirk for that, too.
>
> Basically the already existing BOSS device quirk entries become
> redundant after this generic matching, so those are removed.  Although
> the capture_implicit_fb_quirks[] table became empty and superfluous, I
> keep it for now, so that people can put a special device easily at any
> time later again.
>
> Link:
> https://lore.kernel.org/r/CAOsVg8rA61B=005_VyUwpw3piVwA7Bo5fs1GYEB054efyzGjLw@mail.gmail.com
> Link: https://lore.kernel.org/r/20210414083255.9527-1-tiwai@suse.de
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=212519
> Tested-by: Lucas Endres <jaffa225man@gmail.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/implicit.c | 92 +++++++++++++++++++++++++++++---------------
>  1 file changed, 62 insertions(+), 30 deletions(-)
>
> diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
> index 94acfaa7f2ef..590a0dbba7a2 100644
> --- a/sound/usb/implicit.c
> +++ b/sound/usb/implicit.c
> @@ -79,15 +79,6 @@ static const struct snd_usb_implicit_fb_match
> playback_implicit_fb_quirks[] = {
>
>  /* Implicit feedback quirk table for capture: only FIXED type */
>  static const struct snd_usb_implicit_fb_match
> capture_implicit_fb_quirks[] = {
> -       IMPLICIT_FB_BOTH_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
> -       IMPLICIT_FB_BOTH_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
> -       IMPLICIT_FB_BOTH_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
> -       IMPLICIT_FB_BOTH_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2
> */
> -       IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
> -       IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
> -       IMPLICIT_FB_BOTH_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
> -       IMPLICIT_FB_BOTH_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
> -
>         {} /* terminator */
>  };
>
> @@ -145,30 +136,70 @@ static int add_generic_uac2_implicit_fb(struct
> snd_usb_audio *chip,
>                                        ifnum, alts);
>  }
>
> -/* Like the function above, but specific to Roland with vendor class and
> hack */
> +static bool roland_sanity_check_iface(struct usb_host_interface *alts)
> +{
> +       if (alts->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC ||
> +           (alts->desc.bInterfaceSubClass != 2 &&
> +            alts->desc.bInterfaceProtocol != 2) ||
> +           alts->desc.bNumEndpoints < 1)
> +               return false;
> +       return true;
> +}
> +
> +/* Like the UAC2 case above, but specific to Roland with vendor class and
> hack */
>  static int add_roland_implicit_fb(struct snd_usb_audio *chip,
>                                   struct audioformat *fmt,
> -                                 unsigned int ifnum,
> -                                 unsigned int altsetting)
> +                                 struct usb_host_interface *alts)
>  {
> -       struct usb_host_interface *alts;
>         struct usb_endpoint_descriptor *epd;
>
> -       alts = snd_usb_get_host_interface(chip, ifnum, altsetting);
> -       if (!alts)
> +       if (!roland_sanity_check_iface(alts))
>                 return 0;
> -       if (alts->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC ||
> -           (alts->desc.bInterfaceSubClass != 2 &&
> -            alts->desc.bInterfaceProtocol != 2) ||
> -           alts->desc.bNumEndpoints < 1)
> +       /* only when both streams are with ASYNC type */
> +       epd = get_endpoint(alts, 0);
> +       if (!usb_endpoint_is_isoc_out(epd) ||
> +           (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=
> USB_ENDPOINT_SYNC_ASYNC)
> +               return 0;
> +
> +       /* check capture EP */
> +       alts = snd_usb_get_host_interface(chip,
> +                                         alts->desc.bInterfaceNumber + 1,
> +                                         alts->desc.bAlternateSetting);
> +       if (!alts || !roland_sanity_check_iface(alts))
>                 return 0;
>         epd = get_endpoint(alts, 0);
>         if (!usb_endpoint_is_isoc_in(epd) ||
> -           (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
> -                                       USB_ENDPOINT_USAGE_IMPLICIT_FB)
> +           (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=
> USB_ENDPOINT_SYNC_ASYNC)
>                 return 0;
> +       chip->playback_first = 1;
>         return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress, 0,
> -                                      ifnum, alts);
> +                                      alts->desc.bInterfaceNumber, alts);
> +}
> +
> +/* capture quirk for Roland device; always full-duplex */
> +static int add_roland_capture_quirk(struct snd_usb_audio *chip,
> +                                   struct audioformat *fmt,
> +                                   struct usb_host_interface *alts)
> +{
> +       struct usb_endpoint_descriptor *epd;
> +
> +       if (!roland_sanity_check_iface(alts))
> +               return 0;
> +       epd = get_endpoint(alts, 0);
> +       if (!usb_endpoint_is_isoc_in(epd) ||
> +           (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=
> USB_ENDPOINT_SYNC_ASYNC)
> +               return 0;
> +
> +       alts = snd_usb_get_host_interface(chip,
> +                                         alts->desc.bInterfaceNumber - 1,
> +                                         alts->desc.bAlternateSetting);
> +       if (!alts || !roland_sanity_check_iface(alts))
> +               return 0;
> +       epd = get_endpoint(alts, 0);
> +       if (!usb_endpoint_is_isoc_out(epd))
> +               return 0;
> +       return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress, 0,
> +                                      alts->desc.bInterfaceNumber, alts);
>  }
>
>  /* Playback and capture EPs on Pioneer devices share the same iface/altset
> @@ -306,14 +337,8 @@ static int audioformat_implicit_fb_quirk(struct
> snd_usb_audio *chip,
>         }
>
>         /* Roland/BOSS implicit feedback with vendor spec class */
> -       if (attr == USB_ENDPOINT_SYNC_ASYNC &&
> -           alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
> -           alts->desc.bInterfaceProtocol == 2 &&
> -           alts->desc.bNumEndpoints == 1 &&
> -           USB_ID_VENDOR(chip->usb_id) == 0x0582 /* Roland */) {
> -               if (add_roland_implicit_fb(chip, fmt,
> -                                          alts->desc.bInterfaceNumber + 1,
> -                                          alts->desc.bAlternateSetting))
> +       if (USB_ID_VENDOR(chip->usb_id) == 0x0582) {
> +               if (add_roland_implicit_fb(chip, fmt, alts) > 0)
>                         return 1;
>         }
>
> @@ -345,6 +370,13 @@ static int audioformat_capture_quirk(struct
> snd_usb_audio *chip,
>         if (p && (p->type == IMPLICIT_FB_FIXED || p->type ==
> IMPLICIT_FB_BOTH))
>                 return add_implicit_fb_sync_ep(chip, fmt, p->ep_num, 0,
>                                                p->iface, NULL);
> +
> +       /* Roland/BOSS need full-duplex streams */
> +       if (USB_ID_VENDOR(chip->usb_id) == 0x0582) {
> +               if (add_roland_capture_quirk(chip, fmt, alts) > 0)
> +                       return 1;
> +       }
> +
>         if (is_pioneer_implicit_fb(chip, alts))
>                 return 1; /* skip the quirk, also don't handle generic
> sync EP */
>         return 0;
> --
> 2.26.2
>
>
