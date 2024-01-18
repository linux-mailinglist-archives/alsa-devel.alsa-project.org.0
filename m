Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F74832096
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 21:47:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2262210;
	Thu, 18 Jan 2024 21:47:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2262210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705610860;
	bh=YkNMcyCL6Mh/JYKmRd3zfblygFLMWofKD5+zOtT5Eos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Uo0GxNsnIwMVUG27+rM9doSox5MmiWb3DQ+c7PmoAhUqsWY/jysNCtE9EjrL1K9q8
	 Rx02HQ1dSH7BQ5knIfGs6+7FHeLC6R1lg3p9Zybs9AC9HQN0e/6retYWJeh/nHpC5M
	 uyTbEgAagP1uX26C5/Ns95LsM3jlRt3VLB0E4jvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5778BF80520; Thu, 18 Jan 2024 21:47:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EE92F8057E;
	Thu, 18 Jan 2024 21:47:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B5DDF801F5; Thu, 18 Jan 2024 21:47:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0CE1F80074
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 21:47:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0CE1F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IydW7cgA
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a2ac304e526so5166066b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 18 Jan 2024 12:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705610826; x=1706215626;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HypTLSotTTqKwVsOm+4b1Ez49+TpS5E1yzIiV5X+xQ=;
        b=IydW7cgAFpNazw4CAl53+dDnpLElSQXqXWjVduve+D/r3lXJngqrNzGX2u932C4Mrz
         Y/cWrSkEalHeM69PbeVL3gmGX2RRPtVDQQSNajNMo22VWqyf/Nqfy5dtbdQjCWBOI0Ku
         vswhebwT5kdAbRsia8rRL6Y1HKMvORhDEodp7DYCT19fTahw84WljghUhinN8Wb173Tx
         xUUm7JVEt1zqKDSz/gaDstGreKdHth1igu/4WaNUSlVOKnMjrd5vxNEwo8K2FAxN4uzY
         S9aLqIDzETHMsDKFnScaoO8SMcKtZseuHaODePNV/zj6fPqCGlCDpNbGlGm2lCylwIwY
         fmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705610826; x=1706215626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HypTLSotTTqKwVsOm+4b1Ez49+TpS5E1yzIiV5X+xQ=;
        b=upPPCBzmLLc85xWtGSp+81yCD0f1+nYfd35uLx3ifUgTSG53BbvhdkjV7UhA/WjwVj
         Y1xy00U51m3j0GwL2urs7xGmfQtztqAwB2FiI247IX3a23fh3sH9HncEW7fXXrmCioAn
         gFAcGafvRjCcISYVW3lxwomc16XtF5aAQ1baBk/1DwWJzAV/IQnrZwjucl51x4HQJwoD
         XKg5JQwUzESt6BDctjLcHsQz0t5TW0yTpNdQ0QbyQbKwzuo6ID9qTB5E6k5wjDDh6I0V
         H64isvhJFPpa9RsIC4kK/L4GtNG4h3U5mQTtDPyJ4zVy7n3c5OSV5oF6ek5VzzoQdQuX
         uSww==
X-Gm-Message-State: AOJu0YxwgUjNHx3ATIR4NOmK9yzFJWXUlwXtrT1qsNZxHx2/+HRNw3CR
	SN3TIJpjrs5NmpqByNXDiwMA3Ts0X3RTbkoXma6DyL7PF93OU9ofEEaJyh/uJ2sVHQF6F7EFzkz
	vcm7mkVyuKfF4nWqP30UA5Q/s1eU=
X-Google-Smtp-Source: 
 AGHT+IFPg1KQKOiytDCPjzr2bAiXNTOihCNCwnx04ccb1HQOAhoThFdVl8FEgsgHhgV36eaqZcfXVS1cbdKI//lMd9o=
X-Received: by 2002:a17:906:471a:b0:a2c:7293:af58 with SMTP id
 y26-20020a170906471a00b00a2c7293af58mr906907ejq.79.1705610825460; Thu, 18 Jan
 2024 12:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-7-ckeepax@opensource.cirrus.com>
 <Zali4qxdegY7H6eY@surfacebook.localdomain>
 <aec96f5a-b759-48c7-a5ec-bafe3bfa5357@sirena.org.uk>
In-Reply-To: <aec96f5a-b759-48c7-a5ec-bafe3bfa5357@sirena.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 18 Jan 2024 22:46:28 +0200
Message-ID: 
 <CAHp75Vd6JtW4ddbSPXUp6WgEdBJizjwnS-XZzwLcXWWLxFWp-w@mail.gmail.com>
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
Message-ID-Hash: 6AZ27NIQG5OTMDKGMA2AMBRIFY5AKMAY
X-Message-ID-Hash: 6AZ27NIQG5OTMDKGMA2AMBRIFY5AKMAY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AZ27NIQG5OTMDKGMA2AMBRIFY5AKMAY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jan 18, 2024 at 8:11=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> On Thu, Jan 18, 2024 at 07:41:54PM +0200, andy.shevchenko@gmail.com wrote=
:
> > Fri, Aug 04, 2023 at 11:46:02AM +0100, Charles Keepax kirjoitti:
>
> > > +   unsigned int hs2 =3D 0x2 << CS42L43_HSDET_MODE_SHIFT;
>
> > BIT(1) ?
>
> Given that this is writing a value into a register field called "MODE"
> it seems very likely that it's an enumeration value rather than a
> bitmask (and similarly for all the other places where you're making
> similar comments).  Please think a bit more about the code being
> commented on when making these minor stylistic comments.

I read a bit further and have given a comment about this as you put it
above that they are plain values.
Please, read my comments in full.

...

> > > +static const char * const cs42l43_jack_text[] =3D {
> > > +   "None", "CTIA", "OMTP", "Headphone", "Line-Out",
> > > +   "Line-In", "Microphone", "Optical",
>
> > Better to have this by power of 2 blocks (seems it's related to the pos=
sible
> > values ranges in the HW).
> > If it's just a coincidence that there are 8 of them, perhaps other (log=
ical)
> > grouping is better?
>
> This is probably well within the realm of driver author taste...

No objection, just a question.

...

> > > +   // Don't use devm as we need to get against the MFD device
>
> > This is weird...
>
> This is normal, the splitting into subdevices is often a purely Linux
> internal thing and not represented in the firmware description so
> external resources are linked to the top level.

I meant the weirdness of mixing devm_ with non-devm_ in a way that
->remove() can be broken to the extent of oopses or crashes.

--=20
With Best Regards,
Andy Shevchenko
