Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D877169F018
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 09:22:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69328E82;
	Wed, 22 Feb 2023 09:21:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69328E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677054164;
	bh=qlqWtihce2l8IIxUGe+VyCwJJx1p+sSvFVG3N0n1hLI=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qrvrq4VhJeq2XNLY4yDd6Z6JXmuOUuimRmyR2uH+f24tKTjFqBiZ5/i5ZctKPeZSQ
	 4L8ewmz3t/iCbooC0v2nW9sx7PGbFyfi4lQfzVbVCEfH3hWi4myYLh8DyNid5DkA7n
	 EcqjOcJgSl794sWlum4IE2A+o8jjIkUu1/CnklTI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BF1CF80564;
	Wed, 22 Feb 2023 09:20:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80352F804B0; Wed, 22 Feb 2023 09:20:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4749FF800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 09:19:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4749FF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=h6W6n70b
Received: by mail-ed1-x533.google.com with SMTP id cq23so26771547edb.1
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 00:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJNOZOcvMnjGdeBFXws515SfQDHLUn4sM+kuakbttss=;
        b=h6W6n70b5qdFFU2oGmksYnw9ys1MLpPsMO/GuCv3dW0fVdRsdwKwESP+Udzw0ublfF
         vTEAFC8EzOkWBE6PcAs52WI1nIM5ctxJNwGnMQQGIdp/R+EWwVMMcS5qy93bHaAnfy1u
         PrK4TgYtXtha/5+uzf9IVqquy0ImeOLcz/Qn+Y/gX/bt3ev7+NN6T4LifsI/kP4CfmJr
         8sIMGkA3R+7jUSeFvUNjt0veZ3+Qjz1s19CDBp+eH2L2BeH/07zKNJZ/qA1vpcb1kvg7
         QLyOd1jcBeQZOH6re09TSfFpupJ2kH0AJ1EqQ5R+z/HIjXz4Fea29C5i7VCPAqlXhp6c
         MYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJNOZOcvMnjGdeBFXws515SfQDHLUn4sM+kuakbttss=;
        b=g7xnRIeg3j+sR5WGWjl8cW7eTAbh39xLEXPNxr7keE2Z7Qnh/X/mjifRHOF1FQoSK8
         5/7SEDz84jH+HtTLqw+QfiKNDvmYwfBABLyjVRA+PR9jKqb52wDeyWcmaFwZvdDL9GcN
         xfaajdGQsKkTySsNL66u7sbTau76LWG5cwhwg9YsxEOn2FvECqMWVZ9DpRbN1XfDY0N1
         J/7yvg+Ynddmj9a1eX2ie/b08W2b91rRQ1XbGNTxWnUtxCkz+XX13AKg7Ne7BUH/b6Xr
         ZNqmGY6S7vZv3/gG5w4Y2tkOebbqrJCzk+TvODDkj8IakFQjwvhyz6D8c/f7QJ6HGn0v
         edsg==
X-Gm-Message-State: AO0yUKVUeBS4xz/jSBbk7DZLGoPhxl9d7bSAdVfA14GH6wrqUhDBB07G
	f7cr3jK6qFupqI2zmmuGgUD9EMy2XonGeSUWntw=
X-Google-Smtp-Source: 
 AK7set/eD4OWazbd4WlNqGtkzE9MinhNaPt6ANWVDAub6zWcoT23wqA99bVdNLX5ZOspxYng6Z/FnKKs1niTz2q5K4E=
X-Received: by 2002:a17:906:5e5a:b0:877:747c:9745 with SMTP id
 b26-20020a1709065e5a00b00877747c9745mr7263091eju.8.1677053998298; Wed, 22 Feb
 2023 00:19:58 -0800 (PST)
MIME-Version: 1.0
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
 <Y/UbMH5tXDgsvSbD@kroah.com>
In-Reply-To: <Y/UbMH5tXDgsvSbD@kroah.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Feb 2023 10:19:47 +0200
Message-ID: 
 <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VANDSY2HVBKBOSOJHBW73FTDTAEBDCZX
X-Message-ID-Hash: VANDSY2HVBKBOSOJHBW73FTDTAEBDCZX
X-Mailman-Approved-At: Wed, 22 Feb 2023 08:20:13 +0000
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VANDSY2HVBKBOSOJHBW73FTDTAEBDCZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=B2=D1=82, 21 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 21:27 Greg Kroah-H=
artman
<gregkh@linuxfoundation.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> > FM34NE is digital sound processing chip used for active
> > noise suppression mainly on ASUS Transformers.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/Kconfig          |   2 +
> >  drivers/staging/Makefile         |   1 +
> >  drivers/staging/dsp/Kconfig      |   7 +
> >  drivers/staging/dsp/Makefile     |   2 +
> >  drivers/staging/dsp/dsp-fm34ne.c | 364 +++++++++++++
> >  drivers/staging/dsp/dsp-fm34ne.h | 845 +++++++++++++++++++++++++++++++
> >  6 files changed, 1221 insertions(+)
> >  create mode 100644 drivers/staging/dsp/Kconfig
> >  create mode 100644 drivers/staging/dsp/Makefile
> >  create mode 100644 drivers/staging/dsp/dsp-fm34ne.c
> >  create mode 100644 drivers/staging/dsp/dsp-fm34ne.h
>
>
> Sorry, but why is this going into drivers/staging/ at all?  What is
> needed to be done to get this out of staging?  Why not do that work
> right now?  At the least, we need a TODO file in the directory that
> lists what needs to be done and who is responsible for it.

Because this driver sets up fm34 and switches it to bypass mode allowing
sound to work on the device. There is no dsp framework in kernel which coul=
d
be called to operate dsp from the actual sound codec. (If there is, I
would be glad
if you show me). Fm34 must be active only on DMIC use, all other cases requ=
ire
it to be in bypass.

> But again, just do the work now, it's faster and simpler to do it before
> you submit it instead of waiting until after it is merged.
>
> Also, no need for a .h file when you only have one .c file.  Just put
> them all together into one file please.

I understand, but the header contains sets of configuration sequences.
Including those into .c will make it barely readable.

> thanks,
>
> greg k-h
