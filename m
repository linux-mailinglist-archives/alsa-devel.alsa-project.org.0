Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D61FF2930F1
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 00:05:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 757F916FE;
	Tue, 20 Oct 2020 00:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 757F916FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603145153;
	bh=WBxPU3YohQAIr0UzV6DU7fWvPIhGAkcJTIC2AZUs7ng=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dCkQKxhboTE0NP2KmrSpVIh2STSoOFEAsQJiV/Xjah6BISk3l1/EYv0QsD70Gqx93
	 86Sfc6wwEVDc4lL9QPXAoDU5O9o/vpuBw8lDewcL+v3CITl54+ZoteDJv5upqX3XVI
	 lx8iel7rcAQ3cEHPYu3W/B1Eu9Hqos1fnnC3Tz9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F588F801A3;
	Tue, 20 Oct 2020 00:04:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF882F80247; Tue, 20 Oct 2020 00:04:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89890F80121
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 00:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89890F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zi43O5PT"
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 188A72240C
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 22:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603145041;
 bh=WBxPU3YohQAIr0UzV6DU7fWvPIhGAkcJTIC2AZUs7ng=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zi43O5PT/3HY0fCp/F0EDq9ginX8uuiSFbSiN5JM0zWy6JRoQFm/jLnJWp53wW9Q6
 cDhfYBam5LwqV/h/EU5dvxBvGRiwASM62QVOK5lQsmWf5wWpJhxirVOcXmBkO0ZHS2
 OmC3+d+ucmHQYgb9wfXkTfq9oGlaIonYAR8ghEvE=
Received: by mail-ot1-f49.google.com with SMTP id m22so1331208ots.4
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 15:04:01 -0700 (PDT)
X-Gm-Message-State: AOAM533JukIUMxjb+pixS+S1PwdrmepCj8RxLKTbPYL3mWdJZEH2cnwk
 cwhToQdfdKKO6vrFUAzr0umMci/bM1Z9bGS1Cw==
X-Google-Smtp-Source: ABdhPJwBY+VRyaJuZ4UsEGF4SP2lyhc+KgtqKs/qxfHE9ZI7JsFpUvG8NIfLhWpTw3bmQfT81VG0vVoz24EIGylkQ84=
X-Received: by 2002:a9d:7993:: with SMTP id h19mr1469970otm.129.1603145040317; 
 Mon, 19 Oct 2020 15:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <878se1vsy6.wl-kuninori.morimoto.gx@renesas.com>
 <875z95vsx2.wl-kuninori.morimoto.gx@renesas.com>
 <20200908232225.GA1122966@bogus>
 <87eemrlx15.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eemrlx15.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Oct 2020 17:03:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJDmw3929BxS2wroVoio6EP5QZ5bC3bJHEckLwfo6wP8g@mail.gmail.com>
Message-ID: <CAL_JsqJDmw3929BxS2wroVoio6EP5QZ5bC3bJHEckLwfo6wP8g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: renesas,rsnd: switch to yaml
 base Documentation
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
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

On Wed, Sep 23, 2020 at 9:40 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob
>
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >
> > > This patch switches from .txt base to .yaml base Document.
> > > It is still keeping detail explanations at .txt
> > >
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> (snip)
> > > +  # For OF-graph
> > > +  port:
> > > +    description: OF-Graph subnode
> > > +    $ref: "audio-graph-card.yaml#/definitions/port"
> >
> > Something like this should work (at the top-level):
> >
> > allOf:
> >   - $ref: "audio-graph-card.yaml#
>
> Hmm.. it will be error, see below (A).
> How to solve it ??

All the 'allOf's have to be grouped.

> (I will keep to use above style)
>
> > > +# use patternProperties to avoid naming "xxx,yyy"
> > > +patternProperties:
> > > +  "^rcar_sound,dvc$":
> >
> > None of these are patterns.
>
> As always happen, "xxx,yyy" style will be error for me without patternProperties.
> What is wrong ??

Node names shouldn't really have vendor prefixes, but since you
already depend on this we shouldn't change that. We'll need to relax
the meta-schema, but for now it's fine as-is.

Rob
