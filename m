Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F02B15832C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 20:00:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABB1E1671;
	Mon, 10 Feb 2020 20:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABB1E1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581361254;
	bh=Z8UnRcFcnXaSUOpzqaiZ45krClo+896G1C8hE1A6nfE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ni9DChRqTuumRqTLDd6UtvHpOVJKeWdVPXfUqurCeEv15LAhNuLmaCKZHLK+w8wmZ
	 jAESj5rLlM4OubCEJvSHGpoyxlYDca/RhxOdjhKE4BYN0NDkoED12FmGFXl2cqtVfK
	 svV+SJBoFPvOYMIzDaHKEmTMc8tVunwBoDa64VzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADD8DF80158;
	Mon, 10 Feb 2020 19:59:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79683F80157; Mon, 10 Feb 2020 19:59:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id DFA88F800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 19:59:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA88F800E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E06941FB;
 Mon, 10 Feb 2020 10:59:07 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64BA93F68F;
 Mon, 10 Feb 2020 10:59:07 -0800 (PST)
Date: Mon, 10 Feb 2020 18:59:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Brent Lu <brent.lu@intel.com>
Message-ID: <20200210185905.GD14166@sirena.org.uk>
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
X-Cookie: No lifeguard on duty.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, mac.chiang@intel.com, cychiang@google.com
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
	callback
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
Content-Type: multipart/mixed; boundary="===============0630168081784007376=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0630168081784007376==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline


--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 04:16:51PM +0800, Brent Lu wrote:

> Intel sst firmware turns on BCLK/WCLK in START Ioctl call which timing is
> later than the DAPM SUPPLY event handler da7219_dai_event is called (in
> PREPARED state). Therefore, the SRM lock check always fail.
>=20
> Moving the check to trigger callback could ensure the SRM is locked before
> DSP starts to process data and avoid possisble noise.

Independently of any other discussion trigger is expected to run very
fast so doesn't feel like a good place to do this - given that we're
talking about doing this to avoid noise the mute operation seems like a
more idiomatic place to do this, it exists to avoid playing back
glitches from the digitial interface during startup.

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5Bp/kACgkQJNaLcl1U
h9AW9ggAhE+Uf05vhaF0QzQQUHbDzslATig+bVtp+hnoVHtcvBpIiJfssALCeBlO
9ax23eqKKLc71AGPWz+0Q/SFXNKtQks8EcCVb3E7DtHCPuME2XweuKpUP3cChyIR
PGC0auE4jAhRQYfUCHr/0h1mllN5eVB+CPIkvdlomAXdKVIIHh+RDfcWNzchlBqu
iv7Z6JB30FDe21lVXVuVUsDCvRL/bGpq7Puo2gMlxbj/q0ZjHuUzzNxbbAb8qPQu
Ck4FI/mgE+qoxGr1LvEmRU8/X9Z0FGRoA8j99UeYftSt338wTsYrMw9Q3vrrAwOJ
vbWjkVfV4UqRZbk8c5Bm8D1weiYu/A==
=kh32
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--

--===============0630168081784007376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0630168081784007376==--
