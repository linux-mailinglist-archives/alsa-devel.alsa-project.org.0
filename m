Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C28A14DDAA
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 16:19:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 949C51674;
	Thu, 30 Jan 2020 16:18:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 949C51674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580397581;
	bh=0XkNnMg0qK3rfa4DcO8Arf8VSQcU05wIlqtLHnljlpY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RCJcyYDh21gutHRKKtmyUHF6zhV7OqKNAjkjuBnIuLYnUOYB8tfgGyj21PakRfbWq
	 WIQrhqmf4V7fD7Gl9m/kXMrhRfAHOovlZT27VHQg1uZm/ZxTmzuuUbpCjIzJ5pINRO
	 EgKICJc1KRx6gzZs6X3gDOY+OB+Eyo0fyA/50uOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AD6AF800F1;
	Thu, 30 Jan 2020 16:18:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CFAAF80150; Thu, 30 Jan 2020 16:17:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2AA30F800F1
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 16:17:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AA30F800F1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D53931B;
 Thu, 30 Jan 2020 07:17:54 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FF963F68E;
 Thu, 30 Jan 2020 07:17:53 -0800 (PST)
Date: Thu, 30 Jan 2020 15:17:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200130151751.GF6682@sirena.org.uk>
References: <20200129223603.2569-1-pierre-louis.bossart@linux.intel.com>
 <20200129223603.2569-2-pierre-louis.bossart@linux.intel.com>
 <20200130145548.GE6682@sirena.org.uk>
 <c6391973-fe6e-bd36-a2b5-c28cefc1ef75@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <c6391973-fe6e-bd36-a2b5-c28cefc1ef75@linux.intel.com>
X-Cookie: Positively no smoking.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: Intel: sof_pcm512x: add support
 for SOF platforms with pcm512x
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
Content-Type: multipart/mixed; boundary="===============0020679301865129043=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0020679301865129043==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="924gEkU1VlJlwnwX"
Content-Disposition: inline


--924gEkU1VlJlwnwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020 at 09:14:29AM -0600, Pierre-Louis Bossart wrote:

> > These look like they might be a DAPM widget of some kind?

> it's the LED support only, turned on when you play and off when you stop.
> At some point, I added a gpiochip support in the PCM152x codec driver to
> avoid doing this, and have a nicer way of toggling the gpios. Due to lack=
 of
> time, I didn't maintain this solution, but we could add it in a follow-up
> version if that was desired. It's really not the main functionality of th=
is
> patch.

Followup seems fine. =20

--924gEkU1VlJlwnwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4y858ACgkQJNaLcl1U
h9B22Af9Gij7sXC762l5nKLjlkig/Aq/ljBgYFWpsn4J9hNVUHy+fPaMLjHpSkaE
T47CNgcUIIm4esRVDgJ4Z98ZNa8tjF57C4LuVeIWm4zv9wDi2N6FGiSHbFCGVski
QZYD3W071XucJNV6dcp9A8/r8h9OBENavxsucD2bjXJNKanoHx6TBg584odV16EQ
cFgoTStcPD1zhhRZW4muv1Q+PgI2FVejDXcw4Zoo+x97MjBDa5l1OOMlC4uoOreN
H6MZZ5nRB59vJg2eA6dqMbKBmAewCzbqcUVYtRxhHUz2ErlhG8Qw6rL0V1BLVlZf
NR6uj3a0uHcDAlB65GJZ8uW9zqP6Cw==
=jkYr
-----END PGP SIGNATURE-----

--924gEkU1VlJlwnwX--

--===============0020679301865129043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0020679301865129043==--
