Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B9F21FE94
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 22:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E69F61669;
	Tue, 14 Jul 2020 22:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E69F61669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594758601;
	bh=O20GcOLOg0ZHMThXbLDLtb0d8nA0bfVDYgFNb7RkvkQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fvUSe9D1Oowwj6UkN0fDHSz6DfhTnPxeFbVv8e4iLbMoeEcJDBmFFqzVDdN2YMeRc
	 r7cVKf9jeXOj/9M0IeE+nksfzvKZKoAU7/KRIJCl2CSVo2TAqouUMjFAKxVCEgRr7c
	 OPB1bjazrEwLWc+1U2R/7D5wgGJ625tdp5FxkuBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1184CF8014E;
	Tue, 14 Jul 2020 22:28:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B35A4F801EC; Tue, 14 Jul 2020 22:28:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BD97F800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 22:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BD97F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QwYkfz5v"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B09CD206F5;
 Tue, 14 Jul 2020 20:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594758483;
 bh=O20GcOLOg0ZHMThXbLDLtb0d8nA0bfVDYgFNb7RkvkQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QwYkfz5vHa0na1sEdlHRsjcxFA5xtFj89EgYrkqMn8rPUwU1u4UiTYO2ESyrq0LT7
 xE8GWdhqU8LkgcYvIcZPd9abQDDz8/RcPwC8Ly/ViIawesFSdMhUb/PTzEKCtFsNWv
 3H2HCwuRbAh86KdqQ+bhjXpeRZkITDAH9/eKWpmw=
Date: Tue, 14 Jul 2020 21:27:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
Message-ID: <20200714202753.GM4900@sirena.org.uk>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
 <20200702184226.GA23935@Asurada-Nvidia>
 <3f39a0bb-a766-f646-28b3-a51cf9983c6b@collabora.com>
 <3fea8912-63df-ff27-0c29-6284a85107ab@collabora.com>
 <20200714201544.GA10501@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Nj4mAaUCx+wbOcQD"
Content-Disposition: inline
In-Reply-To: <20200714201544.GA10501@Asurada-Nvidia>
X-Cookie: Your password is pitifully obvious.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Timur Tabi <timur@kernel.org>, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
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


--Nj4mAaUCx+wbOcQD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2020 at 01:15:45PM -0700, Nicolin Chen wrote:
> On Tue, Jul 14, 2020 at 06:20:32PM +0200, Arnaud Ferraris wrote:

> > Here's some background about my use case: the i.MX6 board acts as a
> > Bluetooth proxy between a phone and a headset. It has 2 Bluetooth
> > modules (one for each connected device), with audio connected to SSI1 &
> > SSI2. Audio sample rate can be either 8 or 16kHz, and bclk can be either
> > 512 or 1024kHz, all depending of the capabilities of the headset and phone.
> > In our case we want SSI2 to be the input clock to the ASRC and SSI1 the
> > output clock, but there is no way to force that with auto-selection:
> > both clocks are multiples of both 8k and 16k, so the algorithm will
> > always select the SSI1 clock.

> Anything wrong with ASRC selecting SSI1 clock for both cases? The
> driver calculates the divisors based on the given clock rate, so
> the final internal rate should be the same. If there's a problem,
> I feel that's a separate bug.

The nominal rate might be the same but if they're in different clock
domains then the actual rates might be different (hence the desire for
an ASRC I guess).  I can see the system wanting to choose one clock or
the other on the basis of some system specific property (quality of the
clock sources, tolerances of the devices involved or something) though
it's a rather fun edge case configuration :/ .

--Nj4mAaUCx+wbOcQD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8OFUkACgkQJNaLcl1U
h9DuHAf/TDGYWuygKrfJ8bywVG9u74SpJ9heHBWUzyeOwBeMmD2EcIZQTbcYbFy0
R2f5uRyhd5nQrLyrkVLq/o5HEgVV8Zpfi0OGQ25q5ehRQU3ni+8fkcHYtq3/uaI7
z8tQG2zuZiUDmN+thLC9a/H6SWEZSySVThHUsyFg+zU7WXVTmrMGnCIcjV5IlXPf
ErlMV1E0eWVn+Ti6rIYbG3RhGi7B4ATv3AY+0BT628Bel2zqknmTkFYH+SXMPspc
FzT/bvTQxCOOFl75BY8+qSS2H2MEVzdVSrhEEvopDBXCvspyHMMBX50CqcNJnFHc
4q3Oyckri7vWm5rmbqcwsCwbohRa0w==
=/XN2
-----END PGP SIGNATURE-----

--Nj4mAaUCx+wbOcQD--
