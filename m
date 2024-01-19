Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D81832CFC
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 17:15:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8228827;
	Fri, 19 Jan 2024 17:15:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8228827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705680917;
	bh=B7zL9FKEcp0/CRVmWRJ5gFi5msLCspc37+NygTzDgY0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=btmVUNmA0zmZhOYwmtLYpwGTXou2lhm22COLqUd6jbdjEoK30Z/4vurqwP7XS5A0W
	 2UQeqFYaFOhfBE5s7GLQl8wQA8oI76MjRS4ZcAqfjLoO5CDm2PKGO2ej8MS9FL/Joy
	 KJULobziYbzfa7XosZ3KAMRA19zpNmsPSbEvfmRg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8075AF8057F; Fri, 19 Jan 2024 17:14:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08CB9F8057E;
	Fri, 19 Jan 2024 17:14:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12F28F8014B; Fri, 19 Jan 2024 17:14:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F957F8003A
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 17:14:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F957F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NQuDFEId
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cdfa8e69b5so11126581fa.0
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jan 2024 08:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705680876; x=1706285676;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZS8+douymIyp/G1h1ov9Y1Rdr9Hj7ajOnwayf3/aT4=;
        b=NQuDFEIdNTYDJkb3PUXpLBKCDqo5iNTE8fn4WcMgutCvZFs1l6JFzsJv/F0w29Rea9
         LUGDm5TlwaPPIkd4oCKqgbK1EPtwM0zE9vJiP40xRLF4DhBCJ0eSae50xRIb6xZfT+bo
         LRIDYdBT/LtLEaX0K1nO2vjF4UbT6KdyWgAyNmbWqQ60Q0elfRfGONGyizbfeeZFgRzF
         q9P7tf3dAJ5qkmecYSD0iBZ7uDn/og2A1DlwO65awIYWW1gdKjF4kHnnHegxtnnPiNiP
         /SP4vdJ0xYu4b015dslz4sIqjUSUK4P+vw6LnIN15paSYKH12oEnFME1asXuD0zlH6IF
         QCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705680876; x=1706285676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZS8+douymIyp/G1h1ov9Y1Rdr9Hj7ajOnwayf3/aT4=;
        b=VByIZd/5k2+aVTbRNDvWZKDbgvt7gLp0E8GuepMHslaKQFhD7YrSlpUPogucQpAw8S
         FGDtH/BDMVao3gehnWCp0PLj0dy74Q6u0ZQ+IXkgJcMgh+O/B6Y9paSog/ga9Jv9rYAN
         QVDn4aPeBIq5/SpeHXe5FHPRe+mnpN4HmCebgTxkn3w4wiq6wIvyHIaO5iIA2E89wMFu
         4ZvMKD6IenhCW6ADY/AIK/OjdE5WMpSWG3k2dPUheaxjjqGTjcNGi7Q7lhu6HSbUQUl3
         33HaG497deV6F3jJdR/6LYJvMXmtmErYKivV3ManITZziO/vLTtlD+XZW4FXpzF9Tcj/
         rJkA==
X-Gm-Message-State: AOJu0YxG8PHk0vjyNXRP0f9sV9Y3jIJ8pcs5deamdBOa/FCYcfFBkNyR
	O+ThQZuOuyrS8Am0uXHXHZQiSL+5zfBnn7w9ms6xPVZXO3W56wu81Afr8XjArAYxQSwN47zKnn8
	JL+ca8226YTdj//E220+eK5bGGy4=
X-Google-Smtp-Source: 
 AGHT+IG4AWmyvk46hSLjREkIbqUt4PdjznNPm5PSf/hR21IX91v4MVnC382ND6Wc/ywvktNtzGzpa2ROJvpEuxdLURM=
X-Received: by 2002:ac2:446e:0:b0:50e:7be8:46fd with SMTP id
 y14-20020ac2446e000000b0050e7be846fdmr519933lfl.208.1705680875590; Fri, 19
 Jan 2024 08:14:35 -0800 (PST)
MIME-Version: 1.0
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-7-ckeepax@opensource.cirrus.com>
 <Zali4qxdegY7H6eY@surfacebook.localdomain>
 <aec96f5a-b759-48c7-a5ec-bafe3bfa5357@sirena.org.uk>
 <CAHp75Vd6JtW4ddbSPXUp6WgEdBJizjwnS-XZzwLcXWWLxFWp-w@mail.gmail.com>
 <b1889bb0-2b9f-477c-80d3-a636b9017ea4@sirena.org.uk>
In-Reply-To: <b1889bb0-2b9f-477c-80d3-a636b9017ea4@sirena.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 Jan 2024 18:13:59 +0200
Message-ID: 
 <CAHp75Ve=SR_M5NGtu50Eu1Gw_g8mGfk1RAub22QZn3rwGNw+ug@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] ASoC: cs42l43: Add support for the cs42l43
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lee@kernel.org,
 robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ZLVMXPYTVAK7BEOJ4R5UJY2UPHFEL3YI
X-Message-ID-Hash: ZLVMXPYTVAK7BEOJ4R5UJY2UPHFEL3YI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLVMXPYTVAK7BEOJ4R5UJY2UPHFEL3YI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jan 19, 2024 at 12:07=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
> On Thu, Jan 18, 2024 at 10:46:28PM +0200, Andy Shevchenko wrote:
> > On Thu, Jan 18, 2024 at 8:11=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> > > On Thu, Jan 18, 2024 at 07:41:54PM +0200, andy.shevchenko@gmail.com w=
rote:
> > > > Fri, Aug 04, 2023 at 11:46:02AM +0100, Charles Keepax kirjoitti:
>
> > > > > +   unsigned int hs2 =3D 0x2 << CS42L43_HSDET_MODE_SHIFT;
>
> > > > BIT(1) ?
>
> > > Given that this is writing a value into a register field called "MODE=
"
> > > it seems very likely that it's an enumeration value rather than a
> > > bitmask (and similarly for all the other places where you're making
> > > similar comments).  Please think a bit more about the code being
> > > commented on when making these minor stylistic comments.
>
> > I read a bit further and have given a comment about this as you put it
> > above that they are plain values.
> > Please, read my comments in full.
>
> I did eventually find that while going through the other comments but
> given that the earlier ones hadn't been revised and it was all a bunch
> of different fields it still seemed useful to highlight, if nothing else
> it was a little unclear that your later comment applied to all the
> fields you were asking for updates to.

Yeah, I was thinking about that during the review, that's why I first
commented and then concluded that those comments are kinda bogus.

> In general in a case like this where the code is already in tree it does
> seem like it'd be better to just write patche for the stylistic issues.

Sure. I believe Charles will address some of them, if not all.

--=20
With Best Regards,
Andy Shevchenko
