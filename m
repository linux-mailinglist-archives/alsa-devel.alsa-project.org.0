Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B25B31BC4E5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 18:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 494FD168E;
	Tue, 28 Apr 2020 18:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 494FD168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588090606;
	bh=Yu5rOt8UvDrqMgRxGBjron5p4MO36vWB5qX6Yt5qCtM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JEjgFOOk1y3p9/lwntK0HQs7M5Mvo0nY2OPd6qszbICsjBIskyxM8dbpT4zxEf2bm
	 KuvvXxk/9A7AT987cAXGOjwev1lRkiXQ9qGOsn613rOO5NivDdYGMEmOSLBA+zuRjv
	 SzZRehHjfv4/UrrIOD56AyEnCJ6B3qVSbtVxNdNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 568C8F801EB;
	Tue, 28 Apr 2020 18:15:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BA3CF801DB; Tue, 28 Apr 2020 18:15:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6829FF8010A
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 18:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6829FF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="et165nRK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE3D32054F;
 Tue, 28 Apr 2020 16:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588090494;
 bh=Yu5rOt8UvDrqMgRxGBjron5p4MO36vWB5qX6Yt5qCtM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=et165nRKumn6cmjPtjcP1Mdc23LoHzzKGn9dt4y7zH7Z2eYvBSfTtBGB3Hy3Q3wHq
 rcJ2lSdvwbWPM/JkOdUnvQDxpMT3slJ+LRR11up7MjMYihIip7dQT4TZOsie7ITkoF
 LOXm3hbMPVals3cVnweUZNNVVSAGLKP9BKFn1R98=
Date: Tue, 28 Apr 2020 17:14:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH] ASoC: core: Make sure component driver names are unique
Message-ID: <20200428161451.GK5677@sirena.org.uk>
References: <20200427193306.31198-1-ranjani.sridharan@linux.intel.com>
 <20200428114044.GF5677@sirena.org.uk>
 <e5116a2b2be975f07ba29ea438f100bbe93ded76.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VJJoKLVEFXdmHQwR"
Content-Disposition: inline
In-Reply-To: <e5116a2b2be975f07ba29ea438f100bbe93ded76.camel@linux.intel.com>
X-Cookie: Eschew obfuscation.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
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


--VJJoKLVEFXdmHQwR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2020 at 09:07:04AM -0700, Ranjani Sridharan wrote:
> On Tue, 2020-04-28 at 12:40 +0100, Mark Brown wrote:

> > I would not expect driver names to be unique, you can have multiple
> > instances of the same device on a board for example when two mono
> > speaker drivers are used for stereo playback.

> Maybe I misunderstood your comment in the previous thread then, Mark.

> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-April/166665.html

> Did you mean to say that the individual drivers should do this check
> before registering multiple platform components to make sure they are
> unique?

That was in the context of a single DAI link, not the system as a whole,
and only for platform drivers not DAIs.

--VJJoKLVEFXdmHQwR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6oVnoACgkQJNaLcl1U
h9DEUQf/dcSmwqs67ASJxjKqHjXzbis6y7YoRIHPI1xaZd0vJm14j+lgswXO5B6Q
TejfPUURHy7twm7YU/qDVvQ8LALmByfKETIcUS1sLzzrxuZ03t3gi5XbCIYZaoMc
np1EqB7eVzaSuyPu2+vfFXpnLrmvi52amHRG4HlelINoB9zVy+G/O+SrgvnirS4Z
+NDN+HcruGOq2wXm+uR45BFgYyHtykioJkVIH//vAr2GwwgIOTmf0nVJjCTx663k
H/OPDCWGw2+BdW+I5WN/zaeyWVvPIP+siuZDnUCK3hWrWO0Mp9gTjaLzt5mRsmXM
kZlUfoEKriX+i4PvBgmuHwT8OUsrMA==
=4Fze
-----END PGP SIGNATURE-----

--VJJoKLVEFXdmHQwR--
