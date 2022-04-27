Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E776051102D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 06:30:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C95B17DE;
	Wed, 27 Apr 2022 06:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C95B17DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651033829;
	bh=f7GcJC7TzbtcANQd593PcXVyj7TjOCNgTbZq2zmmfMw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NplpLcglBZLMGpoMrRlYOLRjB/FOTLbpc0TeibthFqcoow3zXm4NJ3lnAU27yzQws
	 R4AdNttjmn/JMHuEpsp4b4S+Is1reORsi9ZLb1E3Q176P3cq/msA6O/LXt8Vegmr/z
	 tvEawyPbu0llWlMIcU+IpxZndgDaWmDSsAfgYz2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEA42F80100;
	Wed, 27 Apr 2022 06:29:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81640F8016E; Wed, 27 Apr 2022 06:29:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=DATE_IN_FUTURE_03_06,
 DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
 SPF_HELO_NONE, 
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90170F80100
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 06:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90170F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UBDMtBeR"
Received: by mail-yb1-xb35.google.com with SMTP id w187so1279438ybe.2
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 21:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tu2lsutkrrlAIogReco7sN66k/3UKlgQhxhfjMa/Tus=;
 b=UBDMtBeRiXVhh9SWrNhvRUnMP+i4MALSPlO72MhZGmAtTzqYDbEQD1hbIAhDukn/ga
 EYEYhcSW2bvqWBlRFhu2yX9IVdBh2W8/YuxbVUkv8S/lJKryhjv6URCyZcEVViGG54Qb
 gtpy+0/LHyETGhudUnyCSBOOD8CuzEhcBmmWOWHAt//a2MKlavjOLjJ/Srj4ZAvquTP9
 +rKZSJUrlUZi82jUgxCCkPcAXJ3M1uY0A1LRlmkIelIhubcyqHuVWwh7a619OUU4RMan
 jwfwpJswX8H8vFHFN9L6eJngAibn1kR70A6d6x2s0BNKR1ISZvb8aRkMXfUxkMpA5TnG
 wGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tu2lsutkrrlAIogReco7sN66k/3UKlgQhxhfjMa/Tus=;
 b=XI6q9aJeeeBqA2x5fHUuuZuulENjoS8uWuJV0n47GWOMNltIIXBHP6rsiVEFDjjfEy
 cbCZUBR8CwMxOYGmE55nR/nBR4/BpZOe1s0QcqEWc0BjwGaMvnyt2SvxxsBtned6rcu3
 rlkxJ+5nfrqMhuytel+l/SBPxWIqJlfoKT4OKCqiqHL6am4lWgvgLExvzNZvgbpFpu9N
 rH3sdWXd9kBiTfvRPM02XzI3IBxZWY0uIRWCHwvpWb5h+CrJu2WjcAA25ewEPMF5/q8W
 7Mn+CsBmq32XLVThMN1WbTDNaiWUssarp3dGP6w3WpUO5qpLlVf82tz+UxzAt/povqqa
 vr9A==
X-Gm-Message-State: AOAM533ywZ5qq7SYsquXFGPrWn4dX+roQyHh/maFnFoyLXzBLD5u+M9i
 5qebxOnnHFbtqSFVktL+RQACbEcJsq8QxHoHzsQ=
X-Google-Smtp-Source: ABdhPJzF2pn22A/URkLrq0TBPg70Sxeb4W+GPetmQB5JpVIVG8SEkrpcBncbJ8E5JNyPcO3jfozvnMg6mVcpmDCwGuY=
X-Received: by 2002:a25:a1c6:0:b0:641:5ff5:9f93 with SMTP id
 a64-20020a25a1c6000000b006415ff59f93mr24407209ybi.49.1651033756958; Tue, 26
 Apr 2022 21:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220425191602.770932-1-kaehndan@gmail.com>
 <20220425191602.770932-2-kaehndan@gmail.com>
 <YmcdvcyeJJBB1pqW@robh.at.kernel.org>
 <CAP+ZCCfT8Mm1OECsrKxzq5vtjyaTiF=ML9LJYkHXO0A6Wao32w@mail.gmail.com>
 <YmiSvXCE5Yovvjhd@robh.at.kernel.org>
In-Reply-To: <YmiSvXCE5Yovvjhd@robh.at.kernel.org>
From: Dan K <kaehndan@gmail.com>
Date: Wed, 27 Apr 2022 04:29:06 -0500
Message-ID: <CAP+ZCCc0YBSMU1XXoTVxNRaQ6V76D2=zNJzoduLnG2pn16hHjQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: sound: Add generic serial MIDI device
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Thanks for taking the time for a thorough reply!

On Tue, Apr 26, 2022 at 7:47 PM Rob Herring <robh@kernel.org> wrote:
>
> 'Generic' is really just a red flag.
>
> We've had generic or simple bindings before. The result tends to be a
> never ending stream of new properties to deal with every new variation
> in devices. These can be quirks for device behavior, timing for power
> control, etc.
>

Makes sense, I see why that's a concern. I think it's probably unlikely
that would happen here (for reasons described below).

>
> Okay, maybe it is appropriate. The key part is 'most use cases'. What
> about ones that don't fit into 'most'? It's possible to do both (generic
> binding and device specific bindings), but we need to define when
> generic bindings are appropriate or not.
>

Sorry about the vague language.

In many/most cases, a raw/serial MIDI device is an independent external
device, and its connection to another MIDI device would be transient and
through an external cable. Usually, this is a device that a user plugs in
at runtime, such as a MIDI keyboard (/piano) that simply sends and receives
bytes using the MIDI protocol, and its identity isn't known at the time of
devicetree compilation (and doesn't need to be known).

This binding is only describing that a serial port is dedicated to MIDI,
and the only hardware it describes is the circuitry and electrical
connections needed to connect to a MIDI device (likely through a jack).
This covers almost all of the use cases for (serial) MIDI (MIDI is now also
often done over USB / network, in case you aren't familiar). As you can
probably imagine from its use of DT in general - this is targeted toward
embedded devices, allowing an off-the-shelf SOC in an audio product to
interface with an external raw MIDI device.

The only exceptions to 'most use cases' I'm aware of are with some
antiquated MIDI interface devices that connect to an RS232 port and have
multiple output ports (selectable via a special MIDI message), enabling
someone to connect multiple MIDI devices to a PC simultaneously. I only
discovered that these exist because of the existing serial MIDI driver in
the kernel, and some research reveals that few devices like these (with
multiplexed I/O) exist. This is also probably well outside of the use case
for an embedded device.


> Do devices ever need power controls or other sideband interfaces?
> Regulators, resets, clocks? If so, you need to describe the specific
> device.
>
> Is a jack/connector in any way standard and have signals other than UART
> (or whatever is the other side of the MIDI decoupling circuit)? We have
> bindings for standard connectors.
>

The standard connector is a DIN5 connector, but only two signal pins are
used, for RX and TX. No sideband interfaces are used - the MIDI device
connected is typically a completely independent system. Neither device for
MIDI will power the other (except for USB MIDI). Really the only parameter
possible for just the serial MIDI interface itself is the baudrate - which
is fixed to 31.25k in the standard, but a device could feasibly be
connected to an onboard / non-transient custom MIDI controller with a
different baudrate (my use case contains this, as well as the earlier use
case for an external MIDI device).


> I don't really know anything about what this h/w looks like, so any
> pointers or examples would help.
>

I hope the above helps to clarify.

> > I see how this is a bit of an oddball, since it's not specifically
> > describing a particular hardware
> > device attached to a UART (like some of the bluetooth modules are),
>
> To follow that comparison, all/most BT modules use a standard/generic
> protocol over the serial port. But we don't have compatibles aligned to
> the protocol because the devices are more than just a serial protocol.
> They have GPIOs, regulators, clocks, etc. Furthermore, the serial
> protocols themselves can have extensions and/or quirks.
>

I think I would contend that for MIDI, the 'device' this binding describes
more or less is just the serial protocol (and hardware to support the
transmission). Any specific handling of special functions of a device would
be done in userspace.

>
> At some point devices become simple enough to model generically.
>
> > The reason that the corresponding driver written has the name
> > 'generic' is for an entirely
> > different reason. A "serial MIDI" driver already exists in the kernel,
> > however, it  interfaces only with
> > u16550-compatible UARTs. This driver uses the serial bus, making it
> > work with 'generic' serial devices.
>
> Bindings are separate from the kernel (though they live in the same
> repository for convenience). A 'generic' binding often appears with a
> 'generic' driver. You can have specific bindings with a generic driver.
> The difference with doing that is the OS can evolve without changing the
> binding (an ABI). Maybe initially you use a generic driver until there's
> extra/custom features of the device you want to support with a custom
> driver.
>

I've seen that sort of 'specific binding - > generic driver' model before -
but I think you'll agree that since the nature of the external device is
typically transient, the generic binding -> generic driver is probably what
would make sense here.

Thanks,
Daniel Kaehn
