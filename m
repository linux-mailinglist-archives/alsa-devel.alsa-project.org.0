Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B70E7DCDCB
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 14:27:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3F0193A;
	Tue, 31 Oct 2023 14:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3F0193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698758853;
	bh=qq7ptxnKbInbBcr1W798zXlNpA2qLRG2+BBdxliCEnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ez0Ei1KGBfNP5qGvYj6fRFTu1fC9T++Rs9n7FbKTeDsy3uz9psozxe+AL3/Rht83P
	 0qcWgzR3KITkTyAItkYP6TJB+IYGMCF4omyIDrGJKxrfPrd2A+HDxQuZI2JkyOe1w4
	 Wp4uikn/Aj0qUm3YExammYv+sbXt3s4YZpWY5ZCQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEC53F8020D; Tue, 31 Oct 2023 14:26:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34001F8016D;
	Tue, 31 Oct 2023 14:26:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C4FFF8016D; Tue, 31 Oct 2023 14:26:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF3FBF8016D
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 14:25:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF3FBF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BM1BqC55
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 056F6B80E7A;
	Tue, 31 Oct 2023 13:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03AE6C433C7;
	Tue, 31 Oct 2023 13:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698758746;
	bh=qq7ptxnKbInbBcr1W798zXlNpA2qLRG2+BBdxliCEnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BM1BqC55qMoBKLr4lIAjs4LsMPAIUFPF4+s1Yhzs7kcm5VbypZVdvuffLI4ZcSDex
	 SjQ4besqJuUByyUI3DE78AJaM/r81ujC1H4qYPZOZhrPimB+woPWOLyAuwd5LBmkr7
	 9UqEktCZDZj5YEHWdxptuKNGN7ogJtDl6OBo1h+i56handReipJkWz+VB7muJ0++oR
	 vgGCCCttnioxK9bZRNv4DNZ94pUhLTL5W9cPeZY5b4jzDZjkFDRqeq0fEm/KOYKnPm
	 +8aKW5p5//v0sMBjuJ/RHXsZLY5BDsNWelKDJtSTYY/An0skZxC73WGa1uMXYboG5p
	 R6UogIprXd+8w==
Date: Tue, 31 Oct 2023 13:25:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Baojun Xu <baojun.xu@ti.com>, lgirdwood@gmail.com, perex@perex.cz,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	kevin-lu@ti.com, shenghao-ding@ti.com, peeyush@ti.com,
	navada@ti.com, tiwai@suse.de
Subject: Re: [PATCH v3] ASoC: tas2783: Add source files for tas2783 driver.
Message-ID: <a7a19e35-6cae-4077-9423-4c450b088351@sirena.org.uk>
References: <20231028092409.96813-1-baojun.xu@ti.com>
 <7f4465c1-5e8e-4c5f-bbff-d2c930326986@linux.intel.com>
 <9d922584-288a-4b73-83ef-477d1bc58521@sirena.org.uk>
 <9b94488e-206d-419b-92ed-e70aab11907b@linux.intel.com>
 <85890ed8-0ab3-4b14-879b-be9f0c760db8@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yHndlsctv1XDmSuG"
Content-Disposition: inline
In-Reply-To: <85890ed8-0ab3-4b14-879b-be9f0c760db8@linux.intel.com>
X-Cookie: Is it clean in other dimensions?
Message-ID-Hash: VXLYYTUNGNK2YKPVEOT3XQQSKS65G4DR
X-Message-ID-Hash: VXLYYTUNGNK2YKPVEOT3XQQSKS65G4DR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VXLYYTUNGNK2YKPVEOT3XQQSKS65G4DR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--yHndlsctv1XDmSuG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 04:05:09PM -0500, Pierre-Louis Bossart wrote:
> On 10/30/23 12:40, Pierre-Louis Bossart wrote:

> >>>> +static bool tas2783_readable_register(struct device *dev, unsigned =
int reg)
> >>>> +{
> >>>> +	switch (reg) {
> >>>> +	case 0x000 ... 0x080:	/* Data port 0. */

> >>> No, this is wrong. All the data port 'standard' registers are "owned"=
 by
> >>> the SoundWire core and handled during the port prepare/configure/bank
> >>> switch routines. Do not use them for regmap.

> >> This seems to come up a moderate amount and is an understandable thing
> >> to do - could you (or someone else who knows SoundWire) perhaps send a
> >> patch for the regmap SoundWire integration which does some validation
> >> here during registration and at least prints a warning?

> > Good suggestion, we could indeed check that the registers are NOT in the
> > range [0,0xBF] for all ports - only the range [0xC0..FF] is allowed for
> > implementation-defined values. I'll try to cook something up.

> After checking, the following ranges are invalid for codec drivers:

> for address < 0x1000
> LSB =3D 0x00 - 0xBF standard or reserved

> 0x1800 =E2=80=93 0x1FFF reserved
> 0x48000000 - 0xFFFFFFFF reserved

That's a huge range...  I think the concern is more the standard ranges
than the reserved ranges isn't it?  That's the bit that the SoundWire
core or other generic code will be actively managing.

> is the recommendation to check the regmap_config and its 'yes_ranges'?

> Presumably if the range_min or range_max is within the invalid values
> above then the configuration can be tagged as problematic in the dmesg
> log or rejected with an error code?

That would work for drivers that use that, but note that drivers can
just provide a function here so you pretty much need to probe each
individual register.  It's done that way because we figured when the
interface was originally defined that the compiler would probably
generate better code from a switch statement in most cases than us
trying to fine tune an algorithm.  Probing like that is going to be
unsustaniable for the full ranges above but shouldn't be too bad for the
potentially standard bits, we could guard it with a config option if
it's noticable.

Another option would be a kselftest that looks at the readable registers
in debugfs, we do build up a cache of the readable ranges there when the
access map or register contents are first read.  That's potentially less
visible but OTOH easier to ask for on review, I was debating asking for
mixer-test output on all CODEC driver submissions (similar to what the
media subsystem does with their validation suite).

--yHndlsctv1XDmSuG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVBAFQACgkQJNaLcl1U
h9BHYQf5AZkATJTk5YajSzfaGkwvtsde8Po44shkOllZMOUSxo9fruicL4Z1HN69
EGKaH+ZTowx2MVJ20Ox/z3q8DxoL0Zh1PHxZ8NRlNPRjFvfUwoerBsUw4cU3as1t
q395xPyGjgiWcItoFUdUZ/ICEUZQmnvt/LZ1srqbt3ilYwkIdvlv1UWwomn59fu9
upm5dSEK1MFKsctigmYsJsaNNcshJlyNNjJqjUp6AhRnUILOkPQmzkJm6QX0VVX+
YS/gIGB7Cpnkaqkc7fGIPDcHNpv6TAiP6sTOmuiZohxLaXIxD7Xi762cHI+8OXBE
L+CGjNOEo/fGrgPKGVgqUaPDTh2ZwA==
=c9sg
-----END PGP SIGNATURE-----

--yHndlsctv1XDmSuG--
