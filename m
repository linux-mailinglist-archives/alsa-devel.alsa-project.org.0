Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B650EDD7
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 02:51:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B0711867;
	Tue, 26 Apr 2022 02:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B0711867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650934270;
	bh=NNZm6dmxlw2CxjsPKeRlheyu7r+PVxOr+UNkjPoJ4LU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RwJoseAXfCQn+wCq/8Ac8oKw9mSy7++t5bnUnMCNaR8+80MRvXj45oRPXHLFQWjRQ
	 adb6DeP0/8aFch3uQcRg0r49rI7MxPBR2PpEPXXG2pc+9B4bj4etbh0zr+BVcBD2Rw
	 A8LEtoFbW3K2v5I09T+YOPrbLdWBF+eu9gLJTgsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B723F8016B;
	Tue, 26 Apr 2022 02:50:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE50EF8016A; Tue, 26 Apr 2022 02:50:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CC47F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 02:50:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CC47F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CYlRX6N9"
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f7b815ac06so90709577b3.3
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 17:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mn2fJZ4E4tQVUtPCpdvme/C3YDoc+wpANdoYG8MGmVs=;
 b=CYlRX6N9Nm1sI5yEp/74RKal1PLTN43Vi+Gmu1h+aj9olJKQI0o5FtvxDOEai/QU6b
 lWwQIMXmdrGEKvsGdf/VcOdooEJ5hCYMga4P/Hz9SKSHdrfF6xwRXa1usHJ2ZqS8NboR
 IEHSPxU6Ca18sm1kH19UjcErDNEo5MPWVJ9mfFs3I++SuOuL86iAhrBaLYpl5wN7/hZ7
 HrlsQ2cYAhftKb3vMai54o5WoRVqj08oHo2dOLbfvzKKv606FhGKC7Y/F/lk3wgh4KoD
 jCHxSV2vIagNPcKuFefft+qOdpw/tbSupCfX1f9oYTCr1pm4aNNRmrmAbCsiEeVPfAoW
 vWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mn2fJZ4E4tQVUtPCpdvme/C3YDoc+wpANdoYG8MGmVs=;
 b=VrrLAjh3e5IXZ1McT/JWL0HGv/m3lAl9/kuU5sMtIwov4eEM42TLEzQS+QFesm7FDm
 HCMZEMR6nNKzDcKUsEawlycCGZ8BxoGl9NsaU5vBcN9NqEKHBjaCqpvH7AsLtIj1XxRC
 6cGwg/zOe7+VWVyIUgz0RyE1BLyo7P49QJi8CRrenNwx+NsCGdUIcA8qafivJvzpxsBx
 LZUnOO4spcXCBEAT4E6JpAcbmk/TVdee5l90TzF0CjtHadxANUQyNmk7J9dFAxFVx0Yx
 +iBZlepy5Ag81npq4uNEnOhc7Plo1jZSmF8xftUzG3Ktj7am8dSjLsO5TYmWWhAMVyM0
 dc2Q==
X-Gm-Message-State: AOAM533CXUsuzfXA18jwNnDfzCJe+15zS8tIkui08nEpnapdBYg0F9yW
 efP+24xq/r4w2hydpNWwM/RowmiXEYzIgckqxQE=
X-Google-Smtp-Source: ABdhPJzekFeCGe/8/TbIwjBFlKEneo857BaBqKvU/K/YlKCLJr+MSLLucujtwAZ3yRj1TZ3irP66xflTdy2VgaZmu0s=
X-Received: by 2002:a81:1191:0:b0:2f8:1c7f:548d with SMTP id
 139-20020a811191000000b002f81c7f548dmr1758620ywr.375.1650934200106; Mon, 25
 Apr 2022 17:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220425191602.770932-1-kaehndan@gmail.com>
 <20220425191602.770932-2-kaehndan@gmail.com>
 <YmcdvcyeJJBB1pqW@robh.at.kernel.org>
In-Reply-To: <YmcdvcyeJJBB1pqW@robh.at.kernel.org>
From: Dan K <kaehndan@gmail.com>
Date: Mon, 25 Apr 2022 19:49:49 -0500
Message-ID: <CAP+ZCCfT8Mm1OECsrKxzq5vtjyaTiF=ML9LJYkHXO0A6Wao32w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: sound: Add generic serial MIDI device
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

On Mon, Apr 25, 2022 at 5:16 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 25, 2022 at 02:16:02PM -0500, Daniel Kaehn wrote:
> > Adds dt-binding for snd-serial-generic serial MIDI driver
>
> Bindings are for h/w and there's no such thing as generic h/w. There are
> some exceptions but you'll have to justify why this is special.
>

Thanks for taking the time to look at this!

Not entirely sure if you mean that I'll need to justify the existence
/ need for this binding,
or the use of the term 'generic' -- just in case, I'll make sure to
respond to both. Note that
I'm justifying my reasoning for submitting the binding - but I'm
uncertain myself if my reasoning
is valid, as someone new to kernel development.

The intent of this binding is to signify that a serial port (namely a
UART) is connected
in hardware to a MIDI decoupling circuit, which then connects to some
(any) sort of MIDI device,
either directly to an on-board device, or via a jack/connector. In a
sense, the MIDI device that this
connects to is 'generic', as the identity of the device does not need
to be known to interface with it
over MIDI for most use cases.

I see how this is a bit of an oddball, since it's not specifically
describing a particular hardware
device attached to a UART (like some of the bluetooth modules are),
but thought this sort of
binding might be permissible because of things like the
gpio-matrix-keypad binding, which doesn't
describe specific switches, just how thoise switches are wired, and
what GPIO they use, which is all
that is needed to interface with them. Some MIDI devices implement
extra low-level features like device
multiplexing, but these aren't (to my knowledge) common, and are
beyond what this supports.


The reason that the corresponding driver written has the name
'generic' is for an entirely
different reason. A "serial MIDI" driver already exists in the kernel,
however, it  interfaces only with
u16550-compatible UARTs. This driver uses the serial bus, making it
work with 'generic' serial devices.


If this comment was directed toward the use of 'generic' in the commit
message and binding
descriptions: I can reword them to be more specific and to avoid the term.


>
> > Signed-off-by: Daniel Kaehn <kaehndan@gmail.com>
> > ---
> >  .../devicetree/bindings/sound/serialmidi.yaml | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/serialmidi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/serialmidi.yaml b/Documentation/devicetree/bindings/sound/serialmidi.yaml
> > new file mode 100644
> > index 000000000000..38ef49a0c2f9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/serialmidi.yaml
> > @@ -0,0 +1,41 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/serialmidi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic Serial MIDI Device
> > +
> > +maintainers:
> > +  - Daniel Kaehn <kaehndan@gmail.com>
> > +
> > +description: |
>
> Don't need '|' unless there is formatting to preserve.
>

Will fix.

> > +  Generic MIDI interface using a serial device. Can only be set to use standard speeds
> > +  corresponding to supported baud rates of the underlying serial device. If standard MIDI
> > +  speed of 31.25 kBaud is needed, configure the clocks of the underlying serial device
> > +  so that a requested speed of 38.4 kBaud resuts in the standard MIDI baud rate.
> > +
> > +properties:
> > +  compatible:
> > +    const: serialmidi
> > +
> > +  speed:
>
> Not a standard property and we already have 2 of them concerning baud
> rate.
>

Thanks for the correction - I'll switch this to the existing "baud" property.

I somehow missed that there was a fixed list of standard properties to be used,
and just chose 'speed' as opposed to 'current-speed' which I saw on
serial bindings,
since this speed is fixed and can't (and shouldn't need to be)
changed. "baud" describes
this well enough.

> > +    maxItems: 1
> > +    description: |
> > +      Speed to set the serial port to when the MIDI device is opened.
> > +      If not specified, the underlying serial device is allowed to use its configured default speed.
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    serial {
> > +        midi {
> > +            compatible = "serialmidi";
> > +            speed = <38400>;
> > +        };
> > +    };
> > --
> > 2.33.0
> >
> >

Thanks,

Daneil Kaehn
