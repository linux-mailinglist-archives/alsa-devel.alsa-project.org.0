Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 644E5232167
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 17:18:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFB3C1705;
	Wed, 29 Jul 2020 17:17:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFB3C1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596035882;
	bh=yDdQDhe0aUkPneMHf4V7CtUIlgiQ6JNskljZx+0L3lY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZlZJOTIuiIZVIncZloGJiBc7kB4uQu5tdZc93nL9wQov11mkHjNCxKNXFyHqlwin
	 THy0do+Mj5jBs0Ayzk6QxjF/0bv6QLpLISZ6P8ibjSGeELn4vcbZPMfVdtNc7nukng
	 aDalz5dyum6AwLFwZ7eKmw6h+idaeqJiyZqs3Nv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02DB8F800DE;
	Wed, 29 Jul 2020 17:16:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D60F9F801A3; Wed, 29 Jul 2020 17:16:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 092D0F800DE
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 17:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 092D0F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gei8T5JG"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5BE420829;
 Wed, 29 Jul 2020 15:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596035766;
 bh=yDdQDhe0aUkPneMHf4V7CtUIlgiQ6JNskljZx+0L3lY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gei8T5JG9mkokmueZzsBGcLX8YlboI/FeJehVNWoEm6q8np1zBgiz2xRJCgZ50WMa
 duK94SsDjx3dcUQZ/qxbD9kRvbRfotqQgGnuG/YP+L9oby0LuER4sQU432e+thWKZc
 11er+SlaUzGnZyXJ12P5ZS9ynMsNXAF4xj3riDgw=
Date: Wed, 29 Jul 2020 16:15:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
Message-ID: <20200729151548.GB5612@sirena.org.uk>
References: <20200426104115.22630-4-peron.clem@gmail.com>
 <20200428081321.ht3el26yqhsnyfm4@gilmour.lan>
 <CAJiuCcdVs_drs40Q6537BYfz24F7NmC6B8S5-Lt4V4ggs-FXWA@mail.gmail.com>
 <20200429123529.y24dpy63wxq7uvkt@gilmour.lan>
 <CAJiuCcfXqizcq_JuXRCsqEqM2562cr1SGJ0pmy07jcJxAXojOw@mail.gmail.com>
 <20200430084600.samghw4zxb5zdbez@gilmour.lan>
 <CAJiuCcf_LHrJ6QdZgH8HyN6TRiT+GiD+t4UggFCrz-VwVHXV6w@mail.gmail.com>
 <20200504120942.lnrxnnmykqnvw3fb@gilmour.lan>
 <CAJiuCceF340FiLvyeXNZtvqftQMAmk=MtFDLT_9696ix+eH1Yw@mail.gmail.com>
 <20200729143927.47f5tbuaob4ph3lp@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline
In-Reply-To: <20200729143927.47f5tbuaob4ph3lp@gilmour.lan>
X-Cookie: May all your PUSHes be POPped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
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


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 29, 2020 at 04:39:27PM +0200, Maxime Ripard wrote:

> It really looks like the polarity of LRCK is fine though. The first word
> is sent with LRCK low, and then high, so we have channel 0 and then
> channel 1 which seems to be the proper ordering?

Yes, that's normal.

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8hkqMACgkQJNaLcl1U
h9BWOAgAgZCmz5kPu3UP5TIzHU0FAftm7xaaVdfAgv4E8uT1NNTTa8BP1dvsplb9
Y4S5BMhGEtD8QKO8xfJOn2rmCsNNVxKbTcu17pJrU/deNmnoT5F4TnYr08pckTcp
0lR7PGk2ue9IcXFaDjzjTEHRy6OAm607BBjXyWVAhr3eM9KxVObTR/xeYaXsW0pl
524o3XwTcNKdjkYC+zmF/wcrJ98vThoGY3AIm/2dwJJ7/LjXGWxE0JVMMoA7o4RZ
6DbNVGZyRaha3iLUmk75+d8yD+Bub8C+/xZUDzZX9dskbmerGio/TCFJhG24cx+w
zXy5TYbMMqUp7E3+lRX8m6sRgBuA7Q==
=1GYE
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
