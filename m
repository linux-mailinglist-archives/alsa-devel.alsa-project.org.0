Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9F5574C7E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 13:54:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB9BD18E2;
	Thu, 14 Jul 2022 13:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB9BD18E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657799660;
	bh=v3S1oxOrLPOFQUnVdn8/42MngtfIe1CIqcmrvTY5ces=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZN6Q800/TgvJlA3ngONJVxMUFr7YBWMTeeS0ZVKKaw9MO8c45Off3CTR6MkHKSaym
	 aK/H4jxIJgsmZktJvAEZyNNs0Y8jcUcdYl7dCxjHSOmAc9bt37ncyAjzuQCeZMbvn4
	 fvCRYTwcah2/0SgaMrBiho85+6Nz41E3m1bjBMrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43497F800B0;
	Thu, 14 Jul 2022 13:53:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42638F80165; Thu, 14 Jul 2022 13:53:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E79CFF800AA
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 13:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E79CFF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PgDW763D"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C28FFB82489;
 Thu, 14 Jul 2022 11:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09266C34114;
 Thu, 14 Jul 2022 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657799592;
 bh=v3S1oxOrLPOFQUnVdn8/42MngtfIe1CIqcmrvTY5ces=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PgDW763DmezuWVK7CBFwrSOnt077Siv66ICMHUYS48oeUpwxGUDZz/MvRuS7bUr9+
 Se/ikQrr3YJnjEXgJrICLMtYePmRId0CGydKWMk3R+7G0pMR3YC1UOvMInYnHCKjUp
 dC4DR2wr1rd15H1fo1SsjG11Sz6V2NDPLn7b89iZyi1BZaKQqOvib64aBWHJtwEBes
 zwlvFMBXVxj4IN/KHFj1LcMcF4zDYU7nJlSbsccGXoakjzbBOSa8H3ND+rMh79I6D4
 +MTYpGufJcTTTxMzQu6StCCjqIeoZjQVf5tCDQ+7f31JK6QhtfOljdjMz0jWmF2zOs
 SYB3uuHaNV9sg==
Date: Thu, 14 Jul 2022 12:53:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: add support for ES8326
Message-ID: <YtADo0TJccwLRmKC@sirena.org.uk>
References: <f88ec5f9-b46b-e72d-1fc3-668b834ed105@linux.intel.com>
 <20220714022617.6345-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eNZ2NNqhlW6tYGzv"
Content-Disposition: inline
In-Reply-To: <20220714022617.6345-1-zhuning0077@gmail.com>
X-Cookie: The devil finds work for idle glands.
Cc: zhuning@everest-semi.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, yangxiaohua@everest-semi.com,
 tiwai@suse.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--eNZ2NNqhlW6tYGzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 10:26:17AM +0800, Zhu Ning wrote:

> >> +     snd_soc_component_write(comp, ES8326_ANA_MICBIAS_1B, 0x7c);

> >this ES8326_ANA_MICBIAS_1B register is also modified in the workqueue,
> >could this lead to invalid configurations?

> In es8326_irq, MICBIAS is turned on to detect headphone from headset. Whe=
n an unpluged
> event is detected, MICBIAS is turned off to minimize pop noise. Maybe a c=
omment/macro for this?

The issue is that both the workqueue and interrupt are modifying the
register - what happens if they race with each other?

Generally it's better to manage the MICBIAS as a DAPM widget and then
force it on when needed for jack detection (search other drivers for
examples) and then let DAPM worry about refcounting.

> >> +     dev_dbg(comp->dev, "gpio flag %#04x", iface);
> >> +     if ((iface & ES8326_HPINSERT_FLAG) =3D=3D 0) {
> >> +             dev_dbg(comp->dev, "No headset detected");
> >> +             snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);

> >should you check if es8326->jack is set?
> >in the 8316 driver you have a check for a spurious interrupt before
> >set_jack() is called

> I haven't seen other codecs (rt5640) handle spurious irq.

A lot of devices have a chip level reset register which they use to get
the device into a known state during probe, generally the detection
logic is turned off when the device is reset which helps here.

> >it's rather odd that there's a resume but no suspend?

> Since the codec loses power on suspend. It's also odd to write to the reg=
isters when they=20
> are going to be cleared during suspend. The lost registers need to be wri=
tten during=20
> resume though.=20

You shouldn't rely on the device loosing power over suspend, a lot of
systems will do that but it depends on the physical design (perhaps the
power is shared with something needed to detect wakeup).  It's best
practice to get the device into the lowest power possible state before
power is cut, things that don't impact power can generally be left alone
though.

--eNZ2NNqhlW6tYGzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLQA6IACgkQJNaLcl1U
h9Bcywf9G72qZD4FhObbwg5yvhfOvJsliwIsQafuOjYTiGtWD1KWbBIW3zQ06tHW
x/gfUEbYuD2tDMAggicTlok6XlsJvLO6luvlduI2uzH+e4BqHQI5rHKqLJZGYyym
h5CO85kv65GQsJ5hnF2eJMVKFuyASr/iie/a9a0uVs780GysAHQKd0AZKsUGy7iQ
IDrBRzh/WTacIiznRzDEY1UPlMiEi93QDONpAB7WtVil4YtNVAdCVzksaBc1BIXA
r/HVYudpVZAWYpgRzYvY5AGA2Sjq0gasTKP6tP+lmX+xMG0DmZnBj5c+reAOetzR
dVksY5j+SieMHkgchZ5cqBjxJqSfQw==
=mc9b
-----END PGP SIGNATURE-----

--eNZ2NNqhlW6tYGzv--
