Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D1B96C779
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 21:26:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B760E65;
	Wed,  4 Sep 2024 21:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B760E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725478007;
	bh=JbQEdJAfSaefhmwrzdBsb6aNoET+uqf7VVTcNlnZrFA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tFlN0+nUP22mDamgLsZyyXQeg2/wuoD383dmbJkeybAfrQBlZgZ/pLi10Ha9ajD4x
	 gjguR0p8fKeBfPtSlL3PAcIOL3j9ojh7a3FrJBaO0ojX0/R+uVuCcwOkbx/4gBgb+E
	 +17Gnnq5szRJumYqnr7YFK7tr8ZXCawfyrHXnt5c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95A64F805B4; Wed,  4 Sep 2024 21:26:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA8FFF805A0;
	Wed,  4 Sep 2024 21:26:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28BF3F8016C; Wed,  4 Sep 2024 21:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F16AF800E9
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 21:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F16AF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=yFUrGLbO
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-20696938f86so20244945ad.3
        for <alsa-devel@alsa-project.org>;
 Wed, 04 Sep 2024 12:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725477966; x=1726082766;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzgXI30XIm8oNOmE6GpllOlVvkUGWlkzjWvspomrRUU=;
        b=yFUrGLbOtJUdkc7kIyXmIGe73G1zgp4/Sf8FxXgWqE8CQEezxuwFZuWRq0N0zwtqzb
         HIKe269z53VYcOi6BTwr1cYDJouRlLnfaTHPlCjSa/SvkA52iTLEZkywcOdDfc35SENI
         mFPcLya8+ri3peZNA26G8CHYEDiaeAi3z2gJ6al1PGyFU+QqF3HMzkbUi03dJgzXo/Og
         eXzZ5WIztJWd7ihlatLAC3/57zlGc1GmADjG0kmcV3dCGrcJ/wK6/97oPDeIGUl3047k
         N7/R+M31LsY2h5JFkdsm8Z+CuP1e5eah/omlR4n2WSxUqGgwwYFCnnE5Sy4CenZflUiJ
         ZyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725477966; x=1726082766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzgXI30XIm8oNOmE6GpllOlVvkUGWlkzjWvspomrRUU=;
        b=J+uB0GgX8jvXzaa/dExG0vwZw/Qr/o6KjoQlvgiLHKvLkGjq/rUJpomV1+JqhKabIs
         tASK9y28kzRo/Tuh3d3Uhsu1tqTHU/mOtE5KvpqOvYxzkiYEWyNp0TNZF+JJ50Q4bAA1
         McZHFaCYpDqkgtHEpbKLaHzUC3d1xZ1SztyoJhxwylMJAxfb5+8vfP/kJ0guWmYHxOrl
         cdRTm7BTtUirF21cTSweJb+z8drZKAZ/1wht4jBJnTaUMT56ThZSwGPe3NfiP/4bXN6T
         Hq/HOl2DCRTk1W39lI8MmmeKpsh83EVOECHKMxiY0nv4yMIrRZfQdDLWITZwKAB+9lUB
         leaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVB2NVWhehBdjPKi1B5QYcVFkGJGFZOm2DCCqM+YLwZuH4VJCFnyRn2MVJjqcwid2CloxxkeN1FggF@alsa-project.org
X-Gm-Message-State: AOJu0YzMoZj9bR2eO9PEzSvAGvg6U2RhBpF/QnnZ31nLmcG/OMe1qTbr
	w6Pfi7dwuAqCopKLgZVsPlgUlFXYguqPAA4x2UILlY4jTepQLCTp6vypwuaJFKTAymI3OGlH3JP
	9rACtJBumPrXQ3DMBbBOXgFshHy90AV/tUJD3
X-Google-Smtp-Source: 
 AGHT+IFA5vuSQfHjZv43KDRTRUBUxTC4QgFsJOO7wbJ9AKy9YCTUxhNxS/R4q49PuebEPHSlqF9tAuQmPi0RJOXj1AI=
X-Received: by 2002:a17:902:f682:b0:206:b7b8:1f0e with SMTP id
 d9443c01a7336-206b7b82ed2mr27612835ad.1.1725477965110; Wed, 04 Sep 2024
 12:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <87cylj7ul2.wl-kuninori.morimoto.gx@renesas.com>
 <20240904150720.GA2578755-robh@kernel.org>
In-Reply-To: <20240904150720.GA2578755-robh@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 4 Sep 2024 12:25:28 -0700
Message-ID: 
 <CAGETcx8SuPjzukN6WwuGJAFNoe57avNU=qtw9SCkydH0snr6ew@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rsnd: add post-init-providers
 property
To: Rob Herring <robh@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OOTBK6B6YGYMVOVOLGRK6UFO37IMK74H
X-Message-ID-Hash: OOTBK6B6YGYMVOVOLGRK6UFO37IMK74H
X-MailFrom: saravanak@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOTBK6B6YGYMVOVOLGRK6UFO37IMK74H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 4, 2024 at 8:07=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 04, 2024 at 07:21:14AM +0000, Kuninori Morimoto wrote:
> > sometimes, fwnode dependency cycles can be broken, and in such case,
> > rsnd driver will never be probed. To avoid such case, we would like to
> > use post-init-providers to avoid it.
> > Enable post-init-providers property on rsnd.

fwnode or fw_devlink cycles isn't broken. It's detecting the cycle
correctly. But it doesn't know one of the dependencies isn't an
initialization dependency. So you are providing additional information
to break the cycle. Please say something along those lines.

Here's a suggestion:

fw_devlink doesn't have enough information to break the cycle between
<list the device names>. Add post-init-providers property to <insert
the right device name> to indicate which link in the cycle to break.

-Saravana

> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml =
b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > index 07ec6247d9def..cb44478d9e420 100644
> > --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > @@ -112,6 +112,10 @@ properties:
> >      description: List of necessary clock names.
> >      # details are defined below
> >
> > +  post-init-providers:
> > +    description: ignore fw_devlink dependency cycles and avoid driver =
probe dead-lock
>
> Drop. Don't need to describe (again) what a common property is. If you
> want to say what your dependency cycle is, that would be good.
>
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
>
> Already has a type, don't define one again.
>
> What you need, if you know, is how many entries (maxItems).
>
> Rob
