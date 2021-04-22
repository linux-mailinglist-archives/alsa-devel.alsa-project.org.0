Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFED36783A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 06:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68E121678;
	Thu, 22 Apr 2021 06:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68E121678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619064468;
	bh=F2yPbvW881Esm/v+JGjz3ZXJspQ/06Cz6uku9Tu16vo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KK0Q4EOxOEibu/XKXeulD7p4FXbRvY7U4Yb0FujWVEOgKLe3BTbQEmUBMVxqfCQib
	 /K4LH8mCQn/RALF70r6hjiC2g3zaGEaf6QXHTYNiHznS+87dqxjeCFKSatZ46Q8UKH
	 3ScGPfvvHAK0z+07rhGRv9P5jNu4avbcPQAPWsRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC0BFF80059;
	Thu, 22 Apr 2021 06:06:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC8FFF80253; Thu, 22 Apr 2021 06:06:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C43EF80059
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 06:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C43EF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VNXhn0VX"
Received: by mail-ej1-x629.google.com with SMTP id u21so66671500ejo.13
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 21:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W/H7a3JyIaESeI7d2BBxaJbZ1Awusg364LQ5hHnfRLs=;
 b=VNXhn0VXa5oLAVJfXJZJz0UIUUvq04wqJ+wJIV+JCmi+7pOsOtpjOPAp43LIs5Lut2
 ZXQMtft5lWse0PxPqwUZTsoQqKFCboxU13jOdF18VyomB8eutqQFVgkHVFROLYB/U2TY
 S00aaD6f7WBfGrCLbBYp8sihI0CqD7K+XROYcKe3HIc8F/jpJp9Ye+vRwwUY00Pptvvs
 cgEI5FNOiuD1EvWDB1p0GzadY4r06IQ51MkDB20+15DQIHGvy/fYK66fDITxVWk284+E
 freAC1728EB2azMmOKXCU2GpsJJfzOdOr+jQkoW07JD9+afqhSEiqhayY6yqej3JRsWK
 q7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W/H7a3JyIaESeI7d2BBxaJbZ1Awusg364LQ5hHnfRLs=;
 b=KzH/yaH3V7MvFL0//LoG+mUQzlvKbT3MYJm8aqSvc2PwC0sqmlTSQUez8PcCs3HSAy
 vS8QuwaFpMHVwSKljI6ERfxkg5OBoqYmar1KsuKV6RUUqAwfFu0l2lVCEhFhSOmAiULe
 JG+BS7CijCLq5QoUlUvD6AqZqTLxVHgp+iIwGnyv4jjFMYS3ywD/ecOA5vexzCgp+n6b
 ++Pjk7jM9zqZZzPOIjdpVAq/8nK9fXn30+fmlmx8TP3GWuo7bEOnQHLtjVP7nLzTBc+v
 W03Fs5/elttv5rpOwZjWJ1T09ZQE4206iQhSCk4AIbmUE4Me8E6jjaI8jbnFhEysDHZb
 +OTQ==
X-Gm-Message-State: AOAM533d5KND5Jw/Gnc5FCXHwUr4Ph4qg+PT2HS2fGdcdzFx1F1Yd9AE
 uiPiHEx/KWoBJ2Y0wvEHjlq55Ss6cRQzMT7Cqcc=
X-Google-Smtp-Source: ABdhPJywh+U6EYyF1EzaJhOeOK/+u5JAINrw0sGcJeXa5QHzee4zaFMEasWhJf9gt+OB/pPIV3Kq8ki8ZAnF5jsIjFs=
X-Received: by 2002:a17:906:81d5:: with SMTP id
 e21mr1187853ejx.134.1619064367636; 
 Wed, 21 Apr 2021 21:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210414083255.9527-1-tiwai@suse.de>
 <CAHXb3beNczUn-KWfO9P1Pa5+3piR8fDYHvoH5G08GmcvgR4Lxw@mail.gmail.com>
 <5949663.lOV4Wx5bFT@kam-desktop>
 <CAOsVg8p=yikaRQ-=RWdO8nWdC70tnw4kQ17KM-smShQvujrRJg@mail.gmail.com>
 <CAOsVg8pY80Vgi1XhzzFmQ4bBxK+1boksw7RM7_avMd4hqE0ERQ@mail.gmail.com>
 <s5h7dkwdib8.wl-tiwai@suse.de>
 <CAOsVg8qs+UZ2+G_0Pq=Vm87E+75jYg4Fg4eAaNTJzs=wFE5WAw@mail.gmail.com>
 <s5hlf9cau80.wl-tiwai@suse.de>
 <CAOsVg8rCkpBAKkuqUGxt55xGo4D=7RZC_A7CAbQgpG1yLWtHVw@mail.gmail.com>
In-Reply-To: <CAOsVg8rCkpBAKkuqUGxt55xGo4D=7RZC_A7CAbQgpG1yLWtHVw@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Wed, 21 Apr 2021 23:05:53 -0500
Message-ID: <CAOsVg8q8KNfaqW0bm90HHUcjqDMCU0etrNY7dhr8TuoMHYZcuA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Apply implicit feedback mode for BOSS
 devices
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
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

It does work perfectly now, thanks!

First, I just want to remind you that UA-1000/UA-101 seems enabled in
snd-usb-audio still (or I need to mix that patch with your last), as it
isn't detected for either capture or playback.

Here are the specifics tested:

Roland VG-99 Perfect!:
arecord -D hw:VG99 -f S24_3LE -r 44100 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
44100 Hz, Stereo
^CAborted by signal Interrupt...

aplay -D hw:VG99 -f S24_3LE -r 44100 -c 2 ./file.wav
Playing WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
44100 Hz, Stereo


Roland INTEGRA-7 Perfect! (only 96 kHz mode tested):
arecord -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
Stereo
^CAborted by signal Interrupt...

aplay -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./file.wav
Playing WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
Stereo


Roland R-26 Perfect! (only 96 kHz mode tested):
arecord -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
Stereo
^CAborted by signal Interrupt...

aplay -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./file.wav
Playing WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
Stereo


Roland Boutique D-05 Perfect!:
arecord -D hw:Boutique -f S32_LE -r 96000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
Stereo
^CAborted by signal Interrupt...

aplay -D hw:Boutique -f S32_LE -r 96000 -c 2 ./file.wav
Playing WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
Stereo


EDIROL UA-4FX Perfect! (only tested 48 kHz mode):
arecord -D hw:UA4FX -f S24_3LE -r 48000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo

aplay -D hw:UA4FX -f S24_3LE -r 48000 -c 2 ./file.wav
Playing WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo


EDIROL UA-25EX Perfect! (only tested 48 kHz mode):
arecord -D hw:UA25EX -f S24_3LE -r 48000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo

aplay -D hw:UA25EX -f S24_3LE -r 48000 -c 2 ./file.wav
Playing WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo


Unless you decide to simplify it, no improvements seem necessary.
Thanks for your grand achievement, Takahashi!

I really appreciate it!,

  Lucas

On Wed, Apr 21, 2021 at 3:59 AM Takashi Iwai <tiwai@suse.de> wrote:

> Below is a revised patch.  Let me know if this works better.
>>
>>
>> thanks,
>>
>> Takashi
>>
>>
>> --- a/sound/usb/implicit.c
>> +++ b/sound/usb/implicit.c
>> @@ -79,6 +79,7 @@ static const struct snd_usb_implicit_fb_match
>> playback_implicit_fb_quirks[] = {
>>
>>  /* Implicit feedback quirk table for capture: only FIXED type */
>>  static const struct snd_usb_implicit_fb_match
>> capture_implicit_fb_quirks[] = {
>> +#if 0
>>         IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a6, 0x0d, 0x01), /* Roland
>> JUNO-G */
>>         IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a9, 0x0d, 0x01), /* Roland
>> MC-808 */
>>         IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ad, 0x0d, 0x01), /* Roland
>> SH-201 */
>> @@ -146,6 +147,7 @@ static const struct snd_usb_implicit_fb_match
>> capture_implicit_fb_quirks[] = {
>>         IMPLICIT_FB_BOTH_DEV(0x0582, 0x01fd, 0x0d, 0x01), /* Roland
>> Boutique SH-01A */
>>         IMPLICIT_FB_BOTH_DEV(0x0582, 0x01ff, 0x0d, 0x01), /* Roland
>> Boutique D-05 */
>>         IMPLICIT_FB_BOTH_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
>> +#endif
>>
>>         {} /* terminator */
>>  };
>> @@ -204,30 +206,70 @@ static int add_generic_uac2_implicit_fb(struct
>> snd_usb_audio *chip,
>>                                        ifnum, alts);
>>  }
>>
>> -/* Like the function above, but specific to Roland with vendor class and
>> hack */
>> +static bool roland_sanity_check_iface(struct usb_host_interface *alts)
>> +{
>> +       if (alts->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC ||
>> +           (alts->desc.bInterfaceSubClass != 2 &&
>> +            alts->desc.bInterfaceProtocol != 2) ||
>> +           alts->desc.bNumEndpoints < 1)
>> +               return false;
>> +       return true;
>> +}
>> +
>> +/* Like the UAC2 case above, but specific to Roland with vendor class
>> and hack */
>>  static int add_roland_implicit_fb(struct snd_usb_audio *chip,
>>                                   struct audioformat *fmt,
>> -                                 unsigned int ifnum,
>> -                                 unsigned int altsetting)
>> +                                 struct usb_host_interface *alts)
>>  {
>> -       struct usb_host_interface *alts;
>>         struct usb_endpoint_descriptor *epd;
>>
>> -       alts = snd_usb_get_host_interface(chip, ifnum, altsetting);
>> -       if (!alts)
>> +       if (!roland_sanity_check_iface(alts))
>>                 return 0;
>> -       if (alts->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC ||
>> -           (alts->desc.bInterfaceSubClass != 2 &&
>> -            alts->desc.bInterfaceProtocol != 2) ||
>> -           alts->desc.bNumEndpoints < 1)
>> +       /* only when both streams are with ASYNC type */
>> +       epd = get_endpoint(alts, 0);
>> +       if (!usb_endpoint_is_isoc_out(epd) ||
>> +           (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=
>> USB_ENDPOINT_SYNC_ASYNC)
>> +               return 0;
>> +
>> +       /* check capture EP */
>> +       alts = snd_usb_get_host_interface(chip,
>> +                                         alts->desc.bInterfaceNumber + 1,
>> +                                         alts->desc.bAlternateSetting);
>> +       if (!alts || !roland_sanity_check_iface(alts))
>>                 return 0;
>>         epd = get_endpoint(alts, 0);
>>         if (!usb_endpoint_is_isoc_in(epd) ||
>> -           (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
>> -                                       USB_ENDPOINT_USAGE_IMPLICIT_FB)
>> +           (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=
>> USB_ENDPOINT_SYNC_ASYNC)
>>                 return 0;
>> +       chip->playback_first = 1;
>>         return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress,
>> 0,
>> -                                      ifnum, alts);
>> +                                      alts->desc.bInterfaceNumber, alts);
>> +}
>> +
>> +/* capture quirk for Roland device; always full-duplex */
>> +static int add_roland_capture_quirk(struct snd_usb_audio *chip,
>> +                                   struct audioformat *fmt,
>> +                                   struct usb_host_interface *alts)
>> +{
>> +       struct usb_endpoint_descriptor *epd;
>> +
>> +       if (!roland_sanity_check_iface(alts))
>> +               return 0;
>> +       epd = get_endpoint(alts, 0);
>> +       if (!usb_endpoint_is_isoc_in(epd) ||
>> +           (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=
>> USB_ENDPOINT_SYNC_ASYNC)
>> +               return 0;
>> +
>> +       alts = snd_usb_get_host_interface(chip,
>> +                                         alts->desc.bInterfaceNumber - 1,
>> +                                         alts->desc.bAlternateSetting);
>> +       if (!alts || !roland_sanity_check_iface(alts))
>> +               return 0;
>> +       epd = get_endpoint(alts, 0);
>> +       if (!usb_endpoint_is_isoc_out(epd))
>> +               return 0;
>> +       return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress,
>> 0,
>> +                                      alts->desc.bInterfaceNumber, alts);
>>  }
>>
>>  /* Playback and capture EPs on Pioneer devices share the same
>> iface/altset
>> @@ -365,14 +407,8 @@ static int audioformat_implicit_fb_quirk(struct
>> snd_usb_audio *chip,
>>         }
>>
>>         /* Roland/BOSS implicit feedback with vendor spec class */
>> -       if (attr == USB_ENDPOINT_SYNC_ASYNC &&
>> -           alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
>> -           alts->desc.bInterfaceProtocol == 2 &&
>> -           alts->desc.bNumEndpoints == 1 &&
>> -           USB_ID_VENDOR(chip->usb_id) == 0x0582 /* Roland */) {
>> -               if (add_roland_implicit_fb(chip, fmt,
>> -                                          alts->desc.bInterfaceNumber +
>> 1,
>> -                                          alts->desc.bAlternateSetting))
>> +       if (USB_ID_VENDOR(chip->usb_id) == 0x0582) {
>> +               if (add_roland_implicit_fb(chip, fmt, alts) > 0)
>>                         return 1;
>>         }
>>
>> @@ -404,6 +440,13 @@ static int audioformat_capture_quirk(struct
>> snd_usb_audio *chip,
>>         if (p && (p->type == IMPLICIT_FB_FIXED || p->type ==
>> IMPLICIT_FB_BOTH))
>>                 return add_implicit_fb_sync_ep(chip, fmt, p->ep_num, 0,
>>                                                p->iface, NULL);
>> +
>> +       /* Roland/BOSS need full-duplex streams */
>> +       if (USB_ID_VENDOR(chip->usb_id) == 0x0582) {
>> +               if (add_roland_capture_quirk(chip, fmt, alts) > 0)
>> +                       return 1;
>> +       }
>> +
>>         if (is_pioneer_implicit_fb(chip, alts))
>>                 return 1; /* skip the quirk, also don't handle generic
>> sync EP */
>>         return 0;
>>
>
