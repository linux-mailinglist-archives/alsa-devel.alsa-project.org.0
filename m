Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7372731DF
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 20:25:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DF5216CD;
	Mon, 21 Sep 2020 20:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DF5216CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600712759;
	bh=HRXFmeB3Lq27fSD0zpaFp06z6HUYGQPD8Q8dBigA6pA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gk8QbCVvGpSs1dec88Nag5M0Y5gslKqGZZLFqY+xhpC/YA8C35ExkoDgWAtdegGPE
	 pXyTPOKEGWprjpZVDMxWTRrRLE6cmdumH4v9EjF+TSpFiPxMM8CYqjlM5GIaWz+cNY
	 97Php1YU3d02llqN1twtrZUwuFMzdTmDyET6vfzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 480ACF801EC;
	Mon, 21 Sep 2020 20:24:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4FA5F80162; Mon, 21 Sep 2020 20:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8A60F80161
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 20:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A60F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T4TO6CHK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 335C7221E2;
 Mon, 21 Sep 2020 18:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600712641;
 bh=HRXFmeB3Lq27fSD0zpaFp06z6HUYGQPD8Q8dBigA6pA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T4TO6CHKbtKu5i7B82i29p/gKoiV+l9c/Vx2/HUXPVLSZ1wKslkTz1fA5IYcqcoT4
 6VWPl9VznYH0dJRo47t05G8m3um496pt0b2/FU8ysvRJ98u7jpVOEgHuPjENtNbejD
 Kak8qL99y7GvRCK9zAjE+Cdkiqbsy1Zw0RXF1xPw=
Date: Mon, 21 Sep 2020 19:23:09 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 02/22] ASoC: sun4i-i2s: Change set_chan_cfg() params
Message-ID: <20200921182309.GF4792@sirena.org.uk>
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921102731.747736-3-peron.clem@gmail.com>
 <20200921122918.kzzu623wui277nwr@gilmour.lan>
 <CAJiuCce0thGcH19vMtDX0X8-9S32Y7kC2bnWo_6-SHozF8uDAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JcvBIhDvR6w3jUPA"
Content-Disposition: inline
In-Reply-To: <CAJiuCce0thGcH19vMtDX0X8-9S32Y7kC2bnWo_6-SHozF8uDAA@mail.gmail.com>
X-Cookie: Love thy neighbor, tune thy piano.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
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


--JcvBIhDvR6w3jUPA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 07:15:13PM +0200, Cl=E9ment P=E9ron wrote:
> On Mon, 21 Sep 2020 at 14:29, Maxime Ripard <maxime@cerno.tech> wrote:

> > Also, Fixes tag?

> I think this only happens when 20/24bit is enabled so the issue has been
> introduced in this series.

For a situation like that a note in the changelog about "in preparation
for adding X support which will make this matter" helps.

--JcvBIhDvR6w3jUPA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9o74wACgkQJNaLcl1U
h9BEkgf+Kdv4mdGPqpwCfZgrxhHr8llfJlEj472gWX8L58vMy5mvAKDByP19BQW2
V9tAlfOFNQ9RwwneG7mDjx/gdJOLB8SbnlcY1CJIZYT8HVZqMpNf9yxgK0cN3BBG
T1mFy3hejhnJ9E1l2SCmZiU5rRutUrdUfpThzmtblmz0+Osu1ZJnW3wox9B5ntS7
pe4wDkLATwov+b3q/67r4MMejRlAar97VFvkn49bAEK5nSnlKtMDVX2bhaMNU5cL
8bvQMBxlRDsvtEoytUlggCP39t3bIomY6mjc9h9AteG+YVvvb8E99pf6iOaCiXBY
QerGSJWszRFXfhWVKucqXFZif17wFw==
=qBM3
-----END PGP SIGNATURE-----

--JcvBIhDvR6w3jUPA--
