Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E293593ED
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 06:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2E701616;
	Fri,  9 Apr 2021 06:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2E701616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617942786;
	bh=bj/g8YD5jSFzavJCauk0jhAnLY9jY9+wjzSJH70dTe0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cz9VZVmBTF5CjhYlUCaPsmWRdWtiF3AtJzi7+dXX5J1ouuibS2xjqaHl/4p19bEZX
	 FqSMgaRfPsbJwwaV08sWeG+zWNo1FVRUgwAsoJZvnR8INfbTEQKeNec5/JgU/ziy/7
	 meCuBe16GHMg3BywF3gCyvCrRg2xRwzdpC9Tjyz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C7DEF8016D;
	Fri,  9 Apr 2021 06:31:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 850FCF8016A; Fri,  9 Apr 2021 06:31:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5603F800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 06:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5603F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gxWfnd5V"
Received: by mail-qk1-x733.google.com with SMTP id y5so4655746qkl.9
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 21:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lCPmVigN2DS59fX4G3f2H06/APJkbDiwCYBvdr1SNdU=;
 b=gxWfnd5VaZWoU62wlCTvmasurzrca3p+o2EOJLNV/6bvCXJGMtC4Y0HEvD+VlnnuVN
 DgbQC/LXWh9VPAYJxDl8T7PNHnWEndmJTfPDvm6WW4YxZO2swoFWoqmU+UKfzn+W/uqD
 raRMnVP0ma6w8gsIXfDEUgNDVXNDwsaOAS1naZm51L+kS+uiqB8NrWXqltguGaPn6+St
 95nWhmgT5eDENPCe/Y651mOH9F1i5bQ0Xq/YBvVQlD/dfI3fZ7aJEgg9a5YdL+4QDuTw
 s3AKP1DAb5qOtMppErUG0GO8wTXy+kFLdPxGioFM1bWSGefCh/0yhOGInML9IFCQcc7e
 ddKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lCPmVigN2DS59fX4G3f2H06/APJkbDiwCYBvdr1SNdU=;
 b=DBmF3/jKT6Bz5Jowi5Od7LLlZahruTZNqQ7jkIEHizorD0fvvwZG98XHJBKSiB2Rgj
 0PkjigiGh1D3ogJyVY8S6h6fNuFmng09spHXx2hQZ1/EU3ijU/z/wEW42PZ56BHoP8sl
 qFXznDLj5JbjObKzElf8iOsbaboZIxV0qd7qfRip0Os4Jc8qJkSHIiswSNIG+GZviA++
 2uvcV/C2tjewU1zWI+9wLdbNsBb9HVQ74s6eWemUBtax8B2IIEqtRm9OWQer7+1bVb2F
 0qSwU5SbaJn6bHf/AnJfCi3hqHBZFqzUZIK1+s4Th1K/QySm0gvTwc+NDsciVVkGdP81
 6WsA==
X-Gm-Message-State: AOAM533EcgUCCDB2PbVa8m1SAklT8eVM9sFw+lNK3E+XBI2SkmXG/5mn
 Ff+aY3rHOWYdRrjbKcAcmqlaGvTBL7HVYv0GSpc=
X-Google-Smtp-Source: ABdhPJxks1t34I2czyhjkUlMikP9u76W7wTKu8un2I4vE42ltCGaQGEb04PlyNLIOreTEm2ujYtGt4BrFeyeIIP/W6I=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr12142545qki.487.1617942688158; 
 Thu, 08 Apr 2021 21:31:28 -0700 (PDT)
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
In-Reply-To: <CAOsVg8rrJMdzADsRpjTOmi7Dk23bfej+KRFQWD77s9pmNW=g5w@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Fri, 9 Apr 2021 01:27:14 -0300
Message-ID: <CAEsQvcvUJ0p4bPLJhzppJR-uFjoyOiu2_=QtAvMvNwPh9AfAFA@mail.gmail.com>
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

Thanks, Lucas, every device may be different so maybe Mike's BOSS GT-1
works without the capture quirk whereas your Roland D-05 needs it and won't
work without it.

But you did the good work testing it.

I'm glad you two are able to coordinate/collaborate in this Roland thing. I
wasn't able to make the Pioneer users coordinate so far, and it's implicit
feedback problems too. Only heard from Ard van Breemen, so far. Apparently
he hasn't got any problems with his DDJ-SX3, it runs for days on end, and
he isn't able to test kernel code for now.

Regards,
Geraldo

On Fri, Apr 9, 2021 at 12:57 AM Lucas <jaffa225man@gmail.com> wrote:

> Okay, thanks!  I'll try it next.  For now, I did use the disabled block
> "(false)" test, without worry due to you giving me your quite speedy build
> method, although I do still reboot.
>
> Anyway, I've proven my assertion that capture fails for the D-05 when I
> have its capture_implicit_fb_quirks[] line commented out.  This is a patch
> for the current state of what works perfectly for playback and capture on
> my D-05.  Sorry it includes some other patches I've applied due to
> unrelated UA-101 Takashi suggestions.  Merely removing the suggested
> comment from its capture quirk table line (as shown here) gets the Roland
> Boutique D-05 working for capture.  I don't understand why, but this works,
> & not without it:
>
> diff -Nurp linux-5.11.9.orig/sound/usb/endpoint.c
> linux-5.11.9.roland-mike-oliphant/sound/usb/endpoint.c
> --- linux-5.11.9.orig/sound/usb/endpoint.c 2021-03-24 05:54:19.000000000
> -0500
> +++ linux-5.11.9.roland-mike-oliphant/sound/usb/endpoint.c 2021-04-08
> 21:10:49.388889365 -0500
> @@ -1375,7 +1375,7 @@ int snd_usb_endpoint_start(struct snd_us
>   if (!ep_state_update(ep, EP_STATE_STOPPED, EP_STATE_RUNNING))
>   goto __error;
>
> - if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
> + if (false) { //(snd_usb_endpoint_implicit_feedback_sink(ep)) {
>   for (i = 0; i < ep->nurbs; i++) {
>   struct snd_urb_ctx *ctx = ep->urb + i;
>   list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
> diff -Nurp linux-5.11.9.orig/sound/usb/implicit.c
> linux-5.11.9.roland-mike-oliphant/sound/usb/implicit.c
> --- linux-5.11.9.orig/sound/usb/implicit.c 2021-04-01 20:55:06.079399075
> -0500
> +++ linux-5.11.9.roland-mike-oliphant/sound/usb/implicit.c 2021-04-08
> 22:29:22.139680224 -0500
> @@ -71,27 +71,149 @@ static const struct snd_usb_implicit_fb_
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
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00a6), /* Roland JUNO-G */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00a9), /* Roland MC-808 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00ad), /* Roland SH-201 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00b2), /* Roland VG-99 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x00b3), /* Roland VG-99 */
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
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x013e), /* Roland R-26 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0145), /* Roland SPD-SX */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x014b), /* BOSS eBand JS-10 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x014d), /* BOSS GT-100 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0150), /* Roland TD-15 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0151), /* Roland TD-11 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0154), /* Roland JUPITER-50 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0158), /* Roland TD-30 */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x0159), /* Roland DUO-CAPTURE EX */
> + IMPLICIT_FB_SKIP_DEV(0x0582, 0x015b), /* Roland INTEGRA-7 */
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
> @@ -278,6 +400,11 @@ static int audioformat_implicit_fb_quirk
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
