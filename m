Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7677E2F4B1B
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 13:19:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB06B16CE;
	Wed, 13 Jan 2021 13:18:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB06B16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610540344;
	bh=wX9BlQ49mVV5wxe3RXJuQZccCnLVIg1KmRvyFiW4pX8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VVC8PcLYmQPKoBMwBNCYnGpRNhWvxHHxC/QRdANfB/2zRTb4o/bcoVdQ1LjleN6X8
	 3SdTpIQoPiq5NefpFHi0Qys78wcZc4StZKAedjF3haOxYsmaKixOuBBgMBc+iEg1k2
	 E/al5tlFtMCShjKgHwcYWSMEoCXeFKEFDw9QpQ9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4ACFF8016D;
	Wed, 13 Jan 2021 13:17:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDE88F801ED; Wed, 13 Jan 2021 13:17:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEE3AF80113
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 13:17:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEE3AF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Yt0GBfpZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40841233FD;
 Wed, 13 Jan 2021 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610540243;
 bh=wX9BlQ49mVV5wxe3RXJuQZccCnLVIg1KmRvyFiW4pX8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yt0GBfpZ1Szbi1WZDTGtdlW7ElX3q2MrgIJSoV763Ry/eJ7FvKhkaDUqIm8nEbrm6
 CxI2VdLpH419MEQOz+Y4fQvbPBNlfMxp4w6+mb+8UgXTONinDVG/WCd6KsvzbHVpmr
 MpqwjfSMwI0DAUZWdK9K6otokVY5EkXmKMOHOEjg9Pmwoq/awhmkYeZhnO3tSIuIKi
 73FHAFEf73qYFnv4DlpSeiWvhbSDseMzEsakFlMdA/0pjJ2vTx8/2wibt6zwi58OWM
 W+7M46P8HCnciwe5UWdi55q7FKvJQ89O3baP/Ou5ZI31XkszuAyPnoaNBVU4EPRJ4X
 IC4Y7SajrJUwg==
Date: Wed, 13 Jan 2021 12:16:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/3] ASoC: soc-pcm: cleanup code
Message-ID: <20210113121649.GC4641@sirena.org.uk>
References: <87a6tdr5gw.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline
In-Reply-To: <87a6tdr5gw.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 13, 2021 at 10:34:49AM +0900, Kuninori Morimoto wrote:

> These are v2 of soc-pcm cleanup code.
> v1 had 6 patches, but I separated into 2 parts.
> This is 1st part of it.

I actually already queued patches 1-4 of v1 - it's testing ATM.  Are
there any changes here or is it just splitting things up?

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/+5LAACgkQJNaLcl1U
h9B6Cwf/ULuOqnPkY66+j/AJXHswe0FDLEyy5QgrsjjUo4OnqF1KOvS/lMKQUXqR
rZQZUvG0FM97FLcCofr7I6WRqxqxfDV0ETwTLcVEoXEb/yX9rFRWCgGah3ryqgiU
3yPY+8oK2M2AWoGmcJCJPYjoZgke0c6ohT5JvHveMCAJ2fslkJLbe6a4/rHqiMb8
2iGGFBEs9pR4TX9EbmI/8nRDjmLvsulfSAaD2r1R/JJ/S8AhY/8DcRYkIQTMRMvs
ImTdGbbXfsUz8Boymn4bmTiUcqRhqxs9LUbyJch7NX+s9cc4pxeEpvPZ5sFUCAJr
LO8ELbF4gFs5MZUyOM+0Z2/FdXprpg==
=GVpu
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
