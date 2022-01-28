Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9817949FB0E
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 14:50:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27C441786;
	Fri, 28 Jan 2022 14:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27C441786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643377806;
	bh=9sYtw3ou3lxpIW87228egdqTk/22E+Frt1X3mgjYsKM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DTO3et5JuS7alskp4Vx8vYGJ3eR1Gb6YMSdDRNE3bR22BG7G3gqOrMF1tyLkZlY2z
	 jf4PvezJrzoAgyyv9Jpgf3gyaaMfaKzseFTkolEvkpiLf4QP8Q4DWUlXBomS/HrEBL
	 XNMbbH04m7ZX/M84Jx8KUUQhZsRhGLiWojhjJmVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F88F80246;
	Fri, 28 Jan 2022 14:49:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68201F80240; Fri, 28 Jan 2022 14:48:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BAF2F800C0
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 14:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BAF2F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nvvTuGOK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B94B061D60;
 Fri, 28 Jan 2022 13:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FB9C340E0;
 Fri, 28 Jan 2022 13:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643377729;
 bh=9sYtw3ou3lxpIW87228egdqTk/22E+Frt1X3mgjYsKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nvvTuGOKNZD1wmNC3hWhWYNLQgllvxLkQQeomJ0AtiVzEf9hZrd+gtSiPl16EcNQI
 6lcyz7VDpfXU9o47agF2TTBPeCZHR7DKsW2qMOZHZER7v/X4lY0OdHyQ1pV8NOjB64
 wAMtg1Ivw5Nl86cFY9NhUckO05ARwD5muNA3ylrxCoRt4fBeiajN95Q9YsbuN0VX9V
 HIOGLSEAgiNmdZJe8uw5iFlvHs8MzgG6GaxmmJXPQhSdx4CLCqEmrCy9EGzyqYzlzL
 5LWw9wvlxzlGbqM352nm5yeOacH14MBs6ORpaX8bOejAMX0xhlCBusTYLbrBHw+Ryo
 PI/T0JnHOAofA==
Date: Fri, 28 Jan 2022 13:48:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/2] ASoC: ops: fix signedness bug in snd_soc_put_volsw()
Message-ID: <YfP0PGbyFVDOevIH@sirena.org.uk>
References: <20220128112007.GA24806@kili> <YfPknO6si9CpotgS@sirena.org.uk>
 <20220128133147.GL1978@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8ra+G6TvYIugz+90"
Content-Disposition: inline
In-Reply-To: <20220128133147.GL1978@kadam>
X-Cookie: Torque is cheap.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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


--8ra+G6TvYIugz+90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 04:31:47PM +0300, Dan Carpenter wrote:
> On Fri, Jan 28, 2022 at 12:42:04PM +0000, Mark Brown wrote:

> > This means that the helpers won't support controls that use the top bit
> > of a 32 bit register.

> Fine, I can delete the checks for negative instead (I'm surprised you
> haven't already received a dozen bot emails about this).

No, we need the checks for negatives since userspace supplies a signed
value.  The check needs to be done on the value in the input structure
before we pull it out for mangling.  I probably got bot emails but
frankly these days almost all of them are some combination of barely
legible and misdirected and there's plenty of people who like to fix
these things if they're real.

> I haven't been able to figure out where mc->min/max are set.  In

They're the big tables of static assignments via macros in the drivers.=20

> snd_soc_get_xr_sx() it checks whether "mc->min" is negative.

> 	if (min < 0 && val > max)
> 		val |=3D ~mask;

> Is that a bug?  If mc->min is negative the math gets tricky.

No, it *is* valid if weird to have negative values for some controls.

--8ra+G6TvYIugz+90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHz9DsACgkQJNaLcl1U
h9AWswf/Uivc5XoK7qn+bLn7KmCk9wj+9FesEqzeNZefSTZKf0+7q789y4ZJNr0M
T4pWgRgBuKoOtQsDSl5z00yLDloQ7SZ2fVptrLMSEjLds6fy6x6euDhmCt7Va2GY
jlIQp0ZOipUAFUfmH8i53eqd9J40mELJ1E0Iy8ZnC4MSuClouzPNSgk+BqIU4DzV
haVR2JnDiYTKKeOcNrsEGOGTuVkm68JANwjsrsx2ZhgdrBhURwB2CMDWb9RhNLXD
m3zs76Rw62peY/wsVr/6PiPqxbDB2D99yleLU2KR4hoHQGk4dCJOBTf/IQT4Zd6l
majtHP4B8506iCwaMqZ7BHJ4A2CR6Q==
=qRg9
-----END PGP SIGNATURE-----

--8ra+G6TvYIugz+90--
