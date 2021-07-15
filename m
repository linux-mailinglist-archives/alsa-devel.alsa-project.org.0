Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 955043C9E07
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 13:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B1A11678;
	Thu, 15 Jul 2021 13:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B1A11678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626350015;
	bh=/NnxdjlZzK51yXbx9qQZp3/zfCQENPBhu95SmkLJW88=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QqobTYfylIyLMKSn+tB9OJl8HSoMFvSxgNxSWUlAQC/Fak3lGLAl0Fph6izXnRvuB
	 tHT0YWZQBp8B/Xrdn4LIRDrzBehReLgRcgf7UWd0lXKqYbo5p8YWP590vSD+Zg60hi
	 Z0ghd0Lj884psM6LFbWyQQ6X2mfpFKXJ3AuCz2hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 873D0F8013C;
	Thu, 15 Jul 2021 13:52:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EC38F80217; Thu, 15 Jul 2021 13:52:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 043AFF8013C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 13:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 043AFF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cDRop29F"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71F936117A;
 Thu, 15 Jul 2021 11:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626349917;
 bh=/NnxdjlZzK51yXbx9qQZp3/zfCQENPBhu95SmkLJW88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cDRop29F3WtICh0cmknyCDrWaGO3O7u7Nc9KcixMBPDwUA3/GE40txsd71gSYXrN+
 q8+YHgHVO7eoNbIfij+tlB2XLA28nGoUYLd3dub5+zS008vXwScO+F1AAWiFEK0n7u
 pRHTLsqwL3P8TBhoz4yDuCz/L/DcYtyjPQ7IEep0gxahp/19iXR7fC9EA3JYdOAoqI
 cidgos7b+qHfVj0Xn4PygHUDMP5xUDgCAUmIGLWNnnZg3kHJxEqLrXAxkLydyZDFqC
 eaOx7gUjNTOB+gwhfn+xxm5WA0p3NKVW3YFSVAHJDloOLIEX9xyTwRqhNWlpb3Dgr7
 zucHH4EdlkKTw==
Date: Thu, 15 Jul 2021 12:51:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Subject: Re: Issues using simple-audio-card driver with Xilinx Audio Formatter
Message-ID: <20210715115119.GB4590@sirena.org.uk>
References: <6c7635f59ea9b162999f060334eef48e0812534b.camel@calian.com>
 <874kd63oqa.wl-kuninori.morimoto.gx@renesas.com>
 <52eda9910822e7e854b049127e462bf468f912ed.camel@calian.com>
 <87r1g91ygm.wl-kuninori.morimoto.gx@renesas.com>
 <2cccca32d53e1d832df67d070bac9ca998a931c6.camel@calian.com>
 <87bl7cl20y.wl-kuninori.morimoto.gx@renesas.com>
 <20210709123854.GA4112@sirena.org.uk>
 <129f46987f79328edba109a800b522c6ddfec99e.camel@calian.com>
 <20210709180240.GG4112@sirena.org.uk>
 <5753ab0fbe8dad1a0ce3bbd8dbc9cfada71b21c9.camel@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline
In-Reply-To: <5753ab0fbe8dad1a0ce3bbd8dbc9cfada71b21c9.camel@calian.com>
X-Cookie: You look tired.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
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


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 09, 2021 at 08:25:17PM +0000, Robert Hancock wrote:
> On Fri, 2021-07-09 at 19:02 +0100, Mark Brown wrote:

> > Given that it knows the MCLK if set_sysclk() is used and it knows the
> > sample rate it should just be able to calculate the ratio?

> I see that snd_soc_component_driver has a set_sysclk callback as well, so=
 that
> allows the formatter to handle setting the divider. However, right now wi=
th
> simple-audio-card that callback is not being invoked on the formatter, th=
ough
> it is on the I2S transmitter.

> I'm thinking something needs to be added to asoc_simple_hw_params to call
> snd_soc_component_set_sysclk on the platform component(s) like it calls
> snd_soc_dai_set_sysclk for the codec DAI and CPU DAI.

> Not sure exactly how that should be done though - we could use=20
> for_each_rtd_components to iterate through all of the components and call
> snd_soc_component_set_sysclk on all of them, though that would also poten=
tially
> duplicate some settings already done by the snd_soc_dai_set_sysclk calls =
on the
> CPU and codec DAIs. I'm not sure if that really hurts anything though?

Yeah, I don't think that's likely to hurt anything - I'd be surprised if
there were that many things that actually have set_sysclk() to even
notice.

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDwITcACgkQJNaLcl1U
h9DcLggAgCEgRftCr5vbIxmumUKKTwaUcj3hNWisgKCo6rMcPKTaKCQGf/EwpgKb
JrkjJ2SZdSG4wsjbu3jAJjs1PeXOv/Xdm3r+zZ+S9/IOGA4GHIGoV5ziXv6bQG9E
OThxHw9vVaTHXOPn+tTdGb0jHv4rr8kZSTDGgALs35PZMJr/gEtjkZ4y25tbx0V+
YcNXN+hpqxw0NOhH65XuRbF4GDKvMh/ku6U69fH9VMKd5pxvY7dLHgjX/uLg6vGV
6A6BSMU3e+PUOijwNUNbZ15MVxm+dOJT4UDiV9HiOv2+Sd4lIcdOfpW/UN1wY276
hofCkFdhHyG/TNlcrvJyz5BI+dKMlw==
=hz5l
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
