Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1B290780D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:16:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1CD620C4;
	Thu, 13 Jun 2024 18:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1CD620C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295387;
	bh=/jcoXUR9wDP6KAAPbxMnAdcj2368TaJUtRP9CxBQamU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=va9cq50NAcGt8o3eJDCelLR3NxzmexrV+xXVQN6Iz4rnCENZx5kgDZbdkGR0NGt+p
	 EVI+MzjKl4hJyQajiDxjyhO9pJVA+S/f3PHMiPp0KmnbeMyFsms5vzGCrSW7SdKn/a
	 FFnupS5zjruDNeKbIs+vxQNYxx9bafOuZyLj0rts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1501FF899CE; Thu, 13 Jun 2024 18:05:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A59A1F899C9;
	Thu, 13 Jun 2024 18:05:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4C5AF8057A; Wed, 12 Jun 2024 09:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33ABDF80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 09:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33ABDF80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0QfiTiZP
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-62f8dcbd4b5so6600277b3.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 00:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718178908;
 x=1718783708; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8zvLumEmzHSVfDBX+K3KODMcTb3eNmXQ7W6gFdSMig=;
        b=0QfiTiZPUkLNF7XB4luGiAzJzamGkQD1QcelNbmbOXwopC8ugERZfhCUjMLFGcWvfp
         iC91QuVZFszRdwg/6SkpmtDnkyNI/TCpcmK8LtwNihjXxJ6k3eRCcN3Nh2O4CEJslRjJ
         DWiXWTD1QJRq644VfZmwLrc0lyC7KB4q5XOawvxrdmEzkY0ISJ22/fERaVK5WbI9V5VQ
         xF583wF90ZrCDN/yn0Y+SCR2MgsrZfEofu1Ab/THTalhfOhoer0gg2jhWO9cu/wi9VyM
         M5B2yJQdGr404ss4mUkD83H0MijAZ9zlRGaeE9ZcRW1C7BJl3wCu49usjHTvBcn8SkdN
         mX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718178908; x=1718783708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8zvLumEmzHSVfDBX+K3KODMcTb3eNmXQ7W6gFdSMig=;
        b=uNjD//LHsj3nO2wQkF6/B6/iTeAL/Vzhrje/FJMs1pr/SyP+WmnYk2V7Rpkt3UNevA
         fW7yWrTzpHM9oTgj6zEtx1PuzkiIXzjWBcgm1TgczWr8u/i3ZuzToTTJRf/26hTpoyAh
         5lRwoNzOf7TifhzVuG13UVFu+ut2eyGTKB7nl5rCu315fp3M9op9+IJ2zJp+cMaCCXr2
         7+G+SZfVJ5cYyeI/vhpUhjGsnGCMmuEvbzihWsNOMjBQue9aZ2KpMGCHkwq1oRMf8vnJ
         U3CSOyGVs2qIIqGYXqkKOz2S7FZZPMFPF/I8mgxX1Zeyl7Fh2SBQbgRzUxwmZfVlOymy
         2u+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1ouBEZDN0kN9jSSsCbiwfVybDbzlKOKxe4iAXGwEltnXmWZbaqIS9Q8HHdNWYFsaBi3MfUs6uPpBNzAJUTF7AB6adinrdTcLwMGk=
X-Gm-Message-State: AOJu0YxOv5zj2ACROlz4wwyaSiH8EXr0I8cVOVmavP+5iq7LHYUWXgJ7
	zs0cqp5FR/ghuB5/OfxVRJ40k00XG3PDe+USBVx+/CWnGliXHeXLQ17uW9+7nLxfkhWV62g6JPG
	x7wbup5qyMHw8O6iWMga4sNWSZXujzXtIShi/Ow==
X-Google-Smtp-Source: 
 AGHT+IFPLy4bDjB26DeJ3OyETqud+YR8g7kmBRh3/NifyRwyRcvSuS2NJ859y2s2TX4hnMNdepvtl112sIycLjmhYjk=
X-Received: by 2002:a25:918a:0:b0:dfe:ed7:84be with SMTP id
 3f1490d57ef6-dfe67064dedmr951615276.25.1718178907988; Wed, 12 Jun 2024
 00:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
In-Reply-To: <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 12 Jun 2024 09:54:57 +0200
Message-ID: 
 <CAG+cZ05=w5KbxOOtpo99B=OHBaLNRKKJVrFT67CH1-6z1gP7ZA@mail.gmail.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Chancel Liu <chancel.liu@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>,
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
Message-ID-Hash: G7BGAD6PIFVKDSJVSO7O6QSXPNT25OPJ
X-Message-ID-Hash: G7BGAD6PIFVKDSJVSO7O6QSXPNT25OPJ
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:05:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G7BGAD6PIFVKDSJVSO7O6QSXPNT25OPJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 11, 2024 at 12:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > +FREESCALE SOC LPC32XX SOUND DRIVERS
> > +M:   Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> > +L:   alsa-devel@alsa-project.org (moderated for non-subscribers)
> > +L:   linuxppc-dev@lists.ozlabs.org
> > +S:   Orphan
> > +F:   sound/soc/fsl/lpc3xxx-*
> > +
>
> It seems a bit odd to add yourself as a maintainer while also marking
> the driver as orphan?
Nautel Ltd agreed to maintain this driver, I will add them.

> > +     i2s_info_p->clk =3D devm_clk_get(dev, "i2s_clk");
> > +     if (IS_ERR(i2s_info_p->clk))
> > +             return dev_err_probe(dev, PTR_ERR(i2s_info_p->clk), "Can'=
t get clock\n");
> > +
> > +     i2s_info_p->clkrate =3D clk_get_rate(i2s_info_p->clk);
> > +     if (i2s_info_p->clkrate =3D=3D 0)
> > +             return dev_err_probe(dev, -EINVAL, "Invalid returned cloc=
k rate\n");
>
> Nothing ever enables this clock.
It's enabled in lpc3xxx_i2s_startup() and disabled in lpc3xxx_i2s_shutdown(=
).
When the clock is enabled the bit clock on I2S interface always runs.
So this is to avoid active clock when the interface isn't used.

--=20
Piotr Wojtaszczyk
Timesys
