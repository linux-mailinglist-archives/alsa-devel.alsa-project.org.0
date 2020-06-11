Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B911F6392
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 10:28:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A607166E;
	Thu, 11 Jun 2020 10:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A607166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591864089;
	bh=YUMp2q/HufrKUWQR8d10DU5EVMYQ+RTK4Ary2FsUxpg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SPran/WKfp0UTXJNB44387wu02cIICNenPMz+q8LtxGsPHRjnSpWgqUFP8D/F/IRC
	 oAlrtF/2EP3M3JZFazmRHLb+X4S/hbzk9ATt1RspeHI0QNY3kCvxijU225HnNrAT8S
	 KtZrR/XZpgN6M42AiOOv8SxpXRhZ3kYeh9BZS9OU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4756EF8028D;
	Thu, 11 Jun 2020 10:26:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD48AF8028C; Thu, 11 Jun 2020 10:26:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B279F800CC
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 10:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B279F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g92fsaSS"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67677207C3;
 Thu, 11 Jun 2020 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591863978;
 bh=YUMp2q/HufrKUWQR8d10DU5EVMYQ+RTK4Ary2FsUxpg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g92fsaSSZ1PFMOpD75oQHjkFfyB+k99l45z3iWHzROPI9k1izAbq8oCEuWP9DUh/L
 obOLjjf6Z8QST/NJgwjuLosUkGdMBxHzWtEHhuygRAsfE9IDGk7WpAhK+TtBWi1Uiw
 Ag9Vn2pyP1D/znXiB2AG+PfUPIIy6uIlJDb7jgZo=
Date: Thu, 11 Jun 2020 09:26:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Subject: Re: [PATCH v2 0/6] Enable Greybus Audio codec driver
Message-ID: <20200611082616.GA4671@sirena.org.uk>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <20200610173711.GK5005@sirena.org.uk>
 <20200610182322.GC21465@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <20200610182322.GC21465@gmail.com>
X-Cookie: I like your SNOOPY POSTER!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
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


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 11:53:24PM +0530, Vaibhav Agarwal wrote:

> With patch#6 in this series, I'm proposing some of the (dummy) helper=20
> APIs required to link DAPM DAI widgets for the GB Audio modules=20
> added/removed dynamically.

> Eventually, I would like to propose relevant changes in snd-soc APIs to=
=20
> enable dynamic linking of DAI widgets for the modules added and=20
> remove/free component controls for the module removed.

> I'm seeking your opinion on the proposed changes. And as per the=20
> recommendation I'm sharing the changes with ASoC mailing list as well.

These are proposed incremental changes to an out of tree driver that has
never been submitted.  I don't know what the current code looks like,
what it's supposed to be doing or anything like that so I've no idea
what's going on or why.

> Kindly suggest me the preferred way to follow on this thread.=20

This is effectively out of tree code, until someone submits it properly
I'm not sure it's useful to submit incremental patches upstream.

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7h6qcACgkQJNaLcl1U
h9ClMQf5AfzPskdM7GJn5Lf8DIJciRGrA08Te9rvY3eabhXU4aiMCp9lBF1prenp
QGLxYB+mW1bdfMOqVwzmQlVKZ6OtZ9IinlKhqWn6cea9eWK3aGo8uaGjp3H8tJp1
HYpMyoBfCedLFxL/YGlhxn2yj5k++pPtDS+6NwEYuec1FV3k46hzKfmzr5BJzgcp
LYLZT8n/3S+AJoCb7NRY07Ptz1+Qev16y+Ta45oolFnFceewDJ+jxt4w7+BLVwJt
rAchPXSGY0SgPhSDu/hPcKODETZ7O2UloPGht/R5SG8Fzabg6ngJqujyawqzDddL
TYo4fg6SQ2NWig21RJ9+2byMqNbgPg==
=yLco
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
