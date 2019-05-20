Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 810172368B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2019 14:49:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB345165D;
	Mon, 20 May 2019 14:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB345165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558356546;
	bh=+uRxti7+D1Le0d8Ue4Y8ZzYqrIkt29+elcQx+jipuEI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FXSq3aqtAbVvT54iW4g15UjAJlbbwKtiCaaP9Q8eZ/5kIu2jV+1aE/qxFn9wJmX2M
	 c4eG8YFrZmbYczX5/Bk/JtuoFExfsmi7KcdTlSE2deirQYlZm5oW0QWZeyUSmnxSP8
	 +DjiZVXYnprORbvc/pE+uqa2NUwU9RUdJkdAu6vA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 052EBF89636;
	Mon, 20 May 2019 14:47:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78035F896F2; Mon, 20 May 2019 14:41:36 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48881F89618
 for <alsa-devel@alsa-project.org>; Mon, 20 May 2019 14:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48881F89618
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RJItVDYM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W7xV+6O5r7E4Qox2wWRuN3gyY0BkttXsQbly2NMDFkY=; b=RJItVDYMOlzFXr6hIsLlnQZO+
 4RUd3erw9h9qwqMVKqv7wrH+E4es++C7vxmnwYQd5Mj9bdXtKBoGzeL5Or3kPfbYfoXejf3cDcVL6
 PJnoriLZ3uznznnDAX+d9f1yT0WT5oNGDY5HjyX7lmX+6BMqZXwb+fWBslRXQU5lshiH4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hShRj-0003Xk-7N; Mon, 20 May 2019 12:31:15 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 6C5021121E55; Mon, 20 May 2019 13:31:14 +0100 (BST)
Date: Mon, 20 May 2019 13:31:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190520123114.GA10827@sirena.org.uk>
References: <20190518183009.13359-1-pierre-louis.bossart@linux.intel.com>
 <20190518183009.13359-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190518183009.13359-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: Dead?	No excuse for laying off work.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: Intel: sof-rt5682: Few minor
 fixes for AMP SSP and codec button
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
Content-Type: multipart/mixed; boundary="===============1520501915821710657=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1520501915821710657==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2019 at 01:30:07PM -0500, Pierre-Louis Bossart wrote:
> From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
>=20
>     This fixes:
>     1. BIT mask for AMP SSP was incorrect.
>     2. The RT5682 codec button mapping is corrected.

Indentation is a bit weird here, and these are really two changes that
should be split.

> @@ -519,6 +520,7 @@ static int sof_audio_probe(struct platform_device *pd=
ev)
> =20
>  	/* compute number of dai links */
>  	sof_audio_card_rt5682.num_links =3D 1 + dmic_num + hdmi_num;
> +
>  	if (sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT)
>  		sof_audio_card_rt5682.num_links++;
> =20

and this is an unrelated indentation change.

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzinhEACgkQJNaLcl1U
h9BnYgf/bGq8I2zFlJlvsMY65l3WK4CtzIZPewElK8MjJyt6vFJdWUXozUsOuACJ
irLFbnpDssRTTUBL1mTQlWjPrRZLvbEtNukQBNBLTXUKItwZ1CVv9kuj4Lzxkir/
rjO4nBLTb2DYb6VgwvSyAkBiM/lzv9s9OEkdCPwETTU+xcrGAmkOiox+hb7P+obW
zVASvuKqha5Rr5Y/spjxUphgdtaw5TXJtPLLsgTrBE4OQUo+pohfN/vOvduYHp6e
6PWuNNJW1uu6AnUJC19NfLCpy5IodOSInzYw7BfK7kyZjgUmS2B931ZcuvCQnV4O
kjaREIylE53thMsI17oW6TEP24A1NQ==
=PBzd
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--

--===============1520501915821710657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1520501915821710657==--
