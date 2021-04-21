Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD6C36705E
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 18:41:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7807166B;
	Wed, 21 Apr 2021 18:40:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7807166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619023310;
	bh=ZDw8gjJ8aaTS1pHwMVvW2xtkREPx7pVl4QhWDwSyg3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwuAGhxL1lxxqIkz+sjPc95EP0z+KBnalCWWWf7CCoAgZbtDOMpuDN/8iwXbOOoUv
	 kGyF/ym86jlT8QQGRczmn78d1JV1RSHg1BQ7gbZBiLSMqryj+ugWA45lJZud7fgD+d
	 /UP4lHcruuctXDvuSMQxl3gLRrSoGD/VRHw+3PlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4422DF80256;
	Wed, 21 Apr 2021 18:40:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11614F80227; Wed, 21 Apr 2021 18:40:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_14,SPF_HELO_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2622DF800E8
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 18:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2622DF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bsL4lg+J"
Received: by mail-ej1-x62e.google.com with SMTP id n2so64429741ejy.7
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cgp4+SDxj4+U1N/ri8UfNZW5T5EFCWcNorCdXQmVV7c=;
 b=bsL4lg+JnKn0i3p1vGScJFGutRGFPr8UU6sMqd9zktz3bcnumGbq68tdwkRh3vFFAh
 fMLSbR7JC+9FtP/Vj8wEZxAHEkuyTbW4Lj7eY4+on1GhlhkddU6mJDLkxTFbBG/byize
 GcF56rr7zFBM+CLmLGQGqSZQEtSZmCZ9Rh1i8mTxvZFjTuKAu7h0ed0QoUMxU8xn+XFo
 0suQ1zRLHLvqo/6qobXjfEUtH5pU41ute9lDfukkPMZpVxsOa8L8vQeo4Efnt34giEbZ
 Ab15k3g/R3RvIahKJ9vbSuMtc31h4i3yDYjHqvEmZ+cbHOQD3tDGU7xMlGBFHU/+jBy3
 bNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cgp4+SDxj4+U1N/ri8UfNZW5T5EFCWcNorCdXQmVV7c=;
 b=aXSGZE4sgvl+XQYBtdsYtLOKqvKNqqrqMJIK9UZoJN8fyAnE3UkI+WpX0z8hYxf7Kb
 RyUpGQoe6FwyE16s0P4xRHwkHYGBX8mgPXScxIRMYt/LiBEBrND9tSryVV6ps6sAQvBD
 I10wdg6sPpcei0yodJOWpdAF9Ure+nUbZUyDqQWBfi8c19xpng6wKGWqqyN+qNli+HLW
 x9JN4BNIHMaCo6YQOfCdnwzSw7ZgY7S4GxV9MMxvEL2w39ZVIj1+MappdX5OtzhB8XuS
 cqtcNaBipKgfjtVxzLlctLW9k986QXvS+JcWTwAfCts55PNJAsvIXHgdxf9/YozXKZz+
 XpBA==
X-Gm-Message-State: AOAM533v43xIlBvR6zfw9zRzo5/Lz6XLfpMTD0fvYf7+zjVnb4c+3BMx
 KBfl4+Vrgu/XTYwilpf3X1zZaLbHbJyVmhD0AM0=
X-Google-Smtp-Source: ABdhPJxArzGbDNZlSvxf1XA9NHPBK7T/orb73Ev8jzAIYR4wOdbcZGIagoQh0ixs6PY21smBg9mHIO4lkjLZpYAJyxk=
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr33953695ejf.25.1619023203610; 
 Wed, 21 Apr 2021 09:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210414083255.9527-1-tiwai@suse.de>
 <CAHXb3beNczUn-KWfO9P1Pa5+3piR8fDYHvoH5G08GmcvgR4Lxw@mail.gmail.com>
 <5949663.lOV4Wx5bFT@kam-desktop>
 <CAOsVg8p=yikaRQ-=RWdO8nWdC70tnw4kQ17KM-smShQvujrRJg@mail.gmail.com>
 <CAOsVg8pY80Vgi1XhzzFmQ4bBxK+1boksw7RM7_avMd4hqE0ERQ@mail.gmail.com>
 <s5h7dkwdib8.wl-tiwai@suse.de>
 <CAOsVg8qs+UZ2+G_0Pq=Vm87E+75jYg4Fg4eAaNTJzs=wFE5WAw@mail.gmail.com>
 <s5hlf9cau80.wl-tiwai@suse.de>
In-Reply-To: <s5hlf9cau80.wl-tiwai@suse.de>
From: Lucas <jaffa225man@gmail.com>
Date: Wed, 21 Apr 2021 11:39:51 -0500
Message-ID: <CAOsVg8rCkpBAKkuqUGxt55xGo4D=7RZC_A7CAbQgpG1yLWtHVw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Apply implicit feedback mode for BOSS
 devices
To: Takashi Iwai <tiwai@suse.de>
Content-Type: multipart/mixed; boundary="000000000000ef84c305c07e36d5"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, "Keith A. Milner" <maillist@superlative.org>
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

--000000000000ef84c305c07e36d5
Content-Type: text/plain; charset="UTF-8"

I'll have to try the revised patch later tonight when I have time, but for
now, I'm attaching the requested lsusb -v outputs.  The only one I left out
was the UA-101, due to its other driver.

Yes, with the previous IMPLICIT_FB_BOTH_DEV capture table entries, the
INTEGRA-7, R-26, and Boutique D-05 all worked on their highest sample rates.

I love that this probably will be working automatically for everything
Roland/BOSS/EDIROL in the end!

Thanks for your continued efforts Takashi!,

  Lucas

On Wed, Apr 21, 2021 at 3:59 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 21 Apr 2021 06:59:51 +0200,
> Lucas wrote:
> >
> > First, thanks very much for trying to cover all devices through
> detection!  I
> > had hoped something like this could be done, but sadly, it has created a
> mixed
> > result:
> >
> > Roland VG-99 Perfect!:
> > arecord -D hw:VG99 -f S24_3LE -r 44100 -c 2 ./file.wav
> > Recording WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
> > 44100 Hz, Stereo
> > ^CAborted by signal Interrupt...
> >
> > aplay -D hw:VG99 -f S24_3LE -r 44100 -c 2 ./file.wav
> > Playing WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
> 44100
> > Hz, Stereo
> >
> > Roland INTEGRA-7 doesn't capture, but plays perfectly (only 96 kHz mode
> > tested):
> > arecord -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./file.wav
> > Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
> > Stereo
> > arecord: pcm_read:2153: read error: Input/output error
> >
> > aplay -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./other-file.wav
> > Playing WAVE './other-file.wav' : Signed 32 bit Little Endian, Rate
> 96000 Hz,
> > Stereo
>
> Hm, that's bad.  And INTEGRA7 did work before the patching?
> I saw that this has the right EP numbers (0x0d and 0x8e), so the
> static quirk entry was correct.
>
> >
> > Roland R-26 doesn't capture, but plays perfectly (only 96 kHz mode
> tested):
>
> R-26 seems also to be the one with both ASYNC and EP 0x0d/0x8e, so the
> same reason as INTEGRA7.
>
> > arecord -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./file.wav
> > Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
> > Stereo
> > arecord: pcm_read:2153: read error: Input/output error
> >
> > aplay -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./other-file.wav
> > Playing WAVE './other-file.wav' : Signed 32 bit Little Endian, Rate
> 96000 Hz,
> > Stereo
> >
> > Roland Boutique D-05 doesn't capture, but plays perfectly:
>
> OK, this one looks slightly different.
> D-05 has two EPs in each interface, both are ASYNC and 0x0d/0x8e.
> So another adjustment might be needed here.
>
> > EDIROL UA-101 full-speed (USB 1.1) and high-speed (USB 2.0) not detected
> for
> > capture or playback (only 48 kHz mode tested):
>
> This is a different driver, so we can forget for now.
>
> > I'm guessing another look at "lsusb -v" would help, but don't know what
> to
> > look for and have run out of time tonight.
>
> Could you post the archive of your lsusb -v outputs?  Put in a tarball
> and post with attachment.
>
> Below is a revised patch.  Let me know if this works better.
>
>
> thanks,
>
> Takashi
>
>
> --- a/sound/usb/implicit.c
> +++ b/sound/usb/implicit.c
> @@ -79,6 +79,7 @@ static const struct snd_usb_implicit_fb_match
> playback_implicit_fb_quirks[] = {
>
>  /* Implicit feedback quirk table for capture: only FIXED type */
>  static const struct snd_usb_implicit_fb_match
> capture_implicit_fb_quirks[] = {
> +#if 0
>         IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a6, 0x0d, 0x01), /* Roland
> JUNO-G */
>         IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a9, 0x0d, 0x01), /* Roland
> MC-808 */
>         IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ad, 0x0d, 0x01), /* Roland
> SH-201 */
> @@ -146,6 +147,7 @@ static const struct snd_usb_implicit_fb_match
> capture_implicit_fb_quirks[] = {
>         IMPLICIT_FB_BOTH_DEV(0x0582, 0x01fd, 0x0d, 0x01), /* Roland
> Boutique SH-01A */
>         IMPLICIT_FB_BOTH_DEV(0x0582, 0x01ff, 0x0d, 0x01), /* Roland
> Boutique D-05 */
>         IMPLICIT_FB_BOTH_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
> +#endif
>
>         {} /* terminator */
>  };
> @@ -204,30 +206,70 @@ static int add_generic_uac2_implicit_fb(struct
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
> @@ -365,14 +407,8 @@ static int audioformat_implicit_fb_quirk(struct
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
> @@ -404,6 +440,13 @@ static int audioformat_capture_quirk(struct
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
>


-- 
Protect your digital freedom and privacy, eliminate DRM, learn more at
http://www.defectivebydesign.org/what_is_drm
On a related note, also see https://www.fsf.org/campaigns/surveillance

--000000000000ef84c305c07e36d5
Content-Type: application/x-tar; name="lsusb_-v.tar"
Content-Disposition: attachment; filename="lsusb_-v.tar"
Content-Transfer-Encoding: base64
Content-ID: <f_knroedd30>
X-Attachment-Id: f_knroedd30

bHN1c2JfLXYvAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA3NTUAMDAwMTc1
MAAwMDAwMTQ0ADAwMDAwMDAwMDAwADE0MDQwMDUxMjExADAxMTYyMgAgNQAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB1c3RhciAgAGx1Y2FzAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAdXNlcnMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABs
c3VzYl8tdi9FRElST0xfVUEtNEZYX2xzdXNiXy12LnR4dAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMDAwMDY0NAAwMDAxNzUw
ADAwMDAxNDQAMDAwMDAwMTQxNTQAMTQwNDAwNTA3MDIAMDE2MTUwACAwAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHVzdGFyICAAbHVjYXMAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAB1c2VycwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEJ1
cyAwMDEgRGV2aWNlIDAwNDogSUQgMDU4MjowMGEzIFJvbGFuZCBDb3JwLiBFRElST0wgVUEtNEZY
CkRldmljZSBEZXNjcmlwdG9yOgogIGJMZW5ndGggICAgICAgICAgICAgICAgMTgKICBiRGVzY3Jp
cHRvclR5cGUgICAgICAgICAxCiAgYmNkVVNCICAgICAgICAgICAgICAgMS4xMAogIGJEZXZpY2VD
bGFzcyAgICAgICAgICAyNTUgVmVuZG9yIFNwZWNpZmljIENsYXNzCiAgYkRldmljZVN1YkNsYXNz
ICAgICAgICAgMCAKICBiRGV2aWNlUHJvdG9jb2wgICAgICAgMjU1IAogIGJNYXhQYWNrZXRTaXpl
MCAgICAgICAgIDgKICBpZFZlbmRvciAgICAgICAgICAgMHgwNTgyIFJvbGFuZCBDb3JwLgogIGlk
UHJvZHVjdCAgICAgICAgICAweDAwYTMgRURJUk9MIFVBLTRGWAogIGJjZERldmljZSAgICAgICAg
ICAgIDEuMDAKICBpTWFudWZhY3R1cmVyICAgICAgICAgICAxIEVESVJPTAogIGlQcm9kdWN0ICAg
ICAgICAgICAgICAgIDIgVUEtNEZYCiAgaVNlcmlhbCAgICAgICAgICAgICAgICAgMCAKICBiTnVt
Q29uZmlndXJhdGlvbnMgICAgICAxCiAgQ29uZmlndXJhdGlvbiBEZXNjcmlwdG9yOgogICAgYkxl
bmd0aCAgICAgICAgICAgICAgICAgOQogICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgMgogICAg
d1RvdGFsTGVuZ3RoICAgICAgIDB4MDBjYQogICAgYk51bUludGVyZmFjZXMgICAgICAgICAgMwog
ICAgYkNvbmZpZ3VyYXRpb25WYWx1ZSAgICAgMQogICAgaUNvbmZpZ3VyYXRpb24gICAgICAgICAg
MCAKICAgIGJtQXR0cmlidXRlcyAgICAgICAgIDB4ODAKICAgICAgKEJ1cyBQb3dlcmVkKQogICAg
TWF4UG93ZXIgICAgICAgICAgICAgIDM2MG1BCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAg
ICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAg
ICA0CiAgICAgIGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDAKICAgICAgYkFsdGVybmF0ZVNldHRp
bmcgICAgICAgMAogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAwCiAgICAgIGJJbnRlcmZh
Y2VDbGFzcyAgICAgICAyNTUgVmVuZG9yIFNwZWNpZmljIENsYXNzCiAgICAgIGJJbnRlcmZhY2VT
dWJDbGFzcyAgICAgIDIgCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDIgCiAgICAgIGlJ
bnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAg
Ykxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0
CiAgICAgIGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDAKICAgICAgYkFsdGVybmF0ZVNldHRpbmcg
ICAgICAgMQogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAxCiAgICAgIGJJbnRlcmZhY2VD
bGFzcyAgICAgICAyNTUgVmVuZG9yIFNwZWNpZmljIENsYXNzCiAgICAgIGJJbnRlcmZhY2VTdWJD
bGFzcyAgICAgIDIgCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDIgCiAgICAgIGlJbnRl
cmZhY2UgICAgICAgICAgICAgIDAgCiAgICAgICoqIFVOUkVDT0dOSVpFRDogIDA3IDI0IDAxIDAx
IDAwIDAxIDAwCiAgICAgICoqIFVOUkVDT0dOSVpFRDogIDBiIDI0IDAyIDAxIDAyIDAzIDE4IDAx
IDgwIGJiIDAwCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAg
ICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDUKICAgICAgICBi
RW5kcG9pbnRBZGRyZXNzICAgICAweDAxICBFUCAxIE9VVAogICAgICAgIGJtQXR0cmlidXRlcyAg
ICAgICAgICAgIDkKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBJc29jaHJvbm91
cwogICAgICAgICAgU3luY2ggVHlwZSAgICAgICAgICAgICAgIEFkYXB0aXZlCiAgICAgICAgICBV
c2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAw
eDAxNDAgIDF4IDMyMCBieXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAgIDEKICAg
IEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAg
ICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAg
ICAgMAogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAyCiAgICAgIGJOdW1FbmRwb2ludHMg
ICAgICAgICAgIDEKICAgICAgYkludGVyZmFjZUNsYXNzICAgICAgIDI1NSBWZW5kb3IgU3BlY2lm
aWMgQ2xhc3MKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAgMiAKICAgICAgYkludGVyZmFj
ZVByb3RvY29sICAgICAgMiAKICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAgICAg
KiogVU5SRUNPR05JWkVEOiAgMDcgMjQgMDEgMDIgMDAgMDEgMjAKICAgICAgKiogVU5SRUNPR05J
WkVEOiAgMGIgMjQgMDIgMDMgMDIgMDMgMTggMDEgODAgYmIgMDAKICAgICAgRW5kcG9pbnQgRGVz
Y3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2Ny
aXB0b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4MDEgIEVQ
IDEgT1VUCiAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAgOQogICAgICAgICAgVHJhbnNm
ZXIgVHlwZSAgICAgICAgICAgIElzb2Nocm9ub3VzCiAgICAgICAgICBTeW5jaCBUeXBlICAgICAg
ICAgICAgICAgQWRhcHRpdmUKICAgICAgICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBEYXRh
CiAgICAgICAgd01heFBhY2tldFNpemUgICAgIDB4MDEzOCAgMXggMzEyIGJ5dGVzCiAgICAgICAg
YkludGVydmFsICAgICAgICAgICAgICAgMQogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAg
IGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAg
NAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAxCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5n
ICAgICAgIDAKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMAogICAgICBiSW50ZXJmYWNl
Q2xhc3MgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBDbGFzcwogICAgICBiSW50ZXJmYWNlU3Vi
Q2xhc3MgICAgICAyIAogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAxIAogICAgICBpSW50
ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJM
ZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAog
ICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAxCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAg
ICAgIDEKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMQogICAgICBiSW50ZXJmYWNlQ2xh
c3MgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBDbGFzcwogICAgICBiSW50ZXJmYWNlU3ViQ2xh
c3MgICAgICAyIAogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAxIAogICAgICBpSW50ZXJm
YWNlICAgICAgICAgICAgICAwIAogICAgICAqKiBVTlJFQ09HTklaRUQ6ICAwNyAyNCAwMSAwNyAw
MCAwMSAwMAogICAgICAqKiBVTlJFQ09HTklaRUQ6ICAwYiAyNCAwMiAwMSAwMiAwMyAxOCAwMSA4
MCBiYiAwMAogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAg
ICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVu
ZHBvaW50QWRkcmVzcyAgICAgMHg4MiAgRVAgMiBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAg
ICAgICAgIDUKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBJc29jaHJvbm91cwog
ICAgICAgICAgU3luY2ggVHlwZSAgICAgICAgICAgICAgIEFzeW5jaHJvbm91cwogICAgICAgICAg
VXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAg
MHgwMTQwICAxeCAzMjAgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgICAxCiAg
ICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQog
ICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJbnRlcmZhY2VOdW1iZXIgICAg
ICAgIDIKICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMAogICAgICBiTnVtRW5kcG9pbnRz
ICAgICAgICAgICAyCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAgICAyNTUgVmVuZG9yIFNwZWNp
ZmljIENsYXNzCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDMgCiAgICAgIGJJbnRlcmZh
Y2VQcm90b2NvbCAgICAgIDAgCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICAg
ICoqIFVOUkVDT0dOSVpFRDogIDA2IDI0IGYxIDAyIDAxIDAxCiAgICAgIEVuZHBvaW50IERlc2Ny
aXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlw
dG9yVHlwZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDAzICBFUCAz
IE9VVAogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDIKICAgICAgICAgIFRyYW5zZmVy
IFR5cGUgICAgICAgICAgICBCdWxrCiAgICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAg
Tm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4
UGFja2V0U2l6ZSAgICAgMHgwMDIwICAxeCAzMiBieXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAg
ICAgICAgICAgIDAKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAg
ICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAg
IGJFbmRwb2ludEFkZHJlc3MgICAgIDB4ODQgIEVQIDQgSU4KICAgICAgICBibUF0dHJpYnV0ZXMg
ICAgICAgICAgICAyCiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAgQnVsawogICAg
ICAgICAgU3luY2ggVHlwZSAgICAgICAgICAgICAgIE5vbmUKICAgICAgICAgIFVzYWdlIFR5cGUg
ICAgICAgICAgICAgICBEYXRhCiAgICAgICAgd01heFBhY2tldFNpemUgICAgIDB4MDAyMCAgMXgg
MzIgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgICAwCiAgICBJbnRlcmZhY2Ug
RGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3Jp
cHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDIKICAgICAg
YkFsdGVybmF0ZVNldHRpbmcgICAgICAgMQogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAy
CiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAgICAyNTUgVmVuZG9yIFNwZWNpZmljIENsYXNzCiAg
ICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDMgCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAg
ICAgIDAgCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICAgIEVuZHBvaW50IERl
c2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNj
cmlwdG9yVHlwZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDAzICBF
UCAzIE9VVAogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDIKICAgICAgICAgIFRyYW5z
ZmVyIFR5cGUgICAgICAgICAgICBCdWxrCiAgICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAg
ICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3
TWF4UGFja2V0U2l6ZSAgICAgMHgwMDIwICAxeCAzMiBieXRlcwogICAgICAgIGJJbnRlcnZhbCAg
ICAgICAgICAgICAgIDEKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3Ro
ICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQogICAg
ICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4ODQgIEVQIDQgSU4KICAgICAgICBibUF0dHJpYnV0
ZXMgICAgICAgICAgICAzCiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAgSW50ZXJy
dXB0CiAgICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgTm9uZQogICAgICAgICAgVXNh
Z2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgw
MDIwICAxeCAzMiBieXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAgIDEKRGV2aWNl
IFN0YXR1czogICAgIDB4MDAwMAogIChCdXMgUG93ZXJlZCkKCgAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAbHN1c2JfLXYvRURJUk9M
X1VBLTI1RVhfbHN1c2JfLXYudHh0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA2NDQAMDAwMTc1MAAwMDAwMTQ0ADAwMDAw
MDEyNDUyADE0MDQwMDUwNjA2ADAxNjIzNAAgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAB1c3RhciAgAGx1Y2FzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdXNl
cnMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABCdXMgMDA0IERldmljZSAw
MDQ6IElEIDA1ODI6MDBlNiBSb2xhbmQgQ29ycC4gRURJUk9MIFVBLTI1RVggKEFkdmFuY2VkIG1v
ZGUpCkRldmljZSBEZXNjcmlwdG9yOgogIGJMZW5ndGggICAgICAgICAgICAgICAgMTgKICBiRGVz
Y3JpcHRvclR5cGUgICAgICAgICAxCiAgYmNkVVNCICAgICAgICAgICAgICAgMS4xMAogIGJEZXZp
Y2VDbGFzcyAgICAgICAgICAyNTUgVmVuZG9yIFNwZWNpZmljIENsYXNzCiAgYkRldmljZVN1YkNs
YXNzICAgICAgICAgMCAKICBiRGV2aWNlUHJvdG9jb2wgICAgICAgMjU1IAogIGJNYXhQYWNrZXRT
aXplMCAgICAgICAgIDgKICBpZFZlbmRvciAgICAgICAgICAgMHgwNTgyIFJvbGFuZCBDb3JwLgog
IGlkUHJvZHVjdCAgICAgICAgICAweDAwZTYgRURJUk9MIFVBLTI1RVggKEFkdmFuY2VkIG1vZGUp
CiAgYmNkRGV2aWNlICAgICAgICAgICAgMS4wMQogIGlNYW51ZmFjdHVyZXIgICAgICAgICAgIDEg
Um9sYW5kCiAgaVByb2R1Y3QgICAgICAgICAgICAgICAgMiBVQS0yNUVYCiAgaVNlcmlhbCAgICAg
ICAgICAgICAgICAgMCAKICBiTnVtQ29uZmlndXJhdGlvbnMgICAgICAxCiAgQ29uZmlndXJhdGlv
biBEZXNjcmlwdG9yOgogICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgYkRlc2NyaXB0
b3JUeXBlICAgICAgICAgMgogICAgd1RvdGFsTGVuZ3RoICAgICAgIDB4MDA5YgogICAgYk51bUlu
dGVyZmFjZXMgICAgICAgICAgMwogICAgYkNvbmZpZ3VyYXRpb25WYWx1ZSAgICAgMQogICAgaUNv
bmZpZ3VyYXRpb24gICAgICAgICAgMCAKICAgIGJtQXR0cmlidXRlcyAgICAgICAgIDB4ODAKICAg
ICAgKEJ1cyBQb3dlcmVkKQogICAgTWF4UG93ZXIgICAgICAgICAgICAgIDQ4MG1BCiAgICBJbnRl
cmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICBi
RGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDAK
ICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMAogICAgICBiTnVtRW5kcG9pbnRzICAgICAg
ICAgICAwCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAgICAyNTUgVmVuZG9yIFNwZWNpZmljIENs
YXNzCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDIgCiAgICAgIGJJbnRlcmZhY2VQcm90
b2NvbCAgICAgIDAgCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICBJbnRlcmZh
Y2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICBiRGVz
Y3JpcHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDAKICAg
ICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMQogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAg
ICAxCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAgICAyNTUgVmVuZG9yIFNwZWNpZmljIENsYXNz
CiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDIgCiAgICAgIGJJbnRlcmZhY2VQcm90b2Nv
bCAgICAgIDAgCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICAgICoqIFVOUkVD
T0dOSVpFRDogIDA3IDI0IDAxIDAxIDAwIDAxIDAwCiAgICAgICoqIFVOUkVDT0dOSVpFRDogIDBi
IDI0IDAyIDAxIDAyIDAzIDE4IDAxIDgwIGJiIDAwCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6
CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9yVHlw
ZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDAxICBFUCAxIE9VVAog
ICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDkKICAgICAgICAgIFRyYW5zZmVyIFR5cGUg
ICAgICAgICAgICBJc29jaHJvbm91cwogICAgICAgICAgU3luY2ggVHlwZSAgICAgICAgICAgICAg
IEFkYXB0aXZlCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAg
IHdNYXhQYWNrZXRTaXplICAgICAweDAxNDAgIDF4IDMyMCBieXRlcwogICAgICAgIGJJbnRlcnZh
bCAgICAgICAgICAgICAgIDEKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3Ro
ICAgICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAg
YkludGVyZmFjZU51bWJlciAgICAgICAgMQogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAw
CiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDAKICAgICAgYkludGVyZmFjZUNsYXNzICAg
ICAgIDI1NSBWZW5kb3IgU3BlY2lmaWMgQ2xhc3MKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAg
ICAgMiAKICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMCAKICAgICAgaUludGVyZmFjZSAg
ICAgICAgICAgICAgMCAKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAg
ICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAgYklu
dGVyZmFjZU51bWJlciAgICAgICAgMQogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAxCiAg
ICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDEKICAgICAgYkludGVyZmFjZUNsYXNzICAgICAg
IDI1NSBWZW5kb3IgU3BlY2lmaWMgQ2xhc3MKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAg
MiAKICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMCAKICAgICAgaUludGVyZmFjZSAgICAg
ICAgICAgICAgMCAKICAgICAgKiogVU5SRUNPR05JWkVEOiAgMDcgMjQgMDEgMDcgMDAgMDEgMDAK
ICAgICAgKiogVU5SRUNPR05JWkVEOiAgMGIgMjQgMDIgMDEgMDIgMDMgMTggMDEgODAgYmIgMDAK
ICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAg
ICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFk
ZHJlc3MgICAgIDB4ODIgIEVQIDIgSU4KICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAgICAgICA1
CiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAgSXNvY2hyb25vdXMKICAgICAgICAg
IFN5bmNoIFR5cGUgICAgICAgICAgICAgICBBc3luY2hyb25vdXMKICAgICAgICAgIFVzYWdlIFR5
cGUgICAgICAgICAgICAgICBEYXRhCiAgICAgICAgd01heFBhY2tldFNpemUgICAgIDB4MDE0MCAg
MXggMzIwIGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMQogICAgSW50ZXJm
YWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRl
c2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAyCiAg
ICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDAKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAg
ICAgMgogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBDbGFz
cwogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAzIAogICAgICBiSW50ZXJmYWNlUHJvdG9j
b2wgICAgICAwIAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgICBFbmRwb2lu
dCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAgICBi
RGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHgw
MyAgRVAgMyBPVVQKICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAgICAgICAyCiAgICAgICAgICBU
cmFuc2ZlciBUeXBlICAgICAgICAgICAgQnVsawogICAgICAgICAgU3luY2ggVHlwZSAgICAgICAg
ICAgICAgIE5vbmUKICAgICAgICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBEYXRhCiAgICAg
ICAgd01heFBhY2tldFNpemUgICAgIDB4MDAyMCAgMXggMzIgYnl0ZXMKICAgICAgICBiSW50ZXJ2
YWwgICAgICAgICAgICAgICAwCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAgYkxl
bmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDUK
ICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDg0ICBFUCA0IElOCiAgICAgICAgYm1BdHRy
aWJ1dGVzICAgICAgICAgICAgMgogICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAgIEJ1
bGsKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBVc2Fn
ZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAw
MjAgIDF4IDMyIGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMAogICAgSW50
ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAg
YkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAy
CiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDEKICAgICAgYk51bUVuZHBvaW50cyAgICAg
ICAgICAgMgogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBD
bGFzcwogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAzIAogICAgICBiSW50ZXJmYWNlUHJv
dG9jb2wgICAgICAwIAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgICBFbmRw
b2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAg
ICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAg
MHgwMyAgRVAgMyBPVVQKICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAgICAgICAyCiAgICAgICAg
ICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAgQnVsawogICAgICAgICAgU3luY2ggVHlwZSAgICAg
ICAgICAgICAgIE5vbmUKICAgICAgICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBEYXRhCiAg
ICAgICAgd01heFBhY2tldFNpemUgICAgIDB4MDAyMCAgMXggMzIgYnl0ZXMKICAgICAgICBiSW50
ZXJ2YWwgICAgICAgICAgICAgICAxCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAg
Ykxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAg
IDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDg0ICBFUCA0IElOCiAgICAgICAgYm1B
dHRyaWJ1dGVzICAgICAgICAgICAgMwogICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAg
IEludGVycnVwdAogICAgICAgICAgU3luY2ggVHlwZSAgICAgICAgICAgICAgIE5vbmUKICAgICAg
ICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBEYXRhCiAgICAgICAgd01heFBhY2tldFNpemUg
ICAgIDB4MDAyMCAgMXggMzIgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgICAx
CkRldmljZSBTdGF0dXM6ICAgICAweDAwMDAKICAoQnVzIFBvd2VyZWQpCgoAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAbHN1c2JfLXYvUm9sYW5kX0QtMDVfbHN1c2Jf
LXYudHh0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAADAwMDA2NDQAMDAwMTc1MAAwMDAwMTQ0ADAwMDAwMDE3Mzc1ADE0MDQw
MDUxMDAzADAxNjExNQAgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAB1c3RhciAgAGx1Y2FzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdXNlcnMAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABCdXMgMDAxIERldmljZSAwMDU6IElEIDA1ODI6
MDFmZiBSb2xhbmQgQ29ycC4gQm91dGlxdWUKRGV2aWNlIERlc2NyaXB0b3I6CiAgYkxlbmd0aCAg
ICAgICAgICAgICAgICAxOAogIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDEKICBiY2RVU0IgICAg
ICAgICAgICAgICAyLjAwCiAgYkRldmljZUNsYXNzICAgICAgICAgIDI1NSBWZW5kb3IgU3BlY2lm
aWMgQ2xhc3MKICBiRGV2aWNlU3ViQ2xhc3MgICAgICAgICAwIAogIGJEZXZpY2VQcm90b2NvbCAg
ICAgICAyNTUgCiAgYk1heFBhY2tldFNpemUwICAgICAgICA2NAogIGlkVmVuZG9yICAgICAgICAg
ICAweDA1ODIgUm9sYW5kIENvcnAuCiAgaWRQcm9kdWN0ICAgICAgICAgIDB4MDFmZiAKICBiY2RE
ZXZpY2UgICAgICAgICAgICAxLjAwCiAgaU1hbnVmYWN0dXJlciAgICAgICAgICAgMSBSb2xhbmQK
ICBpUHJvZHVjdCAgICAgICAgICAgICAgICAyIEJvdXRpcXVlCiAgaVNlcmlhbCAgICAgICAgICAg
ICAgICAgMyBCUV9EMzgyRERBMDU0QjU1MzMzMjFDMUYxNzQzCiAgYk51bUNvbmZpZ3VyYXRpb25z
ICAgICAgMQogIENvbmZpZ3VyYXRpb24gRGVzY3JpcHRvcjoKICAgIGJMZW5ndGggICAgICAgICAg
ICAgICAgIDkKICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDIKICAgIHdUb3RhbExlbmd0aCAg
ICAgICAweDAxMGUKICAgIGJOdW1JbnRlcmZhY2VzICAgICAgICAgIDQKICAgIGJDb25maWd1cmF0
aW9uVmFsdWUgICAgIDEKICAgIGlDb25maWd1cmF0aW9uICAgICAgICAgIDAgCiAgICBibUF0dHJp
YnV0ZXMgICAgICAgICAweDgwCiAgICAgIChCdXMgUG93ZXJlZCkKICAgIE1heFBvd2VyICAgICAg
ICAgICAgICA1MDBtQQogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAg
ICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50
ZXJmYWNlTnVtYmVyICAgICAgICAwCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDAKICAg
ICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMAogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAg
MjU1IFZlbmRvciBTcGVjaWZpYyBDbGFzcwogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgMjU1
IFZlbmRvciBTcGVjaWZpYyBTdWJjbGFzcwogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAw
IAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgSW50ZXJmYWNlIERlc2NyaXB0
b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBl
ICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAxCiAgICAgIGJBbHRlcm5h
dGVTZXR0aW5nICAgICAgIDAKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMAogICAgICBi
SW50ZXJmYWNlQ2xhc3MgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBDbGFzcwogICAgICBiSW50
ZXJmYWNlU3ViQ2xhc3MgICAgICAyIAogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAyIAog
ICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgICAqKiBVTlJFQ09HTklaRUQ6ICAw
NiAyNCBmMSAwMSAwMCAwMAogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGgg
ICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBi
SW50ZXJmYWNlTnVtYmVyICAgICAgICAxCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDEK
ICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMQogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAg
ICAgMjU1IFZlbmRvciBTcGVjaWZpYyBDbGFzcwogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAg
ICAyIAogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAyIAogICAgICBpSW50ZXJmYWNlICAg
ICAgICAgICAgICAwIAogICAgICAqKiBVTlJFQ09HTklaRUQ6ICAwNyAyNCAwMSAwMSAwMCAwMSAw
MAogICAgICAqKiBVTlJFQ09HTklaRUQ6ICAwYiAyNCAwMiAwMSAwMiAwNCAxOCAwMSAwMCA3NyAw
MQogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAg
ICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50
QWRkcmVzcyAgICAgMHgwZCAgRVAgMTMgT1VUCiAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAg
ICAgNQogICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAgIElzb2Nocm9ub3VzCiAgICAg
ICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgQXN5bmNocm9ub3VzCiAgICAgICAgICBVc2Fn
ZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAw
NzAgIDF4IDExMiBieXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAgIDEKICAgICAg
ICBJTlRFUkZBQ0UgQ0xBU1M6ICAwNiAyNCBmMSAwNCAxMiAwMAogICAgSW50ZXJmYWNlIERlc2Ny
aXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JU
eXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAxCiAgICAgIGJBbHRl
cm5hdGVTZXR0aW5nICAgICAgIDIKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMQogICAg
ICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBDbGFzcwogICAgICBi
SW50ZXJmYWNlU3ViQ2xhc3MgICAgICAyIAogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAy
IAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgICAqKiBVTlJFQ09HTklaRUQ6
ICAwNyAyNCAwMSAwMSAwMCAwMSAwMAogICAgICAqKiBVTlJFQ09HTklaRUQ6ICAwYiAyNCAwMiAw
MSAwMiAwNCAxOCAwMSAwMCA3NyAwMQogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAg
IGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAg
ICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHgwZCAgRVAgMTMgT1VUCiAgICAgICAg
Ym1BdHRyaWJ1dGVzICAgICAgICAgICAgNQogICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAg
ICAgIElzb2Nocm9ub3VzCiAgICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgQXN5bmNo
cm9ub3VzCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdN
YXhQYWNrZXRTaXplICAgICAweDAwNzAgIDF4IDExMiBieXRlcwogICAgICAgIGJJbnRlcnZhbCAg
ICAgICAgICAgICAgIDEKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAg
ICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAgYklu
dGVyZmFjZU51bWJlciAgICAgICAgMgogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAwCiAg
ICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDAKICAgICAgYkludGVyZmFjZUNsYXNzICAgICAg
IDI1NSBWZW5kb3IgU3BlY2lmaWMgQ2xhc3MKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAg
MiAKICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMSAKICAgICAgaUludGVyZmFjZSAgICAg
ICAgICAgICAgMCAKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAgICAg
ICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAgYkludGVy
ZmFjZU51bWJlciAgICAgICAgMgogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAxCiAgICAg
IGJOdW1FbmRwb2ludHMgICAgICAgICAgIDEKICAgICAgYkludGVyZmFjZUNsYXNzICAgICAgIDI1
NSBWZW5kb3IgU3BlY2lmaWMgQ2xhc3MKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAgMiAK
ICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMSAKICAgICAgaUludGVyZmFjZSAgICAgICAg
ICAgICAgMCAKICAgICAgKiogVU5SRUNPR05JWkVEOiAgMDcgMjQgMDEgMDcgMDAgMDEgMDAKICAg
ICAgKiogVU5SRUNPR05JWkVEOiAgMGIgMjQgMDIgMDEgMDIgMDQgMTggMDEgMDAgNzcgMDEKICAg
ICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3
CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJl
c3MgICAgIDB4OGUgIEVQIDE0IElOCiAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAzNwog
ICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAgIElzb2Nocm9ub3VzCiAgICAgICAgICBT
eW5jaCBUeXBlICAgICAgICAgICAgICAgQXN5bmNocm9ub3VzCiAgICAgICAgICBVc2FnZSBUeXBl
ICAgICAgICAgICAgICAgSW1wbGljaXQgZmVlZGJhY2sgRGF0YQogICAgICAgIHdNYXhQYWNrZXRT
aXplICAgICAweDAwNzAgIDF4IDExMiBieXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAg
ICAgIDEKICAgICAgICBJTlRFUkZBQ0UgQ0xBU1M6ICAwNiAyNCBmMSAwNCAxMiAwMAogICAgSW50
ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAg
YkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAy
CiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDIKICAgICAgYk51bUVuZHBvaW50cyAgICAg
ICAgICAgMQogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBD
bGFzcwogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAyIAogICAgICBiSW50ZXJmYWNlUHJv
dG9jb2wgICAgICAxIAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgICAqKiBV
TlJFQ09HTklaRUQ6ICAwNyAyNCAwMSAwNyAwMCAwMSAwMAogICAgICAqKiBVTlJFQ09HTklaRUQ6
ICAwYiAyNCAwMiAwMSAwMiAwNCAxOCAwMSAwMCA3NyAwMQogICAgICBFbmRwb2ludCBEZXNjcmlw
dG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRv
clR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHg4ZSAgRVAgMTQg
SU4KICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAgICAgIDM3CiAgICAgICAgICBUcmFuc2ZlciBU
eXBlICAgICAgICAgICAgSXNvY2hyb25vdXMKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAg
ICAgICBBc3luY2hyb25vdXMKICAgICAgICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBJbXBs
aWNpdCBmZWVkYmFjayBEYXRhCiAgICAgICAgd01heFBhY2tldFNpemUgICAgIDB4MDA3MCAgMXgg
MTEyIGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMQogICAgSW50ZXJmYWNl
IERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2Ny
aXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAzCiAgICAg
IGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDAKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAg
MgogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBDbGFzcwog
ICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAzIAogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wg
ICAgICAwIAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgICAqKiBVTlJFQ09H
TklaRUQ6ICAwNiAyNCBmMSAwMiAwMSAwMQogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAg
ICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAg
ICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHgwMyAgRVAgMyBPVVQKICAgICAg
ICBibUF0dHJpYnV0ZXMgICAgICAgICAgICAyCiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAg
ICAgICAgQnVsawogICAgICAgICAgU3luY2ggVHlwZSAgICAgICAgICAgICAgIE5vbmUKICAgICAg
ICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBEYXRhCiAgICAgICAgd01heFBhY2tldFNpemUg
ICAgIDB4MDIwMCAgMXggNTEyIGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAg
MQogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAg
ICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50
QWRkcmVzcyAgICAgMHg4NCAgRVAgNCBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAg
IDIKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBCdWxrCiAgICAgICAgICBTeW5j
aCBUeXBlICAgICAgICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAg
ICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwMjAwICAxeCA1MTIgYnl0ZXMK
ICAgICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgICAwCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRv
cjoKICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUg
ICAgICAgICA0CiAgICAgIGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDMKICAgICAgYkFsdGVybmF0
ZVNldHRpbmcgICAgICAgMQogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAyCiAgICAgIGJJ
bnRlcmZhY2VDbGFzcyAgICAgICAyNTUgVmVuZG9yIFNwZWNpZmljIENsYXNzCiAgICAgIGJJbnRl
cmZhY2VTdWJDbGFzcyAgICAgIDMgCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDAgCiAg
ICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6
CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9yVHlw
ZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDAzICBFUCAzIE9VVAog
ICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDMKICAgICAgICAgIFRyYW5zZmVyIFR5cGUg
ICAgICAgICAgICBJbnRlcnJ1cHQKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBO
b25lCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQ
YWNrZXRTaXplICAgICAweDAwNDAgIDF4IDY0IGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAg
ICAgICAgICAgNAogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAg
ICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAg
YkVuZHBvaW50QWRkcmVzcyAgICAgMHg4NSAgRVAgNSBJTgogICAgICAgIGJtQXR0cmlidXRlcyAg
ICAgICAgICAgIDMKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBJbnRlcnJ1cHQK
ICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBVc2FnZSBU
eXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAwNDAg
IDF4IDY0IGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgNApEZXZpY2UgUXVh
bGlmaWVyIChmb3Igb3RoZXIgZGV2aWNlIHNwZWVkKToKICBiTGVuZ3RoICAgICAgICAgICAgICAg
IDEwCiAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNgogIGJjZFVTQiAgICAgICAgICAgICAgIDIu
MDAKICBiRGV2aWNlQ2xhc3MgICAgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBDbGFzcwogIGJE
ZXZpY2VTdWJDbGFzcyAgICAgICAgIDAgCiAgYkRldmljZVByb3RvY29sICAgICAgIDI1NSAKICBi
TWF4UGFja2V0U2l6ZTAgICAgICAgIDY0CiAgYk51bUNvbmZpZ3VyYXRpb25zICAgICAgMQpEZXZp
Y2UgU3RhdHVzOiAgICAgMHgwMDAwCiAgKEJ1cyBQb3dlcmVkKQoKAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAGxzdXNiXy12L1JvbGFuZF9JTlRFR1JBLTdfbHN1c2JfLXYudHh0AAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAw
MDAwNjQ0ADAwMDE3NTAAMDAwMDE0NAAwMDAwMDAxMzc3NgAxNDA0MDA1MTA1MAAwMTY3NTAAIDAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdXN0YXIgIABsdWNhcwAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHVzZXJzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAQnVzIDAwMiBEZXZpY2UgMDA1OiBJRCAwNTgyOjAxNWIgUm9sYW5kIENvcnAu
IElOVEVHUkEtNwpEZXZpY2UgRGVzY3JpcHRvcjoKICBiTGVuZ3RoICAgICAgICAgICAgICAgIDE4
CiAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgMQogIGJjZFVTQiAgICAgICAgICAgICAgIDIuMDAK
ICBiRGV2aWNlQ2xhc3MgICAgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBDbGFzcwogIGJEZXZp
Y2VTdWJDbGFzcyAgICAgICAgIDAgCiAgYkRldmljZVByb3RvY29sICAgICAgIDI1NSAKICBiTWF4
UGFja2V0U2l6ZTAgICAgICAgIDY0CiAgaWRWZW5kb3IgICAgICAgICAgIDB4MDU4MiBSb2xhbmQg
Q29ycC4KICBpZFByb2R1Y3QgICAgICAgICAgMHgwMTViIElOVEVHUkEtNwogIGJjZERldmljZSAg
ICAgICAgICAgIDEuMDAKICBpTWFudWZhY3R1cmVyICAgICAgICAgICAxIFJvbGFuZAogIGlQcm9k
dWN0ICAgICAgICAgICAgICAgIDIgSU5URUdSQS03CiAgaVNlcmlhbCAgICAgICAgICAgICAgICAg
MCAKICBiTnVtQ29uZmlndXJhdGlvbnMgICAgICAxCiAgQ29uZmlndXJhdGlvbiBEZXNjcmlwdG9y
OgogICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgYkRlc2NyaXB0b3JUeXBlICAgICAg
ICAgMgogICAgd1RvdGFsTGVuZ3RoICAgICAgIDB4MDBiMAogICAgYk51bUludGVyZmFjZXMgICAg
ICAgICAgNAogICAgYkNvbmZpZ3VyYXRpb25WYWx1ZSAgICAgMQogICAgaUNvbmZpZ3VyYXRpb24g
ICAgICAgICAgMCAKICAgIGJtQXR0cmlidXRlcyAgICAgICAgIDB4YzAKICAgICAgU2VsZiBQb3dl
cmVkCiAgICBNYXhQb3dlciAgICAgICAgICAgICAgICAwbUEKICAgIEludGVyZmFjZSBEZXNjcmlw
dG9yOgogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlw
ZSAgICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAgICAgMAogICAgICBiQWx0ZXJu
YXRlU2V0dGluZyAgICAgICAwCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDAKICAgICAg
YkludGVyZmFjZUNsYXNzICAgICAgIDI1NSBWZW5kb3IgU3BlY2lmaWMgQ2xhc3MKICAgICAgYklu
dGVyZmFjZVN1YkNsYXNzICAgIDI1NSBWZW5kb3IgU3BlY2lmaWMgU3ViY2xhc3MKICAgICAgYklu
dGVyZmFjZVByb3RvY29sICAgICAgMCAKICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAgMCAK
ICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5
CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAg
ICAgICAgMQogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAwCiAgICAgIGJOdW1FbmRwb2lu
dHMgICAgICAgICAgIDAKICAgICAgYkludGVyZmFjZUNsYXNzICAgICAgIDI1NSBWZW5kb3IgU3Bl
Y2lmaWMgQ2xhc3MKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAgMiAKICAgICAgYkludGVy
ZmFjZVByb3RvY29sICAgICAgMiAKICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAg
ICAgKiogVU5SRUNPR05JWkVEOiAgMDYgMjQgZjEgMDEgMDAgMDAKICAgIEludGVyZmFjZSBEZXNj
cmlwdG9yOgogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9y
VHlwZSAgICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAgICAgMQogICAgICBiQWx0
ZXJuYXRlU2V0dGluZyAgICAgICAxCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDEKICAg
ICAgYkludGVyZmFjZUNsYXNzICAgICAgIDI1NSBWZW5kb3IgU3BlY2lmaWMgQ2xhc3MKICAgICAg
YkludGVyZmFjZVN1YkNsYXNzICAgICAgMiAKICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAg
MiAKICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAgICAgKiogVU5SRUNPR05JWkVE
OiAgMDcgMjQgMDEgMDEgMDAgMDEgMDAKICAgICAgKiogVU5SRUNPR05JWkVEOiAgMGIgMjQgMDIg
MDEgMDIgMDQgMTggMDEgMDAgNzcgMDEKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAg
ICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAg
ICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4MGQgIEVQIDEzIE9VVAogICAgICAg
IGJtQXR0cmlidXRlcyAgICAgICAgICAgIDUKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAg
ICAgICBJc29jaHJvbm91cwogICAgICAgICAgU3luY2ggVHlwZSAgICAgICAgICAgICAgIEFzeW5j
aHJvbm91cwogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3
TWF4UGFja2V0U2l6ZSAgICAgMHgwMDcwICAxeCAxMTIgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwg
ICAgICAgICAgICAgICAxCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAg
ICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJ
bnRlcmZhY2VOdW1iZXIgICAgICAgIDIKICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMAog
ICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAwCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAg
ICAyNTUgVmVuZG9yIFNwZWNpZmljIENsYXNzCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAg
IDIgCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDEgCiAgICAgIGlJbnRlcmZhY2UgICAg
ICAgICAgICAgIDAgCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAgICAg
ICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJbnRl
cmZhY2VOdW1iZXIgICAgICAgIDIKICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMQogICAg
ICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAxCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAgICAy
NTUgVmVuZG9yIFNwZWNpZmljIENsYXNzCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDIg
CiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDEgCiAgICAgIGlJbnRlcmZhY2UgICAgICAg
ICAgICAgIDAgCiAgICAgICoqIFVOUkVDT0dOSVpFRDogIDA3IDI0IDAxIDA3IDAwIDAxIDAwCiAg
ICAgICoqIFVOUkVDT0dOSVpFRDogIDBiIDI0IDAyIDAxIDAyIDA0IDE4IDAxIDAwIDc3IDAxCiAg
ICAgIEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAg
NwogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRy
ZXNzICAgICAweDhlICBFUCAxNCBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgMzcK
ICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBJc29jaHJvbm91cwogICAgICAgICAg
U3luY2ggVHlwZSAgICAgICAgICAgICAgIEFzeW5jaHJvbm91cwogICAgICAgICAgVXNhZ2UgVHlw
ZSAgICAgICAgICAgICAgIEltcGxpY2l0IGZlZWRiYWNrIERhdGEKICAgICAgICB3TWF4UGFja2V0
U2l6ZSAgICAgMHgwMDcwICAxeCAxMTIgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwgICAgICAgICAg
ICAgICAxCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAgICAgICAgICAg
ICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJbnRlcmZhY2VO
dW1iZXIgICAgICAgIDMKICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMAogICAgICBiTnVt
RW5kcG9pbnRzICAgICAgICAgICAyCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAgICAyNTUgVmVu
ZG9yIFNwZWNpZmljIENsYXNzCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDMgCiAgICAg
IGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDAgCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAg
IDAgCiAgICAgICoqIFVOUkVDT0dOSVpFRDogIDA2IDI0IGYxIDAyIDAyIDAyCiAgICAgIEVuZHBv
aW50IERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAg
IGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAw
eDAzICBFUCAzIE9VVAogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDIKICAgICAgICAg
IFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBCdWxrCiAgICAgICAgICBTeW5jaCBUeXBlICAgICAg
ICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAg
ICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwMjAwICAxeCA1MTIgYnl0ZXMKICAgICAgICBiSW50
ZXJ2YWwgICAgICAgICAgICAgICAxCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAg
Ykxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAg
IDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDg0ICBFUCA0IElOCiAgICAgICAgYm1B
dHRyaWJ1dGVzICAgICAgICAgICAgMgogICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAg
IEJ1bGsKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBV
c2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAw
eDAyMDAgIDF4IDUxMiBieXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAgIDAKICAg
IEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAg
ICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAg
ICAgMwogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAxCiAgICAgIGJOdW1FbmRwb2ludHMg
ICAgICAgICAgIDIKICAgICAgYkludGVyZmFjZUNsYXNzICAgICAgIDI1NSBWZW5kb3IgU3BlY2lm
aWMgQ2xhc3MKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAgMyAKICAgICAgYkludGVyZmFj
ZVByb3RvY29sICAgICAgMCAKICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAgICAg
RW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAg
ICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3Mg
ICAgIDB4MDMgIEVQIDMgT1VUCiAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAgMgogICAg
ICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAgIEJ1bGsKICAgICAgICAgIFN5bmNoIFR5cGUg
ICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0
YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAyMDAgIDF4IDUxMiBieXRlcwogICAgICAg
IGJJbnRlcnZhbCAgICAgICAgICAgICAgIDEKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAg
ICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAg
ICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4ODUgIEVQIDUgSU4KICAgICAg
ICBibUF0dHJpYnV0ZXMgICAgICAgICAgICAzCiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAg
ICAgICAgSW50ZXJydXB0CiAgICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgTm9uZQog
ICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0
U2l6ZSAgICAgMHgwMjAwICAxeCA1MTIgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwgICAgICAgICAg
ICAgICAxCkRldmljZSBRdWFsaWZpZXIgKGZvciBvdGhlciBkZXZpY2Ugc3BlZWQpOgogIGJMZW5n
dGggICAgICAgICAgICAgICAgMTAKICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA2CiAgYmNkVVNC
ICAgICAgICAgICAgICAgMi4wMAogIGJEZXZpY2VDbGFzcyAgICAgICAgICAyNTUgVmVuZG9yIFNw
ZWNpZmljIENsYXNzCiAgYkRldmljZVN1YkNsYXNzICAgICAgICAgMCAKICBiRGV2aWNlUHJvdG9j
b2wgICAgICAgMjU1IAogIGJNYXhQYWNrZXRTaXplMCAgICAgICAgNjQKICBiTnVtQ29uZmlndXJh
dGlvbnMgICAgICAxCkRldmljZSBTdGF0dXM6ICAgICAweDAwMDEKICBTZWxmIFBvd2VyZWQKCgAA
bHN1c2JfLXYvUm9sYW5kX1ItMjZfbHN1c2JfLXYudHh0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA2NDQAMDAwMTc1
MAAwMDAwMTQ0ADAwMDAwMDA3NTExADE0MDQwMDUwNzUzADAxNjE0MAAgMAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB1c3RhciAgAGx1Y2FzAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAdXNlcnMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABC
dXMgMDAxIERldmljZSAwMDY6IElEIDA1ODI6MDEzZSBSb2xhbmQgQ29ycC4gUi0yNgpEZXZpY2Ug
RGVzY3JpcHRvcjoKICBiTGVuZ3RoICAgICAgICAgICAgICAgIDE4CiAgYkRlc2NyaXB0b3JUeXBl
ICAgICAgICAgMQogIGJjZFVTQiAgICAgICAgICAgICAgIDIuMDAKICBiRGV2aWNlQ2xhc3MgICAg
ICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBDbGFzcwogIGJEZXZpY2VTdWJDbGFzcyAgICAgICAg
IDAgCiAgYkRldmljZVByb3RvY29sICAgICAgIDI1NSAKICBiTWF4UGFja2V0U2l6ZTAgICAgICAg
IDY0CiAgaWRWZW5kb3IgICAgICAgICAgIDB4MDU4MiBSb2xhbmQgQ29ycC4KICBpZFByb2R1Y3Qg
ICAgICAgICAgMHgwMTNlIFItMjYKICBiY2REZXZpY2UgICAgICAgICAgICAwLjAwCiAgaU1hbnVm
YWN0dXJlciAgICAgICAgICAgMSBSb2xhbmQKICBpUHJvZHVjdCAgICAgICAgICAgICAgICAyIFIt
MjYoQVVESU8pCiAgaVNlcmlhbCAgICAgICAgICAgICAgICAgMCAKICBiTnVtQ29uZmlndXJhdGlv
bnMgICAgICAxCiAgQ29uZmlndXJhdGlvbiBEZXNjcmlwdG9yOgogICAgYkxlbmd0aCAgICAgICAg
ICAgICAgICAgOQogICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgMgogICAgd1RvdGFsTGVuZ3Ro
ICAgICAgIDB4MDA3YwogICAgYk51bUludGVyZmFjZXMgICAgICAgICAgMwogICAgYkNvbmZpZ3Vy
YXRpb25WYWx1ZSAgICAgMQogICAgaUNvbmZpZ3VyYXRpb24gICAgICAgICAgMCAKICAgIGJtQXR0
cmlidXRlcyAgICAgICAgIDB4ODAKICAgICAgKEJ1cyBQb3dlcmVkKQogICAgTWF4UG93ZXIgICAg
ICAgICAgICAgIDUwMG1BCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAg
ICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJ
bnRlcmZhY2VOdW1iZXIgICAgICAgIDAKICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMAog
ICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAwCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAg
ICAyNTUgVmVuZG9yIFNwZWNpZmljIENsYXNzCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAy
NTUgVmVuZG9yIFNwZWNpZmljIFN1YmNsYXNzCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAg
IDAgCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICBJbnRlcmZhY2UgRGVzY3Jp
cHRvcjoKICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5
cGUgICAgICAgICA0CiAgICAgIGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDEKICAgICAgYkFsdGVy
bmF0ZVNldHRpbmcgICAgICAgMAogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAwCiAgICAg
IGJJbnRlcmZhY2VDbGFzcyAgICAgICAyNTUgVmVuZG9yIFNwZWNpZmljIENsYXNzCiAgICAgIGJJ
bnRlcmZhY2VTdWJDbGFzcyAgICAgIDIgCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDIg
CiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICAgICoqIFVOUkVDT0dOSVpFRDog
IDA2IDI0IGYxIDAxIDAwIDAwCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0
aCAgICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAgICAg
IGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDEKICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAg
MQogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAxCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAg
ICAgICAyNTUgVmVuZG9yIFNwZWNpZmljIENsYXNzCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAg
ICAgIDIgCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDIgCiAgICAgIGlJbnRlcmZhY2Ug
ICAgICAgICAgICAgIDAgCiAgICAgICoqIFVOUkVDT0dOSVpFRDogIDA3IDI0IDAxIDAxIDAwIDAx
IDAwCiAgICAgICoqIFVOUkVDT0dOSVpFRDogIDBiIDI0IDAyIDAxIDAyIDA0IDE4IDAxIDAwIDc3
IDAxCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAg
ICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9p
bnRBZGRyZXNzICAgICAweDBkICBFUCAxMyBPVVQKICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAg
ICAgICA1CiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAgSXNvY2hyb25vdXMKICAg
ICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBBc3luY2hyb25vdXMKICAgICAgICAgIFVz
YWdlIFR5cGUgICAgICAgICAgICAgICBEYXRhCiAgICAgICAgd01heFBhY2tldFNpemUgICAgIDB4
MDA3MCAgMXggMTEyIGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMQogICAg
SW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAg
ICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAg
ICAyCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDAKICAgICAgYk51bUVuZHBvaW50cyAg
ICAgICAgICAgMAogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgMjU1IFZlbmRvciBTcGVjaWZp
YyBDbGFzcwogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAyIAogICAgICBiSW50ZXJmYWNl
UHJvdG9jb2wgICAgICAxIAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgSW50
ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAg
YkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAy
CiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDEKICAgICAgYk51bUVuZHBvaW50cyAgICAg
ICAgICAgMQogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBD
bGFzcwogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAyIAogICAgICBiSW50ZXJmYWNlUHJv
dG9jb2wgICAgICAxIAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgICAqKiBV
TlJFQ09HTklaRUQ6ICAwNyAyNCAwMSAwNyAwMCAwMSAwMAogICAgICAqKiBVTlJFQ09HTklaRUQ6
ICAwYiAyNCAwMiAwMSAwMiAwNCAxOCAwMSAwMCA3NyAwMQogICAgICBFbmRwb2ludCBEZXNjcmlw
dG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRv
clR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHg4ZSAgRVAgMTQg
SU4KICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAgICAgIDM3CiAgICAgICAgICBUcmFuc2ZlciBU
eXBlICAgICAgICAgICAgSXNvY2hyb25vdXMKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAg
ICAgICBBc3luY2hyb25vdXMKICAgICAgICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBJbXBs
aWNpdCBmZWVkYmFjayBEYXRhCiAgICAgICAgd01heFBhY2tldFNpemUgICAgIDB4MDA3MCAgMXgg
MTEyIGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMQpEZXZpY2UgUXVhbGlm
aWVyIChmb3Igb3RoZXIgZGV2aWNlIHNwZWVkKToKICBiTGVuZ3RoICAgICAgICAgICAgICAgIDEw
CiAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNgogIGJjZFVTQiAgICAgICAgICAgICAgIDIuMDAK
ICBiRGV2aWNlQ2xhc3MgICAgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBDbGFzcwogIGJEZXZp
Y2VTdWJDbGFzcyAgICAgICAgIDAgCiAgYkRldmljZVByb3RvY29sICAgICAgIDI1NSAKICBiTWF4
UGFja2V0U2l6ZTAgICAgICAgIDY0CiAgYk51bUNvbmZpZ3VyYXRpb25zICAgICAgMQpEZXZpY2Ug
U3RhdHVzOiAgICAgMHgwMDAwCiAgKEJ1cyBQb3dlcmVkKQoKAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAbHN1c2JfLXYv
Um9sYW5kX1ZHLTk5X2xzdXNiXy12LnR4dAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA2NDQAMDAwMTc1MAAwMDAwMTQ0
ADAwMDAwMDEyNTEwADE0MDQwMDUwNTQ3ADAxNjI2MQAgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAB1c3RhciAgAGx1Y2FzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAdXNlcnMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABCdXMgMDA0IERl
dmljZSAwMDM6IElEIDA1ODI6MDBiMiBSb2xhbmQgQ29ycC4gVkctOTkKRGV2aWNlIERlc2NyaXB0
b3I6CiAgYkxlbmd0aCAgICAgICAgICAgICAgICAxOAogIGJEZXNjcmlwdG9yVHlwZSAgICAgICAg
IDEKICBiY2RVU0IgICAgICAgICAgICAgICAxLjEwCiAgYkRldmljZUNsYXNzICAgICAgICAgIDI1
NSBWZW5kb3IgU3BlY2lmaWMgQ2xhc3MKICBiRGV2aWNlU3ViQ2xhc3MgICAgICAgICAwIAogIGJE
ZXZpY2VQcm90b2NvbCAgICAgICAyNTUgCiAgYk1heFBhY2tldFNpemUwICAgICAgICAgOAogIGlk
VmVuZG9yICAgICAgICAgICAweDA1ODIgUm9sYW5kIENvcnAuCiAgaWRQcm9kdWN0ICAgICAgICAg
IDB4MDBiMiBWRy05OQogIGJjZERldmljZSAgICAgICAgICAgIDEuMDAKICBpTWFudWZhY3R1cmVy
ICAgICAgICAgICAxIFJvbGFuZAogIGlQcm9kdWN0ICAgICAgICAgICAgICAgIDIgVkctOTkKICBp
U2VyaWFsICAgICAgICAgICAgICAgICAwIAogIGJOdW1Db25maWd1cmF0aW9ucyAgICAgIDEKICBD
b25maWd1cmF0aW9uIERlc2NyaXB0b3I6CiAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAg
ICBiRGVzY3JpcHRvclR5cGUgICAgICAgICAyCiAgICB3VG90YWxMZW5ndGggICAgICAgMHgwMGE3
CiAgICBiTnVtSW50ZXJmYWNlcyAgICAgICAgICAzCiAgICBiQ29uZmlndXJhdGlvblZhbHVlICAg
ICAxCiAgICBpQ29uZmlndXJhdGlvbiAgICAgICAgICAwIAogICAgYm1BdHRyaWJ1dGVzICAgICAg
ICAgMHhjMAogICAgICBTZWxmIFBvd2VyZWQKICAgIE1heFBvd2VyICAgICAgICAgICAgICAgIDJt
QQogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAg
IDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVy
ICAgICAgICAwCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDAKICAgICAgYk51bUVuZHBv
aW50cyAgICAgICAgICAgMAogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgMjU1IFZlbmRvciBT
cGVjaWZpYyBDbGFzcwogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAyIAogICAgICBiSW50
ZXJmYWNlUHJvdG9jb2wgICAgICAyIAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAog
ICAgICAqKiBVTlJFQ09HTklaRUQ6ICAwNiAyNCBmMSAwMSAwMCAwMAogICAgSW50ZXJmYWNlIERl
c2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0
b3JUeXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAwCiAgICAgIGJB
bHRlcm5hdGVTZXR0aW5nICAgICAgIDEKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMQog
ICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgMjU1IFZlbmRvciBTcGVjaWZpYyBDbGFzcwogICAg
ICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAyIAogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAg
ICAyIAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgICAqKiBVTlJFQ09HTkla
RUQ6ICAwNyAyNCAwMSAwMSAwMCAwMSAwMAogICAgICAqKiBVTlJFQ09HTklaRUQ6ICAwYiAyNCAw
MiAwMSAwMiAwMyAxOCAwMSA0NCBhYyAwMAogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAg
ICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAg
ICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHgwMSAgRVAgMSBPVVQKICAgICAg
ICBibUF0dHJpYnV0ZXMgICAgICAgICAgICA5CiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAg
ICAgICAgSXNvY2hyb25vdXMKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBBZGFw
dGl2ZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4
UGFja2V0U2l6ZSAgICAgMHgwMTIwICAxeCAyODggYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwgICAg
ICAgICAgICAgICAxCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAgICAg
ICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJbnRl
cmZhY2VOdW1iZXIgICAgICAgIDEKICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMAogICAg
ICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAwCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAgICAy
NTUgVmVuZG9yIFNwZWNpZmljIENsYXNzCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDIg
CiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDEgCiAgICAgIGlJbnRlcmZhY2UgICAgICAg
ICAgICAgIDAgCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAgICAgICAg
ICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJbnRlcmZh
Y2VOdW1iZXIgICAgICAgIDEKICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMQogICAgICBi
TnVtRW5kcG9pbnRzICAgICAgICAgICAxCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAgICAyNTUg
VmVuZG9yIFNwZWNpZmljIENsYXNzCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDIgCiAg
ICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDEgCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAg
ICAgIDAgCiAgICAgICoqIFVOUkVDT0dOSVpFRDogIDA3IDI0IDAxIDA3IDAwIDAxIDAwCiAgICAg
ICoqIFVOUkVDT0dOSVpFRDogIDBiIDI0IDAyIDAxIDAyIDAzIDE4IDAxIDQ0IGFjIDAwCiAgICAg
IEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNwog
ICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNz
ICAgICAweDgyICBFUCAyIElOCiAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAgNQogICAg
ICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAgIElzb2Nocm9ub3VzCiAgICAgICAgICBTeW5j
aCBUeXBlICAgICAgICAgICAgICAgQXN5bmNocm9ub3VzCiAgICAgICAgICBVc2FnZSBUeXBlICAg
ICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAxMjAgIDF4IDI4
OCBieXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAgIDEKICAgIEludGVyZmFjZSBE
ZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlw
dG9yVHlwZSAgICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAgICAgMgogICAgICBi
QWx0ZXJuYXRlU2V0dGluZyAgICAgICAwCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDIK
ICAgICAgYkludGVyZmFjZUNsYXNzICAgICAgIDI1NSBWZW5kb3IgU3BlY2lmaWMgQ2xhc3MKICAg
ICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAgMyAKICAgICAgYkludGVyZmFjZVByb3RvY29sICAg
ICAgMCAKICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAgICAgKiogVU5SRUNPR05J
WkVEOiAgMDYgMjQgZjEgMDIgMDIgMDIKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAg
ICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAg
ICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4MDMgIEVQIDMgT1VUCiAgICAgICAg
Ym1BdHRyaWJ1dGVzICAgICAgICAgICAgMgogICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAg
ICAgIEJ1bGsKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAgICAg
ICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAg
ICAweDAwMjAgIDF4IDMyIGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMAog
ICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAg
IDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRk
cmVzcyAgICAgMHg4NCAgRVAgNCBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDIK
ICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBCdWxrCiAgICAgICAgICBTeW5jaCBU
eXBlICAgICAgICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAg
IERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwMDIwICAxeCAzMiBieXRlcwogICAg
ICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAgIDAKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgog
ICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAg
ICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAgICAgMgogICAgICBiQWx0ZXJuYXRlU2V0
dGluZyAgICAgICAxCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDIKICAgICAgYkludGVy
ZmFjZUNsYXNzICAgICAgIDI1NSBWZW5kb3IgU3BlY2lmaWMgQ2xhc3MKICAgICAgYkludGVyZmFj
ZVN1YkNsYXNzICAgICAgMyAKICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMCAKICAgICAg
aUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAg
ICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAg
ICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4MDMgIEVQIDMgT1VUCiAgICAg
ICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAgMgogICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAg
ICAgICAgIEJ1bGsKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAg
ICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXpl
ICAgICAweDAwMjAgIDF4IDMyIGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAg
MAogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAg
ICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50
QWRkcmVzcyAgICAgMHg4NCAgRVAgNCBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAg
IDMKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBJbnRlcnJ1cHQKICAgICAgICAg
IFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAg
ICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAwMjAgIDF4IDMyIGJ5
dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMQpEZXZpY2UgU3RhdHVzOiAgICAg
MHgwMDAxCiAgU2VsZiBQb3dlcmVkCgoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==
--000000000000ef84c305c07e36d5--
