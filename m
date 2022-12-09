Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7480F648942
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 20:56:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F24BF2246;
	Fri,  9 Dec 2022 20:55:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F24BF2246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670615776;
	bh=0985SvB6wLmyC7itWJ8Gv9VJ/uClOZX+DvRJ6lMdFjc=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TLD2k1DqF5VzdqmtR6KO+xOdbTkGIzo9k/16Iy1lH9mVRjp04NSjW2+q3vxr8+Fsf
	 pnjVnxnCOP/5cAsPN3K/X4zYbW47RkrD8g5At4B+abtD2+zUwKIB4I+56iUurdzbtI
	 FJxUgzaT098Oqowb1Mzptt/8LUZ3pehtBSA4TUhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96292F8022D;
	Fri,  9 Dec 2022 20:55:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5570FF8024D; Fri,  9 Dec 2022 20:55:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB552F800F8
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 20:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB552F800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dawGGFvU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B698862322;
 Fri,  9 Dec 2022 19:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF060C433D2;
 Fri,  9 Dec 2022 19:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670615710;
 bh=0985SvB6wLmyC7itWJ8Gv9VJ/uClOZX+DvRJ6lMdFjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dawGGFvUA2ghTMYuiSWqdS9+4A8iGYKYyDxMnKEQczovkBeFlWtoeY9qvfrf8s2BR
 9MsJOJGc8r+BIyPDoiQt7sYQT2BXSvQrjqJIO27O03cqxzDIRkZm+0XQvOBqPMh8/f
 zc2bLp5PUyrd/Yi5F6uZ4H/kV4I8L3n3A91ygUT2P5CumzIEvVX8Ngk4VWFTzAJfzH
 m3zOszz0TMFtHHcUCGmVgGMJtcUNimJKaIL1iNXZ1FEJ/2Jvx1Xbk+6RDXA45UwzVp
 Bqj7CGHHjtnqnl46ubaa0/JNDlvyeKgY2QMyn3rtyTM+eaDKV9QD+nyboRF7qTuCZC
 BiWVcGs3dwY2g==
Date: Fri, 9 Dec 2022 19:55:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Subject: Re: Simple card and PLL/FLL
Message-ID: <Y5OSmaCIktilIZAZ@sirena.org.uk>
References: <4172f4b2-9198-dfc8-a2b0-d75a95265e14@gmail.com>
 <Y5DPbhXQazD8OWX1@sirena.org.uk>
 <Y5Ly8E68N4qubJw8@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8d2AfbsJUtgDpxNV"
Content-Disposition: inline
In-Reply-To: <Y5Ly8E68N4qubJw8@francesco-nb.int.toradex.com>
X-Cookie: Who is John Galt?
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, emanuele.ghidoli@toradex.com,
 Takashi Iwai <tiwai@suse.com>, Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--8d2AfbsJUtgDpxNV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 09, 2022 at 09:33:52AM +0100, Francesco Dolcini wrote:
> On Wed, Dec 07, 2022 at 05:37:50PM +0000, Mark Brown wrote:

> > It's kind of a taste thing.  There's some devices where the clocking is
> > sufficently complicated and flexible that definitely needs a set_pll()
> > ...
> > for simpler devices like the WM8904 where there's an obvious thing to
> > do it's much easier to just hide that from everything outside the
> > driver and only deal with the input clock.

> Thinking about asoc_simple_hw_params(), what about the fact that
> asoc_simple_set_clk_rate() ask for a specific clock rate and assume that
> the actual output frequency is the one requested?

> After that we are potentially passing to the codec driver a wrong
> information, we should likely have a way to pass the actual clock that
> could be different because of limitation on the PLL/dividers.

The machine probably just shouldn't use mclk-fs in that case.

--8d2AfbsJUtgDpxNV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOTkpgACgkQJNaLcl1U
h9BUrAf/Z5wzoeRmG5kRkxS8WentWLHX9NMbtcTYNH+7Kd289jqEb33c9xFJ0PAa
EdFnp6I+LFzN7J79lpx1NgVJavK4khrmu4U+3dOKSRB/ebTD1txjnH28IoS+Or6P
3mTg0DSpSypcN3/01tENb0Gja9ob2pZZ+gKikRena5Q8mTzB9JJD8YIO/+lJUft2
emPnNwm9MR0povRROl9vWcK7HzAGhArEzv7tj9tB340pQ8fj586hWsQlq/RjhowX
ZA2M4WSPL3bKYpZ7Mpj+326YsPHHsiFRQDe8RGUlm2yCGy/jEkk1xKVL2rsE5EEX
RhT8y4b5W0o6ov+IwJB/ta4EAtntig==
=bkwM
-----END PGP SIGNATURE-----

--8d2AfbsJUtgDpxNV--
