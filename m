Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8617735F702
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 17:10:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FDFA1670;
	Wed, 14 Apr 2021 17:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FDFA1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618413042;
	bh=GNkHwWB8SsdGD7V1UmcJR62RKFMpaEa/Gda1/BOODog=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pzq8t9+1VgkuTU1XGxX3lVTT3iBOKjg1uXAFGURTraq/DDvgoxvkLZZBQITWrZEoL
	 Zu/dIpYdMWl/OQ4dELkpc1IP+YZ0w7RpkbxQ93yK0A7thxZaFvOF3IDT/Gv8kVNX+C
	 wlqsaspq9lzDf5OyE0AfBvnSJmkvD4V9+GCnwdTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84E2FF8025B;
	Wed, 14 Apr 2021 17:09:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE816F80269; Wed, 14 Apr 2021 17:09:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,PRX_BODY_21,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B342F800FF
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 17:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B342F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="gtleQrWU"
Received: by mail-yb1-xb34.google.com with SMTP id v72so1777359ybe.11
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 08:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FWDRCpXeb/V65K/CYi7XDJ2NaOw2EARt/Xzh9pbZXqw=;
 b=gtleQrWU88ktKnRxs5n3tZatVRhE7Xlh6ViPhHnsnlSB1TWKdRkW4hxg2B7JghR725
 4s/TigOft48ztExL7QbJQTns0MDuNG2XW+u37aja8lgJM6KQDUWV7kathXC0VBQ4YI3K
 1b4FLgDnUjBCXGOwvIGfb7hkyMSH3c8exxlIc4oNe7Q23N1ecxPAuz7q1JE3S3ASDKC+
 6dcY8587kGM1lmZGVe+Sxpl4affm0K8Nr2csHbKeng9k5eafB0ADKcfYYkkPqwulUh+a
 5oMc8Toq7cfB5/jVtmrUvhdf4L8Up3VJL54LMbTOhP2EwWKclP3xibr5FgGEHi2WWVZQ
 6NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FWDRCpXeb/V65K/CYi7XDJ2NaOw2EARt/Xzh9pbZXqw=;
 b=pDKBPk7y9G2sIm8er/c3//bZ+Jm8euVzxMS2UoMhzwW2WxLiJjA1xSE2BDIFx6fa0o
 FqNzEqwDJkft7PSu3XfNQonMzrYwHz2DxbKMkZH5wB1oYRcBJZIa4SxdwpMkmmmNjtGc
 4+hQwBc4NdyF1vsdUtFj7gcvO+r1iYxjzvv54ljYnc5Ij7EZ9nzcT91QV2JXh5z2wQi3
 QtFyfyl6QQFHo4Rw+ryJ842F0RiFX5+RdF0WNDtQE4RV/0BElitV/lfHYIbMVI5P+dbb
 kwtIM/pW+yl5WA6zDxhR1zadsZJ45brU56ggyovg+kNYtUeKKsN2BIVT1vFSfArd/EXm
 1wfQ==
X-Gm-Message-State: AOAM532gvEc0sXAdnZdpQbd4z5t+k5e4kECAVk1oV3pxZJEdQ+swooBL
 ZzsaxJBOENoL768oav/e+/a8BuC+oULwaoGp221BsQ==
X-Google-Smtp-Source: ABdhPJxmjZsQm4W9+Hsz5bc6W1Y/P95jharqLlH+ocapgF+kQd0Dn291htV8wFuFDcp1S09Ou37PgR+R8svyWBxf9to=
X-Received: by 2002:a25:6906:: with SMTP id e6mr28188935ybc.417.1618412943254; 
 Wed, 14 Apr 2021 08:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210414083255.9527-1-tiwai@suse.de>
In-Reply-To: <20210414083255.9527-1-tiwai@suse.de>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Wed, 14 Apr 2021 08:08:54 -0700
Message-ID: <CAHXb3beNczUn-KWfO9P1Pa5+3piR8fDYHvoH5G08GmcvgR4Lxw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Apply implicit feedback mode for BOSS
 devices
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Keith Milner <kamilner@superlative.org>
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

Thanks for your help with this, Takashi.

I have tested this patch on BOSS GT-1 and BOSS Katana, so we have a fairly
high degree of confidence that it will work on the other BOSS devices.

It may well help with other similar Roland devices. If your device has
playback working, but with occasional pops/clicks in the audio stream, it
is worth trying to add the IMPLICIT_FB_BOTH_DEV quirk for the device.

Mike

On Wed, Apr 14, 2021 at 1:33 AM Takashi Iwai <tiwai@suse.de> wrote:

> During the recent rewrite of the implicit feedback support, we've
> tested to apply the implicit fb on BOSS devices, but it failed, as the
> capture stream didn't start without the playback.  As the end result,
> it got another type of quirk for tying both streams but starts
> playback always (commit 6234fdc1cede "ALSA: usb-audio: Quirk for BOSS
> GT-001").
>
> Meanwhile, Mike Oliphant has tested the real implicit feedback mode
> for the playback again with the latest code, and found out that it
> actually works if the initial feedback sync is skipped; that is, on
> those BOSS devices, the playback stream has to be started at first
> without waiting for the capture URB completions.  Otherwise it gets
> stuck.  In the rest operations after the capture stream processed, we
> can take them as the implicit feedback source.
>
> This patch is an attempt to improve the support for BOSS devices with
> the implicit feedback mode in the way described above.  It adds a new
> flag to snd_usb_audio, playback_first, indicating that the playback
> stream starts without sync with the initial capture completion.  This
> flag is set in the quirk table with the new IMPLICIT_FB_BOTH type.
>
> Reported-and-tested-by: Mike Oliphant <oliphant@nostatic.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/endpoint.c |  3 ++-
>  sound/usb/implicit.c | 35 +++++++++++++++++++++++------------
>  sound/usb/usbaudio.h |  1 +
>  3 files changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
> index 102d53515a76..f4c3d2b38abb 100644
> --- a/sound/usb/endpoint.c
> +++ b/sound/usb/endpoint.c
> @@ -1375,7 +1375,8 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint
> *ep)
>         if (!ep_state_update(ep, EP_STATE_STOPPED, EP_STATE_RUNNING))
>                 goto __error;
>
> -       if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
> +       if (snd_usb_endpoint_implicit_feedback_sink(ep) &&
> +           !ep->chip->playback_first) {
>                 for (i = 0; i < ep->nurbs; i++) {
>                         struct snd_urb_ctx *ctx = ep->urb + i;
>                         list_add_tail(&ctx->ready_list,
> &ep->ready_playback_urbs);
> diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
> index 19622c58b72b..4bd9c105a529 100644
> --- a/sound/usb/implicit.c
> +++ b/sound/usb/implicit.c
> @@ -21,6 +21,7 @@ enum {
>         IMPLICIT_FB_NONE,
>         IMPLICIT_FB_GENERIC,
>         IMPLICIT_FB_FIXED,
> +       IMPLICIT_FB_BOTH,       /* generic playback + capture (for BOSS) */
>  };
>
>  struct snd_usb_implicit_fb_match {
> @@ -36,6 +37,9 @@ struct snd_usb_implicit_fb_match {
>  #define IMPLICIT_FB_FIXED_DEV(vend, prod, ep, ifnum) \
>         { .id = USB_ID(vend, prod), .type = IMPLICIT_FB_FIXED, .ep_num =
> (ep),\
>             .iface = (ifnum) }
> +#define IMPLICIT_FB_BOTH_DEV(vend, prod, ep, ifnum) \
> +       { .id = USB_ID(vend, prod), .type = IMPLICIT_FB_BOTH, .ep_num =
> (ep),\
> +           .iface = (ifnum) }
>  #define IMPLICIT_FB_SKIP_DEV(vend, prod) \
>         { .id = USB_ID(vend, prod), .type = IMPLICIT_FB_NONE }
>
> @@ -75,14 +79,14 @@ static const struct snd_usb_implicit_fb_match
> playback_implicit_fb_quirks[] = {
>
>  /* Implicit feedback quirk table for capture: only FIXED type */
>  static const struct snd_usb_implicit_fb_match
> capture_implicit_fb_quirks[] = {
> -       IMPLICIT_FB_FIXED_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
> -       IMPLICIT_FB_FIXED_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505
> */
> -       IMPLICIT_FB_FIXED_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
> -       IMPLICIT_FB_FIXED_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS
> GT-100v2 */
> -       IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
> -       IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana
> */
> -       IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001
> */
> -       IMPLICIT_FB_FIXED_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
> +       IMPLICIT_FB_BOTH_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
> +       IMPLICIT_FB_BOTH_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
> +       IMPLICIT_FB_BOTH_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
> +       IMPLICIT_FB_BOTH_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2
> */
> +       IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
> +       IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
> +       IMPLICIT_FB_BOTH_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
> +       IMPLICIT_FB_BOTH_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
>
>         {} /* terminator */
>  };
> @@ -268,10 +272,17 @@ static int audioformat_implicit_fb_quirk(struct
> snd_usb_audio *chip,
>                 }
>         }
>
> -       /* Don't apply playback quirks for the devices with capture quirk
> */
> +       /* Special handling for devices with capture quirks */
>         p = find_implicit_fb_entry(chip, capture_implicit_fb_quirks, alts);
> -       if (p && p->type == IMPLICIT_FB_FIXED)
> -               return 0; /* no quirk */
> +       if (p) {
> +               switch (p->type) {
> +               case IMPLICIT_FB_FIXED:
> +                       return 0; /* no quirk */
> +               case IMPLICIT_FB_BOTH:
> +                       chip->playback_first = 1;
> +                       return add_generic_implicit_fb(chip, fmt, alts);
> +               }
> +       }
>
>         /* Generic UAC2 implicit feedback */
>         if (attr == USB_ENDPOINT_SYNC_ASYNC &&
> @@ -321,7 +332,7 @@ static int audioformat_capture_quirk(struct
> snd_usb_audio *chip,
>         const struct snd_usb_implicit_fb_match *p;
>
>         p = find_implicit_fb_entry(chip, capture_implicit_fb_quirks, alts);
> -       if (p && p->type == IMPLICIT_FB_FIXED)
> +       if (p && (p->type == IMPLICIT_FB_FIXED || p->type ==
> IMPLICIT_FB_BOTH))
>                 return add_implicit_fb_sync_ep(chip, fmt, p->ep_num, 0,
>                                                p->iface, NULL);
>         return 0;
> diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
> index a536ee33d36e..538831cbd925 100644
> --- a/sound/usb/usbaudio.h
> +++ b/sound/usb/usbaudio.h
> @@ -37,6 +37,7 @@ struct snd_usb_audio {
>         unsigned int txfr_quirk:1; /* Subframe boundaries on transfers */
>         unsigned int tx_length_quirk:1; /* Put length specifier in
> transfers */
>         unsigned int need_delayed_register:1; /* warn for delayed
> registration */
> +       unsigned int playback_first:1;  /* for implicit fb: don't wait for
> the first capture URBs */
>         int num_interfaces;
>         int num_suspended_intf;
>         int sample_rate_read_error;
> --
> 2.26.2
>
>
