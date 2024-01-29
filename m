Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0F384171F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 00:46:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69AA0A4B;
	Tue, 30 Jan 2024 00:46:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69AA0A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706572005;
	bh=RmMEV0VNyUZYA7LEC4ivbBMd8RW8rDgiGw7jNtlMQ7c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r2Gu03rXnVJhB9AS1kFsD33jbJBP5yJBtJ0kiqrb0XcUwJ/iFPv/8ZjhLYAJopbSa
	 FjzOfY+9GePC51lU9pjoAgG1CCu8Ylv2JzfDfq5A2gUe3FzKMHBFyGSwUkumS8j8yP
	 gHtycR+jUg8uIcz3QRX+NAlI2UJCnNlDtNt5y/OM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A418F805AC; Tue, 30 Jan 2024 00:46:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F5C1F805A9;
	Tue, 30 Jan 2024 00:46:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09C8DF80563; Tue, 30 Jan 2024 00:46:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC2F8F8055B
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 00:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC2F8F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=R7nPC5yV
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51030667cedso3829144e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jan 2024 15:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706571960; x=1707176760;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlEQjUIJB7dCheHxxvwo8H1ivYBLyeVZnOGfAR0f2hA=;
        b=R7nPC5yVRPGSdgUuao5j66des/5/an0uDNl91Qz4AOfe0MwhIen5N3z4XZ/oOFSPmo
         gLlm/wC29x8c9W9DfkOFekVM7vg3gHE/M+UXMO8wnRdmhNJtuBOhTgJAVZpKNGQj5sj7
         iisGZW7HM9N3Rjb6aV6WaRMWb35tni93mBis2AkgnD7RoYT6VZ8fHoeQ6ulxB0FUX+uX
         Jensqs1nXfsKSjd64W/2MI9zmdffQ8wDuEMbnNB5DaBiGQCfdMd/Vc2uxSRhaFi9wqMj
         UJuYNJwF2kCjmKzo2fcbkNipOOQXeEhkQyGrA+vmRZEwOrZgtT1b0NsKdx4dV0e+Wt39
         H47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706571960; x=1707176760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlEQjUIJB7dCheHxxvwo8H1ivYBLyeVZnOGfAR0f2hA=;
        b=h79mRgzEOVfDo0/TdUQDcy1kmLd/gyhSalUQW+YrturQk5iRtTE+xo3Yrzb5Qpzsxv
         PKJdQ/R3fkwaJ1GnrKk0TPN1e2pBoaOOhqty2SJbcrDdQ/akPb9uxGXSRMFXaYk9m5PH
         vBx9tCFcJktrRH21p+Oib4zjBxoZfZvbjmWnAa+lRubfspaMfRq/+pZN76x8EprT5pOj
         /Duk05NZMOCgAJsFnnmby8XEVOoEcmeeM2USIBecxOVhF/LJO4pfWh5Oiu6Zohj6Uwzh
         8pVyjQhJ62Ks0aTUlHTvz+Y2tE0aaa/+ytZvDJfPNIbUKjf0ll00/iLmfqEXPWxpooRC
         141g==
X-Gm-Message-State: AOJu0YwfalRR4K9WITQ9b1Q3UePfCPmfcigHzseRov9Lne/3zhA/ENuI
	Oj7JjFj2eBoc8ItV4SYIkzRRXsHnveITr4skdAEwrYyyLcpTpHg3R1gLfHayUe8kMChSgQaDPo6
	Q3mUcneZLaTVsjPLQQdru6Cq8fyQ=
X-Google-Smtp-Source: 
 AGHT+IEMCNcr5oDi70Ke5cV/vgOCbRD3N1i1GKSz6ZKS5FmjnqHJhrby7FOraHiKdFHhIg4p+a5BVIJEN6oTJ+TEBnI=
X-Received: by 2002:ac2:4c12:0:b0:510:1a2f:cf51 with SMTP id
 t18-20020ac24c12000000b005101a2fcf51mr3535808lfq.7.1706571959426; Mon, 29 Jan
 2024 15:45:59 -0800 (PST)
MIME-Version: 1.0
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
 <20240125103117.2622095-6-ckeepax@opensource.cirrus.com>
 <CAHp75Ver-NMTtHmeE9+sdnt1FVH2iGhXQxQf21jjDGOn+6mbhw@mail.gmail.com>
 <ZbfR3IzRYpP7YCns@ediswmail9.ad.cirrus.com>
In-Reply-To: <ZbfR3IzRYpP7YCns@ediswmail9.ad.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 Jan 2024 01:45:23 +0200
Message-ID: 
 <CAHp75Vf-HBn1gdaZipuvP0NtKO8s833apH_Kfb2Ur1jnLxH1QA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ASoC: cs42l43: Refactor to use for_each_set_bit()
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WQFMVBGP4SJNTI4K2O4HYXE7Q4ETTLTJ
X-Message-ID-Hash: WQFMVBGP4SJNTI4K2O4HYXE7Q4ETTLTJ
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQFMVBGP4SJNTI4K2O4HYXE7Q4ETTLTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jan 29, 2024 at 6:27=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Thu, Jan 25, 2024 at 09:11:44PM +0200, Andy Shevchenko wrote:
> > On Thu, Jan 25, 2024 at 12:31=E2=80=AFPM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > Adding nslots parameter is a good idea, but I still think the code can
> > be refactored better (have you checked the code generation, btw? I
> > believe my version would be better or not worse).
> >
> > > +       for_each_set_bit(slot, &mask, BITS_PER_TYPE(mask)) {
> > > +               if (i =3D=3D nslots) {
> > > +                       dev_warn(priv->dev, "Too many channels in TDM=
 mask: %lx\n",
> > > +                                mask);
> > >                         return;
> > > +               }
> > >
> > > +               slots[i++] =3D slot;
> > >         }
> >
> >        i =3D 0;
> >        for_each_set_bit(slot, &mask, CS42L43_ASP_MAX_CHANNELS)
> >                slots[i++] =3D slot;
> >
> >        if (hweight_long(mask) >=3D CS42L43_ASP_MAX_CHANNELS)
> >                dev_warn(priv->dev, "Too many channels in TDM mask\n");
> >
> > The code is simpler and behaviour is not changed.
>
> I don't think this works, the limit here is on the number of
> channels not on the position of those channels. The last parameter
> of for_each_set_bits appears to measure against the bit position
> not the number of set bits. So for example 0xFC000000 would be a
> valid 6 channel mask, but would result in no slot positions being
> set in the above code.

Ah, indeed. Then BITS_PER_LONG is the correct approach.

--=20
With Best Regards,
Andy Shevchenko
