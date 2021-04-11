Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEA235B705
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Apr 2021 23:30:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F05BB15F2;
	Sun, 11 Apr 2021 23:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F05BB15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618176625;
	bh=yQxuKhsZw8lCzBHf/YJKznFz0Mljyj4fkEqW5W/Z0bQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JujOvHN1rw2icdW7/8OlB4ZanWmuDkvf3anwPgNkFbFDkLhUOn4qXlnuazEyNEeG5
	 4rzEVDtTMBRNnnjlIX42532mUDqA5iVN+irEC27ZZymd2PCEw+ew2Um4/SH9XEI9Vs
	 m0lnTfGWGn6l15+7+10bKWORsga/XlEhAyOWguZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 398A3F8022D;
	Sun, 11 Apr 2021 23:28:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8C0BF8022B; Sun, 11 Apr 2021 23:28:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2888AF800EE
 for <alsa-devel@alsa-project.org>; Sun, 11 Apr 2021 23:28:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2888AF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eJ9fznqP"
Received: by mail-qt1-x82f.google.com with SMTP id s2so8499400qtx.10
 for <alsa-devel@alsa-project.org>; Sun, 11 Apr 2021 14:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YYK7We39rQj5CY4DsdMCLrgghtPeaAWyGTZLhoZfcQE=;
 b=eJ9fznqPrH7MiNQ4rl0Wyo0Qcs3cgK5W/JzsTVj/H6g3MiVQ/NpGJSwNkx5Fq9GkX9
 xpUmqgrvZIgcOURNsUiVo685tl6X7t/ccZuFuuD88I7s1yYhsz6/kwclK4WFGmd1wO/U
 aMHfc2XPG+SdMaNI3UAceJgb7YWD5FmyCd7z1JpU3YjWmn5ec6nxv8nPtPMXj0u6bEp3
 J3G76yo2SWA4At6xlUvypO7E1NrAhYhteUU9JowtUkxHNbVt8q0r9TUx4gn66DUoRNyZ
 GQXcDK+Nu1vURzfPgvRQMNiqds7x20ewVxs0n/qRdQup2OuZzkOornJhASsv+ENfG82j
 ewLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YYK7We39rQj5CY4DsdMCLrgghtPeaAWyGTZLhoZfcQE=;
 b=gb2XNZjX6SOqvH2+efCWRvNnCUpk0+/vFPr9Nif/aOxjCSRfqLh3Z6XXipnOsP1Ziu
 PRyJiiwWy+6WX+Sea24ZLJeam/bsg6jcydF3FYf2yjeLBrz7O6OYYft32muoxag9kIqI
 9LuIJEnToYLZ9Xr+pdBuDJQunEAwib389yDYQTVWf2Qr2DvHbJqNArU5VnXCSWjYdUf6
 MHckaZi9Zs/2TXyjf04Gw4eT42AOmmUM9H7BhqCbfm4S0vEV6P5qwgSC/XhpdgmoioTr
 sIeCYrodjLvPV5ooSXp5MUyFzZWnaQgJcLwUOU/NAvM0+qs2sHxJTDrxpjT2ElMyN/qa
 HtqQ==
X-Gm-Message-State: AOAM532244OBl4UUosxZAFaxY4HSIAVKqVNwR0Po5gU7eVudR3Q1Np4f
 RsHZDMBNquHNEPEWp+Gv+Opbv3RNffvfNioRmXM=
X-Google-Smtp-Source: ABdhPJxQSObxqBvS127ccN1f7o4rEcjsgp+xEABcZHJ5Pm86l2gjYRApjA0jBPazh//r3Bsu+gjYwJA8ru1reeEe0IY=
X-Received: by 2002:ac8:70da:: with SMTP id g26mr5481642qtp.229.1618176505467; 
 Sun, 11 Apr 2021 14:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
 <CAEsQvcurb3s_W47f3N1h1=+oW4rX8tUSfQKv+_zyMMXXqJCBVw@mail.gmail.com>
 <CAHXb3bf4estasrkRhyME9w2hO6UmwUPAY+Vg6e4kvCnZh=R2zA@mail.gmail.com>
 <CAEsQvcs2Ov71mpSCXgefEFV1QQeqND871nu4+BV5KfT3kXtu+Q@mail.gmail.com>
 <CAHXb3bcpUBH9F=K9npwK-xO5sX+H11EV0_Nc7Otw7o93M=DKYQ@mail.gmail.com>
 <CAEsQvcs8HasvcJm0oEr87gNPxB6o2Km_NtAojTq+VkEX9EZd0g@mail.gmail.com>
 <CAHXb3bcMRrtMtfoHOCikNAkXxemnScfTPvJ702N_z6o5xj-G5g@mail.gmail.com>
 <CAEsQvcuo0g9STXn1d-Wux0TOH32mc88=Lw44r0ng+QocztcG3Q@mail.gmail.com>
 <CAOsVg8qWkYnW4sYP5S5A=BWvQWeBY08DrC7JZ9nNF8_nrsNArg@mail.gmail.com>
 <CAEsQvcs7y5Gr9X2vNkMHZU9akJAuBw7hE-XKcYKj9CJdO=GM8w@mail.gmail.com>
 <CAOsVg8rrJMdzADsRpjTOmi7Dk23bfej+KRFQWD77s9pmNW=g5w@mail.gmail.com>
 <CAEsQvcvUJ0p4bPLJhzppJR-uFjoyOiu2_=QtAvMvNwPh9AfAFA@mail.gmail.com>
 <CAOsVg8q_5yWBOR6DROJT7=Xv=R2yVNWSEjt4MUAx0QpQ6Af14g@mail.gmail.com>
 <CAHXb3beJxepHYraSXGCB4n9RBbBnLo05dcG=7nED1b_ZGRrMaw@mail.gmail.com>
 <CAOsVg8r85TsJypOSm5ZRv49uv+v=MZyNONe32AgGZL0fbYNayw@mail.gmail.com>
 <CAOsVg8rD==rjuVU0MR8rkp4VQi_6=UfO16huhsZx4-hM-su1xA@mail.gmail.com>
In-Reply-To: <CAOsVg8rD==rjuVU0MR8rkp4VQi_6=UfO16huhsZx4-hM-su1xA@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sun, 11 Apr 2021 18:33:07 -0300
Message-ID: <CAEsQvcuJF9D8nxbBXWbYKer5oTr7RbMQw9YiXzqb+Hof=gehCg@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Lucas <jaffa225man@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mike Oliphant <oliphant@nostatic.org>
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

Hey, Lucas, glad you're having fun with hacking the kernel.

You have no idea how useful your information can be to future generations,
specially when things break on the kernel.

My suggestion is to remember to test full-duplex also for every device you
own, at least for those that work with both aplay and arecord.

But please remember, just aplay / arecord separately can be misleading some
times. Ideally one should test both PulseAudio and JACK on top of ALSA.
Being stubborn I refuse to work with PulseAudio (and systemd) so I'd miss a
PulseAudio bug. You get the picture.

Oh by the way, for the ultimate kick I believe you can test more than one
device with JACK by using alsa_in and alsa_out. This will make JACK a
little CPU hungry but at least will compensate for the eventual lack of
clock sync when using more than one soundcard.

Thank you,
Geraldo

Em Dom, 11 de abr de 2021 04:25, Lucas <jaffa225man@gmail.com> escreveu:

> Here's my interesting, slightly-surprising results, but first the test
> criteria:
>
> I enabled the playback quirk table line as "IMPLICIT_FB_GENERIC_DEV" for
> each of these devices being tested, and changed endpoint.c's "if
> (snd_usb_endpoint_implicit_feedback_sink(ep))" to evaluate false for the
> Roland/BOSS vender ID of 0x0582 (with the vender matching method by
> Geraldo).
>
> EDIROL UA-4FX failed to capture, but plays well (only tested 48 kHz):
> arecord -D hw:UA4FX -f S24_3LE -r 48000 -c 2 ./file.wav
> Recording WAVE './test.wav' : Signed 24 bit Little Endian in 3bytes, Rate
> 48000 Hz, Stereo
> arecord: xrun:1672: read/write error, state = PREPARED
>
> aplay -D hw:UA4FX -f S24_3LE -r 48000 -c 2 ./other-file.wav
> Playing WAVE './other-file.wav' : Signed 24 bit Little Endian in 3bytes,
> Rate 48000 Hz, Stereo
>
>
> EDIROL UA-101 "full speed" USB 1.1 mode doesn't capture or play (only
> tested 48 kHz):
> arecord -D hw:UA101 -f S32_LE -r 48000 -c 2 ./file.wav
> arecord: main:830: audio open error: Connection timed out
>
> aplay -D plughw:UA101 -f S32_LE -r 48000 -c 2 ./other-file.wav
> aplay: main:830: audio open error: Connection timed out
>
>
> EDIROL UA-101 "high speed" USB 2 mode captures and plays well (only tested
> 48 kHz):
> arecord -D plughw:UA101 -f S32_LE -r 48000 -c 2 ./file.wav
> Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 48000 Hz,
> Stereo
> ^CAborted by signal Interrupt...
>
> aplay -D plughw:UA101 -f S32_LE -r 48000 -c 2 ./file.wav
> Playing WAVE './file.wav' : Signed 32 bit Little Endian, Rate 48000 Hz,
> Stereo
>
>
> Roland R-26 captures and plays fine:
> arecord -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./file.wav
> Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
> Stereo
> ^CAborted by signal Interrupt...
>
> aplay -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./file.wav
> Playing WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
> Stereo
>
>
> Roland INTEGRA-7 captures and plays well (playback at 96 kHz is new!)
> arecord -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./file.wav
> Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
> Stereo
> ^CAborted by signal Interrupt...
>
> aplay -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./file.wav
> Playing WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
> Stereo
> (Wow, now audible at 96 kHz with this endpoint.c trick!)
>
> arecord -D hw:INTEGRA7 -f S32_LE -r 44100 -c 2 ./file.wav
> Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 44100 Hz,
> Stereo
> ^CAborted by signal Interrupt...
>
> aplay -D hw:INTEGRA7 -f S32_LE -r 44100 -c 2 ./file.wav
> Playing WAVE './file.wav' : Signed 32 bit Little Endian, Rate 44100 Hz,
> Stereo
>
>
> Roland VG-99 doesn't capture, but plays well:
> arecord -D hw:VG99 -f S24_3LE -r 44100 -c 2 ./file.wav
> Recording WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
> 44100 Hz, Stereo
> arecord: xrun:1672: read/write error, state = PREPARED
>
> aplay -D hw:VG99 -f S24_3LE -r 44100 -c 2 ./other-file.wav
> Playing WAVE './other-file.wav' : Signed 24 bit Little Endian in 3bytes,
> Rate 44100 Hz, Stereo
>
>
> And, of course, you already know the Roland Boutique D-05 captures and
> finally plays back perfectly with this trick.
>
>
> Next, I'm going to use these findings to tailor the patch to only those
> devices benefiting from it.  I had already suspected the EDIROL UA-*
> devices didn't need this, but I was fairly sure they would still be
> compatible.  They aren't and neither is the VG-99.  Improvements are in the
> INTEGRA-7 (with it's playback mode of 96 kHz working crystal clearly) and
> Boutique D-05, but possibly also the R-26 (which I haven't noticed clock
> skew on either way)
>
> Thanks!
>
> Here's the patch used to test these, to reveal any accidentally left out
> details:
> diff -Nurp linux-5.11.9.orig/sound/usb/endpoint.c
> linux-5.11.9.roland-geraldo-nascimento/sound/usb/endpoint.c
> --- linux-5.11.9.orig/sound/usb/endpoint.c 2021-03-24 05:54:19.000000000
> -0500
> +++ linux-5.11.9.roland-geraldo-nascimento/sound/usb/endpoint.c 2021-04-10
> 00:14:30.836421501 -0500
> @@ -1343,6 +1343,7 @@ int snd_usb_endpoint_start(struct snd_us
>  {
>   int err;
>   unsigned int i;
> + bool skip_implicit_fb_urb_hold;
>
>   if (atomic_read(&ep->chip->shutdown))
>   return -EBADFD;
> @@ -1375,7 +1376,14 @@ int snd_usb_endpoint_start(struct snd_us
>   if (!ep_state_update(ep, EP_STATE_STOPPED, EP_STATE_RUNNING))
>   goto __error;
>
> - if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
> + //if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
> +        skip_implicit_fb_urb_hold = false;
> +
> +        if (USB_ID_VENDOR(ep->chip->usb_id) == 0x0582) // &&
> +        //   USB_ID_PRODUCT(ep->chip->usb_id) == 0x01ff)
> +               skip_implicit_fb_urb_hold = true;
> +
> +       if (snd_usb_endpoint_implicit_feedback_sink(ep) &&
> !skip_implicit_fb_urb_hold) {
>   for (i = 0; i < ep->nurbs; i++) {
>   struct snd_urb_ctx *ctx = ep->urb + i;
>   list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
> diff -Nurp linux-5.11.9.orig/sound/usb/implicit.c
> linux-5.11.9.roland-geraldo-nascimento/sound/usb/implicit.c
> --- linux-5.11.9.orig/sound/usb/implicit.c 2021-04-01 20:55:06.079399075
> -0500
> +++ linux-5.11.9.roland-geraldo-nascimento/sound/usb/implicit.c 2021-04-10
> 00:22:41.942550829 -0500
> @@ -71,27 +71,155 @@ static const struct snd_usb_implicit_fb_
>    .ep_num = 0x84, .iface = 0 }, /* MOTU MicroBook II */
>
>   /* No quirk for playback but with capture quirk (see below) */
> - IMPLICIT_FB_SKIP_DEV(0x0582, 0x0130), /* BOSS BR-80 */
> - IMPLICIT_FB_SKIP_DEV(0x0582, 0x0171),   /* BOSS RC-505 */
> - IMPLICIT_FB_SKIP_DEV(0x0582, 0x0185), /* BOSS GP-10 */
> - IMPLICIT_FB_SKIP_DEV(0x0582, 0x0189), /* BOSS GT-100v2 */
> - IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d6), /* BOSS GT-1 */
> - IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d8), /* BOSS Katana */
> - IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e5), /* BOSS GT-001 */
> - IMPLICIT_FB_SKIP_DEV(0x0582, 0x0203),   /* BOSS AD-10 */
> + IMPLICIT_FB_GENERIC_DEV(0x0582, 0x007d), /* Edirol UA-101 High Speed */
> + IMPLICIT_FB_GENERIC_DEV(0x0582, 0x008d), /* Edirol UA-101 Full Speed */
> + IMPLICIT_FB_GENERIC_DEV(0x0582, 0x00a3), /* Edirol UA-4FX */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00a6), /* Roland JUNO-G */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00a9), /* Roland MC-808 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00ad), /* Roland SH-201 */
> + IMPLICIT_FB_GENERIC_DEV(0x0582, 0x00b2), /* Roland VG-99 */
> + IMPLICIT_FB_GENERIC_DEV(0x0582, 0x00b3), /* Roland VG-99 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00c2), /* Roland SonicCell */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00c4), /* Edirol M-16DX */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00c5), /* Roland SP-555 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00c7), /* Roland V-Synth GT */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00d1), /* Roland Music Atelier */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00da), /* BOSS GT-10 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00db), /* BOSS GT-10 Guitar Effects
> Processor */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00dc), /* BOSS GT-10B */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00de), /* Roland Fantom-G */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00eb), /* Roland VS-100 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00f8), /* Roland JUNO Series */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00fc), /* Roland VS-700C */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00fd), /* Roland VS-700 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00fe), /* Roland VS-700 M1 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00ff), /* Roland VS-700 M2 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0100), /* Roland VS-700 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0101), /* Roland VS-700 M2 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0102), /* Roland VB-99 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0109), /* BOSS eBand JS-8 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0111), /* Roland GAIA SH-01 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0113), /* BOSS ME-25 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0114), /* Roland SD-50 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0117), /* Roland VS-20 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0119), /* Roland OCTAPAD SPD-30 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x011c), /* Roland Lucina AX-09 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x011e), /* BOSS BR-800 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0120), /* Roland OCTA-CAPTURE */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0121), /* Roland OCTA-CAPTURE */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0123), /* Roland JUNO-Gi */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0124), /* Roland M-300 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0127), /* Roland GR-55 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x012b), /* Roland DUO-CAPTURE */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x012f), /* Roland QUAD-CAPTURE */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0130), /* BOSS BR-80 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0132), /* Roland TRI-CAPTURE */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0134), /* Roland V-Mixer */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0138), /* BOSS RC-300 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x013a), /* Roland JUPITER-80 */
> + IMPLICIT_FB_GENERIC_DEV(0x0582, 0x013e), /* Roland R-26 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0145), /* Roland SPD-SX */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x014b), /* BOSS eBand JS-10 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x014d), /* BOSS GT-100 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0150), /* Roland TD-15 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0151), /* Roland TD-11 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0154), /* Roland JUPITER-50 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0158), /* Roland TD-30 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0159), /* Roland DUO-CAPTURE EX */
> + IMPLICIT_FB_GENERIC_DEV(0x0582, 0x015b), /* Roland INTEGRA-7 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x015d), /* Roland R-88 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0171), /* BOSS RC-505 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x017a), /* Roland VT-3 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x017c), /* Roland TR-8 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0185), /* BOSS GP-10 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0189), /* BOSS GT-100v2 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x01b5), /* Roland Boutique Series
> Synthesizer */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d6), /* BOSS GT-1 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d8), /* BOSS Katana */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x01df), /* Roland Rubix22 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e0), /* Roland Rubix24 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e1), /* Roland Rubix44 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e5), /* BOSS GT-001 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x01fd), /* Roland Boutique SH-01A */
> + IMPLICIT_FB_GENERIC_DEV(0x0582, 0x01ff), /* Roland Boutique D-05 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0203), /* BOSS AD-10 */
>
>   {} /* terminator */
>  };
>
>  /* Implicit feedback quirk table for capture: only FIXED type */
>  static const struct snd_usb_implicit_fb_match
> capture_implicit_fb_quirks[] = {
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x007d, 0x0d, 0x01), /* Edirol UA-101 High
> Speed */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x008d, 0x0d, 0x01), /* Edirol UA-101 Full
> Speed */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a3, 0x0d, 0x01), /* Edirol UA-4FX */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a6, 0x0d, 0x01), /* Roland JUNO-G */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a9, 0x0d, 0x01), /* Roland MC-808 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ad, 0x0d, 0x01), /* Roland SH-201 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b2, 0x0d, 0x01), /* Roland VG-99 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b3, 0x0d, 0x01), /* Roland VG-99 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c2, 0x0d, 0x01), /* Roland SonicCell */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c4, 0x0d, 0x01), /* Edirol M-16DX */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c5, 0x0d, 0x01), /* Roland SP-555 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c7, 0x0d, 0x01), /* Roland V-Synth GT
> */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00d1, 0x0d, 0x01), /* Roland Music
> Atelier */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00da, 0x0d, 0x01), /* BOSS GT-10 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00db, 0x0d, 0x01), /* BOSS GT-10 Guitar
> Effects Processor */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00dc, 0x0d, 0x01), /* BOSS GT-10B */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00de, 0x0d, 0x01), /* Roland Fantom-G */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00eb, 0x0d, 0x01), /* Roland VS-100 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00f8, 0x0d, 0x01), /* Roland JUNO Series
> */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fc, 0x0d, 0x01), /* Roland VS-700C */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fd, 0x0d, 0x01), /* Roland VS-700 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fe, 0x0d, 0x01), /* Roland VS-700 M1 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ff, 0x0d, 0x01), /* Roland VS-700 M2 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0100, 0x0d, 0x01), /* Roland VS-700 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0101, 0x0d, 0x01), /* Roland VS-700 M2 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0102, 0x0d, 0x01), /* Roland VB-99 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0109, 0x0d, 0x01), /* BOSS eBand JS-8 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0111, 0x0d, 0x01), /* Roland GAIA SH-01
> */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0113, 0x0d, 0x01), /* BOSS ME-25 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0114, 0x0d, 0x01), /* Roland SD-50 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0117, 0x0d, 0x01), /* Roland VS-20 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0119, 0x0d, 0x01), /* Roland OCTAPAD
> SPD-30 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x011c, 0x0d, 0x01), /* Roland Lucina
> AX-09 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x011e, 0x0d, 0x01), /* BOSS BR-800 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0120, 0x0d, 0x01), /* Roland
> OCTA-CAPTURE */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0121, 0x0d, 0x01), /* Roland
> OCTA-CAPTURE */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0123, 0x0d, 0x01), /* Roland JUNO-Gi */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0124, 0x0d, 0x01), /* Roland M-300 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0127, 0x0d, 0x01), /* Roland GR-55 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x012b, 0x0d, 0x01), /* Roland DUO-CAPTURE
> */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x012f, 0x0d, 0x01), /* Roland
> QUAD-CAPTURE */
>   IMPLICIT_FB_FIXED_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0132, 0x0d, 0x01), /* Roland TRI-CAPTURE
> */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0134, 0x0d, 0x01), /* Roland V-Mixer */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0138, 0x0d, 0x01), /* BOSS RC-300 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x013a, 0x0d, 0x01), /* Roland JUPITER-80
> */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x013e, 0x0d, 0x01), /* Roland R-26 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0145, 0x0d, 0x01), /* Roland SPD-SX */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x014b, 0x0d, 0x01), /* BOSS eBand JS-10 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x014d, 0x0d, 0x01), /* BOSS GT-100 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0150, 0x0d, 0x01), /* Roland TD-15 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0151, 0x0d, 0x01), /* Roland TD-11 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0154, 0x0d, 0x01), /* Roland JUPITER-50
> */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0158, 0x0d, 0x01), /* Roland TD-30 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0159, 0x0d, 0x01), /* Roland DUO-CAPTURE
> EX */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x015b, 0x0d, 0x01), /* Roland INTEGRA-7 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x015d, 0x0d, 0x01), /* Roland R-88 */
>   IMPLICIT_FB_FIXED_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x017a, 0x0d, 0x01), /* Roland VT-3 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x017c, 0x0d, 0x01), /* Roland TR-8 */
>   IMPLICIT_FB_FIXED_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
>   IMPLICIT_FB_FIXED_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x01b5, 0x0d, 0x01), /* Roland Boutique
> Series Synthesizer */
>   IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
>   IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x01df, 0x0d, 0x01), /* Roland Rubix22 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e0, 0x0d, 0x01), /* Roland Rubix24 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e1, 0x0d, 0x01), /* Roland Rubix44 */
>   IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x01fd, 0x0d, 0x01), /* Roland Boutique
> SH-01A */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x01ff, 0x0d, 0x01), /* Roland Boutique
> D-05 */
>   IMPLICIT_FB_FIXED_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
>
>   {} /* terminator */
> @@ -278,6 +406,11 @@ static int audioformat_implicit_fb_quirk
>   }
>   }
>
> + ///* Don't apply playback quirks for the devices with capture quirk */
> + //p = find_implicit_fb_entry(chip, capture_implicit_fb_quirks, alts);
> + //if (p && p->type == IMPLICIT_FB_FIXED)
> + // return 0; /* no quirk */
> +
>   /* Generic UAC2 implicit feedback */
>   if (attr == USB_ENDPOINT_SYNC_ASYNC &&
>      alts->desc.bInterfaceClass == USB_CLASS_AUDIO &&
>
>
> On Fri, Apr 9, 2021 at 2:09 PM Lucas <jaffa225man@gmail.com> wrote:
>
>> I wholeheartedly agree with everything you wrote, Mike.  Takashi is the
>> person who knows best how to implement these changes, and is definitely the
>> most capable.  I will get back to you about retesting my other Roland
>> devices with this trick, although I only have a few of the many devices I'd
>> ultimately like this solution implemented for.  Also, I haven't noticed the
>> sync-related clicking with the other devices I own, but I'm confident they
>> won't be hurt by the change.  I'll let you both know, though, when I get
>> around to testing them.
>>
>> Thanks as ever,
>>
>>   Lucas
>>
>
>
