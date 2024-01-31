Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 657638448AA
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 21:20:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BD7B210;
	Wed, 31 Jan 2024 21:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BD7B210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706732423;
	bh=o4aiy10+fDl63wpHTMTWUdeIXhOIrgTQNnErR//DCa8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Apl/EWlcQzQvaTJHayiXfY4fvV5SPOuUXUwSfwYbXMwzr6oeS/zwvdI4gH9bSXwjE
	 FJma+JMAxle2aLchG6TQz60ZPysXdicdswXJXcV/VdTp8J+wMLAZubF93DDNwOZA/o
	 IrotwpWNKxw9S2DSqjT++rQxlZuqF28gNWbSdpmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8850DF805AB; Wed, 31 Jan 2024 21:19:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51F0CF8058C;
	Wed, 31 Jan 2024 21:19:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22AF3F8055C; Wed, 31 Jan 2024 21:18:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C2ACF80149
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 21:17:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C2ACF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CDXRcMTn
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a349ed467d9so15860466b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jan 2024 12:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706732272; x=1707337072;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3x+XA1EAM69Gx/EupL1JFa+ff5P92JTzUQLfIHSyz4=;
        b=CDXRcMTntRc/ktX7o+7JTLeG/Y1HJOjzgPxEuKLf2YlFJnYAIDPhgNmRAqtHN0nY3E
         z1Xnc6Qs0IsIcAQO92sDGgIC6Kw7U/w7Vhxb7i3NNfZ9eX2TDpcIkAsvAgK2LpAhX28G
         0fXXYu/G7p+XrsuJJSuPItqpEueKJJKiQtClCc9/ShqS+T0A9HqjdI7TC/4fVDM+VWzW
         drPyMAPXNDUvbLCaQhGO5davrb1HZ6S1CkOti030eBF5qzxj+1OXgTG1uDbMOKSSx6i4
         wgL9rMsXU9tx99y5u1ovUdNVX2DFB3+o4G9j58CCAfs75plQRstTta2VaPJCoQkAR41o
         twGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706732272; x=1707337072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3x+XA1EAM69Gx/EupL1JFa+ff5P92JTzUQLfIHSyz4=;
        b=fqCgPymdYdJwADd3ha9ZSu3IPzKakJ3qlMdcmFo3X7L5iVgA2kjRcUkuE7IisBYTW4
         4yKrRH14MFt9NQDs01QJfxcUR9GWovOXvHBJpwQjksY1aCVCzO6oBRAk4guMNBvgEkvv
         UYNn3za/XsqZ7xjV9F8E5q95FmZvlQQgvudtXIh4IjtLy+SGKClbR5Wslff5R7vRF89U
         i0mjmPLWNKV8opslH6CUM09itsf2vAzoeYT4rKL7q5/TZsZW1aJJGXdZlC00on0QUBQi
         G2n17iQ/4xOUTPiBLHmViseNxDcZn61KbJjHqgGpWK1i2i9bjExqeFX9vviEG49NFepf
         LlTA==
X-Gm-Message-State: AOJu0YxfbnrBQLKYRo8L+5VLPV8bB2pihpW0bQmKOx0CYzCS05sBAWxa
	hoDovsDeTTYfku3ND2WEsIU5ycfpXVz8m3no0z0HAIOA7bLxU7HOZHirBeDlauuU4zr7TncBjHv
	OfdPGuujMNQK9ijwvqGYyxRVUKO8=
X-Google-Smtp-Source: 
 AGHT+IHXBrFCx5kQCeErdbREsugyHAfbuEbibVXq02hfcq1oPmsfcZZLGhX7hXPtFYvQEPMmWMEUtGyEiepFoY1c7mg=
X-Received: by 2002:a17:906:f2c6:b0:a35:85b7:560a with SMTP id
 gz6-20020a170906f2c600b00a3585b7560amr1946530ejb.46.1706732271649; Wed, 31
 Jan 2024 12:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-6-ckeepax@opensource.cirrus.com>
 <ZalahZkCrBm-BXwz@surfacebook.localdomain>
 <20240119114917.GB16899@ediswmail.ad.cirrus.com>
 <ZbpqPuDj/v07yZ5y@ediswmail9.ad.cirrus.com>
In-Reply-To: <ZbpqPuDj/v07yZ5y@ediswmail9.ad.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 31 Jan 2024 22:17:15 +0200
Message-ID: 
 <CAHp75Vda3nZn8KwqSRvKQL9oeH_PjTnDDPuQytJvTgb2_HDvBQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] spi: cs42l43: Add SPI controller support
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7JH5UCIJMZ6RAXS2QUQ6L3QHN7RL5UT3
X-Message-ID-Hash: 7JH5UCIJMZ6RAXS2QUQ6L3QHN7RL5UT3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7JH5UCIJMZ6RAXS2QUQ6L3QHN7RL5UT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 31, 2024 at 5:41=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Fri, Jan 19, 2024 at 11:49:17AM +0000, Charles Keepax wrote:
> > On Thu, Jan 18, 2024 at 07:06:13PM +0200, andy.shevchenko@gmail.com wro=
te:
> > > Fri, Aug 04, 2023 at 11:46:01AM +0100, Charles Keepax kirjoitti:
> > > > +         while (buf < block) {
> > > > +                 const u8 *word =3D min(buf + sizeof(u32), block);
> > > > +                 int pad =3D (buf + sizeof(u32)) - word;
> > > > +
> > > > +                 while (buf < word) {
> > > > +                         val >>=3D BITS_PER_BYTE;
> > > > +                         val |=3D FIELD_PREP(GENMASK(31, 24), *buf=
);
> > > > +
> > > > +                         buf++;
> > > > +                 }
> > >
> > > Is this a reinvented way of get_unaligned_*() APIs?
> > >
> > > > +                 val >>=3D pad * BITS_PER_BYTE;
> > > > +
> > > > +                 regmap_write(regmap, CS42L43_TX_DATA, val);
> > > > +         }
> > >
> > > ...
> > >
> > > > +                 while (buf < word) {
> > > > +                         *buf =3D FIELD_GET(GENMASK(7, 0), val);
> > > > +
> > > > +                         val >>=3D BITS_PER_BYTE;
> > > > +                         buf++;
> > > > +                 }
> > >
> > > put_unaligned_*() ?
> > >
> >
> > Alas as it has been a while I have forgetten the exact context
> > here and this one will take a little more time. I will try to
> > find some spare time to work out if that would actual do the same
> > thing, I have a vague feeling there was something here.
> >
>
> Ok found some time to refresh my memory on this.
>
> The main issue here was as this is processing raw data for the
> SPI we shouldn't assume the data is a multiple of 4-bytes. You
> could write the code such that you used put_unaligned_le32 for
> most of the data and then special case the remainder, which would
> probably be slightly faster. But for the remainder you either end
> with the code here anyway or a special case for each of the cases
> 8,16,24 bits. So the code ends up looking much messier.
> Personally I am inclined to leave this unless performance on the
> SPI becomes a major issue.

Yes, the problem with the code is that it is a NIH existing API or patterns=
.
We have already in the IIO subsystem a pattern where there is a switch case
and put/get unaligned APIs per case. Perhaps this is what needs to be
factored out
for everybody.

https://elixir.bootlin.com/linux/latest/source/drivers/iio/adc/ad4130.c#L47=
2

(some shorter variants)
https://elixir.bootlin.com/linux/latest/source/drivers/iio/adc/ltc2497.c#L6=
6
https://elixir.bootlin.com/linux/latest/source/drivers/iio/adc/ad4130.c#L47=
2

Here is the abstraction for cameras, perhaps that's what ASoC might need.
drivers/media/v4l2-core/v4l2-cci.c.

> There is perhaps an argument for a comment in the code to explain
> this given it took me time to remember what was going on.

That's for sure.


--=20
With Best Regards,
Andy Shevchenko
