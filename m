Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F13D2166742
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 20:35:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 893A41686;
	Thu, 20 Feb 2020 20:35:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 893A41686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582227359;
	bh=uJ4t90MUcm2Rs3FUpUGNuH1fKRXquVW7B2vhx0KhfMc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QZPt4WNll1mBaQLCvP06VXqCqkDIOYCsBi2W+YxW+k62D6XVAHhNfrVRKHwsY0pcR
	 6jEjq016xU9i9nTVdMpNjGBLxVOaSp9F8+Mb8PpSRHbrV6kYD7Oq24qXudNSjKJPQH
	 46hpJ4YERlMRxkgn9VAGMrQB6qed/Tn7nP6cWplw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A16E1F8014A;
	Thu, 20 Feb 2020 20:34:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 232F9F80148; Thu, 20 Feb 2020 20:34:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFE94F80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 20:34:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFE94F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qxTA3Vvx"
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F3E724654
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 19:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582227248;
 bh=uJ4t90MUcm2Rs3FUpUGNuH1fKRXquVW7B2vhx0KhfMc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qxTA3VvxXPxLF8Z2nqApQ9qHnQdlmBUcFu3dBI0dKwcTOaHsUssHFCENSeiXExcMD
 RztnMpZQh2syWiSgH59T3s9impKBC0BYqa/3jxG6aPRhopVYSQyVxqFSQeXw9sB5Gc
 52LzkLvlE5/o6kPHHuoHnRLL2A5GrRTJATosoAXc=
Received: by mail-qt1-f178.google.com with SMTP id l16so3758437qtq.1
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 11:34:08 -0800 (PST)
X-Gm-Message-State: APjAAAWyC6oFRMKQ9+/ufpzdSFUbMPRDSo2pwmd6xULF+vFY0wQnm5J8
 St8gcTzTFrIf9SFyF7UiipiRoge2I6oihgngoQ==
X-Google-Smtp-Source: APXvYqwxk1I/GNoeG3uH+//blhvQnxUtBjf4k/wCoPfqEiz310MN6xdMjEU7XnKk0iB2OWKwSLEOArJ/Wwq5RoUwDpY=
X-Received: by 2002:ac8:5513:: with SMTP id j19mr28394295qtq.143.1582227247582; 
 Thu, 20 Feb 2020 11:34:07 -0800 (PST)
MIME-Version: 1.0
References: <87d0ahzr9d.wl-kuninori.morimoto.gx@renesas.com>
 <20200219161732.GB25095@bogus>
 <874kvmt355.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874kvmt355.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 20 Feb 2020 13:33:56 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+VEQj9Nkyo_85RM3Ku1-D73_ot5BTAjidnJzJv7r1_Sw@mail.gmail.com>
Message-ID: <CAL_Jsq+VEQj9Nkyo_85RM3Ku1-D73_ot5BTAjidnJzJv7r1_Sw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: renesas,
 rsnd: switch to yaml base Documentation
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
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

On Wed, Feb 19, 2020 at 8:16 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob
>
> Thank you for your review
>
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >
> > > This patch switches from .txt base to .yaml base Document.
> > > It is still keeping detail explanations at .txt
> > >
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> (snip)
> > > +  compatible:
> > > +    oneOf:
> > > +      # for Gen1 SoC
> > > +      - items:
> > > +        - enum:
> >
> > nit: Should be indented 2 more spaces.
>
> I couldn't understand this.
> Do you mean like this ??
>
>    compatible:
>      oneOf:
>        # for Gen1 SoC
>        - items:
> =>         - enum:

Yes.

>
> > > +  clock-frequency:
> > > +    description: for audio_clkout0/1/2/3
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >
> > This already has a common definition and this conflicts with that.
> > 'clock-frequency' is a single uint32 or uint64.
>
> This needs clock array. Like this
>
>         clock-frequency = <12288000 11289600>;

Sorry, but the type is already defined in the spec. You'll still get
warnings from the common schema and you can't override that here.

Not sure what to suggest. Leave it with a fixme or move to
assigned-clocks-rates instead?

> > > +  # For OF-graph
> > > +  port:
> > > +    description: OF-Graph subnode
> > > +    type: object
> > > +    properties:
> > > +      reg:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> >
> > No unit-address for 'port', so you don't need 'reg' here.
>
> But I got warning without reg ?

Yeah, because of your $ref from ports.

> And, renesas,rsnd and/or simple-card sometimes needs reg for port
> to handle sound path.
>
> > > +  # For multi OF-graph
> > > +  ports:
> > > +    description: multi OF-Graph subnode
> > > +    type: object
> > > +    patternProperties:
> > > +      "port(@.*)?":
> >
> > ^port(@[0-9a-f])?$"
> >
> > Perhaps there's max number of ports that's less than 0xf?
> >
> > > +        $ref: "#properties/port"
> >
> > Would be more simple to just always have 'ports'.
>
> Having "ports" or "port" are case-by-case, not always.

Why?

This:

port {};

and this:

ports {
  port {};
};

Are treated the same. It's perfectly valid to have 'ports' with a single port.

Rob
