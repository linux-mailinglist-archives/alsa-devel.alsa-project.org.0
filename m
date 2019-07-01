Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5F15BB0F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 13:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13B8C1698;
	Mon,  1 Jul 2019 13:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13B8C1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561982256;
	bh=8YSZTlkQjDIdWi/TlLNVsksvr5qV0OrPe7HnQyfuJeU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=llPOK/k/OKvs2y/xxFw+XREe16BHqp8E0l4IuBuMJEqBgNK1Cx8D8JLkPzYKhECSV
	 DBEFICProvNR+FQhkCYASj/lYGc1Sguzut9XV8/RcJJYgMI62r3gKfgKozma6OWVac
	 jfZ1uMc1VH0NCuwTNrZnZYEa5KnM4GCAD48WCZoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25B75F89707;
	Mon,  1 Jul 2019 13:55:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34182F896EC; Mon,  1 Jul 2019 13:55:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76490F80CC4
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 13:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76490F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="c1jRM+jK"
Received: by mail-lj1-x242.google.com with SMTP id v24so12843664ljg.13
 for <alsa-devel@alsa-project.org>; Mon, 01 Jul 2019 04:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3441Ee6SQaoJ/g1H098ZYxjVb3ll79O0ih0O7VaO5DE=;
 b=c1jRM+jK9SSCn45B9Sc7+jakIsmkHb6l72+e1SA9X3RY8Yh+o+VzzYRheDxjHdzGGg
 psvxQJFejnk+NArkz389Mp7wPT51HNQ4rO1t10hTMK0c5SN0+epzjD3d248nBNkxj39K
 9PiK8XAyIXdLkjS5r11EGRhwQp5IupQ7+0nCSh42ErWA+X05RZ6UCphf1EQvsF0oeIn1
 Z8yKIeLVQKfLz3VIgQFCI/k+Q6iBAK9by9DP6ZPT9IVtP/1+J3Xbwo+/UM76xDmLA3tb
 CImh7rHjRnmsDSs9Sk8n4EaWKJdsFvr2LmLsstWRKTZ8Ia2C30Sms84R2/r1iPXAdaw/
 sJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3441Ee6SQaoJ/g1H098ZYxjVb3ll79O0ih0O7VaO5DE=;
 b=lIq2GuAksFznziwnydvE5sBHbJWqtueEHwUqUa4l1wnFOPj/2NlSMaCMdvUN4U7ixL
 0vShYSWLQLTDszXnB+s9Y8e+wk8DNJXfdpnXGDQOyr3TDJOzqTwYmI37Hir0mH2Sg0vD
 xbyO+XgbQa481u8GKSncz/T4fL1ZF63W7zDl6cVhbh11VD1aWlXACOV0JkY0tZYGkMJ0
 1qZ4d08fCeL/nY3ApSLKYDKlU5xkuT6DrQfkQ2WiUfMWuGjdnBo532La2B2VbgkPrf5+
 qrdlJTKjP9DVPaVm5VK1Nyitd6bcBv4RgL4KhWTzYPE8BLBHI5Rs9F2f3zRSD8ndSgkV
 uzNA==
X-Gm-Message-State: APjAAAUymsfxtNH5KT9PdViM4k8VE0qLLH7Ua+pZwMx9/00T0A/W1fb6
 oSqqRmQpOmLuJZiczqtANgPP3DcQII5vP+7RGNQ=
X-Google-Smtp-Source: APXvYqyJI/1CF2TUGodvq9vfdrao6xj1QIIBZn6tosr9JmCTxQNN+9La2Y0CgKcOHHzQBtcblIHwNv4nfiaWdywyuFc=
X-Received: by 2002:a2e:858b:: with SMTP id b11mr13671886lji.159.1561982145251; 
 Mon, 01 Jul 2019 04:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <CABPh3UNCZhssHLmZF2paU4EKOK1WKScbC7Vw=uGfJn7WUeXO3Q@mail.gmail.com>
 <8fd64743-fc0e-a536-2099-a0e0adbe83d4@jensverwiebe.de>
In-Reply-To: <8fd64743-fc0e-a536-2099-a0e0adbe83d4@jensverwiebe.de>
From: nick83ola <nick83ola@gmail.com>
Date: Mon, 1 Jul 2019 12:55:34 +0100
Message-ID: <CABPh3UN-P4kZY3nYqDvi2-3eMGm3_BCGUPzhHq2iWRpkk196kg@mail.gmail.com>
To: Jens Verwiebe <info@jensverwiebe.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [BUG] Line6 Helix / X Stomp:
 parse_audio_format_rates_v2v3(): unable to retrieve number of sample rates
 (clock 16)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 27 Jun 2019 at 17:22, Jens Verwiebe <info@jensverwiebe.de> wrote:
>
> Hi Nick
>
> This looks like the same hurdle i once had with Helix.
>
> Imho you should first try my patch to format.c and extend the
> vendor/model clause to your device:
>
> diff --git a/sound/usb/format.c b/sound/usb/format.c
> index 2c44386..1c0107d 100644
> --- a/sound/usb/format.c
> +++ b/sound/usb/format.c
> @@ -298,6 +298,20 @@ static int parse_audio_format_rates_v2(struct
> snd_usb_audio *chip,
>           goto err;
>       }
>
> +    /*
> +    * Line6 HELIX does not respond to sample rate
> +    * query requests. The only valid rate is 48000.
> +    */
> +    if (chip->usb_id == USB_ID(0x0e41, 0x4244)) {
> +        fp->nr_rates = 1;
> +            fp->rate_min = 48000;
> +            fp->rate_max = 48000;
> +            fp->rates = SNDRV_PCM_RATE_48000;
> +            fp->rate_table = kmalloc(sizeof(int), GFP_KERNEL);
> +            fp->rate_table[0] = 48000;
> +            return 0;
> +        }
> +
>       /* get the number of sample rates first by only fetching 2 bytes */
>       ret = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0), UAC2_CS_RANGE,
>                     USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_IN,
>

I can confirm that your patch get the device recognized in kernel 5.2
(I modfied it a bit).
I'll work on this a bit and try to submit a patch to alsa to at least
having the device available.
Regarding the second part ( get_usb_high_speed_rate(rate + 5);)
I think I have to debug it better because I don't think it can be
accepted upstream.
(maybe someone from the mailing list can help?)

> I personally encountered still slight pops from time to time which i
> "healed" with an ugly second patch:
>
> diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
> index c90607e..026095a 100644
> --- a/sound/usb/endpoint.c
> +++ b/sound/usb/endpoint.c
> @@ -878,6 +878,8 @@ int snd_usb_endpoint_set_params(struct
> snd_usb_endpoint *ep,
>
>       if (snd_usb_get_speed(ep->chip->dev) == USB_SPEED_FULL)
>           ep->freqn = get_usb_full_speed_rate(rate);
> +    else if (USB_ID(0x0e41, 0x4244))
> +        ep->freqn = get_usb_high_speed_rate(rate + 5); // ugly helix hack
>       else
>           ep->freqn = get_usb_high_speed_rate(rate);
>
>
> I still never could get the Line6 device to really follow the
> syncadaption in 16.16 format.
>
> I tried all kinda voodoo like endpoint redirection ( like axe fx needs )
> to no avail. Perhaps you have better ideas.
>
> I would be very interested in getting Line6 devices usb-compliant mode
> working 100 % reliable.
>
> The dream would be to have all samplerates. Btw:: i have sniffed data
> from Helix connected to a windows machine,
>
> ioreg data from helix connected to an OSX(macOS)  machine and even a bit
> experimented with retdec on the windows drivers ;).
>
> This for now, 'am just on the jump to the Hamburg Linux Group :)
>
> Lets stay in contact about this stuff.
>
> Cheers ... Jens
>
>
> Am 27.06.19 um 09:45 schrieb nick83ola:
> > Hi all,
> > I just purchased an HX stomp and when I connect to linux I get the
> > following error message:
> >
> >      [  322.404503] usb 1-6: new high-speed USB device number 13 using xhci_hcd
> >      [  322.531804] usb 1-6: New USB device found, idVendor=0e41,
> > idProduct=4246, bcdDevice= 2.00
> >      [  322.531806] usb 1-6: New USB device strings: Mfr=1, Product=3,
> > SerialNumber=2
> >      [  322.531806] usb 1-6: Product: HX Stomp
> >      [  322.531807] usb 1-6: Manufacturer: LINE 6
> >      [  322.531808] usb 1-6: SerialNumber:    3021888
> >      [  322.535789] usb 1-6: parse_audio_format_rates_v2v3(): unable to
> > retrieve number of sample rates (clock 16)
> >      [  322.535907] usb 1-6: parse_audio_format_rates_v2v3(): unable to
> > retrieve number of sample rates (clock 16)
> >
> > I have some kernel development experience but not a lot with usb so
> > can someone point me where to start looking?
> >
> > there was a previous discussion on the mailing list related to this by
> > Jens Verwiebe (and other request for help).
> > Here are the relevant patches/discussion
> >
> >      https://www.spinics.net/lists/alsa-devel/msg71459.html
> >      https://patchwork.kernel.org/patch/10113121/
> >
> > If someone can help me I have an HX stomp here and time to do some debugging.
> >
> > Also if someone from Line6 is listening would be helpful to have some hints.
> >
> > Cheers
> > Nicola Lunghi
> >
> --
>
> Jens Verwiebe
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
