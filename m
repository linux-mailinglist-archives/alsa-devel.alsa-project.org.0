Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5535A38D
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 18:40:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B85351694;
	Fri,  9 Apr 2021 18:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B85351694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617986429;
	bh=98wb7Auhqh660NsvMrfqNKBdan3nt0NLyHqCnswHoZI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C4FwBokA3BAP3b0m6IJtEfHvZ4uJvhVHzq16Uo22zu0TsRctZmCeXQqXeidNQTbBV
	 sdimVUQMchj2/B/5fupCgFOKKcWLoY62GtMHfTH8MdD25ttVspH3zhSumEmsxK4ZnT
	 xeGEMOWxGj9Oly0B5g2p+f49EeGgW6BolpLOOr+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C450F80168;
	Fri,  9 Apr 2021 18:39:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20EBCF8016D; Fri,  9 Apr 2021 18:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24D63F800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 18:39:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24D63F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="u7SA/JfF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 254D3610A7;
 Fri,  9 Apr 2021 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617986366;
 bh=98wb7Auhqh660NsvMrfqNKBdan3nt0NLyHqCnswHoZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u7SA/JfFP60vNboyZ6O+01zCiNJFUJu5M3DuhBh5v5EJXnRubVKg8BSoYbnNi4F3n
 Gs5EUlSzYC/u6A6IJ3ZZZyMkssFq2nbLxX5r/LIOwrzuGrSPQkJ3bgfRkwrtRVTdX9
 peclFdiAm8qyR/dlmgp0OYfGfmH2p+EDPjdzCtsebAlsnxd85d72Ov2IGIkDuG6ht0
 8KBR+xhB6mfph2JmJUHphJabEbtlLChqngqfJ1/VYVa/4gdCGePwpJxCfQcmusDtOQ
 HVJeDkINPTmgN0K5PnekJs7ZgGA2AWqJjmtGGJsNb8CMZmKgLLvkEPdp4U2+woBvQK
 m9+88WL5J2Tqw==
Date: Fri, 9 Apr 2021 17:39:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
Message-ID: <20210409163907.GE4436@sirena.org.uk>
References: <20210408120502.GA4516@sirena.org.uk>
 <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
 <3b33595e-777c-90b2-6d65-346c9bf6e003@perex.cz>
 <b0258a67-79ca-50cd-e6c5-74514ba8a3c5@linux.intel.com>
 <s5hv98v6h5a.wl-tiwai@suse.de>
 <9195f83a-28c4-d028-8f1e-c3beaa88d891@perex.cz>
 <05551192-57dd-2541-94a3-57d40a37e3bf@linux.intel.com>
 <8f33d7f9-50af-db15-8fb2-01d55bb0b413@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4Epv4kl9IRBfg3rk"
Content-Disposition: inline
In-Reply-To: <8f33d7f9-50af-db15-8fb2-01d55bb0b413@linux.intel.com>
X-Cookie: I'm shaving!!  I'M SHAVING!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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


--4Epv4kl9IRBfg3rk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 10:55:38AM -0500, Pierre-Louis Bossart wrote:

> > For example do something along those lines:

> > struct snd_soc_tplg_manifest {
> >  =A0=A0=A0=A0__le32 size;=A0=A0=A0=A0=A0=A0=A0 /* in bytes of this stru=
cture */
> >  =A0=A0=A0=A0__le32 control_elems;=A0=A0=A0 /* number of control elemen=
ts */

=2E..

> > struct snd_soc_tplg_ucm_files {
> >  =A0=A0=A0=A0struct snd_soc_tplg_ctl_hdr hdr;
> >  =A0=A0=A0=A0__le32 size;=A0=A0=A0 /* size of struct in bytes */
> >  =A0=A0=A0=A0__le32 count;=A0=A0=A0 /* UCM entries */
> >  =A0=A0=A0=A0char ucms[SNDRV_CTL_ELEM_ID_NAME_MAXLEN][];
> > }

> > And then expose it somewhere under sysfs after parsing topology.

> Yes I had a similar idea that we could expose in sysfs information taken
> from parsing the firmware (e.g. list of module UUIDs) and topology.

> But it's not enough. The point is that you may use the same
> topology+firmware for different platforms, only the tuning varies. I think
> that's at that level that we should allow the OEMs to set a rule defining
> what the platform is and what tuning should be applied.

So the issue there is trying to put a list of UCM files in the kernel or
topology and exposing that (which I agree doesn't seem like something
that should come from the kernel), but exposing the information about
what's in the loaded topology file seems reasonable.  It's just more
information that userspace has available to key off when deciding what
it wants to do isn't it?

--4Epv4kl9IRBfg3rk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBwgyoACgkQJNaLcl1U
h9BUtgf+PFhXkKdu7GTbGuaBvXC+DAY8nAnYvDOfnlQKub+Sr0q+HDobWJ47wfIY
QGn8MSy0nndt46FzH+wKAEJ819tDJECwM2oVWWzp32we/cY9G3MPpZYqUSAPGPK8
doj6N9rx7ZJ7GRshKp14c76jHVBk6trBqgzXyQbVoYjJJNvzqyp176nQoClDOf+j
UmZzV2/XixYjrNWyHqw+r+sDGsqJxSQUPPP4/f8/Tv4C8wAZaYZRq6MYJteDGanD
8rmGvVtntPhx/G8eRkW37h9pE+CZcmJEDUqDRIuraYWxI7q2rOzuMU+sBL5+8Ja1
8Yws1g0+CaSq6u1hB7g3dA2FhM9Fuw==
=t3hW
-----END PGP SIGNATURE-----

--4Epv4kl9IRBfg3rk--
