Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D68A269F012
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 09:21:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3FEEAA;
	Wed, 22 Feb 2023 09:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3FEEAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677054099;
	bh=xSs/5S9g9qYao/wUrKBU21ZIOn42gPiBDqagDkNYrAc=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P2CjV0mPMYS74SvfLLkDTc9eF/7awhS0N+jMHpkk0LOUr40SHtwPDkSwMscEXEILI
	 h6+LkbE3vIeXdGBV7X9swpYZQ5nE2lrv33iNmQE0TJw2IYuCyfbVudg54jyOfJ95Pk
	 nDTZLyUt3h9e7nTNPqnurXh4qzLuxjO/gjygkOZc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C164F80529;
	Wed, 22 Feb 2023 09:20:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9B10F80266; Wed, 22 Feb 2023 09:01:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43F39F800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 09:01:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43F39F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Rl94logt
Received: by mail-ed1-x52c.google.com with SMTP id o12so27298898edb.9
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 00:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlCUWg0V7l7YUSFlT2P4WSzL8o1xqPnxClcbe1tdHhY=;
        b=Rl94logtw4OVPqPkZoH4YHWPBNT3fyRn557I+IuZXOjTQ6+SNRJv/yPjxTH7tqT/cX
         XqdgxXSF/K1SIOSpT5NOUEsjlxlfJTVryaZ8b3sFcDTPV9o8Fs3G8E/p3Din+nmvhwqG
         jnsU1pAYzmwAb3+YnPpteyIFwj2G9PbmIyBN0Zb+8u7c3TOF3sEdQo9R9UMBzdZJ4AHm
         kIwc732yOVbngdGgQ7+OnHhqc5PeGrLNBbQ5NP6yJPKA1628qh2WKYMJRKCktkL09INm
         1UypSen/+pfeV4QsLVudfBjaayKL7+Zuwo3lWCdZRQU+jfGd4vfDBM+byg01SzdluKKV
         wZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlCUWg0V7l7YUSFlT2P4WSzL8o1xqPnxClcbe1tdHhY=;
        b=UrJoHuaO1vBfr5A6AFoITfAN3qmRF1IphpS3CRic4reZ55DzAa/NpJPKiMJkh9hFet
         3RF3VnPqMVkfeoz4QtRDllHEQWk6XzrzXrdGI7hYvgLSbefzjrBHFQOUafb6D6MP0kzz
         eZ7+CyDorDPq6xTOnTU/VQv7wjx3uC2t20FQupZ/2w7Ku/ZjNEGpgfmlvjtI9RpN5r0K
         CwVuXG3AP0ABQR+R2XTbb6PFQZbIme8fdIKg0K0RjbOfzmQ6/uwM4Sn1UEZElcHL2r7C
         i2w/83hmQYZ6eknuB0so+XthzK1zt+c1rOi6rVxUOg0a8j71YwwTAr02VgMGUpEU277c
         0cSw==
X-Gm-Message-State: AO0yUKVqvHRnAS1r+cXYVp81gxa9oPFMT7CEhEuUpJ1FOfRohXFE4+VJ
	IdKDm56UpHM0kaJntQt4xwY+EiQ7WFMLx7jcZWQ=
X-Google-Smtp-Source: 
 AK7set8xj9lBdPeX62Xma1nch2YV8vlnSz2QDZ40dpKo54vg1GEVrx1VOsdhxrUMU5EtCKQf3KkPFyAZRbFUahGuKdI=
X-Received: by 2002:a17:906:4c49:b0:87b:fa21:7953 with SMTP id
 d9-20020a1709064c4900b0087bfa217953mr7243891ejw.8.1677052869804; Wed, 22 Feb
 2023 00:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-5-clamor95@gmail.com>
 <Y/VEUaOIE1mk1utt@sirena.org.uk>
In-Reply-To: <Y/VEUaOIE1mk1utt@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Feb 2023 10:00:58 +0200
Message-ID: 
 <CAPVz0n1kkXQDNhzFoa8xwqaFErNDTHSaqM07TDUHRPSnH+PvkQ@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] ASoC: tegra: Support RT5631 by machine driver
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JNYEKVIWDEEIFHOVEYMSJZVY44BYEVYT
X-Message-ID-Hash: JNYEKVIWDEEIFHOVEYMSJZVY44BYEVYT
X-Mailman-Approved-At: Wed, 22 Feb 2023 08:20:07 +0000
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNYEKVIWDEEIFHOVEYMSJZVY44BYEVYT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D1=81=D1=80, 22 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 00:23 Mark Brown <=
broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 21, 2023 at 08:32:05PM +0200, Svyatoslav Ryhel wrote:
>
> > Add Realtek ALC5631/RT5631 codec support to the Tegra ASoC machine driv=
er.
> > The RT5631 codec is found on devices like ASUS Transformer TF201, TF700=
T
> > and other Tegra-based Android tablets.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Ion Agorria <ion@agorria.com>
>
> Your signoff should be last if you're the one sending this.

Thanks

> > +static unsigned int tegra_machine_mclk_rate_6mhz(unsigned int srate)
> > +{
> > +     unsigned int mclk;
> > +
> > +     switch (srate) {
> > +     case 64000:
> > +     case 88200:
> > +     case 96000:
> > +             mclk =3D 128 * srate;
> > +             break;
> > +     default:
> > +             mclk =3D 256 * srate;
> > +             break;
> > +     }
> > +     /* FIXME: Codec only requires >=3D 3MHz if OSR=3D=3D0 */
> > +     while (mclk < 6000000)
> > +             mclk *=3D 2;
>
> It feels like this is complicated enough and looks like the
> clocking is flexible enough that it might be easier to just have
> a table of values or otherwise enumerate standard rates, seeing
> the code I feel like I need to worry about what happens if we
> pick a clock rate over 6MHz (the loop could give a value over
> that), and it's not clear why we have the switch statement rather
> than just starting at a multiple of 128 and looping an extra time.
>
> I suspect there's going to be no meaningful downside for having
> the clock held at over 3MHz on a tablet form factor, the usual
> issue would be power consumption but between the larger battery
> size you tend to have on a tablet and the power draw of the
> screen if that's on it's likely to be into the noise practially
> speaking.

This is how downstream handled mclk rate for RT5631.
