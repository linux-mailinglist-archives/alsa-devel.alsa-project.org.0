Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9890C943
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 13:27:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AAC1AE8;
	Tue, 18 Jun 2024 13:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AAC1AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718710030;
	bh=Oas3OL/b/DriXAm/mtEfV6t2J9RXQPvR4MOBk+IH9ug=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GXplIR00xWpv5bxtQQ70S3iJsH4ew0ZFt8ECyI9te3ThOo0lFOOOgWNRoi342u/v1
	 Et9nNmvXOVLYu7wuDV/iKIpHJaiJMOA3+oJ/raCYSaJL0+sReOAelJk8Q5krLm7HD4
	 fSpqig7oxBCTtuskF6hwjHMCHGC90JT4YOEDnDcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FC49F80678; Tue, 18 Jun 2024 13:25:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC8CF8067F;
	Tue, 18 Jun 2024 13:25:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85A4DF8023A; Mon, 17 Jun 2024 16:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D0E3F80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 16:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D0E3F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fEy5T0UG
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-440f22526edso22879521cf.0
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 07:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718633090;
 x=1719237890; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuiBnTAk1GdD7Nn+nX9o9bL0mw0aUr07eq17+hCN0VA=;
        b=fEy5T0UGCoWhkJGtYdXpi95FnVl65XP4ZyT+a35Nudpkq6zX7b8xezXWQzGj8+tpuY
         k35LLcdNmP3B6c5ECFKgIz0jyH1Fyyn5b5n+6jcjdVMbp2LkNCf9V7mu2Jq3+2t1DYgT
         Ldar0ZElo+Y2MufMDj0gt+J5fz8PgQ2Ntx+LvSBaglC1SJnZA4bAYDjeGzo5X5oTrSSj
         HNqgMPheo9f/mxDW4paBO68Oc4I3gKwk5B/3W01zhc0wXw6oQwf0Fhl9ZuKfcW20PENa
         zwIVdpOpR/E6EYduDGwxvr4DiDcSG3SkCBvtwC70PyVuCx/bYovm/OXaieNh3PKk7a75
         3Q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718633090; x=1719237890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuiBnTAk1GdD7Nn+nX9o9bL0mw0aUr07eq17+hCN0VA=;
        b=GpGl/5mWP9yLlsAHXhFXBzNkMDHUiIRzyAiNZWB/L/gQyAIALRnHxi3x2/Ez6aojGa
         gKc+0gwzIFLLYxpYDrO7cgdi7pIcY2/yZhQH4/QhZppkWJcAtY0LgaeonJxT2Jq/Q3ik
         CMZOAprNtl7sB63985N8nwQrnMFlMhxgHxBOWMCx2MQrKoiUDNsLKAvBxvotl8SqP0gO
         ck+MsavEy6CEQ7/V1cXqhlp0qHbVpCRIV5zsuQfM07pOfluZDrwVjPZTNMfjyXC4GIil
         +OWdFFWoJylFo7ZGJnN460HlIKQZWjPpEoCGbzPabMFGK+iZ0qmAhFETtv9fXJrPIAZC
         95+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM005b/rqdMFVfXhj/wHjo9GB+8dT/ffRZoZcPsjrNsJB/eHWc78G50cqGqs6VJHI1gXG4jAMvf4rOUmiA5eEa3UvjZE0z8KfAUpU=
X-Gm-Message-State: AOJu0YwF8ie+YjrIalZlyX2G7y74XOod3aD6D+jmwJ103B05O0pGuZh5
	DepUV9Aq1oLbCVlelVGsS47Dncgfwb7V4RmhZs7xsUM137EEgGSJkn0mkYTEOikh6upVWMq+q+Y
	JShQYZhelczf//6QYw7DDuAiBJNeXgUE6gydSFiJtD/8hdQ0kmS3TOA==
X-Google-Smtp-Source: 
 AGHT+IHgt8vcIdjEnWNHVtl+wLq4vY15nqjqT8vHj/DvbcH6/AFoCHKztbbB0oihPAkdtwCT0DqCv4v4/vIp7abnqNw=
X-Received: by 2002:a0c:db01:0:b0:6b0:6dba:c947 with SMTP id
 6a1803df08f44-6b2afc8d656mr92366246d6.18.1718633089663; Mon, 17 Jun 2024
 07:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-2-piotr.wojtaszczyk@timesys.com>
 <83cbf43e-c927-449f-8b7e-5c8d3ee8cece@kernel.org>
 <CAG+cZ06EeXUDiLsDXkz+6EHqJwpvv2MWwfpvB8AYw0=ZhUkTfQ@mail.gmail.com>
 <83a45f7c-d90b-44d3-b57e-9dad21045e27@kernel.org>
In-Reply-To: <83a45f7c-d90b-44d3-b57e-9dad21045e27@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 17 Jun 2024 16:04:38 +0200
Message-ID: 
 <CAG+cZ06kzikieaD_JCBybwWk8XKZQjJxa34Cg4QHxrxpT+j0eA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
 "J.M.B. Downing" <jonathan.downing@nautel.com>,
	Arnd Bergmann <arnd@arndb.de>, Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: E7ZC5ZS4K6QV5IYGODE75W5BBOMIU4GV
X-Message-ID-Hash: E7ZC5ZS4K6QV5IYGODE75W5BBOMIU4GV
X-Mailman-Approved-At: Tue, 18 Jun 2024 11:25:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7ZC5ZS4K6QV5IYGODE75W5BBOMIU4GV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 17, 2024 at 2:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 17/06/2024 11:33, Piotr Wojtaszczyk wrote:
> > On Sat, Jun 15, 2024 at 12:01=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >> Do not attach (thread) your patchsets to some other threads (unrelated
> >> or older versions). This buries them deep in the mailbox and might
> >> interfere with applying entire sets.
> >
> > I'm sorry about that, it won't happen again.
> >
> >>> +  dma-vc-names:
> >>
> >> Missing vendor prefix... but I don't really get what's the point of th=
is
> >> property.
> >
> > Is "nxp,lpc3xxx-dma-vc-names" acceptable?
>
> No, because it does not help me to understand:
> " what's the point of this property."
>
> >
> >>
> >>> +    $ref: /schemas/types.yaml#/definitions/string-array
> >>> +    description: |
> >>> +      names of virtual pl08x dma channels for tx and rx
> >>> +      directions in this order.
> >>> +    minItems: 2
> >>> +    maxItems: 2
> >>
> >> What part of hardware or board configuration this represents?
> >>
> >> It wasn't here and nothing in changelog explained it.
> >
> > That's information which DMA signal and mux setting an I2S interface us=
es.
> > It's a name (bus_id field) of platform data entry from phy3250.c in
> > [PATCH v3 3/4].
>
> platform entries from driver do not seem related at all to hardware
> description. You know encode driver model into bindings, so obviously no-=
go.

In this case platform entries do exactly that, they define which dma
signal number is
routed to peripherals in LPC32xx. They describe hardware capabilities
of the pl08x dma
and which AHB bus the dma is connected to. This was carried over from
linux versions
before DT was introduced.

>
> > It's used by snd_soc_dai_init_dma_data() in [PATCH v3 4/4] to give the
> > dmaengine a
> > hint which dma config to use. The LPC32xx doesn't have yet a dmamux dri=
ver like
>
> and if I change driver platform data to foo and bar, does the DTS work? N=
o.

They shouldn't change the same way as expected dma-names shouldn't change.
Lots of drivers expect the dma-names to be "rx", "tx"

>
> > lpc18xx-dmamux.c therefore it still uses platform data entries for
> > pl08x dma channels
> > and 'SND_DMAENGINE_PCM_FLAG_NO_DT | SND_DMAENGINE_PCM_FLAG_COMPAT'
> > flags in the devm_snd_dmaengine_pcm_register().
> > Typically instead of this platform data you would use regular 'dma'
> > and 'dma-names' if it had
> > proper dmamux driver like lpc18xx-dmamux.c
>
> Exactly. Use these.

Then I need to write a lpc32xx dma mux driver, device tree binding for
it and adjust the
LPC32xx I2S driver for it. Is this a hard requirement to accept this
patch set for the
legacy LPC32xx SoC?

>
> >
> >>
> >> Drop.
> >>
> >>
> >>> +
> >>> +  "#sound-dai-cells":
> >>> +    const: 0
> >>> +
> >
> > The "dai-common.yam" doesn't declare a default value for this so
>
> Where is my comment to which you refer to? Please do not drop context
> from replies. I have no clue what you want to discuss here.
Well I didn't remove the context, you said:
"
Drop.
(...)
+  "#sound-dai-cells":
+    const: 0
"
So I'm confused whether the "#sound-dai-cells" should be in the dt
binding or not.

--=20
Piotr Wojtaszczyk
Timesys
