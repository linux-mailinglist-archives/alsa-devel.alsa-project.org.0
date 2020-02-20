Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8230D16674E
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 20:40:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3B0816BC;
	Thu, 20 Feb 2020 20:39:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3B0816BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582227649;
	bh=IImhIpXQHLsVWHOTFfRjPqr3DNYlAfqdkTR10VY+v08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IfpgVjeg6nQ09ZT10dP7/QSD2DtDEdiFIbedKQYJg6hoY4sbVdlryq1vOYx6RTdIe
	 kMorWbvxS/is08ULZy3ze6R5VgQS2hkqDcp1WuHfrGgQp700JTQYWJI+F9PBMt0RgK
	 95TQh6qHoLm9UYleeLLrfhz9JyooHCSy0+P02MJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1952AF8014A;
	Thu, 20 Feb 2020 20:39:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B60B1F80148; Thu, 20 Feb 2020 20:39:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3CDBF80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 20:39:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3CDBF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yexM5yuU"
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8393924654
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 19:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582227538;
 bh=IImhIpXQHLsVWHOTFfRjPqr3DNYlAfqdkTR10VY+v08=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yexM5yuUfCHrhwQCWxbacWrejBJwLeYpC4gbEYNXidG5m7O5gIJKHk/a8FLE+few2
 IJJj3tBU5nRKpumEqIJi07lyB+1CpG9+0Kw18eAbxEszu9oZPMiEWFE2y9k6dyOMvN
 teJJ4C0NuI1YBa0uuXycY7pnBO71LRHZFwhWHCgI=
Received: by mail-qk1-f176.google.com with SMTP id a2so4678699qko.12
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 11:38:58 -0800 (PST)
X-Gm-Message-State: APjAAAVtpgazfWNxFYtAiPIyf8eSWTwRwlHGKiQNVom0ClX9Ishhieia
 30OhbSZeP3wF7g35wskkt0NIt3Hvms+NhVz5sA==
X-Google-Smtp-Source: APXvYqxK31PuR/mC2GifOubTB/mAdkh3PZjv+HTIqg9smA3ua/7xRkdCEU8fN2lAdCqevLlUfHaorEEVN8o3jWhflzE=
X-Received: by 2002:a37:9d47:: with SMTP id g68mr24107540qke.119.1582227537683; 
 Thu, 20 Feb 2020 11:38:57 -0800 (PST)
MIME-Version: 1.0
References: <87blq1zr8n.wl-kuninori.morimoto.gx@renesas.com>
 <20200219155808.GA25095@bogus>
 <871rqqt0nj.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871rqqt0nj.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 20 Feb 2020 13:38:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJJMNr6BWiw=Sv-nN8zQ=C+TrwFua0zWrMYJdxoNoZ09Q@mail.gmail.com>
Message-ID: <CAL_JsqJJMNr6BWiw=Sv-nN8zQ=C+TrwFua0zWrMYJdxoNoZ09Q@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: simple-card: switch to yaml base
 Documentation
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

On Wed, Feb 19, 2020 at 9:09 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob
>
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >
> > > This patch switches from .txt base to .yaml base Document.
> > >
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> (snip)
> > > +  dai:
> > > +    type: object
> > > +    properties:
> > > +      sound-dai:
> > > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> >
> > This should have a common definition elsewhere which I'd prefer be in
> > the dtschema repo. You can just assume there is and do 'maxItems: 1'
> > here assuming it's only 1.
>
> I think dai and/or sound-dai are not common definition.
> These are very simple-card specific property.

Qcom platforms also use 'sound-dai' and they aren't simple-card.

Rob
