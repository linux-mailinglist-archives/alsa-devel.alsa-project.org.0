Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D98A7157D85
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 15:39:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CC9B1670;
	Mon, 10 Feb 2020 15:38:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CC9B1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581345546;
	bh=n/C2cQoblFvnsb9B5AsKdDssf3/X5RZROeVsbUopM90=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KYEABwtlHf3oyrveWS7htVGp2OPI7yFbwijGIaxXONIoxlx7HSoJiL6RMsUX/Bwyf
	 G16+7k2b0/MXCOQmgABP7Fe0Ejl8YvysMdNUmhYXgs22MriRLZsMD9MP0OeRqiNneH
	 dvE/v3zwcf8GnN+r8qTCZ8LzhWaPPl/qVxUD6Tso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C9C4F80158;
	Mon, 10 Feb 2020 15:37:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8BDCF80157; Mon, 10 Feb 2020 15:37:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5B9DFF800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:37:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B9DFF800E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DE5B1FB;
 Mon, 10 Feb 2020 06:37:19 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D626E3F68E;
 Mon, 10 Feb 2020 06:37:18 -0800 (PST)
Date: Mon, 10 Feb 2020 14:37:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20200210143717.GO7685@sirena.org.uk>
References: <20200210140423.10232-1-peter.ujfalusi@ti.com>
 <s5hmu9qfrq7.wl-tiwai@suse.de>
 <15c7df10-cf9f-109c-3cbf-e73af7f4f66a@ti.com>
MIME-Version: 1.0
In-Reply-To: <15c7df10-cf9f-109c-3cbf-e73af7f4f66a@ti.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 vkoul@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: dmaengine_pcm: Consider DMA cache
 caused delay in pointer callback
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
Content-Type: multipart/mixed; boundary="===============7256031207074003647=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7256031207074003647==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7pXD3OQNRL3RjWCz"
Content-Disposition: inline


--7pXD3OQNRL3RjWCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 04:28:44PM +0200, Peter Ujfalusi wrote:
> On 10/02/2020 16.21, Takashi Iwai wrote:

> >>  	delay +=3D codec_delay;
> >> =20
> >> -	runtime->delay =3D delay;
> >> +	runtime->delay +=3D delay;

> > Is it correct?
> > delay already takes runtime->delay as its basis, so it'll result in a
> > double.

> The delay here is coming from the DAI and the codec.
> The runtime->delay hold the PCM (DMA) caused delay.

I think Takashi's point here (and a query I have) is that we end up with

	delay =3D runtime->delay;
	delay +=3D stuff;
	runtime->delay +=3D delay;

which is equivalent to

	runtime->delay =3D (runtime->delay * 2) + stuff;

and that's a bit surprising.

--7pXD3OQNRL3RjWCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BapwACgkQJNaLcl1U
h9DBhQf/Tk/iC/yKWJP7T7Lj64Ke/xkylo2HhoZpN9ztDp+jgiRLcSddDcUu60nF
EU51o1aMPIxaxLpO+nyhm35DDgSBLoe1GxQ9zGF/gBoy/GD3pVsdYuNS6a1yK5nY
y1XkpONUhfp28jG1QI6uFTKa6lQuy0zOsBBS9Bm7hnLTOgWZLj+O7GcmqEuc5ZSH
FQ5jm9M7ur2web3e9M+AZ8Xh+6+4Wz5ZheFpN8nuGbCaqkcCtSm2/N+LEc1/u9w7
vCQ6Cwl0/y+7ApwMdQHOEvr/1sOug+LZssOvYVR1XBAsxP7zeLMdw64KRP093ePk
bj5e/vWn+pqcRn1OI04cY6IeAo+qtQ==
=Kcuw
-----END PGP SIGNATURE-----

--7pXD3OQNRL3RjWCz--

--===============7256031207074003647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7256031207074003647==--
