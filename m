Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4630B597474
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 18:49:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB9CA1652;
	Wed, 17 Aug 2022 18:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB9CA1652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660754992;
	bh=qmcbvl0KSIu6qFppUpl2Ia8qvrk3nA/X5A2Ak/WhOVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HdS9QE1cb9/zJUvw6IXTz/mLKqe6pUpc6cFpSXuIemEI2M+4UOLTRjqCxx7Suimi/
	 QxF/QnRRJ3s09NQ1ALLzgbAU1mGsVYIt/07d5zgWacjzqOOobeKMqECoDI5sU6qhYK
	 xtkU88o2LKrFclENG8z7871eeCa5SzkPoL81RNcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08AA3F8021D;
	Wed, 17 Aug 2022 18:48:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE515F80088; Wed, 17 Aug 2022 18:48:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B872F80088
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 18:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B872F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p9Yijcwn"
Received: by mail-ed1-x52f.google.com with SMTP id b16so18274309edd.4
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=fcx7QPKlgbM0cXydkA1LgBOtKbOwn8zmQ883hD8FzX4=;
 b=p9Yijcwn0p0SFmXgJXpFi4+hUrVvguGePVXsGbKBdvoCqHXXcGcqpt5rzpZEfJaGoG
 WR9o/q4hVEJ0cb3V1yYhNsDP/BrfGxSHDdm7aZ37B3p1+3ceesgHBnd12SLUK0sgpYr8
 qv//VHWjGJQBQaMIqcJfJ25VpsUud7zWL1jv+8FMegEWX4T3+W+74VMwoRpvUEs/51ju
 KXLMLj2oTHPe9a9b5z4I94ZYzEY6N1KspALUPe8oapGOxnLSH4NZWPbXz5nbQbOQWNrt
 nmsFrqum53cnhssFhaivBLWQBp8yPZXTweh9zF1gew6TC0RqKxdIu+8PveeG73BUbLYm
 WkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=fcx7QPKlgbM0cXydkA1LgBOtKbOwn8zmQ883hD8FzX4=;
 b=pRA2y2bnaw/0wk1h+zpMm8VsKtg+tIPR2Tp6QaT2yIzTe0C4ccVN2N2yI1bJC0KTIu
 IHw9hiVw0DjgTPoCBzz1G/1u5eZLeRBxjTtWyqDiZEfKvR4PmQErwf9gOQAaE7971xHm
 qAOZnX21UYeY0VW8Mr3swLXuFDvP6DpDcbUd/6eDGxrMZ3dIU78pg6uVrkAUZHxlmItf
 M+z32vLT0XcirWudXqviFSURx/mnH8lP4/APvqBx8LZ8p+Hxc+8Hrf8Z+1Ky/0vy4R9g
 FJyAwxUtvFRlFuOClypEh+OyrlLc1H+CfF8Cb4gR6rXGhimhwbMq/btMrrkvMAk6lK1+
 NQnQ==
X-Gm-Message-State: ACgBeo2KJlKIa+fQy1hDtCWsGzPFW7TGbGKIG7fvbLmNceZ9eA93MooU
 qArTyTPcECakhGXI5PonwALvtLGNnN7vcFRoRXUEoWY4vzA=
X-Google-Smtp-Source: AA6agR4Z37KdnA5li6yH3O/9/25uOyf8HjDY8sd+evh1VpDb9O98Ybbw2NrEK28I6979ZzuPVd95ZQq+/0z7bepFOO8=
X-Received: by 2002:a05:6402:88e:b0:445:e4c2:b8bf with SMTP id
 e14-20020a056402088e00b00445e4c2b8bfmr2590395edy.50.1660754926771; Wed, 17
 Aug 2022 09:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <87r11fwbwu.wl-tiwai@suse.de>
 <20220817162727.9646-1-connerknoxpublic@gmail.com>
In-Reply-To: <20220817162727.9646-1-connerknoxpublic@gmail.com>
From: Manu <mbarriolinares@gmail.com>
Date: Wed, 17 Aug 2022 13:48:34 -0300
Message-ID: <CA+64nrsbhD3J7s6+fWEL2cxVvm6JGjR7tOUSpRdZOkuGLepYCA@mail.gmail.com>
Subject: Re: [PATCH] Add quirk to enable Avid Mbox 3 support
To: connerknoxpublic@gmail.com
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, tiwai@suse.com
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

Could you perhaps make this the defaults, for it to work in stereo?
I've made the Analog 1 to be left, and Analog 2 to be right channels,
and muted Analog 3 and 4, as they are detected as "surround".
This works out of the box with the back Analog outs.
(Still haven't tested front headphones out)

>    /* Set software sends to output */
>    com_buff[0] = 0x00;
>    com_buff[1] = 0x00;
>    /* Analogue software return 1 left channel: */
>    snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 1, 0x21, 0x0100, 0x4001, &com_buff, 2);
>    /* Analogue software return 2 right channel: */
>    snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 1, 0x21, 0x0105, 0x4001, &com_buff, 2);
>    com_buff[0] = 0x00;
>    com_buff[1] = 0x80;
>    /* Analogue software return 1 right channel: */
>    snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 1, 0x21, 0x0101, 0x4001, &com_buff, 2);
>    /* Analogue software return 2 left channel: */
>    snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 1, 0x21, 0x0104, 0x4001, &com_buff, 2);
>    com_buff[0] = 0x00;
>    com_buff[1] = 0x80;
>    /* Analogue software return 3 left channel: */
>    snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 1, 0x21, 0x0108, 0x4001, &com_buff, 2);
>    /* Analogue software return 3 right channel: */
>    snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 1, 0x21, 0x0109, 0x4001, &com_buff, 2);
>    /* Analogue software return 4 left channel: */
>    snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 1, 0x21, 0x010c, 0x4001, &com_buff, 2);
>    /* Analogue software return 4 right channel: */
>    snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 1, 0x21, 0x010d, 0x4001, &com_buff, 2);



On Wed, Aug 17, 2022 at 1:28 PM <connerknoxpublic@gmail.com> wrote:
>
> From: Conner Knox <connerknoxpublic@gmail.com>
>
> Add support for Avid Mbox3 USB audio interface at 48kHz
>
> Signed-off-by: Conner Knox <connerknoxpublic@gmail.com>
> ---
>  sound/usb/quirks-table.h |  76 ++++++++++
>  sound/usb/quirks.c       | 311 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 387 insertions(+)
>
> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index 0ea39565e623..5f43863e5a5f 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -2978,6 +2978,82 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>                 }
>         }
>  },
> +/* DIGIDESIGN MBOX 3 */
> +{
> +       USB_DEVICE(0x0dba, 0x5000),
> +       .driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
> +               .vendor_name = "Digidesign",
> +               .product_name = "Mbox 3",
> +               .ifnum = QUIRK_ANY_INTERFACE,
> +               .type = QUIRK_COMPOSITE,
> +               .data = (const struct snd_usb_audio_quirk[]) {
> +                       {
> +                               .ifnum = 0,
> +                               .type = QUIRK_IGNORE_INTERFACE
> +                       },
> +                       {
> +                               .ifnum = 1,
> +                               .type = QUIRK_IGNORE_INTERFACE
> +                       },
> +                       {
> +                               .ifnum = 2,
> +                               .type = QUIRK_AUDIO_FIXED_ENDPOINT,
> +                               .data = &(const struct audioformat) {
> +                                       .formats = SNDRV_PCM_FMTBIT_S24_3LE,
> +                                       .channels = 4,
> +                                       .iface = 2,
> +                                       .altsetting = 1,
> +                                       .altset_idx = 1,
> +                                       .attributes = 0x00,
> +                                       .endpoint = 0x01,
> +                                       .ep_attr = USB_ENDPOINT_XFER_ISOC |
> +                                               USB_ENDPOINT_SYNC_ASYNC,
> +                                       .rates = SNDRV_PCM_RATE_48000,
> +                                       .rate_min = 48000,
> +                                       .rate_max = 48000,
> +                                       .nr_rates = 1,
> +                                       .rate_table = (unsigned int[]) {
> +                                               48000
> +                                       }
> +                               }
> +                       },
> +                       {
> +                               .ifnum = 3,
> +                               .type = QUIRK_AUDIO_FIXED_ENDPOINT,
> +                               .data = &(const struct audioformat) {
> +                                       .formats = SNDRV_PCM_FMTBIT_S24_3LE,
> +                                       .channels = 4,
> +                                       .iface = 3,
> +                                       .altsetting = 1,
> +                                       .altset_idx = 1,
> +                                       .endpoint = 0x81,
> +                                       .attributes = 0x00,
> +                                       .ep_attr = USB_ENDPOINT_XFER_ISOC |
> +                                               USB_ENDPOINT_SYNC_ASYNC,
> +                                       .maxpacksize = 0x009c,
> +                                       .rates = SNDRV_PCM_RATE_48000,
> +                                       .rate_min = 48000,
> +                                       .rate_max = 48000,
> +                                       .nr_rates = 1,
> +                                       .rate_table = (unsigned int[]) {
> +                                               48000
> +                                       }
> +                               }
> +                       },
> +                       {
> +                               .ifnum = 4,
> +                               .type = QUIRK_MIDI_FIXED_ENDPOINT,
> +                               .data = & (const struct snd_usb_midi_endpoint_info) {
> +                                       .out_cables = 0x0001,
> +                                       .in_cables  = 0x0001
> +                               }
> +                       },
> +                       {
> +                               .ifnum = -1
> +                       }
> +               }
> +       }
> +},
>  {
>         /* Tascam US122 MKII - playback-only support */
>         USB_DEVICE_VENDOR_SPEC(0x0644, 0x8021),
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index ab9f3da49941..e7caa7eeb955 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -1020,6 +1020,313 @@ static int snd_usb_axefx3_boot_quirk(struct usb_device *dev)
>         return 0;
>  }
>
> +static void mbox3_setup_48_24_magic(struct usb_device *dev)
> +{
> +       u8 com_buff[4];
> +
> +       /* Load 48000Hz rate into buffer */
> +       com_buff[0] = 0x80;
> +       com_buff[1] = 0xbb;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +
> +       /* Set 48000Hz sample rate */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       0x01, 0x21, 0x0100, 0x0001, &com_buff, 0x0004);
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       0x01, 0x21, 0x0100, 0x8101, &com_buff, 0x0004);
> +
> +       /* Set clock source to Internal (as opposed to S/PDIF) */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x01;
> +       com_buff[1] = 0x00;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0100, 0x8001, &com_buff, 1);
> +
> +       /* Mute the hardware loopbacks to start the device in a known state.
> +        * The Mbox 3 is little endian and
> +        * the data written here seems a bit odd.
> +        * 0x8000 (shown in big endian form) is muted
> +        * and volume increases to 0xffff it seems.
> +        * I've yet to observe 0xffff being sent.
> +        * Instead, full volume seems to be 0x0000.
> +        * Per my understanding of 16 bit integers, this is seems strange, but maybe I'm missing something
> +        */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x00;
> +       com_buff[1] = 0x80;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       /* Analogue input 1 left channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0110, 0x4001, &com_buff, 2);
> +       /* Analogue input 1 right channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0111, 0x4001, &com_buff, 2);
> +       /* Analogue input 2 left channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0114, 0x4001, &com_buff, 2);
> +       /* Analogue input 2 right channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0115, 0x4001, &com_buff, 2);
> +       /* Analogue input 3 left channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0118, 0x4001, &com_buff, 2);
> +       /* Analogue input 3 right channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0119, 0x4001, &com_buff, 2);
> +       /* Analogue input 4 left channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x011c, 0x4001, &com_buff, 2);
> +       /* Analogue input 4 right channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x011d, 0x4001, &com_buff, 2);
> +
> +       /* Set software sends to output */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x00;
> +       com_buff[1] = 0x00;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       /* Analogue software return 1 left channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0100, 0x4001, &com_buff, 2);
> +       /* Analogue software return 1 right channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0101, 0x4001, &com_buff, 2);
> +       /* Analogue software return 2 left channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0104, 0x4001, &com_buff, 2);
> +       /* Analogue software return 2 right channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0105, 0x4001, &com_buff, 2);
> +       /* Analogue software return 3 left channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0108, 0x4001, &com_buff, 2);
> +       /* Analogue software return 3 right channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0109, 0x4001, &com_buff, 2);
> +       /* Analogue software return 4 left channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x010c, 0x4001, &com_buff, 2);
> +       /* Analogue software return 4 right channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x010d, 0x4001, &com_buff, 2);
> +
> +       /* Return to muting sends */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x00;
> +       com_buff[1] = 0x80;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       /* Analogue fx return left channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0120, 0x4001, &com_buff, 2);
> +       /* Analogue fx return right channel: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0121, 0x4001, &com_buff, 2);
> +
> +       /* Analogue software input 1 fx send: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0100, 0x4201, &com_buff, 2);
> +       /* Analogue software input 2 fx send: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0101, 0x4201, &com_buff, 2);
> +       /* Analogue software input 3 fx send: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0102, 0x4201, &com_buff, 2);
> +       /* Analogue software input 4 fx send: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0103, 0x4201, &com_buff, 2);
> +       /* Analogue input 1 fx send: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0104, 0x4201, &com_buff, 2);
> +       /* Analogue input 2 fx send: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0105, 0x4201, &com_buff, 2);
> +       /* Analogue input 3 fx send: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0106, 0x4201, &com_buff, 2);
> +       /* Analogue input 4 fx send: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0107, 0x4201, &com_buff, 2);
> +
> +       /* Toggle allowing host control */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x02;
> +       com_buff[1] = 0x00;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       3, 0x21, 0x0000, 0x2001, &com_buff, 1);
> +
> +       /* Do not dim fx returns */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x00;
> +       com_buff[1] = 0x00;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 3, 0x21, 0x0002, 0x2001, &com_buff, 1);
> +
> +       /* Do not set fx returns to mono */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x00;
> +       com_buff[1] = 0x00;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 3, 0x21, 0x0001, 0x2001, &com_buff, 1);
> +
> +       /* Mute the S/PDIF hardware loopback
> +        * same odd volume logic here as above
> +        */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x00;
> +       com_buff[1] = 0x80;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       /* S/PDIF hardware input 1 left channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0112, 0x4001, &com_buff, 2);
> +       /* S/PDIF hardware input 1 right channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0113, 0x4001, &com_buff, 2);
> +       /* S/PDIF hardware input 2 left channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0116, 0x4001, &com_buff, 2);
> +       /* S/PDIF hardware input 2 right channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0117, 0x4001, &com_buff, 2);
> +       /* S/PDIF hardware input 3 left channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x011a, 0x4001, &com_buff, 2);
> +       /* S/PDIF hardware input 3 right channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x011b, 0x4001, &com_buff, 2);
> +       /* S/PDIF hardware input 4 left channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x011e, 0x4001, &com_buff, 2);
> +       /* S/PDIF hardware input 4 right channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x011f, 0x4001, &com_buff, 2);
> +       /* S/PDIF software return 1 left channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0102, 0x4001, &com_buff, 2);
> +       /* S/PDIF software return 1 right channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0103, 0x4001, &com_buff, 2);
> +       /* S/PDIF software return 2 left channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0106, 0x4001, &com_buff, 2);
> +       /* S/PDIF software return 2 right channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0107, 0x4001, &com_buff, 2);
> +       /* S/PDIF software return 3 left channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x010a, 0x4001, &com_buff, 2);
> +       /* S/PDIF software return 3 right channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x010b, 0x4001, &com_buff, 2);
> +       /* S/PDIF software return 4 left channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x010e, 0x4001, &com_buff, 2);
> +       /* S/PDIF software return 4 right channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x010f, 0x4001, &com_buff, 2);
> +       /* S/PDIF fx returns left channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0122, 0x4001, &com_buff, 2);
> +       /* S/PDIF fx returns right channel */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0123, 0x4001, &com_buff, 2);
> +
> +       /* Set the dropdown "Effect" to the first option */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x00;
> +       com_buff[1] = 0x00;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0200, 0x4301, &com_buff, 1);
> +
> +       /* Set the effect duration to 0 */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x00;
> +       com_buff[1] = 0x00;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0400, 0x4301, &com_buff, 2);
> +
> +       /* Set the effect volume and feedback to 0 */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x00;
> +       com_buff[1] = 0x00;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       /* feedback: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0500, 0x4301, &com_buff, 1);
> +       /* volume: */
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       1, 0x21, 0x0300, 0x4301, &com_buff, 1);
> +
> +       /* Set soft button hold duration */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x05;
> +       com_buff[1] = 0x00;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       3, 0x21, 0x0005, 0x2001, &com_buff, 1);
> +
> +       /* Use dim LEDs for button of state */
> +       memset(com_buff, 0x00, 4);
> +       com_buff[0] = 0x00;
> +       com_buff[1] = 0x00;
> +       com_buff[2] = 0x00;
> +       com_buff[3] = 0x00;
> +       snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
> +                       3, 0x21, 0x0004, 0x2001, &com_buff, 1);
> +
> +       return;
> +}
> +
> +#define MBOX3_DESCRIPTOR_SIZE  464
> +
> +static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
> +{
> +       struct usb_host_config *config = dev->actconfig;
> +       int err;
> +       int descriptor_size;
> +
> +       descriptor_size = le16_to_cpu(get_cfg_desc(config)->wTotalLength);
> +
> +       if (descriptor_size != MBOX3_DESCRIPTOR_SIZE) {
> +               dev_err(&dev->dev, "Invalid descriptor size=%d.\n", descriptor_size);
> +               return -ENODEV;
> +       }
> +
> +       dev_dbg(&dev->dev, "device initialised!\n");
> +
> +       err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
> +               &dev->descriptor, sizeof(dev->descriptor));
> +       config = dev->actconfig;
> +       if (err < 0)
> +               dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
> +
> +       err = usb_reset_configuration(dev);
> +       if (err < 0)
> +               dev_dbg(&dev->dev, "error usb_reset_configuration: %d\n", err);
> +       dev_dbg(&dev->dev, "mbox3_boot: new boot length = %d\n",
> +               le16_to_cpu(get_cfg_desc(config)->wTotalLength));
> +
> +       mbox3_setup_48_24_magic(dev);
> +       dev_info(&dev->dev, "Digidesign Mbox 3: 24bit 48kHz");
> +
> +       return 0; /* Successful boot */
> +}
>
>  #define MICROBOOK_BUF_SIZE 128
>
> @@ -1324,6 +1631,10 @@ int snd_usb_apply_boot_quirk(struct usb_device *dev,
>         case USB_ID(0x0dba, 0x3000):
>                 /* Digidesign Mbox 2 */
>                 return snd_usb_mbox2_boot_quirk(dev);
> +       case USB_ID(0x0dba, 0x5000):
> +               /* Digidesign Mbox 3 */
> +               return snd_usb_mbox3_boot_quirk(dev);
> +
>
>         case USB_ID(0x1235, 0x0010): /* Focusrite Novation Saffire 6 USB */
>         case USB_ID(0x1235, 0x0018): /* Focusrite Novation Twitch */
> --
> 2.37.2
>
