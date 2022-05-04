Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6570B51A1B1
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 16:03:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE65015E0;
	Wed,  4 May 2022 16:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE65015E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651673019;
	bh=QSYl17FDmCHq+vKkBQZ7BR6wz3vrhOs0yXHgIWVn4Hc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ebgFvFnf9DP+xW0ZakqjR3F0wlr5GBbzsOlGvtSCMo3M5uQuIaF7nyA3FXGUr984Z
	 nj/sv8BZPUmPdqKSRgcOUfSVhkhrEjO0Mw3tzS3bwCaPU11d7m4PkAgVaPeWLn7Ib8
	 FhqLuM1FFioRpQlwibJFvcEbCqEIlFKUQJI0jgAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DA12F800D3;
	Wed,  4 May 2022 16:02:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6334DF80163; Wed,  4 May 2022 16:02:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 638F7F800BF
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 16:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 638F7F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VXtE8/HW"
Received: by mail-yb1-xb35.google.com with SMTP id j2so2575369ybu.0
 for <alsa-devel@alsa-project.org>; Wed, 04 May 2022 07:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dqPbluyTZiYRQbW7bx2fw9aWWqx3KUBIOiovPaZc+Hc=;
 b=VXtE8/HWKfSyc7FFTXOw7Uj2djiw/nz56ABzt57plV3FvPrMM/UxH6m6BXNq2MlhR8
 0qbQWVZcqG79ITi6CKDGnZTYXdRl47yVH+3uggd46WViiXXfHt/xpi8p8MCSsmyTaE/T
 poZy6r/nb2dZYNSATQH5aUi3VGoS+3qLaEJ855ehgh0rljddAY6oABH44dIsA9QJV0Qd
 Eqz9147pjHNdGs83nHgdZOdrcOtgZHCnNfw6qt92fNzSGkVGEBBBBPJimmf7WbMFgtSx
 JM0tTdd6fVm3Gwb5r7v3Sbmr89EcZvvopCylI8QP+bOaxZLJAJRV72YATcErX9CBW8dd
 /84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dqPbluyTZiYRQbW7bx2fw9aWWqx3KUBIOiovPaZc+Hc=;
 b=55BItLbtLzDdDL/RvSnHaUHU7NexDUElINvho2aLXv1PwWNeKNtVWJlhKZh6gM8FBR
 jDl0QyMDM/snRXN4nGmOToY5a1Rdy1Ul00qAJ4ZA7ZQw65f39i1sH5qaweR3Dy88LXuI
 Hi0x/5DV1jYbb7jSlzxyzu3SILwaWT6rESdKtSoAjMw0NwGJsp11PX28CFErpozqjKya
 q2Zfe2ipJfm2kgTKPJMGCqDirhjtlkWC6N2n8tlj1bOgumO7V8mUMQ6hG3tQd78qwZbu
 p3Qx98HJ5Gdrp9FCMDoWksUN3YO3ra0nT0x7mErLbL11uyS06PLuSZZGQ3/ZbmA8r5a4
 ANug==
X-Gm-Message-State: AOAM533rrXCvmdlSGuILk0uE+psO3AzMD/kbmc6zA98/YJV7imn3E+iq
 M2eKgJw+g+neosu4w+cnd4mRmi9T13V+PWajTNY=
X-Google-Smtp-Source: ABdhPJwou628aOO7YZKVKk/OgVX0ge4hvi5Ji9JHT3WJ5aNWEs5T/nAGFiOmzFmquSXm7rRsH/OukPQrlTTtvtQBkiQ=
X-Received: by 2002:a5b:783:0:b0:64a:2087:b252 with SMTP id
 b3-20020a5b0783000000b0064a2087b252mr1334948ybq.467.1651672949172; Wed, 04
 May 2022 07:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220502150404.20295-1-kaehndan@gmail.com>
 <20220502150404.20295-3-kaehndan@gmail.com>
 <YnF+Montey61iclw@robh.at.kernel.org>
In-Reply-To: <YnF+Montey61iclw@robh.at.kernel.org>
From: Daniel Kaehn <kaehndan@gmail.com>
Date: Wed, 4 May 2022 09:02:18 -0500
Message-ID: <CAP+ZCCdu-dTXS7PhQhSc1duM70NqF=taYASD+vfJCd6GY_iUHg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] Add generic serial MIDI driver using serial bus API
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

On Tue, May 3, 2022 at 2:10 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, May 02, 2022 at 10:04:04AM -0500, Daniel Kaehn wrote:
> > Generic serial MIDI driver adding support for using serial devices
> > compatible with the serial bus as raw MIDI devices, allowing using
> > additional serial devices not compatible with the existing
> > serial-u16550 driver. Supports only setting standard serial baudrates on
> > the underlying serial device; however, the underlying serial device can
> > be configured so that a requested 38.4 kBaud is actually the standard MIDI
> > 31.25 kBaud. Supports DeviceTree configuration.
>
> Curious, what would it take to remove serial-u16550? I suppose some way
> to use it without DT.
>

Take my thoughts with a grain of salt - but I think using without DT
is one of the main things.

The serial-u16550 driver uses module params for pretty much
everything, including mapping of devices - but I must admit I don't
fully understand how exactly the device mapping part works. It appears
to have some register-level device detection logic as well.

Additionally, that driver does support a few of those "oddball" cases
that we briefly discussed earlier. That driver is written specifically
with a PC serial port in mind, to be connected to a MIDI interface
device, rather than to directly connect to a raw MIDI channel. It
supports a few devices that have multiple output MIDI ports, and
multiplexes them in the driver with a special MIDI message. It even
supplies power to the device over the RTS and DTR pins of the port,
which I don't think could be done from the serdev abstraction layer.
Again, that's not really a part of the MIDI standard, it's just how
those specific older MIDI interfaces worked, which happened to connect
to a PC over a serial port and use "MIDI" to communicate between the
PC and the interface.

Overall, I think this probably couldn't replace that driver unless it
were to violate the serdev abstraction for special cases.


> > +
> > +
>
> 1 blank line. Here and elsewhere.
>

Will remove. Thought this was an acceptable way of dividing "sections"
of the driver.


> > +static int snd_serial_generic_ensure_serdev_open(struct snd_serial_generic *drvdata)
> > +{
> > +     int err;
> > +     unsigned int actual_baud;
> > +
> > +     if (!drvdata->filemode) {
> if (drvdata->filemode)
>         return 0;
>
> And save some indentation. Though, can multiple opens happen or does the
> upper layer prevent that?
>

Good call. This function is called from both the input_open() and
output_open() -- if one is called while the other is already open, the
serial device will be open already.

> > +             dev_dbg(drvdata->card->dev, "DEBUG - Opening serial port for card %s\n",
> > +                     drvdata->card->shortname);
> > +             err = serdev_device_open(drvdata->serdev);
> > +             if (err < 0)
> > +                     return err;
> > +             if (drvdata->baudrate) {
>
> Supporting the default, random baudrates of the underlying UARTs doesn't
> seem that useful to me. Perhaps 38400 should be the default? If so, the
> binding should define that.
>

That seems reasonable. I was thinking there might be a scenario where
'current-speed' might be defined on the dt-node of the serial device
itself, and that would save needing to call
`serdev_device_set_baudrate` each time the MIDI device is opened.

> > +static void snd_serial_generic_input_trigger(struct snd_rawmidi_substream *substream,
> > +                                     int up)
> > +{
> > +     struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
> > +
> > +     if (up)
> > +             set_bit(SERIAL_MODE_INPUT_TRIGGERED, &drvdata->filemode);
> > +     else
> > +             clear_bit(SERIAL_MODE_INPUT_TRIGGERED, &drvdata->filemode);
>
> This bit is never read, only filemode as a whole. I'd assume this won't
> run unless the input is opened first and this can be dropped?

My misplaced propensity to trust code already in the kernel over
documentation is certainly showing here... Technically a call to the
input or output `trigger` function with a zero `up` parameter should
cause the driver to stop actually receiving or transmitting data
(respectively). This construct seems a bit odd, as it could result in
dropping input or output data... But it seems to be intended to put
the module in a "warm" standby mode. I'll update the driver to behave
this way, I think that would address this part of the comment. I was
initially reluctant to do so, since the serial-u16550 driver behaves
how this driver currently does.

> If the
> upper layer doesn't control the ordering, this looks racy to me. If the
> above bit is set and snd_serial_generic_input_close() is called, then
> you've left the serdev open forever.
>

As for the ordering of calls.. I've observed drain() -> trigger()->
close() always being the ordering (sometimes with repeated drain() and
trigger() calls), but looking through the code, I agree that it
doesn't seem like this is enforced. I'll update the _close() functions
to clear the corresponding _TRIGGERED bit to make sure that is
covered.

> > +
> > +static void snd_serial_generic_parse_dt(struct serdev_device *serdev,
> > +                             struct snd_serial_generic *drvdata)
> > +{
> > +     int err;
> > +
> > +     if (serdev->dev.of_node) {
>
> Always true.
>

I think this was from before the module depended on CONFIG_OF - but it
doesn't really seem possible to use the driver as-is without DT unless
some other way of specifying which serial devices are connected to
MIDI is implemented. Will remove.

> > +             err = of_property_read_u32(serdev->dev.of_node, "current-speed",
> > +                     &drvdata->baudrate);
> > +             if (err < 0) {
> > +                     dev_warn(drvdata->card->dev,
> > +                             "MIDI device reading of current-speed DT param failed with error %d, using default baudrate of serial device\n",
> > +                             err);
> > +                     drvdata->baudrate = 0;
> > +             }
> > +     } else {
> > +             dev_info(drvdata->card->dev, "MIDI device current-speed DT param not set for %s, using default baudrate of serial device\n",
> > +                     drvdata->card->shortname);
>
> That message is somewhat misleading as the node would be missing, but I
> don't think you can get here.

Agreed, will remove.

> > +     err = snd_card_register(card);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     serdev_device_set_client_ops(serdev, &snd_serial_generic_serdev_device_ops);
> > +     serdev_device_set_drvdata(drvdata->serdev, drvdata);
>
> Don't these need to be called before snd_card_register()? What
> guarantees open or any of the API is not called between
> snd_card_register and these calls?
>

True, my logic is definitely wrong here. Will correct.

> > +
> > +     return 0;
> > +}
> > +
> > +#define SND_SERIAL_GENERIC_DRIVER    "snd-serial-generic"
>
> I'd drop the define used only once.
>

Will do.

Thanks,
Daniel
