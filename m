Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EA64AA3B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 20:49:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E23016F8;
	Tue, 18 Jun 2019 20:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E23016F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560883746;
	bh=RMkcDUh1T+jVPhUQT5+JSfBK0lyrR6powKCZztdsRP0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FuRuI+OLGNBNNB+MWDunAl8VN9qiT33FHAerD/igFIzRQA0E1mhAc38Rlr6p67A+U
	 GfjtBojKZfyp040KhvE/yZ7Z4hTRV3ib5NxVxB0n79AIC/rZ1kMDjKP8WMDOKsowiT
	 UucKAsNDF43ZogjjyH5UnmS2kjealtGL6KfkM/rg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F15BF8971C;
	Tue, 18 Jun 2019 20:47:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B4C4F896F4; Tue, 18 Jun 2019 20:47:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4DA1F80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 20:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4DA1F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="b7Qz7KSS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2GybvW+pvKzG30g9GQw9L9iwbdt1DhKvlt4DtJh360k=; b=b7Qz7KSSZmxUpMZGWWHLF/qPy
 Uh/Abr8TZ673wGtXFfudJl1y/K7E4W8HXP/+s41ygKirEKIhzJT5eAxS18YynY2vFz/Uj0FOUatgK
 s0dc6mT6tLv4CFDqS2GkyCX3hksbgV+QqUQhyc+JsXZJQoyBSUh8h0C3cdsdFF66iTNyg=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdJ8R-0005Ms-30; Tue, 18 Jun 2019 18:47:11 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 61995440046; Tue, 18 Jun 2019 19:47:10 +0100 (BST)
Date: Tue, 18 Jun 2019 19:47:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@google.com>
Message-ID: <20190618184710.GP5316@sirena.org.uk>
References: <20190614194854.208436-1-fletcherw@chromium.org>
 <20190614194854.208436-4-fletcherw@chromium.org>
 <4e560e12-4c20-8d5d-b3f9-587a55da279d@intel.com>
 <CAN-6NYZzMqwDaw2oDyms4P9uKFPJvuQOtGbqMWLtFV3kDyQHJQ@mail.gmail.com>
 <CAOReqxhETC9xAojXyDWLMOJ3W22Zn4GNGry44=XC=t_k7SCHqA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOReqxhETC9xAojXyDWLMOJ3W22Zn4GNGry44=XC=t_k7SCHqA@mail.gmail.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ross Zwisler <zwisler@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [PATCH v7 3/4] ASoC: rt5677: clear interrupts by
	polarity flip
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1443304482481674605=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1443304482481674605==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BQstn4t8nd6twlV3"
Content-Disposition: inline


--BQstn4t8nd6twlV3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2019 at 11:12:58AM -0700, Curtis Malainey wrote:
> On Tue, Jun 18, 2019 at 11:01 AM Fletcher Woodruff
> > On Sun, Jun 16, 2019 at 10:56 AM Cezary Rojewski
> > > On 2019-06-14 21:48, Fletcher Woodruff wrote:

> > > > +     ret = regmap_read(rt5677->regmap, RT5677_IRQ_CTRL1, &reg_irq);
> > > > +     if (ret) {
> > > > +             pr_err("rt5677: failed reading IRQ status: %d\n", ret);

> > > The entire rt5677 makes use of dev_XXX with the exception of.. this very
> > > function. Consider reusing "component" field which is already part of
> > > struct rt5677_priv and removing pr_XXX.

> > I was using dev_XXX, but I believe Curtis found that 'component' was
> > sometimes uninitialized when this function was called, so I switched
> > back to pr_XXX. I may be misremembering though, so I'll let Curtis
> > comment as well.

> The issue here is that the IRQ is setup in the i2c probe and the
> component is setup in the codec probe. In theory if the hardware is in

The component is not needed for a struct device, you must have a struct
device if you have a regmap or have probed at all.

--BQstn4t8nd6twlV3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0JMa0ACgkQJNaLcl1U
h9DZcQf/ccl646Fq6MOoLNN1gJ8spcWeyqqS0N9BX8AF0sxJxnubO0NtjYtWNrqS
yRwufehgJtFHiEubQEyDR75hAO69qzV/vdYOMyohwCo2wcS8c/l3pZqKomHdRsBb
UJQbxFdW1M1nlgfOWza83Ko9dT7cV/DnXQZquAKmwbLYaAp0BrBEoDIcjIuD7GdN
pKnmw6/oAcpcVahvg/uVSriAcRjjvaykpzXnmDB78vqJ5yRs0thrTlBtkvlE3b4B
lkymwUB3X1rSbrIMP2+8RC9vEsS96D0uyp4uL4IHFPqeOGxcdOd7k6dV/qbj8OH2
LRRkK3adUQg1tGf/ksckR/q/1Em4Rw==
=AmR9
-----END PGP SIGNATURE-----

--BQstn4t8nd6twlV3--

--===============1443304482481674605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1443304482481674605==--
