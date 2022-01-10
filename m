Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4356489B8D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 15:47:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 674C91848;
	Mon, 10 Jan 2022 15:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 674C91848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641826048;
	bh=+hVAJi2FtkLwfyiWMg9/GQBadxPmf5WJ15HaZKpJA4Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S2650n/cGjoYG04/0jw2tkSvYMbfjOs0huyKpIHb7q8jTsP0uAkwN3REola+WhgfG
	 jEn5q3Qlk3bwMrzU0KpqVAfPufNlfG6hcBN93XP56k4YtxNBCuHjTwMxJyO0blwzVU
	 dhFcafd1DAEjrjF0K3GAyDRTxzDWJsl/pUYuskq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCA24F80134;
	Mon, 10 Jan 2022 15:46:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CEB7F8012E; Mon, 10 Jan 2022 15:46:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2DDAF80054
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 15:46:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2DDAF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KOgH/Ss/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F1B860E33;
 Mon, 10 Jan 2022 14:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9DBC36AE3;
 Mon, 10 Jan 2022 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641825968;
 bh=+hVAJi2FtkLwfyiWMg9/GQBadxPmf5WJ15HaZKpJA4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KOgH/Ss/+yVhXV7fgVYFDNh999mk9P9sm6UPZwgCVIR/Ln/ZQpP21i8GjwgbXPnUn
 PNwFSHE0lzM06jLph/476Ch05eJHCredfRzvpZqCVQO1eTPTwzCWDID0Qv694Wq8Yx
 sPDraRq1w4eyvd3SJl+hXWmTDh2sngimk6AAhKQg9iwHiCE4Fp1zd3Pm2gOGjXlOWQ
 9zH85KB64vpVV/nHyZ4CL4do+xG6tc/k7VgCR0EK8VN0nYWbq+j0thSRdcyBI7Cm75
 NDRfokCzaP7vmFnuVSQJVLLxdNq+/rx+GmQpieJOQlgm2+p78zlXDfzqf1t5L0D/ZE
 kIO4B77jytjFQ==
Date: Mon, 10 Jan 2022 14:46:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH v2 2/6] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk
 setting
Message-ID: <YdxGrApvHyPW1aii@sirena.org.uk>
References: <20220107214711.1100162-1-robert.hancock@calian.com>
 <20220107214711.1100162-3-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GMJNi5j0UOBeicfG"
Content-Disposition: inline
In-Reply-To: <20220107214711.1100162-3-robert.hancock@calian.com>
X-Cookie: Do you have lysdexia?
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 michal.simek@xilinx.com, maruthi.srinivas.bayyavarapu@xilinx.com,
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


--GMJNi5j0UOBeicfG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 07, 2022 at 03:47:07PM -0600, Robert Hancock wrote:
> This driver did not set the MM2S Fs Multiplier Register to the proper
> value for playback streams. This needs to be set to the sample rate to
> MCLK multiplier, or random stream underflows can occur on the downstream
> I2S transmitter.
>=20
> Store the sysclk value provided via the set_sysclk callback and use that
> in conjunction with the sample rate in the hw_params callback to calculate
> the proper value to set for this register.

The driver should be setting a constraint for this if the sysclk is
configured, we shouldn't end up in a situation where userspace is trying
to start a playback that will fail.

--GMJNi5j0UOBeicfG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHcRqsACgkQJNaLcl1U
h9BmSQf/bNcFSFR+ofLKd4dowKOP9vmtuKIDkrmA8NKdHT+lF8li8WXhqpwdsJEL
SwYq4SjDLd0KmoPoLxadnVN/I6Z/a+/Y+RqcuXLD+WeZGfn8uf79HjYWkfRbeqrG
zom5yzD174zPxhx+bQhKK9IHRzTGzTwbyNidoPxQenx8zLiu4pegFjOE1Hc9Bry3
Ui+blBJjtk7mTuCa9UYJ+ha1QZaenZ9osOtr/PX0VjSo7SCRJCFc3LMrGuyimY6r
jb9rRby9yPx9se4FHXJAW1ZTQwkDgeb00skwO/9LV9XYJAMBNta/GAvW0Q/cb9l/
S14S7ysCV0ceGAI8RVzg8VBmJIMQ8g==
=aIuB
-----END PGP SIGNATURE-----

--GMJNi5j0UOBeicfG--
