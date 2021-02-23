Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF67322F8E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 18:23:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 557971679;
	Tue, 23 Feb 2021 18:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 557971679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614101020;
	bh=Wjq7Hic2f6/w0DEt68eBWex/bWnDMeF9BQWhdL/aD5Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YWom95CVYwe5rpSiitBffWsaVDf4BcQridt7t12beFhiEOLkLAVDKJQ7R0/inL2/2
	 gNsqt9ZZZro/zV9CFzuxf5TnEOJSzV/QjSrpq6x/iJB6gYX+9faiw2r2wO58vqMsPK
	 qG/Q7/0hpVKssC1EEZDjix6NJcldsybn6SHT8zRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E753F8016D;
	Tue, 23 Feb 2021 18:22:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C123AF80169; Tue, 23 Feb 2021 18:22:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D987FF800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 18:21:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D987FF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RaPeRlLl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A81C64DE7;
 Tue, 23 Feb 2021 17:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614100917;
 bh=Wjq7Hic2f6/w0DEt68eBWex/bWnDMeF9BQWhdL/aD5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RaPeRlLlyhn0UKwy50gYuQDYcw3R7UbKP124ASdyjCdcGBFs0xHE/bAjwnQY/80LK
 zeYziSLucq2odghiodSx5q7iHd6HqXgQ44mw01Pxizx/HUXwU8MF5VyuC0ju1pEadE
 DjzuBERHUjztyxzPhSk94iQkBF5HJ5D2LPMiPvp7+/bJjnZPgbQ62MvSKIj9p8RkJC
 gA4lJ/s4zUvhDlH+krlGIfIaap7xNBc/9GrFE+kgkWXBQUYY8aWFCL/0FNILqVMo6L
 WSQV56tcqhbcF7bVQagSU9wwrt/9udjiqw94FOui/ueDHhsnQsvdJUgEajNUQ53LQg
 MLS0zWT6pDCsw==
Date: Tue, 23 Feb 2021 17:20:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
Message-ID: <20210223172055.GI5116@sirena.org.uk>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk>
 <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HuscSE0D68UGttcd"
Content-Disposition: inline
In-Reply-To: <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
X-Cookie: Kilroe hic erat!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Bard Liao <bard.liao@intel.com>
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


--HuscSE0D68UGttcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 23, 2021 at 05:14:32PM +0100, Jaroslav Kysela wrote:
> Dne 23. 02. 21 v 15:21 Takashi Iwai napsal(a):

> > That's one of my concerns in the recent actions for putting the
> > hard-coded mute LED controls.  So far, the only usage of led-audio
> > trigger is HD-audio, and it's enabled only for selected devices and
> > setups.  OTOH, if we apply the audio-led trigger generically in ASoC
> > codec driver, it's always done and might misfit; e.g. what happens if
> > two codecs are present on the system?.

> That's the abstraction issue. We can use PCI, ACPI, DMI or DT checks at the
> _right_ place (machine top-level code) to mark those controls with the LED
> flags in the kernel space. I've never said that the right place is the generic
> ASoC codec driver.

We already need ACPI and DMI quirks in the CODEC drivers anyway due to
the limitations of ACPI so it wouldn't be particularly surprising to
have stuff there.  OTOH this would fix things per machine while with
fancier hardware things might easily be flexible enough that there's
multiple choices that could be made depending on use case.

I'd be a lot more comfortable with ASoC having some runtime control for
overriding which controls get mapped, even if we try to pick defaults
with quirks.

--HuscSE0D68UGttcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA1OXcACgkQJNaLcl1U
h9BJewf+NVadyOATdjxt+ItsaAmZ7G9kd7Pmtt9JPOFDxjjcFrXmtbQbKkD5Roex
Eiu0+nVrDrTPvv1pCbbaJkXXbxWIGH93K+/jhDjwcoY1ykQttlPDI7255jU5p9Kg
s3zmtLpVAmz/12hfDZdpAFZ6Ii8SFNLAmpzPHbhoqQXzEk7EPQ231vYN+FZhTTVU
0mg6PYtsWPkGXZsLsyXx2m+J8DArkfyvwIyRrErA5uW2aVZ7ePZoWPeUQcEo+HbP
LTVQsG9CP40E9AJkdbMJM0siPwMjGH7Bbhd3lq+AbJhk/AwIa1vvyKW8WF9UQARf
FPq1oC04hMB0Zci7UXfEJtszfGARxQ==
=3d0S
-----END PGP SIGNATURE-----

--HuscSE0D68UGttcd--
