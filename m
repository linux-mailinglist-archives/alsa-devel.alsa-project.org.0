Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD8A1793DF
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 16:46:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58906166E;
	Wed,  4 Mar 2020 16:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58906166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583336806;
	bh=dJayMZUPDxmbLeXFkZiZJw9p1oMx6yH1FzUqIj0QRhM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dW5SUt1ui5nzepafQGueUiSyvVibDg/33funqbiqiWvrt1e2JSfpxRQPeg0/0KNvQ
	 Bc4A1NYvI7zU9rjqWbDzKv/BZXR3GuH7scbbS1WrRCgBZznPGMv9tCz0ReNqs58zwq
	 4riFiYaWYYmn5ogih97TkXt16388igpBXfIvEkpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7640CF801EC;
	Wed,  4 Mar 2020 16:45:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A971F801ED; Wed,  4 Mar 2020 16:45:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 13157F8011C
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 16:44:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13157F8011C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBA0D31B;
 Wed,  4 Mar 2020 07:44:52 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CFE93F6CF;
 Wed,  4 Mar 2020 07:44:52 -0800 (PST)
Date: Wed, 4 Mar 2020 15:44:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: 5.5.y - apply "ASoC: intel/skl/hda - export number of digital
 microphones via control components"
Message-ID: <20200304154450.GB5646@sirena.org.uk>
References: <147efa37-eb57-7f17-b9eb-84a9fe5ad475@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline
In-Reply-To: <147efa37-eb57-7f17-b9eb-84a9fe5ad475@perex.cz>
X-Cookie: Tomorrow, you can be anywhere.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sasha Levin <sashal@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org
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


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2020 at 04:25:54PM +0100, Jaroslav Kysela wrote:
> Hi,
>=20
>   could we cherry-pick patch 8cd9956f61c65022209ce6d1e55ed12aea12357d to =
the
> 5.5 stable tree?
>=20
> 8cd9956f61c65022209ce6d1e55ed12aea12357d :
>  "ASoC: intel/skl/hda - export number of digital microphones via control
> components"

This looks more like a new feature than a bug fix and I've been trying
to get the stable people to calm down with the backports, there's been
*far* too many regressions introduced recently in just the x86 stuff
found after the fact.  Does this fix systems that used to work?

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5fzPIACgkQJNaLcl1U
h9Dv9gf/Zo6deZO28PePM4ljeLF17V7sBRWBsvSmjroL09kiUjDOofrckNa+ndnD
EN5nJq4x2nJn8+9cP1OJnZ8byZOj3Pz1PIGJvb1o92KoJgNCIE0vaWoRzP/5WwS6
RHBiXIA5TYfQ95VTNiCQblTS6cQ+zFh3xkTNTN1K6pRUik1UPtcXvgItXwH4TCY5
KC2xkTguF72fOodW7LYGtarqs6M2oGZMVozPgE4ePP4LOo9TuIYNKis6NcAn0nHV
Z4joo3Xz+2pr23cErldqtTKoamyHfCt5KKo3PExkxcxIp4Nf/ikau7AkfGaCLXE6
EJwvXHeIFjec4f7+dh+wlCxDLUgvGA==
=exwD
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
