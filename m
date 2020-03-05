Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A6117A729
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 15:12:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FDF51668;
	Thu,  5 Mar 2020 15:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FDF51668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583417575;
	bh=q1Vvu5SGKlrN2jIOKFicwKSgStWSyuVGDXn1EUOMgzw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hq7HioaPh4piAaa0IXkdPf3j0EJSbYBsKX/EpuwaUgDqwzzSxXoLOFNTXL3ajYKkr
	 7/NQybfRXVSN4vihvm7PeMpa6AoY36ZbEav612jeHPAoJ3UuCEqqmk5AJpUiDAT+CU
	 ctLbX4Q6bzQAPB2N5nXY+oMSjWx16T/vR+hQrB4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 552AEF80266;
	Thu,  5 Mar 2020 15:11:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A024FF8025F; Thu,  5 Mar 2020 15:11:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5D9EDF800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 15:11:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D9EDF800D8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38E471FB;
 Thu,  5 Mar 2020 06:11:05 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFFF33F534;
 Thu,  5 Mar 2020 06:11:04 -0800 (PST)
Date: Thu, 5 Mar 2020 14:11:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
Message-ID: <20200305141103.GG4046@sirena.org.uk>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305133638.GE4046@sirena.org.uk>
 <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
 <9e9c3c17-2bf4-ce02-fbe1-0631b20b13b3@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Fnm8lRGFTVS/3GuM"
Content-Disposition: inline
In-Reply-To: <9e9c3c17-2bf4-ce02-fbe1-0631b20b13b3@linux.intel.com>
X-Cookie: When among apes, one must play the ape.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--Fnm8lRGFTVS/3GuM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2020 at 03:06:17PM +0100, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On 3/5/2020 2:47 PM, Pierre-Louis Bossart wrote:

> > It's probably because the devm_ release does not happen when the card is
> > unregistered and the machine driver resources released since we use the
> > component device. There might very well be a bug somewhere in the devm_
> > handling, I just don't have a clue how to debug this - and the .exit()
> > makes sense regardless in other cases unrelated to GPIOs.

> This sounds related to issue I've seen related to fact that there is
> devm_snd_soc_register_component and devm_snd_soc_register_card and when
> cleanup happens, one of them seems to release memory before other one runs
> it cleanup functions. And then cleanup functions try to operate on already
> released memory.

> I haven't debugged this in depth, and just made simple patch to replace
> problematic devm_kzalloc with kzalloc and kfree, but there seems something
> weird happening related to how dynamic memory management works in ASOC.

There's definitely an issue if you mix devm and non-devm stuff (see also
the frequent issues with devm_request_irq()).  The devm stuff only gets
unwound after the remove callback has executed so if you free stuff in
the remove callback that you will rely on in the devm cleanup operations
then there's issues.  The devm stuff will also always get unwound in the
opposite order to that which it was allocated which usually isn't a
problem but can be worth paying attention to.

--Fnm8lRGFTVS/3GuM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5hCHYACgkQJNaLcl1U
h9BdZwf/f1hHirL5qEvNEqxKNHJdvHOfe5wgq0r/Z25AYfK17pHBj/W+/rYyBryy
wFO7LUulE8V72c3baILj9aaWJ518K2+41E8uxZeHAy29d8f6jHfagvY8rxTBTGVA
O7VbnMNRZbXq1aQ3w7vAWZ0Yp0lapzoZPMJ9RQejyx5qH7Ywfft5tXGUTKsjr0JA
bj01ROUKE+QiJiT0NB8cBmC3ilvkzUxGTu1q/9XfRLnqjZ+TQNcIKEZ10t9fjsin
33qOYkjAzRF8pkY5roaC+9Ylj/qOnqAPbMNsEttt2H00xHmRrH787GQTR5fWanf0
9g9ky1Ta5tnR0bhueSchP7HmwNdNeQ==
=fJfK
-----END PGP SIGNATURE-----

--Fnm8lRGFTVS/3GuM--
