Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 685592AC6C6
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Nov 2020 22:17:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0617B16B6;
	Mon,  9 Nov 2020 22:16:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0617B16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604956632;
	bh=oYr2JaLR22iQHfcymOzeBfdwEdiH+YRlgs4KPxWwOTs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IXIbtvohLuYXpAD0EBbBhO386Q2J02zZBxB/UWUfyQ53NPUNqEGIoztZRZTG/qDz8
	 K0RdeStX+giXXXrYMDkHxwqIAvUGnXJeRQNFe0mipt4Jl3km9VBwt1gJbZd8NSxA2Q
	 OWB3n/BaH9B6opvFxF/TJOrHncUIzKm1H44DiQ/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6A1DF801F5;
	Mon,  9 Nov 2020 22:15:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DBD2F800BA; Mon,  9 Nov 2020 22:15:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8F4FF800BA
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 22:15:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F4FF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aB6NCU9Q"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84563206CB;
 Mon,  9 Nov 2020 21:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604956530;
 bh=oYr2JaLR22iQHfcymOzeBfdwEdiH+YRlgs4KPxWwOTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aB6NCU9QwvpONEX/1Io7pQXX8zJsOMlPiu+rhJiTw7WRQ58MaJxTPiq4oxqDFkwXk
 wR3jHAewHNE/T3mGhckgcb7r7KsFUAq+ZzEb7VdntGfAAf34MU1lqxR2C6IgGZhsWM
 AUjTq9ON5xnHnYhNsaJ7/hCxj2m82s0NpmRzmIVc=
Date: Mon, 9 Nov 2020 21:15:15 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: ASoC: Question regarding device-tree multi-lane I2S for
 Allwinner SoC
Message-ID: <20201109211515.GO6380@sirena.org.uk>
References: <CAJiuCcfBOHhniDQOaB8ixU0pY9u0GVivkj7po-kozBV8LqmB6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="da9oBGf5DLtF9ehv"
Content-Disposition: inline
In-Reply-To: <CAJiuCcfBOHhniDQOaB8ixU0pY9u0GVivkj7po-kozBV8LqmB6A@mail.gmail.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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


--da9oBGf5DLtF9ehv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2020 at 06:30:15PM +0100, Cl=E9ment P=E9ron wrote:

Sorry about the delay here.

>     dai-tdm-slot-tx-mask-0 =3D <1 1>;
>     dai-tdm-slot-tx-mask-1 =3D <1 1>;
>     dai-tdm-slot-tx-mask-2 =3D <1 1>;
>     dai-tdm-slot-tx-mask-3 =3D <1 1>;

=2E..

> This kind of representation gives the information that 2 slots should
> be enabled as TX per lane but don't give which slot to map.

The way the above should be interpreted is as a bitmask of slots to use,
I'm hoping that the above is for a system with 4 TX data wires each
using two slots (such designs get used for things like surround sound
amps). =20

> I was thinking about a representation per lane but maybe it's a bit
> complicated  ?

>     dai-format =3D "dsp_a";
>     dai-tdm-slot-width =3D <32>;
>     // Lane 0 : Output 8 channels 0-7 using TDM
>     dai-tdm-slot-tx-mask-0 =3D <1 1 1 1 1 1 1 1>;
>     dai-tdm-slot-chmap-0 =3D <0 1 2 3 4 5 6 7>;
>     // Lane 1 : Output 3 channels 5-7 using TDM
>     dai-tdm-slot-tx-mask-1 =3D <1 1 1>;
>     dai-tdm-slot-chmap-1 =3D <5 6 7>;

I'd expect lane 1 to end up as

     dai-tdm-slot-tx-mask-1 =3D < 0 0 0 0 0 1 1 1 >;

>     // Lane 0 : Output channels 0,1
>     dai-tdm-slot-tx-mask-0 =3D <1 1>;
>     dai-tdm-slot-chmap-0 =3D <0 1>;
>     // Lane 1: Output channels 2,3
>     dai-tdm-slot-tx-mask-1 =3D <1 1>;
>     dai-tdm-slot-chmap-1 =3D <2 3>;
>     // Lane 2: Output channels 4,5
>     dai-tdm-slot-tx-mask-2 =3D <1 1>;
>     dai-tdm-slot-chmap-2 =3D <4 5>;
>     // Lane 3: Output channels 6,7
>     dai-tdm-slot-tx-mask-3 =3D <1 1>;
>     dai-tdm-slot-chmap-3 =3D <6 7>;

> What do you think? Do you have any remark / idea about this ?

I can see the use for the chmap binding, I can see that we might have a
system which has for example outputs labelled in some unusual order and
we'd want to remap them.  I'm less sure about defining a channel map in
a way that changes the meaning of the masks though, that seems like it'd
lead to incompatibilities.  How about making chmap also an array like
the mask is with the bits set in the mask indicating which slots in the
chmap are valid, that way your -3 would end up as:

      dai-tdm-slot-tx-mask-3 =3D <0 0 0 0 0 0 0 1 1>;
      dai-tdm-slot-chmap-3   =3D <0 0 0 0 0 0 0 6 7>;

and something that only understands the mask would at least get the
correct channels even if in a jumbled order?

--da9oBGf5DLtF9ehv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+psWMACgkQJNaLcl1U
h9DxiAf+LcdNMSzFM9UDPRKWBo7YMMEa3rZBYdJiTYFos60njDZu9mygoU302a4j
1zY+3h4+36iMWuL1M6Kg3+roJuRBPBiWCIDLMsiKBcyN8rmpSKzv3Ki8na/QqpcD
Pi6eu9MyPH/68CElJ2KYDbMhmNGXgVzPKhQ2Vmpx9f4NdTuCDE9Cs6f4ibFVzBIp
j3V6YV/+gLNvDxpghKmfsbew/6qYtxq5ouXW/lF3zvor6W/Ez+zem1/dKFj8sqGh
8+oWQvThKGtoz8jYjxfz3oe7C7Syvsq8ejUmPD2tlNOaYaaiXYK8wzZyDSghKdua
UpXzlsrLN+HXuLOVpu1ShjiCPNj4wQ==
=TwOU
-----END PGP SIGNATURE-----

--da9oBGf5DLtF9ehv--
