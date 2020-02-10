Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D87157CE7
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 14:58:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C68F1673;
	Mon, 10 Feb 2020 14:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C68F1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581343114;
	bh=JqI+U7PtMy+ueGYx9Tg/0Igoz8LECYvQ1AiUWNFGPfs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dt8iln6e4RytzCiod2xeUbAhEpJIbTuizhBS/1KkqER4mgpCsuldPt+sh6tBDefLo
	 Z1CrmmMSRFwego0Ld6uMl5/UPC8k4xrUj9+Am23zajnCC1vg6WX83lpL3zvy2EKWAN
	 v2HFzTyXC21FaxGBew5jXBurq7ZIjqP9456OMat8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64EB6F80158;
	Mon, 10 Feb 2020 14:56:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CB84F80157; Mon, 10 Feb 2020 14:56:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E2CBEF80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 14:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2CBEF80118
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 863881FB;
 Mon, 10 Feb 2020 05:56:46 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A80B3F68E;
 Mon, 10 Feb 2020 05:56:45 -0800 (PST)
Date: Mon, 10 Feb 2020 13:56:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20200210135644.GL7685@sirena.org.uk>
References: <cover.1580950046.git.robin.murphy@arm.com>
 <29a846da33c02df64eca62b5fa0f3884652f788f.1580950046.git.robin.murphy@arm.com>
 <20200206114606.GM3897@sirena.org.uk>
 <ad2c941a-9724-510e-959f-3cca3cab1dc2@arm.com>
 <20200206135718.GQ3897@sirena.org.uk>
 <CAMdYzYqTEnG_Q-8SvO2R6PeaPXQ3VBKu6iVYhYvb=wK7tT7c3A@mail.gmail.com>
 <bca13994-a8b1-fa21-fdf0-9f362d693f39@arm.com>
MIME-Version: 1.0
In-Reply-To: <bca13994-a8b1-fa21-fdf0-9f362d693f39@arm.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, lgirdwood@gmail.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v2 2/3] ASoC: rockchip: Make RK3328
 GPIO_MUTE control explicit
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
Content-Type: multipart/mixed; boundary="===============7661452361963120927=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7661452361963120927==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sMZCuqyhuhd4ycTi"
Content-Disposition: inline


--sMZCuqyhuhd4ycTi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2020 at 09:38:11PM +0000, Robin Murphy wrote:
> On 2020-02-06 6:05 pm, Peter Geis wrote:
> > On Thu, Feb 6, 2020 at 8:57 AM Mark Brown <broonie@kernel.org> wrote:
> >>


> compromise that isn't too hideous, preserves the logical cleanup but
> at least prevents audio going silent with old DTBs (plus handling GPIO
> probe deferral properly which I forgot about first time around). How
> does this look?
>=20
> Robin.
>=20
> ----->8-----

Please don't send revisions of individual patches in reply to discussion
of a series, it makes it really hard to follow what's going on with the
series.  Please just send patches normally.

--sMZCuqyhuhd4ycTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BYRsACgkQJNaLcl1U
h9Du0wf9HO3Q6AaZJ1I4tRS3loJ/OXK/v8QMTdDtKmw/Ek+JwYeQh3npOWMQBItK
6pwxmpW5l4Cej0jPXpea00qCFYlQEadT1topkaNHLoNic2dlkVSv2seRbm3R6dwP
ghjNr4Mwv3vycd1P46hmJZsB+eDH4HmZnQGKSFkdz4i1j6MOLfwWxdnJLWpOP740
dwaB4VXKiS3EKCw5A3Q07jMCTuNyeXumjmq79/4POKCmN7FcE5Gr64c747stLQ+g
cDRDRKWiVhLuAFTDTnHf4ry9bTlGulap1bs2xN2qlmbxIKMT5ZV/UGQDhqrDQ6MV
/A1zX6aZmKOe6X82hUl4CSeTgIR6HQ==
=TcrG
-----END PGP SIGNATURE-----

--sMZCuqyhuhd4ycTi--

--===============7661452361963120927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7661452361963120927==--
