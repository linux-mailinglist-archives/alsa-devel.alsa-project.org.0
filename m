Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AC04546BB
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 13:56:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2161E185A;
	Wed, 17 Nov 2021 13:55:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2161E185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637153774;
	bh=kQ8uxVqWoFQZGJ3p3iS1P3afS0kPQJHO9kTLbEaj9IQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i/Kf52AV6S2RMdWnCAyEPaNSkL/gvC4XVnv21KqSOUij5b1VBzhWz5mstEpLvEiEH
	 MI8qnbH6HC3Hnb1tAV+Oq7sAtEkH5/jVTVPt2KALdIINbGDt5wDkL4BU0LJIzgnzsV
	 LD8SEBf48d74Uemae/8sAJnHME6v5ki4hEWzqqPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77173F8016C;
	Wed, 17 Nov 2021 13:54:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F332F8027D; Wed, 17 Nov 2021 13:54:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92583F8016C
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 13:54:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92583F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IlXZKLrP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4DC06322C;
 Wed, 17 Nov 2021 12:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637153681;
 bh=kQ8uxVqWoFQZGJ3p3iS1P3afS0kPQJHO9kTLbEaj9IQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IlXZKLrPssnTkrNK4i7GrXET6xC+qAy+7y3pK2MfqT4iceGsimw9/RNo2w5oPGkpi
 lOXDzBfeZxaJ+jnuw04uTqVO8mU9gnVUtFurWqjjSFI4EJ7KaiKittYplS9MT/WBQr
 pVJWi7CMJ6wxS7q8mfUSPzxwBnDZfh9TCUGHWlb2BSWPSQF2oJoeoxJNJ+NiaelsnC
 sECu1HLLKoNdiHjrvVGQsSYhprKW3IYOZsqhXuvI60abPNrntQTsdi3oBwwAHQI1O+
 Np2RhXUbczASrYDxT5lNTX9gpcUrlePzWrEBhrH94YpxqoVlpD/mM6i+x4EjRR1cQe
 2LuLJBsVJje1g==
Date: Wed, 17 Nov 2021 12:54:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 03/10] firmware: cs_dsp: Add version checks on
 coefficient loading
Message-ID: <YZT7jO9yAGLJtBF4@sirena.org.uk>
References: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
 <20211116161609.12223-3-ckeepax@opensource.cirrus.com>
 <YZPzgvB2+oXaCupw@sirena.org.uk>
 <001901d7db19$efbc2830$cf347890$@opensource.cirrus.com>
 <20211117110046.GE18506@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v18yzB+28HgLpvdn"
Content-Disposition: inline
In-Reply-To: <20211117110046.GE18506@ediswmail.ad.cirrus.com>
X-Cookie: One Bell System - it sometimes works.
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, lgirdwood@gmail.com
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


--v18yzB+28HgLpvdn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 17, 2021 at 11:00:46AM +0000, Charles Keepax wrote:
> On Tue, Nov 16, 2021 at 06:44:06PM -0000, Simon Trimmer wrote:

> > I have been working with Charles on most of these patches over the last few
> > months and I'd fixed some internal review comments on this one before we
> > shared it. If it helps I can certainly ack the chain?

> Yeah apologies I am never quite sure what to do in this
> situation. We internally have someone add their sign-off when
> they make a change to a patch. I could change this to a
> Co-authored-by: if that is the preferred upstream approach?

Yes, and if nothing else the signoff of the person sending the mail
should be the last one in the chain in the email.

--v18yzB+28HgLpvdn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGU+4sACgkQJNaLcl1U
h9CpSAf9GnfJ5jqm5NlBIIGr0+DnK3G+B4UgKrLd5lxoG2m61pcZSuk4NHxRFfsh
LvMOZJqAKm55wLcYiCHjxx4Jq5P+KoEbHvWVvHmuKMudjTFZV0kjt6oV2T/3g7D4
5NFMHyFXQqTLwHTDVcbBDkpPsf7IPnDhwuA2mNyVBy1RzJG1+yv+TsMVu2gZ6qhx
VX6hBbcwrGN3nULkDdYt0BWqFgFvQdHNftTail4JuK5ymw8H04aDmHNhLlcMftoA
/uY8nNXyZmIAtdohZjSLLOjrbw0yTcLRXdXitrAw7NIqAONxuDqT1r64e7lQKlCr
hkxId00/rWsutu+Dh79PJoi81/VU6Q==
=a/eW
-----END PGP SIGNATURE-----

--v18yzB+28HgLpvdn--
