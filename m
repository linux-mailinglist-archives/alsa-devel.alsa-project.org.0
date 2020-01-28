Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A45714B40D
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 13:15:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6D741671;
	Tue, 28 Jan 2020 13:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6D741671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580213705;
	bh=EP/Aa1FIkoKzRd4AZmFlovfyBcnhPSqHrB3hxyGKDmE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jaiVaPtzMqIOBuJ/wBiPevHw9x6XpafXZ1aMaMW2sH4ppeNA2iSpLptNwgYhjQAAm
	 8P+5tCm7/uk6HxPUiug0mB/Q9dGHDmFjHEmteHgLh3DMCFgfGlkHNGpngzeGasw2dm
	 U2he7ZJdznD1h7cjOHNT6yGxxIYhS8q6IzuIidmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CECF7F80150;
	Tue, 28 Jan 2020 13:13:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C4F3F80150; Tue, 28 Jan 2020 13:13:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CA633F800FF
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 13:13:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA633F800FF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FE191045;
 Tue, 28 Jan 2020 04:13:17 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E6EB3F52E;
 Tue, 28 Jan 2020 04:13:16 -0800 (PST)
Date: Tue, 28 Jan 2020 12:13:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20200128121315.GD4689@sirena.org.uk>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
X-Cookie: Doing gets it done.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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
Content-Type: multipart/mixed; boundary="===============8493561911761055211=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8493561911761055211==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GpGaEY17fSl8rd50"
Content-Disposition: inline


--GpGaEY17fSl8rd50
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 10:20:25PM +0300, Dmitry Osipenko wrote:
> 24.01.2020 19:50, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> >                 .rates =3D SNDRV_PCM_RATE_8000_96000,
> >                 .formats =3D SNDRV_PCM_FMTBIT_S32_LE |
> > -                          SNDRV_PCM_FMTBIT_S24_LE |
> > +                          SNDRV_PCM_FMTBIT_S24_3LE |

> It should solve the problem in my particular case, but I'm not sure that
> the solution is correct.

If the format implemented by the driver is S24_3LE the driver should
advertise S24_3LE.

> The v5.5 kernel is released now with the broken audio and apparently
> getting 24bit to work won't be trivial (if possible at all). Ben, could
> you please send a patch to fix v5.5 by removing the S24 support
> advertisement from the driver?

Why is that the best fix rather than just advertising the format
implemented by the driver?

I really don't understand why this is all taking so long, this thread
just seems to be going round in interminable circles long after it
looked like the issue was understood.  I have to admit I've not read
every single message in the thread but it's difficult to see why it
doesn't seem to be making any progress.

--GpGaEY17fSl8rd50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4wJVoACgkQJNaLcl1U
h9DMkAf/bHJV00niDhM1x/+jpTGcn0N2F9TKUa1eQk5NFuzmH+wPdJN/fVIXQ9/H
9svsreaVKTU1il6uhl3HOUB2Prenx04OggzHfRaMQ4zbB1yCd67uL83R5jlj3yao
bdFTP/7O7ngzG9P7foNPQtJrWR72KEr7e6Ay4ekDrHJLiI9p0TBnwrLcA5Wop35m
C/k5YwvlJ8SzZgADBN74cxrzx/E59pw9w0M31RGRhAtXTWVu7GfjiitfvKLhcJWz
JfzVil637Tm3taQ4hiyqYvTGeQlUOS86ix1AcDBGQigMC0tCZtCnblr8pOhW09nv
i/k+B9psW4N99h6sq5+2z85Qk/svwQ==
=dv7A
-----END PGP SIGNATURE-----

--GpGaEY17fSl8rd50--

--===============8493561911761055211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8493561911761055211==--
