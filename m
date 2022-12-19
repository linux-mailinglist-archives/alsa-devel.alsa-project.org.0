Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECADC6508B7
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 09:47:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 522772B88;
	Mon, 19 Dec 2022 09:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 522772B88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671439625;
	bh=uuWcos5a+aWCqsQoeiKGQVdTqkIYsLJrs3C3xZ4XUoM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gbm/+gyEJO8B1qnSTYRuErhYJXviMFg5jaQ3X8/IdYPuYStDYFEZbLug2/IdTrQt4
	 +848SMTflhH5miXC7dK5/nnR+MbPX3lXlfnn2X6kIyqKIUPm5VUGV0M0rJQMUJpzoW
	 iSUwjaSERpbdj2RQc1khWIbTf3ech/ZfJ440jv6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59DE2F8026D;
	Mon, 19 Dec 2022 09:46:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFEFFF80423; Mon, 19 Dec 2022 09:46:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
 autolearn_force=no version=3.4.6
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36B09F800DF
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 09:46:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B09F800DF
Received: by mail-qt1-f175.google.com with SMTP id x11so7653427qtv.13
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 00:46:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5gnBI7ljTsZHEcloGn7mSwXJgNh0f4lK7wKmyds4z/o=;
 b=miVfBStCqDOwiBZIYoYuSpcdWTU+ydeGM3y8Rs3FE/jDSpPjhuBke2gPgMCYEcxBmu
 kSuOK4R9+ZCcJIvn1U54/McMatdmz+iu7W0iBufm3rPBef3ZRpSnYG21AtlMmNr77Wel
 gH0FRGWlnB94BFxjyFYwRki9n32MZqDtsAM6gQ+/uUqiqIaWHFc9VJJpbZ9mSjfsStJC
 9JPWLg0Mi2ohtGe8GEwag+X/rHM37ON33KBHVoz0j3iWF6/X4t9hGhXG0LAm0/yynOQR
 jYH117TW29r+rTEUnJkKPTtYBNy0VYbETvcvfyWg2vryKy0a2yhJ7U9t3mKY+NFtMAdN
 opWg==
X-Gm-Message-State: AFqh2kpwVm1+HXKmaSPa017aIQFMinAygRDNIzTGdJYBiHBn6vGvNq6E
 kuMI9BR4z8rmBmMddWDnAHqkmmfDr1QmaQ==
X-Google-Smtp-Source: AMrXdXsHFte4bcVoNUgfChv3Ua0lDwpG69S98SBeZn/kwpn7RgpFZO9hv0NcuDGTLmbfTsZWGBDnLA==
X-Received: by 2002:ac8:73cc:0:b0:3a7:f2b0:c4b7 with SMTP id
 v12-20020ac873cc000000b003a7f2b0c4b7mr12416362qtp.57.1671439567805; 
 Mon, 19 Dec 2022 00:46:07 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 g4-20020a05620a218400b006b95b0a714esm6537190qka.17.2022.12.19.00.46.06
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 00:46:06 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-417b63464c6so118131967b3.8
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 00:46:06 -0800 (PST)
X-Received: by 2002:a05:690c:f8a:b0:3b4:8af5:48e with SMTP id
 df10-20020a05690c0f8a00b003b48af5048emr3708065ywb.383.1671439566266; Mon, 19
 Dec 2022 00:46:06 -0800 (PST)
MIME-Version: 1.0
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
 <Y5sJV2KfX98KoMYZ@sirena.org.uk>
 <CAMuHMdWwP6QDUux62GZtCT7tsFhAhex=Fns5e=n_KTjGXHRy0Q@mail.gmail.com>
 <20221216163919.GA2863056-robh@kernel.org>
 <CAMuHMdWEbVqD3z69-nJe9ST35_S4AZSJLrYqC3f=F+VONSPn0Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWEbVqD3z69-nJe9ST35_S4AZSJLrYqC3f=F+VONSPn0Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Dec 2022 09:45:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNeJxzWoR6b+GOst9X49yK=vB574Lk1hmAS0WXDZrwPg@mail.gmail.com>
Message-ID: <CAMuHMdXNeJxzWoR6b+GOst9X49yK=vB574Lk1hmAS0WXDZrwPg@mail.gmail.com>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: ti,
 pcm3168a: Convert to json-schema
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Oops, Peter is no longer at TI...

On Mon, Dec 19, 2022 at 9:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> CC Peter
>
> On Fri, Dec 16, 2022 at 5:39 PM Rob Herring <robh@kernel.org> wrote:
> > On Thu, Dec 15, 2022 at 01:10:44PM +0100, Geert Uytterhoeven wrote:
> > > On Thu, Dec 15, 2022 at 12:47 PM Mark Brown <broonie@kernel.org> wrote:
> > > > On Thu, Dec 15, 2022 at 12:03:02PM +0100, Geert Uytterhoeven wrote:
> > > > > On Wed, Dec 14, 2022 at 2:23 AM Kuninori Morimoto
> > > > > > +maintainers:
> > > > > > +  - Damien Horsley <Damien.Horsley@imgtec.com>
> > > >
> > > > > For v2, I had planned
> > > >
> > > > >     -+  - Damien Horsley <Damien.Horsley@imgtec.com>
> > > > >     ++  - Jaroslav Kysela <perex@perex.cz>
> > > > >     ++  - Takashi Iwai <tiwai@suse.com>
> > > >
> > > > > as Damien's address bounces.
> > > >
> > > > I wouldn't do that, I gather the maintainers for DT bindings are
> > > > supposed to be people who know and care about the specific binding in
> > > > particular.
> > >
> > > Sure.  But how can they (still) care, if we cannot reach them?
> > > There's no email message from Damien to be found during the past
> > > 7 years.
> >
> > Then put someone that would care if the binding is deleted. As this is
> > used on Renesas board(s), I can think of a few candidates.
>
> Or perhaps someone from TI? ;-)
> This is a TI component, and also used on a TI K3 board...
>
> /me weaseling out...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
