Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EDD64EF8D
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 17:40:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C296916F8;
	Fri, 16 Dec 2022 17:39:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C296916F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671208823;
	bh=fDHd8piCWgkSypoHXnc2X3k92GW5c2RwEXRmMh/PIVg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=P6EGkHOi7AzsVkzDyIRPS+5hm7vNkQD+ijAJ85qCcM+3ySR9gXlrHRGotU7B9wzZU
	 iibhSkiAl4fd8qwKksvgR/6TrabhnU59VrP5eUMJXLSwljs+BHvcDRDrg+1Y1b58VI
	 d2pvLQ8e25QK8V+EOdv9QReUuoAKq05RMFv6YTKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77BD5F804D0;
	Fri, 16 Dec 2022 17:39:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFBAEF804E2; Fri, 16 Dec 2022 17:39:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43589F804D7
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 17:39:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43589F804D7
Received: by mail-oi1-f175.google.com with SMTP id v82so2403569oib.4
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 08:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CdeW2gkswOLWXSESFJNO4bCK90PLGmoeuScKV8jkGd8=;
 b=l5+so4luSQLOInzwXWf60XI/i3l4b3vGy09ifkgybxE2L+JpgGXx+NLJMMKVMTzkir
 dzNV6kHGQ9J/xT99Q1ifDP31HoCf7Jm0Go7238lwr/M+6FwigGpcCbb4cKyxufzPiRhQ
 kIYCseycpDbxc3h5GOWRlqZ/+ecGuUqx0d02KUTVlVux3Wvhyqmbor/m1wmr+EffoPaq
 QvXrKgsby4ZOEaqW/wtWhyk0Fvx4kOZ92BnQZTRgZx/qwdUEFPlBXqbwqSMJA09hfNC9
 0ZOkNDFC/hpwzV+uiNqhBsgmX51+7TQ/d4l6qlUAm8HsYKvi9hNwxT/l03wf59k3bgZt
 sayw==
X-Gm-Message-State: ANoB5plthAaP9PPehH5JvKwUKbLUI7m5BHQmocRMkpAMJYKooAPpq+PZ
 Xb079SFvZZfjjAw9kos7dA==
X-Google-Smtp-Source: AA0mqf4dQYstkDsx8+ZYOJlQ88oAKanB6d+CJIZR4Ymm/4NDjmKzeRkMvgEC27BZP0NXvNPBKpI6VA==
X-Received: by 2002:a05:6808:2022:b0:35e:5451:4310 with SMTP id
 q34-20020a056808202200b0035e54514310mr28900562oiw.49.1671208761267; 
 Fri, 16 Dec 2022 08:39:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 62-20020a9d0644000000b0066e67925addsm1026809otn.26.2022.12.16.08.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 08:39:20 -0800 (PST)
Received: (nullmailer pid 2868860 invoked by uid 1000);
 Fri, 16 Dec 2022 16:39:19 -0000
Date: Fri, 16 Dec 2022 10:39:19 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: ti,pcm3168a: Convert to
 json-schema
Message-ID: <20221216163919.GA2863056-robh@kernel.org>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
 <Y5sJV2KfX98KoMYZ@sirena.org.uk>
 <CAMuHMdWwP6QDUux62GZtCT7tsFhAhex=Fns5e=n_KTjGXHRy0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWwP6QDUux62GZtCT7tsFhAhex=Fns5e=n_KTjGXHRy0Q@mail.gmail.com>
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
 Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Dec 15, 2022 at 01:10:44PM +0100, Geert Uytterhoeven wrote:
> Hi Mark,
> 
> On Thu, Dec 15, 2022 at 12:47 PM Mark Brown <broonie@kernel.org> wrote:
> > On Thu, Dec 15, 2022 at 12:03:02PM +0100, Geert Uytterhoeven wrote:
> > > On Wed, Dec 14, 2022 at 2:23 AM Kuninori Morimoto
> > > > +maintainers:
> > > > +  - Damien Horsley <Damien.Horsley@imgtec.com>
> >
> > > For v2, I had planned
> >
> > >     -+  - Damien Horsley <Damien.Horsley@imgtec.com>
> > >     ++  - Jaroslav Kysela <perex@perex.cz>
> > >     ++  - Takashi Iwai <tiwai@suse.com>
> >
> > > as Damien's address bounces.
> >
> > I wouldn't do that, I gather the maintainers for DT bindings are
> > supposed to be people who know and care about the specific binding in
> > particular.
> 
> Sure.  But how can they (still) care, if we cannot reach them?
> There's no email message from Damien to be found during the past
> 7 years.

Then put someone that would care if the binding is deleted. As this is 
used on Renesas board(s), I can think of a few candidates.

Rob
