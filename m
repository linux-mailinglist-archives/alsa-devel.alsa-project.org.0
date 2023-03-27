Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B76CEEFA
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90A7384D;
	Wed, 29 Mar 2023 18:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90A7384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106470;
	bh=wS9Ps8YwAeHz6iy0C1ECxRrbhnj6X7+BiYQboAoRFqU=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cYVsAGo2kY8Dji3vKap/TjkmKjYtt/ePDHt7JltMdPyNxeJ1YbLSFy+FPhHcb7M9x
	 aOs/8yUt3Edg+OlDbtclGCoVAZW67xLwD+xo/FvY3yCtTiQ0XgAKhic3KN/l/53yUn
	 74pBi+K544r7GisFQJOL18DeXNo9CHxl5M5NE1iI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78A8BF8055C;
	Wed, 29 Mar 2023 18:12:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 320F0F80272; Mon, 27 Mar 2023 16:49:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBE72F80249
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 16:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBE72F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZUc8vRqW
Received: by mail-ed1-x52f.google.com with SMTP id ek18so37287721edb.6
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 07:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679928550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVHxlnW6dANW4bLJRZbyNubcNIn9eicFT4GW59KFMWo=;
        b=ZUc8vRqWh6v/KqWmwKnujcqsPGQN3AW1a+uNsjsdxxanX7O7AMqYHKSAyA8x334HOH
         buEyjMByhK//Rdsdo8FjuDhiLgMiDmOc8AI4AlbC65I401Ijb5C5thKepIZZWihZbAU5
         aQbZX/lFNdpFzM3+aMJdnfHqAYgrAgyh145V8iWmJLj/0YUkx7Hq9ZU2UqQn7kIxWiKt
         WTXAQdfBCanT9GjmOFEpZ/MClBMDf6IeK7M15IN4LaVIhFsdNe93YqkRT67jsYYZ4I6q
         C6jInxjEdOj5O5d5pP0t0nhgmFN7O/kbge/JDT7slKDx0t2HD1nuUWRDJcICajEU98ON
         Gm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679928550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVHxlnW6dANW4bLJRZbyNubcNIn9eicFT4GW59KFMWo=;
        b=Eol1IbV8cej76Ti/p10G95VJ5y9a1CBA29jldleTgP79Io6Y5PjdNwubhesxatwSfa
         szn/jAzuuJv/IQS2DW7kbeh+SLUsMllLWFIS+2/F78qc6fNlmtrv+7cpy7fN18FLsNLw
         BQBGEbNMIBrkEiZc01FZUhl/YMZnqW1ZcWnDVl4or+xGntc/uZHdttlqsWchSII8ED8d
         JPCDg5rNCz00N9WQ3J8uJzM/3/8Oe1GMi3FIe0JQxiB5T0MaNrUsR4KyKsTq+6j55S1Z
         5iEDNDVh2xGujo6/g+nwjR42gZmvANafe3ZtmyHFWq9OcFMpp+VbI2bNF/wvmkiaAtgS
         5tPQ==
X-Gm-Message-State: AAQBX9cjUe4+G+NO8o1q0bvEDPU1+F8jzdgnm2K/5G0p+99o0rKhezlu
	9qhMxXyDZxr4+JOTTHMmTgyEQ7CNdxERWvcJYU4=
X-Google-Smtp-Source: 
 AKy350bLAuhq1B5VAnk84Reany6FBtJSeXd0DNWssq5L/sg2ql7zOJLzmZgRzAgmBOidC0R3bHa0gzzxXlGQc4Lojys=
X-Received: by 2002:a17:907:80a:b0:8af:43c6:10c0 with SMTP id
 wv10-20020a170907080a00b008af43c610c0mr7494741ejb.1.1679928549993; Mon, 27
 Mar 2023 07:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230325083643.7575-1-clamor95@gmail.com>
 <20230325083643.7575-2-clamor95@gmail.com>
 <20230327083208.GQ68926@ediswmail.ad.cirrus.com>
 <CAPVz0n1AaTzdwmfkxaUX5peAiQ2K73aoqKfLUy1jwEE6__uG2w@mail.gmail.com>
 <20230327101429.GT68926@ediswmail.ad.cirrus.com>
In-Reply-To: <20230327101429.GT68926@ediswmail.ad.cirrus.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Mar 2023 17:48:58 +0300
Message-ID: 
 <CAPVz0n1fOB8W43B+jfFWB_8HfBzVtn7pm_NcD-GOocaqt1MN_A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ASoC: wm8903: implement DMIC support
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: A5DFOFISJ3Z2TUTXJCDSYOAEIIGABGJZ
X-Message-ID-Hash: A5DFOFISJ3Z2TUTXJCDSYOAEIIGABGJZ
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:12:30 +0000
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A5DFOFISJ3Z2TUTXJCDSYOAEIIGABGJZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=BF=D0=BD, 27 =D0=B1=D0=B5=D1=80. 2023=E2=80=AF=D1=80. =D0=BE 13:14 Char=
les Keepax <ckeepax@opensource.cirrus.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Mar 27, 2023 at 11:37:05AM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 27 =D0=B1=D0=B5=D1=80. 2023=E2=80=AF=D1=80. =D0=BE 11:32 =
Charles Keepax <ckeepax@opensource.cirrus.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sat, Mar 25, 2023 at 10:36:43AM +0200, Svyatoslav Ryhel wrote:
> > > > Add DMIC input and routing.
> > > >
> > > > Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF300T
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  sound/soc/codecs/wm8903.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
> > > > index 41346e5ec5ad..9c2f0aadcff3 100644
> > > > --- a/sound/soc/codecs/wm8903.c
> > > > +++ b/sound/soc/codecs/wm8903.c
> > > > @@ -9,7 +9,6 @@
> > > >   *
> > > >   * TODO:
> > > >   *  - TDM mode configuration.
> > > > - *  - Digital microphone support.
> > > >   */
> > > >
> > > >  #include <linux/module.h>
> > > > @@ -816,6 +815,7 @@ SND_SOC_DAPM_INPUT("IN2L"),
> > > >  SND_SOC_DAPM_INPUT("IN2R"),
> > > >  SND_SOC_DAPM_INPUT("IN3L"),
> > > >  SND_SOC_DAPM_INPUT("IN3R"),
> > > > +SND_SOC_DAPM_INPUT("DMIC"),
> > > >  SND_SOC_DAPM_INPUT("DMICDAT"),
> > >
> > > There is already a datapath for the DMIC here, DMICDAT. Are you
> > > sure you don't just need to set the "Left/Right ADC Input" muxes
> > > correctly through the ALSA controls?
> > >
> >
> > I will check once more, but so far I was not able to set the mic to
> > work with DMICDAT. Only with this patch.
> >
>
> The two should be basically equivalent when the controls are set
> right, your patch has:
>
> DMIC -> ADCL
>
> The current code has
>
> DMIC -> Left ADC Input -> ADCL
>
> The only difference is that Left ADC Input sets the ADC_DIG_MIC
> bit, but the datasheet clearly indicates that should be
> necessary for digital mics to work. Does your system definitely
> have DMICs? Without that bit set the decimator should still be
> connected to the analogue front end.
>

You are correct, this patch is not needed. It appears that the
issue was not in routing but in wm8903 gpio configuration.

DMICDAT works as intended.

> Thanks,
> Charles
